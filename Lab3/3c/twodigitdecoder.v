module twodigitdecoder (BinaryIn, OnesOut, TensOut);
	parameter bit = 5;
	input [bit-1:0] BinaryIn;
	output reg [3:0] OnesOut, TensOut;
	
	always @(BinaryIn)
		begin
			OnesOut = BinaryIn[3:0];
			TensOut = BinaryIn[bit-1:4]; //This has been modified to output hex instead. Helps prevent overflow
		end

endmodule