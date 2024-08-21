//synopsys translate_off
`include "GF2k.v"
//synopsys translate_on

module GF2k_demo #(parameter DEG = 5, parameter OP = 3)(
           POLY,IN1,IN2,//in_valid,clk,
           RESULT//,out_valid
       );

//input in_valid;
input[DEG:0] POLY;
input[DEG-1:0] IN1;
input[DEG-1:0] IN2;
output [DEG-1:0] RESULT;
//output out_valid;
GF2k #(.DEG(DEG), .OP(OP)) I_GF2k(.POLY(POLY), .IN1(IN1), .IN2(IN2),.RESULT(RESULT));

endmodule
