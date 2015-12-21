//Intensity Calculator Module

module intensityCalc (
	iCLK,
	iR,iG,iB,
	oIntensity
);

	input			iCLK;
	input [9:0]	iR,iG,iB;	
	
	output reg [9:0] oIntensity;	
	
	always @(posedge iCLK) begin
		//    I     =  .25R  +  .5G  + .25B
		oIntensity <= (iR>>2)+(iG>>1)+(iB>>2);
	end
	
endmodule
