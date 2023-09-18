module jk_ff( j, k  , clk , reset, q ,qb );
input j,k;
input clk, reset ;
output q,qb;
reg q,qb;
reg [1:0]jk;

always @ ( posedge clk or posedge reset)
begin
jk={j,k};
if (reset)
begin
q = 1'b0;
qb = ~q;
end
else
begin
case (jk)
2'd0 : q = q;
2'd1 : q = 1'b0;
2'd2 : q = 1'b1;
2'd3 : q = ~q;
endcase
qb = ~q;
end
end
endmodule
