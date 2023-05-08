module KeypadTest (MAX10_CLK1_50, SW, KEY0, KEY1, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, LEDR, ARDUINO_IO)
	input [9:0] SW;
	inout [7:0] ARDUINO_IO;
	input KEY0, KEY1, MAX10_CLK1_50;
	output [9:0] LEDR;
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	inout [15:0] Arduino_IO;
	wire clk = MAX10_CLK1_50;
	wire rst = KEY1;
	wire KeyRead, KeyReady;
	wire [3:0] RowIn = ARDUINO_IO[3:0], DataOut, ColOut = ARDUINO_IO[7:4], PressCount;

	keyPadInterpreter test (clk, rst, KeyRead, RowIn, KeyReady, DataOut, ColOut, PressCount);
	
	always @(*)
		case(DataOut)
			0:	HEX0 <= 7'b1001111; //1
			1:	HEX0 <= 7'b0010010; //2
			2:	HEX0 <= 7'b0000110; //3
			3:	HEX0 <= 7'b0001000; //A
			4:	HEX0 <= 7'b1001100; //4
			5:	HEX0 <= 7'b0100100; //5
			6:	HEX0 <= 7'b0100000; //6
			7:	HEX0 <= 7'b1100000; //B
			7:	HEX0 <= 7'00011111; //7
			7:	HEX0 <= 7'b0000000; //8
			7:	HEX0 <= 7'b0001100; //9
			7:	HEX0 <= 7'b0110001; //C
			7:	HEX0 <= 7'b0111000; //F instead of *
			7:	HEX0 <= 7'b0000001; //0
			7:	HEX0 <= 7'b0110000; //E instead of #
			7:	HEX0 <= 7'b1000010; //D
		endcase
	


endmodule
