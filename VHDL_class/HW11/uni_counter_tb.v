`timescale 1ns/10ps

module bin_counter_tb();

localparam T =20;  //clock period
reg clk,reset;
reg syn_clr, load, en, up;
reg [2:0] d;
wire max_tick, min_tick;
wire [2:0] q;

univ_bin_counter #(.N(3)) uut
(.clk(clk),
.reset(reset),
.syn_clr(syn_clr),
.load(load),
.en(en),
.up(up),
.d(d),
.max_tick(max_tick),
.min_tick(min_tick),
.q(q));

always 
begin 
clk = 1'b1;
#(T/2);
clk = 1'b0;
#(T/2);
end

initial 
begin 
reset = 1'b1;
#(T/2);
reset = 1'b0;
end

//Other stimulus
initial 
begin
// === initial input ===
syn_clr = 1'b0;
load = 1'b0;
en =1'b0;
up = 1'b1;
d = 3'b000;
@(negedge reset);
@(negedge clk);

load = 1'b1;
d = 3'b011;
@(negedge clk);
load = 1'b0;
repeat (2) @(negedge clk);
// === Test syn_clr ====
syn_clr = 1'b1;
@(negedge clk);
syn_clr = 1'b0;
// == Test up counter and pause ==
en = 1'b1;
up = 1'b1;
repeat(10) @(negedge clk);
en =1'b0;
repeat(2) @(negedge clk);
en = 1'b1;
repeat(2) @(negedge clk);

// === test down counter ===
up = 1'b0;
repeat(10) @(negedge clk);
// === wait statement ===
// continue till q = 2
wait (q ==2);
@(negedge clk);univ_bin_counter #(.N(3)) uut
(.clk(clk),
.reset(reset),
.syn_clr(syn_clr),
.load(load),
.en(en),
.up(up),
.d(d),
.max_tick(max_tick),
.min_tick(min_tick),
.q(q));

always 
begin 
clk = 1'b1;
#(T/2);
clk = 1'b0;
#(T/2);
end

initial 
begin 
reset = 1'b1;
#(T/2);
reset = 1'b0;
end

//Other stimulus
initial 
begin
// === initial input ===
syn_clr = 1'b0;
load = 1'b0;
en =1'b0;
up = 1'b1;
d = 3'b000;
@(negedge reset);
@(negedge clk);

load = 1'b1;
d = 3'b011;
@(negedge clk);
load = 1'b0;
repeat (2) @(negedge clk);
// === Test syn_clr ====
syn_clr = 1'b1;
@(negedge clk);
syn_clr = 1'b0;
// == Test up counter and pause ==
en = 1'b1;
up = 1'b1;
repeat(10) @(negedge clk);
en =1'b0;
repeat(2) @(negedge clk);
en = 1'b1;
repeat(2) @(negedge clk);

// === test down counter ===
up = 1'b0;
repeat(10) @(negedge clk);
// === wait statement ===

up = 1'b1;
// continue until min_tick becomes 1
@(negedge clk);
wait(min_tick);
@(negedge clk);
up = 1'b0;
// === absolute delay ===
#(4*T);
en = 1'b0;
#(4*T);
$stop;
end 
initial
$monitor($time, " clk=%b reset=%b syn_clr=%b load=%b en=%b up=%b d=%b q=%b min_tick=%b max_tick=%b", clk, reset,syn_clr,load,en,up,d,q,min_tick,max_tick);
endmodule