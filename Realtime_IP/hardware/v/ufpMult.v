// for 1.8 unsigned fixed pt

module ufpMult (
	iA,
	iB,
	oC );
	
	input unsigned	  [8:0] iA, iB;
	output unsigned [8:0] oC;
	wire unsigned [17:0] temp;
	assign temp = iA * iB;
	
	//result = 2.16; so drop top, take next 9
	assign oC = temp[16:8];
	
endmodule
	
