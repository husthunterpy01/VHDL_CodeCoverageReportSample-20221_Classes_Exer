module fa_tb();
reg a,b,cin;
wire s,c;

fa dut(
.a(a),
.b(b),
.cin(cin),
.s(s),
.c(c)
);

initial begin
cin =1'b0;
repeat(20) begin
#10;
a = $random();
b = $random();
#5;
$display(":\t\t a =",a,"\t\t b =",b, "\t\t cin= ",cin,"\t\t s = ", s, "\t\t c= ", c);
end
$stop;
end

endmodule : fa_tb
