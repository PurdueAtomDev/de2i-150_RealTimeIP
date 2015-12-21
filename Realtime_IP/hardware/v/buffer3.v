// 3 Line Buffer with taps for use in edge detection //

module buffer3 (
	clock,
	clken,
	shiftin,
	shiftout,
	oGrid);
	
	input		wire			clock,clken;
	input		wire	[29:0]	shiftin;
	
	integer i;
	
	output	wire	[269:0]	oGrid;
	output	reg	[29:0]	shiftout;
	
	reg	[29:0]	line1 	[639:0];
	reg	[29:0]	line2		[639:0];
	reg	[29:0]	line3		[639:0];
	
	assign oGrid = {line1[639],line1[638],line1[637],		// grid[8] grid[7] grid[6]
						 line2[639],line2[638],line2[637],		// grid[5] grid[4] grid[3]
						 line3[639],line3[638],line3[637]};		// grid[2] grid[1] grid[0]

	
	always @ (posedge clock) begin
		if(clken) begin
			line1[0] <= shiftin;
			line2[0] <= line1[639];
			line3[0] <= line2[639];
			for(i=1;i<640;i=i+1)begin
				line1[i] <= line1[i-1];
				line2[i] <= line2[i-1];
				line3[i] <= line3[i-1];
			end
			shiftout <= line2[638];
		end
		else begin
			for(i=0;i<640;i=i+1)begin
				line1[i] <= line1[i];
				line2[i] <= line2[i];
				line3[i] <= line3[i];
			end
			shiftout <= shiftout;
		end
	end


endmodule
