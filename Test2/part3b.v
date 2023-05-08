// Implements a 2-bit wide 4-to-1 multiplexer.
// inputs: SW7-0 represent data in 4 groups, U, V, W, X
//         SW9-8 selects one group from U to X
// outputs:	LEDR1-0 displays the selected group
module part3b (SW, LEDR);
	input [9:0] SW;		// toggle switches
	output [9:0] LEDR;	// red LEDs

	wire [1:0] S, U, V, W, X, M;	// M is the 2-bit-wide 4-to-1 multiplexer
	wire [1:0] U_V, W_X;				// used for first multiplexer stage, U_V selects either
	                              // U or V, and W_X selects either W or X
	assign S[1:0] = SW[9:8];
	assign U = SW[1:0];
	assign V = SW[3:2];
	assign W = SW[5:4];
	assign X = SW[7:6];

	// 2-bit wide 4-to-1 multiplexer first stage
	assign U_V[0] = (~S[0] & U[0]) | (S[0] & V[0]);	
	assign U_V[1] = (~S[0] & U[1]) | (S[0] & V[1]);	
	assign W_X[0] = (~S[0] & W[0]) | (S[0] & X[0]);	
	assign W_X[1] = (~S[0] & W[1]) | (S[0] & X[1]);	

	// 2-bit wide 4-to-1 multiplexer second stage
	assign M[0] = (~S[1] & U_V[0]) | (S[1] & W_X[0]);
	assign M[1] = (~S[1] & U_V[1]) & (S[1] & W_X[1]);

	assign LEDR[1:0] = M;
	assign LEDR[9:2] = 8'b0;

endmodule
