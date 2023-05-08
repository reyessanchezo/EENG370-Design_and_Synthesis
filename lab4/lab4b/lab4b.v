/*
Oscar Reyes-Sanchez
Sequence recognizer using shift registers
LEDR[9] is the output z, and turns on when the input w is the same for 4 or more clock cycles.
SW[0] is an asynchronous reset, SW[1] is the input w. KEY1 is the clock input.
*/

module lab4b (MAX10_CLK1_50, KEY0, KEY1, LEDR, SW);

	input KEY0, KEY1, MAX10_CLK1_50;
	input [9:0] SW;
	output [9:0] LEDR;
	
	reg [3:0] reg1, reg2;
	wire clk, w, rst;
	button_debouncer K1_db (MAX10_CLK1_50, 1, ~KEY1, clk);
	assign rst = SW[0];
	assign w = SW[1];
	reg z;
	assign LEDR[3:0] = reg2;
	assign LEDR[7:4] = reg1;
	assign LEDR[9] = reg1[3] | reg2[3];
	
	always @(posedge clk) begin
		if(~rst)begin	
			reg1 <= reg1 << 1;
			reg2 <= reg2 << 1;
			reg1[0] = w;
			reg2[0] = ~w;
			if(w) reg2 = 0;
			else reg1 = 0;
		end
		else begin
			reg1 = 0;
			reg2 = 0;
		end
	end

endmodule