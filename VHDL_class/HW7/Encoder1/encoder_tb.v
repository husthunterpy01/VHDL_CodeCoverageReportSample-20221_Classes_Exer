
module encoder_tb;

  reg  [7:0] D;
  wire [2:0] Y;
  integer   error ;
  
  encoder8_3 encoder (
    .D(D),
    .Y(Y) 
  );
  
  initial begin
    error = 0;
    D = 4'b0001;
    #2;
      if (Y != $clog2(D)) begin
        error = error + 1;
      end
      $display($stime, ":\t\tD = %b", D, "\t\tY = %b", Y, "\t\terror = %d", error);
    repeat(8) begin
      #10;
      D = D << 1;
      #2;
      if (Y != $clog2(D)) begin
        error = error + 1;
      end
      $display($stime, ":\t\tD = %b", D, "\t\tY = %b", Y, "\t\terror = %d", error);
    end
    $stop;
  end

endmodule : encoder_tb