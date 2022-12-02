`timescale 1ns / 1ps

module MR_Ex (clock, reset, I_out, F_out, W_en, R_out, dest, Iout_reg, Fout_reg, Wen_reg, Rout_reg, dest_reg);
	
	parameter N = 8;							// Data Width
	parameter M_AW = 10;						// Address Width -> Image memory
	parameter F_AW = 3;						// Address Width -> Filter memory
	parameter FIL = 3;
	parameter IMG = 28;
	parameter IOUT = 10*N;
	parameter FOUT = 9*N;
	
	input clock, reset;
	input [IOUT-1:0] I_out;
	input [FOUT-1:0] F_out;
	input [1:0] R_out;
	input W_en;
	input [9:0] dest;
	
	output reg [IOUT-1:0] Iout_reg;
	output reg [FOUT-1:0] Fout_reg;
	output reg [1:0] Rout_reg; 
	output reg Wen_reg;
	output reg [9:0] dest_reg;
	reg [1:0] Rout_reg1;
	reg [9:0] dest_reg1;
	
	always @ (posedge clock or negedge reset)
	begin
		if (!reset)
		begin
			Iout_reg <= 0;
			Fout_reg <= 0;
			Rout_reg <= 0;
			Rout_reg1 <= 0;
			Wen_reg <= 0;
			dest_reg <= 0;
			dest_reg1 <= 0;
		end
		else
		begin
			Iout_reg <= I_out;
			Fout_reg <= F_out;
			Rout_reg1 <= R_out;
			Rout_reg <= Rout_reg1;
			Wen_reg <= W_en;
			dest_reg <= dest_reg1;
			dest_reg1 <= dest;
		end
	end
	
endmodule
