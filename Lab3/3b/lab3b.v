/*
Oscar Reyes-Sanchez
Lab 3 part b
22 February 2023

*/

module lab3b (SW, HEX0, HEX1);
	input [9:0] SW;
	output [0:6] HEX0, HEX1;
	
	wire [5:0] BinaryIn = SW[5:0];
	wire [3:0] Ones, Tens;
	
	twodigitdecoder decoder (BinaryIn, Ones, Tens);
	defparam decoder.bit = 6;
	
	hex7seg disp0 (Ones, HEX0);
	hex7seg disp1 (Tens, HEX1);	
	
endmodule