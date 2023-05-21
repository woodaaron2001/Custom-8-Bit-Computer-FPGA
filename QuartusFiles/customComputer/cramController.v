`timescale 1us/ 100 ns
module cramController 
   #(parameter CRAM1_FILENAME = "../../roms/cram1.hex",
	  parameter CRAM2_FILENAME = "../../roms/cram2.hex",
	  parameter CRAM3_FILENAME = "../../roms/cram3.hex",
	  parameter CRAM4_FILENAME = "../../roms/cram4.hex"
	)
(
  input clk,
  input [15:0] cpu_abus,
  input [7:0] data_bus,
  input write_en,
  input [9:0] h_cnt,
  input [9:0] v_cnt,
  input cram1_cs,
  input cram2_cs,
  input cram3_cs,
  input cram4_cs,
  
  output [7:0] cram1_out,
  output [7:0] cram2_out,
  output [7:0] cram3_out,
  output [7:0] cram4_out,
  
  output is_charLayer1,
  output is_charLayer2,
  output is_charLayer3,
  output is_charLayer4,
  
  output[15:0] spriterom_indexCR1,
  output[15:0] spriterom_indexCR2,
  output[15:0] spriterom_indexCR3,
  output[15:0] spriterom_indexCR4
);

    parameter hbp = 144;        // end of horizontal back porch
    parameter vbp = 31;         // end of vertical back porch 
	 parameter sprite_length = 16;
	 parameter spriteMem_size = 256;

	 //wires for each characterRam and their subsequent parts
	 wire [7:0] char1_active, sprite1;
	 wire [15:0] char1_x,char1_y;
	 
	 wire [7:0] char2_active, sprite2;
	 wire [15:0] char2_x,char2_y;
	 
	 wire [7:0] char3_active, sprite3;
	 wire [15:0] char3_x,char3_y;
	 
	 wire [7:0] char4_active, sprite4;
	 wire [15:0] char4_x,char4_y;

	 //Defining CRAM modules beginning at 0x3001
	 cram #(
			.CRAM_FILENAME(CRAM1_FILENAME)
		 ) cram1(
			.clk(clk),
			.cpu_abus(cpu_abus - 16'h3001),
			.data_in(data_bus),
			.write_en(~write_en & cram1_cs),
			.cpu_out(cram1_out),
			.active(char1_active),
			.charX(char1_x),
			.charY(char1_y),
			.charSprite(sprite1)
		);
		
		
		 cram #(
			.CRAM_FILENAME(CRAM2_FILENAME)
		 ) cram2(
			.clk(clk),
			.cpu_abus(cpu_abus - 16'h3007),
			.data_in(data_bus),
			.write_en(~write_en & cram1_cs),
			.cpu_out(cram2_out),
			.active(char2_active),
			.charX(char2_x),
			.charY(char2_y),
			.charSprite(sprite2)
		);
		
	 cram #(
			.CRAM_FILENAME(CRAM3_FILENAME)
		 ) cram3(
			.clk(clk),
			.cpu_abus(cpu_abus - 16'h300D),
			.data_in(data_bus),
			.write_en(~write_en & cram3_cs),
			.cpu_out(cram3_out),
			.active(char3_active),
			.charX(char3_x),
			.charY(char3_y),
			.charSprite(sprite3)
		);
		
	 cram #(
			.CRAM_FILENAME(CRAM4_FILENAME)
		 ) cram4(
			.clk(clk),
			.cpu_abus(cpu_abus - 16'h3013),
			.data_in(data_bus),
			.write_en(~write_en & cram1_cs),
			.cpu_out(cram4_out),
			.active(char4_active),
			.charX(char4_x),
			.charY(char4_y),
			.charSprite(sprite4)
		);
		
	 //Handling logic for which pixel to draw for the character as h_cnt increases 
	 assign spriterom_indexCR1 = ((v_cnt-vbp) - char1_y) * sprite_length +((h_cnt-hbp) - char1_x) + sprite1 * spriteMem_size;
	 assign spriterom_indexCR2 = ((v_cnt-vbp) - char2_y) * sprite_length +((h_cnt-hbp) - char2_x) + sprite2 * spriteMem_size;	 
	 assign spriterom_indexCR3 = ((v_cnt-vbp) - char3_y) * sprite_length +((h_cnt-hbp) - char3_x) + sprite3 * spriteMem_size;	 
	 assign spriterom_indexCR4 = ((v_cnt-vbp) - char4_y) * sprite_length +((h_cnt-hbp) - char4_x) + sprite4 * spriteMem_size;	 
	 
	 //deciding which character to display
	 assign is_charLayer1 = (char1_active && (h_cnt-hbp) >= char1_x && (h_cnt-hbp) < char1_x+16 && (v_cnt-vbp) >= char1_y && (v_cnt-vbp) < char1_y+16);
	 assign is_charLayer2 = (char2_active && (h_cnt-hbp) >= char2_x && (h_cnt-hbp) < char2_x+16 && (v_cnt-vbp) >= char2_y && (v_cnt-vbp) < char2_y+16);
	 assign is_charLayer3 = (char3_active && (h_cnt-hbp) >= char3_x && (h_cnt-hbp) < char3_x+16 && (v_cnt-vbp) >= char3_y && (v_cnt-vbp) < char3_y+16);
	 assign is_charLayer4 = (char4_active && (h_cnt-hbp) >= char4_x && (h_cnt-hbp) < char4_x+16 && (v_cnt-vbp) >= char4_y && (v_cnt-vbp) < char4_y+16);
	

endmodule