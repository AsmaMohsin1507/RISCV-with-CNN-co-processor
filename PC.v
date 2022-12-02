`timescale 1ns / 1ps

module PC (clock, reset, En, count);
	
	input clock, reset, En;
	output reg [7:0] count;
	
	always @ (posedge clock or negedge reset)
	begin
		if (!reset)
			count <= 0;
		else if (En == 1'b1)
			count <= count + 1;
	end
	
endmodule
