`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:02:15 10/17/2022 
// Design Name: 
// Module Name:    testAddRom 
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
module testAddRom(
    input clk,
    input rd,
    input [3:0] addr,
    output [7:0] data_out
    );
	
	reg [7:0] rom [0:3];
	
	always @(posedge clk)
	begin
		if(rd)
		data_out <= rom[addr]
	end
	
	initial
	begin
	rom[0] = 8'd108;
	rom[1] = 8'd108;
	rom[2] = 8'd108;
	rom[3] = 8'd108;
	rom[4] = 8'd108;
	rom[5] = 8'd108;
	rom[6] = 8'd108;
	rom[7] = 8'd108;
	rom[8] = 8'd108;
	rom[9] = 8'd108;
	rom[10] = 8'd108;
	rom[11] = 8'd108;
	rom[12] = 8'd108;
	rom[13] = 8'd108;
	rom[14] = 8'd108;
	rom[15] = 8'd108;	
	end
endmodule
