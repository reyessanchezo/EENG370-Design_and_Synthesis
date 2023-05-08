/*
Oscar
Testbench for 1-bit 2x1 mux
types of testbench to do

1. display plots
2. text based
3. self-checking

*/

`timescale 1ns / 1ps	// timescale <unit>/<precision>

module t_mux2x1 ( );	// substitute the name of the UUT 
							// UUT = Unit Under Test

	reg [2:0] in;		//a, b, select stored inside of 'in' = [a, b, select]	
   wire out;			// outputs of UUT
	integer i, errors;
	reg select, a, b;
	
	
	task check;
		input expect;
		
		if(out != expect)begin
			$display("Error: s = %b, expected %b, got %b", select, expect, out);
			errors = errors + 1;
		end
	endtask
	
	mux2x1 muxtest (select, a, b, out); 
	
	always @(*)begin
		select = in[0];
		a = in[1];
		b = in[2];
	end
	
	// statements generating input waveforms
	initial begin  	 	
		in = 0; errors = 0;
		$display("starting");
		#10 in = 0;
		#10 in = in + 1;
		#10 in = in + 1;
		#10 in = in + 1;
		#10 in = in + 1;
		#10 in = in + 1;
		#10 in = in + 1;
		#10 in = in + 1;

		
		
		$display("Test Done. Errors: %2d", errors); 
	end // initial

	/*
	for(i = 0; i < 8; i = i + 1) begin
			in = i; #10;
			$display("time: %3d", $time);
			
			select = in[0];
			a		 = in[1];
			b 	    = in[2];
			
			case(select)
				0: check(a); //output should be equal to a
				1:	check(b); //output should be equal to b
				default check(0);
			endcase		
		end
	*/
	
endmodule
