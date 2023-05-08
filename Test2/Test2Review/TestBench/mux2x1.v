/*
oscar
mux 2x1
*/

module mux2x1 (select, a, b, muxout);
	input select, a, b;
	output reg muxout;

	always @(*)
		case (select)
			0: muxout = a;
			1: muxout = b;
		endcase
	
endmodule