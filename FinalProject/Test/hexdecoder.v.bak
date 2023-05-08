module hexdecoder(HexIn, SevenOut);
	input [3:0] HexIn;
	output reg [0:6] SevenOut;
	
	always @(*)
		case(HexIn)
			0:	SevenOut <= 7'b1001111; //1
			1:	SevenOut <= 7'b0010010; //2
			2:	SevenOut <= 7'b0000110; //3
			3:	SevenOut <= 7'b0001000; //A
			4:	SevenOut <= 7'b1001100; //4
			5:	SevenOut <= 7'b0100100; //5
			6:	SevenOut <= 7'b0100000; //6
			7:	SevenOut <= 7'b1100000; //B
			8:	SevenOut <= 7'b0011111; //7
			9:	SevenOut <= 7'b0000000; //8
			10:SevenOut <= 7'b0001100; //9
			11:SevenOut <= 7'b0110001; //C
			12:SevenOut <= 7'b0111000; //F instead of *
			13:SevenOut <= 7'b0000001; //0
			14:SevenOut <= 7'b0110000; //E instead of #
			15:SevenOut <= 7'b1000010; //D
			default: SevenOut <= 7'b1111111;
		endcase
endmodule