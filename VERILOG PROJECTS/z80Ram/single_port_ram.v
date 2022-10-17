`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:58 10/17/2022 
// Design Name: 
// Module Name:    single_port_ram 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module single_port_ram(
    input clk,
    input we,
    input [7:0] data,
    input [5:0] addr,
    output [7:0] q
    );
	 
	 reg [7:0] ram [63:0];
	 
	 reg [5:0] addr_reg;
	 
	 always @ (posedge clk)
	 begin
			if ( we )
				ram[addr] <= data;
			else
				addr_reg <= addr;
	 end
	 
	 assign q  = ram[addr_reg];
	 
endmodule
