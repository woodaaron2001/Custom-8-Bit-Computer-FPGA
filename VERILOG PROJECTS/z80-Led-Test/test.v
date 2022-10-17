`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:33:25 10/17/2022
// Design Name:   top
// Module Name:   C:/Users/redbr/Desktop/fpga-files/VERILOG PROJECTS/z80-Led-Test/test.v
// Project Name:  z80-Led-Test
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg mclk = 0;

	// Outputs
	wire [7:0] Led;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.mclk(mclk), 
		.Led(Led)
	);

	always #5 mclk = ~mclk;
      
endmodule

