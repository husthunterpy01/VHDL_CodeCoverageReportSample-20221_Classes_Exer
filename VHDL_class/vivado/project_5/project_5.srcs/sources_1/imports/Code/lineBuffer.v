// Design 
module lineBuffer
(
// [1]: writing one pixel at a time to line buffer
input i_clk,
input i_rst,
input [7:0] i_data,
input i_data_valid,
input i_rd_data,

output [23:0] o_data  // for kernel 3x3 => read 3 pixel, 
 //reading 3 pixel in one shot => 3x8 = 24 bit in one shot
);

reg [7:0] line [511:0]; // lineBuffer. size of image is 512 x 512 
reg [8:0] wrPntr;  // size = log ( depth your memory) log(512) = 9,
//because the point basically indecates which position in the memory 
//so the size of the register should be big enough to store values 
//between 0 and 511, store data when clk rising
reg [8:0] rdPntr;
always @ ( posedge i_clk)
begin
    if(i_data_valid)
	line[wrPntr] <= i_data;      	
end

always @ (posedge i_clk)
begin
	if(i_rst)
	    wrPntr <= 'd0;
	else if (i_data_valid)
	    wrPntr <= wrPntr + 'd1;
		
end

assign o_data = {line[rdPntr], line[rdPntr+1], line[rdPntr+2]}; // 3 bytes in one shot


always @ (posedge i_clk)
begin
    if(i_rst)
	    rdPntr <= 'd0;
    else if (i_rd_data)
        rdPntr <= rdPntr + 'd1;	
end
endmodule