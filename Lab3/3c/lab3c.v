/*
Oscar Reyes-Sanchez
Lab 3 Part C
8bit adder with input storing
*/

module lab3c (SW, LEDR, KEY0, KEY1, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);

	input [9:0] SW;
	input KEY0, KEY1;
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	output [9:0] LEDR;
	assign LEDR [9:1] = 0;
	
	wire rst = ~KEY0;
	wire clk = ~KEY1;//when pressed, save A
	reg Cout;
	
	assign LEDR[0] = Cout;
	
	/*flow:
Display switch inputs as A
Once KEY1 is pressed switch inputs to B after saving A in a register
Add A and B, display sum on 7seg with Carry on ledr0
	*/
	
	
	wire [7:0] BinaryIn = SW[7:0];
	wire [3:0] AOnes, ATens, BOnes, BTens, SOnes, STens;
	reg  [7:0] ABinary, S;
	//Store value ofA
 
	always @(*)
		begin
			if(!rst)begin	
				if((ABinary + BinaryIn) > 255) Cout <= 1;
					else Cout <= 0;
				if(clk) ABinary <= BinaryIn;
				S <= ABinary + BinaryIn;
				end
			else begin
				Cout <= 0;
				ABinary <= 0;
				S <= 0;
				end
			
			
		end
	
	twodigitdecoder Adecoder (ABinary, AOnes, ATens);	//A
	defparam Adecoder.bit = 8;
	twodigitdecoder Bdecoder (BinaryIn, BOnes, BTens);	//B
	defparam Bdecoder.bit = 8;
	twodigitdecoder Sdecoder (S, SOnes, STens); //Sum
	defparam Sdecoder.bit = 8;
	
	hex7seg disp0 (BOnes, HEX0);
	hex7seg disp1 (BTens, HEX1);
	hex7seg disp2 (AOnes, HEX2);
	hex7seg disp3 (ATens, HEX3);
	hex7seg disp4 (SOnes, HEX4);
	hex7seg disp5 (STens, HEX5);	
	
endmodule