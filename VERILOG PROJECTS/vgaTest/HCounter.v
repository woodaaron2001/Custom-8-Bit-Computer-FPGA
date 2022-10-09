`timescale 1ns / 1ps

module HCounter(
    input clk,
    output reg enable_V_Counter,
    output reg [15:0] H_Count
    );
	
	always@(posedge clk) begin
		if (H_Count < 799) begin
			H_Count <= H_Count + 1;
			enable_V_Counter <= 0;
		end
		else begin
			H_Count <= 0;
			enable_V_Counter <= 1;
		end
	end
	
endmodule
