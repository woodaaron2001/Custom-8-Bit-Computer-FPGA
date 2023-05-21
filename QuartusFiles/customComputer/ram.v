`timescale 1us/ 100 ns
module ram 
   #(parameter RAM_FILENAME = "../roms/emptyRam.hex")
(
  input clk,
  input [14:0] addr,
  input [7:0] data_in,
  input write_en,
  input read_en,
  output reg[7:0] data_out
);

	reg [7:0] mem[0:50822];
	
	
	initial begin
		$readmemh(RAM_FILENAME, mem, 0, 50822);
	end
	
   //SYNC Memory access 
	always @(posedge clk) begin
     data_out <= mem[addr];
     if (write_en) mem[addr] <= data_in;
	end
	
	

endmodule