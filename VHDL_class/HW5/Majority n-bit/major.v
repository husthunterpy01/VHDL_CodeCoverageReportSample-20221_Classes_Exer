module majority(a,b,c,z);
output z;
input a,b,c;
wire n1,n2,n3;

assign n1 = a & b;
assign n2 = b & c;
assign n3 = a & c;
assign z = n1 | n2 | n3;
endmodule : majority 


