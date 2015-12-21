// Conversion from RGB[10,10,10] to HSL[10,10,10]

module RGBtoHSL (
	clock,
	iRed,
	iGreen,
	iBlue,
	oHue,
	oSaturation,
	oLightness
	);
	
	input	wire			clock;
	input	wire	 unsigned [9:0]	iRed, iGreen, iBlue;
	
	output reg  unsigned [9:0] oHue, oSaturation, oLightness;
	
	wire unsigned [8:0] iR, iG, iB;
	
	//use 9 bit math, input goes into lower 8 bits, top bit for overflows
	assign iR = {1'b0, iRed[9:2]};
	assign iG = {1'b0, iGreen[9:2]};
	assign iB = {1'b0, iBlue[9:2]};
	
	
	wire unsigned	[8:0] tempR,tempG,tempB;

	wire			negR,negG,negB;
	
	wire unsigned	[8:0]	max, min;
	
	wire unsigned 	[8:0] 	maxMmin, twoMmaxMmin, maxPmin;
	
	
	assign max = 	(iR>=iG && iR>=iB)		?	(iR)	:	(
						(iG>=iR && iG>=iB)	?	(iG)	:	(
						(iB>=iR  && iB>=iG)	?	(iB)	:	(9'd0)));
						
	assign min = 	(iR<=iG && iR<=iB)		?	(iR)	:	(
						(iG<=iR && iG<=iB)	?	(iG)	:	(
						(iB<=iR  && iB<=iG)	?	(iB)	:	(9'd0)));
	
	
	
	assign maxMmin = max-min;
	assign twoMmaxMmin = 9'd511 -max -min;
	assign maxPmin = max+min;
	
	
	assign tempR = ((iG>=iB) ? (iG-iB) : (iB-iG));
	assign negR  = (iG>=iB) ? (1'b0) : (1'b1);
	assign tempG = ((iB>=iR) ? (iB-iR) : (iR-iB));
	assign negG  = (iB>=iR) ? (1'b0) : (1'b1);
	assign tempB = ((iR>=iG) ? (iR-iG) : (iG-iR));
	assign negB  = (iR>=iG) ? (1'b0) : (1'b1);
	
	wire unsigned [8:0] s1,s2, r1, g1, b1;
	
	//top bit is 2 and 1 is max
	ufpDiv d1(maxMmin,maxPmin, s1);
	ufpDiv d2(maxMmin,twoMmaxMmin, s2);
	
	// subtract 8 to ensure that these aren't = 1.0 in 1.8fp after the divide
	// tempC is at most max-min
	ufpDiv rd1(tempR-9'd8 ,maxMmin, r1);
	ufpDiv gd1(tempG-9'd8 ,maxMmin, g1);
	ufpDiv bd1(tempB-9'd8 ,maxMmin, b1);
	
	
	always @ (posedge clock) begin
		// L = (maxcolor + mincolor)/2 ;
		oLightness <= {(max[7:0] >>1) + (min[7:0] >>1),2'b00};
		
		// If L < 0.5, S=(maxcolor-mincolor)/(maxcolor+mincolor)
		// If L >=0.5, S=(maxcolor-mincolor)/(2.0-maxcolor-mincolor)
		
		if({(max[7:0] >>1) + (min[7:0] >>1),2'b00} < 10'd512) begin
			oSaturation <= {s1[7:0],2'b0};
		end
		else begin
			oSaturation <= {s2[7:0],2'b0};
		end
		
		// map colors to 0-767 (so use 3/4 of 10bit space)
		// If R=maxcolor, H = (G-B)/(maxcolor-mincolor)
		// If G=maxcolor, H = 256 + (B-R)/(maxcolor-mincolor)
		// If B=maxcolor, H = 512 + (R-G)/(maxcolor-mincolor)

		// note negative handling and centering of G at 256, B at 512, R at 0/768
		if(max==iR) begin
			oHue <= (negR) ? (10'd768-{2'b0,r1[7:0]}) : ({2'b0,r1[7:0]}+10'd0);
		end
		else if(max==iG) begin
			oHue <= (negG) ? (10'd256-{2'b0,g1[7:0]}) : ({2'b0,g1[7:0]}+10'd256);
		end
		else begin	//max==iB
			oHue <= (negB) ? (10'd512-{2'b0,b1[7:0]}) : ({2'b0,b1[7:0]}+10'd512);
		end
	end
	
endmodule
