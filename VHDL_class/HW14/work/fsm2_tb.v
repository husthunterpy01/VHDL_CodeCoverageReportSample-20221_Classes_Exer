`timescale 1ns / 1ps

module fsm2_tb;

reg clk, reset;
reg a;
wire y0;

fsm2 dut (
    .clk(clk),
    .reset(reset),
    .a(a),
    .y0(y0)
);

initial begin
    clk = 0;
    reset = 1;
    a = 0;
    #5 reset = 0;
end

always #5 clk = ~clk;

initial
begin
a = 0;
reset = 1;
#30;
a = $random();
end

endmodule
