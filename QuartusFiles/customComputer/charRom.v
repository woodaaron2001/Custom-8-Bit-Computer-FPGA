`timescale 1 ps / 1 ps
module charRom 
	#(parameter CHAR_ROM_FILENAME)
(
  input [14:0] charrom_index,
  output [3:0] data_R,
  output [3:0] data_G,
  output [3:0] data_B
 
  );

  //64 character sprites 256 pixels each - 2^14
  reg [11:0] mem [0:16383];
  
  initial
		$readmemb(CHAR_ROM_FILENAME, mem, 0, 16383);
	
   assign data_R = mem[charrom_index][11:8];
   assign data_G = mem[charrom_index][7:4];
   assign data_B = mem[charrom_index][3:0];
	
  
endmodule