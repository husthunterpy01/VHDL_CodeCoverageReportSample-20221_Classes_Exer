module tb;

  reg  [3:0] in   ;
  wire       major;
  integer    count;
  integer    error;
  integer    i    ;
  
  majority_4bit dut(
    .in   (in   ),
    .major(major) 
  );
  
  initial begin
    error = 0;
    repeat(20) begin
      in = $random();
      count = 0;
      for (i = 0; i < 4; i = i + 1)
        count = count + in[i];

      #2;
      if (((count > 2) && (major == 0)) || ((count < 3) && (major == 1))) begin
        error = error + 1;
      end
      $display($stime, ":\t\tin = %b", in, "\t\tmajor = %b", major, "\t\terror = %d", error);

      #10;
    end
    $stop;
  end

endmodule : tb
