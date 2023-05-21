`timescale 1us/ 100 ns
module rom # (
	parameter ROM_FILENAME = "../roms/test.hex"
)
(
  input [15:0] addr,
  output [7:0] data 
  
  );
  
  //12k of memory across 8 bit registers
  reg [7:0] mem [0:12286]; 
 
  initial
		$readmemh(ROM_FILENAME, mem, 0, 12286);
	
	assign data = mem[addr];
	
endmodule
