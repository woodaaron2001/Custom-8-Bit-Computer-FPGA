`timescale 1ns / 1ps
module ps2(
    input PS2_CLK,
    input PS2_DAT,
	 output reg [7:0] PS2OUT
    );
	 
	reg [15:0] debounceCounter = 16'd0;
	parameter DEBOUNCE_LIMIT = 16'd2;


	initial begin
		debounceCounter <= 16'd0;
	end

   reg newDataAvailable = 1'b0;

	reg[7:0] currentData = 8'd0;
	reg[7:0] asciiValue = 8'd0;
	reg[3:0] dataIndex = 4'd1;

	reg newDataClock = 1'd0;

	always @(negedge PS2_CLK) begin
		 case (dataIndex)
			  //Shift in data on every CLOCK into currentData
			  2: currentData[0] <= PS2_DAT;
			  3: currentData[1] <= PS2_DAT;
			  4: currentData[2] <= PS2_DAT;
			  5: currentData[3] <= PS2_DAT;
			  6: currentData[4] <= PS2_DAT;
			  7: currentData[5] <= PS2_DAT;
			  8: currentData[6] <= PS2_DAT;
			  9: currentData[7] <= PS2_DAT;
			  10: newDataClock <= 1'b1;
			  11: begin
						 newDataClock <= 1'b0;
						 newDataAvailable <= 1'b0;
					end
			  1: newDataAvailable <= 1'b1;
			  default:;
		 endcase
		 
		 if (dataIndex <= 4'd10) begin
			  dataIndex <= dataIndex + 1'd1;
		 end else begin
			  dataIndex <= 4'd1;
		 end
	end

	always @(posedge newDataClock) begin
		 if (currentData == 8'd0) begin
				debounceCounter <= 16'd0;
			  // Output previous data or do nothing
		 end else begin
			  debounceCounter <= debounceCounter + 1;
			  // Update previous data and output only when debounce limit is reached
			  if (debounceCounter >= DEBOUNCE_LIMIT) begin
					debounceCounter <= 16'd0;
					//convert scan code to ascii value
					asciiValue = scancode_to_ascii(currentData);
					ps2_out <= asciiValue;
					LEDR <= asciiValue;
			  end
		 end
	end
	 
	function [7:0] scancode_to_ascii;
		 input [7:0] scancode;
		 begin
			  case (scancode)
					8'h1C: scancode_to_ascii = 8'h41; // A
					8'h32: scancode_to_ascii = 8'h42; // B
					8'h21: scancode_to_ascii = 8'h43; // C
					8'h23: scancode_to_ascii = 8'h44; // D
					8'h24: scancode_to_ascii = 8'h45; // E
					8'h2B: scancode_to_ascii = 8'h46; // F
					8'h34: scancode_to_ascii = 8'h47; // G
					8'h33: scancode_to_ascii = 8'h48; // H
					8'h43: scancode_to_ascii = 8'h49; // I
					8'h3B: scancode_to_ascii = 8'h4A; // J
					8'h42: scancode_to_ascii = 8'h4B; // K
					8'h4B: scancode_to_ascii = 8'h4C; // L
					8'h3A: scancode_to_ascii = 8'h4D; // M
					8'h31: scancode_to_ascii = 8'h4E; // N
					8'h44: scancode_to_ascii = 8'h4F; // O
					8'h4D: scancode_to_ascii = 8'h50; // P
					8'h15: scancode_to_ascii = 8'h51; // Q
					8'h2D: scancode_to_ascii = 8'h52; // R
					8'h1B: scancode_to_ascii = 8'h53; // S
					8'h2C: scancode_to_ascii = 8'h54; // T
					8'h3C: scancode_to_ascii = 8'h55; // U
					8'h2A: scancode_to_ascii = 8'h56; // V
					8'h1D: scancode_to_ascii = 8'h57; // W
					8'h22: scancode_to_ascii = 8'h58; // X
					8'h35: scancode_to_ascii = 8'h59; // Y
					8'h1A: scancode_to_ascii = 8'h5A; // Z
					8'h29: scancode_to_ascii = 8'h20; // Space
					8'h45: scancode_to_ascii = 8'h2C; // Comma (,)
					8'h4E: scancode_to_ascii = 8'h2E; // Period (.)
					8'h55: scancode_to_ascii = 8'h2F; // Slash (/)
					8'h54: scancode_to_ascii = 8'h30; // 0
					8'h45: scancode_to_ascii = 8'h31; // 1
					8'h16: scancode_to_ascii = 8'h32; // 2
					8'h1E: scancode_to_ascii = 8'h33; // 3
					8'h26: scancode_to_ascii = 8'h34; // 4
					8'h25: scancode_to_ascii = 8'h35; // 5
					8'h2E: scancode_to_ascii = 8'h36; // 6
					8'h36: scancode_to_ascii = 8'h37; // 7
					8'h3D: scancode_to_ascii = 8'h38; // 8
					8'h3E: scancode_to_ascii = 8'h39; // 9
					8'h4C: scancode_to_ascii = 8'h3F; // Question Mark (?)
					
					// Add other scancode-to-ASCII mappings here
					default: scancode_to_ascii = 8'h00; // Unmapped scancode or not supported
			  endcase
		 end
	endfunction
	


	endmodule

