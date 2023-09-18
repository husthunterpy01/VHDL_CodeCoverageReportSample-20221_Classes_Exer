module test_bench(

    );
    reg s,r,clk,rst;
    wire q,qb;
    sr_activelow_ GG1(q,qb,s,r,clk,rst);
    initial
    begin
        s=0; r=1; clk=1;
   #100 rst=1; s=1; r=0;
   #100 rst=0; s=0; r=1;
   #100 rst=1; s=1; r=0;
   #100 rst=1; s=0; r=1;
   #100 rst=0; s=0; r=1;
   end
    always #20 clk <= ~clk;
endmodule
