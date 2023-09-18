`timescale 1ns / 1ps
module conv
(
input        i_clk,
input [71:0] i_pixel_data,  // 9 pixel, 8 bit = 72
input        i_pixel_data_valid,    

output reg [7:0]  o_convolved_data,  // out put is 1 pixel
output reg     o_convolved_data_valid
);


reg [7:0] kernel [8:0]; // kernel is matrix 3x3
integer i;
reg [15:0]  multData[8:0];
reg [15:0] sumDataInt;
reg [15:0] sumData;
reg multDataValid;
reg convolved_data_valid;
reg sumDataValid;

// set kernel = [1,1,1; 1,1,1; 1,1,1];
initial
begin
		  for(i = 0; i < 9; i = i + 1)
	    begin
		    kernel[i] = 1;
		end
		
end
// nhan tung chi so 
always @ (posedge i_clk)
begin
    for( i = 0; i < 9; i = i + 1)
	begin
	    multData[i] <= kernel[i] * i_pixel_data[i * 8 +: 8];
	end
	
	multDataValid <= i_pixel_data_valid;
end
// cong tat ca chi so
always @ (*)
begin
    sumDataInt = 0;   
    for(i = 0; i < 9; i = i + 1)
	begin
	    sumDataInt = sumDataInt + multData[i];
	end
	
end

always @ ( posedge i_clk)
begin
    sumData <= sumDataInt;
	sumDataValid <= multDataValid;
end

always @ (posedge i_clk)
begin
    o_convolved_data <= sumData / 9;
	o_convolved_data_valid <= sumDataValid;
end
endmodule
