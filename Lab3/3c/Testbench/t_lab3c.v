`timescale 1ns / 1ps	// timescale <unit>/<precision>

module t_lab3c ( );	// substitute the name of the UUT 
						// UUT = Unit Under Test

	reg [9:0] SW;			// inputs of UUT 		
	reg KEY0, KEY1;
   	wire [9:0] LEDR;		// outputs of UUT
 	wire [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; 
	
	lab3c lab3c_tb (SW, LEDR, KEY0, KEY1, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	
	initial begin  	 	
						// statements generating input waveforms
		SW = 0; //KEY1 = 0; #1 KEY1 = 1; KEY0 = 0; #1 KEY0 = 1;
		#10 SW[7:0] = 5;
		#10 KEY1 = 0; #1 KEY1 = 1;
		#10 SW[7:0] = 7;
		#10 SW[7:0] = 10;
		#10 KEY1 = 0; #1 KEY1 = 1;
		#10 KEY0 = 0; #1 KEY0 = 1;
		#10 SW[7:0] = 1;
		#10 KEY1 = 0; #1 KEY1 = 1;
		#10 SW[7:0] = 255;
		#10 SW[7:0] = 200;		
		
	end // initial

endmodule
