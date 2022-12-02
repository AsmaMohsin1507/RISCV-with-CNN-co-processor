`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:29:25 08/26/2021
// Design Name:   CNN
// Module Name:   E:/Xilinx/CNN/ISA_CNN/ISA_tb.v
// Project Name:  ISA_CNN
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CNN
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ISA_tb;

	// Inputs
	reg clock;
	reg reset;

	// Outputs
	wire [7:0] Res_reg;

	// Instantiate the Unit Under Test (UUT)
	CNN uut (
		.clock(clock), 
		.reset(reset), 
		.Res_reg(Res_reg)
	);
	
	initial
	 begin
		repeat(36)
		begin
		 clock = 1'b0;
		 clock = #10 1'b1;
		 # 10;
		end
		clock = 1'b0;
	 end

	initial begin
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		reset = 1;
        
		// Add stimulus here

	end
      
endmodule

