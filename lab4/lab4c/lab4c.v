/*
Oscar Reyes-Sanchez and Autumn Hotopp
Morse Code display program. Reads 3bit input from switches, outputs morse code for corresponding letter using LEDs after button press.
*/

module lab4c (SW, LEDR, KEY0, KEY1, MAX10_CLK1_50, HEX0);
	input  [9:0] SW;
	input  KEY0, KEY1, MAX10_CLK1_50;
	output [9:0] LEDR;
	output [0:6] HEX0;
	
	wire trigger, clk;
	reg [3:0] code, length;
	
	/*Morse Parameters*/
	parameter A_SW = 3'b000, A_Code = 4'b0010, A_len = 2; 
	parameter B_SW = 3'b001, B_Code = 4'b0001, B_len = 4;
	parameter C_SW = 3'b010, C_Code = 4'b0101, C_len = 4;
	parameter D_SW = 3'b011, D_Code = 4'b0001, D_len = 3;
	parameter E_SW = 3'b100, E_Code = 4'b0000, E_len = 1;
	parameter F_SW = 3'b101, F_Code = 4'b0100, F_len = 4;
	parameter G_SW = 3'b110, G_Code = 4'b0011, G_len = 3;
	parameter H_SW = 3'b111, H_Code = 4'b0000, H_len = 4;
	
	/*Switch inputs to fsm inputs*/
	always @(SW) begin
		case (SW[2:0])
			0: begin code = A_Code; length = A_len; end
			1: begin code = B_Code; length = B_len; end
			2: begin code = C_Code; length = C_len; end
			3: begin code = D_Code; length = D_len; end
			4: begin code = E_Code; length = E_len; end
			5: begin code = F_Code; length = F_len; end
			6: begin code = G_Code; length = G_len; end
			7: begin code = H_Code; length = H_len; end
		endcase
	end
	
	lab4a letters (SW[2:0], HEX0);
	button_debouncer testdb (MAX10_CLK1_50, 1, ~KEY0, rst);
	button_debouncer testdb2 (MAX10_CLK1_50, 1, ~KEY1, trigger);
	timer testtimer (MAX10_CLK1_50, 1, clk);
	defparam testtimer.target = 12500000;
	pulseFSM test (clk, trigger, code, rst, length, LEDR[0]);
	
endmodule

