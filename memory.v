
`timescale 1ns / 1ps

module memory (clock, wren, src1, src2, dest, D, I_out, F_out);

	parameter N = 8;							// Data Width
	parameter M_AW = 10;						// Address Width -> Image memory
	parameter F_AW = 3;						// Address Width -> Filter memory
	parameter FIL = 3;
	parameter IMG = 28;
	parameter IOUT = 10*N;
	parameter FOUT = 9*N;

	input [M_AW-1:0] src1, dest;			// src1 -> Input Image/feature-map
													// src2 -> filter
	input [F_AW-1:0] src2;					// dest -> Address for output feature-map
	
	input clock, wren;						// clock & Write Enable
	
	input [N-1:0] D;
	
	output [IOUT-1:0] I_out;
	output [FOUT-1:0] F_out;
	
	
	Image F_M (clock, wren, src1, dest, D, I_out);
	Kernel ker (clock, src2, F_out);
	
	
endmodule


module Image (clock, wren, src, dest, in_data, out_data);
	
	parameter N = 8;							// Data Width
	parameter M_AW = 10;						// Address Width -> Image memory
	parameter F_AW = 3;						// Address Width -> Filter memory
	parameter FIL = 3;
	parameter IMG = 28;
	parameter IOUT = 10*N;
	parameter FOUT = 9*N;
	
	input [M_AW-1:0] src, dest;			// src1 -> Input Image/feature-map
													// dest -> Address for output feature-map
	input clock, wren;						// clock & Write Enable
	
	input [N-1:0] in_data;
	
	output reg [IOUT-1:0] out_data;
	
	reg [N-1:0] MRAM [(2**M_AW)-1:0];
	
	initial
	begin
		$readmemb("Img.txt", MRAM);
	end
	
	integer i, j;
	
	always @ (posedge clock)
	begin
		if (wren)
			MRAM[dest] <= in_data;
		
//		for (i = 0; i < FIL; i = i + 1)
//		begin
//			for (j = 0; j < FIL; j = j + 1)
//			begin
//				out_data[((FIL*i) + j)*N +: N] <= RAM[src + (i*IMG) + j];
//			end
//		end
		
		
		out_data[(0)*N +: N] <= MRAM[src + 0];
		out_data[(1)*N +: N] <= MRAM[src + 1];
		out_data[(2)*N +: N] <= MRAM[src + 2];
		out_data[(3)*N +: N] <= MRAM[src + 28];
		out_data[(4)*N +: N] <= MRAM[src + 29];
		out_data[(5)*N +: N] <= MRAM[src + 30];
		out_data[(6)*N +: N] <= MRAM[src + 56];
		out_data[(7)*N +: N] <= MRAM[src + 57];
		out_data[(8)*N +: N] <= MRAM[src + 58];
		out_data[(9)*N +: N] <= MRAM[src + 3];
		
		
	end
	
endmodule


module Kernel (clock, src, out_data);
	
	parameter N = 8;							// Data Width
	parameter M_AW = 10;						// Address Width -> Image memory
	parameter F_AW = 3;						// Address Width -> Filter memory
	parameter FIL = 3;
	parameter IMG = 28;
	parameter IOUT = 10*N;
	parameter FOUT = 9*N;
	
	input [F_AW-1:0] src;					// src2 -> Input Address of Filter
													
	input clock;								// clock
	
	output reg [FOUT-1:0] out_data;
	
	reg [FOUT-1:0] FRAM [(2**F_AW)-1:0];
	
	
	initial
	begin
		$readmemb("Filter.txt", FRAM);
	end
	
	always @ (posedge clock)
	begin
		out_data <= FRAM[src];
	end
	
endmodule
