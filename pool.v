
`timescale 1ns / 1ps

module pool (X1, X2, X3, X4, D);
	
	parameter I = 4;
	parameter S = I*I;
	parameter N = 8;
	parameter O = I/2;
	parameter PS = 2;

	
	input [N-1:0] X1, X2, X3, X4;
	output reg [N-1:0] D;
	
	always@(*)
	begin
		D = X1;
		if (X2 > D)
			D = X2;
		if (X3 > D)
			D = X3;
		if (X4 > D)
			D = X4;
	end

	
endmodule
