`timescale 1ns / 1ps
 
module four_bit_comp(G, L, E, a0, a1, a2, a3, b0, b1, b2, b3);
    input a0, a1, a2, a3, b0, b1, b2, b3;
    output G, L, E;
    
    wire g1, g2, l1, l2, e1, e2;
    
    two_bit_comp comp1(g2, l2, e2, a3, a2, b3, b2);
    two_bit_comp comp2(g1, l1, e1, a1, a0, b1, b0);
    
    assign G = (g2)|(e2&g1);
    assign L = (l2)|(e2&l1);
    assign E = e1&e2; 
endmodule
 
module two_bit_comp(G, L, E, a1, a0, b1, b0);
    input a1, a0, b1, b0;
    output G, L, E;
    
    assign G = ((a1)&(~b1))|(((a1)~^(b1))&((a0)&(~b0)));
    assign L = ((~a1)&(b1))|(((a1)~^(b1))&((~a0)&(b0)));
    assign E = (a1~^b1)&(a0~^b0);
endmodule
