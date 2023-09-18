// Khoi nay lay tung pixel => xuat ra khoi pixel 3x3 de dua vao  module conv
// size of image 512x512 = 2^9  x  2^9
module imageControl
(
input i_clk,
input i_rst,
input  [7:0] i_pixel_data,
input        i_pixel_data_valid,

output reg [71:0] o_pixel_data,  // matrix 3x3 => 9 x 8 = 72 bit
output            o_pixel_data_valid,
output reg o_intr

);

reg [8:0] pixelCounter;   // count to control currentRdLineBuffer, dk lineBuffer
reg [1:0] currentWrLineBuffer;
reg [3:0] lineBuffDataValid;
reg [1:0] currentRdLineBuffer;
reg [3:0] lineBuffRdData;

wire [23:0] lb0data;
wire [23:0] lb1data;
wire [23:0] lb2data;
wire [23:0] lb3data;

reg [8:0] rdCounter;
reg rd_line_buffer;   // tin hiẹu cho doc du lieu tu line buffer,

reg [11:0] totalPixelCounter;  // 512x4 = 2048 => 12 bit

reg rdState;
localparam IDLE = 'b0,
            RD_BUFFER = 'b1;

assign o_pixel_data_valid = rd_line_buffer;
always @ (posedge i_clk)
begin
    if(i_rst)
	begin
	    totalPixelCounter <= 0;
	end
	else
	begin
	    if(i_pixel_data_valid & !rd_line_buffer)     // rd_line_buffer = 0;    1 and !(0) = 1
	        totalPixelCounter <= totalPixelCounter + 1;
		else if (!i_pixel_data_valid & rd_line_buffer)    // 0 and 1 = 0
		    totalPixelCounter <= totalPixelCounter - 1;
	end
end

// design FSM: xac dinh cac trang thai
always @ (posedge i_clk)
begin
    if(i_rst)
	begin
	    rdState <= IDLE;
		rd_line_buffer <= 1'b0;
		o_intr <= 1'b0;
	end
	else
	begin
	    case(rdState)
		    IDLE:
			    begin
				o_intr <= 1'b0;
				    if(totalPixelCounter >= 1536)   // count 3 line buffer: 512 x 3 = 1536, dem xong thi toan bo du lieu da luu trong 3 line buffer
					// sau do la xuat du lieu ra 
					    begin
						    rd_line_buffer <= 1'b1; // xuat du lieu tu line buffer ra
							
							/*
							chuyen sang trang thai RD_BUFFER => da duoc kernel 3x3
							*/
							rdState <= RD_BUFFER;
						end
				end
				/* 
				rdCounter: dem va ghi xong du lieu vao 1 line buffer, dem 512 pixel => IDLE, vi ca 3 buffer deu xuat data
				*/
			RD_BUFFER:
			    begin
				    if(rdCounter == 511)    // for 1 line buffer 
					begin
					    rdState <= IDLE;
						rd_line_buffer <= 1'b0;
						o_intr <= 1'b1;
					end
				end
			
		endcase
	end
end
always @ (posedge i_clk)
begin
    if(i_rst)
	    pixelCounter <= 0;
	else
	begin
	    if(i_pixel_data_valid)
		    pixelCounter <= pixelCounter + 1;
	end
end

always @ (posedge i_clk)
begin
    if(i_rst)
	    currentWrLineBuffer <= 0;
	else
	begin
	    if(pixelCounter == 511 & i_pixel_data_valid)   // read all pixel in one line
		    currentWrLineBuffer <= currentWrLineBuffer + 1;
		    
		    
	end
end

always @ (*)
begin
    lineBuffDataValid = 4'b0;
	lineBuffDataValid[currentWrLineBuffer] = i_pixel_data_valid;
	
end
always @ (posedge i_clk)
begin
    if(i_rst)
	    rdCounter <= 0;
	else
	begin
	    if(rd_line_buffer)
		    rdCounter <= rdCounter + 1;
	end
end
always @ (posedge i_clk)
begin
    if(i_rst)
	begin
	    currentRdLineBuffer <= 0;
	end
	
	else
	begin
	   if(rdCounter == 511 & rd_line_buffer)
	       currentRdLineBuffer <= currentRdLineBuffer + 1;
	end
end
always @ (*)
begin
    case(currentRdLineBuffer)
	    0:
		    begin
			o_pixel_data = {lb2data,lb1data,lb0data};
			end
		1:
		    begin
			o_pixel_data = {lb3data,lb2data,lb1data};
			end
		2:
		    begin
			o_pixel_data = {lb0data, lb3data, lb2data};
			end
		3:
		    begin
			o_pixel_data = {lb1data, lb0data, lb3data};
			end
		
	    
	endcase
end
always @ (*)
begin
    case (currentRdLineBuffer)
	    0:
		    begin
			    lineBuffRdData[0] = rd_line_buffer;
				lineBuffRdData[1] = rd_line_buffer;
				lineBuffRdData[2] = rd_line_buffer;
			    lineBuffRdData[3] = 1'b0;
			end
		1:
		    begin
			    lineBuffRdData[0] = 1'b0;
				lineBuffRdData[1] = rd_line_buffer;
				lineBuffRdData[2] = rd_line_buffer;
			    lineBuffRdData[3] = rd_line_buffer;			
			end
		
		2:
		    begin
			    lineBuffRdData[0] = rd_line_buffer;
				lineBuffRdData[1] = 1'b0;
				lineBuffRdData[2] = rd_line_buffer;
			    lineBuffRdData[3] = rd_line_buffer;
			end
		3:
		    begin
			    lineBuffRdData[0] = rd_line_buffer;
				lineBuffRdData[1] = rd_line_buffer;
				lineBuffRdData[2] = 1'b0;
			    lineBuffRdData[3] = rd_line_buffer;
			end
    endcase
end
// Call module lineBuffer and connect with module image Control 
lineBuffer lB0
(
.i_clk(i_clk),
.i_rst(i_rst),
.i_data(i_pixel_data),
.i_data_valid(lineBuffDataValid[0]),
.i_rd_data(lineBuffRdData[0]),
.o_data(lb0data)
);

lineBuffer lB1
(
.i_clk(i_clk),
.i_rst(i_rst),
.i_data(i_pixel_data),
.i_data_valid(lineBuffDataValid[1]),
.i_rd_data(lineBuffRdData[1]),
.o_data(lb1data)
);

lineBuffer lB2
(
.i_clk(i_clk),
.i_rst(i_rst),
.i_data(i_pixel_data),
.i_data_valid(lineBuffDataValid[2]),
.i_rd_data(lineBuffRdData[2]),
.o_data(lb2data)
);

lineBuffer lB3
(
.i_clk(i_clk),
.i_rst(i_rst),
.i_data(i_pixel_data),
.i_data_valid(lineBuffDataValid[3]),
.i_rd_data(lineBuffRdData[3]),
.o_data(lb3data)
);



endmodule