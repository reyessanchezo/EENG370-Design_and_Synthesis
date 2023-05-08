/*
Oscar Reyes-Sanchez
3bit decoder to 7 segment display
*/

module lab4a (SW, HEX0);
	input [2:0] SW;
	output reg [0:6] HEX0;
	
	always @(*)
		case(SW[2:0])
			0:	HEX0 <= 7'b0001000;
			1:	HEX0 <= 7'b1100000;
			2:	HEX0 <= 7'b0110001;
			3:	HEX0 <= 7'b1000010;
			4:	HEX0 <= 7'b0110000;
			5:	HEX0 <= 7'b0111000;
			6:	HEX0 <= 7'b0000100;
			7:	HEX0 <= 7'b1001000;
		endcase
endmodule