`timescale 1ns / 1ps	// timescale <unit>/<precision>

module Lab2a_tb ();	// substitute the name of the UUT 
						// UUT = Unit Under Test

	reg [9:0] SW_tb;			// inputs of UUT 		

      wire [0:6] H0, H1, H2, H3, H4, H5;			// outputs of UUT

	Lab_2a Test1_tb (SW_tb, H0, H1, H2, H3, H4, H5);
	
	initial begin : test  	 	
						// statements generating input waveforms
		reg [7:0] d0, d1, d2, d3, d4, d5;
		integer i;
		for(i = 0; i<=12; i = i + 1) begin
			#10 SW_tb[9:7] = i;
			case(H0)
				7'b1111111: begin d0 <= ""; d1 <= "O"; d2 <= "A"; d3 <= "R"; d4 <= "S"; d5 <= ""; end
				7'b0000001: begin d1 <= ""; d2 <= "O"; d3 <= "A"; d4 <= "R"; d5 <= "S"; d0 <= ""; end
				7'b0001000: begin d2 <= ""; d3 <= "O"; d4 <= "A"; d5 <= "R"; d0 <= "S"; d1 <= ""; end
				7'b0100100: begin d3 <= ""; d4 <= "O"; d5 <= "A"; d0 <= "R"; d1 <= "S"; d2 <= ""; end
				
			endcase
			$display("Input: %4d, Timestep: %4d, Display %s, %s, %s, %s, %s, %s", SW_tb[9:7], $time, d0, d1, d2, d3, d4, d5);
		end
		
/*
	7"b1111111; //blank
	7"b0000001;	//O
	7"b0001000;	//A
	7"b1111010;	//R
	7"b0100100;	//S
	7"b1111111;//blank
*/
	end // initial

endmodule
