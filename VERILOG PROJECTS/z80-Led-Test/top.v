`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:45:26 10/08/2022 
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
    output [7:0] Led
    );
	 
	 reg [25:0] count;
	 reg clk_out;
	 
	 always@(posedge mclk)
	 begin
	 count<= count+1;
	 if(count==5_000_000)
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
	  .nM1(Led[0]),
	  .nWAIT(1),
	  .nINT(1),
	  .nNMI(1),
	  .nRESET(1),
	  .nBUSRQ(1),
	  .D(data),
	  .A({tmp,Led[7:1]}) );
	 
	 

endmodule
