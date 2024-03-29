`timescale 1ns / 1ps


module test_CLA();
    parameter N = 4;
// inputs to the DUT
    reg [N-1:0] A = 4'h0;
    reg [N-1:0]B = 4'h0;
    reg Ci = 0;
// outputs from the DUT
    wire [N-1:0]S;
    wire Co;
    wire PG,GG,CG;

CLA DUT ( .A(A), .B(B), .Ci(Ci), .S(S), .Co(Co), .PG(PG), .GG(GG), .CG(CG) );

initial
    begin
        $display($time, " << Simulation Results >>");
        $monitor($time, "A = %b, B = %b, Ci = %b, S = %b, Co = %b, PG = %b, GG = %b, CG = %b", A, B, Ci, S, Co,PG,GG,CG);
    end
   

initial
    begin
        forever begin
          if (A <= 4'b1111)
            begin
                if(B < 4'b1111)
                    begin
                        B  = B + 4'b0001;
                        Ci = 0;
                        #2;
                        Ci =1;
                        #2;
                    end else begin
                        B = 4'b0000;
                        A = A + 4'b0001;
                    end
            end else begin
                $finish;
            end
         end
    end

endmodule
