`timescale 1ns / 1ps

module testbench;

// Inputs
reg clk;
reg rst_n;
reg ps2_clk;
reg ps2_data;

// Outputs
wire [7:0] data_out;
wire error_out;

// Instantiate the DUT
ps2 dut (
    .clk(clk),
    .rst_n(rst_n),
    .ps2_clk(ps2_clk),
    .ps2_data(ps2_data),
    .data_out(data_out),
    .error_out(error_out)
);

// Clock generator
always #5 clk = ~clk;

// Reset generator
initial begin
    rst_n = 0;
    #10;
    rst_n = 1;
end

// Test vector generator
initial begin
    // Send "a" key press
    ps2_clk = 1;
    ps2_data = 1;
    #10;
    ps2_data = 0;
    #10;
    ps2_data = 1;
    #10;
    ps2_data = 1;
    #10;
    ps2_data = 1;
    #10;
    ps2_data = 0;
    #10;
    ps2_data = 0;
    #10;
    ps2_data = 0;
    #10;
    ps2_data = 0;
    #10;
    ps2_data = 1;
    #10;
    ps2_data = 1;
    #10;
    ps2_data = 0;
    #10;
    ps2_data = 0;
    #10;

    // Send "b" key press
    ps2_data = 1;
    #10;
    ps2_data = 1;
    #10;
    ps2_data = 1;
    #10;
    ps2_data = 0;
    #10;
    ps2_data = 0;
    #10;
    ps2_data = 0;
    #10;
    ps2_data = 1;
    #10;
    ps2_data = 0;
    #10;
    ps2_data = 0;
    #10;
    ps2_data = 0;
    #10;
    ps2_data = 1;
    #10;
    ps2_data = 1;
    #10;
    ps2_data = 1;
    #10;
    ps2_data = 0;
    #10;
    ps2_data = 0;
    #10;

    // Send "c" key press
    ps2_data = 1;
    #10;
    ps2_data = 1;
    #10;
    ps2_data = 1;
    #10;
    ps2_data = 0;
    #10;
    ps2_data = 1;
    #10;
    ps2_data = 1;
    #10;
    ps2_data = 0;
    #10;
    ps2_data = 1;
    #10;
    ps2_data = 0;
    #10;
    ps2_data = 1;
    #10;
    ps2_data = 1;
    #10;
    ps2_data = 0;
    #10;
    ps2_data = 1;
    #10;
    ps2_data = 0;
    #10;
    ps2_data = 0;
    #10;

    // Wait for data output
    #100;
    
    // Stop simulation
    $finish;
end

endmodule