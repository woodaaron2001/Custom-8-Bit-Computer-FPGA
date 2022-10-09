`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:35:32 10/09/2022 
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
    output Hsync,
    output Vsync,
    output [2:0] OutRed,
    output [2:0] OutGreen,
    output [2:1] OutBlue,
    output [0:0] Led,
    input mclk
    );

	 integer count = 0;
	 reg clk_out;
	 
	 always@(posedge mclk)
	 begin
	 count<= count+1;
	 if(count==1)
	 begin
	 count <= 0;
	 clk_out = ~clk_out;
	 end
	 end
	 
	 wire enable_V_Count;
	 wire [15:0] H_Count_Value;
	 wire [15:0] V_Count_Value;
	 
	 HCounter vgaH(mclk,enable_V_Count,H_Count_Value);
	 VCounter vgaV(mclk,enable_V_Count,V_Count_Value);
	 
	 
	assign Hsync = (H_Count_Value < 96) ? 1'b1:1'b0;
	assign Vsync = (H_Count_Value < 2) ? 1'b1:1'b0;
	
	assign OutRed=  (H_Count_Value < 784 && H_Count_Value > 143 && V_Count_Value <515 && V_Count_Value >35) ? 3'hF:3'h0;
	assign OutGreen =  (H_Count_Value < 784 && H_Count_Value > 143 && V_Count_Value <515 && V_Count_Value >35) ? 3'hF:3'h0;
	assign OutBlue =  (H_Count_Value < 784 && H_Count_Value > 143 && V_Count_Value <515 && V_Count_Value >35) ? 3'hF:3'h0;
	assign Led = mclk;

endmodule
