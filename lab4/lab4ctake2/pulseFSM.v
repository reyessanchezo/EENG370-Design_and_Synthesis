module pulseFSM (clk, trigger, code, rst, length, light);
	input clk, rst, trigger;
	input [3:0] code, length;
	output reg light;
	reg [3:0] count, i;
	
	//State Params
	parameter Init = 0, Wait = 1, Short = 2, Long = 3, End = 4;
	//State regs
	reg [3:0] y_Q, y_D; 
	
	always @(posedge clk) 
		if(!rst) begin
			begin: state_table
				case (y_Q) // state transitions
					Init: 
						if (trigger)
							y_Q = Wait;
						else 
							y_Q = Init;
					Wait: begin
						if (i == length)
							y_Q = End;
						else if (code[i] == 0)
							y_Q = Short;						 
						else
							y_Q = Long;
						end
					Short: 
						begin y_Q = Wait; i = i + 1; end
					Long: 
						if(count < 3)
							y_Q = Long;
						else
							begin y_Q = Wait;  i = i + 1; end
					End: y_Q = Init;
					default: y_Q = Init;
				endcase
			end

			case (y_Q) //state actions
				Wait: begin light = 0; count = 0; end
				Short:begin light = 1; count = 0; end
				Long: begin light = 1; count = count + 1; end
				End:  begin light = 0; count = 0; i = 0; end
			endcase
		end
	else
		begin
			light = 0;
			count = 0;
			y_Q = Init;
			i = 0;
		end
	
	
endmodule