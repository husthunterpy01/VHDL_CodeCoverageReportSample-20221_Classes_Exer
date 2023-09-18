`timescale 1ns / 1ps

module fsm_eg_2_seg_tb;

reg clk, reset;
reg a, b;
wire y0, y1;

fsm_eg_2_seg dut (
    .clk(clk),
    .reset(reset),
    .a(a),
    .b(b),
    .y0(y0),
    .y1(y1)
);

initial begin
    clk = 0;
    reset = 1;
    a = 0;
    b = 0;
    #5 reset = 0;
end

always #5 clk = ~clk;

initial
begin
a = 0;
b = 0;
reset = 1;
#30;
a = $random();
b = $random();
end

endmodule
