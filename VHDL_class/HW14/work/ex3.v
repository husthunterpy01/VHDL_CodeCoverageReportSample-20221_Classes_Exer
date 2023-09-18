module ex3(a,b,result,c1,c2);
input a,b,c1,c2;
output result;
if (c1)
result = a & b;
else if (c2)
result = a ^ b;
else result = a | b;
end
endmodule