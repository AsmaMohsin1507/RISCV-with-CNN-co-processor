`timescale 1ns / 1ps

module op_MUX (c, a, p, Res, op);
	
	parameter N = 8;	
	
	input [N-1:0] c, a, p;
	input [1:0] op;
	output reg [N-1:0] Res;
	
	always @ (*)
	begin
		if (op == 2'b00)
			Res = c;
		else if (op == 2'b01)
			Res = a;
		else if (op == 2'b10)
			Res = p;
		else 
			Res = 8'b0;
	end
	
endmodule
