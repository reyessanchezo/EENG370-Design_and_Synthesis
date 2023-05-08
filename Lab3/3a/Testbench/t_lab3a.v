`timescale 1ns / 1ps	// timescale <unit>/<precision>

module t_lab3a ( );	// substitute the name of the UUT 
						// UUT = Unit Under Test

	reg [9:0] SW;			// inputs of UUT 		
	
   	wire [9:0] LEDR;			// outputs of UUT
 	wire [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; 
	
	Lab3a lab3a_tb (SW, LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	
	initial begin  	 	
						// statements generating input waveforms
		SW = 0;
		#10 SW[7:4] = 2; SW[3:0] = 2; SW[8] = 0; 	//2 + 2 + 0
		#10 SW[7:4] = 4; SW[3:0] = 2; SW[8] = 0;	//4 + 2 + 0
		#10 SW[7:4] = 2; SW[3:0] = 4; SW[8] = 0;
		#10 SW[7:4] = 0; SW[3:0] = 0; SW[8] = 0;
		#10 SW[7:4] = 10; SW[3:0] = 9; SW[8] = 0;	//10 + 9
		#10 SW[7:4] = 8; SW[3:0] = 8; SW[8] = 1;
		#10 SW[7:4] = 10; SW[3:0] = 10; SW[8] = 0;
		
	end // initial

endmodule
