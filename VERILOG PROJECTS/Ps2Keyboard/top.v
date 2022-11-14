`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:50:28 11/14/2022 
// Design Name: 
// Module Name:    ps2Keyboard 
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
module ps2Keyboard(
    input PS2C,
    input PS2D,
    output reg [7:0] Led
    );
	 
	reg [7:0] data_curr;
	reg [7:0] data_pre;
	reg [3:0] b;
	reg flag;
	
	initial
	begin
	b<=4'h1;
	flag<=1'b0;
	data_curr<=8'hf0;
	data_pre<=8'hf0;
	Led<=8'hf0;
	end
	
	always @(negedge PS2C) //Activating at negative edge of clock from keyboard
	begin
	case(b)
	1:; //first bit
	2:data_curr[0]<=PS2D;
	3:data_curr[1]<=PS2D;
	4:data_curr[2]<=PS2D;
	5:data_curr[3]<=PS2D;
	6:data_curr[4]<=PS2D;
	7:data_curr[5]<=PS2D;
	8:data_curr[6]<=PS2D;
	9:data_curr[7]<=PS2D;
	10:flag<=1'b1; //Parity bit
	11:flag<=1'b0; //Ending bit
	endcase
	 if(b<=10)
	 b<=b+1;
	 else if(b==11)
	 b<=1;
	end
	always@(posedge flag) // Printing data obtained to led
	begin
	if(data_curr==8'hf0)
	Led<=data_pre;
	 else
	 data_pre<=data_curr;
	end

	endmodule
