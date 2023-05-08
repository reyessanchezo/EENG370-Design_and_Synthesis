/*
Oscar Reyes-Sanchez
Lab 3 part a
4 bit adder to 5 bit output on hex displays
*/

module Lab3a (SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);

	input [9:0] SW;
	output [9:0] LEDR;
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	assign HEX4 = 7'b1111111;
	assign HEX2 = 7'b1111111;
	
	wire [3:0] X, Y;
	wire [4:0] S; 
	wire Cin, Cout;
	
	wire [3:0] Xout, Yout, S1, S0, Xnull, Ynull;
	reg error;
	
	assign X = SW[7:4];
	assign Y = SW[3:0];
	assign Cin = SW[8];
	
	assign S = X + Y + Cin;
	
	assign LEDR[4:0] = S;
	assign LEDR[7:5] = 0;
	assign LEDR[8] = Cin;
	assign LEDR[9] = error;
	
	twodigitdecoder Decoder  (S, S0, S1);
	twodigitdecoder DecoderY  (Y, Yout, Ynull);
	defparam DecoderY.bit = 4;
	twodigitdecoder DecoderX  (X, Xout, Xnull);
	defparam DecoderX.bit = 4;
	
	hex7seg Xdisp (X, HEX5);
	hex7seg Ydisp (Y, HEX3);
	hex7seg Sdisp0 (S0, HEX0);
	hex7seg Sdisp1 (S1, HEX1);
	
	always @(S)
		begin
			if(X>9 | Y>9)
				error <= 1;
			else
				error <= 0;
		end
	
endmodule
