`timescale 1ns / 1ps

module IMem (clock, address, instruction);
	
	input clock;
	input [7:0] address;
	output reg [31:0] instruction;
	reg [31:0] rom [255:0];
	initial
	begin
		$readmemb("rom.txt", rom);
	end

	always @ (posedge clock)
	begin
		instruction <= rom[address];
	end

endmodule
