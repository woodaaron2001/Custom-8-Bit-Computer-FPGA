`timescale 1us/ 100 ns
module cram 
   #(parameter CRAM_FILENAME)
(
  input clk,
  input [15:0] cpu_abus,
  input [7:0] data_in,
  input write_en,
  
  output reg [7:0] cpu_out,
  output [7:0] active,
  output [15:0] charX,
  output [15:0] charY,
  output [7:0] charSprite
  
);

	//SPRITES IN MEMORY ARE SET OUT LIKE THIS
	//00000000 ISACTIVE - CHECKS WHETER WE NEED TO DRAW THIS ON THE SCREEN OR NOT 
	//00000000 CHARX first 8 bits
	//00000000 CHARX last 8 bits
	//00000000 CHARY first 8 bits
	//00000000 CHARY last 8 bits
	//00000000 sprite index of the character sprite in the spriterom
	
	reg [7:0] mem[0:5];
	
	
	initial begin
		$readmemh(CRAM_FILENAME, mem, 0, 5);
	end

	always @(posedge clk) begin
	  cpu_out <= mem[cpu_abus];
	  if(write_en) mem[cpu_abus] <= data_in;
	end
	
	//concatention operators used to merge the 2 registers for X and Y
	assign active = mem[0];
	assign charX = {mem[2],mem[1]};
	assign charY = {mem[4],mem[3]};
	assign charSprite = mem[5];
	

endmodule