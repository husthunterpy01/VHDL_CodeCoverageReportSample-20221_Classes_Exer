`timescale 1ns / 1ps
module ripple_carry_16_bit_tb;
wire [15:0] sum;//output
wire cout;//output
reg [15:0] a,b;//input
reg cin;//input

ripple_carry_16_bit uut(
.a(a),
.b(b),
.cin(cin),
.sum(sum),
.cout(cout));

initial begin
$display($time, " << Starting the Simulation >>");
     a=0; b=0; cin=0;
#100 a= 16'b0000000000011111; b=16'b000000000001100; cin=1'b0;
#10 a= 16'b0000000000011111; b=16'b000000000001100; cin=1'b0;
#10 a= 16'b1100011000011111; b=16'b000000110001100; cin=1'b1;
#10 a= 16'b1111111111111111; b=16'b000000000000000; cin=1'b1;
end

initial
$monitor("time= ", 
$time, 
"A=%b, 
B=&b, 
Cin=%b 
: Sum= %b, 
Cout=%cout",
a,b,cin,sum,cout);
endmodule