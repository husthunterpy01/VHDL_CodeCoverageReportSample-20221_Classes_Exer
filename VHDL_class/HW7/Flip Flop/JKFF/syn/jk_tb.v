module jk_ff_tb;

    // Inputs
    reg j;
    reg k;
    reg reset;
    reg clk;

    // Outputs
    wire q;
    wire qb;

    // Instantiate the Unit Under Test (UUT)
    jk_ff uut (
        .j(j),
        .k(k),
        .reset(reset),
        .clk(clk),
        .q(q),
        .qb(qb)
    );

    initial begin
        // Initialize Inputs
        j = 1'b0;
        k = 1'b0;
        reset = 1'b1;
        clk = 1'b0;

        // Wait 100 ns for global reset to finish
        #10 reset = 1'b0;
       
        // Add stimulus here

    end
    always #10 clk = ~clk;
        initial begin
        #60 j = 1'b1;
        #50 k = 1'b0;
        #200 j = 1'b0;
        #100 k = 1'b1;
        #30 j = 1'b0;
        #45 k = 1'b0;
        end
     
endmodule
