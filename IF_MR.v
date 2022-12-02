`timescale 1ns / 1ps

module IF_MR (clock, reset, instruction, instr_reg);
	
	input clock, reset;
	input [31:0] instruction;
	output reg [31:0] instr_reg;
	
	always @ (posedge clock or negedge reset)
	begin
		if (!reset)
			instr_reg <= 0;
		else
			instr_reg <= instruction;
	end
	
endmodule
