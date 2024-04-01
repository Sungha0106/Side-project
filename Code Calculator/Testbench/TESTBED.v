//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   ICLAB 2023 Fall
//   Lab01 Exercise		: Supper MOSFET Calculator
//   Author     		: Lin-Hung Lai (lhlai@ieee.org)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   File Name   : TESTBED.v
//   Module Name : TESTBED
//   Release version : V1.0 (Release Date: 2023-09)
//
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//############################################################################

`timescale 1ns/10ps
// `ifdef GATE
//   `include "CC_syn.v"
// `endif
module TESTBED;

//Connection wires
wire [2:0] opt;
wire [3:0] in_n0, in_n1, in_n2, in_n3, in_n4;
wire [9:0] out_n;

initial
begin
`ifdef RTL

`endif
    // $fsdbDumpfile("CC.fsdb");
    // $fsdbDumpvars(0,"+mda");
    // $fsdbDumpvars();
`ifdef GATE
    $sdf_annotate("CC_syn.sdf", DUT_CC);
    // $fsdbDumpfile("CC_SYN.fsdb");
    // $fsdbDumpvars(0,"+mda");
    // $fsdbDumpvars();
`endif
end

CC DUT_CC(
       .opt(opt),
       .in_n0(in_n0), .in_n1(in_n1), .in_n2(in_n2), .in_n3(in_n3), .in_n4(in_n4),
       .out_n(out_n)
   );

PATTERN My_PATTERN(
            .opt(opt),
            .in_n0(in_n0), .in_n1(in_n1), .in_n2(in_n2), .in_n3(in_n3), .in_n4(in_n4),
            .out_n(out_n)
        );

endmodule
