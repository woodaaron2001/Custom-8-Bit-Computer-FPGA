`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:31 10/09/2022 
// Design Name: 
// Module Name:    VCounter 
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
module VCounter(
    input clk,
    input  enable_V_Counter,
    output reg [15:0] V_Count
    );
	
	always@(posedge clk) begin
		if(enable_V_Counter == 1'b1) begin
			if (V_Count < 524 && enable_V_Counter == 1'b1)
				V_Count <= V_Count + 1;
			else
				V_Count <= 0;
		end
	end

endmodule
