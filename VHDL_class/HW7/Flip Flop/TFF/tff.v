module prog5_Tflip_flop(q, qb, t, rst, clk);
input t, rst, clk;
output q, qb;
reg q, qb;
initial
q = 0;
always @(posedge clk)
begin
	case({rst, t})
	2'b10 : q = 0;
	2'b00 : q = q;
	2'b01 : q = ~q;
	endcase
qb = ~q;
end
endmodule
