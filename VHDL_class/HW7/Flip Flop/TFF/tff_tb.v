
module prog5_Tflip_flop_tb_v;

	// Inputs
	reg t;
	reg rst;
	reg clk;

	// Outputs
	wire q;
	wire qb;

	// Instantiate the Unit Under Test (UUT)
	prog5_Tflip_flop uut (
		.q(q), 
		.qb(qb), 
		.t(t), 
		.rst(rst), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		t = 0;
		rst = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		t = 0;
		rst = 1;

		#100;
		t = 0;
		rst = 0;

		#100;
		t = 1;
		rst = 0;

		#100;
		t = 1;
		rst = 0;
        
		// Add stimulus here

	end
		always #50 clk = ~clk;
      
endmodule