`timescale 1 ps / 1 ps
module spriteRom 
 #(parameter SPRITE_ROM_FILENAME)
(
  input [15:0] spriterom_indexL1,
  input [15:0] spriterom_indexL2,
  input [15:0] spriterom_indexCR1,
  input [15:0] spriterom_indexCR2,
  input [15:0] spriterom_indexCR3,
  input [15:0] spriterom_indexCR4,
  
  output [3:0] data_RL1,
  output [3:0] data_GL1,
  output [3:0] data_BL1,
  
  output [3:0] data_RL2,
  output [3:0] data_GL2,
  output [3:0] data_BL2,
  
  output [3:0] data_RCR1,
  output [3:0] data_GCR1,
  output [3:0] data_BCR1,
  
  output [3:0] data_RCR2,
  output [3:0] data_GCR2,
  output [3:0] data_BCR2,
  
  output [3:0] data_RCR3,
  output [3:0] data_GCR3,
  output [3:0] data_BCR3,
  
  output [3:0] data_RCR4,
  output [3:0] data_GCR4,
  output [3:0] data_BCR4
  );
		  
  //256 sprites each of which are 16x16 (256) in shape
  //2^16 or 65535 locations
  reg [11:0] mem [0:65535];
  
  initial
		$readmemb(SPRITE_ROM_FILENAME, mem, 0, 65535);
	
	//using part select for each 4 bits of RGB in the 12 bit data 
   assign data_RL1 = mem[spriterom_indexL1][11:8];
   assign data_GL1 = mem[spriterom_indexL1][7:4];
   assign data_BL1 = mem[spriterom_indexL1][3:0];
	
	assign data_RL2 = mem[spriterom_indexL2][11:8];
	assign data_GL2 = mem[spriterom_indexL2][7:4];
	assign data_BL2 = mem[spriterom_indexL2][3:0];	
	
	assign data_RCR1 = mem[spriterom_indexCR1][11:8];
	assign data_GCR1 = mem[spriterom_indexCR1][7:4];
	assign data_BCR1 = mem[spriterom_indexCR1][3:0];
	
	assign data_RCR2 = mem[spriterom_indexCR2][11:8];
	assign data_GCR2 = mem[spriterom_indexCR2][7:4];
	assign data_BCR2 = mem[spriterom_indexCR2][3:0];
	
	
	assign data_RCR3 = mem[spriterom_indexCR3][11:8];
	assign data_GCR3 = mem[spriterom_indexCR3][7:4];
	assign data_BCR3 = mem[spriterom_indexCR3][3:0];	
	
	assign data_RCR4 = mem[spriterom_indexCR4][11:8];
	assign data_GCR4 = mem[spriterom_indexCR4][7:4];
	assign data_BCR4 = mem[spriterom_indexCR4][3:0];
	
  
endmodule