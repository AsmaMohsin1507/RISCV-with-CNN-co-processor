
`timescale 1ns / 1ps

module ALU (I_out, F_out, c, a, p);
	
	parameter N = 8;							// Data Width
	parameter M_AW = 10;						// Address Width -> Image memory
	parameter F_AW = 3;						// Address Width -> Filter memory
	parameter FIL = 3;
	parameter IMG = 28;
	parameter IOUT = 10*N;
	parameter FOUT = 9*N;
	
	input [IOUT-1:0] I_out;
	input [FOUT-1:0] F_out;
	output [N-1:0] c, a, p;
	//assign c = 0;
	
	wire [FOUT-1:0] c_in = I_out[FOUT-1:0];
	wire [N-1:0] a_in = I_out[0*N +: N];
	wire [N-1:0] p_in [3:0];
	assign p_in[0] = I_out[9*N +: N];
	assign p_in[1] = I_out[2*N +: N];
	assign p_in[2] = I_out[1*N +: N];
	assign p_in[3] = I_out[0*N +: N];
	
	conv CN (c_in, F_out, c);
	
	ReLu ACTI(a_in, a);
	
	pool POOOHL(p_in[0], p_in[1], p_in[2], p_in[3], p);
	
endmodule


