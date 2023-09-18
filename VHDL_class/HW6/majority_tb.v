
`timescale 1ns/1ps

module tb_majority_n_bit ();

// parameter 
    parameter N = 7;
    parameter AVERAGE = N / 2;

// data type
    reg [N - 1 : 0] data ;
    wire          o_out;

// instance module
    majority_n_bit #(.N(N)) majority_n_bit_inst
    (
    .data  (data ),
    .o_out (o_out)
    );

    initial 
	begin 
        repeat(100) 
		    begin 
                data = $random();
                #10;
            end
        $finish;
    end

//==================== Check function ======================================
// auto check
    integer bit_sum;
    integer i;
    reg check;

    always @(data) 
	begin
        bit_sum = 0;
        for (i = 0; i < N; i = i + 1) 
		begin
            bit_sum = bit_sum + data[i];
        end

        check = (bit_sum < AVERAGE + 1) ? 1'b0 : 1'b1;
		if (check != o_out) 
		begin 
            $display("ERROR at %t: data = %b, o_out = %d", $realtime(), data, o_out);
        end 
        else 
		begin 
            $display("PASS at %t: data = %b, o_out = %d", $realtime(), data, o_out);
        end
    end

  
endmodule
