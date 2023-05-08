module twodigitdecoder (BinaryIn, OnesOut, TensOut);
	parameter bit = 5;
	input [bit-1:0] BinaryIn;
	output reg [3:0] OnesOut, TensOut;
	
	always @(BinaryIn)
		begin
			OnesOut = BinaryIn % 10;
			TensOut = BinaryIn / 10;
		end

endmodule