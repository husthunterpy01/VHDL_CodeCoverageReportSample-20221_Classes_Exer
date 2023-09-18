module circuit_a;
reg a,b,result,c1,c2;
if(c1) 
result = a & b;
else if (c2) 
result = a ^ b;
else  
result = a | b;
endmodule
