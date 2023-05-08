/*
Oscar Reyes-Sanchez
Lab2 part a
Scroll a 4 letter word across the seven segment display
Depends on the switch inputs
The word is OARS
*/

module Lab_2a (SW, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	input [9:0] SW;
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	//output [9:0] LEDR = 10'b0;
	
	wire [2:0] select = SW[9:7];
	wire [2:0] code0, code1, code2, code3, code4, code5;
	
	mux6to1 mux (select, code0, code1, code2, code3, code4, code5); 
	
	

	displayDecoder zero 	(code0, HEX0);
	displayDecoder one 	(code1, HEX1);
	displayDecoder two 	(code2, HEX2);
	displayDecoder three (code3, HEX3);
	displayDecoder four	(code4, HEX4);
	displayDecoder five	(code5, HEX5);

endmodule

module mux6to1 (s, code0, code1, code2, code3, code4, code5);
	input [2:0] s;
	output reg [2:0] code0, code1, code2, code3, code4, code5;
	
	always @ (s)
		case (s) 
			3'b000: 	begin
							code0= 3'b100;
							code1= 3'b011;
							code2= 3'b010;
							code3= 3'b001;
							code4= 3'b000;
							code5= 3'b000;
					end
			3'b001: 	begin
							code0= 3'b000;
							code1= 3'b100;
							code2= 3'b011;
							code3= 3'b010;
							code4= 3'b001;
							code5= 3'b000;
					end
			3'b010: 	begin
							code0= 3'b000;
							code1= 3'b000;
							code2= 3'b100;
							code3= 3'b011;
							code4= 3'b010;
							code5= 3'b001;
					end 
			3'b011:	begin
							code0= 3'b001;
							code1= 3'b000;
							code2= 3'b000;
							code3= 3'b100;
							code4= 3'b011;
							code5= 3'b010;
					end
			3'b100: 	begin
							code0= 3'b010;
							code1= 3'b001;
							code2= 3'b000;
							code3= 3'b000;
							code4= 3'b100;
							code5= 3'b011;
					end
			3'b101:	begin
							code0= 3'b011;
							code1= 3'b010;
							code2= 3'b001;
							code3= 3'b000;
							code4= 3'b000;
							code5= 3'b100;
					end
			default:	begin
							code0= 3'b000;
							code1= 3'b000;
							code2= 3'b000;
							code3= 3'b000;
							code4= 3'b000;
							code5= 3'b000;
					end
		endcase
endmodule

module displayDecoder (select, display);
	input [2:0] select;
	output reg [0:6] display;


	/*
	 *       0  
	 *      ---  
	 *     |   |
	 *    5|   |1
	 *     | 6 |
	 *      ---  
	 *     |   |
	 *    4|   |2
	 *     |   |
	 *      ---  
	 *       3  
	 */

	always @ (select)
		case (select) 
			3'b000: display = 7'b1111111; //blank
			3'b001: display = 7'b0000001;	//O
			3'b010: display = 7'b0001000;	//A
			3'b011: display = 7'b1111010;	//R
			3'b100: display = 7'b0100100;	//S
			default: display = 7'b1111111;//blank
		endcase
endmodule