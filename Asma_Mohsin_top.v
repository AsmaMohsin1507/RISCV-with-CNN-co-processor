
// PC
// Instruction Mem
// Data Mem
// ALU
//		conv unit
//		ReLu unit
//		pool unit
//
// MUX
// Control Signals
// Flip Flops for Pipelining


module Asma_Mohsin_top (input [1:0] io_in,
  output [7:0] io_out);
	
	parameter N = 8;							// Data Width
	parameter M_AW = 10;						// Address Width -> Image memory
	parameter F_AW = 3;						// Address Width -> Filter memory
	parameter FIL = 3;
	parameter IMG = 28;
	parameter IOUT = 10*N;
	parameter FOUT = 9*N;
	wire clock, reset;
	
	assign clock = io_in[0];
	assign reset= io_in[1];
	
	output [N-1:0] io_out;
	
	
	wire [9:0] src1 = instr_reg [31:22];
	wire [2:0] src2 = instr_reg [21:19];
	wire [9:0] dest = instr_reg [18:9];
	wire [1:0] func = instr_reg [8:7];
	wire [6:0] opcode = instr_reg [6:0];
	
	wire [N-1:0] Res;
	wire [1:0] R_out, Rout_reg;
	wire [N-1:0] c, a, p;
	wire [IOUT-1:0] I_out, Iout_reg;
	wire [FOUT-1:0] F_out, Fout_reg;
	wire pc_en, DM_en, DMen_reg, DMen_reg2;
	wire [7:0] I_addr;			// instruction counter
	wire [31:0] instruction, instr_reg;
	wire [9:0] dest_reg, dest_reg1;
		
	
	PC Instr_counter (clock, reset, 1, I_addr);
	IMem Instr_Mem (clock, I_addr, instruction);
	
	IF_MR P1 (clock, reset, instruction, instr_reg);
	
	control unit (opcode, func, R_out, DM_en);
	memory Data_Mem (clock, DMen_reg2, src1, src2, dest_reg1, io_out, I_out, F_out);
	
	MR_Ex P2 (clock, reset, I_out, F_out, DM_en, R_out, dest, Iout_reg, Fout_reg, DMen_reg, Rout_reg, dest_reg);

	ALU Arithmetic (Iout_reg, Fout_reg, c, a, p);
	
	Ex_MW P3 (clock, reset, Res, dest_reg, DMen_reg, io_out, DMen_reg2, dest_reg1);
	
	op_MUX multiplexer (c, a, p, Res, Rout_reg);
	
//	Ex_MW P3 (clock, reset, Res, DMen_reg, Res_reg, DMen_reg2);
	
endmodule


