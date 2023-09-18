module tb ();

reg [3:0] A     ;
reg [3:0] B     ;
wire      A_lt_B;
wire      A_eq_B;
wire      A_gt_B;
integer   error ;

cp_4bit dut(
  .A     (A     ),
  .B     (B     ),
  .A_lt_B(A_lt_B),
  .A_eq_B(A_eq_B),
  .A_gt_B(A_gt_B) 
);

initial begin
  error = 0;
  repeat(100) begin
    #10;
    A = $random();
    B = $random();
    #2;
    if (A_lt_B != (A < B) || A_eq_B != (A == B) || A_gt_B != (A > B)) begin
      error = error + 1;
    end
    $display($stime, ":\t\tA = ", A, "\t\tB = ", B, "\t\tA_lt_B = ", A_lt_B, "\t\tA_eq_B = ", A_eq_B, "\t\tA_gt_B = ", A_gt_B, "\t\terror = ", error);
  end
  $stop;
end

endmodule : tb
