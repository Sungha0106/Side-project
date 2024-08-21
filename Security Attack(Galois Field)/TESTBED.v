//############################################################################
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//   (C) Copyright Laboratory System Integration and Silicon Implementation
//   All Right Reserved
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
//   2020 ICLAB Fall Course
//   Lab06       : GF inverse array
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

module TESTBED;

//Connection wires
wire [4:0] in_data;
wire [5:0] poly;
wire [2:0] deg;
wire in_valid;
wire rst_n;
wire clk;
wire [4:0] out_data;
wire out_valid;

initial
begin
    // `ifdef RTL
    // $fsdbDumpfile("GF_IA.fsdb");
    // $fsdbDumpvars(0,"+mda");
    // `endif

`ifdef GATE
    $sdf_annotate("GF_IA_syn.sdf",My_DESIGN);
    $fsdbDumpfile("GF_IA_syn.fsdb");
    $fsdbDumpvars(0,"+mda");
`endif
end


GF_IA My_DESIGN(
          .in_valid(in_valid),
          .in_data(in_data),
          .deg(deg),
          .poly(poly),
          .rst_n(rst_n),
          .clk(clk),
          .out_data(out_data),
          .out_valid(out_valid)
      );
PATTERN My_PATTERN(
            .in_valid(in_valid),
            .in_data(in_data),
            .deg(deg),
            .poly(poly),
            .rst_n(rst_n),
            .clk(clk),
            .out_data(out_data),
            .out_valid(out_valid)
        );

endmodule
