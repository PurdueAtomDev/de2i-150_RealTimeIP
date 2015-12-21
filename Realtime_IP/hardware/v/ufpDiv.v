// for 1.8 unsigned fixed pt

module ufpDiv (
	iQ,
	iD,
	oR );
	
	input unsigned	  [8:0] iQ, iD;
	output reg unsigned [8:0] oR;
	wire unsigned [16:0] temp;
	assign temp = {iQ, 8'b0} / iD;
	
	//divide by 1.0 => shift right 8
	// approx the division for 1.8
	always @(iD) begin
		oR <= temp[8:0]; //temp is 9.8, grab 1.8 from it
	end
	
endmodule
	
