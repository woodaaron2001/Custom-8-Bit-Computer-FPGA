`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:59:58 10/06/2022
// Design Name:   top
// Module Name:   C:/Users/redbr/ise_projects/helloBasys/stimulus.v
// Project Name:  helloBasys
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

module stimulus;

	// Inputs
	reg mclk;

	// Outputs
	wire [3:0] Led;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.mclk(mclk), 
		.Led(Led)
	);

	initial begin
		// Initialize Inputs
		mclk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#50 mclk = 1;
		#50 mclk = 0;
		#50 mclk = 1;
	end
	
	initial begin
		$monitor("mclk=%d,led0=%d,led1=%d,led2=%d,led3=%d",mclk,Led[0],Led[1],Led[2],Led[3]);
	end
      
endmodule

