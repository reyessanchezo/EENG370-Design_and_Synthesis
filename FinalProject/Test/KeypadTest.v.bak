module KeypadTest (MAX10_CLK1_50, SW, KEY0, KEY1, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, LEDR, ARDUINO_IO, GPIO_);
	input [9:0] SW;
	inout [7:0] ARDUINO_IO;
	inout [35:0] GPIO_;
	input KEY0, KEY1, MAX10_CLK1_50;
	output [9:0] LEDR;
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
	wire clk = MAX10_CLK1_50;
	wire rst = KEY1;
	wire KeyRead, KeyReady;
	wire [3:0] RowIn = GPIO_[7:4], DataOut, ColOut = GPIO_[3:0], PressCount;
	
	assign GPIO_[35] = KeyReady;	
	assign GPIO_[34]=clk;
	assign GPIO_[33]=KeyRead;
	assign GPIO_[32]=rst;
	assign LEDR[3:0] = RowIn;
	//assign LEDR[7:4] = ColOut;
	
	fourmspulse KeyReadPulse (clk, KeyRead);
	
	keyPadInterpreter test (clk, rst, KeyRead, RowIn, KeyReady, DataOut, ColOut, PressCount);
	
	hexdecoder KeyPressed (DataOut, HEX0);
	hexdecoder PressCounts (PressCount, HEX5);
	hexdecoder Disp1 (4'h0, HEX1);
	hexdecoder Disp2 (4'h0, HEX2);
	hexdecoder Disp3 (4'h0, HEX3);
	hexdecoder Disp4 (4'h0, HEX4);

endmodule
