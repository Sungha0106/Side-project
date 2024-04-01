/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03
// Date      : Sat Feb 24 20:04:00 2024
/////////////////////////////////////////////////////////////


module HD ( code_word1, code_word2, out_n );
  input [6:0] code_word1;
  input [6:0] code_word2;
  output [5:0] out_n;
  wire   N76, \DP_OP_17J1_122_3460/n34 , \DP_OP_17J1_122_3460/n16 ,
         \DP_OP_17J1_122_3460/n15 , \DP_OP_17J1_122_3460/n14 ,
         \DP_OP_17J1_122_3460/n13 , \DP_OP_17J1_122_3460/n11 ,
         \DP_OP_17J1_122_3460/n6 , \DP_OP_17J1_122_3460/n5 ,
         \DP_OP_17J1_122_3460/n4 , \DP_OP_17J1_122_3460/n3 ,
         \DP_OP_17J1_122_3460/n2 , n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268;
  wire   [5:0] c1_wire;

  CMPR32X2 \DP_OP_17J1_122_3460/U4  ( .A(\DP_OP_17J1_122_3460/n13 ), .B(
        c1_wire[3]), .C(\DP_OP_17J1_122_3460/n4 ), .CO(
        \DP_OP_17J1_122_3460/n3 ), .S(out_n[3]) );
  CMPR32X2 \DP_OP_17J1_122_3460/U5  ( .A(\DP_OP_17J1_122_3460/n14 ), .B(
        c1_wire[2]), .C(\DP_OP_17J1_122_3460/n5 ), .CO(
        \DP_OP_17J1_122_3460/n4 ), .S(out_n[2]) );
  CMPR32X2 \DP_OP_17J1_122_3460/U6  ( .A(\DP_OP_17J1_122_3460/n15 ), .B(
        c1_wire[1]), .C(\DP_OP_17J1_122_3460/n6 ), .CO(
        \DP_OP_17J1_122_3460/n5 ), .S(out_n[1]) );
  CMPR32X2 \DP_OP_17J1_122_3460/U7  ( .A(c1_wire[0]), .B(N76), .C(
        \DP_OP_17J1_122_3460/n16 ), .CO(\DP_OP_17J1_122_3460/n6 ), .S(out_n[0]) );
  CMPR32X2 \DP_OP_17J1_122_3460/U3  ( .A(\DP_OP_17J1_122_3460/n11 ), .B(
        \DP_OP_17J1_122_3460/n34 ), .C(\DP_OP_17J1_122_3460/n3 ), .CO(
        \DP_OP_17J1_122_3460/n2 ), .S(out_n[4]) );
  CLKXOR2X2 U158 ( .A(\DP_OP_17J1_122_3460/n11 ), .B(n205), .Y(out_n[5]) );
  CLKXOR2X2 U159 ( .A(\DP_OP_17J1_122_3460/n2 ), .B(\DP_OP_17J1_122_3460/n34 ), 
        .Y(n205) );
  CLKMX2X4 U160 ( .A(\DP_OP_17J1_122_3460/n34 ), .B(n206), .S0(n207), .Y(
        c1_wire[3]) );
  CLKMX2X4 U161 ( .A(n206), .B(n208), .S0(n207), .Y(c1_wire[2]) );
  CLKXOR2X2 U162 ( .A(code_word1[2]), .B(n209), .Y(n206) );
  NOR2X2 U163 ( .A(n210), .B(n211), .Y(n209) );
  CLKMX2X4 U164 ( .A(n208), .B(n212), .S0(n207), .Y(c1_wire[1]) );
  CLKXOR2X2 U165 ( .A(code_word1[1]), .B(n213), .Y(n208) );
  AND3X2 U166 ( .A(n214), .B(n210), .C(n211), .Y(n213) );
  NOR2BX2 U167 ( .AN(n212), .B(n207), .Y(c1_wire[0]) );
  CLKXOR2X2 U168 ( .A(code_word1[0]), .B(n215), .Y(n212) );
  AND3X2 U169 ( .A(n211), .B(n216), .C(n217), .Y(n215) );
  AND2X4 U170 ( .A(n218), .B(n219), .Y(\DP_OP_17J1_122_3460/n34 ) );
  OAI21X2 U171 ( .A0(n210), .A1(n220), .B0(n221), .Y(n218) );
  CLKXOR2X2 U172 ( .A(n222), .B(N76), .Y(\DP_OP_17J1_122_3460/n16 ) );
  NOR2BX2 U173 ( .AN(n223), .B(n224), .Y(n222) );
  CLKMX2X4 U174 ( .A(n225), .B(n226), .S0(n207), .Y(\DP_OP_17J1_122_3460/n15 )
         );
  CLKXOR2X2 U175 ( .A(n223), .B(N76), .Y(n225) );
  CLKMX2X4 U176 ( .A(code_word2[0]), .B(n227), .S0(n228), .Y(n223) );
  NOR2X2 U177 ( .A(n229), .B(n230), .Y(n228) );
  CLKMX2X4 U178 ( .A(n226), .B(n231), .S0(n207), .Y(\DP_OP_17J1_122_3460/n14 )
         );
  CLKXOR2X2 U179 ( .A(n232), .B(N76), .Y(n226) );
  CLKMX2X4 U180 ( .A(code_word2[1]), .B(n233), .S0(n234), .Y(n232) );
  NOR2X2 U181 ( .A(n229), .B(n235), .Y(n234) );
  CLKMX2X4 U182 ( .A(n231), .B(\DP_OP_17J1_122_3460/n11 ), .S0(n207), .Y(
        \DP_OP_17J1_122_3460/n13 ) );
  CLKXOR2X2 U183 ( .A(n236), .B(N76), .Y(n231) );
  CLKXOR2X2 U184 ( .A(code_word2[2]), .B(n237), .Y(n236) );
  AND3X2 U185 ( .A(n230), .B(n235), .C(n229), .Y(n237) );
  INVX3 U186 ( .A(n238), .Y(n229) );
  CLKXOR2X2 U187 ( .A(n239), .B(N76), .Y(\DP_OP_17J1_122_3460/n11 ) );
  CLKXOR2X2 U188 ( .A(n207), .B(n240), .Y(N76) );
  AOI2BB1X2 U189 ( .A0N(n241), .A1N(n242), .B0(n243), .Y(n240) );
  CLKMX2X4 U190 ( .A(n244), .B(n245), .S0(n230), .Y(n243) );
  OA21X2 U191 ( .A0(n246), .A1(n247), .B0(n242), .Y(n245) );
  CLKMX2X4 U192 ( .A(n248), .B(n249), .S0(n238), .Y(n247) );
  INVX3 U193 ( .A(n233), .Y(n249) );
  NOR2BX2 U194 ( .AN(code_word2[6]), .B(n235), .Y(n248) );
  NOR2BX2 U195 ( .AN(code_word2[2]), .B(n250), .Y(n246) );
  AO21X2 U196 ( .A0(n250), .A1(code_word2[4]), .B0(n251), .Y(n244) );
  CLKMX2X4 U197 ( .A(n252), .B(n253), .S0(n238), .Y(n251) );
  NOR2BX2 U198 ( .AN(code_word2[0]), .B(n227), .Y(n253) );
  AND2X4 U199 ( .A(code_word2[5]), .B(n235), .Y(n252) );
  INVX3 U200 ( .A(n235), .Y(n250) );
  INVX3 U201 ( .A(n224), .Y(n207) );
  NAND2X2 U202 ( .A(n254), .B(n219), .Y(n224) );
  OR3X2 U203 ( .A(n220), .B(n221), .C(n210), .Y(n219) );
  MXI3X2 U204 ( .A(code_word1[4]), .B(n255), .C(n256), .S0(n216), .S1(n214), 
        .Y(n254) );
  AOI2BB1X2 U205 ( .A0N(n220), .A1N(n210), .B0(n257), .Y(n256) );
  AOI2BB1X2 U206 ( .A0N(n258), .A1N(n210), .B0(n259), .Y(n257) );
  CLKMX2X4 U207 ( .A(n260), .B(code_word1[1]), .S0(n211), .Y(n259) );
  NOR2BX2 U208 ( .AN(code_word1[6]), .B(n216), .Y(n260) );
  INVX3 U209 ( .A(code_word1[2]), .Y(n258) );
  NAND2X2 U210 ( .A(n214), .B(n216), .Y(n210) );
  CLKXOR2X2 U211 ( .A(n261), .B(n262), .Y(n216) );
  CLKXOR2X2 U212 ( .A(code_word1[5]), .B(code_word1[3]), .Y(n262) );
  CLKXOR2X2 U213 ( .A(code_word1[0]), .B(code_word1[2]), .Y(n261) );
  INVX3 U214 ( .A(n217), .Y(n214) );
  CLKXOR2X2 U215 ( .A(n263), .B(n264), .Y(n217) );
  CLKXOR2X2 U216 ( .A(code_word1[6]), .B(code_word1[2]), .Y(n264) );
  CLKMX2X4 U217 ( .A(code_word1[5]), .B(code_word1[0]), .S0(n211), .Y(n255) );
  INVX3 U218 ( .A(n220), .Y(n211) );
  CLKXOR2X2 U219 ( .A(n263), .B(n265), .Y(n220) );
  CLKXOR2X2 U220 ( .A(code_word1[4]), .B(code_word1[0]), .Y(n265) );
  CLKXOR2X2 U221 ( .A(code_word1[1]), .B(n221), .Y(n263) );
  INVX3 U222 ( .A(code_word1[3]), .Y(n221) );
  CLKXOR2X2 U223 ( .A(n242), .B(n241), .Y(n239) );
  INVX3 U224 ( .A(code_word2[3]), .Y(n241) );
  NAND3X2 U225 ( .A(n238), .B(n235), .C(n230), .Y(n242) );
  CLKXOR2X2 U226 ( .A(n233), .B(code_word2[1]), .Y(n230) );
  CLKXOR2X2 U227 ( .A(n266), .B(code_word2[6]), .Y(n233) );
  CLKXOR2X2 U228 ( .A(n227), .B(code_word2[0]), .Y(n235) );
  CLKXOR2X2 U229 ( .A(n266), .B(code_word2[5]), .Y(n227) );
  CLKXOR2X2 U230 ( .A(code_word2[2]), .B(code_word2[3]), .Y(n266) );
  CLKXOR2X2 U231 ( .A(n267), .B(n268), .Y(n238) );
  CLKXOR2X2 U232 ( .A(code_word2[4]), .B(code_word2[3]), .Y(n268) );
  CLKXOR2X2 U233 ( .A(code_word2[1]), .B(code_word2[0]), .Y(n267) );
endmodule

