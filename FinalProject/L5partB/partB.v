module partB (SW, LEDR, GPIO_);
	input [9:0] SW;
	inout [35:0] GPIO_;
	output [9:0] LEDR;
	
	wire [3:0] cols,rows;
	assign GPIO_[3:0] = cols;
	assign rows = GPIO_[7:4];
	assign cols = SW[3:0];
	assign LEDR[7:4] = rows;
	assign LEDR[3:0] = cols;
	
	/*
	state machine
	
	*/
	parameter Init = 0, Wait = 1, Row1 = 2, Row2 = 3, Row3 = 4, End = 5;
	
	
	
endmodule 

module fsm (
  input clk,
  input reset,
  input start,
  output reg done
);

	parameter INIT = 0, WAIT = 1, ROW1 = 2, ROW2 = 3, ROW3 = 4, ROW4 = 5, END = 6;

	// Define state register and next state logic
	reg [2:0] state, next_state;

	always @(posedge clk or posedge reset) begin
	  if (reset) begin
		 state <= INIT;
	  end else begin
		 state <= next_state;
	  end
	end

	// Define state actions
	always @(*) begin
	  case (state)
		 INIT: begin
			// TODO: State actions for INIT state
		 end
		 WAIT: begin
			// TODO: State actions for WAIT state
		 end
		 ROW1: begin
			// TODO: State actions for ROW1 state
		 end
		 ROW2: begin
			// TODO: State actions for ROW2 state
		 end
		 ROW3: begin
			// TODO: State actions for ROW3 state
		 end
		 ROW4: begin
			// TODO: State actions for ROW4 state
		 end
		 END: begin
			// TODO: State actions for END state
			done <= 1; // Example action: set output signal to indicate done
		 end
		 default: begin
			// TODO: State actions for undefined states
		 end
	  endcase
	end

	// Define state transitions
	always @(*) begin
	  case (state)
		 INIT: begin
			if (start) begin
			  next_state = WAIT;
			end else begin
			  next_state = INIT;
			end
		 end
		 WAIT: begin
			// TODO: State transitions for WAIT state
		 end
		 ROW1: begin
			// TODO: State transitions for ROW1 state
		 end
		 ROW2: begin
			// TODO: State transitions for ROW2 state
		 end
		 ROW3: begin
			// TODO: State transitions for ROW3 state
		 end
		 ROW4: begin
			// TODO: State transitions for ROW4 state
		 end
		 END: begin
			// TODO: State transitions for END state
			next_state = INIT; // Example transition: loop back to INIT state
		 end
		 default: begin
			// TODO: State transitions for undefined states
			next_state = INIT; // Example transition: loop back to INIT state
		 end
	  endcase
	end

endmodule
