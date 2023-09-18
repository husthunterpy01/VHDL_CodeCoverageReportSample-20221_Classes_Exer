module majority_4bit (
  input [3:0] in   ,
  output reg  major 
);

  reg pre_major;
  always @(in) begin
    pre_major = (in[0] & in[1]) |
                (in[1] & in[2]) |
                (in[0] & in[2]);
  end

  always @(in, pre_major) begin
    major = (in[2] & in[1] & in[0] == 1) ? 1 : (pre_major & in[3]);
  end

endmodule : majority_4bit

