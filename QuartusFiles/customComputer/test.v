`timescale 1us/ 100 ns
module test();

	// Inputs
	reg mclk = 0;
	reg [20:0] counter = 0;
	reg reset = 0;
	
	// Instantiate the Unit Under Test (UUT)
    customComputer uut(
        .CLOCK_50(mclk) 
    );

	
	always #1 mclk = ~mclk;

	// Counter to stop simulation after 5000 clocks
	always @(posedge mclk) begin
		counter <= counter + 1;
		if(counter == 10) begin
			reset = 1;
		end
		
		if (counter == 500000) begin
			$finish;
		end
	end

endmodule
