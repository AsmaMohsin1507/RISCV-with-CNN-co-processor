`timescale 1ns / 1ps

module control (opcode, func, R_out, W_en);
	
	input [6:0] opcode;
	input [1:0] func;
	
	output [1:0] R_out;
	output W_en;
	
	assign R_out = func;
	assign W_en = (opcode == 7'b0001011) ? 1'b1: 1'b0;
	
endmodule
