`timescale 1ns / 1ps	// timescale <unit>/<precision>

module t_mux4x1 ( );	// substitute the name of the UUT 
						// UUT = Unit Under Test

	reg [9:0] SW;			// inputs of UUT 		
	wire [9:0] LED;			// outputs of UUT
	

	part3 part3_tb (SW, LED);
	
	initial begin: tb  	 	
		integer i;
		SW = 10'b0000011011; #10	//S1S0UVWX in the switch input
		
		for(i = 0; i < 1024; i = i + 1) begin
			SW = i; 
			#5
			$display("SW = %2d", SW);
		end
		
		$display("Done");
	end // initial

endmodule
