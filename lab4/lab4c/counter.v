//Counter module that counts up to 6
module counter (Clock, Enable, Reset_n, Q);
	parameter n = 3; //bit width of Q
	parameter count = 6;
	
	input Clock, Enable, Reset_n;
	output reg [n-1:0] Q;
		
	always @(posedge Clock) //reset when at 9
		begin
			if (Q == count) 
				Q <= 1'd0;
			else if (Enable)
				Q <= Q + 1'b1;
		end
endmodule