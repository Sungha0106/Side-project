//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   2020 ICLAB Fall Course
//   Lab06       : GF 2k Arithmetic Soft IP
//   Author      : Tien-Hui Lee (bnfw623@gmail.com)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : TESTBED.v
//   Module Name : TESTBED
//   Release version : v1.0
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################
`timescale 1ns/1ps

// `ifdef RTL
//   `include "PATTERN_IP.v"
//   `include "GF2k_demo.v"
// `endif

// `ifdef GATE
//   `include "GF2k_demo_SYN.v"
//   `include "PATTERN_IP.v"
// `endif

module TESTBED;
parameter ADD  = 0;
parameter SUB  = 1;
parameter MULT = 2;
parameter DIV  = 3;

parameter DEG = 5, OP = DIV;

//Connection wires
wire [DEG:0] POLY;
wire [DEG-1:0] IN1, IN2, RESULT;

initial
begin
    // `ifdef RTL
    $fsdbDumpfile("GF2k_demo.fsdb");
    $fsdbDumpvars(0,"+mda");
`ifdef GATE

    $sdf_annotate("GF2k_demo_syn.sdf",My_IP);
    $fsdbDumpfile("GF2k_syn.fsdb");
    $fsdbDumpvars(0,"+mda");
`endif
end

// `ifdef RTL
// GF2k_demo #(.DEG(DEG), .OP(OP)) My_IP(
//               .POLY(POLY),
//               .IN1(IN1),
//               .IN2(IN2),
//               .RESULT(RESULT)
//           );

// PATTERN_IP #(.DEG(DEG), .OP(OP)) My_PATTERN(
//                .POLY(POLY),
//                .IN1(IN1),
//                .IN2(IN2),
//                .RESULT(RESULT)
//            );
// `endif
// `ifdef GATE

GF2k_demo My_IP(
              .POLY(POLY),
              .IN1(IN1),
              .IN2(IN2),
              .RESULT(RESULT)
          );

PATTERN_IP #(.DEG(DEG), .OP(OP)) My_PATTERN(
               .POLY(POLY),
               .IN1(IN1),
               .IN2(IN2),
               .RESULT(RESULT)
           );
// `endif

endmodule
