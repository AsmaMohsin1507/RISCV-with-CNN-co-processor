
`timescale 1ns / 1ps

module conv (I_in, F_in, c);

	parameter N = 8;							// Data Width
	parameter M_AW = 13;						// Address Width -> Image memory
	parameter F_AW = 4;						// Address Width -> Filter memory
	parameter FIL = 3;
	parameter IMG = 28;
	parameter OUT = FIL*FIL*N;
	
	input [OUT-1:0] F_in, I_in;
	output reg [N-1:0] c;
	integer i, j;
	always @ (*)
	begin
		c = 0;
		for (i = 0; i < FIL; i = i + 1)
		begin
			for (j = 0; j < FIL; j = j + 1)
			begin
				c = c + (I_in[((FIL*i) + j)*N +: N])*(F_in[((FIL*i) + j)*N +: N]);
			end
		end
	end
	
endmodule
