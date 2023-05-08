`timescale 1ns / 1ps	// timescale <unit>/<precision>

module t_UUTname ( );	// substitute the name of the UUT 
						// UUT = Unit Under Test

	reg ...;			// inputs of UUT 		

    wire ...;			// outputs of UUT

	UUTname U1_instance_name (UUT ports go here);
	
	initial begin  	 	
						// statements generating input waveforms
		# ...
		# ...

	end // initial

endmodule
