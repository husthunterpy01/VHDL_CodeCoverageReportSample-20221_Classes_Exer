module gray1_tb;
parameter N =4;

reg clk;
reg rstn;
wire [N-1:0] out;

gray1 dut(
.clk(clk),
.rstn(rstn),
.out(out)
);

always #10 clk = ~clk;

initial begin
{clk,rstn} <=0;

$monitor("T=%ot rstn=%0b out=0x%0h", $time, rstn, out);
repeat(2)@(posedge clk);
rstn <=1;
repeat(20)@(posedge clk);
$finish;
end
endmodule
