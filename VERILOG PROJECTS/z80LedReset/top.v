`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:39 10/23/2022 
// Design Name: 
// Module Name:    top 
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
module top(
    input mclk,
    input reset,
    output [7:0] Led
    );
	 
	  integer count = 0;
	 reg clk_out = 0;
	 
	 always@(posedge mclk)
	 begin
	 count<= count+1;
	 if(count==10_000)
	 begin
	 count <= 0;
	 clk_out = ~clk_out;
	 end
	 end
	 
	 
	 reg [7:0] DataHold = 0;
	 
	 wire [7:0] data;
	 wire [8:0] tmp;
	 
	 z80_top_direct_n inst1 
	 (.CLK(clk_out),
	  .nWAIT(~reset),
	  .nINT(~reset),
	  .nNMI(~reset),
	  .nRESET(~reset),
	  .nBUSRQ(~reset),
	  .D(data),
	  .A({Led[7:0],tmp}) );


endmodule
