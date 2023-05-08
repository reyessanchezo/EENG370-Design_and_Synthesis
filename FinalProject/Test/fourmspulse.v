module fourmspulse (clk, pulse);
	input clk;
	output reg pulse;
	
	
	reg [31:0] counter;

	always @(posedge clk) begin
		 if (counter < 200000) begin
			  counter <= counter + 1;
			  pulse <= 1;
		 end else if (counter < 400000) begin
			  counter <= counter + 1;
			  pulse <= 0;
		 end else begin
			  counter <= 0;
			  pulse <= 0;
		 end
	end

endmodule