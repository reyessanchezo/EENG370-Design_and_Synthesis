/*
Oscar
Question 1 from part 2
Testbench that instantiates and simulates the 4x1 mux provided, self-checking
*/
`timescale 1ns / 1ps	// timescale <unit>/<precision>

module t_mux4x1b ( );	// substitute the name of the UUT 
						// UUT = Unit Under Test

	reg [9:0] SW;			// inputs of UUT 		
	wire [9:0] LED;			// outputs of UUT
	
	integer errors, i;
	task check;
	input [1:0] expect;
		if(LED[1:0] != expect)begin
			$display("Error: select = %b, expected %b, got %b", SW[9:8], expect, LED[1:0]);
			errors = errors + 1;
		end
	endtask

	part3 part3_tb (SW, LED);
	
	initial begin
		$display("Starting with self-check");		
		SW = 0; errors = 0; #10	//S1S0UVWX in the switch input
		
		for(i = 0; i < 1024; i = i + 1) begin 
			SW = i; #2
			case (SW[9:8]) //Checking s1 and s0
				2'b00: check(SW[1:0]); //Should match U
				2'b01: check(SW[3:2]); //Should match V
				2'b10: check(SW[5:4]); //Should match X
				2'b11: check(SW[7:6]); //Should match W
				default: check(0);
			endcase
		end
		
		$display("Done testing part3. Errors: %2d, Time: %2d", errors, $time);
	end // initial

endmodule
