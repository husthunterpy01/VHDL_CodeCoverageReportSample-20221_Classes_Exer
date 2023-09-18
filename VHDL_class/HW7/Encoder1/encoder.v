
module encoder8_3 (
  input      [7:0] D,
  output reg [2:0] Y 
);

  integer i;
  always @(D) begin
    Y = 0;
    for (i = 0; i < 8; i = i + 1) begin
      if (D[i] == 1)
        Y = i;
    end
  end

endmodule : encoder8_3