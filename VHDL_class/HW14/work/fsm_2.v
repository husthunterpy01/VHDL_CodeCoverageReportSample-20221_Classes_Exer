module fsm2(
input wire clk, reset,
input wire a,
output y0
);

localparam [1:0] s0 = 2'b00,
		 s1 = 2'b01,
		 s2 = 2'b10,
                 s3 = 2'b11;
// signal declaration
reg [1 : 0] state_reg, state_next;

// state register
always @(posedge clk, posedge reset)
if (reset)
state_reg <= s0;
else state_reg <= state_next;

// next-state logic and output logic
always @*
case(state_reg)
s0: 
   if (a==1)
	state_next = s1;
	else 
	state_next = s0;
s1: 
if(a == 1)
	state_next =s2;
else 
state_next = s1;

s2:    
if(a == 0)
state_next = s3;
else 
state_next = s1;

s3:
if ( a == 1) 
state_next = s1;
else 
state_next = s0;
endcase


assign y0 = (state_reg ==s3);


endmodule	
