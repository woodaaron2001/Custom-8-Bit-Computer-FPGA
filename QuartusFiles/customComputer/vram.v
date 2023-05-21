`timescale 1us/ 100 ns
module vram 
   #(parameter VRAM_FILENAME)
(
  input cpu_clk,
  input vga_clk,
  input [10:0] vga_abus,
  input [15:0] cpu_abus,
  input [7:0] data_in,
  input write_en,
  
  
  output reg [7:0] vga_out,
  output reg [7:0] cpu_out
);
	
	//30x40 sprites = 1200 Locations
	reg [7:0] mem[0:1199];
	
	
	initial begin
		$readmemh(VRAM_FILENAME, mem, 0, 1199);
	end

	//handle update of the memory via z80
	always @(posedge cpu_clk) begin
	  cpu_out <= mem[cpu_abus];
	  if(write_en) mem[cpu_abus] <= data_in;
	end
		
	//handle memory addressing via the VGA controller
	always @(posedge vga_clk) begin
	  vga_out <= mem[vga_abus];	
	end

endmodule