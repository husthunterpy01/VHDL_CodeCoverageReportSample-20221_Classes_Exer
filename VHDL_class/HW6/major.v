module majority_n_bit
#(parameter N =3)
(
input [N-1:0] data,
output out
);
parameter avg = N/2;

wire [N-1 : 0] sum [N-1 : 0];
assign sum[0] = data[0];

generate 
genvar i;
for (i =1; i < N; i = i + 1)
begin
assign sum[i] = data[i] + sum[i-1];
end
endgenerate

assign out = (sum[N-1] < avg + 1) ? 1'b0 : 1'b1;

endmodule
