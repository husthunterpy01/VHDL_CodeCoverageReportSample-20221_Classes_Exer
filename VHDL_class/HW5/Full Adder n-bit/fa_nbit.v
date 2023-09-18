module fa(a,b,cin,s,c);
input a,b,cin;
output s,c;
wire n1,n2,n3;
xor x1(s,a,b,cin);
and a1(n1,a,b);
and a2(n2,b,cin);
and a3(n3,a,cin);
or o1(c,n1,n2,n3);
endmodule : fa
