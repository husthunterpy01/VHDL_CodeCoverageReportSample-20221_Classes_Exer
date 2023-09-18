module sr_activelow_(q,qb,s,r,clk,rst);
input s,r,clk,rst;
output reg q,qb;
always@(posedge clk or negedge rst)
begin
if (!rst)
q <=0;
else
if (s==1 & r==0) begin
q <= 1;
qb <=0;
end
else
if (s==0 && r==1) begin
q <=0;
qb <=1;
end
end
endmodule
