module encoder_7segment (
  input      [3:0] in ,
  output reg [6:0] out 
);

  always @(in) begin
    case (in)
      4'b0000: begin
        out = 7'b1111110;
      end

      4'b0001: begin
        out = 7'b0110000;
      end

      4'b0010: begin
        out = 7'b1101101;
      end

      4'b0011: begin
        out = 7'b1111001;
      end

      4'b0100: begin
        out = 7'b0110011;
      end

      4'b0101: begin
        out = 7'b1011011;
      end

      4'b0110: begin
        out = 7'b1011111;
      end

      4'b0111: begin
        out = 7'b1110000;
      end

      4'b1000: begin
        out = 7'b1111111;
      end

      4'b1001: begin
        out = 7'b1111011;
      end

      default : begin
        out = 7'b1111111;
      end
    endcase
  end

endmodule : encoder_7segment


/*
      4'b1010: begin
        out = 7'b1110111;
      end

      4'b1011: begin
        out = 7'b0011111;
      end

      4'b1100: begin
        out = 7'b1001110;
      end

      4'b1101: begin
        out = 7'b0111101;
      end

      4'b1110: begin
        out = 7'b1001111;
      end

      4'b1111: begin
        out = 7'b1000111;
      end
*/
