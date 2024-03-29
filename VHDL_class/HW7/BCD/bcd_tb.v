module tb;

  reg  [3:0] in ;
  wire [6:0] out;

  encoder_7segment encoder (
    .in (in ),
    .out(out) 
  );

  initial begin
    repeat(20) begin
      in = $random();

      #2;
      $display($stime, ":\t\tin = %b", in, "\t\tout = %b", out);

      #10;
    end
    $stop;
  end

endmodule : tb
