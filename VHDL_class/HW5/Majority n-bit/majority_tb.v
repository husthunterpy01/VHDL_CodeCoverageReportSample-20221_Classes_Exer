module tb ();

reg a, b, c;
wire z;

majority dut(
  .a(a),
  .b(b),
  .c(c),
  .z(z)
);

initial begin
  repeat(30) begin
    #10;
    a = $random();
    b = $random();
    c = $random();
  #5;
  $display($time,":\t\t a = ",a,"\t\t b = ",b,"\t\t c= ",c,"\t\t z =",z);
end
  $stop;
end

endmodule : tb
