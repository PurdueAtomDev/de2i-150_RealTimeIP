// Conversion from HSL[10,10,10] to RGB[10,10,10]

module HSLtoRGB (
	clock,
	iHue,
	iSaturation,
	iLightness,
	oRed,
	oGreen,
	oBlue
	);
	
	input	wire			clock;
	input	wire unsigned	[9:0]	iHue, iSaturation, iLightness;
	
	output wire unsigned [9:0] oRed, oGreen, oBlue;
	
	reg unsigned [8:0] oR, oG, oB;
	
	assign oRed = {oR[7:0],2'b00};
	assign oGreen = {oG[7:0],2'b00};
	assign oBlue = {oB[7:0],2'b00};
	
	//0-255 is lower 8 bits, extra bit for overflow
	wire unsigned [8:0] iH, iS, iL;
	assign iH = {1'b0, iHue[9:2]};
	assign iS = {1'b0, iSaturation[9:2]};
	assign iL = {1'b0, iLightness[9:2]};

	wire unsigned [8:0] temp3r, temp3g, temp3b; //192 is max here
	
	wire unsigned [8:0] ls;
	
	ufpMult mls2(iL, iS, ls);
	
	wire unsigned [8:0] temp1, temp2;
	
	
	// Otherwise, test L.
	// If L < 0.5, temp2=L*(1.0+S) = L*1 + L*S
	// If L >= 0.5, temp2=L+S - L*S
	// result will be < 1
	assign temp2 = (iL < 9'd128) ? (iL + ls) : (iL + iS) - ls; 
	
	//temp1 = 2.0*L - temp2
	assign temp1 = (iL << 1) - temp2;
	
	// Convert H to the range 0-1 //done already, 0-192 here
	// For each of R, G, B, compute another temporary value, temp3, as follows:
	// for R, temp3=H+1.0/3.0
	// for G, temp3=H
	// for B, temp3=H-1.0/3.0
	// for each color
			// if temp3 < 0, temp3 = temp3 + 1.0
			// if temp3 > 1, temp3 = temp3 - 1.0
	assign temp3r = ((iH > 9'd128) ? iH - 9'd128 : iH + 9'd64) ; //sub 2/3 or add 1/3
	assign temp3g = (iH) ; //already centered
	assign temp3b = ((iH < 9'd64) ? iH + 9'd128 : iH - 9'd64) ; //add 2/3 or sub 1/3
	
	wire unsigned [8:0] ttr6, ttr6x, ttg6, ttg6x, ttb6, ttb6x;
	
	wire unsigned [8:0] temp3r6, temp3rn6, temp3g6, temp3gn6, temp3b6, temp3bn6;
	
	// mult by 6
	assign temp3r6 = (temp3r << 2) + (temp3r << 1);
	assign temp3rn6 = ((9'd128 - temp3r) << 2) + ((9'd128 - temp3r) << 1);
	assign temp3g6 = (temp3g << 2) + (temp3g << 1);
	assign temp3gn6 = ((9'd128 - temp3g) << 2) + ((9'd128 - temp3g) << 1);
	assign temp3b6 =  (temp3b << 2) + (temp3b << 1);
	assign temp3bn6 = ((9'd128 - temp3b) << 2) + ((9'd128 - temp3b) << 1);
	
	//(temp2-temp1)*6.0*temp3
	//(temp2-temp1)*((2.0/3.0)-temp3)*6.0
	ufpMult mlscr(temp2-temp1,  temp3r6, ttr6);
	ufpMult mlscrx(temp2-temp1,  temp3rn6, ttr6x);
	ufpMult mlscg(temp2-temp1,  temp3g6, ttg6);
	ufpMult mlscgx(temp2-temp1,  temp3gn6 , ttg6x);
	ufpMult mlscb(temp2-temp1,  temp3b6, ttb6);
	ufpMult mlscbx(temp2-temp1,  temp3bn6 , ttb6x);
	
	always @ (posedge clock) begin
	
		// If S=0, define R, G, and B all to L
		if(iS < 9'd16) begin
			oR <= iL;
			oG <= iL;
			oB <= iL;
		end
		else begin
			// For each of R, G, B, do the following test:
			// If 6.0*temp3 < 1, color=temp1+(temp2-temp1)*6.0*temp3
			// Else if 2.0*temp3 < 1, color=temp2
			// Else if 3.0*temp3 < 2, color=temp1+(temp2-temp1)*((2.0/3.0)-temp3)*6.0
			// Else color=temp1
			
			if( temp3r < 9'd32) begin // 1/6th
				oR <= temp1 + ttr6;
			end
			else if ( temp3r < 9'd96) begin // 1/2th
				oR <= temp2;
			end if (temp3r < 9'd128) begin // 2/3rds
				oR <= temp1 + ttr6x;
			end else begin
				oR <= temp1;
			end
			
			if( temp3g < 9'd32) begin // 1/6th
				oG <= temp1 + ttg6;
			end
			else if ( temp3g < 9'd96) begin // 1/2th
				oG <= temp2;
			end if (temp3g < 9'd128) begin // 2/3rds
				oG <= temp1 + ttg6x;
			end else begin
				oG <= temp1;
			end
			
			if( temp3b < 9'd32) begin // 1/6th
				oB <= temp1 + ttb6;
			end
			else if ( temp3b < 9'd96) begin // 1/2th
				oB <= temp2;
			end if (temp3b < 9'd128) begin // 2/3rds
				oB <= temp1 + ttb6x;
			end else begin
				oB <= temp1;
			end
			
		end
		
	end
	
endmodule 
