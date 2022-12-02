
`timescale 1ns / 1ps

module ReLu (x ,y);
	
	parameter N = 8;
	
	input signed [N-1:0] x;
	output reg [N-1:0] y;
	
	wire s = (x > 0);
	
	always@(*)
	begin
		if (s)
			y = x;
		else
			y = 0;
	end
	
endmodule

