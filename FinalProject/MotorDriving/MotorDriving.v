module MotorDriving (
input Clock50MHz, Trigger, MotorDir, MotorEnable
output [3:0] MotorPinsinput
);

	button_debouncer Trigger_debounce (Clock50MHz, 1'b1, Trigger, trigger_db);
	
	assign MotorPins[0] = ~MotorEnable;
	assign MotorPins[1] = 0;
	assign MotorPins[2] = MotorStep;
	assign MotorPins[3] = MotorDir;

	timer SlowPulse (Clock50MHz, 1, clk, 1);
	pulseFSM MotorPulsing (clk, trigger_db, MotorStep);
	
endmodule

module pulseFSM (clk, go, pulse, done);
	input clk, go;
	reg [25:0] I;
	output reg pulse, done;
	//output reg [6:0] disp;
	parameter Wait = 2'b00, pinON = 2'b01, pinOFF = 2'b10, num = 4'h0;
	reg [2:0] y_Q, y_D; //State regs
	
	always @(posedge clk) begin
		begin: state_table
			case (y_Q) // case transitions
				Wait: if (go) y_Q = pinON;
					else y_Q = Wait;
					
				pinON: y_Q = pinOFF;
				
				pinOFF: if(I < 384) y_Q = pinON; 
					else y_Q = Wait; //384 pulses per revolution
					
				default: y_Q = Wait;
			endcase
		end
		
		case (y_Q) //case actions
			Wait: begin
				pulse = 0;
				I = 0;
			end
			
			pinON: begin
				pulse = 1;
			end
			
			pinOFF: begin
				pulse = 0;
				I = I + 1;
			end
			
		endcase
	end
	
	
endmodule 

//Timer module that brings clock down to lower frequency. Change Q == N to desired value.
//Q = Clock/(DesiredFreq) //Q = 50MHz/200Hz = 250000
module timer (Clock, Reset_n, tc, resume); //MAX10Clock, 1, outputpulse, 1
	parameter n = 26;
	
	input Clock, Reset_n, resume;
	reg [n-1:0] Q;
	output reg tc; //terminal count, output pulse
		
	always @(posedge Clock) 
		begin
		if (Q == 250000)  // 200 Hz, where stepper has most torque is 250,000; 
				begin
				Q <= 1'd0;
				tc <= 1'b1;
				end
			else
				begin
				if(resume)
					begin
						Q <= Q + 1'b1;
						tc <= 1'b0;
					end
				end
		end
endmodule

//Debounce module from Intel
module button_debouncer	( 
							clk,
							rst_n,
							data_in,
							data_out			
						);
					
input						clk;
input						rst_n;
input						data_in;
output						data_out;
									

//=======================================================
//  REG/WIRE declarations
//=======================================================
parameter	preset_val 	= 0;
parameter 	counter_max = 100000; 


reg						data_out;									
reg						data_in_0;	
reg						data_in_1;
reg						data_in_2;
reg						data_in_3;
reg			[20:0]		counter;
	
//=======================================================
//  Structural coding
//=======================================================

always	@(posedge clk or negedge rst_n)
begin
	if	(!rst_n)
	begin
		data_out		<=	preset_val;
		counter			<=	counter_max;
		data_in_0		<=	0;
		data_in_1		<=	0;
		data_in_2		<=	0;
		data_in_3		<=	0;			
	end else begin
		if	(counter == 0) 
		begin
			data_out	<=	data_in_3;
			counter		<=	counter_max;
		end else begin
			counter		<=	counter - 1;
		end
		data_in_0	<=	data_in;	
		data_in_1	<=	data_in_0;
		data_in_2	<=	data_in_1;
		data_in_3	<=	data_in_2;
	end
end
			
				

endmodule