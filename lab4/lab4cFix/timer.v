//Timer module that ticks once per half second
module timer (Clock, Reset_n, tc);
	parameter n = 32;
	parameter target = 25000000;
	
	input Clock, Reset_n;
	reg [n-1:0] Q;
	output reg tc; //terminal count, used to trigger next counter
		
	always @(posedge Clock) //reset after 0.5 second
		begin
		if (Q == target) 
				begin
				Q <= 1'd0;
				tc <= 1'b1;
				end
			else
				begin
				Q <= Q + 1'b1;
				tc <= 1'b0;
				end
		end
endmodule
