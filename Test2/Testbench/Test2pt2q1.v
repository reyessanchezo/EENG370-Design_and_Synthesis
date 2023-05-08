/*
Oscar
Question 1 from part 2
Testbench that instantiates and simulates the 4x1 mux provided
*/
`timescale 1ns / 1ps	// timescale <unit>/<precision>

module t_mux4x1 ( );	// substitute the name of the UUT 
						// UUT = Unit Under Test

	reg [9:0] SW;			// inputs of UUT 		
	wire [9:0] LED;			// outputs of UUT
	integer i;

	part3 part3_tb (SW, LED);
	
	initial begin 	 	
		$display("Starting");	
		SW = 10'b0000011011; #10	//S1S0UVWX in the switch input
		
		for(i = 27; i < 1024; i = i + 256) begin //Don't change U, V, W, or X. Only change s1 and s0
			SW = i; #10
			$display("SW = %2b, LED = %2b, U = %2b, V = %2b, W = %2b, X = %2b", SW[9:8], LED[1:0], SW[1:0], SW[3:2], SW[5:4], SW[7:6]);
		end
		
		$display("Done");
	end // initial

endmodule
