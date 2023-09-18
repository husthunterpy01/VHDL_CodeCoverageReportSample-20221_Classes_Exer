module test_adder;
reg[3:0] a,b;
reg cin;
wire[3:0] sum;
wire cout;
full_adder_4bit dut(a,b,cin,sum,cout);
initial 
begin
a = 4'b0000;
b = 4'b0000;
cin = 1'b0;
#50;
a = 4'b0101;
b = 4'b1010;
#50;
a = 4'b1111;
b = 4'b0001;
#50;
a = 4'b0110;
b = 4'b0001;
$display(":\t\t a =",a,"\t\t b =",b, "\t\t cin= ",cin,"\t\t sum = ", sum, "\t\t cout= ", cout);
end
endmodule
