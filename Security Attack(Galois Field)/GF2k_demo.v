`include "/home/lab911_1/Desktop/7112064132/Iclab_2021_Fall/ICLAB_06/GF2k.v"

module GF2k_demo(
           POLY,IN1,IN2,//in_valid,clk,
           RESULT//,out_valid
       );

parameter DEG = 4, OP = 3;
//input in_valid;
input[DEG:0] POLY;
input[DEG-1:0] IN1;
input[DEG-1:0] IN2;
output [DEG-1:0] RESULT;
//output out_valid;
GF2k #(.DEG(DEG), .OP(OP)) I_GF2k(.POLY(POLY), .IN1(IN1), .IN2(IN2),.RESULT(RESULT));

endmodule

