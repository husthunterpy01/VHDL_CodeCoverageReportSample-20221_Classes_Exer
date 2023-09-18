module dff_tb();
reg d1,d2,rstn,clk;
wire q1,q2;
dff a1(d1,d2,rstn,clk,q1,q2);
initial begin
$monitor("Value of d1 = %b,d2 = %b, rstn=%b,clk = %b,q1=5b,q2=%b",d1,d2,rstn,clk,q1,q2);
clk = 0;
d1=0;d2=0;rstn=0;
#2 d1=1; d2=1; rstn=0;
#2 d1=1; d2=1; rstn=0;
#2 d1=1; d2=1; rstn=0;
end
always #2 clk=~clk;
endmodule
