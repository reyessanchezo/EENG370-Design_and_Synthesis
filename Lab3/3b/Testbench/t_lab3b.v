`timescale 1ns / 1ps	// timescale <unit>/<precision>

module t_lab3b ( );	// substitute the name of the UUT 
						// UUT = Unit Under Test

	reg [9:0] SW;			// inputs of UUT 		
	
   			// outputs of UUT
 	wire [0:6] HEX0, HEX1; 
	
	lab3b lab3b_tb (SW, HEX0, HEX1);
	
	initial begin  	 	
						// statements generating input waveforms
		SW = 0;
		#10 SW[5:0] = 5;
		#10 SW[5:0] = 10;
		#10 SW[5:0] = 15;
		#10 SW[5:0] = 20;
		#10 SW[5:0] = 15;
		#10 SW[5:0] = 9;
		#10 SW[5:0] = 0;
		#10 SW[5:0] = 60;		
		#10 SW[5:0] = 63;
		#10 SW[5:0] = 23;
		
		
	end // initial

endmodule
