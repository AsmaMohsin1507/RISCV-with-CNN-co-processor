
`timescale 1ns / 1ps

module Ex_MW (clock, reset, Res, dest, W_en, Res_reg, Wen_reg, dest_reg);
	
	parameter N = 8;
	
	input clock, reset;
	input [N-1:0] Res;
	input W_en;
	input [9:0] dest;
	
	output reg [N-1:0] Res_reg;
	output reg Wen_reg;
	output reg [9:0] dest_reg;
	
	always @ (posedge clock or negedge reset)
	begin
		if (!reset)
		begin
			Res_reg <= 0;
			Wen_reg <= 0;
			dest_reg <= 0;
		end
		
		else
		begin
			Res_reg <= Res;
			Wen_reg <= W_en;
			dest_reg <= dest;
		end
	end
	
endmodule
