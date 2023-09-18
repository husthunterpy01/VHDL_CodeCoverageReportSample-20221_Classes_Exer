module full_adder_4bit(a,b,cin,sum,cout);
input [3:0]a,b;
input cin;
output [3:0] sum;
output cout;
wire c1,c2,c3;

// Instantiate the 1-bit adders
full_adder FA0(a[0],b[0],cin,sum[0],c1);
full_adder FA1(a[1],b[1],c1,sum[1],c2);
full_adder FA2(a[2],b[2],c2,sum[2],c3);
full_adder FA3(a[3],b[3],c3,sum[3],cout);
endmodule

module full_adder(a,b,cin,sum,cout);
input a,b,cin;
output sum,cout;
reg sum,cout;
always@(a or b or cin)
begin
sum = a^b^cin;
cout = (a&b)|( a& cin)|( b & cin);
end 
endmodule
