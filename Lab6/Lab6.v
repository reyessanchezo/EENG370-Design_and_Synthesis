module Lab6 (
input [9:0] SW,
input KEY0, KEY1,
output [9:0] LEDR
);
	
	wire [8:0] DIN = SW[8:0];
	wire Resetn = KEY0, Clock = KEY1, Run = SW[9];
	wire done, Gout, DINout;
	wire Ain, Gin, IRin, AddSub;
	wire [7:0] Rout, Rin;
	wire [8:0] BusWires;
	
	assign LEDR[8:0] = BusWires;
	assign LEDR[9] = done;
	
	
	proc processor (DIN, Resetn, Clock, Run, done, Gout, DINout, Ain, Gin, IRin, AddSub, Rout, Rin, BusWires);

endmodule