`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:48:14 10/09/2022
// Design Name:   top
// Module Name:   C:/Users/redbr/Desktop/fpga-files/VERILOG PROJECTS/vgaTest/test.v
// Project Name:  vgaTest
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
	wire Hsync;
	wire Vsync;
	wire [2:0] OutRed;
	wire [2:0] OutGreen;
	wire [2:1] OutBlue;
	wire [0:0] Led;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.Hsync(Hsync), 
		.Vsync(Vsync), 
		.OutRed(OutRed), 
		.OutGreen(OutGreen), 
		.OutBlue(OutBlue), 
		.Led(Led), 
		.mclk(mclk)
	);

	always #5 mclk = ~mclk;
      
endmodule

