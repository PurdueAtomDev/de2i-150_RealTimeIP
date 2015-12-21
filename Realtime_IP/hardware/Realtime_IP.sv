//*****  TOP-LEVEL MODULE  *****//
//*****  Swetha  Kadiyala, Fall 2015,   Purdue University   *****//

module Realtime_IP ( 
	//////////// CLOCK //////////
	CLOCK_50,
	CLOCK2_50,
	CLOCK3_50,

	//////////// Sma //////////
	SMA_CLKIN,
	SMA_CLKOUT,

	//////////// LED //////////
	LEDG,
	LEDR,

	//////////// KEY //////////
	KEY,

	//////////// EJTAG //////////
	EX_IO,

	//////////// SW //////////
	SW,

	//////////// SEG7 //////////
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,
	HEX6,
	HEX7,

	//////////// LCD //////////
	LCD_BLON,
	LCD_DATA,
	LCD_EN,
	LCD_ON,
	LCD_RS,
	LCD_RW,

	//////////// RS232 //////////
	UART_CTS,
	UART_RTS,
	UART_RXD,
	UART_TXD,

	//////////// PS2 for Keyboard and Mouse //////////
	PS2_CLK,
	PS2_CLK2,
	PS2_DAT,
	PS2_DAT2,

	//////////// SDCARD //////////
	SD_CLK,
	SD_CMD,
	SD_DAT,
	SD_WP_N,

	//////////// VGA //////////
	VGA_B,
	VGA_BLANK_N,
	VGA_CLK,
	VGA_G,
	VGA_HS,
	VGA_R,
	VGA_SYNC_N,
	VGA_VS,

	//////////// Audio //////////
	AUD_ADCDAT,
	AUD_ADCLRCK,
	AUD_BCLK,
	AUD_DACDAT,
	AUD_DACLRCK,
	AUD_XCK,

	//////////// I2C for EEPROM //////////
	EEP_I2C_SCLK,
	EEP_I2C_SDAT,

	//////////// I2C for Audio Tv-Decoder  //////////
	I2C_SCLK,
	I2C_SDAT,

	//////////// Ethernet 0 //////////
	ENET0_GTX_CLK,
	ENET0_INT_N,
	ENET0_LINK100,
	ENET0_MDC,
	ENET0_MDIO,
	ENET0_RST_N,
	ENET0_RX_CLK,
	ENET0_RX_COL,
	ENET0_RX_CRS,
	ENET0_RX_DATA,
	ENET0_RX_DV,
	ENET0_RX_ER,
	ENET0_TX_CLK,
	ENET0_TX_DATA,
	ENET0_TX_EN,
	ENET0_TX_ER,
	ENETCLK_25,

	//////////// Ethernet 1 //////////
	ENET1_GTX_CLK,
	ENET1_INT_N,
	ENET1_LINK100,
	ENET1_MDC,
	ENET1_MDIO,
	ENET1_RST_N,
	ENET1_RX_CLK,
	ENET1_RX_COL,
	ENET1_RX_CRS,
	ENET1_RX_DATA,
	ENET1_RX_DV,
	ENET1_RX_ER,
	ENET1_TX_CLK,
	ENET1_TX_DATA,
	ENET1_TX_EN,
	ENET1_TX_ER,

	//////////// TV Decoder //////////
	TD_CLK27,
	TD_DATA,
	TD_HS,
	TD_RESET_N,
	TD_VS,

	//////////// USB 2.0 OTG //////////
	OTG_ADDR,
	OTG_CS_N,
	OTG_DACK_N,
	OTG_DATA,
	OTG_DREQ,
	OTG_FSPEED,
	OTG_INT,
	OTG_LSPEED,
	OTG_RD_N,
	OTG_RST_N,
	OTG_WE_N,

	//////////// IR Receiver //////////
	IRDA_RXD,

	//////////// SDRAM //////////
	DRAM_ADDR,
	DRAM_BA,
	DRAM_CAS_N,
	DRAM_CKE,
	DRAM_CLK,
	DRAM_CS_N,
	DRAM_DQ,
	DRAM_DQM,
	DRAM_RAS_N,
	DRAM_WE_N,

	//////////// SRAM //////////
	SRAM_ADDR,
	SRAM_CE_N,
	SRAM_DQ,
	SRAM_LB_N,
	SRAM_OE_N,
	SRAM_UB_N,
	SRAM_WE_N,

	//////////// Flash //////////
	FL_ADDR,
	FL_CE_N,
	FL_DQ,
	FL_OE_N,
	FL_RST_N,
	FL_RY,
	FL_WE_N,
	FL_WP_N,

	//////////// GPIO, GPIO connect to D5M - 5M Pixel Camera //////////
	D5M_D,
	D5M_FVAL,
	D5M_LVAL,
	D5M_PIXLCLK,
	D5M_RESET_N,
	D5M_SCLK,
	D5M_SDATA,
	D5M_STROBE,
	D5M_TRIGGER,
	D5M_XCLKIN 


);		



input		          		CLOCK_50;
input		          		CLOCK2_50;
input		          		CLOCK3_50;

//////////// Sma //////////
input		          		SMA_CLKIN;
output		          		SMA_CLKOUT;

//////////// LED //////////
output		     [8:0]		LEDG;
output		    [17:0]		LEDR;

//////////// KEY //////////
input		     [3:0]		KEY;

//////////// EJTAG //////////
inout		     [6:0]		EX_IO;

//////////// SW //////////
input		    [17:0]		SW;

//////////// SEG7 //////////
output		     [6:0]		HEX0;
output		     [6:0]		HEX1;
output		     [6:0]		HEX2;
output		     [6:0]		HEX3;
output		     [6:0]		HEX4;
output		     [6:0]		HEX5;
output		     [6:0]		HEX6;
output		     [6:0]		HEX7;

//////////// LCD //////////
output		          		LCD_BLON;
inout		     [7:0]		LCD_DATA;
output		          		LCD_EN;
output		          		LCD_ON;
output		          		LCD_RS;
output		          		LCD_RW;

//////////// RS232 //////////
output		          		UART_CTS;
input		          		UART_RTS;
input		          		UART_RXD;
output		          		UART_TXD;

//////////// PS2 for Keyboard and Mouse //////////
inout		          		PS2_CLK;
inout		          		PS2_CLK2;
inout		          		PS2_DAT;
inout		          		PS2_DAT2;

//////////// SDCARD //////////
output		          		SD_CLK;
inout		          		SD_CMD;
inout		     [3:0]		SD_DAT;
input		          		SD_WP_N;

//////////// VGA //////////
output		     [7:0]		VGA_B;
output		          		VGA_BLANK_N;
output		          		VGA_CLK;
output		     [7:0]		VGA_G;
output		          		VGA_HS;
output		     [7:0]		VGA_R;
output		          		VGA_SYNC_N;
output		          		VGA_VS;

//////////// Audio //////////
input		          		AUD_ADCDAT;
inout		          		AUD_ADCLRCK;
inout		          		AUD_BCLK;
output		          		AUD_DACDAT;
inout		          		AUD_DACLRCK;
output		          		AUD_XCK;

//////////// I2C for EEPROM //////////
output		          		EEP_I2C_SCLK;
inout		          		EEP_I2C_SDAT;

//////////// I2C for Audio Tv-Decoder  //////////
output		          		I2C_SCLK;
inout		          		I2C_SDAT;

//////////// Ethernet 0 //////////
output		          		ENET0_GTX_CLK;
input		          		ENET0_INT_N;
input		          		ENET0_LINK100;
output		          		ENET0_MDC;
inout		          		ENET0_MDIO;
output		          		ENET0_RST_N;
input		          		ENET0_RX_CLK;
input		          		ENET0_RX_COL;
input		          		ENET0_RX_CRS;
input		     [3:0]		ENET0_RX_DATA;
input		          		ENET0_RX_DV;
input		          		ENET0_RX_ER;
input		          		ENET0_TX_CLK;
output		     [3:0]		ENET0_TX_DATA;
output		          		ENET0_TX_EN;
output		          		ENET0_TX_ER;
input		          		ENETCLK_25;

//////////// Ethernet 1 //////////
output		          		ENET1_GTX_CLK;
input		          		ENET1_INT_N;
input		          		ENET1_LINK100;
output		          		ENET1_MDC;
inout		          		ENET1_MDIO;
output		          		ENET1_RST_N;
input		          		ENET1_RX_CLK;
input		          		ENET1_RX_COL;
input		          		ENET1_RX_CRS;
input		     [3:0]		ENET1_RX_DATA;
input		          		ENET1_RX_DV;
input		          		ENET1_RX_ER;
input		          		ENET1_TX_CLK;
output		     [3:0]		ENET1_TX_DATA;
output		          		ENET1_TX_EN;
output		          		ENET1_TX_ER;

//////////// TV Decoder //////////
input		          		TD_CLK27;
input		     [7:0]		TD_DATA;
input		          		TD_HS;
output		          		TD_RESET_N;
input		          		TD_VS;

//////////// USB 2.0 OTG //////////
output		     [1:0]		OTG_ADDR;
output		          		OTG_CS_N;
output		     [1:0]		OTG_DACK_N;
inout		    [15:0]		OTG_DATA;
input		     [1:0]		OTG_DREQ;
inout		          		OTG_FSPEED;
input		     [1:0]		OTG_INT;
inout		          		OTG_LSPEED;
output		          		OTG_RD_N;
output		          		OTG_RST_N;
output		          		OTG_WE_N;

//////////// IR Receiver //////////
input		          		IRDA_RXD;

//////////// SDRAM //////////
output		    [12:0]		DRAM_ADDR;
output		     [1:0]		DRAM_BA;
output		          		DRAM_CAS_N;
output		          		DRAM_CKE;
output		          		DRAM_CLK;
output		          		DRAM_CS_N;
inout		    [31:0]		DRAM_DQ;
output		     [3:0]		DRAM_DQM;
output		          		DRAM_RAS_N;
output		          		DRAM_WE_N;

//////////// SRAM //////////
output		    [19:0]		SRAM_ADDR;
output		          		SRAM_CE_N;
inout		    [15:0]		SRAM_DQ;
output		          		SRAM_LB_N;
output		          		SRAM_OE_N;
output		          		SRAM_UB_N;
output		          		SRAM_WE_N;

//////////// Flash //////////
output		    [22:0]		FL_ADDR;
output		          		FL_CE_N;
inout		     [7:0]		FL_DQ;
output		          		FL_OE_N;
output		          		FL_RST_N;
input		          		FL_RY;
output		          		FL_WE_N;
output		          		FL_WP_N;

//////////// GPIO, GPIO connect to D5M - 5M Pixel Camera //////////
input		    [11:0]		D5M_D;
input		          		D5M_FVAL;
input		          		D5M_LVAL;
input		          		D5M_PIXLCLK;
output		          		D5M_RESET_N;
output		          		D5M_SCLK;
inout		          		D5M_SDATA;
input		          		D5M_STROBE;
output		          		D5M_TRIGGER;
output		          		D5M_XCLKIN;


//=======================================================
//  REG/WIRE declarations
//=======================================================
wire	[15:0]	Read_DATA1;
wire	[15:0]	Read_DATA2;

wire	[11:0]	mCCD_DATA;
wire			mCCD_DVAL;
wire			mCCD_DVAL_d;
wire	[15:0]	X_Cont;
wire	[15:0]	Y_Cont;
wire	[9:0]	X_ADDR;
wire	[31:0]	Frame_Cont;
wire			DLY_RST_0;
wire			DLY_RST_1;
wire			DLY_RST_2;
wire			DLY_RST_3;
wire			DLY_RST_4;
wire			Read;
reg		[11:0]	rCCD_DATA;
reg				rCCD_LVAL;
reg				rCCD_FVAL;
wire	[11:0]	sCCD_R;
wire	[11:0]	sCCD_G;
wire	[11:0]	sCCD_B;
wire			sCCD_DVAL;

wire			sdram_ctrl_clk;
wire	[9:0]	oVGA_R;   				//	VGA Red[9:0]
wire	[9:0]	oVGA_G;	 				//	VGA Green[9:0]
wire	[9:0]	oVGA_B;   				//	VGA Blue[9:0]

//power on start
wire             auto_start;
//=======================================================
//  Structural coding
//=======================================================
// D5M
assign	D5M_TRIGGER	=	1'b1;  // tRIGGER
assign	D5M_RESET_N	=	DLY_RST_1;
//assign  VGA_CTRL_CLK = ~VGA_CLK;

assign	LEDR		=	SW;
assign	LEDG		=	Y_Cont;
assign	UART_TXD = UART_RXD;

//fetch the high 8 bits
assign  VGA_R = oVGA_R[9:2];
assign  VGA_G = oVGA_G[9:2];
assign  VGA_B = oVGA_B[9:2];

//D5M read 
always@(posedge D5M_PIXLCLK)
begin
	rCCD_DATA	<=	D5M_D;
	rCCD_LVAL	<=	D5M_LVAL;
	rCCD_FVAL	<=	D5M_FVAL;
end

//auto start when power on
assign auto_start = ((KEY[0])&&(DLY_RST_3)&&(!DLY_RST_4))? 1'b1:1'b0;
//Reset module
Reset_Delay			u2	(	.iCLK(CLOCK_50),
							.iRST(KEY[0]),
							.oRST_0(DLY_RST_0),
							.oRST_1(DLY_RST_1),
							.oRST_2(DLY_RST_2),
							.oRST_3(DLY_RST_3),
							.oRST_4(DLY_RST_4)
						);
//D5M image capture
CCD_Capture			u3	(	.oDATA(mCCD_DATA),
							.oDVAL(mCCD_DVAL),
							.oX_Cont(X_Cont),
							.oY_Cont(Y_Cont),
							.oFrame_Cont(Frame_Cont),
							.iDATA(rCCD_DATA),
							.iFVAL(rCCD_FVAL),
							.iLVAL(rCCD_LVAL),
							.iSTART(!KEY[3]|auto_start),
							.iEND(),
							.iCLK(~D5M_PIXLCLK),
							.iRST(DLY_RST_2)
						);
//D5M raw date convert to RGB data
`ifdef VGA_640x480p60
RAW2RGB				u4	(	.iCLK(D5M_PIXLCLK),
							.iRST(DLY_RST_1),
							.iDATA(mCCD_DATA),
							.iDVAL(mCCD_DVAL),
							.oRed(sCCD_R),
							.oGreen(sCCD_G),
							.oBlue(sCCD_B),
							.oDVAL(sCCD_DVAL),
							.iX_Cont(X_Cont),
							.iY_Cont(Y_Cont)
						);
`else
RAW2RGB				u4	(	.iCLK(D5M_PIXLCLK),
							.iRST_n(DLY_RST_1),
							.iData(mCCD_DATA),
							.iDval(mCCD_DVAL),
							.oRed(sCCD_R),
							.oGreen(sCCD_G),
							.oBlue(sCCD_B),
							.oDval(sCCD_DVAL),
							.iZoom(),
							.iX_Cont(X_Cont),
							.iY_Cont(Y_Cont)
						);
`endif
//Frame count display
SEG7_LUT_8 			u5	(	.oSEG0(HEX0),.oSEG1(HEX1),
							.oSEG2(HEX2),.oSEG3(HEX3),
							.oSEG4(HEX4),.oSEG5(HEX5),
							.oSEG6(HEX6),.oSEG7(HEX7),
							.iDIG(Frame_Cont[31:0])
						);

sdram_pll 			u6	(
							.inclk0(CLOCK_50),
							.c0(sdram_ctrl_clk),
							.c1(DRAM_CLK),
							.c2(D5M_XCLKIN), //25M
`ifdef VGA_640x480p60
							.c3(VGA_CTRL_CLK)     //25M 
`else
						    .c4(VGA_CLK)     //40M 	
`endif
						);

//SDRam Read and Write as Frame Buffer
Sdram_Control	u7	(	//	HOST Side						
						    .RESET_N(KEY[0]),
							.CLK(sdram_ctrl_clk),

							//	FIFO Write Side 1
							.WR1_DATA({1'b0,sCCD_G[11:7],sCCD_B[11:2]}),
							.WR1(sCCD_DVAL),
							.WR1_ADDR(0),
`ifdef VGA_640x480p60
						    .WR1_MAX_ADDR(640*480/2),
						    .WR1_LENGTH(8'h50),
`else
							.WR1_MAX_ADDR(800*600/2),
							.WR1_LENGTH(8'h80),
`endif							
							.WR1_LOAD(!DLY_RST_0),
							.WR1_CLK(D5M_PIXLCLK),

							//	FIFO Write Side 2
							.WR2_DATA({1'b0,sCCD_G[6:2],sCCD_R[11:2]}),
							.WR2(sCCD_DVAL),
							.WR2_ADDR(23'h100000),
`ifdef VGA_640x480p60
						    .WR2_MAX_ADDR(23'h100000+640*480/2),
							.WR2_LENGTH(8'h50),
`else							
							.WR2_MAX_ADDR(23'h100000+800*600/2),
							.WR2_LENGTH(8'h80),
`endif	
							.WR2_LOAD(!DLY_RST_0),
							.WR2_CLK(D5M_PIXLCLK),

							//	FIFO Read Side 1
						    .RD1_DATA(Read_DATA1),
				        	.RD1(Read),
				        	.RD1_ADDR(0),
`ifdef VGA_640x480p60
						    .RD1_MAX_ADDR(640*480/2),
							.RD1_LENGTH(8'h50),
`else
							.RD1_MAX_ADDR(800*600/2),
							.RD1_LENGTH(8'h80),
`endif
							.RD1_LOAD(!DLY_RST_0),
							.RD1_CLK(VGA_CTRL_CLK),
							
							//	FIFO Read Side 2
						    .RD2_DATA(Read_DATA2),
							.RD2(Read),
							.RD2_ADDR(23'h100000),
`ifdef VGA_640x480p60
						    .RD2_MAX_ADDR(23'h100000+640*480/2),
							.RD2_LENGTH(8'h50),
`else
							.RD2_MAX_ADDR(23'h100000+800*600/2),
							.RD2_LENGTH(8'h80),
`endif
				        	.RD2_LOAD(!DLY_RST_0),
							.RD2_CLK(VGA_CTRL_CLK),
							
							//	SDRAM Side
						    .SA(DRAM_ADDR),
							.BA(DRAM_BA),
							.CS_N(DRAM_CS_N),
							.CKE(DRAM_CKE),
							.RAS_N(DRAM_RAS_N),
							.CAS_N(DRAM_CAS_N),
							.WE_N(DRAM_WE_N),
							.DQ(DRAM_DQ),
							.DQM(DRAM_DQM)
						);


////	SDRAM frame buffer
//Sdram_Control_4Port	u6	(	//	HOST Side
//						    .REF_CLK(VGA_CTRL_CLK),
//							.CLK_18(AUD_CTRL_CLK),
//						    .RESET_N(1'b1),
//							//	FIFO Write Side 1
//						    .WR1_DATA(YCbCr),
//							.WR1(TV_DVAL),
//							.WR1_FULL(WR1_FULL),
//							.WR1_ADDR(0),
//							.WR1_MAX_ADDR(640*507),		//	525-18
//							.WR1_LENGTH(9'h80),
//							.WR1_LOAD(!DLY0),
//							.WR1_CLK(TD_CLK),
//							//	FIFO Read Side 1
//						    .RD1_DATA(m1YCbCr),
//				        	.RD1(m1VGA_Read),
//				        	.RD1_ADDR(640*13),			//	Read odd field and bypess blanking
//							.RD1_MAX_ADDR(640*253),
//							.RD1_LENGTH(9'h80),
//				        	.RD1_LOAD(!DLY0),
//							.RD1_CLK(VGA_CTRL_CLK),
//							//	FIFO Read Side 2
//						    .RD2_DATA(m2YCbCr),
//				        	.RD2(m2VGA_Read),
//				        	.RD2_ADDR(640*267),			//	Read even field and bypess blanking
//							.RD2_MAX_ADDR(640*507),
//							.RD2_LENGTH(9'h80),
//				        	.RD2_LOAD(!DLY0),
//							.RD2_CLK(VGA_CTRL_CLK),
//							//	SDRAM Side
//						    .SA(DRAM_ADDR),
//						    .BA({DRAM_BA_1,DRAM_BA_0}),
//						    .CS_N(DRAM_CS_N),
//						    .CKE(DRAM_CKE),
//						    .RAS_N(DRAM_RAS_N),
//				            .CAS_N(DRAM_CAS_N),
//				            .WE_N(DRAM_WE_N),
//						    .DQ(DRAM_DQ),
//				            .DQM({DRAM_UDQM,DRAM_LDQM}),
//							.SDR_CLK(DRAM_CLK)	);
//

//D5M I2C control
I2C_CCD_Config 		u8	(	//	Host Side
							.iCLK(CLOCK_50),
							.iRST_N(DLY_RST_2),
							.iEXPOSURE_ADJ(),
							.iEXPOSURE_DEC_p(),
							.iZOOM_MODE_SW(),
							//	I2C Side
							.I2C_SCLK(D5M_SCLK),
							.I2C_SDAT(D5M_SDATA)
						);
assign mRed = Read_DATA2[9:0];
assign mGreen = {Read_DATA1[14:10],Read_DATA2[14:10]};
assign mBlue = Read_DATA1[9:0];

//	VGA Controller
VGA_Ctrl			u9	(	//	Host Side
							.iRed(mux_Red),
							.iGreen(mux_Green),
							.iBlue(mux_Blue),
							.oCurrent_X(VGA_X),
							.oCurrent_Y(VGA_Y),
							.oRequest(Read),
							.oShift_Flag(Shift_En),
							//	VGA Side
							.oVGA_R(oVGA_R),
							.oVGA_G(oVGA_G),
							.oVGA_B(oVGA_B),
							.oVGA_HS(VGA_HS),
							.oVGA_VS(VGA_VS),
							.oVGA_SYNC(VGA_SYNC_N),
							.oVGA_BLANK(VGA_BLANK_N),
							.oVGA_CLOCK(VGA_CLK),
							//	Control Signal
							.iCLK(VGA_CTRL_CLK),
							.iRST_N(DLY_RST_2)	);


//Buffering with shift registers
wire [9:0] mRed, mGreen, mBlue;
reg [9:0] mRed1, mGreen1, mBlue1;
reg [9:0] VGA_X1, VGA_Y1;
wire [9:0] VGA_X, VGA_Y;
reg 		 VGA_BLANK1;

always @(posedge VGA_CTRL_CLK) begin
	mRed1 <= mRed;
	mGreen1 <= mGreen;
	mBlue1 <= mBlue;
	VGA_X1 <= VGA_X;
	VGA_Y1 <= VGA_Y;
	VGA_BLANK1 <= VGA_BLANK_N;
end
//Buffer of shift registers - in order to store 3 lines 
buffer3 	delayer(
	.clock		(VGA_CTRL_CLK),
	.clken		(Shift_En),
	.shiftin		({mRed,mGreen,mBlue}),
	.oGrid		({grid[8],grid[7],grid[6],
					  grid[5],grid[4],grid[3],
					  grid[2],grid[1],grid[0]}) 
);
									
wire [29:0] grid [8:0];	// grid[8] grid[7] grid[6]
								// grid[5] grid[4] grid[3]
								// grid[2] grid[1] grid[0]

//Time Averaging module
wire [4:0] Red2, Green2, Blue2;

TimeAverager ta0 (
	.iCLK			(VGA_CTRL_CLK),
	.iVGA_BLANK	(VGA_BLANK1),
	.iVGA_X		(VGA_X1),
	.iVGA_Y		(VGA_Y1),
	.iRed			(mRed1[9:5]),
	.iGreen		(mGreen1[9:5]),
	.iBlue		(mBlue1[9:5]),
	.oRed			(Red2),
	.oGreen		(Green2),
	.oBlue		(Blue2),
	.oSRAM_WE_N	(SRAM_WE_N),
	.oSRAM_ADDR	(SRAM_ADDR),
	.SRAM_DQ		(SRAM_DQ)
);

//SRAM signals
assign SRAM_UB_N = 1'b0;	//	SRAM High-byte Data Mask 
assign SRAM_LB_N = 1'b0;	//	SRAM Low-byte Data Mask 
assign SRAM_CE_N = 1'b0;	//	SRAM Chip Enable
assign SRAM_OE_N = 1'b0;	//	SRAM Output Enable

//Intensity Calculation module
wire [9:0] intensity [8:0];

genvar i;
generate
	for(i=0;i<9;i=i+1) begin:iFor
		intensityCalc iCalc(
			.iCLK			(VGA_CTRL_CLK),
			.iR			({grid[i][29:26],6'b0}),
			.iG			({grid[i][19:16],6'b0}),
			.iB			({grid[i][9:6],6'b0}),
			.oIntensity	(intensity[i])
		);
	end
endgenerate

//Edge detection and Color reduction
buffer3 	delayAveraged(
				.clock		(VGA_CTRL_CLK),
				.clken		(Shift_En),
				.shiftin		({Red2,5'b11111,
								  Green2,5'b11111,
								  Blue2,5'b11111}),
				.shiftout	({Red3,Green3,Blue3})
			);
wire [9:0] Red3, Green3, Blue3;

reg [9:0] Intensity3;
always @(posedge VGA_CTRL_CLK) begin
	Intensity3 <= intensity[4];
end

//Edge Detection Modules
edgedetectH		Horiz(.clock(VGA_CTRL_CLK),
							.iGrid({intensity[8],intensity[7],intensity[6],
									  intensity[5],intensity[4],intensity[3],
									  intensity[2],intensity[1],intensity[0]}),
							.iThreshold(Edge_Threshold),
							.oPixel(horiz_edge)
							);
							
edgedetectV		 Vert(.clock(VGA_CTRL_CLK),
							.iGrid({intensity[8],intensity[7],intensity[6],
									  intensity[5],intensity[4],intensity[3],
									  intensity[2],intensity[1],intensity[0]}),
							.iThreshold(Edge_Threshold),
							.oPixel(vert_edge)
							);
								
assign is_edge = horiz_edge | vert_edge;

//MUXing and color masking scheme
wire	[29:0] Gray_or_Color, Bits_reduced;
wire    [9:0] mux_Red, mux_Green, mux_Blue;

assign Gray_or_Color = (SW[0]) ? {Intensity3,Intensity3,Intensity3} : {Red3,Green3,Blue3};
assign Bits_reduced	= (SW[1]) ? { {((Gray_or_Color[29:25] & Red_Mask) | ~Red_Mask),5'b11111},
													 {((Gray_or_Color[19:15] & Green_Mask) | ~Green_Mask),5'b11111},
													 {((Gray_or_Color[9:5] & Blue_Mask) | ~Blue_Mask),5'b11111}} 		: {
													 {(Gray_or_Color[29:25] & Red_Mask),5'b11111},
													 {(Gray_or_Color[19:15] & Green_Mask),5'b11111},
													 {(Gray_or_Color[9:5] & Blue_Mask),5'b11111}};

assign mux_Red   = (is_edge) ? (10'd0) : (Bits_reduced[29:20]);
assign mux_Green = (is_edge) ? (10'd0) : (Bits_reduced[19:10]);
assign mux_Blue  = (is_edge) ? (10'd0) : (Bits_reduced[9:0]);

//Mask selection mapped to switches on board
//Mask Registers for Red, Green, and Blue
reg [4:0]  Red_Mask, Green_Mask, Blue_Mask;
reg [9:0]  Edge_Threshold;
//Button presses for registering of masks
wire newkey1, newkey2;

newPress		n0(.iCLK(VGA_CTRL_CLK), .iKey(~KEY[1]), .oNewPress(newkey1));
newPress		n1(.iCLK(VGA_CTRL_CLK), .iKey(~KEY[2]), .oNewPress(newkey2));


always @(posedge VGA_CTRL_CLK or negedge DLY_RST_2) begin
	if(!DLY_RST_2) begin
		Red_Mask		<= 5'b11100;
		Green_Mask	<= 5'b11110;
		Blue_Mask	<=	5'b11100;
	end
	else if(newkey1) begin
		Red_Mask 	<= SW[17:13];
		Green_Mask	<= SW[12:8];
		Blue_Mask	<= SW[7:3];
	end
	else begin
		Red_Mask		<= Red_Mask;
		Green_Mask	<= Green_Mask;
		Blue_Mask	<= Blue_Mask;
	end
end

always @(posedge VGA_CTRL_CLK or negedge DLY_RST_2) begin
	if(!DLY_RST_2) begin
		Edge_Threshold	<= 10'h0E0;
	end
	else if(newkey2) begin
		Edge_Threshold	<= SW[9:0];
	end
	else begin
		Edge_Threshold	<= Edge_Threshold;
	end
end
endmodule 
