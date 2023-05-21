module vgaController
# (
	 parameter CHAR_ROM_FILENAME = "../../roms/charSprites.bin",
    parameter SPRITE_ROM_FILENAME = "../../roms/sprites.bin",
	 parameter VRAML1_FILENAME = "../../roms/vramL1.hex",
	 parameter VRAML2_FILENAME = "../../roms/vramL2.hex"
	 )
(
	input vga_clk,
	input cpu_clk,
	input rst,
	input[7:0] data_bus,
	input[15:0] address_bus,
	input z80_write,
	input vramL1_cs,
	input vramL2_cs,
	input cram1_cs,
	input cram2_cs,
	input cram3_cs,
	input cram4_cs,
	
	output h_sync,
	output v_sync,
	output[3:0] v_red,
	output[3:0] v_green,
	output[3:0] v_blue,
	output[7:0] vramL1_out,
	output[7:0] vramL2_out,
	output[7:0] cram1_out,
	output[7:0] cram2_out,
	output[7:0] cram3_out,
	output[7:0] cram4_out
);

    parameter h_pixels = 799;   // horizontal pixels per line
    parameter v_lines = 520;    // vertical lines per frame
    parameter h_pulse = 96;     // hsync pulse length
    parameter v_pulse = 2;      // vsync pulse length
    parameter hbp = 144;        // end of horizontal back porch
    parameter hfp = 784;        // beginning of horizontal front porch
    parameter vbp = 31;         // end of vertical back porch
    parameter vfp = 511;        // beginning of vertical front porch
	 	 
	 
	 parameter screen_width = 640; 
	 parameter screen_height = 480;
	 parameter sprite_length = 16;
	 parameter hSprite_count = 40;
	 parameter vSprite_count = 30;
	 parameter spriteMem_size = 256;
	 	
    //VSYNC	and HSYNC timings reference Alan Garfield's Apple 1 
	 reg [9:0] h_cnt;
    reg [9:0] v_cnt;
	 
	 wire h_active;
    wire v_active;	

    assign h_active = (h_cnt >= hbp && h_cnt < hfp);
    assign v_active = (v_cnt >= vbp && v_cnt < vfp);
	 
	 assign h_sync = (h_cnt < h_pulse) ? 0 : 1;
    assign v_sync = (v_cnt < v_pulse) ? 0 : 1;

	 always @(posedge vga_clk or posedge rst)
    begin
        if (rst)
        begin
            h_cnt = 10'd0;
            v_cnt = 10'd0;
        end
        else
        begin
            if (h_cnt < h_pixels)
                h_cnt = h_cnt + 1;

            else
            begin
                // reset horizontal counters
                h_cnt <= 0;

                if (v_cnt < v_lines)
                begin
                    v_cnt = v_cnt + 1;
                end
                else
                begin
                    // reset vertical counters
                    v_cnt <= 0;
                end
            end
								
        end
    end
	 
	 
	 //Defining interface wires between SpriteRom, H_CNT and Memory
	 wire [14:0] charrom_index;
	 wire [3:0] charrom_red, charrom_green, charrom_blue;
	 
	 //Abus denotes which vram Location i.e location 12
	 wire [10:0] vramL1_abus;
	 //Dbus denotes what sprite is located at a memory address i.e loc 12 = sprite 5
	 wire [7:0]  vramL1_dbus;
	 //spriterrom_index gives the exact pixel from the sprite to display 
	 wire [15:0] spriterom_indexL1;
	 wire [3:0] spriterom_redL1, spriterom_greenL1, spriterom_blueL1;
	 
	 
	 //All other components work similarly 
	 wire [10:0] vramL2_abus;
	 wire [7:0]  vramL2_dbus;
	 wire [15:0] spriterom_indexL2;
	 wire [3:0] spriterom_redL2, spriterom_greenL2,spriterom_blueL2;
	 wire is_layer2;
	 
	 
	 wire [15:0] spriterom_indexCR1;
	 wire [3:0] spriterom_redCR1, spriterom_greenCR1,spriterom_blueCR1;
	 wire is_charLayer1;
	 
	 wire [15:0] spriterom_indexCR2;
	 wire [3:0] spriterom_redCR2, spriterom_greenCR2,spriterom_blueCR2;
	 wire is_charLayer2;
	 
	 wire [15:0] spriterom_indexCR3;
	 wire [3:0] spriterom_redCR3, spriterom_greenCR3,spriterom_blueCR3;
	 wire is_charLayer3;
	 
	 wire [15:0] spriterom_indexCR4;
	 wire [3:0] spriterom_redCR4, spriterom_greenCR4,spriterom_blueCR4;
	 wire is_charLayer4;
	 
	 //Instaniating layer1
	 vram #(
		.VRAM_FILENAME(VRAML1_FILENAME)
	 ) vram_L1(
		.cpu_clk(cpu_clk),
		.vga_clk(vga_clk),
		.cpu_abus(address_bus - 16'h3019),
		.vga_abus(vramL1_abus),
		.data_in(data_bus),
		.write_en(~z80_write && vramL1_cs),
		.vga_out(vramL1_dbus),
		.cpu_out(vramL1_out)
	);
	
	//Instaniating layer2
	vram #(
		.VRAM_FILENAME(VRAML2_FILENAME)
	 ) vram_L2(
		.cpu_clk(cpu_clk),
		.vga_clk(vga_clk),
		.cpu_abus(address_bus - 16'h34C9),
		.vga_abus(vramL2_abus),
		.data_in(data_bus),
		.write_en(~z80_write && vramL2_cs),
		.vga_out(vramL2_dbus),
		.cpu_out(vramL2_out)
	);

	//Instaniating CRAM Controller
	cramController cRram_inst(
		.clk(cpu_clk),
		.cpu_abus(address_bus),
		.data_bus(data_bus),
		.write_en(z80_write),
		.cram1_cs(cram1_cs),
		.cram2_cs(cram2_cs),
		.cram3_cs(cram3_cs),
		.cram4_cs(cram4_cs),
		
		.cram1_out(cram1_out),
		.cram2_out(cram2_out),
		.cram3_out(cram3_out),
		.cram4_out(cram4_out),
		
		.h_cnt(h_cnt),
		.v_cnt(v_cnt),

		.is_charLayer1(is_charLayer1),
		.is_charLayer2(is_charLayer2),
		.is_charLayer3(is_charLayer3),
		.is_charLayer4(is_charLayer4),
		
		.spriterom_indexCR1(spriterom_indexCR1),
		.spriterom_indexCR2(spriterom_indexCR2),
		.spriterom_indexCR3(spriterom_indexCR3),
		.spriterom_indexCR4(spriterom_indexCR4)
	);
	
	charRom #(
		.CHAR_ROM_FILENAME(CHAR_ROM_FILENAME)
	) charRom_inst(
		.charrom_index(charrom_index),
		
		.data_R(charrom_red),
		.data_G(charrom_green),
		.data_B(charrom_blue)

	);
	
		 
	spriteRom #(
		.SPRITE_ROM_FILENAME(SPRITE_ROM_FILENAME)
	) spriteRom_inst(
		.spriterom_indexL1(spriterom_indexL1),
		.spriterom_indexL2(spriterom_indexL2),
		.spriterom_indexCR1(spriterom_indexCR1),
		.spriterom_indexCR2(spriterom_indexCR2),
		.spriterom_indexCR3(spriterom_indexCR3),
		.spriterom_indexCR4(spriterom_indexCR4),
		
		.data_RL1(spriterom_redL1),
		.data_GL1(spriterom_greenL1),
		.data_BL1(spriterom_blueL1),
		
		.data_RL2(spriterom_redL2),
		.data_GL2(spriterom_greenL2),
		.data_BL2(spriterom_blueL2),
		
		.data_RCR1(spriterom_redCR1),
		.data_GCR1(spriterom_greenCR1),
		.data_BCR1(spriterom_blueCR1),
				
		.data_RCR2(spriterom_redCR2),
		.data_GCR2(spriterom_greenCR2),
		.data_BCR2(spriterom_blueCR2),
		
		.data_RCR3(spriterom_redCR3),
		.data_GCR3(spriterom_greenCR3),
		.data_BCR3(spriterom_blueCR3),
				
		.data_RCR4(spriterom_redCR4),
		.data_GCR4(spriterom_greenCR4),
		.data_BCR4(spriterom_blueCR4)
	);

	 // we calculate abus based on its position across the screen using integer division of 16 increments
	 assign vramL1_abus = (h_active && v_active) ? (v_cnt-vbp)/sprite_length * hSprite_count + (h_cnt-hbp)/sprite_length : 11'b00000000000;
	 assign vramL2_abus = (h_active && v_active) ? (v_cnt-vbp)/sprite_length * hSprite_count + (h_cnt-hbp)/sprite_length : 11'b00000000000;

	 //We then have to calculate the exact pixel position within a sprite i.e h_cnt 144 = sprite x index 0
	 assign spriterom_indexL1 = ((v_cnt-vbp) % sprite_length) * sprite_length +((h_cnt-hbp) % sprite_length) + vramL1_dbus * spriteMem_size;
	 assign spriterom_indexL2 = ((v_cnt-vbp) % sprite_length) * sprite_length +((h_cnt-hbp) % sprite_length) + vramL2_dbus * spriteMem_size;
	 
	 //We only draw layer 2 based on its opacity
	 assign is_layer2 = (vramL2_dbus != 8'hFF && (spriterom_redL2 != 4'b1111 && spriterom_greenL2 != 4'b1111 && spriterom_blueL2 != 4'b1111 ));
	 assign is_charLayer = is_charLayer1 || is_charLayer2 || is_charLayer3 || is_charLayer4;
	 
	 
	 //conditional output which favours characterLayers first then VRAM2, VRAM1
	 assign v_red =   (h_active && v_active &&  is_charLayer1)  ? 					 spriterom_redCR1 :
							(h_active && v_active &&  is_charLayer2)  ? 					 spriterom_redCR2 :
							(h_active && v_active &&  is_charLayer3)  ? 					 spriterom_redCR3 :
							(h_active && v_active &&  is_charLayer4)  ? 					 spriterom_redCR4 :
							(h_active && v_active &&  !is_charLayer && is_layer2)  ?  spriterom_redL2 :
							(h_active && v_active &&  !is_charLayer && !is_layer2) ?  spriterom_redL1 :
							4'b0000;

	 assign v_green = (h_active && v_active &&  is_charLayer1)  ?  				 spriterom_greenCR1 :
							(h_active && v_active &&  is_charLayer2)  ?  				 spriterom_greenCR2 :
							(h_active && v_active &&  is_charLayer3)  ?  				 spriterom_greenCR3 :
							(h_active && v_active &&  is_charLayer4)  ?  				 spriterom_greenCR4 :
							(h_active && v_active &&  !is_charLayer && is_layer2)  ?  spriterom_greenL2 :
							(h_active && v_active &&  !is_charLayer && !is_layer2) ?  spriterom_greenL1 :
							4'b0000;
							
	 assign v_blue = (h_active && v_active &&  is_charLayer1)  ?  				    spriterom_blueCR1 :
							(h_active && v_active &&  is_charLayer2)  ?  				 spriterom_blueCR2 :
							(h_active && v_active &&  is_charLayer3)  ?  				 spriterom_blueCR3 :
							(h_active && v_active &&  is_charLayer4)  ?  				 spriterom_blueCR4 :
							(h_active && v_active &&  !is_charLayer && is_layer2)  ?  spriterom_blueL2 :
							(h_active && v_active &&  !is_charLayer && !is_layer2) ?  spriterom_blueL1 :
							4'b0000;
							
endmodule