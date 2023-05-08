/*
Oscar Reyes-Sanchez and Trevor Legaard
EENG 370
Digital lock on an FPGA
Using internal switches, key, hex, and leds. External motor driver and motor.
Keypad reading fails with additional I/O
*/

module KeypadTest (
	input [9:0] SW,
	inout [7:0] Arduino_IO,
	inout [35:0] GPIO_,
	input KEY0, KEY1, MAX10_CLK1_50,
	output [9:0] LEDR,
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
	);
	
	wire [3:0] in1, in2, in3, in4;
	wire [15:0] code, input_code;
	reg [3:0] pass_fail;
	wire done;
	assign LEDR[9] = done;
	wire [3:0] motor;
	assign LEDR[3:0] = motor;
	assign GPIO_[3:0] = motor;
	MotorDriving Motor1 (MAX10_CLK1_50, pass_fail, 1, 1, motor, done);
	
	seven_segment_decoder decode0 (SW[3:0], HEX0);
	storeNum s0 (KEY1, done, SW[3:0], in1, in2, in3, in4);
	seven_segment_decoder decode1 (in1, HEX5);
	seven_segment_decoder decode2 (in2, HEX4);
	seven_segment_decoder decode3 (in3, HEX3);
	seven_segment_decoder decode4 (in4, HEX2);
	
	assign input_code = {in1, in2, in3, in4};
	// password = 2798
	assign code = 16'h2798;
	
	always @*
	begin
		if((input_code == code) & ~KEY1) begin
			pass_fail = 1;   // pass
		end
		else if(input_code != code)begin
			pass_fail = 0;
		end
	end
	
	seven_segment_decoder decode42 (pass_fail, HEX1);
			
endmodule

module storeNum(clock, Resetn, in, A, B, C, D);

	input clock, Resetn;
	input [3:0] in;
	output [3:0] A, B, C, D;
	
	reg [3:0] A, B, C, D;
	
	reg [3:0] cnt = 0;
	
	always @ (posedge clock)
		if ((Resetn  == 1'b0) || (cnt == 4))	begin// synchronous clear
			A <= 4'b0000;
			B <= 4'b0000;
			C <= 4'b0000;
			D <= 4'b0000;
			cnt <= 0;
		end
		
		else if(cnt == 0) begin
			A <= in[3:0];
			cnt <= 1;
		end
		
		else if(cnt == 1) begin
			B <= in[3:0];
			cnt <= 2;
		end
		
		else if(cnt == 2) begin
			C <= in[3:0];
			cnt <= 3;
		end
		
		else if(cnt == 3) begin
			D <= in[3:0];
			cnt <= 4;
		end
		
endmodule

module seven_segment_decoder(C, Display); // defines a module for a seven segment decoder with one input and the display output
	
	input [3:0] C;				// input into seven segment
	output[0:6] Display;   	// output display
	
	reg [0:6] Display;
	
	always @ (C)
		case(C)
			4'b0000: Display = 7'b0000001;  // 0
			4'b0001: Display = 7'b1001111;  // 1
			4'b0010: Display = 7'b0010010;  // 2
			4'b0011: Display = 7'b0000110;  // 3
			4'b0100: Display = 7'b1001100;  // 4
			4'b0101: Display = 7'b0100100;  // 5
			4'b0110: Display = 7'b0100000;  // 6
			4'b0111: Display = 7'b0001111;  // 7
			4'b1000: Display = 7'b0000000;  // 8
			4'b1001: Display = 7'b0001100;  // 9 
			4'b1010: Display = 7'b0001000;  // A	 
			4'b1011: Display = 7'b1100000;  // B			
			4'b1100: Display = 7'b0110001;  // C
			4'b1101: Display = 7'b1000010;  // d
			4'b1110: Display = 7'b0000100;  // * represented by g
			4'b1111: Display = 7'b1001000;  // # represented by H
		endcase
	
endmodule

/***************
Leftover code
Main
module keypad_sim(
	input [9:0] SW,
	input KEY1, KEY0, MAX10_CLK1_50,
	output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
	output [0:9] LEDR,
	inout [3:0] GPIO_
);
	
	wire [3:0] in1, in2, in3, in4;
	wire [15:0] code, input_code;
	reg [3:0] pass_fail;
	
	wire [3:0] motor;
	assign GPIO_[3:0] = motor;
	MotorDriving Motor1 (MAX10_CLK1_50, pass_fail, SW[0], SW[1], motor, LEDR[9]);
	
	seven_segment_decoder(SW[3:0], HEX0);
	storeNum s0 (KEY1, KEY0, SW[3:0], in1, in2, in3, in4);
	seven_segment_decoder(in1, HEX5);
	seven_segment_decoder(in2, HEX4);
	seven_segment_decoder(in3, HEX3);
	seven_segment_decoder(in4, HEX2);
	
	assign input_code = {in1, in2, in3, in4};
	// password = 2798
	assign code = 16'b0010011110011000;
	
	always @*
	begin
		if(input_code == code) begin
			pass_fail = 1;   // pass
		end
		else if(input_code != code)begin
			pass_fail = 0;
		end
	end
	
	seven_segment_decoder(pass_fail, HEX1);
			
endmodule

module storeNum(clock, Resetn, in, A, B, C, D);

	input clock, Resetn;
	input [3:0] in;
	output [3:0] A, B, C, D;
	
	reg [3:0] A, B, C, D;
	
	reg [2:0] cnt = 0;
	
	always @ (posedge clock)
		if (Resetn  == 1'b0)	begin// synchronous clear
			A <= 4'b0000;
		end
		
		else if(cnt == 0) begin
			A <= in[3:0];
			cnt <= 1;
		end
		
		else if(cnt == 1) begin
			B <= in[3:0];
			cnt <= 2;
		end
		
		else if(cnt == 2) begin
			C <= in[3:0];
			cnt <= 3;
		end
		
		else if(cnt == 3) begin
			D <= in[3:0];
			cnt <= 0;
		end
		
endmodule

module seven_segment_decoder(C, Display); // defines a module for a seven segment decoder with one input and the display output
	
	input [3:0] C;				// input into seven segment
	output[0:6] Display;   	// output display
	
	reg [0:6] Display;
	
	always @ (C)
		case(C)
			4'b0000: Display = 7'b0000001;  // 0
			4'b0001: Display = 7'b1001111;  // 1
			4'b0010: Display = 7'b0010010;  // 2
			4'b0011: Display = 7'b0000110;  // 3
			4'b0100: Display = 7'b1001100;  // 4
			4'b0101: Display = 7'b0100100;  // 5
			4'b0110: Display = 7'b0100000;  // 6
			4'b0111: Display = 7'b0001111;  // 7
			4'b1000: Display = 7'b0000000;  // 8
			4'b1001: Display = 7'b0001100;  // 9 
			4'b1010: Display = 7'b0001000;  // A	 
			4'b1011: Display = 7'b1100000;  // B			
			4'b1100: Display = 7'b0110001;  // C
			4'b1101: Display = 7'b1000010;  // d
			4'b1110: Display = 7'b0000100;  // * represented by g
			4'b1111: Display = 7'b1001000;  // # represented by H
		endcase
	
endmodule
*/

/*
	wire [3:0] motor;
	assign GPIO_[3:0] = motor;
	MotorDriving Motor1 (MAX10_CLK1_50, pass_fail, SW[0], SW[1], motor, LEDR[9]);
	
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
		
		wire [3:0] in1, in2, in3, in4;
		wire [15:0] correct_code, input_code;
		reg [3:0] pass_fail;
		
		reg [3:0] cnt = 0;
		
		storeNum s0 (KEY0, 1'b1, CodeR, in1, in2, in3, in4);
		
		hex7seg(in1, 1'b1, HEX5);
		hex7seg(in2, 1'b1, HEX4);
		hex7seg(in3, 1'b1, HEX3);
		hex7seg(in4, 1'b1, HEX2);
				
		always @ (posedge clock)
		begin
			if(input_code == correct_code) begin
				pass_fail <= 1;   // pass
			end
			else if(input_code != correct_code)begin
				pass_fail <= 0;	//fail
			end
		end
		
		assign input_code = {in1, in2, in3, in4};
		// password = 2768
		assign correct_code = 16'h2768;

		hex7seg (pass_fail, 1'b1, HEX1);
		
		//hex7seg (in2, 1'b1, HEX4);
		//hex7seg (in3, 1'b1, HEX3);
		//hex7seg (in4, 1'b1, HEX2);
		
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


*/