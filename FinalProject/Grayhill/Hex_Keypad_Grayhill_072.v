module Hex_Keypad_Grayhill_072 (
	output [0:6] HEX0,
//	output [9:0] LEDR,
	inout [7:0] Arduino_IO,
	input KEY0, KEY1,
	input MAX10_CLK1_50
);

	reg [5:0] state, next_state;
	reg [3:0] Code, Col; //output
	wire [3:0] Row, CodeR; //input
	wire Valid, S_Row, reset, clock, debkey, R;
	
	assign Arduino_IO[3:0] = Col;
	assign Row = Arduino_IO[7:4];
//	assign LEDR[7:4] = Row;
//	assign LEDR[3:0] = Col;
//	assign LEDR[9] = Valid;
//	assign LEDR[8] = S_Row;
	assign reset = KEY1; 
	assign clock = MAX10_CLK1_50;
//	assign LEDR[7] = R; 
//	assign LEDR[5:0] = state;  
	
	parameter S_0 = 6'b000001, S_00 = 6'b000011, S_1 = 6'b000010, S_2 = 6'b000100;
	parameter S_3 = 6'b001000, S_4 = 6'b010000, S_5 = 6'b100000;
	
	assign Valid = ((state == S_1) || (state == S_2) || (state == S_3) || (state == S_4)) && R; //might be causing issue
	assign S_Row = ~(Row[0] & Row[1] & Row [2] & Row[3]);
	assign R = ((Row == 4'b0111) || (Row == 4'b1011) || (Row == 4'b1101) || (Row == 4'b1110));
	
	
	always @(Row, Col)
		case({Row, Col})
			8'b0111_0111:	Code = 1;
			8'b0111_1011:	Code = 2;
			8'b0111_1101:	Code = 3;
			8'b0111_1110:	Code = 10;//A
			8'b1011_0111:	Code = 4;
			8'b1011_1011:	Code = 5;
			8'b1011_1101:	Code = 6;
			8'b1011_1110:	Code = 11;//B
			8'b1101_0111:	Code = 7;
			8'b1101_1011:	Code = 8;
			8'b1101_1101:	Code = 9;	
			8'b1101_1110:	Code = 12;//C	
			8'b1110_0111:	Code = 14;//*E
			8'b1110_1011:	Code = 0;	
			8'b1110_1101:	Code = 15;//#F
			8'b1110_1110:	Code = 13;//D
			default:			Code = 0;
		endcase
		
   always @(posedge clock)
		if(reset == 1'b0) state <= S_0;
		else state <= next_state;
		
	always @(*)
		begin //next_state = S_0; Col = 4'b0000;
			case (state)
			
				S_0: begin Col = 4'b0000; if (S_Row) next_state = S_00; end
				
				S_00: begin Col = 4'b1111; next_state = S_1; end //might cause problem
				
				S_1: begin Col = 4'b0111; if (R) next_state = S_5; else next_state = S_2; end
				
				S_2: begin Col = 4'b1011; if (R) next_state = S_5; else next_state = S_3; end
				
				S_3: begin Col = 4'b1101; if (R) next_state = S_5; else next_state = S_4; end
				
				S_4: begin Col = 4'b1110; if (R) next_state = S_5; else next_state = S_1; end
				
				S_5: begin Col = 4'b0000; if (S_Row == 0) next_state = S_0; else next_state = S_5; end
				
				default: begin next_state = S_0; Col = 4'b0000; end
			endcase
		end 
		
		//instances
		regn r1 (Code, 1'b1, Valid, CodeR);
		//regn r1 (Code, Valid, clock, CodeR);
		hex7seg h1 (CodeR, Valid, HEX0); //remeber to change between Code and CodeR depening if using reg
	//	button_debouncer b1 (clock, 1'b1, Arduino_IO[4], Row[0]);
	//	button_debouncer b2 (clock, 1'b1, Arduino_IO[5], Row[1]);
	//	button_debouncer b3 (clock, 1'b1, Arduino_IO[6], Row[2]);
	//	button_debouncer b4 (clock, 1'b1, Arduino_IO[7], Row[3]);
	//	button_debouncer k1 (clock, 1'b1, KEY0, debkey);
		
endmodule

module regn(R, Rin, Clock, Q);//add reset to clear
    parameter n = 4;
    input [n-1:0] R;
    input Rin, Clock;
    output [n-1:0] Q;
    reg [n-1:0] Q;

    always @(posedge Clock)
         if (Rin)
            Q <= R;
endmodule

module hex7seg (hex, enable, display);
	input [3:0] hex;
	input enable;
	output [0:6] display;

	reg [0:6] display;
		
	always @(*)
		if (1 == 1)
		//if (enable == 1)
			begin
				case (hex)
					4'h0: display = 7'b0000001;
					4'h1: display = 7'b1001111;
					4'h2: display = 7'b0010010;
					4'h3: display = 7'b0000110;
					4'h4: display = 7'b1001100;
					4'h5: display = 7'b0100100;
					4'h6: display = 7'b0100000;
					4'h7: display = 7'b0001111;
					4'h8: display = 7'b0000000;
					4'h9: display = 7'b0001100;
					4'hA: display = 7'b0001000;
					4'hB: display = 7'b1100000;
					4'hC: display = 7'b0110001;
					4'hD: display = 7'b1000010;
					4'hE: display = 7'b0110000;
					4'hF: display = 7'b0111000; 
					default: display = 7'b1111110;//once working change to all 1's
				endcase
			end
		else 
			display = 7'b1111110; //once working change to all 1's
endmodule