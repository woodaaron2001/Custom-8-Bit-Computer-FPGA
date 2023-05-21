module customArchitectureTest;

	// Inputs
	reg mclk = 0;

	// Instantiate the Unit Under Test (UUT)
    customArchitecture uut(
        .CLOCK_50(mclk)
    );

	always #5 mclk = ~mclk;
endmodule
