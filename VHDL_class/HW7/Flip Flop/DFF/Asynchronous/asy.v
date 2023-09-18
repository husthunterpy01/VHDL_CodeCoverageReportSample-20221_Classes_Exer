module dff(
input d1,d2,
input rstn,
input clk,
output reg q1,q2);
always @(posedge clk or negedge rstn)
if(!rstn)
q2=d2;
else 
q2=0;
endmodule

