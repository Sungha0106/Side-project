/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03
// Date      : Fri Feb  2 20:08:50 2024
/////////////////////////////////////////////////////////////


module geofence_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [22:0] A;
  input [22:0] B;
  output [22:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23;
  wire   [23:0] carry;

  ADDFXL U2_1 ( .A(A[1]), .B(n22), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFXL U2_2 ( .A(A[2]), .B(n21), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFXL U2_3 ( .A(A[3]), .B(n20), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFXL U2_4 ( .A(A[4]), .B(n19), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFXL U2_5 ( .A(A[5]), .B(n18), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFXL U2_6 ( .A(A[6]), .B(n17), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFXL U2_7 ( .A(A[7]), .B(n16), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n15), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFXL U2_9 ( .A(A[9]), .B(n14), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_10 ( .A(A[10]), .B(n13), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFXL U2_11 ( .A(A[11]), .B(n12), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFXL U2_12 ( .A(A[12]), .B(n11), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFXL U2_13 ( .A(A[13]), .B(n10), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDFXL U2_14 ( .A(A[14]), .B(n9), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFXL U2_15 ( .A(A[15]), .B(n8), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF[15]) );
  ADDFXL U2_16 ( .A(A[16]), .B(n7), .CI(carry[16]), .CO(carry[17]), .S(
        DIFF[16]) );
  ADDFXL U2_17 ( .A(A[17]), .B(n6), .CI(carry[17]), .CO(carry[18]), .S(
        DIFF[17]) );
  ADDFXL U2_18 ( .A(A[18]), .B(n5), .CI(carry[18]), .CO(carry[19]), .S(
        DIFF[18]) );
  ADDFXL U2_19 ( .A(A[19]), .B(n4), .CI(carry[19]), .CO(carry[20]), .S(
        DIFF[19]) );
  ADDFXL U2_20 ( .A(A[20]), .B(n3), .CI(carry[20]), .CO(carry[21]), .S(
        DIFF[20]) );
  ADDFXL U2_21 ( .A(A[21]), .B(n2), .CI(carry[21]), .CO(carry[22]), .S(
        DIFF[21]) );
  XOR3X1 U2_22 ( .A(A[22]), .B(n2), .C(carry[22]), .Y(DIFF[22]) );
  CLKINVX1 U1 ( .A(B[22]), .Y(n2) );
  CLKINVX1 U2 ( .A(B[0]), .Y(n23) );
  XNOR2X1 U3 ( .A(n23), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U4 ( .A(B[20]), .Y(n3) );
  CLKINVX1 U5 ( .A(B[19]), .Y(n4) );
  CLKINVX1 U6 ( .A(B[18]), .Y(n5) );
  CLKINVX1 U7 ( .A(B[17]), .Y(n6) );
  CLKINVX1 U8 ( .A(B[16]), .Y(n7) );
  CLKINVX1 U9 ( .A(B[15]), .Y(n8) );
  CLKINVX1 U10 ( .A(B[14]), .Y(n9) );
  CLKINVX1 U11 ( .A(B[13]), .Y(n10) );
  CLKINVX1 U12 ( .A(B[12]), .Y(n11) );
  CLKINVX1 U13 ( .A(B[11]), .Y(n12) );
  CLKINVX1 U14 ( .A(B[10]), .Y(n13) );
  CLKINVX1 U15 ( .A(B[9]), .Y(n14) );
  CLKINVX1 U16 ( .A(B[8]), .Y(n15) );
  CLKINVX1 U17 ( .A(B[7]), .Y(n16) );
  CLKINVX1 U18 ( .A(B[6]), .Y(n17) );
  CLKINVX1 U19 ( .A(B[5]), .Y(n18) );
  CLKINVX1 U20 ( .A(B[4]), .Y(n19) );
  CLKINVX1 U21 ( .A(B[3]), .Y(n20) );
  CLKINVX1 U22 ( .A(B[2]), .Y(n21) );
  NAND2X1 U23 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U24 ( .A(B[1]), .Y(n22) );
  CLKINVX1 U25 ( .A(A[0]), .Y(n1) );
endmodule


module geofence_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16
;
  wire   [12:0] carry;

  ADDFHX1 U2_8 ( .A(A[8]), .B(n12), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFXL U2_2 ( .A(A[2]), .B(n15), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFHX2 U2_7 ( .A(A[7]), .B(n8), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFHX2 U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFHX4 U2_4 ( .A(A[4]), .B(n14), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFHX4 U2_9 ( .A(A[9]), .B(n9), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFHX1 U2_1 ( .A(A[1]), .B(n5), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFHX2 U2_10 ( .A(A[10]), .B(n11), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFHX2 U2_6 ( .A(A[6]), .B(n13), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFHX1 U2_0 ( .A(A[0]), .B(n16), .CI(1'b1), .CO(carry[1]), .S(DIFF[0]) );
  XOR2X1 U1 ( .A(carry[5]), .B(n1), .Y(DIFF[5]) );
  NAND3X4 U2 ( .A(n2), .B(n3), .C(n4), .Y(carry[6]) );
  INVX4 U3 ( .A(B[1]), .Y(n5) );
  INVX3 U4 ( .A(B[2]), .Y(n15) );
  NAND2X4 U5 ( .A(n7), .B(carry[5]), .Y(n2) );
  NAND2X4 U6 ( .A(A[5]), .B(carry[5]), .Y(n3) );
  INVX3 U7 ( .A(B[0]), .Y(n16) );
  XOR2XL U8 ( .A(n7), .B(A[5]), .Y(n1) );
  NAND2XL U9 ( .A(A[5]), .B(n7), .Y(n4) );
  INVXL U10 ( .A(B[9]), .Y(n9) );
  INVXL U11 ( .A(B[4]), .Y(n14) );
  INVXL U12 ( .A(B[3]), .Y(n6) );
  CLKINVX1 U13 ( .A(B[11]), .Y(n10) );
  CLKINVX1 U14 ( .A(B[7]), .Y(n8) );
  CLKINVX1 U15 ( .A(B[8]), .Y(n12) );
  INVXL U16 ( .A(B[10]), .Y(n11) );
  CLKINVX1 U17 ( .A(B[5]), .Y(n7) );
  CLKINVX1 U18 ( .A(B[6]), .Y(n13) );
  XOR2X4 U19 ( .A(n10), .B(carry[11]), .Y(DIFF[11]) );
endmodule


module geofence_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;
  wire   [12:0] carry;

  ADDFHX2 U2_7 ( .A(A[7]), .B(n13), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFHX2 U2_10 ( .A(A[10]), .B(n12), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFHX2 U2_5 ( .A(A[5]), .B(n18), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFHX2 U2_8 ( .A(A[8]), .B(n21), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFHX4 U2_1 ( .A(A[1]), .B(n14), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFHX1 U2_9 ( .A(A[9]), .B(n20), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFHX1 U2_6 ( .A(A[6]), .B(n19), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFHX2 U2_4 ( .A(A[4]), .B(n17), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFHX4 U2_2 ( .A(A[2]), .B(n15), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  CLKXOR2X2 U1 ( .A(A[3]), .B(n16), .Y(n1) );
  XOR2X4 U2 ( .A(carry[3]), .B(n1), .Y(DIFF[3]) );
  NAND2X1 U3 ( .A(A[3]), .B(carry[3]), .Y(n2) );
  NAND2X1 U4 ( .A(n16), .B(carry[3]), .Y(n3) );
  NAND2X1 U5 ( .A(n16), .B(A[3]), .Y(n4) );
  NAND3X2 U6 ( .A(n2), .B(n3), .C(n4), .Y(carry[4]) );
  NAND2X1 U7 ( .A(n9), .B(n10), .Y(carry[1]) );
  NAND2X2 U8 ( .A(n7), .B(n8), .Y(DIFF[11]) );
  NAND2X1 U9 ( .A(A[11]), .B(carry[11]), .Y(n7) );
  NAND2X1 U10 ( .A(n5), .B(n6), .Y(n8) );
  CLKINVX1 U11 ( .A(A[11]), .Y(n5) );
  CLKINVX1 U12 ( .A(carry[11]), .Y(n6) );
  INVX1 U13 ( .A(n11), .Y(n9) );
  INVXL U14 ( .A(B[0]), .Y(n11) );
  INVXL U15 ( .A(B[8]), .Y(n21) );
  INVXL U16 ( .A(B[9]), .Y(n20) );
  INVXL U17 ( .A(B[1]), .Y(n14) );
  INVXL U18 ( .A(B[3]), .Y(n16) );
  INVXL U19 ( .A(B[6]), .Y(n19) );
  INVXL U20 ( .A(B[5]), .Y(n18) );
  INVXL U21 ( .A(B[2]), .Y(n15) );
  INVXL U22 ( .A(B[4]), .Y(n17) );
  INVXL U23 ( .A(A[0]), .Y(n10) );
  XNOR2XL U24 ( .A(n11), .B(A[0]), .Y(DIFF[0]) );
  INVXL U25 ( .A(B[7]), .Y(n13) );
  INVXL U26 ( .A(B[10]), .Y(n12) );
endmodule


module geofence_DW01_sub_3 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [11:0] carry;

  ADDFXL U2_9 ( .A(A[9]), .B(n2), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n3), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n4), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n5), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n6), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n7), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n8), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n9), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFXL U2_1 ( .A(A[1]), .B(n10), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  XNOR2X1 U1 ( .A(n11), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(n1) );
  CLKINVX1 U3 ( .A(B[1]), .Y(n10) );
  NAND2X1 U4 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U5 ( .A(B[2]), .Y(n9) );
  CLKINVX1 U6 ( .A(B[3]), .Y(n8) );
  CLKINVX1 U7 ( .A(B[4]), .Y(n7) );
  CLKINVX1 U8 ( .A(B[5]), .Y(n6) );
  CLKINVX1 U9 ( .A(B[6]), .Y(n5) );
  CLKINVX1 U10 ( .A(B[0]), .Y(n11) );
  CLKINVX1 U11 ( .A(B[7]), .Y(n4) );
  CLKINVX1 U12 ( .A(B[8]), .Y(n3) );
  CLKINVX1 U13 ( .A(B[9]), .Y(n2) );
  CLKINVX1 U14 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module geofence_DW01_sub_4 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [11:0] carry;

  ADDFXL U2_9 ( .A(A[9]), .B(n2), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n3), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n4), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n5), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n6), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n7), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n8), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n9), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFXL U2_1 ( .A(A[1]), .B(n10), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  XNOR2X1 U1 ( .A(n11), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(n1) );
  CLKINVX1 U3 ( .A(B[1]), .Y(n10) );
  NAND2X1 U4 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U5 ( .A(B[2]), .Y(n9) );
  CLKINVX1 U6 ( .A(B[3]), .Y(n8) );
  CLKINVX1 U7 ( .A(B[4]), .Y(n7) );
  CLKINVX1 U8 ( .A(B[5]), .Y(n6) );
  CLKINVX1 U9 ( .A(B[6]), .Y(n5) );
  CLKINVX1 U10 ( .A(B[7]), .Y(n4) );
  CLKINVX1 U11 ( .A(B[8]), .Y(n3) );
  CLKINVX1 U12 ( .A(B[9]), .Y(n2) );
  CLKINVX1 U13 ( .A(B[0]), .Y(n11) );
  CLKINVX1 U14 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module geofence_DW01_sub_5 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [11:0] carry;

  ADDFXL U2_9 ( .A(A[9]), .B(n2), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n3), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n4), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n5), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n6), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n7), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n8), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n9), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFXL U2_1 ( .A(A[1]), .B(n10), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  XNOR2X1 U1 ( .A(n11), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(n1) );
  CLKINVX1 U3 ( .A(B[1]), .Y(n10) );
  NAND2X1 U4 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U5 ( .A(B[2]), .Y(n9) );
  CLKINVX1 U6 ( .A(B[3]), .Y(n8) );
  CLKINVX1 U7 ( .A(B[4]), .Y(n7) );
  CLKINVX1 U8 ( .A(B[5]), .Y(n6) );
  CLKINVX1 U9 ( .A(B[6]), .Y(n5) );
  CLKINVX1 U10 ( .A(B[7]), .Y(n4) );
  CLKINVX1 U11 ( .A(B[8]), .Y(n3) );
  CLKINVX1 U12 ( .A(B[0]), .Y(n11) );
  CLKINVX1 U13 ( .A(B[9]), .Y(n2) );
  CLKINVX1 U14 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module geofence_DW01_sub_6 ( A, B, CI, DIFF, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [11:0] carry;

  ADDFXL U2_9 ( .A(A[9]), .B(n2), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n3), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFXL U2_7 ( .A(A[7]), .B(n4), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFXL U2_6 ( .A(A[6]), .B(n5), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n6), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFXL U2_4 ( .A(A[4]), .B(n7), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFXL U2_3 ( .A(A[3]), .B(n8), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFXL U2_2 ( .A(A[2]), .B(n9), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFXL U2_1 ( .A(A[1]), .B(n10), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  XNOR2X1 U1 ( .A(n11), .B(A[0]), .Y(DIFF[0]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(n1) );
  CLKINVX1 U3 ( .A(B[1]), .Y(n10) );
  NAND2X1 U4 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1 U5 ( .A(B[2]), .Y(n9) );
  CLKINVX1 U6 ( .A(B[3]), .Y(n8) );
  CLKINVX1 U7 ( .A(B[4]), .Y(n7) );
  CLKINVX1 U8 ( .A(B[5]), .Y(n6) );
  CLKINVX1 U9 ( .A(B[6]), .Y(n5) );
  CLKINVX1 U10 ( .A(B[7]), .Y(n4) );
  CLKINVX1 U11 ( .A(B[0]), .Y(n11) );
  CLKINVX1 U12 ( .A(B[8]), .Y(n3) );
  CLKINVX1 U13 ( .A(B[9]), .Y(n2) );
  CLKINVX1 U14 ( .A(carry[10]), .Y(DIFF[10]) );
endmodule


module geofence_DW01_add_3_DW01_add_5 ( A, B, CI, SUM, CO );
  input [12:0] A;
  input [12:0] B;
  output [12:0] SUM;
  input CI;
  output CO;

  wire   [12:1] carry;

  ADDFXL U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFXL U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFXL U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFXL U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(SUM[11]), .S(
        SUM[10]) );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFXL U1_0 ( .A(A[0]), .B(B[0]), .CI(1'b0), .CO(carry[1]), .S(SUM[0]) );
endmodule


module geofence_DW_mult_tc_1 ( a, b, product );
  input [11:0] a;
  input [11:0] b;
  output [23:0] product;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n26, n27, n28, n29, n30, n31, n33, n34,
         n35, n36, n37, n38, n39, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493;

  ADDFXL U5 ( .A(n27), .B(n26), .CI(n5), .CO(n4), .S(product[21]) );
  ADDFXL U6 ( .A(n29), .B(n28), .CI(n6), .CO(n5), .S(product[20]) );
  ADDFXL U7 ( .A(n30), .B(n34), .CI(n7), .CO(n6), .S(product[19]) );
  ADDFXL U8 ( .A(n37), .B(n35), .CI(n8), .CO(n7), .S(product[18]) );
  ADDFXL U9 ( .A(n38), .B(n42), .CI(n9), .CO(n8), .S(product[17]) );
  ADDFXL U10 ( .A(n43), .B(n47), .CI(n10), .CO(n9), .S(product[16]) );
  ADDFXL U11 ( .A(n48), .B(n54), .CI(n11), .CO(n10), .S(product[15]) );
  ADDFXL U12 ( .A(n55), .B(n60), .CI(n12), .CO(n11), .S(product[14]) );
  ADDFXL U13 ( .A(n61), .B(n68), .CI(n13), .CO(n12), .S(product[13]) );
  ADDFXL U14 ( .A(n69), .B(n76), .CI(n14), .CO(n13), .S(product[12]) );
  ADDFXL U15 ( .A(n77), .B(n84), .CI(n15), .CO(n14), .S(product[11]) );
  ADDFXL U16 ( .A(n85), .B(n90), .CI(n16), .CO(n15), .S(product[10]) );
  ADDFXL U17 ( .A(n91), .B(n97), .CI(n17), .CO(n16), .S(product[9]) );
  ADDFXL U18 ( .A(n98), .B(n102), .CI(n18), .CO(n17), .S(product[8]) );
  ADDFXL U19 ( .A(n103), .B(n107), .CI(n19), .CO(n18), .S(product[7]) );
  ADDFXL U20 ( .A(n109), .B(n108), .CI(n20), .CO(n19), .S(product[6]) );
  ADDFXL U21 ( .A(n110), .B(n113), .CI(n21), .CO(n20), .S(product[5]) );
  ADDFXL U22 ( .A(n114), .B(n115), .CI(n22), .CO(n21), .S(product[4]) );
  ADDFXL U23 ( .A(n116), .B(n121), .CI(n23), .CO(n22), .S(product[3]) );
  ADDFXL U24 ( .A(n193), .B(n182), .CI(n24), .CO(n23), .S(product[2]) );
  ADDHXL U25 ( .A(n122), .B(n194), .CO(n24), .S(product[1]) );
  ADDFXL U27 ( .A(n31), .B(n135), .CI(n124), .CO(n27), .S(n28) );
  ADDFXL U28 ( .A(n396), .B(n125), .CI(n33), .CO(n29), .S(n30) );
  CMPR42X1 U30 ( .A(n147), .B(n136), .C(n39), .D(n126), .ICI(n36), .S(n35), 
        .ICO(n33), .CO(n34) );
  CMPR42X1 U31 ( .A(n137), .B(n127), .C(n399), .D(n44), .ICI(n41), .S(n38), 
        .ICO(n36), .CO(n37) );
  CMPR42X1 U33 ( .A(n148), .B(n138), .C(n45), .D(n49), .ICI(n46), .S(n43), 
        .ICO(n41), .CO(n42) );
  ADDFXL U34 ( .A(n51), .B(n158), .CI(n128), .CO(n44), .S(n45) );
  CMPR42X1 U35 ( .A(n401), .B(n56), .C(n57), .D(n50), .ICI(n53), .S(n48), 
        .ICO(n46), .CO(n47) );
  ADDFXL U36 ( .A(n139), .B(n129), .CI(n149), .CO(n49), .S(n50) );
  CMPR42X1 U38 ( .A(n150), .B(n140), .C(n58), .D(n63), .ICI(n59), .S(n55), 
        .ICO(n53), .CO(n54) );
  CMPR42X1 U39 ( .A(n170), .B(n130), .C(n65), .D(n159), .ICI(n62), .S(n58), 
        .ICO(n56), .CO(n57) );
  CMPR42X1 U40 ( .A(n398), .B(n70), .C(n71), .D(n64), .ICI(n67), .S(n61), 
        .ICO(n59), .CO(n60) );
  CMPR42X1 U41 ( .A(n141), .B(n171), .C(n160), .D(n131), .ICI(n73), .S(n64), 
        .ICO(n62), .CO(n63) );
  CMPR42X1 U43 ( .A(n81), .B(n74), .C(n79), .D(n72), .ICI(n75), .S(n69), .ICO(
        n67), .CO(n68) );
  CMPR42X1 U44 ( .A(n161), .B(n132), .C(n151), .D(n142), .ICI(n78), .S(n72), 
        .ICO(n70), .CO(n71) );
  CMPR42X1 U47 ( .A(n162), .B(n82), .C(n87), .D(n80), .ICI(n83), .S(n77), 
        .ICO(n75), .CO(n76) );
  CMPR42X1 U48 ( .A(n184), .B(n143), .C(n173), .D(n152), .ICI(n86), .S(n80), 
        .ICO(n78), .CO(n79) );
  ADDHXL U49 ( .A(n133), .B(n117), .CO(n81), .S(n82) );
  CMPR42X1 U50 ( .A(n163), .B(n94), .C(n88), .D(n92), .ICI(n89), .S(n85), 
        .ICO(n83), .CO(n84) );
  CMPR42X1 U51 ( .A(n134), .B(n153), .C(n185), .D(n174), .ICI(n144), .S(n88), 
        .ICO(n86), .CO(n87) );
  CMPR42X1 U52 ( .A(n186), .B(n95), .C(n96), .D(n99), .ICI(n93), .S(n91), 
        .ICO(n89), .CO(n90) );
  ADDFXL U53 ( .A(n154), .B(n164), .CI(n175), .CO(n92), .S(n93) );
  ADDHXL U54 ( .A(n145), .B(n118), .CO(n94), .S(n95) );
  CMPR42X1 U55 ( .A(n176), .B(n155), .C(n104), .D(n101), .ICI(n100), .S(n98), 
        .ICO(n96), .CO(n97) );
  ADDFXL U56 ( .A(n165), .B(n146), .CI(n187), .CO(n99), .S(n100) );
  CMPR42X1 U57 ( .A(n188), .B(n166), .C(n177), .D(n106), .ICI(n105), .S(n103), 
        .ICO(n101), .CO(n102) );
  ADDHXL U58 ( .A(n156), .B(n119), .CO(n104), .S(n105) );
  CMPR42X1 U59 ( .A(n157), .B(n189), .C(n178), .D(n167), .ICI(n111), .S(n108), 
        .ICO(n106), .CO(n107) );
  ADDFXL U60 ( .A(n179), .B(n190), .CI(n112), .CO(n109), .S(n110) );
  ADDHXL U61 ( .A(n168), .B(n120), .CO(n111), .S(n112) );
  ADDFXL U62 ( .A(n191), .B(n169), .CI(n180), .CO(n113), .S(n114) );
  ADDHXL U63 ( .A(n192), .B(n181), .CO(n115), .S(n116) );
  CLKINVX1 U281 ( .A(n65), .Y(n398) );
  CLKINVX1 U282 ( .A(n51), .Y(n401) );
  NAND2X1 U283 ( .A(n395), .B(n378), .Y(n407) );
  NOR2X1 U284 ( .A(n387), .B(n482), .Y(n132) );
  NOR2X1 U285 ( .A(n387), .B(n483), .Y(n131) );
  NOR2X1 U286 ( .A(n387), .B(n484), .Y(n130) );
  NOR2X1 U287 ( .A(n387), .B(n485), .Y(n129) );
  NOR2X1 U288 ( .A(n387), .B(n487), .Y(n127) );
  CLKINVX1 U289 ( .A(n39), .Y(n399) );
  NOR2X1 U290 ( .A(n387), .B(n488), .Y(n126) );
  NAND2X1 U291 ( .A(n395), .B(n378), .Y(n26) );
  CLKINVX1 U292 ( .A(n387), .Y(n395) );
  CLKBUFX3 U293 ( .A(n413), .Y(n379) );
  NAND2X1 U294 ( .A(n380), .B(n490), .Y(n413) );
  CLKINVX1 U295 ( .A(n389), .Y(n404) );
  CLKBUFX3 U296 ( .A(n414), .Y(n380) );
  XOR2X1 U297 ( .A(a[2]), .B(n404), .Y(n414) );
  CLKINVX1 U298 ( .A(n390), .Y(n403) );
  NAND2X2 U299 ( .A(n389), .B(n405), .Y(n416) );
  CLKBUFX3 U300 ( .A(n422), .Y(n382) );
  XOR2X1 U301 ( .A(a[4]), .B(n403), .Y(n422) );
  CLKBUFX3 U302 ( .A(n425), .Y(n381) );
  NAND2X1 U303 ( .A(n382), .B(n491), .Y(n425) );
  CLKINVX1 U304 ( .A(n391), .Y(n402) );
  INVX3 U305 ( .A(a[0]), .Y(n405) );
  CLKINVX1 U306 ( .A(n388), .Y(n406) );
  CLKBUFX3 U307 ( .A(n420), .Y(n384) );
  XOR2X1 U308 ( .A(a[6]), .B(n402), .Y(n420) );
  CLKBUFX3 U309 ( .A(n419), .Y(n383) );
  NAND2X1 U310 ( .A(n384), .B(n492), .Y(n419) );
  CLKINVX1 U311 ( .A(n392), .Y(n400) );
  CLKBUFX3 U312 ( .A(n428), .Y(n386) );
  XOR2X1 U313 ( .A(a[8]), .B(n400), .Y(n428) );
  CLKBUFX3 U314 ( .A(n431), .Y(n385) );
  NAND2X1 U315 ( .A(n386), .B(n493), .Y(n431) );
  CLKINVX1 U316 ( .A(n393), .Y(n397) );
  CLKBUFX3 U317 ( .A(n409), .Y(n387) );
  XOR2X1 U318 ( .A(a[10]), .B(n397), .Y(n409) );
  NOR3X1 U319 ( .A(n387), .B(n394), .C(n388), .Y(n117) );
  NOR2X1 U320 ( .A(n387), .B(n481), .Y(n133) );
  CLKINVX1 U321 ( .A(a[10]), .Y(n394) );
  NOR2X1 U322 ( .A(n387), .B(n486), .Y(n128) );
  NOR2X1 U323 ( .A(n387), .B(n489), .Y(n125) );
  CLKINVX1 U324 ( .A(n31), .Y(n396) );
  NOR2X1 U325 ( .A(n387), .B(n432), .Y(n124) );
  XOR2X1 U326 ( .A(b[11]), .B(a[11]), .Y(n378) );
  CLKBUFX3 U327 ( .A(a[1]), .Y(n389) );
  CLKBUFX3 U328 ( .A(a[3]), .Y(n390) );
  CLKBUFX3 U329 ( .A(a[5]), .Y(n391) );
  CLKBUFX3 U330 ( .A(b[0]), .Y(n388) );
  CLKBUFX3 U331 ( .A(a[7]), .Y(n392) );
  CLKBUFX3 U332 ( .A(a[9]), .Y(n393) );
  XOR2X1 U333 ( .A(n407), .B(n408), .Y(product[22]) );
  XNOR2X1 U334 ( .A(n26), .B(n4), .Y(n408) );
  NOR2X1 U335 ( .A(n405), .B(n406), .Y(product[0]) );
  XOR2X1 U336 ( .A(n410), .B(n411), .Y(n74) );
  NAND2BX1 U337 ( .AN(n410), .B(n411), .Y(n73) );
  OA22X1 U338 ( .A0(n412), .A1(n379), .B0(n380), .B1(n415), .Y(n411) );
  OAI2BB1X1 U339 ( .A0N(n405), .A1N(n416), .B0(n417), .Y(n410) );
  OAI22XL U340 ( .A0(n418), .A1(n383), .B0(n384), .B1(n421), .Y(n65) );
  OAI22XL U341 ( .A0(n382), .A1(n423), .B0(n424), .B1(n381), .Y(n51) );
  OAI22XL U342 ( .A0(n384), .A1(n426), .B0(n427), .B1(n383), .Y(n39) );
  OAI22XL U343 ( .A0(n386), .A1(n429), .B0(n430), .B1(n385), .Y(n31) );
  OAI22XL U344 ( .A0(n388), .A1(n416), .B0(n433), .B1(n405), .Y(n194) );
  OAI22XL U345 ( .A0(n433), .A1(n416), .B0(n434), .B1(n405), .Y(n193) );
  XNOR2X1 U346 ( .A(b[1]), .B(n389), .Y(n433) );
  OAI22XL U347 ( .A0(n434), .A1(n416), .B0(n435), .B1(n405), .Y(n192) );
  XNOR2X1 U348 ( .A(b[2]), .B(n389), .Y(n434) );
  OAI22XL U349 ( .A0(n435), .A1(n416), .B0(n436), .B1(n405), .Y(n191) );
  XNOR2X1 U350 ( .A(b[3]), .B(n389), .Y(n435) );
  OAI22XL U351 ( .A0(n436), .A1(n416), .B0(n437), .B1(n405), .Y(n190) );
  XNOR2X1 U352 ( .A(b[4]), .B(n389), .Y(n436) );
  OAI22XL U353 ( .A0(n437), .A1(n416), .B0(n438), .B1(n405), .Y(n189) );
  XNOR2X1 U354 ( .A(b[5]), .B(n389), .Y(n437) );
  OAI22XL U355 ( .A0(n438), .A1(n416), .B0(n439), .B1(n405), .Y(n188) );
  XNOR2X1 U356 ( .A(b[6]), .B(n389), .Y(n438) );
  OAI22XL U357 ( .A0(n439), .A1(n416), .B0(n440), .B1(n405), .Y(n187) );
  XNOR2X1 U358 ( .A(b[7]), .B(n389), .Y(n439) );
  OAI22XL U359 ( .A0(n440), .A1(n416), .B0(n441), .B1(n405), .Y(n186) );
  XNOR2X1 U360 ( .A(b[8]), .B(n389), .Y(n440) );
  OAI22XL U361 ( .A0(n441), .A1(n416), .B0(n442), .B1(n405), .Y(n185) );
  XNOR2X1 U362 ( .A(b[9]), .B(n389), .Y(n441) );
  OAI2BB2XL U363 ( .B0(n442), .B1(n416), .A0N(n417), .A1N(a[0]), .Y(n184) );
  XNOR2X1 U364 ( .A(b[11]), .B(n404), .Y(n417) );
  XNOR2X1 U365 ( .A(b[10]), .B(n389), .Y(n442) );
  NOR2X1 U366 ( .A(n380), .B(n406), .Y(n182) );
  OAI22XL U367 ( .A0(n443), .A1(n379), .B0(n380), .B1(n444), .Y(n181) );
  XNOR2X1 U368 ( .A(n390), .B(n388), .Y(n443) );
  OAI22XL U369 ( .A0(n444), .A1(n379), .B0(n380), .B1(n445), .Y(n180) );
  XNOR2X1 U370 ( .A(b[1]), .B(n390), .Y(n444) );
  OAI22XL U371 ( .A0(n445), .A1(n379), .B0(n380), .B1(n446), .Y(n179) );
  XNOR2X1 U372 ( .A(b[2]), .B(n390), .Y(n445) );
  OAI22XL U373 ( .A0(n446), .A1(n379), .B0(n380), .B1(n447), .Y(n178) );
  XNOR2X1 U374 ( .A(b[3]), .B(n390), .Y(n446) );
  OAI22XL U375 ( .A0(n447), .A1(n379), .B0(n380), .B1(n448), .Y(n177) );
  XNOR2X1 U376 ( .A(b[4]), .B(n390), .Y(n447) );
  OAI22XL U377 ( .A0(n448), .A1(n379), .B0(n380), .B1(n449), .Y(n176) );
  XNOR2X1 U378 ( .A(b[5]), .B(n390), .Y(n448) );
  OAI22XL U379 ( .A0(n449), .A1(n379), .B0(n380), .B1(n450), .Y(n175) );
  XNOR2X1 U380 ( .A(b[6]), .B(n390), .Y(n449) );
  OAI22XL U381 ( .A0(n450), .A1(n379), .B0(n380), .B1(n451), .Y(n174) );
  XNOR2X1 U382 ( .A(b[7]), .B(n390), .Y(n450) );
  OAI22XL U383 ( .A0(n451), .A1(n379), .B0(n380), .B1(n412), .Y(n173) );
  XNOR2X1 U384 ( .A(b[9]), .B(n390), .Y(n412) );
  XNOR2X1 U385 ( .A(b[8]), .B(n390), .Y(n451) );
  OAI22XL U386 ( .A0(n415), .A1(n379), .B0(n380), .B1(n452), .Y(n171) );
  XNOR2X1 U387 ( .A(b[10]), .B(n390), .Y(n415) );
  AO21X1 U388 ( .A0(n379), .A1(n380), .B0(n452), .Y(n170) );
  XNOR2X1 U389 ( .A(b[11]), .B(n390), .Y(n452) );
  NOR2X1 U390 ( .A(n382), .B(n406), .Y(n169) );
  OAI22XL U391 ( .A0(n453), .A1(n381), .B0(n382), .B1(n454), .Y(n168) );
  XNOR2X1 U392 ( .A(n391), .B(n388), .Y(n453) );
  OAI22XL U393 ( .A0(n454), .A1(n381), .B0(n382), .B1(n455), .Y(n167) );
  XNOR2X1 U394 ( .A(b[1]), .B(n391), .Y(n454) );
  OAI22XL U395 ( .A0(n455), .A1(n381), .B0(n382), .B1(n456), .Y(n166) );
  XNOR2X1 U396 ( .A(b[2]), .B(n391), .Y(n455) );
  OAI22XL U397 ( .A0(n456), .A1(n381), .B0(n382), .B1(n457), .Y(n165) );
  XNOR2X1 U398 ( .A(b[3]), .B(n391), .Y(n456) );
  OAI22XL U399 ( .A0(n457), .A1(n381), .B0(n382), .B1(n458), .Y(n164) );
  XNOR2X1 U400 ( .A(b[4]), .B(n391), .Y(n457) );
  OAI22XL U401 ( .A0(n458), .A1(n381), .B0(n382), .B1(n459), .Y(n163) );
  XNOR2X1 U402 ( .A(b[5]), .B(n391), .Y(n458) );
  OAI22XL U403 ( .A0(n459), .A1(n381), .B0(n382), .B1(n460), .Y(n162) );
  XNOR2X1 U404 ( .A(b[6]), .B(n391), .Y(n459) );
  OAI22XL U405 ( .A0(n460), .A1(n381), .B0(n382), .B1(n461), .Y(n161) );
  XNOR2X1 U406 ( .A(b[7]), .B(n391), .Y(n460) );
  OAI22XL U407 ( .A0(n461), .A1(n381), .B0(n382), .B1(n462), .Y(n160) );
  XNOR2X1 U408 ( .A(b[8]), .B(n391), .Y(n461) );
  OAI22XL U409 ( .A0(n462), .A1(n381), .B0(n382), .B1(n424), .Y(n159) );
  XNOR2X1 U410 ( .A(b[10]), .B(n391), .Y(n424) );
  XNOR2X1 U411 ( .A(b[9]), .B(n391), .Y(n462) );
  AO21X1 U412 ( .A0(n381), .A1(n382), .B0(n423), .Y(n158) );
  XNOR2X1 U413 ( .A(b[11]), .B(n391), .Y(n423) );
  NOR2X1 U414 ( .A(n384), .B(n406), .Y(n157) );
  OAI22XL U415 ( .A0(n463), .A1(n383), .B0(n384), .B1(n464), .Y(n156) );
  XNOR2X1 U416 ( .A(n392), .B(n388), .Y(n463) );
  OAI22XL U417 ( .A0(n464), .A1(n383), .B0(n384), .B1(n465), .Y(n155) );
  XNOR2X1 U418 ( .A(b[1]), .B(n392), .Y(n464) );
  OAI22XL U419 ( .A0(n465), .A1(n383), .B0(n384), .B1(n466), .Y(n154) );
  XNOR2X1 U420 ( .A(b[2]), .B(n392), .Y(n465) );
  OAI22XL U421 ( .A0(n466), .A1(n383), .B0(n384), .B1(n467), .Y(n153) );
  XNOR2X1 U422 ( .A(b[3]), .B(n392), .Y(n466) );
  OAI22XL U423 ( .A0(n467), .A1(n383), .B0(n384), .B1(n468), .Y(n152) );
  XNOR2X1 U424 ( .A(b[4]), .B(n392), .Y(n467) );
  OAI22XL U425 ( .A0(n468), .A1(n383), .B0(n384), .B1(n418), .Y(n151) );
  XNOR2X1 U426 ( .A(b[6]), .B(n392), .Y(n418) );
  XNOR2X1 U427 ( .A(b[5]), .B(n392), .Y(n468) );
  OAI22XL U428 ( .A0(n421), .A1(n383), .B0(n384), .B1(n469), .Y(n150) );
  XNOR2X1 U429 ( .A(b[7]), .B(n392), .Y(n421) );
  OAI22XL U430 ( .A0(n469), .A1(n383), .B0(n384), .B1(n470), .Y(n149) );
  XNOR2X1 U431 ( .A(b[8]), .B(n392), .Y(n469) );
  OAI22XL U432 ( .A0(n470), .A1(n383), .B0(n384), .B1(n427), .Y(n148) );
  XNOR2X1 U433 ( .A(b[10]), .B(n392), .Y(n427) );
  XNOR2X1 U434 ( .A(b[9]), .B(n392), .Y(n470) );
  AO21X1 U435 ( .A0(n383), .A1(n384), .B0(n426), .Y(n147) );
  XNOR2X1 U436 ( .A(b[11]), .B(n392), .Y(n426) );
  NOR2X1 U437 ( .A(n386), .B(n406), .Y(n146) );
  OAI22XL U438 ( .A0(n471), .A1(n385), .B0(n386), .B1(n472), .Y(n145) );
  XNOR2X1 U439 ( .A(n393), .B(n388), .Y(n471) );
  OAI22XL U440 ( .A0(n472), .A1(n385), .B0(n386), .B1(n473), .Y(n144) );
  XNOR2X1 U441 ( .A(b[1]), .B(n393), .Y(n472) );
  OAI22XL U442 ( .A0(n473), .A1(n385), .B0(n386), .B1(n474), .Y(n143) );
  XNOR2X1 U443 ( .A(b[2]), .B(n393), .Y(n473) );
  OAI22XL U444 ( .A0(n474), .A1(n385), .B0(n386), .B1(n475), .Y(n142) );
  XNOR2X1 U445 ( .A(b[3]), .B(n393), .Y(n474) );
  OAI22XL U446 ( .A0(n475), .A1(n385), .B0(n386), .B1(n476), .Y(n141) );
  XNOR2X1 U447 ( .A(b[4]), .B(n393), .Y(n475) );
  OAI22XL U448 ( .A0(n476), .A1(n385), .B0(n386), .B1(n477), .Y(n140) );
  XNOR2X1 U449 ( .A(b[5]), .B(n393), .Y(n476) );
  OAI22XL U450 ( .A0(n477), .A1(n385), .B0(n386), .B1(n478), .Y(n139) );
  XNOR2X1 U451 ( .A(b[6]), .B(n393), .Y(n477) );
  OAI22XL U452 ( .A0(n478), .A1(n385), .B0(n386), .B1(n479), .Y(n138) );
  XNOR2X1 U453 ( .A(b[7]), .B(n393), .Y(n478) );
  OAI22XL U454 ( .A0(n479), .A1(n385), .B0(n386), .B1(n480), .Y(n137) );
  XNOR2X1 U455 ( .A(b[8]), .B(n393), .Y(n479) );
  OAI22XL U456 ( .A0(n480), .A1(n385), .B0(n386), .B1(n430), .Y(n136) );
  XNOR2X1 U457 ( .A(b[10]), .B(n393), .Y(n430) );
  XNOR2X1 U458 ( .A(b[9]), .B(n393), .Y(n480) );
  AO21X1 U459 ( .A0(n385), .A1(n386), .B0(n429), .Y(n135) );
  XNOR2X1 U460 ( .A(b[11]), .B(n393), .Y(n429) );
  NOR2X1 U461 ( .A(n387), .B(n406), .Y(n134) );
  XNOR2X1 U462 ( .A(b[1]), .B(a[11]), .Y(n481) );
  XNOR2X1 U463 ( .A(b[2]), .B(a[11]), .Y(n482) );
  XNOR2X1 U464 ( .A(b[3]), .B(a[11]), .Y(n483) );
  XNOR2X1 U465 ( .A(b[4]), .B(a[11]), .Y(n484) );
  XNOR2X1 U466 ( .A(b[5]), .B(a[11]), .Y(n485) );
  XNOR2X1 U467 ( .A(b[6]), .B(a[11]), .Y(n486) );
  XNOR2X1 U468 ( .A(b[7]), .B(a[11]), .Y(n487) );
  XNOR2X1 U469 ( .A(b[8]), .B(a[11]), .Y(n488) );
  XNOR2X1 U470 ( .A(b[10]), .B(a[11]), .Y(n432) );
  XNOR2X1 U471 ( .A(b[9]), .B(a[11]), .Y(n489) );
  OAI21XL U472 ( .A0(n388), .A1(n404), .B0(n416), .Y(n122) );
  OAI32X1 U473 ( .A0(n403), .A1(n388), .A2(n380), .B0(n403), .B1(n379), .Y(
        n121) );
  XNOR2X1 U474 ( .A(n403), .B(a[2]), .Y(n490) );
  OAI32X1 U475 ( .A0(n402), .A1(n388), .A2(n382), .B0(n402), .B1(n381), .Y(
        n120) );
  XNOR2X1 U476 ( .A(n402), .B(a[4]), .Y(n491) );
  OAI32X1 U477 ( .A0(n400), .A1(n388), .A2(n384), .B0(n400), .B1(n383), .Y(
        n119) );
  XNOR2X1 U478 ( .A(n400), .B(a[6]), .Y(n492) );
  OAI32X1 U479 ( .A0(n397), .A1(n388), .A2(n386), .B0(n397), .B1(n385), .Y(
        n118) );
  XNOR2X1 U480 ( .A(n397), .B(a[8]), .Y(n493) );
endmodule


module geofence_DW_mult_tc_0 ( a, b, product );
  input [11:0] a;
  input [11:0] b;
  output [23:0] product;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n26, n27, n28, n29, n30, n31, n33, n34,
         n35, n36, n37, n38, n39, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493;

  ADDFXL U5 ( .A(n27), .B(n26), .CI(n5), .CO(n4), .S(product[21]) );
  ADDFXL U6 ( .A(n29), .B(n28), .CI(n6), .CO(n5), .S(product[20]) );
  ADDFXL U7 ( .A(n30), .B(n34), .CI(n7), .CO(n6), .S(product[19]) );
  ADDFXL U8 ( .A(n37), .B(n35), .CI(n8), .CO(n7), .S(product[18]) );
  ADDFXL U9 ( .A(n38), .B(n42), .CI(n9), .CO(n8), .S(product[17]) );
  ADDFXL U10 ( .A(n43), .B(n47), .CI(n10), .CO(n9), .S(product[16]) );
  ADDFXL U11 ( .A(n48), .B(n54), .CI(n11), .CO(n10), .S(product[15]) );
  ADDFXL U12 ( .A(n55), .B(n60), .CI(n12), .CO(n11), .S(product[14]) );
  ADDFXL U13 ( .A(n61), .B(n68), .CI(n13), .CO(n12), .S(product[13]) );
  ADDFXL U14 ( .A(n69), .B(n76), .CI(n14), .CO(n13), .S(product[12]) );
  ADDFXL U15 ( .A(n77), .B(n84), .CI(n15), .CO(n14), .S(product[11]) );
  ADDFXL U16 ( .A(n85), .B(n90), .CI(n16), .CO(n15), .S(product[10]) );
  ADDFXL U17 ( .A(n91), .B(n97), .CI(n17), .CO(n16), .S(product[9]) );
  ADDFXL U18 ( .A(n98), .B(n102), .CI(n18), .CO(n17), .S(product[8]) );
  ADDFXL U19 ( .A(n103), .B(n107), .CI(n19), .CO(n18), .S(product[7]) );
  ADDFXL U20 ( .A(n109), .B(n108), .CI(n20), .CO(n19), .S(product[6]) );
  ADDFXL U21 ( .A(n110), .B(n113), .CI(n21), .CO(n20), .S(product[5]) );
  ADDFXL U22 ( .A(n114), .B(n115), .CI(n22), .CO(n21), .S(product[4]) );
  ADDFXL U23 ( .A(n116), .B(n121), .CI(n23), .CO(n22), .S(product[3]) );
  ADDFXL U24 ( .A(n193), .B(n182), .CI(n24), .CO(n23), .S(product[2]) );
  ADDHXL U25 ( .A(n122), .B(n194), .CO(n24), .S(product[1]) );
  ADDFXL U27 ( .A(n31), .B(n135), .CI(n124), .CO(n27), .S(n28) );
  ADDFXL U28 ( .A(n396), .B(n125), .CI(n33), .CO(n29), .S(n30) );
  CMPR42X1 U30 ( .A(n147), .B(n136), .C(n39), .D(n126), .ICI(n36), .S(n35), 
        .ICO(n33), .CO(n34) );
  CMPR42X1 U31 ( .A(n137), .B(n127), .C(n399), .D(n44), .ICI(n41), .S(n38), 
        .ICO(n36), .CO(n37) );
  CMPR42X1 U33 ( .A(n148), .B(n138), .C(n45), .D(n49), .ICI(n46), .S(n43), 
        .ICO(n41), .CO(n42) );
  ADDFXL U34 ( .A(n51), .B(n158), .CI(n128), .CO(n44), .S(n45) );
  CMPR42X1 U35 ( .A(n401), .B(n56), .C(n57), .D(n50), .ICI(n53), .S(n48), 
        .ICO(n46), .CO(n47) );
  ADDFXL U36 ( .A(n139), .B(n129), .CI(n149), .CO(n49), .S(n50) );
  CMPR42X1 U38 ( .A(n150), .B(n140), .C(n58), .D(n63), .ICI(n59), .S(n55), 
        .ICO(n53), .CO(n54) );
  CMPR42X1 U39 ( .A(n170), .B(n130), .C(n65), .D(n159), .ICI(n62), .S(n58), 
        .ICO(n56), .CO(n57) );
  CMPR42X1 U40 ( .A(n398), .B(n70), .C(n71), .D(n64), .ICI(n67), .S(n61), 
        .ICO(n59), .CO(n60) );
  CMPR42X1 U41 ( .A(n141), .B(n171), .C(n160), .D(n131), .ICI(n73), .S(n64), 
        .ICO(n62), .CO(n63) );
  CMPR42X1 U43 ( .A(n81), .B(n74), .C(n79), .D(n72), .ICI(n75), .S(n69), .ICO(
        n67), .CO(n68) );
  CMPR42X1 U44 ( .A(n161), .B(n132), .C(n151), .D(n142), .ICI(n78), .S(n72), 
        .ICO(n70), .CO(n71) );
  CMPR42X1 U47 ( .A(n162), .B(n82), .C(n87), .D(n80), .ICI(n83), .S(n77), 
        .ICO(n75), .CO(n76) );
  CMPR42X1 U48 ( .A(n184), .B(n143), .C(n173), .D(n152), .ICI(n86), .S(n80), 
        .ICO(n78), .CO(n79) );
  ADDHXL U49 ( .A(n133), .B(n117), .CO(n81), .S(n82) );
  CMPR42X1 U50 ( .A(n163), .B(n94), .C(n88), .D(n92), .ICI(n89), .S(n85), 
        .ICO(n83), .CO(n84) );
  CMPR42X1 U51 ( .A(n134), .B(n153), .C(n185), .D(n174), .ICI(n144), .S(n88), 
        .ICO(n86), .CO(n87) );
  CMPR42X1 U52 ( .A(n186), .B(n95), .C(n96), .D(n99), .ICI(n93), .S(n91), 
        .ICO(n89), .CO(n90) );
  ADDFXL U53 ( .A(n154), .B(n164), .CI(n175), .CO(n92), .S(n93) );
  ADDHXL U54 ( .A(n145), .B(n118), .CO(n94), .S(n95) );
  CMPR42X1 U55 ( .A(n176), .B(n155), .C(n104), .D(n101), .ICI(n100), .S(n98), 
        .ICO(n96), .CO(n97) );
  ADDFXL U56 ( .A(n165), .B(n146), .CI(n187), .CO(n99), .S(n100) );
  CMPR42X1 U57 ( .A(n188), .B(n166), .C(n177), .D(n106), .ICI(n105), .S(n103), 
        .ICO(n101), .CO(n102) );
  ADDHXL U58 ( .A(n156), .B(n119), .CO(n104), .S(n105) );
  CMPR42X1 U59 ( .A(n157), .B(n189), .C(n178), .D(n167), .ICI(n111), .S(n108), 
        .ICO(n106), .CO(n107) );
  ADDFXL U60 ( .A(n179), .B(n190), .CI(n112), .CO(n109), .S(n110) );
  ADDHXL U61 ( .A(n168), .B(n120), .CO(n111), .S(n112) );
  ADDFXL U62 ( .A(n191), .B(n169), .CI(n180), .CO(n113), .S(n114) );
  ADDHXL U63 ( .A(n192), .B(n181), .CO(n115), .S(n116) );
  CLKINVX1 U281 ( .A(n65), .Y(n398) );
  CLKINVX1 U282 ( .A(n51), .Y(n401) );
  NAND2X1 U283 ( .A(n395), .B(n378), .Y(n407) );
  NOR2X1 U284 ( .A(n387), .B(n482), .Y(n132) );
  NOR2X1 U285 ( .A(n387), .B(n483), .Y(n131) );
  NOR2X1 U286 ( .A(n387), .B(n484), .Y(n130) );
  NOR2X1 U287 ( .A(n387), .B(n485), .Y(n129) );
  NOR2X1 U288 ( .A(n387), .B(n487), .Y(n127) );
  CLKINVX1 U289 ( .A(n39), .Y(n399) );
  NOR2X1 U290 ( .A(n387), .B(n488), .Y(n126) );
  NAND2X1 U291 ( .A(n395), .B(n378), .Y(n26) );
  CLKINVX1 U292 ( .A(n387), .Y(n395) );
  CLKINVX1 U293 ( .A(n389), .Y(n404) );
  CLKBUFX3 U294 ( .A(n414), .Y(n380) );
  XOR2X1 U295 ( .A(a[2]), .B(n404), .Y(n414) );
  CLKBUFX3 U296 ( .A(n413), .Y(n379) );
  NAND2X1 U297 ( .A(n380), .B(n490), .Y(n413) );
  CLKINVX1 U298 ( .A(n390), .Y(n403) );
  CLKBUFX3 U299 ( .A(n422), .Y(n382) );
  XOR2X1 U300 ( .A(a[4]), .B(n403), .Y(n422) );
  CLKBUFX3 U301 ( .A(n425), .Y(n381) );
  NAND2X1 U302 ( .A(n382), .B(n491), .Y(n425) );
  CLKINVX1 U303 ( .A(n391), .Y(n402) );
  NAND2X2 U304 ( .A(n389), .B(n405), .Y(n416) );
  INVX3 U305 ( .A(a[0]), .Y(n405) );
  CLKINVX1 U306 ( .A(n388), .Y(n406) );
  CLKBUFX3 U307 ( .A(n420), .Y(n384) );
  XOR2X1 U308 ( .A(a[6]), .B(n402), .Y(n420) );
  CLKBUFX3 U309 ( .A(n419), .Y(n383) );
  NAND2X1 U310 ( .A(n384), .B(n492), .Y(n419) );
  CLKINVX1 U311 ( .A(n392), .Y(n400) );
  CLKINVX1 U312 ( .A(n393), .Y(n397) );
  CLKBUFX3 U313 ( .A(n431), .Y(n385) );
  NAND2X1 U314 ( .A(n386), .B(n493), .Y(n431) );
  CLKBUFX3 U315 ( .A(n428), .Y(n386) );
  XOR2X1 U316 ( .A(a[8]), .B(n400), .Y(n428) );
  CLKBUFX3 U317 ( .A(n409), .Y(n387) );
  XOR2X1 U318 ( .A(a[10]), .B(n397), .Y(n409) );
  NOR3X1 U319 ( .A(n387), .B(n394), .C(n388), .Y(n117) );
  NOR2X1 U320 ( .A(n387), .B(n481), .Y(n133) );
  CLKINVX1 U321 ( .A(a[10]), .Y(n394) );
  NOR2X1 U322 ( .A(n387), .B(n486), .Y(n128) );
  NOR2X1 U323 ( .A(n387), .B(n489), .Y(n125) );
  CLKINVX1 U324 ( .A(n31), .Y(n396) );
  NOR2X1 U325 ( .A(n387), .B(n432), .Y(n124) );
  XOR2X1 U326 ( .A(b[11]), .B(a[11]), .Y(n378) );
  CLKBUFX3 U327 ( .A(a[1]), .Y(n389) );
  CLKBUFX3 U328 ( .A(a[3]), .Y(n390) );
  CLKBUFX3 U329 ( .A(a[5]), .Y(n391) );
  CLKBUFX3 U330 ( .A(b[0]), .Y(n388) );
  CLKBUFX3 U331 ( .A(a[7]), .Y(n392) );
  CLKBUFX3 U332 ( .A(a[9]), .Y(n393) );
  XOR2X1 U333 ( .A(n407), .B(n408), .Y(product[22]) );
  XNOR2X1 U334 ( .A(n26), .B(n4), .Y(n408) );
  NOR2X1 U335 ( .A(n405), .B(n406), .Y(product[0]) );
  XOR2X1 U336 ( .A(n410), .B(n411), .Y(n74) );
  NAND2BX1 U337 ( .AN(n410), .B(n411), .Y(n73) );
  OA22X1 U338 ( .A0(n412), .A1(n379), .B0(n380), .B1(n415), .Y(n411) );
  OAI2BB1X1 U339 ( .A0N(n405), .A1N(n416), .B0(n417), .Y(n410) );
  OAI22XL U340 ( .A0(n418), .A1(n383), .B0(n384), .B1(n421), .Y(n65) );
  OAI22XL U341 ( .A0(n382), .A1(n423), .B0(n424), .B1(n381), .Y(n51) );
  OAI22XL U342 ( .A0(n384), .A1(n426), .B0(n427), .B1(n383), .Y(n39) );
  OAI22XL U343 ( .A0(n386), .A1(n429), .B0(n430), .B1(n385), .Y(n31) );
  OAI22XL U344 ( .A0(n388), .A1(n416), .B0(n433), .B1(n405), .Y(n194) );
  OAI22XL U345 ( .A0(n433), .A1(n416), .B0(n434), .B1(n405), .Y(n193) );
  XNOR2X1 U346 ( .A(b[1]), .B(n389), .Y(n433) );
  OAI22XL U347 ( .A0(n434), .A1(n416), .B0(n435), .B1(n405), .Y(n192) );
  XNOR2X1 U348 ( .A(b[2]), .B(n389), .Y(n434) );
  OAI22XL U349 ( .A0(n435), .A1(n416), .B0(n436), .B1(n405), .Y(n191) );
  XNOR2X1 U350 ( .A(b[3]), .B(n389), .Y(n435) );
  OAI22XL U351 ( .A0(n436), .A1(n416), .B0(n437), .B1(n405), .Y(n190) );
  XNOR2X1 U352 ( .A(b[4]), .B(n389), .Y(n436) );
  OAI22XL U353 ( .A0(n437), .A1(n416), .B0(n438), .B1(n405), .Y(n189) );
  XNOR2X1 U354 ( .A(b[5]), .B(n389), .Y(n437) );
  OAI22XL U355 ( .A0(n438), .A1(n416), .B0(n439), .B1(n405), .Y(n188) );
  XNOR2X1 U356 ( .A(b[6]), .B(n389), .Y(n438) );
  OAI22XL U357 ( .A0(n439), .A1(n416), .B0(n440), .B1(n405), .Y(n187) );
  XNOR2X1 U358 ( .A(b[7]), .B(n389), .Y(n439) );
  OAI22XL U359 ( .A0(n440), .A1(n416), .B0(n441), .B1(n405), .Y(n186) );
  XNOR2X1 U360 ( .A(b[8]), .B(n389), .Y(n440) );
  OAI22XL U361 ( .A0(n441), .A1(n416), .B0(n442), .B1(n405), .Y(n185) );
  XNOR2X1 U362 ( .A(b[9]), .B(n389), .Y(n441) );
  OAI2BB2XL U363 ( .B0(n442), .B1(n416), .A0N(n417), .A1N(a[0]), .Y(n184) );
  XNOR2X1 U364 ( .A(b[11]), .B(n404), .Y(n417) );
  XNOR2X1 U365 ( .A(b[10]), .B(n389), .Y(n442) );
  NOR2X1 U366 ( .A(n380), .B(n406), .Y(n182) );
  OAI22XL U367 ( .A0(n443), .A1(n379), .B0(n380), .B1(n444), .Y(n181) );
  XNOR2X1 U368 ( .A(n390), .B(n388), .Y(n443) );
  OAI22XL U369 ( .A0(n444), .A1(n379), .B0(n380), .B1(n445), .Y(n180) );
  XNOR2X1 U370 ( .A(b[1]), .B(n390), .Y(n444) );
  OAI22XL U371 ( .A0(n445), .A1(n379), .B0(n380), .B1(n446), .Y(n179) );
  XNOR2X1 U372 ( .A(b[2]), .B(n390), .Y(n445) );
  OAI22XL U373 ( .A0(n446), .A1(n379), .B0(n380), .B1(n447), .Y(n178) );
  XNOR2X1 U374 ( .A(b[3]), .B(n390), .Y(n446) );
  OAI22XL U375 ( .A0(n447), .A1(n379), .B0(n380), .B1(n448), .Y(n177) );
  XNOR2X1 U376 ( .A(b[4]), .B(n390), .Y(n447) );
  OAI22XL U377 ( .A0(n448), .A1(n379), .B0(n380), .B1(n449), .Y(n176) );
  XNOR2X1 U378 ( .A(b[5]), .B(n390), .Y(n448) );
  OAI22XL U379 ( .A0(n449), .A1(n379), .B0(n380), .B1(n450), .Y(n175) );
  XNOR2X1 U380 ( .A(b[6]), .B(n390), .Y(n449) );
  OAI22XL U381 ( .A0(n450), .A1(n379), .B0(n380), .B1(n451), .Y(n174) );
  XNOR2X1 U382 ( .A(b[7]), .B(n390), .Y(n450) );
  OAI22XL U383 ( .A0(n451), .A1(n379), .B0(n380), .B1(n412), .Y(n173) );
  XNOR2X1 U384 ( .A(b[9]), .B(n390), .Y(n412) );
  XNOR2X1 U385 ( .A(b[8]), .B(n390), .Y(n451) );
  OAI22XL U386 ( .A0(n415), .A1(n379), .B0(n380), .B1(n452), .Y(n171) );
  XNOR2X1 U387 ( .A(b[10]), .B(n390), .Y(n415) );
  AO21X1 U388 ( .A0(n379), .A1(n380), .B0(n452), .Y(n170) );
  XNOR2X1 U389 ( .A(b[11]), .B(n390), .Y(n452) );
  NOR2X1 U390 ( .A(n382), .B(n406), .Y(n169) );
  OAI22XL U391 ( .A0(n453), .A1(n381), .B0(n382), .B1(n454), .Y(n168) );
  XNOR2X1 U392 ( .A(n391), .B(n388), .Y(n453) );
  OAI22XL U393 ( .A0(n454), .A1(n381), .B0(n382), .B1(n455), .Y(n167) );
  XNOR2X1 U394 ( .A(b[1]), .B(n391), .Y(n454) );
  OAI22XL U395 ( .A0(n455), .A1(n381), .B0(n382), .B1(n456), .Y(n166) );
  XNOR2X1 U396 ( .A(b[2]), .B(n391), .Y(n455) );
  OAI22XL U397 ( .A0(n456), .A1(n381), .B0(n382), .B1(n457), .Y(n165) );
  XNOR2X1 U398 ( .A(b[3]), .B(n391), .Y(n456) );
  OAI22XL U399 ( .A0(n457), .A1(n381), .B0(n382), .B1(n458), .Y(n164) );
  XNOR2X1 U400 ( .A(b[4]), .B(n391), .Y(n457) );
  OAI22XL U401 ( .A0(n458), .A1(n381), .B0(n382), .B1(n459), .Y(n163) );
  XNOR2X1 U402 ( .A(b[5]), .B(n391), .Y(n458) );
  OAI22XL U403 ( .A0(n459), .A1(n381), .B0(n382), .B1(n460), .Y(n162) );
  XNOR2X1 U404 ( .A(b[6]), .B(n391), .Y(n459) );
  OAI22XL U405 ( .A0(n460), .A1(n381), .B0(n382), .B1(n461), .Y(n161) );
  XNOR2X1 U406 ( .A(b[7]), .B(n391), .Y(n460) );
  OAI22XL U407 ( .A0(n461), .A1(n381), .B0(n382), .B1(n462), .Y(n160) );
  XNOR2X1 U408 ( .A(b[8]), .B(n391), .Y(n461) );
  OAI22XL U409 ( .A0(n462), .A1(n381), .B0(n382), .B1(n424), .Y(n159) );
  XNOR2X1 U410 ( .A(b[10]), .B(n391), .Y(n424) );
  XNOR2X1 U411 ( .A(b[9]), .B(n391), .Y(n462) );
  AO21X1 U412 ( .A0(n381), .A1(n382), .B0(n423), .Y(n158) );
  XNOR2X1 U413 ( .A(b[11]), .B(n391), .Y(n423) );
  NOR2X1 U414 ( .A(n384), .B(n406), .Y(n157) );
  OAI22XL U415 ( .A0(n463), .A1(n383), .B0(n384), .B1(n464), .Y(n156) );
  XNOR2X1 U416 ( .A(n392), .B(n388), .Y(n463) );
  OAI22XL U417 ( .A0(n464), .A1(n383), .B0(n384), .B1(n465), .Y(n155) );
  XNOR2X1 U418 ( .A(b[1]), .B(n392), .Y(n464) );
  OAI22XL U419 ( .A0(n465), .A1(n383), .B0(n384), .B1(n466), .Y(n154) );
  XNOR2X1 U420 ( .A(b[2]), .B(n392), .Y(n465) );
  OAI22XL U421 ( .A0(n466), .A1(n383), .B0(n384), .B1(n467), .Y(n153) );
  XNOR2X1 U422 ( .A(b[3]), .B(n392), .Y(n466) );
  OAI22XL U423 ( .A0(n467), .A1(n383), .B0(n384), .B1(n468), .Y(n152) );
  XNOR2X1 U424 ( .A(b[4]), .B(n392), .Y(n467) );
  OAI22XL U425 ( .A0(n468), .A1(n383), .B0(n384), .B1(n418), .Y(n151) );
  XNOR2X1 U426 ( .A(b[6]), .B(n392), .Y(n418) );
  XNOR2X1 U427 ( .A(b[5]), .B(n392), .Y(n468) );
  OAI22XL U428 ( .A0(n421), .A1(n383), .B0(n384), .B1(n469), .Y(n150) );
  XNOR2X1 U429 ( .A(b[7]), .B(n392), .Y(n421) );
  OAI22XL U430 ( .A0(n469), .A1(n383), .B0(n384), .B1(n470), .Y(n149) );
  XNOR2X1 U431 ( .A(b[8]), .B(n392), .Y(n469) );
  OAI22XL U432 ( .A0(n470), .A1(n383), .B0(n384), .B1(n427), .Y(n148) );
  XNOR2X1 U433 ( .A(b[10]), .B(n392), .Y(n427) );
  XNOR2X1 U434 ( .A(b[9]), .B(n392), .Y(n470) );
  AO21X1 U435 ( .A0(n383), .A1(n384), .B0(n426), .Y(n147) );
  XNOR2X1 U436 ( .A(b[11]), .B(n392), .Y(n426) );
  NOR2X1 U437 ( .A(n386), .B(n406), .Y(n146) );
  OAI22XL U438 ( .A0(n471), .A1(n385), .B0(n386), .B1(n472), .Y(n145) );
  XNOR2X1 U439 ( .A(n393), .B(n388), .Y(n471) );
  OAI22XL U440 ( .A0(n472), .A1(n385), .B0(n386), .B1(n473), .Y(n144) );
  XNOR2X1 U441 ( .A(b[1]), .B(n393), .Y(n472) );
  OAI22XL U442 ( .A0(n473), .A1(n385), .B0(n386), .B1(n474), .Y(n143) );
  XNOR2X1 U443 ( .A(b[2]), .B(n393), .Y(n473) );
  OAI22XL U444 ( .A0(n474), .A1(n385), .B0(n386), .B1(n475), .Y(n142) );
  XNOR2X1 U445 ( .A(b[3]), .B(n393), .Y(n474) );
  OAI22XL U446 ( .A0(n475), .A1(n385), .B0(n386), .B1(n476), .Y(n141) );
  XNOR2X1 U447 ( .A(b[4]), .B(n393), .Y(n475) );
  OAI22XL U448 ( .A0(n476), .A1(n385), .B0(n386), .B1(n477), .Y(n140) );
  XNOR2X1 U449 ( .A(b[5]), .B(n393), .Y(n476) );
  OAI22XL U450 ( .A0(n477), .A1(n385), .B0(n386), .B1(n478), .Y(n139) );
  XNOR2X1 U451 ( .A(b[6]), .B(n393), .Y(n477) );
  OAI22XL U452 ( .A0(n478), .A1(n385), .B0(n386), .B1(n479), .Y(n138) );
  XNOR2X1 U453 ( .A(b[7]), .B(n393), .Y(n478) );
  OAI22XL U454 ( .A0(n479), .A1(n385), .B0(n386), .B1(n480), .Y(n137) );
  XNOR2X1 U455 ( .A(b[8]), .B(n393), .Y(n479) );
  OAI22XL U456 ( .A0(n480), .A1(n385), .B0(n386), .B1(n430), .Y(n136) );
  XNOR2X1 U457 ( .A(b[10]), .B(n393), .Y(n430) );
  XNOR2X1 U458 ( .A(b[9]), .B(n393), .Y(n480) );
  AO21X1 U459 ( .A0(n385), .A1(n386), .B0(n429), .Y(n135) );
  XNOR2X1 U460 ( .A(b[11]), .B(n393), .Y(n429) );
  NOR2X1 U461 ( .A(n387), .B(n406), .Y(n134) );
  XNOR2X1 U462 ( .A(b[1]), .B(a[11]), .Y(n481) );
  XNOR2X1 U463 ( .A(b[2]), .B(a[11]), .Y(n482) );
  XNOR2X1 U464 ( .A(b[3]), .B(a[11]), .Y(n483) );
  XNOR2X1 U465 ( .A(b[4]), .B(a[11]), .Y(n484) );
  XNOR2X1 U466 ( .A(b[5]), .B(a[11]), .Y(n485) );
  XNOR2X1 U467 ( .A(b[6]), .B(a[11]), .Y(n486) );
  XNOR2X1 U468 ( .A(b[7]), .B(a[11]), .Y(n487) );
  XNOR2X1 U469 ( .A(b[8]), .B(a[11]), .Y(n488) );
  XNOR2X1 U470 ( .A(b[10]), .B(a[11]), .Y(n432) );
  XNOR2X1 U471 ( .A(b[9]), .B(a[11]), .Y(n489) );
  OAI21XL U472 ( .A0(n388), .A1(n404), .B0(n416), .Y(n122) );
  OAI32X1 U473 ( .A0(n403), .A1(n388), .A2(n380), .B0(n403), .B1(n379), .Y(
        n121) );
  XNOR2X1 U474 ( .A(n403), .B(a[2]), .Y(n490) );
  OAI32X1 U475 ( .A0(n402), .A1(n388), .A2(n382), .B0(n402), .B1(n381), .Y(
        n120) );
  XNOR2X1 U476 ( .A(n402), .B(a[4]), .Y(n491) );
  OAI32X1 U477 ( .A0(n400), .A1(n388), .A2(n384), .B0(n400), .B1(n383), .Y(
        n119) );
  XNOR2X1 U478 ( .A(n400), .B(a[6]), .Y(n492) );
  OAI32X1 U479 ( .A0(n397), .A1(n388), .A2(n386), .B0(n397), .B1(n385), .Y(
        n118) );
  XNOR2X1 U480 ( .A(n397), .B(a[8]), .Y(n493) );
endmodule


module geofence_DW01_sub_11 ( A, B, CI, DIFF, CO );
  input [22:0] A;
  input [22:0] B;
  output [22:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22;
  wire   [23:0] carry;

  ADDFXL U2_1 ( .A(A[1]), .B(n22), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFXL U2_3 ( .A(A[3]), .B(n20), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFXL U2_2 ( .A(A[2]), .B(n21), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFXL U2_4 ( .A(A[4]), .B(n19), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFXL U2_19 ( .A(A[19]), .B(n4), .CI(carry[19]), .CO(carry[20]), .S(
        DIFF[19]) );
  ADDFX2 U2_20 ( .A(A[20]), .B(n3), .CI(carry[20]), .CO(carry[21]), .S(
        DIFF[20]) );
  ADDFXL U2_21 ( .A(A[21]), .B(n2), .CI(carry[21]), .CO(carry[22]), .S(
        DIFF[21]) );
  XOR3X1 U2_22 ( .A(A[22]), .B(n1), .C(carry[22]), .Y(DIFF[22]) );
  ADDFXL U2_5 ( .A(A[5]), .B(n18), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFXL U2_6 ( .A(A[6]), .B(n17), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFXL U2_7 ( .A(A[7]), .B(n16), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFXL U2_8 ( .A(A[8]), .B(n15), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFXL U2_9 ( .A(A[9]), .B(n14), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFXL U2_10 ( .A(A[10]), .B(n13), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFXL U2_11 ( .A(A[11]), .B(n12), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFXL U2_12 ( .A(A[12]), .B(n11), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFXL U2_13 ( .A(A[13]), .B(n10), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDFXL U2_14 ( .A(A[14]), .B(n9), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFXL U2_15 ( .A(A[15]), .B(n8), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF[15]) );
  ADDFXL U2_16 ( .A(A[16]), .B(n7), .CI(carry[16]), .CO(carry[17]), .S(
        DIFF[16]) );
  ADDFXL U2_17 ( .A(A[17]), .B(n6), .CI(carry[17]), .CO(carry[18]), .S(
        DIFF[17]) );
  ADDFXL U2_18 ( .A(A[18]), .B(n5), .CI(carry[18]), .CO(carry[19]), .S(
        DIFF[18]) );
  CLKINVX1 U1 ( .A(B[18]), .Y(n5) );
  CLKINVX1 U2 ( .A(B[17]), .Y(n6) );
  CLKINVX1 U3 ( .A(B[16]), .Y(n7) );
  CLKINVX1 U4 ( .A(B[15]), .Y(n8) );
  CLKINVX1 U5 ( .A(B[14]), .Y(n9) );
  CLKINVX1 U6 ( .A(B[13]), .Y(n10) );
  CLKINVX1 U7 ( .A(B[12]), .Y(n11) );
  CLKINVX1 U8 ( .A(B[11]), .Y(n12) );
  CLKINVX1 U9 ( .A(B[10]), .Y(n13) );
  CLKINVX1 U10 ( .A(B[9]), .Y(n14) );
  CLKINVX1 U11 ( .A(B[8]), .Y(n15) );
  CLKINVX1 U12 ( .A(B[7]), .Y(n16) );
  CLKINVX1 U13 ( .A(B[6]), .Y(n17) );
  CLKINVX1 U14 ( .A(B[5]), .Y(n18) );
  CLKINVX1 U15 ( .A(B[21]), .Y(n2) );
  CLKINVX1 U16 ( .A(B[20]), .Y(n3) );
  CLKINVX1 U17 ( .A(B[19]), .Y(n4) );
  CLKINVX1 U18 ( .A(B[4]), .Y(n19) );
  CLKINVX1 U19 ( .A(B[2]), .Y(n21) );
  CLKINVX1 U20 ( .A(B[22]), .Y(n1) );
  CLKINVX1 U21 ( .A(B[3]), .Y(n20) );
  CLKINVX1 U22 ( .A(B[1]), .Y(n22) );
  NAND2BX1 U23 ( .AN(A[0]), .B(B[0]), .Y(carry[1]) );
endmodule


module geofence_DW01_add_4 ( A, B, CI, SUM, CO );
  input [4:0] A;
  input [4:0] B;
  output [4:0] SUM;
  input CI;
  output CO;
  wire   n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77;

  OR2X6 U39 ( .A(B[2]), .B(A[2]), .Y(n64) );
  XOR2XL U40 ( .A(n66), .B(n61), .Y(SUM[1]) );
  CLKINVX8 U41 ( .A(n62), .Y(n53) );
  NAND2X1 U42 ( .A(n63), .B(n62), .Y(n66) );
  NAND2X8 U43 ( .A(B[1]), .B(A[1]), .Y(n62) );
  INVX6 U44 ( .A(n75), .Y(n61) );
  OAI2BB1X4 U45 ( .A0N(CI), .A1N(n68), .B0(n69), .Y(n75) );
  OA21X4 U46 ( .A0(n70), .A1(n54), .B0(n57), .Y(n52) );
  NAND2X6 U47 ( .A(n52), .B(n71), .Y(CO) );
  NAND2X4 U48 ( .A(B[3]), .B(A[3]), .Y(n57) );
  CLKINVX8 U49 ( .A(A[4]), .Y(n71) );
  NAND2X1 U50 ( .A(n64), .B(n65), .Y(n58) );
  CLKINVX1 U51 ( .A(n56), .Y(n70) );
  OA21X2 U52 ( .A0(n60), .A1(n61), .B0(n62), .Y(n59) );
  CLKXOR2X2 U53 ( .A(n58), .B(n59), .Y(SUM[2]) );
  NAND2X1 U54 ( .A(B[2]), .B(A[2]), .Y(n65) );
  NAND2X2 U55 ( .A(B[0]), .B(A[0]), .Y(n69) );
  NAND2X4 U56 ( .A(n64), .B(n63), .Y(n73) );
  NAND2BX4 U57 ( .AN(B[1]), .B(n76), .Y(n63) );
  OR2X6 U58 ( .A(B[0]), .B(A[0]), .Y(n68) );
  OAI2BB1X4 U59 ( .A0N(n64), .A1N(n53), .B0(n65), .Y(n77) );
  OR2X4 U60 ( .A(B[3]), .B(A[3]), .Y(n56) );
  INVX3 U61 ( .A(A[1]), .Y(n76) );
  INVX8 U62 ( .A(n77), .Y(n72) );
  OAI2BB1X4 U63 ( .A0N(n72), .A1N(n73), .B0(n74), .Y(n54) );
  NAND2X4 U64 ( .A(n61), .B(n72), .Y(n74) );
  NAND2XL U65 ( .A(n56), .B(n57), .Y(n55) );
  XNOR2X1 U66 ( .A(CI), .B(n67), .Y(SUM[0]) );
  NAND2X1 U67 ( .A(n68), .B(n69), .Y(n67) );
  CLKINVX1 U68 ( .A(n63), .Y(n60) );
  XOR2XL U69 ( .A(n54), .B(n55), .Y(SUM[3]) );
endmodule


module geofence_DW01_add_5 ( A, B, CI, SUM, CO );
  input [5:0] A;
  input [5:0] B;
  output [5:0] SUM;
  input CI;
  output CO;
  wire   n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98;

  CLKINVX6 U50 ( .A(n79), .Y(n97) );
  NAND2X8 U51 ( .A(B[1]), .B(A[1]), .Y(n79) );
  OAI2BB1X4 U52 ( .A0N(CI), .A1N(n86), .B0(n87), .Y(n84) );
  NAND2X4 U53 ( .A(B[0]), .B(A[0]), .Y(n87) );
  OR2X8 U54 ( .A(B[0]), .B(A[0]), .Y(n86) );
  NAND2X4 U55 ( .A(B[2]), .B(A[2]), .Y(n82) );
  OR2X6 U56 ( .A(B[2]), .B(A[2]), .Y(n81) );
  XOR2X1 U57 ( .A(n66), .B(n67), .Y(SUM[4]) );
  XOR2X1 U58 ( .A(n75), .B(n76), .Y(SUM[2]) );
  CLKINVX1 U59 ( .A(n81), .Y(n65) );
  NAND2X1 U60 ( .A(B[3]), .B(A[3]), .Y(n70) );
  OA21XL U61 ( .A0(n68), .A1(n69), .B0(n70), .Y(n67) );
  NAND3X1 U62 ( .A(n90), .B(n91), .C(n72), .Y(n89) );
  CLKINVX4 U63 ( .A(n71), .Y(n93) );
  AOI2BB1X4 U64 ( .A0N(n65), .A1N(n77), .B0(n96), .Y(n94) );
  INVX2 U65 ( .A(n80), .Y(n77) );
  XOR2X1 U66 ( .A(n69), .B(n73), .Y(SUM[3]) );
  NOR3X6 U67 ( .A(n93), .B(n69), .C(n68), .Y(n88) );
  INVX2 U68 ( .A(n70), .Y(n92) );
  NAND2X2 U69 ( .A(n92), .B(n71), .Y(n90) );
  OR2X8 U70 ( .A(n94), .B(n95), .Y(n69) );
  CLKINVX3 U71 ( .A(n84), .Y(n78) );
  NAND2X2 U72 ( .A(B[4]), .B(A[4]), .Y(n72) );
  OR2X2 U73 ( .A(B[3]), .B(A[3]), .Y(n74) );
  NOR2X4 U74 ( .A(n96), .B(n84), .Y(n95) );
  OR2X4 U75 ( .A(B[1]), .B(A[1]), .Y(n80) );
  XNOR2X2 U76 ( .A(CI), .B(n85), .Y(SUM[0]) );
  OR2X2 U77 ( .A(B[4]), .B(A[4]), .Y(n71) );
  OA21XL U78 ( .A0(n77), .A1(n78), .B0(n79), .Y(n76) );
  OR2X8 U79 ( .A(n88), .B(n89), .Y(CO) );
  INVX3 U80 ( .A(n74), .Y(n68) );
  NAND2XL U81 ( .A(n74), .B(n70), .Y(n73) );
  CLKINVX1 U82 ( .A(n82), .Y(n98) );
  NAND2XL U83 ( .A(n81), .B(n82), .Y(n75) );
  NAND2X1 U84 ( .A(n86), .B(n87), .Y(n85) );
  NAND2X1 U85 ( .A(n71), .B(n72), .Y(n66) );
  XOR2X1 U86 ( .A(n83), .B(n78), .Y(SUM[1]) );
  NAND2XL U87 ( .A(n80), .B(n79), .Y(n83) );
  INVX1 U88 ( .A(A[5]), .Y(n91) );
  AO21X4 U89 ( .A0(n97), .A1(n81), .B0(n98), .Y(n96) );
endmodule


module geofence_DW01_add_6 ( A, B, CI, SUM, CO );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  input CI;
  output CO;
  wire   n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122;

  INVX1 U62 ( .A(n86), .Y(n85) );
  NOR2X4 U63 ( .A(n86), .B(n114), .Y(n113) );
  BUFX16 U64 ( .A(n101), .Y(n79) );
  NAND2X6 U65 ( .A(B[1]), .B(A[1]), .Y(n101) );
  OA21X4 U66 ( .A0(n91), .A1(n83), .B0(n92), .Y(n90) );
  NAND2BX4 U67 ( .AN(B[3]), .B(n122), .Y(n93) );
  INVX6 U68 ( .A(A[3]), .Y(n122) );
  XOR2XL U69 ( .A(n83), .B(n96), .Y(SUM[3]) );
  CLKINVX6 U70 ( .A(n79), .Y(n120) );
  NAND2X4 U71 ( .A(B[2]), .B(A[2]), .Y(n104) );
  OR2X2 U72 ( .A(B[0]), .B(A[0]), .Y(n108) );
  NAND2X2 U73 ( .A(B[0]), .B(A[0]), .Y(n109) );
  NAND2X2 U74 ( .A(B[3]), .B(A[3]), .Y(n92) );
  NAND2X1 U75 ( .A(B[4]), .B(A[4]), .Y(n95) );
  NOR2X1 U76 ( .A(n114), .B(n87), .Y(n112) );
  OA21X2 U77 ( .A0(n99), .A1(n100), .B0(n79), .Y(n98) );
  OA21XL U78 ( .A0(n83), .A1(n84), .B0(n85), .Y(n82) );
  OR2X2 U79 ( .A(B[1]), .B(A[1]), .Y(n102) );
  OR2X4 U80 ( .A(B[4]), .B(A[4]), .Y(n94) );
  OR2X2 U81 ( .A(B[5]), .B(A[5]), .Y(n87) );
  NOR3X6 U82 ( .A(n84), .B(n83), .C(n116), .Y(n110) );
  NAND2BX4 U83 ( .AN(A[6]), .B(n88), .Y(n114) );
  OR2X6 U84 ( .A(B[2]), .B(A[2]), .Y(n103) );
  NAND2X6 U85 ( .A(n94), .B(n80), .Y(n84) );
  OR2X8 U86 ( .A(n117), .B(n118), .Y(n83) );
  NOR2X2 U87 ( .A(n112), .B(n113), .Y(n111) );
  NAND2X2 U88 ( .A(B[5]), .B(A[5]), .Y(n88) );
  OAI2BB1X2 U89 ( .A0N(n115), .A1N(n94), .B0(n95), .Y(n86) );
  NAND2X1 U90 ( .A(n103), .B(n104), .Y(n97) );
  INVX1 U91 ( .A(n104), .Y(n121) );
  INVX4 U92 ( .A(n92), .Y(n115) );
  NAND2X2 U93 ( .A(n80), .B(n92), .Y(n96) );
  BUFX6 U94 ( .A(n93), .Y(n80) );
  NAND2XL U95 ( .A(n94), .B(n95), .Y(n89) );
  AOI21X4 U96 ( .A0(n103), .A1(n102), .B0(n119), .Y(n117) );
  NOR2X4 U97 ( .A(n119), .B(n106), .Y(n118) );
  XNOR2X1 U98 ( .A(CI), .B(n107), .Y(SUM[0]) );
  OAI2BB1X4 U99 ( .A0N(CI), .A1N(n108), .B0(n109), .Y(n106) );
  XOR2X1 U100 ( .A(n89), .B(n90), .Y(SUM[4]) );
  CLKINVX1 U101 ( .A(n80), .Y(n91) );
  CLKINVX1 U102 ( .A(n87), .Y(n116) );
  XOR2X1 U103 ( .A(n97), .B(n98), .Y(SUM[2]) );
  CLKINVX1 U104 ( .A(n106), .Y(n100) );
  CLKINVX1 U105 ( .A(n102), .Y(n99) );
  NAND2X1 U106 ( .A(n108), .B(n109), .Y(n107) );
  XOR2X1 U107 ( .A(n81), .B(n82), .Y(SUM[5]) );
  NAND2X1 U108 ( .A(n87), .B(n88), .Y(n81) );
  XOR2X1 U109 ( .A(n105), .B(n100), .Y(SUM[1]) );
  NAND2XL U110 ( .A(n102), .B(n79), .Y(n105) );
  OR2X8 U111 ( .A(n110), .B(n111), .Y(CO) );
  AO21X4 U112 ( .A0(n120), .A1(n103), .B0(n121), .Y(n119) );
endmodule


module geofence_DW01_add_7 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141;

  OR3X8 U73 ( .A(n98), .B(n133), .C(n101), .Y(n131) );
  CLKINVX8 U74 ( .A(n102), .Y(n107) );
  NAND2X4 U75 ( .A(B[3]), .B(A[3]), .Y(n112) );
  INVX8 U76 ( .A(n119), .Y(n137) );
  INVX3 U77 ( .A(n122), .Y(n138) );
  OR2X6 U78 ( .A(B[2]), .B(A[2]), .Y(n121) );
  NAND2BX4 U79 ( .AN(B[3]), .B(n132), .Y(n113) );
  CLKINVX6 U80 ( .A(A[3]), .Y(n132) );
  CLKAND2X2 U81 ( .A(n121), .B(n120), .Y(n92) );
  NOR2X2 U82 ( .A(n92), .B(n136), .Y(n134) );
  OR2X8 U83 ( .A(B[1]), .B(A[1]), .Y(n120) );
  OR2X6 U84 ( .A(B[0]), .B(A[0]), .Y(n126) );
  NAND2X6 U85 ( .A(B[0]), .B(A[0]), .Y(n127) );
  OR2X6 U86 ( .A(A[7]), .B(n128), .Y(CO) );
  NOR2X2 U87 ( .A(n136), .B(n124), .Y(n135) );
  NAND2X1 U88 ( .A(B[4]), .B(A[4]), .Y(n111) );
  OA21XL U89 ( .A0(n117), .A1(n118), .B0(n119), .Y(n116) );
  CLKINVX4 U90 ( .A(n141), .Y(n139) );
  OAI2BB1X2 U91 ( .A0N(CI), .A1N(n126), .B0(n127), .Y(n124) );
  NAND2X2 U92 ( .A(n139), .B(n107), .Y(n129) );
  OR2X2 U93 ( .A(B[5]), .B(A[5]), .Y(n100) );
  NAND2X6 U94 ( .A(B[1]), .B(A[1]), .Y(n119) );
  OR2X8 U95 ( .A(B[4]), .B(A[4]), .Y(n110) );
  NAND2XL U96 ( .A(n126), .B(n127), .Y(n125) );
  NAND2X2 U97 ( .A(n96), .B(n100), .Y(n133) );
  OR2X8 U98 ( .A(n134), .B(n135), .Y(n98) );
  AO22X1 U99 ( .A0(n107), .A1(n98), .B0(n107), .B1(n101), .Y(n104) );
  NAND2X2 U100 ( .A(B[5]), .B(A[5]), .Y(n106) );
  OAI2BB1X2 U101 ( .A0N(n103), .A1N(n96), .B0(n97), .Y(n141) );
  INVX3 U102 ( .A(n106), .Y(n103) );
  NAND2X2 U103 ( .A(n139), .B(n133), .Y(n130) );
  NAND2X4 U104 ( .A(B[2]), .B(A[2]), .Y(n122) );
  OR2X4 U105 ( .A(B[6]), .B(A[6]), .Y(n96) );
  OAI2BB1X4 U106 ( .A0N(n140), .A1N(n110), .B0(n111), .Y(n102) );
  NAND2BXL U107 ( .AN(n101), .B(n100), .Y(n99) );
  NAND2XL U108 ( .A(n113), .B(n112), .Y(n114) );
  XNOR2X1 U109 ( .A(CI), .B(n125), .Y(SUM[0]) );
  AOI21X1 U110 ( .A0(n100), .A1(n102), .B0(n103), .Y(n93) );
  CLKINVX1 U111 ( .A(n112), .Y(n140) );
  XOR2X1 U112 ( .A(n108), .B(n109), .Y(SUM[4]) );
  NAND2XL U113 ( .A(n110), .B(n111), .Y(n109) );
  NAND2X1 U114 ( .A(n110), .B(n113), .Y(n101) );
  OAI2BB1X1 U115 ( .A0N(n112), .A1N(n98), .B0(n113), .Y(n108) );
  XOR2X1 U116 ( .A(n104), .B(n105), .Y(SUM[5]) );
  NAND2X1 U117 ( .A(n100), .B(n106), .Y(n105) );
  XOR2X1 U118 ( .A(n115), .B(n116), .Y(SUM[2]) );
  NAND2XL U119 ( .A(n121), .B(n122), .Y(n115) );
  XOR2XL U120 ( .A(n98), .B(n114), .Y(SUM[3]) );
  CLKINVX1 U121 ( .A(n124), .Y(n118) );
  CLKINVX1 U122 ( .A(n120), .Y(n117) );
  XOR2XL U123 ( .A(n123), .B(n118), .Y(SUM[1]) );
  NAND2X1 U124 ( .A(n120), .B(n119), .Y(n123) );
  XOR2X1 U125 ( .A(n94), .B(n95), .Y(SUM[6]) );
  NAND2X1 U126 ( .A(n96), .B(n97), .Y(n95) );
  AO22X1 U127 ( .A0(n93), .A1(n98), .B0(n93), .B1(n99), .Y(n94) );
  NAND2X1 U128 ( .A(B[6]), .B(A[6]), .Y(n97) );
  OAI2BB1X4 U129 ( .A0N(n129), .A1N(n130), .B0(n131), .Y(n128) );
  AO21X4 U130 ( .A0(n137), .A1(n121), .B0(n138), .Y(n136) );
endmodule


module geofence_DW01_add_8 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167;

  INVX4 U83 ( .A(n111), .Y(n112) );
  AND2X8 U84 ( .A(B[1]), .B(A[1]), .Y(n108) );
  NOR2X4 U85 ( .A(n163), .B(n149), .Y(n162) );
  OAI2BB1X4 U86 ( .A0N(CI), .A1N(n151), .B0(n152), .Y(n149) );
  AND2X4 U87 ( .A(n104), .B(n105), .Y(n161) );
  NAND2X2 U88 ( .A(B[0]), .B(A[0]), .Y(n152) );
  NAND2X2 U89 ( .A(n109), .B(n145), .Y(n104) );
  CLKINVX1 U90 ( .A(n163), .Y(n105) );
  BUFX8 U91 ( .A(n146), .Y(n109) );
  OR2X2 U92 ( .A(B[1]), .B(A[1]), .Y(n145) );
  BUFX8 U93 ( .A(n138), .Y(n106) );
  NAND2X2 U94 ( .A(n135), .B(n136), .Y(n134) );
  OAI2BB1X4 U95 ( .A0N(n167), .A1N(n135), .B0(n136), .Y(n127) );
  NAND2X1 U96 ( .A(B[4]), .B(A[4]), .Y(n136) );
  OR2X8 U97 ( .A(B[0]), .B(A[0]), .Y(n151) );
  NAND2X4 U98 ( .A(n135), .B(n106), .Y(n126) );
  OR2X8 U99 ( .A(B[4]), .B(A[4]), .Y(n135) );
  NAND2X4 U100 ( .A(B[3]), .B(A[3]), .Y(n137) );
  NAND2X1 U101 ( .A(n106), .B(n137), .Y(n139) );
  CLKINVX1 U102 ( .A(n107), .Y(n147) );
  NAND2X2 U103 ( .A(n159), .B(n157), .Y(n111) );
  CLKINVX1 U104 ( .A(n126), .Y(n157) );
  INVX3 U105 ( .A(n166), .Y(n165) );
  OAI2BB1X2 U106 ( .A0N(n128), .A1N(n121), .B0(n122), .Y(n166) );
  XOR2X1 U107 ( .A(n119), .B(n120), .Y(SUM[6]) );
  CLKINVX1 U108 ( .A(n137), .Y(n167) );
  NAND2BX1 U109 ( .AN(B[3]), .B(n164), .Y(n138) );
  CLKINVX1 U110 ( .A(A[3]), .Y(n164) );
  INVX4 U111 ( .A(n127), .Y(n132) );
  OR2X4 U112 ( .A(B[5]), .B(A[5]), .Y(n125) );
  XOR2X1 U113 ( .A(n114), .B(n115), .Y(SUM[7]) );
  OAI2BB1XL U114 ( .A0N(n137), .A1N(n123), .B0(n106), .Y(n133) );
  NAND2XL U115 ( .A(B[1]), .B(A[1]), .Y(n144) );
  CLKBUFX2 U116 ( .A(n110), .Y(n107) );
  CLKAND2X4 U117 ( .A(B[2]), .B(A[2]), .Y(n110) );
  OR2X8 U118 ( .A(B[2]), .B(A[2]), .Y(n146) );
  NAND2X2 U119 ( .A(B[7]), .B(A[7]), .Y(n118) );
  OR2X2 U120 ( .A(B[7]), .B(A[7]), .Y(n117) );
  NAND2X4 U121 ( .A(B[6]), .B(A[6]), .Y(n122) );
  NAND2X6 U122 ( .A(n112), .B(n158), .Y(n156) );
  NAND2BX2 U123 ( .AN(A[8]), .B(n118), .Y(n153) );
  AOI21X2 U124 ( .A0(n125), .A1(n127), .B0(n128), .Y(n113) );
  INVX8 U125 ( .A(n123), .Y(n158) );
  OR2X4 U126 ( .A(B[6]), .B(A[6]), .Y(n121) );
  NAND2XL U127 ( .A(n165), .B(n160), .Y(n155) );
  INVX1 U128 ( .A(n160), .Y(n159) );
  OAI2BB1X4 U129 ( .A0N(n154), .A1N(n155), .B0(n156), .Y(n116) );
  NAND2X2 U130 ( .A(n125), .B(n131), .Y(n130) );
  INVX3 U131 ( .A(n131), .Y(n128) );
  NAND2X2 U132 ( .A(B[5]), .B(A[5]), .Y(n131) );
  OA21XL U133 ( .A0(n142), .A1(n143), .B0(n144), .Y(n141) );
  INVXL U134 ( .A(n116), .Y(n115) );
  NAND2X2 U135 ( .A(n132), .B(n165), .Y(n154) );
  XOR2X2 U136 ( .A(n129), .B(n130), .Y(SUM[5]) );
  OR2X6 U137 ( .A(n161), .B(n162), .Y(n123) );
  NAND2XL U138 ( .A(n117), .B(n118), .Y(n114) );
  XNOR2X1 U139 ( .A(CI), .B(n150), .Y(SUM[0]) );
  NAND2X1 U140 ( .A(n121), .B(n125), .Y(n160) );
  XOR2X1 U141 ( .A(n133), .B(n134), .Y(SUM[4]) );
  NAND2XL U142 ( .A(n121), .B(n122), .Y(n120) );
  NAND2BXL U143 ( .AN(n126), .B(n125), .Y(n124) );
  CLKINVX1 U144 ( .A(n145), .Y(n142) );
  NAND2X1 U145 ( .A(n145), .B(n144), .Y(n148) );
  XOR2X1 U146 ( .A(n140), .B(n141), .Y(SUM[2]) );
  NAND2XL U147 ( .A(n109), .B(n147), .Y(n140) );
  CLKINVX1 U148 ( .A(n149), .Y(n143) );
  NAND2X1 U149 ( .A(n151), .B(n152), .Y(n150) );
  XOR2X1 U150 ( .A(n148), .B(n143), .Y(SUM[1]) );
  AO22X1 U151 ( .A0(n113), .A1(n123), .B0(n113), .B1(n124), .Y(n119) );
  AO22X1 U152 ( .A0(n132), .A1(n123), .B0(n132), .B1(n126), .Y(n129) );
  XOR2XL U153 ( .A(n123), .B(n139), .Y(SUM[3]) );
  OA22X4 U154 ( .A0(n153), .A1(n117), .B0(n116), .B1(n153), .Y(CO) );
  AO21X4 U155 ( .A0(n108), .A1(n146), .B0(n110), .Y(n163) );
endmodule


module geofence_DW01_add_9 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185;

  XOR2X2 U91 ( .A(n138), .B(n139), .Y(SUM[5]) );
  OAI2BB1X2 U92 ( .A0N(n123), .A1N(n124), .B0(n125), .Y(n119) );
  CLKINVX6 U93 ( .A(n127), .Y(n123) );
  OAI2BB1X4 U94 ( .A0N(CI), .A1N(n161), .B0(n162), .Y(n159) );
  INVX8 U95 ( .A(n132), .Y(n171) );
  CLKINVX2 U96 ( .A(n173), .Y(n172) );
  INVX3 U97 ( .A(A[1]), .Y(n180) );
  NAND2X6 U98 ( .A(B[1]), .B(A[1]), .Y(n154) );
  CLKINVX8 U99 ( .A(n136), .Y(n141) );
  NAND2X2 U100 ( .A(B[4]), .B(A[4]), .Y(n145) );
  NAND3X6 U101 ( .A(n170), .B(n171), .C(n172), .Y(n169) );
  AO22XL U102 ( .A0(n141), .A1(n132), .B0(n141), .B1(n135), .Y(n138) );
  INVX2 U103 ( .A(n135), .Y(n170) );
  BUFX6 U104 ( .A(n121), .Y(n114) );
  NAND2X4 U105 ( .A(B[5]), .B(A[5]), .Y(n140) );
  NAND2X6 U106 ( .A(B[2]), .B(A[2]), .Y(n157) );
  NAND2X4 U107 ( .A(B[6]), .B(A[6]), .Y(n131) );
  OAI2BB1X4 U108 ( .A0N(n185), .A1N(n144), .B0(n145), .Y(n136) );
  OR2X4 U109 ( .A(B[4]), .B(A[4]), .Y(n144) );
  CLKINVX6 U110 ( .A(A[3]), .Y(n181) );
  NAND2X4 U111 ( .A(B[3]), .B(A[3]), .Y(n146) );
  NAND2X2 U112 ( .A(n130), .B(n134), .Y(n173) );
  NAND2XL U113 ( .A(n144), .B(n145), .Y(n143) );
  OA21X2 U114 ( .A0(n152), .A1(n153), .B0(n154), .Y(n151) );
  CLKINVX1 U115 ( .A(n140), .Y(n137) );
  CLKINVX1 U116 ( .A(n146), .Y(n185) );
  OR2X2 U117 ( .A(B[6]), .B(A[6]), .Y(n130) );
  AOI21X2 U118 ( .A0(n137), .A1(n130), .B0(n184), .Y(n117) );
  CLKINVX1 U119 ( .A(n131), .Y(n184) );
  NAND2X2 U120 ( .A(n182), .B(n183), .Y(n134) );
  NAND2X1 U121 ( .A(n144), .B(n148), .Y(n135) );
  NOR2X2 U122 ( .A(n176), .B(n159), .Y(n175) );
  AND2X4 U123 ( .A(n115), .B(n116), .Y(n174) );
  NAND2X1 U124 ( .A(n156), .B(n155), .Y(n115) );
  CLKINVX1 U125 ( .A(A[9]), .Y(n166) );
  CLKINVX1 U126 ( .A(n114), .Y(n165) );
  OR2X1 U127 ( .A(B[8]), .B(A[8]), .Y(n121) );
  XOR2X1 U128 ( .A(n126), .B(n123), .Y(SUM[7]) );
  NAND2BX2 U129 ( .AN(B[3]), .B(n181), .Y(n148) );
  OR2X8 U130 ( .A(B[2]), .B(A[2]), .Y(n156) );
  INVX4 U131 ( .A(n176), .Y(n116) );
  CLKXOR2X1 U132 ( .A(n158), .B(n153), .Y(SUM[1]) );
  NAND2X6 U133 ( .A(n179), .B(n180), .Y(n155) );
  NAND2X2 U134 ( .A(n117), .B(n173), .Y(n168) );
  OAI211X2 U135 ( .A0(n165), .A1(n124), .B0(n122), .C0(n166), .Y(n163) );
  OR2X8 U136 ( .A(n174), .B(n175), .Y(n132) );
  XOR2X4 U137 ( .A(n119), .B(n120), .Y(SUM[8]) );
  XOR2X4 U138 ( .A(n128), .B(n129), .Y(SUM[6]) );
  AO22X2 U139 ( .A0(n118), .A1(n132), .B0(n118), .B1(n133), .Y(n128) );
  NAND2X2 U140 ( .A(B[7]), .B(A[7]), .Y(n124) );
  CLKINVX8 U141 ( .A(n154), .Y(n177) );
  NAND2X1 U142 ( .A(n130), .B(n131), .Y(n129) );
  AOI21X1 U143 ( .A0(n134), .A1(n136), .B0(n137), .Y(n118) );
  NAND2X4 U144 ( .A(B[0]), .B(A[0]), .Y(n162) );
  OR2X4 U145 ( .A(B[0]), .B(A[0]), .Y(n161) );
  OAI2BB1X4 U146 ( .A0N(n167), .A1N(n168), .B0(n169), .Y(n127) );
  NAND2XL U147 ( .A(n161), .B(n162), .Y(n160) );
  NAND2X2 U148 ( .A(n141), .B(n117), .Y(n167) );
  INVX3 U149 ( .A(n157), .Y(n178) );
  NAND2XL U150 ( .A(n148), .B(n146), .Y(n149) );
  INVXL U151 ( .A(n159), .Y(n153) );
  XNOR2X1 U152 ( .A(CI), .B(n160), .Y(SUM[0]) );
  NAND2XL U153 ( .A(B[8]), .B(A[8]), .Y(n122) );
  OR2X1 U154 ( .A(B[7]), .B(A[7]), .Y(n125) );
  XOR2X1 U155 ( .A(n142), .B(n143), .Y(SUM[4]) );
  AO21X1 U156 ( .A0(n146), .A1(n132), .B0(n147), .Y(n142) );
  NAND2XL U157 ( .A(n125), .B(n124), .Y(n126) );
  NAND2BXL U158 ( .AN(n135), .B(n134), .Y(n133) );
  CLKINVX1 U159 ( .A(n148), .Y(n147) );
  NAND2X1 U160 ( .A(n134), .B(n140), .Y(n139) );
  XOR2XL U161 ( .A(n132), .B(n149), .Y(SUM[3]) );
  XOR2X1 U162 ( .A(n150), .B(n151), .Y(SUM[2]) );
  NAND2XL U163 ( .A(n156), .B(n157), .Y(n150) );
  INVXL U164 ( .A(B[5]), .Y(n182) );
  CLKINVX1 U165 ( .A(A[5]), .Y(n183) );
  NAND2X1 U166 ( .A(n114), .B(n122), .Y(n120) );
  CLKINVX1 U167 ( .A(n155), .Y(n152) );
  NAND2X1 U168 ( .A(n155), .B(n154), .Y(n158) );
  INVXL U169 ( .A(B[1]), .Y(n179) );
  OA21X4 U170 ( .A0(n127), .A1(n163), .B0(n164), .Y(CO) );
  AO21X4 U171 ( .A0(n114), .A1(n125), .B0(n163), .Y(n164) );
  AO21X4 U172 ( .A0(n177), .A1(n156), .B0(n178), .Y(n176) );
endmodule


module geofence_DW01_add_10 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215;

  INVX3 U109 ( .A(n153), .Y(n214) );
  NAND2X1 U110 ( .A(B[8]), .B(A[8]), .Y(n153) );
  NAND2X6 U111 ( .A(B[0]), .B(A[0]), .Y(n192) );
  CLKINVX8 U112 ( .A(n157), .Y(n148) );
  OR2X8 U113 ( .A(B[2]), .B(A[2]), .Y(n185) );
  INVX4 U114 ( .A(n174), .Y(n143) );
  INVX6 U115 ( .A(n166), .Y(n171) );
  OAI21X4 U116 ( .A0(n176), .A1(n143), .B0(n175), .Y(n166) );
  CLKINVX8 U117 ( .A(n210), .Y(n193) );
  XOR2X4 U118 ( .A(n172), .B(n173), .Y(SUM[4]) );
  OAI2BB1X4 U119 ( .A0N(n176), .A1N(n162), .B0(n177), .Y(n172) );
  NAND2X4 U120 ( .A(B[2]), .B(A[2]), .Y(n186) );
  NAND2X4 U121 ( .A(B[4]), .B(A[4]), .Y(n175) );
  AOI21X4 U122 ( .A0(n164), .A1(n166), .B0(n167), .Y(n134) );
  CLKINVX6 U123 ( .A(n209), .Y(n208) );
  OAI2BB1X4 U124 ( .A0N(n167), .A1N(n160), .B0(n161), .Y(n209) );
  OAI2BB1X4 U125 ( .A0N(n148), .A1N(n154), .B0(n155), .Y(n150) );
  NAND2BX2 U126 ( .AN(A[10]), .B(n147), .Y(n215) );
  NAND2X4 U127 ( .A(n152), .B(n153), .Y(n151) );
  NAND2X6 U128 ( .A(n200), .B(n135), .Y(n198) );
  CLKINVX1 U129 ( .A(n170), .Y(n167) );
  OR2X2 U130 ( .A(B[0]), .B(A[0]), .Y(n191) );
  NAND2X4 U131 ( .A(n137), .B(n151), .Y(n140) );
  INVX3 U132 ( .A(n150), .Y(n137) );
  NAND2X2 U133 ( .A(n150), .B(n138), .Y(n139) );
  CLKINVX1 U134 ( .A(n151), .Y(n138) );
  INVX8 U135 ( .A(n162), .Y(n200) );
  CLKINVX1 U136 ( .A(n202), .Y(n201) );
  CLKINVX1 U137 ( .A(n165), .Y(n199) );
  NAND2X2 U138 ( .A(n160), .B(n164), .Y(n202) );
  CLKINVX1 U139 ( .A(n184), .Y(n181) );
  OR2X4 U140 ( .A(B[1]), .B(A[1]), .Y(n184) );
  OR2X4 U141 ( .A(B[5]), .B(A[5]), .Y(n164) );
  NAND2X2 U142 ( .A(B[5]), .B(A[5]), .Y(n170) );
  XOR2X1 U143 ( .A(n158), .B(n159), .Y(SUM[6]) );
  INVX3 U144 ( .A(n215), .Y(n211) );
  AO22X1 U145 ( .A0(n148), .A1(n142), .B0(n142), .B1(n149), .Y(n144) );
  NAND2X2 U146 ( .A(B[7]), .B(A[7]), .Y(n154) );
  AND2X2 U147 ( .A(n201), .B(n199), .Y(n135) );
  NAND2X8 U148 ( .A(n139), .B(n140), .Y(SUM[8]) );
  XOR2X2 U149 ( .A(n156), .B(n148), .Y(SUM[7]) );
  NAND2XL U150 ( .A(n184), .B(n183), .Y(n187) );
  OA21XL U151 ( .A0(n181), .A1(n182), .B0(n183), .Y(n180) );
  OR2X8 U152 ( .A(B[9]), .B(A[9]), .Y(n146) );
  NAND2X4 U153 ( .A(B[9]), .B(A[9]), .Y(n147) );
  NAND2X8 U154 ( .A(B[1]), .B(A[1]), .Y(n183) );
  OR2X8 U155 ( .A(B[4]), .B(A[4]), .Y(n174) );
  CLKINVX8 U156 ( .A(n183), .Y(n206) );
  NAND2X4 U157 ( .A(n152), .B(n155), .Y(n149) );
  OR2X8 U158 ( .A(B[8]), .B(A[8]), .Y(n152) );
  NOR2X4 U159 ( .A(n136), .B(n205), .Y(n203) );
  CLKAND2X8 U160 ( .A(n185), .B(n184), .Y(n136) );
  INVX3 U161 ( .A(n186), .Y(n207) );
  OR2X8 U162 ( .A(B[6]), .B(A[6]), .Y(n160) );
  OR2X8 U163 ( .A(n203), .B(n204), .Y(n162) );
  OR2X2 U164 ( .A(B[7]), .B(A[7]), .Y(n155) );
  NAND2X2 U165 ( .A(B[3]), .B(A[3]), .Y(n176) );
  NAND2XL U166 ( .A(n141), .B(n147), .Y(n145) );
  NOR2X4 U167 ( .A(n205), .B(n188), .Y(n204) );
  NAND2X4 U168 ( .A(n174), .B(n177), .Y(n165) );
  OR2X4 U169 ( .A(B[3]), .B(A[3]), .Y(n177) );
  BUFX4 U170 ( .A(n146), .Y(n141) );
  OAI2BB1X4 U171 ( .A0N(CI), .A1N(n191), .B0(n192), .Y(n188) );
  INVX3 U172 ( .A(n154), .Y(n213) );
  AO22X1 U173 ( .A0(n171), .A1(n162), .B0(n171), .B1(n165), .Y(n168) );
  AOI21X4 U174 ( .A0(n213), .A1(n152), .B0(n214), .Y(n142) );
  NAND2XL U175 ( .A(n177), .B(n176), .Y(n178) );
  NAND2BXL U176 ( .AN(n165), .B(n164), .Y(n163) );
  AO22X4 U177 ( .A0(n211), .A1(n142), .B0(n212), .B1(n211), .Y(n210) );
  CLKINVX1 U178 ( .A(n149), .Y(n195) );
  NAND2X1 U179 ( .A(n174), .B(n175), .Y(n173) );
  NAND2X1 U180 ( .A(n155), .B(n154), .Y(n156) );
  NAND2X2 U181 ( .A(n208), .B(n202), .Y(n197) );
  NAND2X2 U182 ( .A(n171), .B(n208), .Y(n196) );
  NAND2X1 U183 ( .A(n160), .B(n161), .Y(n159) );
  NAND2X1 U184 ( .A(B[6]), .B(A[6]), .Y(n161) );
  XOR2X1 U185 ( .A(n168), .B(n169), .Y(SUM[5]) );
  NAND2XL U186 ( .A(n164), .B(n170), .Y(n169) );
  AO22X2 U187 ( .A0(n134), .A1(n162), .B0(n134), .B1(n163), .Y(n158) );
  NAND2X1 U188 ( .A(n191), .B(n192), .Y(n190) );
  CLKINVX1 U189 ( .A(n141), .Y(n212) );
  XOR2X1 U190 ( .A(n179), .B(n180), .Y(SUM[2]) );
  NAND2XL U191 ( .A(n185), .B(n186), .Y(n179) );
  XOR2XL U192 ( .A(n162), .B(n178), .Y(SUM[3]) );
  XOR2X1 U193 ( .A(n144), .B(n145), .Y(SUM[9]) );
  CLKINVX1 U194 ( .A(n188), .Y(n182) );
  XOR2X1 U195 ( .A(n189), .B(n190), .Y(SUM[0]) );
  XOR2X1 U196 ( .A(n187), .B(n182), .Y(SUM[1]) );
  CLKINVX1 U197 ( .A(CI), .Y(n189) );
  OA21X4 U198 ( .A0(n193), .A1(n157), .B0(n194), .Y(CO) );
  AO21X4 U199 ( .A0(n195), .A1(n141), .B0(n193), .Y(n194) );
  OAI2BB1X4 U200 ( .A0N(n196), .A1N(n197), .B0(n198), .Y(n157) );
  AO21X4 U201 ( .A0(n206), .A1(n185), .B0(n207), .Y(n205) );
endmodule


module geofence_DW01_add_11 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195;

  NAND3X6 U117 ( .A(n157), .B(n158), .C(n155), .Y(n153) );
  NAND3X1 U118 ( .A(B[3]), .B(n164), .C(A[3]), .Y(n158) );
  OR2X8 U119 ( .A(B[4]), .B(A[4]), .Y(n164) );
  INVX3 U120 ( .A(A[5]), .Y(n161) );
  AOI32X2 U121 ( .A0(A[7]), .A1(B[7]), .A2(n194), .B0(B[8]), .B1(A[8]), .Y(
        n186) );
  OR2X8 U122 ( .A(B[8]), .B(A[8]), .Y(n194) );
  AND2X8 U123 ( .A(n193), .B(n192), .Y(n147) );
  INVX8 U124 ( .A(A[10]), .Y(n192) );
  AO21X4 U125 ( .A0(n160), .A1(n161), .B0(n145), .Y(n156) );
  CLKAND2X12 U126 ( .A(n163), .B(n162), .Y(n145) );
  INVX8 U127 ( .A(n184), .Y(n152) );
  CLKINVX8 U128 ( .A(A[6]), .Y(n162) );
  NAND2X2 U129 ( .A(n144), .B(n177), .Y(n174) );
  INVX6 U130 ( .A(n170), .Y(n177) );
  INVX12 U131 ( .A(A[2]), .Y(n180) );
  CLKAND2X8 U132 ( .A(n181), .B(n180), .Y(n146) );
  OR2X1 U133 ( .A(n176), .B(n146), .Y(n144) );
  NOR2X1 U134 ( .A(A[1]), .B(B[1]), .Y(n176) );
  NAND2X1 U135 ( .A(n172), .B(n173), .Y(n171) );
  CLKINVX1 U136 ( .A(A[0]), .Y(n173) );
  CLKINVX1 U137 ( .A(n188), .Y(n195) );
  OAI32X2 U138 ( .A0(n178), .A1(n146), .A2(n179), .B0(n180), .B1(n181), .Y(
        n170) );
  NAND2XL U139 ( .A(B[0]), .B(n171), .Y(n169) );
  OAI21X4 U140 ( .A0(n182), .A1(n183), .B0(n152), .Y(n148) );
  INVX4 U141 ( .A(n159), .Y(n155) );
  OAI32X2 U142 ( .A0(n145), .A1(n160), .A2(n161), .B0(n162), .B1(n163), .Y(
        n159) );
  NAND3X8 U143 ( .A(n165), .B(n166), .C(n167), .Y(n150) );
  AO21X2 U144 ( .A0(n190), .A1(n191), .B0(n147), .Y(n188) );
  NAND3X4 U145 ( .A(n168), .B(n169), .C(n177), .Y(n166) );
  NAND2X6 U146 ( .A(n153), .B(n154), .Y(n151) );
  INVX4 U147 ( .A(n189), .Y(n187) );
  NAND3X6 U148 ( .A(n151), .B(n150), .C(n152), .Y(n149) );
  INVX2 U149 ( .A(A[1]), .Y(n178) );
  AND3X8 U150 ( .A(n174), .B(n175), .C(n164), .Y(n165) );
  OAI21X1 U151 ( .A0(A[7]), .A1(B[7]), .B0(n195), .Y(n183) );
  OAI32X2 U152 ( .A0(n147), .A1(n190), .A2(n191), .B0(n192), .B1(n193), .Y(
        n189) );
  NAND2BX4 U153 ( .AN(A[11]), .B(n185), .Y(n184) );
  NAND2X2 U154 ( .A(n155), .B(n156), .Y(n154) );
  CLKINVX1 U155 ( .A(n156), .Y(n167) );
  AND2X8 U156 ( .A(n148), .B(n149), .Y(CO) );
  INVXL U157 ( .A(n194), .Y(n182) );
  INVXL U158 ( .A(B[6]), .Y(n163) );
  INVXL U159 ( .A(B[5]), .Y(n160) );
  AO22X4 U160 ( .A0(n186), .A1(n187), .B0(n187), .B1(n188), .Y(n185) );
  INVX4 U161 ( .A(A[9]), .Y(n191) );
  NAND2XL U162 ( .A(CI), .B(A[0]), .Y(n168) );
  CLKINVX1 U163 ( .A(B[2]), .Y(n181) );
  CLKINVX1 U164 ( .A(B[9]), .Y(n190) );
  OR2XL U165 ( .A(B[3]), .B(A[3]), .Y(n175) );
  INVXL U166 ( .A(B[1]), .Y(n179) );
  INVXL U167 ( .A(B[10]), .Y(n193) );
  CLKINVX1 U168 ( .A(CI), .Y(n172) );
  NAND2XL U169 ( .A(B[4]), .B(A[4]), .Y(n157) );
endmodule


module geofence_DW_sqrt_3 ( a, root );
  input [22:0] a;
  output [11:0] root;
  wire   n197, n198, n199, n200, n201, n202, \PartRem[10][4] ,
         \PartRem[10][3] , \PartRem[9][5] , \PartRem[9][3] , \PartRem[8][6] ,
         \PartRem[8][5] , \PartRem[8][3] , \PartRem[7][7] , \PartRem[7][6] ,
         \PartRem[7][5] , \PartRem[7][4] , \PartRem[7][3] , \PartRem[6][8] ,
         \PartRem[6][7] , \PartRem[6][6] , \PartRem[6][3] , \PartRem[5][9] ,
         \PartRem[5][8] , \PartRem[5][6] , \PartRem[5][4] , \PartRem[5][3] ,
         \PartRem[4][10] , \PartRem[4][9] , \PartRem[4][7] , \PartRem[4][6] ,
         \PartRem[4][5] , \PartRem[4][3] , \PartRem[3][11] , \PartRem[3][10] ,
         \PartRem[3][5] , \PartRem[3][3] , \PartRem[2][12] , \PartRem[2][11] ,
         \PartRem[2][10] , \PartRem[2][9] , \PartRem[2][8] , \PartRem[2][7] ,
         \PartRem[2][6] , \PartRem[2][5] , \PartRem[2][4] , \PartRem[2][3] ,
         \PartRem[1][13] , \PartRem[1][12] , \PartRem[1][11] ,
         \PartRem[1][10] , \PartRem[1][9] , \PartRem[1][8] , \PartRem[1][7] ,
         \PartRem[1][6] , \PartRem[1][5] , \PartRem[1][4] , \PartRem[1][3] ,
         \PartRem[1][2] , \PartRoot[9][4] , \PartRoot[9][3] , \PartRoot[9][2] ,
         \PartRoot[8][2] , \PartRoot[6][2] , \PartRoot[5][2] ,
         \PartRoot[4][2] , \PartRoot[3][2] , \PartRoot[2][2] , \SumTmp[10][2] ,
         \SumTmp[9][2] , \SumTmp[8][2] , \SumTmp[7][5] , \SumTmp[7][4] ,
         \SumTmp[7][3] , \SumTmp[7][2] , \SumTmp[6][6] , \SumTmp[6][5] ,
         \SumTmp[6][4] , \SumTmp[6][3] , \SumTmp[6][2] , \SumTmp[5][7] ,
         \SumTmp[5][6] , \SumTmp[5][5] , \SumTmp[5][4] , \SumTmp[5][3] ,
         \SumTmp[5][2] , \SumTmp[4][8] , \SumTmp[4][7] , \SumTmp[4][6] ,
         \SumTmp[4][5] , \SumTmp[4][4] , \SumTmp[4][3] , \SumTmp[4][2] ,
         \SumTmp[3][9] , \SumTmp[3][8] , \SumTmp[3][7] , \SumTmp[3][6] ,
         \SumTmp[3][5] , \SumTmp[3][4] , \SumTmp[3][3] , \SumTmp[3][2] ,
         \SumTmp[2][10] , \SumTmp[2][9] , \SumTmp[2][8] , \SumTmp[2][7] ,
         \SumTmp[2][6] , \SumTmp[2][5] , \SumTmp[2][4] , \SumTmp[2][3] ,
         \SumTmp[2][2] , \SumTmp[1][11] , \SumTmp[1][10] , \SumTmp[1][9] ,
         \SumTmp[1][8] , \SumTmp[1][7] , \SumTmp[1][6] , \SumTmp[1][5] ,
         \SumTmp[1][4] , \SumTmp[1][3] , \SumTmp[1][2] , \CryTmp[10][2] ,
         \CryTmp[9][2] , \CryTmp[8][2] , \CryTmp[7][2] , \CryTmp[6][2] ,
         \CryTmp[5][2] , \CryTmp[4][2] , \CryTmp[3][2] , \CryTmp[2][2] ,
         \CryTmp[1][2] , \CryTmp[0][2] , n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n72, n73, n79,
         n80, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6;

  geofence_DW01_add_4 u_add_PartRem_7 ( .A({\PartRem[8][6] , \PartRem[8][5] , 
        n41, \PartRem[8][3] , n69}), .B({1'b1, \PartRoot[9][4] , n82, n47, n46}), .CI(\CryTmp[7][2] ), .SUM({SYNOPSYS_UNCONNECTED__0, \SumTmp[7][5] , 
        \SumTmp[7][4] , \SumTmp[7][3] , \SumTmp[7][2] }), .CO(n198) );
  geofence_DW01_add_5 u_add_PartRem_6 ( .A({\PartRem[7][7] , \PartRem[7][6] , 
        \PartRem[7][5] , \PartRem[7][4] , \PartRem[7][3] , n64}), .B({1'b1, 
        \PartRoot[9][4] , n82, n47, n46, n72}), .CI(\CryTmp[6][2] ), .SUM({
        SYNOPSYS_UNCONNECTED__1, \SumTmp[6][6] , \SumTmp[6][5] , 
        \SumTmp[6][4] , \SumTmp[6][3] , \SumTmp[6][2] }), .CO(root[6]) );
  geofence_DW01_add_6 u_add_PartRem_5 ( .A({\PartRem[6][8] , \PartRem[6][7] , 
        \PartRem[6][6] , n54, n34, \PartRem[6][3] , n68}), .B({1'b1, 
        \PartRoot[9][4] , n82, \PartRoot[9][2] , n46, n73, n42}), .CI(
        \CryTmp[5][2] ), .SUM({SYNOPSYS_UNCONNECTED__2, \SumTmp[5][7] , 
        \SumTmp[5][6] , \SumTmp[5][5] , \SumTmp[5][4] , \SumTmp[5][3] , 
        \SumTmp[5][2] }), .CO(root[5]) );
  geofence_DW01_add_7 u_add_PartRem_4 ( .A({\PartRem[5][9] , \PartRem[5][8] , 
        n30, \PartRem[5][6] , n55, \PartRem[5][4] , \PartRem[5][3] , n66}), 
        .B({1'b1, \PartRoot[9][4] , n82, n47, n46, n72, n42, \PartRoot[5][2] }), .CI(\CryTmp[4][2] ), .SUM({SYNOPSYS_UNCONNECTED__3, \SumTmp[4][8] , 
        \SumTmp[4][7] , \SumTmp[4][6] , \SumTmp[4][5] , \SumTmp[4][4] , 
        \SumTmp[4][3] , \SumTmp[4][2] }), .CO(n199) );
  geofence_DW01_add_8 u_add_PartRem_3 ( .A({\PartRem[4][10] , \PartRem[4][9] , 
        n27, \PartRem[4][7] , \PartRem[4][6] , \PartRem[4][5] , n53, 
        \PartRem[4][3] , n62}), .B({1'b1, \PartRoot[9][4] , n82, n47, n46, n72, 
        n42, \PartRoot[5][2] , \PartRoot[4][2] }), .CI(\CryTmp[3][2] ), .SUM({
        SYNOPSYS_UNCONNECTED__4, \SumTmp[3][9] , \SumTmp[3][8] , 
        \SumTmp[3][7] , \SumTmp[3][6] , \SumTmp[3][5] , \SumTmp[3][4] , 
        \SumTmp[3][3] , \SumTmp[3][2] }), .CO(n200) );
  geofence_DW01_add_9 u_add_PartRem_2 ( .A({\PartRem[3][11] , \PartRem[3][10] , 
        n32, n49, n56, n50, \PartRem[3][5] , n52, \PartRem[3][3] , n63}), .B({
        1'b1, \PartRoot[9][4] , n82, n47, n46, n73, n42, \PartRoot[5][2] , 
        \PartRoot[4][2] , \PartRoot[3][2] }), .CI(\CryTmp[2][2] ), .SUM({
        SYNOPSYS_UNCONNECTED__5, \SumTmp[2][10] , \SumTmp[2][9] , 
        \SumTmp[2][8] , \SumTmp[2][7] , \SumTmp[2][6] , \SumTmp[2][5] , 
        \SumTmp[2][4] , \SumTmp[2][3] , \SumTmp[2][2] }), .CO(n201) );
  geofence_DW01_add_10 u_add_PartRem_1 ( .A({\PartRem[2][12] , 
        \PartRem[2][11] , \PartRem[2][10] , \PartRem[2][9] , \PartRem[2][8] , 
        \PartRem[2][7] , \PartRem[2][6] , \PartRem[2][5] , \PartRem[2][4] , 
        \PartRem[2][3] , n48}), .B({1'b1, \PartRoot[9][4] , n82, n47, n46, n72, 
        n42, \PartRoot[5][2] , \PartRoot[4][2] , \PartRoot[3][2] , 
        \PartRoot[2][2] }), .CI(\CryTmp[1][2] ), .SUM({SYNOPSYS_UNCONNECTED__6, 
        \SumTmp[1][11] , \SumTmp[1][10] , \SumTmp[1][9] , \SumTmp[1][8] , 
        \SumTmp[1][7] , \SumTmp[1][6] , \SumTmp[1][5] , \SumTmp[1][4] , 
        \SumTmp[1][3] , \SumTmp[1][2] }), .CO(n202) );
  geofence_DW01_add_11 u_add_PartRem_0 ( .A({\PartRem[1][13] , 
        \PartRem[1][12] , \PartRem[1][11] , \PartRem[1][10] , \PartRem[1][9] , 
        \PartRem[1][8] , \PartRem[1][7] , \PartRem[1][6] , \PartRem[1][5] , 
        \PartRem[1][4] , \PartRem[1][3] , \PartRem[1][2] }), .B({1'b1, 
        \PartRoot[9][4] , n82, n47, n46, n72, n42, \PartRoot[5][2] , 
        \PartRoot[4][2] , \PartRoot[3][2] , \PartRoot[2][2] , n38}), .CI(
        \CryTmp[0][2] ), .CO(root[0]) );
  BUFX16 U3 ( .A(n197), .Y(root[10]) );
  INVX8 U4 ( .A(\CryTmp[10][2] ), .Y(n106) );
  INVX6 U5 ( .A(\PartRoot[8][2] ), .Y(n45) );
  MX2X8 U6 ( .A(\PartRem[6][3] ), .B(\SumTmp[5][3] ), .S0(root[5]), .Y(n55) );
  INVX8 U7 ( .A(n157), .Y(\PartRem[2][10] ) );
  OR2X8 U8 ( .A(\CryTmp[8][2] ), .B(\PartRoot[8][2] ), .Y(n24) );
  INVX8 U9 ( .A(root[8]), .Y(\PartRoot[8][2] ) );
  OR2X6 U10 ( .A(n80), .B(a[9]), .Y(n131) );
  INVX8 U11 ( .A(root[1]), .Y(n38) );
  CLKXOR2X4 U12 ( .A(root[8]), .B(a[16]), .Y(n69) );
  AND2X8 U13 ( .A(n35), .B(n36), .Y(n37) );
  OA21XL U14 ( .A0(n97), .A1(n61), .B0(n96), .Y(n98) );
  NAND2XL U15 ( .A(n95), .B(n96), .Y(n92) );
  CLKINVX4 U16 ( .A(n96), .Y(n83) );
  INVX12 U17 ( .A(n107), .Y(\PartRem[10][3] ) );
  INVX6 U18 ( .A(root[2]), .Y(\PartRoot[2][2] ) );
  XOR2X4 U19 ( .A(root[2]), .B(a[4]), .Y(n48) );
  MX2X6 U20 ( .A(n65), .B(\SumTmp[9][2] ), .S0(root[9]), .Y(n25) );
  INVX16 U21 ( .A(root[10]), .Y(\PartRoot[9][3] ) );
  INVX2 U22 ( .A(n89), .Y(n84) );
  NOR2X8 U23 ( .A(n136), .B(n137), .Y(\PartRem[3][3] ) );
  AND2X1 U24 ( .A(n101), .B(n100), .Y(n60) );
  INVX8 U25 ( .A(n151), .Y(\PartRem[2][4] ) );
  INVX8 U26 ( .A(n149), .Y(\PartRem[2][6] ) );
  MXI2X4 U27 ( .A(n147), .B(n192), .S0(root[1]), .Y(\PartRem[1][10] ) );
  MXI2XL U28 ( .A(n126), .B(n134), .S0(root[4]), .Y(\PartRem[4][10] ) );
  CLKINVX6 U29 ( .A(n126), .Y(\PartRem[5][8] ) );
  CLKMX2X8 U30 ( .A(\PartRem[7][3] ), .B(\SumTmp[6][3] ), .S0(root[6]), .Y(n54) );
  AND2X8 U31 ( .A(n109), .B(n108), .Y(\PartRem[9][3] ) );
  NAND3X4 U32 ( .A(\CryTmp[5][2] ), .B(n191), .C(root[5]), .Y(n128) );
  CLKINVX12 U33 ( .A(n199), .Y(n79) );
  OR2X6 U34 ( .A(\PartRoot[9][4] ), .B(n25), .Y(n94) );
  NAND2X2 U35 ( .A(\PartRoot[9][4] ), .B(n25), .Y(n93) );
  CLKINVX12 U36 ( .A(root[9]), .Y(\PartRoot[9][2] ) );
  NAND2X6 U37 ( .A(\PartRoot[9][4] ), .B(\PartRem[10][3] ), .Y(n102) );
  INVX8 U38 ( .A(n148), .Y(\PartRem[2][7] ) );
  MXI2X4 U39 ( .A(n149), .B(n163), .S0(root[1]), .Y(\PartRem[1][8] ) );
  INVX8 U40 ( .A(root[7]), .Y(n72) );
  INVX3 U41 ( .A(n85), .Y(n87) );
  NAND2X6 U42 ( .A(n82), .B(\PartRem[9][3] ), .Y(n96) );
  INVX8 U43 ( .A(a[22]), .Y(n105) );
  INVX20 U44 ( .A(n45), .Y(n46) );
  INVX8 U45 ( .A(n186), .Y(\PartRem[5][4] ) );
  BUFX20 U46 ( .A(n198), .Y(root[7]) );
  NAND2X6 U47 ( .A(n24), .B(n113), .Y(n112) );
  OR2X8 U48 ( .A(a[17]), .B(a[16]), .Y(\CryTmp[8][2] ) );
  INVX2 U49 ( .A(a[17]), .Y(n113) );
  AND2X8 U50 ( .A(n26), .B(n112), .Y(\PartRem[8][3] ) );
  AOI21X4 U51 ( .A0(n94), .A1(n95), .B0(n85), .Y(n86) );
  MXI2X4 U52 ( .A(n55), .B(\SumTmp[4][5] ), .S0(n80), .Y(n180) );
  AND3X8 U53 ( .A(n131), .B(n132), .C(n133), .Y(\PartRem[4][3] ) );
  CLKMX2X8 U54 ( .A(\PartRem[4][5] ), .B(\SumTmp[3][5] ), .S0(root[3]), .Y(n56) );
  CLKMX2X12 U55 ( .A(n62), .B(\SumTmp[3][2] ), .S0(root[3]), .Y(n52) );
  NAND2X6 U56 ( .A(n193), .B(n194), .Y(n107) );
  CLKMX2X8 U57 ( .A(\PartRem[4][6] ), .B(\SumTmp[3][6] ), .S0(root[3]), .Y(n49) );
  NOR2BX2 U58 ( .AN(\CryTmp[10][2] ), .B(a[20]), .Y(n196) );
  MXI2X4 U59 ( .A(n153), .B(n174), .S0(root[1]), .Y(\PartRem[1][4] ) );
  INVX12 U60 ( .A(n79), .Y(n80) );
  NAND3X4 U61 ( .A(\CryTmp[4][2] ), .B(n161), .C(n80), .Y(n133) );
  NOR2X1 U62 ( .A(\PartRoot[5][2] ), .B(\CryTmp[5][2] ), .Y(n190) );
  INVX20 U63 ( .A(root[5]), .Y(\PartRoot[5][2] ) );
  XOR2X4 U64 ( .A(root[4]), .B(a[8]), .Y(n62) );
  NAND3X4 U65 ( .A(\CryTmp[9][2] ), .B(n117), .C(root[9]), .Y(n108) );
  INVX12 U66 ( .A(n57), .Y(root[9]) );
  CLKINVX6 U67 ( .A(n145), .Y(\PartRem[3][10] ) );
  MXI2XL U68 ( .A(n145), .B(n154), .S0(root[2]), .Y(\PartRem[2][12] ) );
  MXI2X4 U69 ( .A(n27), .B(\SumTmp[3][8] ), .S0(root[3]), .Y(n145) );
  MXI2X8 U70 ( .A(n159), .B(n160), .S0(root[3]), .Y(\PartRem[3][5] ) );
  NAND2X6 U71 ( .A(n47), .B(n67), .Y(n89) );
  OR2X8 U72 ( .A(n47), .B(n67), .Y(n90) );
  INVX20 U73 ( .A(root[9]), .Y(n47) );
  XNOR2X2 U74 ( .A(n105), .B(n106), .Y(\SumTmp[10][2] ) );
  INVX3 U75 ( .A(n147), .Y(\PartRem[2][8] ) );
  INVX4 U76 ( .A(n155), .Y(\PartRem[5][6] ) );
  INVX3 U77 ( .A(n120), .Y(\PartRem[6][7] ) );
  NAND2X2 U78 ( .A(n182), .B(root[6]), .Y(n36) );
  CLKINVX6 U79 ( .A(n28), .Y(\PartRem[6][6] ) );
  NAND2X2 U80 ( .A(\PartRem[7][4] ), .B(\PartRoot[6][2] ), .Y(n43) );
  INVX8 U81 ( .A(n152), .Y(\PartRem[2][3] ) );
  OR2X1 U82 ( .A(a[14]), .B(a[15]), .Y(\CryTmp[7][2] ) );
  OR2X1 U83 ( .A(a[12]), .B(a[13]), .Y(\CryTmp[6][2] ) );
  NAND2X6 U84 ( .A(a[13]), .B(\PartRoot[6][2] ), .Y(n35) );
  MX2X6 U85 ( .A(n67), .B(\SumTmp[8][2] ), .S0(root[8]), .Y(n41) );
  OR2X1 U86 ( .A(a[10]), .B(a[11]), .Y(\CryTmp[5][2] ) );
  OR2X2 U87 ( .A(n82), .B(\PartRem[9][3] ), .Y(n95) );
  OR2X1 U88 ( .A(a[8]), .B(a[9]), .Y(\CryTmp[4][2] ) );
  INVX3 U89 ( .A(n150), .Y(\PartRem[2][5] ) );
  AOI21X2 U90 ( .A0(\CryTmp[8][2] ), .A1(n90), .B0(n84), .Y(n61) );
  INVX1 U91 ( .A(n146), .Y(\PartRem[2][9] ) );
  OR2X1 U92 ( .A(a[6]), .B(a[7]), .Y(\CryTmp[3][2] ) );
  CLKXOR2X4 U93 ( .A(root[3]), .B(a[6]), .Y(n63) );
  OR2X1 U94 ( .A(a[4]), .B(a[5]), .Y(\CryTmp[2][2] ) );
  CLKINVX1 U95 ( .A(\SumTmp[4][8] ), .Y(n134) );
  CLKINVX1 U96 ( .A(\SumTmp[3][9] ), .Y(n140) );
  INVX3 U97 ( .A(root[3]), .Y(\PartRoot[3][2] ) );
  OR2X1 U98 ( .A(a[2]), .B(a[3]), .Y(\CryTmp[1][2] ) );
  INVX8 U99 ( .A(n79), .Y(root[4]) );
  CLKINVX1 U100 ( .A(\SumTmp[1][8] ), .Y(n192) );
  CLKINVX1 U101 ( .A(\SumTmp[1][6] ), .Y(n163) );
  INVX3 U102 ( .A(n80), .Y(\PartRoot[4][2] ) );
  OR2X1 U103 ( .A(a[1]), .B(a[0]), .Y(\CryTmp[0][2] ) );
  MXI2X4 U104 ( .A(n32), .B(\SumTmp[2][9] ), .S0(root[2]), .Y(n156) );
  MXI2X4 U105 ( .A(n184), .B(n157), .S0(n38), .Y(\PartRem[1][12] ) );
  NAND3X2 U106 ( .A(\CryTmp[8][2] ), .B(n125), .C(root[8]), .Y(n26) );
  CLKMX2X4 U107 ( .A(\PartRem[5][6] ), .B(\SumTmp[4][6] ), .S0(root[4]), .Y(
        n27) );
  AND2X4 U108 ( .A(n43), .B(n44), .Y(n28) );
  XNOR2X1 U109 ( .A(n59), .B(n104), .Y(n29) );
  CLKMX2X2 U110 ( .A(n54), .B(\SumTmp[5][5] ), .S0(root[5]), .Y(n30) );
  XNOR2X1 U111 ( .A(n92), .B(n61), .Y(n31) );
  CLKMX2X2 U112 ( .A(\PartRem[4][7] ), .B(\SumTmp[3][7] ), .S0(root[3]), .Y(
        n32) );
  AND3X2 U113 ( .A(\CryTmp[3][2] ), .B(n139), .C(root[3]), .Y(n33) );
  CLKINVX1 U114 ( .A(n130), .Y(\PartRem[4][9] ) );
  MXI2X1 U115 ( .A(n30), .B(\SumTmp[4][7] ), .S0(n80), .Y(n130) );
  CLKMX2X6 U116 ( .A(n64), .B(\SumTmp[6][2] ), .S0(root[6]), .Y(n34) );
  INVX4 U117 ( .A(root[6]), .Y(n42) );
  INVX8 U118 ( .A(\SumTmp[1][10] ), .Y(n184) );
  BUFX20 U119 ( .A(n201), .Y(root[2]) );
  MXI2X1 U120 ( .A(n118), .B(n119), .S0(root[6]), .Y(\PartRem[6][8] ) );
  CLKAND2X12 U121 ( .A(n127), .B(n128), .Y(\PartRem[5][3] ) );
  MXI2X4 U122 ( .A(n68), .B(\SumTmp[5][2] ), .S0(root[5]), .Y(n186) );
  XOR2X4 U123 ( .A(root[6]), .B(a[12]), .Y(n68) );
  AND2X2 U124 ( .A(root[10]), .B(\SumTmp[10][2] ), .Y(\PartRem[10][4] ) );
  NAND2X1 U125 ( .A(\CryTmp[10][2] ), .B(n195), .Y(n194) );
  INVX1 U126 ( .A(a[21]), .Y(n195) );
  CLKBUFX2 U127 ( .A(a[20]), .Y(n39) );
  OAI21XL U128 ( .A0(a[19]), .A1(n116), .B0(n108), .Y(n115) );
  INVXL U129 ( .A(n25), .Y(n40) );
  MXI2X4 U130 ( .A(n165), .B(\SumTmp[2][3] ), .S0(root[2]), .Y(n150) );
  INVX8 U131 ( .A(n156), .Y(\PartRem[2][11] ) );
  NAND2X6 U132 ( .A(n170), .B(n171), .Y(n152) );
  AOI2BB2X4 U133 ( .B0(\CryTmp[5][2] ), .B1(n129), .A0N(root[5]), .A1N(a[11]), 
        .Y(n127) );
  MX2X6 U134 ( .A(n66), .B(\SumTmp[4][2] ), .S0(root[4]), .Y(n53) );
  INVX12 U135 ( .A(root[6]), .Y(\PartRoot[6][2] ) );
  MXI2X4 U136 ( .A(\PartRem[7][5] ), .B(\SumTmp[6][5] ), .S0(root[6]), .Y(n120) );
  XOR2X4 U137 ( .A(root[5]), .B(a[10]), .Y(n66) );
  INVX12 U138 ( .A(n135), .Y(\PartRem[7][4] ) );
  MXI2X4 U139 ( .A(n69), .B(\SumTmp[7][2] ), .S0(root[7]), .Y(n135) );
  MXI2X2 U140 ( .A(n41), .B(\SumTmp[7][4] ), .S0(root[7]), .Y(n118) );
  MXI2X4 U141 ( .A(\PartRem[5][4] ), .B(\SumTmp[4][4] ), .S0(root[4]), .Y(n185) );
  MXI2X4 U142 ( .A(a[3]), .B(n177), .S0(root[1]), .Y(n175) );
  NOR2X6 U143 ( .A(n175), .B(n176), .Y(\PartRem[1][3] ) );
  MXI2X4 U144 ( .A(n63), .B(\SumTmp[2][2] ), .S0(root[2]), .Y(n151) );
  XOR2X4 U145 ( .A(root[1]), .B(a[2]), .Y(\PartRem[1][2] ) );
  MXI2X4 U146 ( .A(n50), .B(\SumTmp[2][6] ), .S0(root[2]), .Y(n147) );
  BUFX20 U147 ( .A(\PartRoot[9][3] ), .Y(n82) );
  CLKMX2X8 U148 ( .A(n53), .B(\SumTmp[3][4] ), .S0(root[3]), .Y(n50) );
  MXI2X2 U149 ( .A(n34), .B(\SumTmp[5][4] ), .S0(root[5]), .Y(n155) );
  INVX8 U150 ( .A(n180), .Y(\PartRem[4][7] ) );
  CLKMX2X6 U151 ( .A(n115), .B(n31), .S0(root[8]), .Y(n111) );
  INVX6 U152 ( .A(n111), .Y(\PartRem[8][5] ) );
  XOR2X4 U153 ( .A(root[10]), .B(n39), .Y(n65) );
  MXI2X2 U154 ( .A(n146), .B(n187), .S0(root[1]), .Y(\PartRem[1][11] ) );
  INVX3 U155 ( .A(\SumTmp[2][10] ), .Y(n154) );
  MXI2X4 U156 ( .A(a[7]), .B(n138), .S0(root[3]), .Y(n136) );
  MXI2X4 U157 ( .A(n56), .B(\SumTmp[2][7] ), .S0(root[2]), .Y(n146) );
  XOR2X4 U158 ( .A(root[7]), .B(a[14]), .Y(n64) );
  MXI2X4 U159 ( .A(n188), .B(n189), .S0(n80), .Y(\PartRem[4][5] ) );
  MXI2X4 U160 ( .A(n122), .B(n123), .S0(root[7]), .Y(\PartRem[7][5] ) );
  MXI2X2 U161 ( .A(n151), .B(n168), .S0(root[1]), .Y(\PartRem[1][6] ) );
  NOR2X8 U162 ( .A(n141), .B(n142), .Y(\PartRem[7][3] ) );
  MXI2X4 U163 ( .A(a[15]), .B(n143), .S0(root[7]), .Y(n142) );
  XOR2X4 U164 ( .A(root[9]), .B(a[18]), .Y(n67) );
  OR2X8 U165 ( .A(n82), .B(n65), .Y(n101) );
  MXI2X2 U166 ( .A(n148), .B(n158), .S0(root[1]), .Y(\PartRem[1][9] ) );
  INVX3 U167 ( .A(n118), .Y(\PartRem[7][6] ) );
  MXI2X4 U168 ( .A(n52), .B(\SumTmp[2][4] ), .S0(root[2]), .Y(n149) );
  OR2X8 U169 ( .A(a[20]), .B(a[21]), .Y(\CryTmp[10][2] ) );
  MXI2X4 U170 ( .A(n195), .B(n196), .S0(root[10]), .Y(n193) );
  MXI2X4 U171 ( .A(n49), .B(\SumTmp[2][8] ), .S0(root[2]), .Y(n157) );
  MXI2X4 U172 ( .A(n172), .B(n173), .S0(root[2]), .Y(n170) );
  NOR2X8 U173 ( .A(n37), .B(n181), .Y(\PartRem[6][3] ) );
  NAND2X2 U174 ( .A(\SumTmp[6][4] ), .B(root[6]), .Y(n44) );
  MXI2X4 U175 ( .A(\PartRem[3][5] ), .B(\SumTmp[2][5] ), .S0(root[2]), .Y(n148) );
  MXI2X4 U176 ( .A(\PartRem[6][6] ), .B(\SumTmp[5][6] ), .S0(root[5]), .Y(n126) );
  NOR2BX4 U177 ( .AN(n105), .B(n106), .Y(n197) );
  OAI2BB1X4 U178 ( .A0N(n83), .A1N(n94), .B0(n93), .Y(n85) );
  NAND2XL U179 ( .A(n94), .B(n93), .Y(n51) );
  OR2X4 U180 ( .A(\PartRoot[9][4] ), .B(\PartRem[10][3] ), .Y(n103) );
  OAI21XL U181 ( .A0(a[17]), .A1(n124), .B0(n26), .Y(n122) );
  XNOR2XL U182 ( .A(root[2]), .B(a[4]), .Y(n153) );
  MXI2X1 U183 ( .A(n156), .B(n179), .S0(root[1]), .Y(\PartRem[1][13] ) );
  INVX3 U184 ( .A(\SumTmp[1][9] ), .Y(n187) );
  MXI2XL U185 ( .A(n130), .B(n140), .S0(root[3]), .Y(\PartRem[3][11] ) );
  BUFX20 U186 ( .A(n200), .Y(root[3]) );
  INVX3 U187 ( .A(\SumTmp[6][6] ), .Y(n119) );
  BUFX20 U188 ( .A(n202), .Y(root[1]) );
  NAND2XL U189 ( .A(n90), .B(n89), .Y(n91) );
  XNOR2X1 U190 ( .A(n51), .B(n98), .Y(n58) );
  OAI2BB1X4 U191 ( .A0N(\CryTmp[9][2] ), .A1N(n101), .B0(n100), .Y(n104) );
  XNOR2X1 U192 ( .A(\CryTmp[8][2] ), .B(n91), .Y(\SumTmp[8][2] ) );
  OAI21X4 U193 ( .A0(\CryTmp[9][2] ), .A1(\PartRoot[9][2] ), .B0(n110), .Y(
        n109) );
  NOR2BXL U194 ( .AN(\CryTmp[3][2] ), .B(a[7]), .Y(n137) );
  NAND2XL U195 ( .A(\CryTmp[3][2] ), .B(n139), .Y(n138) );
  NOR2BXL U196 ( .AN(\CryTmp[7][2] ), .B(a[15]), .Y(n141) );
  NAND2XL U197 ( .A(\CryTmp[7][2] ), .B(n144), .Y(n143) );
  INVXL U198 ( .A(a[10]), .Y(n191) );
  INVXL U199 ( .A(a[8]), .Y(n161) );
  OR2X8 U200 ( .A(a[19]), .B(a[18]), .Y(\CryTmp[9][2] ) );
  INVXL U201 ( .A(a[14]), .Y(n144) );
  INVXL U202 ( .A(a[12]), .Y(n183) );
  NAND2XL U203 ( .A(\CryTmp[4][2] ), .B(n162), .Y(n132) );
  INVXL U204 ( .A(a[9]), .Y(n162) );
  INVXL U205 ( .A(a[6]), .Y(n139) );
  NOR2BXL U206 ( .AN(\CryTmp[2][2] ), .B(a[4]), .Y(n173) );
  INVXL U207 ( .A(a[5]), .Y(n172) );
  INVXL U208 ( .A(a[2]), .Y(n178) );
  CLKINVX1 U209 ( .A(root[7]), .Y(n73) );
  INVX1 U210 ( .A(\SumTmp[1][7] ), .Y(n158) );
  OAI22X4 U211 ( .A0(n99), .A1(n103), .B0(n104), .B1(n99), .Y(n57) );
  MXI2XL U212 ( .A(n120), .B(n121), .S0(root[5]), .Y(\PartRem[5][9] ) );
  INVX3 U213 ( .A(n185), .Y(\PartRem[4][6] ) );
  CLKINVX1 U214 ( .A(\SumTmp[1][4] ), .Y(n168) );
  MXI2X1 U215 ( .A(n150), .B(n164), .S0(root[1]), .Y(\PartRem[1][7] ) );
  INVX1 U216 ( .A(\SumTmp[1][5] ), .Y(n164) );
  CLKINVX1 U217 ( .A(n95), .Y(n97) );
  AND2XL U218 ( .A(n103), .B(n102), .Y(n59) );
  CLKINVX1 U219 ( .A(\SumTmp[1][11] ), .Y(n179) );
  INVX1 U220 ( .A(\SumTmp[5][7] ), .Y(n121) );
  XOR2X1 U221 ( .A(\CryTmp[9][2] ), .B(n60), .Y(\SumTmp[9][2] ) );
  MXI2XL U222 ( .A(n107), .B(n29), .S0(root[9]), .Y(\PartRem[9][5] ) );
  INVX1 U223 ( .A(\SumTmp[1][2] ), .Y(n174) );
  NAND2X2 U224 ( .A(n82), .B(n65), .Y(n100) );
  NOR2X1 U225 ( .A(n166), .B(n33), .Y(n165) );
  NAND3X1 U226 ( .A(n132), .B(n133), .C(n131), .Y(n159) );
  INVX1 U227 ( .A(\SumTmp[3][3] ), .Y(n160) );
  INVX1 U228 ( .A(\SumTmp[7][5] ), .Y(n114) );
  MXI2X1 U229 ( .A(n152), .B(n169), .S0(root[1]), .Y(\PartRem[1][5] ) );
  INVX1 U230 ( .A(\SumTmp[1][3] ), .Y(n169) );
  NOR2BX1 U231 ( .AN(\CryTmp[6][2] ), .B(a[13]), .Y(n181) );
  NAND2X1 U232 ( .A(\CryTmp[6][2] ), .B(n183), .Y(n182) );
  INVXL U233 ( .A(a[19]), .Y(n110) );
  NAND2X1 U234 ( .A(\CryTmp[2][2] ), .B(n172), .Y(n171) );
  INVXL U235 ( .A(a[18]), .Y(n117) );
  CLKINVX1 U236 ( .A(a[11]), .Y(n129) );
  NOR2BX1 U237 ( .AN(\CryTmp[1][2] ), .B(a[3]), .Y(n176) );
  NAND2X1 U238 ( .A(\CryTmp[1][2] ), .B(n178), .Y(n177) );
  INVXL U239 ( .A(a[16]), .Y(n125) );
  OAI21XL U240 ( .A0(a[11]), .A1(n190), .B0(n128), .Y(n188) );
  INVX1 U241 ( .A(\SumTmp[4][3] ), .Y(n189) );
  INVX3 U242 ( .A(\SumTmp[7][3] ), .Y(n123) );
  NOR2XL U243 ( .A(\CryTmp[8][2] ), .B(n46), .Y(n124) );
  NOR2XL U244 ( .A(\CryTmp[9][2] ), .B(\PartRoot[9][2] ), .Y(n116) );
  NOR2X1 U245 ( .A(a[7]), .B(n167), .Y(n166) );
  NOR2XL U246 ( .A(\PartRoot[3][2] ), .B(\CryTmp[3][2] ), .Y(n167) );
  CLKBUFX2 U247 ( .A(a[22]), .Y(root[11]) );
  MXI2XL U248 ( .A(n40), .B(n58), .S0(root[8]), .Y(\PartRem[8][6] ) );
  MXI2XL U249 ( .A(n111), .B(n114), .S0(root[7]), .Y(\PartRem[7][7] ) );
  INVX20 U250 ( .A(a[22]), .Y(\PartRoot[9][4] ) );
  AOI21X4 U251 ( .A0(n87), .A1(n61), .B0(n86), .Y(n88) );
  OR2X8 U252 ( .A(n88), .B(\PartRem[9][5] ), .Y(root[8]) );
  NAND2BX4 U253 ( .AN(\PartRem[10][4] ), .B(n102), .Y(n99) );
endmodule


module geofence_DW01_add_12 ( A, B, CI, SUM, CO );
  input [4:0] A;
  input [4:0] B;
  output [4:0] SUM;
  input CI;
  output CO;
  wire   n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76;

  INVX8 U39 ( .A(n58), .Y(n74) );
  NAND2X1 U40 ( .A(n59), .B(n58), .Y(n62) );
  OA21X2 U41 ( .A0(n56), .A1(n57), .B0(n58), .Y(n52) );
  CLKINVX4 U42 ( .A(A[3]), .Y(n55) );
  NAND2X8 U43 ( .A(B[1]), .B(A[1]), .Y(n58) );
  NAND2X2 U44 ( .A(n60), .B(n59), .Y(n68) );
  NAND2X8 U45 ( .A(n71), .B(n72), .Y(n59) );
  INVX8 U46 ( .A(A[1]), .Y(n72) );
  NAND2X4 U47 ( .A(B[2]), .B(A[2]), .Y(n61) );
  XOR2X1 U48 ( .A(n62), .B(n57), .Y(SUM[1]) );
  OR2X8 U49 ( .A(B[0]), .B(A[0]), .Y(n64) );
  INVX3 U50 ( .A(A[4]), .Y(n66) );
  CLKINVX4 U51 ( .A(n70), .Y(n57) );
  NAND2X2 U52 ( .A(n75), .B(n76), .Y(n60) );
  INVX8 U53 ( .A(n73), .Y(n67) );
  NAND3X8 U54 ( .A(n55), .B(n66), .C(n54), .Y(CO) );
  OAI2BB1X4 U55 ( .A0N(CI), .A1N(n64), .B0(n65), .Y(n70) );
  INVX3 U56 ( .A(A[2]), .Y(n76) );
  NAND2X4 U57 ( .A(B[0]), .B(A[0]), .Y(n65) );
  NAND2XL U58 ( .A(n64), .B(n65), .Y(n63) );
  XNOR2X1 U59 ( .A(n53), .B(n52), .Y(SUM[2]) );
  XNOR2X1 U60 ( .A(CI), .B(n63), .Y(SUM[0]) );
  OAI2BB1X4 U61 ( .A0N(n74), .A1N(n60), .B0(n61), .Y(n73) );
  XOR2XL U62 ( .A(n54), .B(A[3]), .Y(SUM[3]) );
  AND2XL U63 ( .A(n60), .B(n61), .Y(n53) );
  INVXL U64 ( .A(n59), .Y(n56) );
  INVXL U65 ( .A(B[2]), .Y(n75) );
  INVXL U66 ( .A(B[1]), .Y(n71) );
  OAI2BB1X4 U67 ( .A0N(n67), .A1N(n68), .B0(n69), .Y(n54) );
  NAND2X4 U68 ( .A(n57), .B(n67), .Y(n69) );
endmodule


module geofence_DW01_add_13 ( A, B, CI, SUM, CO );
  input [5:0] A;
  input [5:0] B;
  output [5:0] SUM;
  input CI;
  output CO;
  wire   n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95;

  AND2X8 U50 ( .A(n80), .B(n79), .Y(n65) );
  NOR2X6 U51 ( .A(n69), .B(n68), .Y(n87) );
  NOR2X4 U52 ( .A(n65), .B(n92), .Y(n90) );
  OR2X4 U53 ( .A(B[2]), .B(A[2]), .Y(n80) );
  INVX1 U54 ( .A(n79), .Y(n76) );
  INVX4 U55 ( .A(n82), .Y(n77) );
  INVX8 U56 ( .A(n78), .Y(n93) );
  XOR2X2 U57 ( .A(n74), .B(n75), .Y(SUM[2]) );
  NAND2X2 U58 ( .A(n85), .B(n86), .Y(n84) );
  OR2X1 U59 ( .A(B[3]), .B(A[3]), .Y(n73) );
  OA21XL U60 ( .A0(n76), .A1(n77), .B0(n78), .Y(n75) );
  XOR2X1 U61 ( .A(n83), .B(n84), .Y(SUM[0]) );
  CLKINVX1 U62 ( .A(n73), .Y(n68) );
  INVX1 U63 ( .A(A[5]), .Y(n89) );
  CLKINVX1 U64 ( .A(A[4]), .Y(n71) );
  NAND2X1 U65 ( .A(B[2]), .B(A[2]), .Y(n81) );
  NAND2X1 U66 ( .A(B[3]), .B(A[3]), .Y(n70) );
  NAND2X6 U67 ( .A(B[1]), .B(A[1]), .Y(n78) );
  NOR2X4 U68 ( .A(n92), .B(n82), .Y(n91) );
  CLKINVX3 U69 ( .A(A[1]), .Y(n95) );
  NAND2X6 U70 ( .A(n94), .B(n95), .Y(n79) );
  OR2X8 U71 ( .A(n90), .B(n91), .Y(n69) );
  NAND3X2 U72 ( .A(n70), .B(n89), .C(n71), .Y(n88) );
  OAI2BB1X4 U73 ( .A0N(n80), .A1N(n93), .B0(n81), .Y(n92) );
  NAND2XL U74 ( .A(n80), .B(n81), .Y(n74) );
  XNOR2X1 U75 ( .A(n71), .B(n66), .Y(SUM[4]) );
  OA21XL U76 ( .A0(n68), .A1(n69), .B0(n70), .Y(n66) );
  OR2X6 U77 ( .A(B[0]), .B(A[0]), .Y(n85) );
  CLKINVX1 U78 ( .A(CI), .Y(n83) );
  OAI2BB1X4 U79 ( .A0N(CI), .A1N(n85), .B0(n86), .Y(n82) );
  XNOR2X1 U80 ( .A(n67), .B(n77), .Y(SUM[1]) );
  AND2XL U81 ( .A(n79), .B(n78), .Y(n67) );
  INVXL U82 ( .A(B[1]), .Y(n94) );
  XOR2XL U83 ( .A(n69), .B(n72), .Y(SUM[3]) );
  NAND2X1 U84 ( .A(n73), .B(n70), .Y(n72) );
  NAND2X2 U85 ( .A(B[0]), .B(A[0]), .Y(n86) );
  OR2X8 U86 ( .A(n87), .B(n88), .Y(CO) );
endmodule


module geofence_DW01_add_14 ( A, B, CI, SUM, CO );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  input CI;
  output CO;
  wire   n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118;

  NAND2X8 U62 ( .A(n118), .B(n105), .Y(n82) );
  OR2X8 U63 ( .A(B[2]), .B(A[2]), .Y(n105) );
  NAND2X1 U64 ( .A(n81), .B(n94), .Y(n98) );
  NOR2X4 U65 ( .A(n117), .B(n108), .Y(n116) );
  OAI21X4 U66 ( .A0(n94), .A1(n85), .B0(n97), .Y(n91) );
  INVX3 U67 ( .A(n96), .Y(n85) );
  NAND2X8 U68 ( .A(n84), .B(n113), .Y(CO) );
  NOR2X4 U69 ( .A(n101), .B(n102), .Y(n79) );
  INVXL U70 ( .A(n103), .Y(n80) );
  NOR2X2 U71 ( .A(n79), .B(n80), .Y(n100) );
  INVX3 U72 ( .A(n104), .Y(n101) );
  CLKINVX8 U73 ( .A(n108), .Y(n102) );
  XOR2X4 U74 ( .A(n99), .B(n100), .Y(SUM[2]) );
  NAND2X2 U75 ( .A(B[4]), .B(A[4]), .Y(n97) );
  AND2X6 U76 ( .A(n96), .B(n97), .Y(n86) );
  NAND2X4 U77 ( .A(n96), .B(n81), .Y(n89) );
  OR2X6 U78 ( .A(B[4]), .B(A[4]), .Y(n96) );
  CLKINVX4 U79 ( .A(A[5]), .Y(n92) );
  XOR2X1 U80 ( .A(n107), .B(n102), .Y(SUM[1]) );
  XOR2X1 U81 ( .A(n109), .B(n110), .Y(SUM[0]) );
  BUFX4 U82 ( .A(n95), .Y(n81) );
  NAND2BX2 U83 ( .AN(A[6]), .B(n92), .Y(n114) );
  NOR2X4 U84 ( .A(n91), .B(n114), .Y(n113) );
  OR2X6 U85 ( .A(B[0]), .B(A[0]), .Y(n111) );
  OR2X1 U86 ( .A(B[3]), .B(A[3]), .Y(n95) );
  NAND2X2 U87 ( .A(B[2]), .B(A[2]), .Y(n106) );
  OR2X8 U88 ( .A(n89), .B(n88), .Y(n84) );
  OA21X1 U89 ( .A0(n93), .A1(n88), .B0(n94), .Y(n83) );
  NAND2X8 U90 ( .A(n82), .B(n106), .Y(n117) );
  INVX12 U91 ( .A(n103), .Y(n118) );
  NAND2X8 U92 ( .A(B[1]), .B(A[1]), .Y(n103) );
  XOR2X1 U93 ( .A(n88), .B(n98), .Y(SUM[3]) );
  OR2X8 U94 ( .A(B[1]), .B(A[1]), .Y(n104) );
  NAND2X1 U95 ( .A(n105), .B(n106), .Y(n99) );
  XNOR2X1 U96 ( .A(n92), .B(n87), .Y(SUM[5]) );
  INVXL U97 ( .A(n91), .Y(n90) );
  XNOR2X1 U98 ( .A(n86), .B(n83), .Y(SUM[4]) );
  NAND2XL U99 ( .A(n111), .B(n112), .Y(n110) );
  CLKINVX1 U100 ( .A(CI), .Y(n109) );
  NAND2XL U101 ( .A(n104), .B(n103), .Y(n107) );
  CLKINVX1 U102 ( .A(n81), .Y(n93) );
  OA21XL U103 ( .A0(n88), .A1(n89), .B0(n90), .Y(n87) );
  NAND2X1 U104 ( .A(B[3]), .B(A[3]), .Y(n94) );
  OAI2BB1X4 U105 ( .A0N(CI), .A1N(n111), .B0(n112), .Y(n108) );
  NAND2X2 U106 ( .A(B[0]), .B(A[0]), .Y(n112) );
  OR2X8 U107 ( .A(n115), .B(n116), .Y(n88) );
  AOI21X4 U108 ( .A0(n105), .A1(n104), .B0(n117), .Y(n115) );
endmodule


module geofence_DW01_add_15 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145;

  CLKINVX8 U73 ( .A(n121), .Y(n141) );
  OR2X4 U74 ( .A(B[5]), .B(A[5]), .Y(n102) );
  INVX8 U75 ( .A(n102), .Y(n137) );
  INVX2 U76 ( .A(A[3]), .Y(n136) );
  BUFX8 U77 ( .A(n112), .Y(n96) );
  NAND2X6 U78 ( .A(n141), .B(n123), .Y(n92) );
  AO22X1 U79 ( .A0(n109), .A1(n100), .B0(n109), .B1(n97), .Y(n106) );
  NAND2X2 U80 ( .A(n96), .B(n115), .Y(n103) );
  NOR2X6 U81 ( .A(n140), .B(n126), .Y(n139) );
  NAND2X6 U82 ( .A(n92), .B(n93), .Y(n140) );
  INVX6 U83 ( .A(A[2]), .Y(n144) );
  INVX6 U84 ( .A(n124), .Y(n142) );
  AND2X4 U85 ( .A(n123), .B(n122), .Y(n94) );
  NAND2X4 U86 ( .A(n143), .B(n144), .Y(n123) );
  INVX3 U87 ( .A(n142), .Y(n93) );
  NOR2X4 U88 ( .A(n94), .B(n140), .Y(n138) );
  OA21XL U89 ( .A0(n119), .A1(n120), .B0(n121), .Y(n118) );
  NAND2XL U90 ( .A(n122), .B(n121), .Y(n125) );
  OR2X8 U91 ( .A(B[1]), .B(A[1]), .Y(n122) );
  NAND2X8 U92 ( .A(B[1]), .B(A[1]), .Y(n121) );
  NAND2BX4 U93 ( .AN(n143), .B(A[2]), .Y(n124) );
  NAND2X6 U94 ( .A(n98), .B(n109), .Y(n132) );
  NOR2X4 U95 ( .A(n105), .B(A[6]), .Y(n98) );
  CLKINVX8 U96 ( .A(n104), .Y(n109) );
  NAND2X4 U97 ( .A(B[0]), .B(A[0]), .Y(n130) );
  OR2X6 U98 ( .A(B[0]), .B(A[0]), .Y(n129) );
  XOR2X1 U99 ( .A(n125), .B(n120), .Y(SUM[1]) );
  INVX1 U100 ( .A(n126), .Y(n120) );
  XOR2X1 U101 ( .A(n127), .B(n128), .Y(SUM[0]) );
  NAND2X1 U102 ( .A(n123), .B(n124), .Y(n117) );
  OAI2BB1X2 U103 ( .A0N(CI), .A1N(n129), .B0(n130), .Y(n126) );
  NAND2X2 U104 ( .A(n98), .B(n137), .Y(n133) );
  XOR2X1 U105 ( .A(n99), .B(A[6]), .Y(SUM[6]) );
  NAND2X2 U106 ( .A(B[3]), .B(A[3]), .Y(n114) );
  NAND2X2 U107 ( .A(n135), .B(n136), .Y(n115) );
  OR2X2 U108 ( .A(B[4]), .B(A[4]), .Y(n112) );
  AOI21X1 U109 ( .A0(n102), .A1(n104), .B0(n105), .Y(n95) );
  XOR2X1 U110 ( .A(n106), .B(n107), .Y(SUM[5]) );
  BUFX16 U111 ( .A(n103), .Y(n97) );
  OR3X6 U112 ( .A(n100), .B(n137), .C(n97), .Y(n134) );
  NAND2XL U113 ( .A(B[4]), .B(A[4]), .Y(n113) );
  INVX1 U114 ( .A(n122), .Y(n119) );
  OR2X8 U115 ( .A(n138), .B(n139), .Y(n100) );
  NAND2X1 U116 ( .A(B[5]), .B(A[5]), .Y(n108) );
  OAI2BB1X1 U117 ( .A0N(n114), .A1N(n100), .B0(n115), .Y(n110) );
  XOR2X1 U118 ( .A(n110), .B(n111), .Y(SUM[4]) );
  INVX3 U119 ( .A(n114), .Y(n145) );
  OAI2BB1X4 U120 ( .A0N(n145), .A1N(n96), .B0(n113), .Y(n104) );
  INVX3 U121 ( .A(n108), .Y(n105) );
  INVXL U122 ( .A(CI), .Y(n127) );
  NAND2XL U123 ( .A(n96), .B(n113), .Y(n111) );
  NAND2XL U124 ( .A(n115), .B(n114), .Y(n116) );
  CLKXOR2X2 U125 ( .A(n117), .B(n118), .Y(SUM[2]) );
  INVXL U126 ( .A(B[2]), .Y(n143) );
  INVXL U127 ( .A(B[3]), .Y(n135) );
  NAND2XL U128 ( .A(n102), .B(n108), .Y(n107) );
  NAND2X1 U129 ( .A(n129), .B(n130), .Y(n128) );
  NAND2BXL U130 ( .AN(n97), .B(n102), .Y(n101) );
  AO22X1 U131 ( .A0(n95), .A1(n100), .B0(n95), .B1(n101), .Y(n99) );
  XOR2XL U132 ( .A(n100), .B(n116), .Y(SUM[3]) );
  OR2X8 U133 ( .A(A[7]), .B(n131), .Y(CO) );
  OAI2BB1X4 U134 ( .A0N(n133), .A1N(n132), .B0(n134), .Y(n131) );
endmodule


module geofence_DW01_add_16 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158;

  CLKINVX6 U83 ( .A(n139), .Y(n158) );
  INVX8 U84 ( .A(n136), .Y(n157) );
  INVX6 U85 ( .A(n119), .Y(n124) );
  OR2X8 U86 ( .A(B[1]), .B(A[1]), .Y(n137) );
  OAI2BB1X4 U87 ( .A0N(CI), .A1N(n144), .B0(n145), .Y(n141) );
  AOI21X1 U88 ( .A0(n117), .A1(n119), .B0(n120), .Y(n105) );
  NAND2X8 U89 ( .A(n152), .B(n153), .Y(n117) );
  INVX1 U90 ( .A(A[3]), .Y(n155) );
  XOR2X1 U91 ( .A(n142), .B(n143), .Y(SUM[0]) );
  INVX3 U92 ( .A(n123), .Y(n120) );
  XOR2X1 U93 ( .A(n132), .B(n133), .Y(SUM[2]) );
  XOR2X1 U94 ( .A(n140), .B(n135), .Y(SUM[1]) );
  OR2X1 U95 ( .A(B[0]), .B(A[0]), .Y(n144) );
  NAND2X4 U96 ( .A(B[2]), .B(A[2]), .Y(n139) );
  CLKINVX1 U97 ( .A(n141), .Y(n135) );
  XOR2X1 U98 ( .A(n111), .B(n112), .Y(SUM[6]) );
  OR2X4 U99 ( .A(B[4]), .B(A[4]), .Y(n127) );
  NAND2X1 U100 ( .A(B[0]), .B(A[0]), .Y(n145) );
  NAND2BX2 U101 ( .AN(A[8]), .B(n110), .Y(n146) );
  CLKINVX6 U102 ( .A(A[5]), .Y(n153) );
  CLKINVX4 U103 ( .A(A[7]), .Y(n110) );
  NAND2X8 U104 ( .A(n104), .B(n148), .Y(n109) );
  OR2X8 U105 ( .A(B[6]), .B(A[6]), .Y(n113) );
  OR2X4 U106 ( .A(B[2]), .B(A[2]), .Y(n138) );
  NAND2X8 U107 ( .A(B[1]), .B(A[1]), .Y(n136) );
  INVX3 U108 ( .A(n150), .Y(n149) );
  NAND2X2 U109 ( .A(B[5]), .B(A[5]), .Y(n123) );
  OAI2BB1X2 U110 ( .A0N(n129), .A1N(n115), .B0(n130), .Y(n125) );
  NAND2X8 U111 ( .A(n106), .B(n107), .Y(n115) );
  AO22X1 U112 ( .A0(n124), .A1(n115), .B0(n124), .B1(n118), .Y(n121) );
  OR3X8 U113 ( .A(n115), .B(n118), .C(n147), .Y(n104) );
  XOR2X1 U114 ( .A(n125), .B(n126), .Y(SUM[4]) );
  AO21X4 U115 ( .A0(n138), .A1(n137), .B0(n156), .Y(n106) );
  NAND2X4 U116 ( .A(B[3]), .B(A[3]), .Y(n129) );
  NAND2X4 U117 ( .A(n127), .B(n130), .Y(n118) );
  NAND2X4 U118 ( .A(n154), .B(n155), .Y(n130) );
  NAND2X2 U119 ( .A(n113), .B(n117), .Y(n147) );
  OR2X4 U120 ( .A(n156), .B(n141), .Y(n107) );
  CLKINVX4 U121 ( .A(n109), .Y(n108) );
  OR2X8 U122 ( .A(n146), .B(n109), .Y(CO) );
  XNOR2X1 U123 ( .A(n110), .B(n108), .Y(SUM[7]) );
  NAND2XL U124 ( .A(n130), .B(n129), .Y(n131) );
  NAND2BXL U125 ( .AN(n118), .B(n117), .Y(n116) );
  AO22X4 U126 ( .A0(n149), .A1(n147), .B0(n124), .B1(n149), .Y(n148) );
  CLKINVX1 U127 ( .A(CI), .Y(n142) );
  OAI2BB1X4 U128 ( .A0N(n151), .A1N(n127), .B0(n128), .Y(n119) );
  INVXL U129 ( .A(B[5]), .Y(n152) );
  NAND2XL U130 ( .A(n127), .B(n128), .Y(n126) );
  XOR2X1 U131 ( .A(n121), .B(n122), .Y(SUM[5]) );
  NAND2XL U132 ( .A(n117), .B(n123), .Y(n122) );
  OAI2BB1X4 U133 ( .A0N(n120), .A1N(n113), .B0(n114), .Y(n150) );
  XOR2XL U134 ( .A(n115), .B(n131), .Y(SUM[3]) );
  NAND2XL U135 ( .A(n138), .B(n139), .Y(n132) );
  INVXL U136 ( .A(B[3]), .Y(n154) );
  OA21XL U137 ( .A0(n134), .A1(n135), .B0(n136), .Y(n133) );
  CLKINVX1 U138 ( .A(n137), .Y(n134) );
  NAND2XL U139 ( .A(n113), .B(n114), .Y(n112) );
  AO22X1 U140 ( .A0(n105), .A1(n115), .B0(n105), .B1(n116), .Y(n111) );
  NAND2X1 U141 ( .A(n144), .B(n145), .Y(n143) );
  NAND2X2 U142 ( .A(B[6]), .B(A[6]), .Y(n114) );
  NAND2XL U143 ( .A(n137), .B(n136), .Y(n140) );
  NAND2X2 U144 ( .A(B[4]), .B(A[4]), .Y(n128) );
  CLKINVX6 U145 ( .A(n129), .Y(n151) );
  AO21X4 U146 ( .A0(n157), .A1(n138), .B0(n158), .Y(n156) );
endmodule


module geofence_DW01_add_17 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181;

  INVX2 U91 ( .A(n132), .Y(n128) );
  NAND2X8 U92 ( .A(n118), .B(n169), .Y(n132) );
  OR3X8 U93 ( .A(n137), .B(n140), .C(n168), .Y(n118) );
  INVX8 U94 ( .A(n158), .Y(n117) );
  NAND2X2 U95 ( .A(A[6]), .B(B[6]), .Y(n136) );
  NAND2X8 U96 ( .A(B[1]), .B(A[1]), .Y(n158) );
  OR2X8 U97 ( .A(B[6]), .B(A[6]), .Y(n135) );
  NAND2X4 U98 ( .A(B[0]), .B(A[0]), .Y(n164) );
  OR2X8 U99 ( .A(B[0]), .B(A[0]), .Y(n163) );
  NAND2X2 U100 ( .A(B[4]), .B(A[4]), .Y(n150) );
  CLKINVX4 U101 ( .A(A[8]), .Y(n127) );
  INVX3 U102 ( .A(n114), .Y(n116) );
  INVX3 U103 ( .A(n171), .Y(n170) );
  XOR2X1 U104 ( .A(n155), .B(n156), .Y(SUM[2]) );
  OA21XL U105 ( .A0(n115), .A1(n157), .B0(n158), .Y(n156) );
  XOR2X1 U106 ( .A(n161), .B(n157), .Y(SUM[1]) );
  AOI21X1 U107 ( .A0(n139), .A1(n141), .B0(n142), .Y(n120) );
  NAND2BX1 U108 ( .AN(n140), .B(n139), .Y(n138) );
  XOR2X1 U109 ( .A(n143), .B(n144), .Y(SUM[5]) );
  NAND3X2 U110 ( .A(n127), .B(n167), .C(n129), .Y(n165) );
  CLKINVX1 U111 ( .A(A[9]), .Y(n167) );
  INVX3 U112 ( .A(n165), .Y(n124) );
  XOR2X1 U113 ( .A(n133), .B(n134), .Y(SUM[6]) );
  NAND2X8 U114 ( .A(B[3]), .B(A[3]), .Y(n151) );
  CLKINVX1 U115 ( .A(B[2]), .Y(n180) );
  NAND2X8 U116 ( .A(n180), .B(n181), .Y(n160) );
  INVX12 U117 ( .A(A[2]), .Y(n181) );
  NAND2BX4 U118 ( .AN(n180), .B(A[2]), .Y(n114) );
  NOR2XL U119 ( .A(B[1]), .B(A[1]), .Y(n115) );
  NAND2X1 U120 ( .A(n159), .B(n158), .Y(n161) );
  OAI2BB1X2 U121 ( .A0N(n142), .A1N(n135), .B0(n136), .Y(n171) );
  INVX4 U122 ( .A(n141), .Y(n146) );
  NAND2X6 U123 ( .A(n173), .B(n174), .Y(n139) );
  NAND2X8 U124 ( .A(n121), .B(n122), .Y(n137) );
  OAI2BB1X4 U125 ( .A0N(CI), .A1N(n163), .B0(n164), .Y(n162) );
  NAND2X4 U126 ( .A(B[5]), .B(A[5]), .Y(n145) );
  AO22X1 U127 ( .A0(n120), .A1(n137), .B0(n120), .B1(n138), .Y(n133) );
  AO22X1 U128 ( .A0(n146), .A1(n137), .B0(n146), .B1(n140), .Y(n143) );
  NAND2X4 U129 ( .A(n135), .B(n139), .Y(n168) );
  INVX3 U130 ( .A(n145), .Y(n142) );
  NAND2X4 U131 ( .A(n149), .B(n153), .Y(n140) );
  NAND2X4 U132 ( .A(n175), .B(n176), .Y(n153) );
  INVX3 U133 ( .A(A[4]), .Y(n178) );
  OR2X6 U134 ( .A(n179), .B(n162), .Y(n122) );
  OR2X2 U135 ( .A(B[1]), .B(A[1]), .Y(n159) );
  NAND2X4 U136 ( .A(n177), .B(n178), .Y(n149) );
  INVX3 U137 ( .A(A[5]), .Y(n174) );
  INVX4 U138 ( .A(n166), .Y(n119) );
  OAI2BB1X4 U139 ( .A0N(n172), .A1N(n149), .B0(n150), .Y(n141) );
  NAND2XL U140 ( .A(n139), .B(n145), .Y(n144) );
  NAND2XL U141 ( .A(n149), .B(n150), .Y(n148) );
  INVXL U142 ( .A(n153), .Y(n152) );
  AOI2BB1X4 U143 ( .A0N(n132), .A1N(n165), .B0(n119), .Y(CO) );
  OAI2BB1XL U144 ( .A0N(n128), .A1N(n129), .B0(n130), .Y(n125) );
  OR2XL U145 ( .A(B[7]), .B(A[7]), .Y(n130) );
  AND2XL U146 ( .A(n163), .B(n164), .Y(n123) );
  CLKINVX1 U147 ( .A(n127), .Y(n126) );
  XOR2X1 U148 ( .A(n147), .B(n148), .Y(SUM[4]) );
  NAND2XL U149 ( .A(n135), .B(n136), .Y(n134) );
  INVXL U150 ( .A(B[4]), .Y(n177) );
  INVXL U151 ( .A(B[5]), .Y(n173) );
  NAND2BX4 U152 ( .AN(n130), .B(n124), .Y(n166) );
  AO21X4 U153 ( .A0(n160), .A1(n159), .B0(n179), .Y(n121) );
  XOR2XL U154 ( .A(n137), .B(n154), .Y(SUM[3]) );
  NAND2X1 U155 ( .A(n153), .B(n151), .Y(n154) );
  NAND2XL U156 ( .A(n160), .B(n114), .Y(n155) );
  XOR2X1 U157 ( .A(n131), .B(n128), .Y(SUM[7]) );
  NAND2XL U158 ( .A(n130), .B(n129), .Y(n131) );
  INVXL U159 ( .A(B[3]), .Y(n175) );
  CLKINVX1 U160 ( .A(A[3]), .Y(n176) );
  CLKINVX1 U161 ( .A(n162), .Y(n157) );
  XOR2X1 U162 ( .A(CI), .B(n123), .Y(SUM[0]) );
  NAND2X1 U163 ( .A(B[7]), .B(A[7]), .Y(n129) );
  INVX3 U164 ( .A(n151), .Y(n172) );
  AO21XL U165 ( .A0(n151), .A1(n137), .B0(n152), .Y(n147) );
  XOR2X4 U166 ( .A(n125), .B(n126), .Y(SUM[8]) );
  AO22X4 U167 ( .A0(n170), .A1(n146), .B0(n170), .B1(n168), .Y(n169) );
  AO21X4 U168 ( .A0(n117), .A1(n160), .B0(n116), .Y(n179) );
endmodule


module geofence_DW01_add_18 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207;

  OR2X4 U109 ( .A(B[6]), .B(A[6]), .Y(n159) );
  NAND2X4 U110 ( .A(B[1]), .B(A[1]), .Y(n182) );
  AO22X1 U111 ( .A0(n136), .A1(n161), .B0(n136), .B1(n162), .Y(n157) );
  XOR2XL U112 ( .A(n161), .B(n177), .Y(SUM[3]) );
  INVX6 U113 ( .A(n165), .Y(n170) );
  OAI2BB1X4 U114 ( .A0N(n199), .A1N(n173), .B0(n174), .Y(n165) );
  OR2X8 U115 ( .A(B[3]), .B(A[3]), .Y(n176) );
  CLKINVX6 U116 ( .A(n187), .Y(n181) );
  OAI2BB1X4 U117 ( .A0N(CI), .A1N(n190), .B0(n191), .Y(n187) );
  OAI2BB1X1 U118 ( .A0N(n175), .A1N(n161), .B0(n176), .Y(n171) );
  BUFX6 U119 ( .A(n182), .Y(n134) );
  NAND2X2 U120 ( .A(B[4]), .B(A[4]), .Y(n174) );
  INVX3 U121 ( .A(n138), .Y(n166) );
  XOR2X1 U122 ( .A(n178), .B(n179), .Y(SUM[2]) );
  OR2X1 U123 ( .A(B[0]), .B(A[0]), .Y(n190) );
  NAND2X1 U124 ( .A(B[0]), .B(A[0]), .Y(n191) );
  INVX4 U125 ( .A(n134), .Y(n205) );
  OR2X2 U126 ( .A(B[1]), .B(A[1]), .Y(n183) );
  NAND2X1 U127 ( .A(B[6]), .B(A[6]), .Y(n160) );
  AO21X2 U128 ( .A0(n146), .A1(n152), .B0(n153), .Y(n148) );
  BUFX4 U129 ( .A(n169), .Y(n138) );
  NAND2X2 U130 ( .A(n200), .B(n201), .Y(n163) );
  CLKINVX1 U131 ( .A(A[5]), .Y(n201) );
  NAND2X1 U132 ( .A(n173), .B(n176), .Y(n164) );
  INVX3 U133 ( .A(n198), .Y(n197) );
  OAI2BB1X2 U134 ( .A0N(n166), .A1N(n159), .B0(n160), .Y(n198) );
  NAND2BX1 U135 ( .AN(n194), .B(n140), .Y(n193) );
  OA21X4 U136 ( .A0(n152), .A1(n144), .B0(n151), .Y(n135) );
  CLKINVX1 U137 ( .A(n140), .Y(n192) );
  AOI21X1 U138 ( .A0(n163), .A1(n165), .B0(n166), .Y(n136) );
  NAND2X6 U139 ( .A(n202), .B(n203), .Y(n173) );
  INVX4 U140 ( .A(A[4]), .Y(n203) );
  INVX4 U141 ( .A(n135), .Y(n141) );
  NAND2X2 U142 ( .A(B[2]), .B(A[2]), .Y(n185) );
  NAND2BX1 U143 ( .AN(A[10]), .B(n145), .Y(n207) );
  NOR2X4 U144 ( .A(n207), .B(n141), .Y(n140) );
  OR2X8 U145 ( .A(B[8]), .B(A[8]), .Y(n150) );
  NAND2X8 U146 ( .A(n137), .B(n196), .Y(n156) );
  OR3X8 U147 ( .A(n161), .B(n164), .C(n195), .Y(n137) );
  INVX3 U148 ( .A(n150), .Y(n144) );
  NAND2XL U149 ( .A(n159), .B(n160), .Y(n158) );
  NAND2X6 U150 ( .A(B[3]), .B(A[3]), .Y(n175) );
  NAND2X4 U151 ( .A(n159), .B(n163), .Y(n195) );
  NAND2X2 U152 ( .A(B[5]), .B(A[5]), .Y(n169) );
  INVX3 U153 ( .A(A[9]), .Y(n145) );
  NAND2X2 U154 ( .A(B[8]), .B(A[8]), .Y(n151) );
  INVX3 U155 ( .A(n185), .Y(n206) );
  NAND2X2 U156 ( .A(B[7]), .B(A[7]), .Y(n152) );
  INVX8 U157 ( .A(n156), .Y(n146) );
  OR2X6 U158 ( .A(B[2]), .B(A[2]), .Y(n184) );
  XOR2X4 U159 ( .A(n155), .B(n146), .Y(SUM[7]) );
  OR2X4 U160 ( .A(n204), .B(n187), .Y(n143) );
  NAND2XL U161 ( .A(n154), .B(n152), .Y(n155) );
  INVXL U162 ( .A(n154), .Y(n153) );
  XNOR2X1 U163 ( .A(n139), .B(n145), .Y(SUM[9]) );
  AO22XL U164 ( .A0(n146), .A1(n135), .B0(n135), .B1(n147), .Y(n139) );
  NAND2BXL U165 ( .AN(n164), .B(n163), .Y(n162) );
  NAND2XL U166 ( .A(n190), .B(n191), .Y(n189) );
  NAND2X8 U167 ( .A(n142), .B(n143), .Y(n161) );
  XOR2XL U168 ( .A(n186), .B(n181), .Y(SUM[1]) );
  CLKINVX1 U169 ( .A(n175), .Y(n199) );
  NAND2X1 U170 ( .A(n173), .B(n174), .Y(n172) );
  NAND2X1 U171 ( .A(n176), .B(n175), .Y(n177) );
  INVXL U172 ( .A(B[4]), .Y(n202) );
  INVXL U173 ( .A(B[5]), .Y(n200) );
  NAND2XL U174 ( .A(n163), .B(n138), .Y(n168) );
  OR2X1 U175 ( .A(B[7]), .B(A[7]), .Y(n154) );
  OA21XL U176 ( .A0(n180), .A1(n181), .B0(n134), .Y(n179) );
  CLKINVX1 U177 ( .A(n183), .Y(n180) );
  AO21X4 U178 ( .A0(n184), .A1(n183), .B0(n204), .Y(n142) );
  XOR2X1 U179 ( .A(n148), .B(n149), .Y(SUM[8]) );
  NAND2X1 U180 ( .A(n150), .B(n151), .Y(n149) );
  NAND2XL U181 ( .A(n184), .B(n185), .Y(n178) );
  XOR2X2 U182 ( .A(n188), .B(n189), .Y(SUM[0]) );
  NAND2XL U183 ( .A(n183), .B(n134), .Y(n186) );
  CLKINVX1 U184 ( .A(CI), .Y(n188) );
  AO22X1 U185 ( .A0(n170), .A1(n161), .B0(n170), .B1(n164), .Y(n167) );
  XOR2X4 U186 ( .A(n157), .B(n158), .Y(SUM[6]) );
  XOR2X4 U187 ( .A(n167), .B(n168), .Y(SUM[5]) );
  XOR2X4 U188 ( .A(n171), .B(n172), .Y(SUM[4]) );
  OA21X4 U189 ( .A0(n192), .A1(n156), .B0(n193), .Y(CO) );
  CLKINVX6 U190 ( .A(n147), .Y(n194) );
  NAND2X4 U191 ( .A(n150), .B(n154), .Y(n147) );
  AO22X4 U192 ( .A0(n170), .A1(n197), .B0(n197), .B1(n195), .Y(n196) );
  AO21X4 U193 ( .A0(n205), .A1(n184), .B0(n206), .Y(n204) );
endmodule


module geofence_DW01_add_19 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191;

  INVX4 U117 ( .A(A[1]), .Y(n179) );
  NAND2X4 U118 ( .A(n159), .B(n160), .Y(n158) );
  NAND3BX4 U119 ( .AN(n145), .B(n161), .C(n159), .Y(n157) );
  AND3X6 U120 ( .A(n175), .B(n176), .C(n167), .Y(n168) );
  NAND2X4 U121 ( .A(B[0]), .B(n174), .Y(n172) );
  INVX8 U122 ( .A(n151), .Y(n178) );
  AOI32X4 U123 ( .A0(n190), .A1(B[7]), .A2(A[7]), .B0(B[8]), .B1(A[8]), .Y(
        n187) );
  OR2X6 U124 ( .A(B[8]), .B(A[8]), .Y(n190) );
  CLKAND2X12 U125 ( .A(n182), .B(n181), .Y(n148) );
  INVX8 U126 ( .A(n185), .Y(n156) );
  INVX6 U127 ( .A(A[2]), .Y(n181) );
  BUFX3 U128 ( .A(A[3]), .Y(n144) );
  OAI32X2 U129 ( .A0(n147), .A1(n163), .A2(n164), .B0(n165), .B1(n166), .Y(
        n162) );
  INVX3 U130 ( .A(A[5]), .Y(n164) );
  OR2X4 U131 ( .A(CI), .B(A[0]), .Y(n174) );
  NAND2X6 U132 ( .A(n146), .B(n178), .Y(n175) );
  CLKAND2X3 U133 ( .A(n188), .B(n189), .Y(n150) );
  CLKINVX1 U134 ( .A(n160), .Y(n170) );
  NAND3X4 U135 ( .A(n171), .B(n172), .C(n178), .Y(n169) );
  NAND2X2 U136 ( .A(n157), .B(n158), .Y(n155) );
  INVX3 U137 ( .A(n162), .Y(n159) );
  NAND2XL U138 ( .A(CI), .B(A[0]), .Y(n171) );
  CLKAND2X12 U139 ( .A(n152), .B(n153), .Y(CO) );
  BUFX6 U140 ( .A(n173), .Y(n151) );
  AND3X2 U141 ( .A(B[3]), .B(n167), .C(n144), .Y(n145) );
  OR2X4 U142 ( .A(n177), .B(n148), .Y(n146) );
  NOR2X1 U143 ( .A(A[1]), .B(B[1]), .Y(n177) );
  NAND3X8 U144 ( .A(n168), .B(n169), .C(n170), .Y(n154) );
  NAND3X6 U145 ( .A(n154), .B(n155), .C(n156), .Y(n153) );
  AO21X4 U146 ( .A0(n163), .A1(n164), .B0(n147), .Y(n160) );
  CLKAND2X12 U147 ( .A(n166), .B(n165), .Y(n147) );
  OR2X1 U148 ( .A(B[3]), .B(n144), .Y(n176) );
  OR2X6 U149 ( .A(B[4]), .B(A[4]), .Y(n167) );
  INVX3 U150 ( .A(A[9]), .Y(n189) );
  INVX4 U151 ( .A(B[1]), .Y(n180) );
  CLKINVX2 U152 ( .A(n150), .Y(n191) );
  INVX3 U153 ( .A(A[6]), .Y(n165) );
  INVXL U154 ( .A(B[5]), .Y(n163) );
  INVXL U155 ( .A(B[6]), .Y(n166) );
  AO22X4 U156 ( .A0(n187), .A1(n149), .B0(n149), .B1(n150), .Y(n186) );
  CLKINVX1 U157 ( .A(B[2]), .Y(n182) );
  OAI21XL U158 ( .A0(A[7]), .A1(B[7]), .B0(n191), .Y(n184) );
  NAND2XL U159 ( .A(B[4]), .B(A[4]), .Y(n161) );
  INVXL U160 ( .A(n190), .Y(n183) );
  AOI2BB1X4 U161 ( .A0N(n188), .A1N(n189), .B0(A[10]), .Y(n149) );
  INVXL U162 ( .A(B[9]), .Y(n188) );
  OAI32X2 U163 ( .A0(n179), .A1(n148), .A2(n180), .B0(n181), .B1(n182), .Y(
        n173) );
  OAI21X4 U164 ( .A0(n183), .A1(n184), .B0(n156), .Y(n152) );
  NAND2BX4 U165 ( .AN(A[11]), .B(n186), .Y(n185) );
endmodule


module geofence_DW_sqrt_4 ( a, root );
  input [22:0] a;
  output [11:0] root;
  wire   n192, n193, n194, n195, n196, n197, n198, n199, \PartRem[9][3] ,
         \PartRem[8][6] , \PartRem[8][5] , \PartRem[8][3] , \PartRem[7][7] ,
         \PartRem[7][6] , \PartRem[7][5] , \PartRem[7][4] , \PartRem[6][8] ,
         \PartRem[6][7] , \PartRem[6][5] , \PartRem[6][4] , \PartRem[6][3] ,
         \PartRem[5][9] , \PartRem[5][8] , \PartRem[5][6] , \PartRem[5][5] ,
         \PartRem[5][3] , \PartRem[4][10] , \PartRem[4][9] , \PartRem[4][6] ,
         \PartRem[4][3] , \PartRem[3][11] , \PartRem[3][10] , \PartRem[3][3] ,
         \PartRem[2][12] , \PartRem[2][11] , \PartRem[2][9] , \PartRem[2][8] ,
         \PartRem[2][7] , \PartRem[2][6] , \PartRem[2][5] , \PartRem[2][4] ,
         \PartRem[2][3] , \PartRem[2][2] , \PartRem[1][13] , \PartRem[1][12] ,
         \PartRem[1][11] , \PartRem[1][10] , \PartRem[1][9] , \PartRem[1][8] ,
         \PartRem[1][7] , \PartRem[1][6] , \PartRem[1][5] , \PartRem[1][4] ,
         \PartRem[1][3] , \PartRem[1][2] , \PartRoot[7][2] , \PartRoot[5][2] ,
         \PartRoot[4][2] , \PartRoot[3][2] , \PartRoot[2][2] ,
         \PartRoot[1][2] , \SumTmp[9][2] , \SumTmp[8][3] , \SumTmp[8][2] ,
         \SumTmp[7][5] , \SumTmp[7][4] , \SumTmp[7][3] , \SumTmp[7][2] ,
         \SumTmp[6][6] , \SumTmp[6][5] , \SumTmp[6][4] , \SumTmp[6][3] ,
         \SumTmp[6][2] , \SumTmp[5][7] , \SumTmp[5][6] , \SumTmp[5][5] ,
         \SumTmp[5][4] , \SumTmp[5][3] , \SumTmp[5][2] , \SumTmp[4][8] ,
         \SumTmp[4][7] , \SumTmp[4][6] , \SumTmp[4][5] , \SumTmp[4][4] ,
         \SumTmp[4][3] , \SumTmp[4][2] , \SumTmp[3][9] , \SumTmp[3][8] ,
         \SumTmp[3][7] , \SumTmp[3][6] , \SumTmp[3][5] , \SumTmp[3][4] ,
         \SumTmp[3][3] , \SumTmp[3][2] , \SumTmp[2][10] , \SumTmp[2][9] ,
         \SumTmp[2][8] , \SumTmp[2][7] , \SumTmp[2][6] , \SumTmp[2][5] ,
         \SumTmp[2][4] , \SumTmp[2][3] , \SumTmp[2][2] , \SumTmp[1][11] ,
         \SumTmp[1][10] , \SumTmp[1][9] , \SumTmp[1][8] , \SumTmp[1][7] ,
         \SumTmp[1][6] , \SumTmp[1][5] , \SumTmp[1][4] , \SumTmp[1][3] ,
         \SumTmp[1][2] , \CryTmp[10][2] , \CryTmp[9][2] , \CryTmp[8][2] ,
         \CryTmp[7][2] , \CryTmp[6][2] , \CryTmp[5][2] , \CryTmp[4][2] ,
         \CryTmp[3][2] , \CryTmp[2][2] , \CryTmp[1][2] , \CryTmp[0][2] , n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n85, n86, n88, n89, n90, n91, n94, n96, n98, n100, n101, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6;
  assign \CryTmp[10][2]  = a[20];

  geofence_DW01_add_12 u_add_PartRem_7 ( .A({\PartRem[8][6] , \PartRem[8][5] , 
        n67, \PartRem[8][3] , n71}), .B({1'b1, 1'b1, n104, n105, n53}), .CI(
        \CryTmp[7][2] ), .SUM({SYNOPSYS_UNCONNECTED__0, \SumTmp[7][5] , 
        \SumTmp[7][4] , \SumTmp[7][3] , \SumTmp[7][2] }), .CO(n193) );
  geofence_DW01_add_13 u_add_PartRem_6 ( .A({\PartRem[7][7] , \PartRem[7][6] , 
        \PartRem[7][5] , \PartRem[7][4] , n73, n75}), .B({1'b1, 1'b1, n104, 
        n105, n53, n89}), .CI(\CryTmp[6][2] ), .SUM({SYNOPSYS_UNCONNECTED__1, 
        \SumTmp[6][6] , \SumTmp[6][5] , \SumTmp[6][4] , \SumTmp[6][3] , 
        \SumTmp[6][2] }), .CO(n194) );
  geofence_DW01_add_14 u_add_PartRem_5 ( .A({\PartRem[6][8] , \PartRem[6][7] , 
        n62, \PartRem[6][5] , \PartRem[6][4] , \PartRem[6][3] , n72}), .B({
        1'b1, 1'b1, n104, n105, n53, n90, n85}), .CI(\CryTmp[5][2] ), .SUM({
        SYNOPSYS_UNCONNECTED__2, \SumTmp[5][7] , \SumTmp[5][6] , 
        \SumTmp[5][5] , \SumTmp[5][4] , \SumTmp[5][3] , \SumTmp[5][2] }), .CO(
        n195) );
  geofence_DW01_add_15 u_add_PartRem_4 ( .A({\PartRem[5][9] , \PartRem[5][8] , 
        n35, \PartRem[5][6] , \PartRem[5][5] , n64, \PartRem[5][3] , n78}), 
        .B({1'b1, 1'b1, n104, n105, n53, n89, n86, \PartRoot[5][2] }), .CI(
        \CryTmp[4][2] ), .SUM({SYNOPSYS_UNCONNECTED__3, \SumTmp[4][8] , 
        \SumTmp[4][7] , \SumTmp[4][6] , \SumTmp[4][5] , \SumTmp[4][4] , 
        \SumTmp[4][3] , \SumTmp[4][2] }), .CO(n196) );
  geofence_DW01_add_16 u_add_PartRem_3 ( .A({\PartRem[4][10] , \PartRem[4][9] , 
        n36, n61, \PartRem[4][6] , n65, n63, \PartRem[4][3] , n74}), .B({1'b1, 
        1'b1, n104, n105, n53, n89, n85, \PartRoot[5][2] , \PartRoot[4][2] }), 
        .CI(\CryTmp[3][2] ), .SUM({SYNOPSYS_UNCONNECTED__4, \SumTmp[3][9] , 
        \SumTmp[3][8] , \SumTmp[3][7] , \SumTmp[3][6] , \SumTmp[3][5] , 
        \SumTmp[3][4] , \SumTmp[3][3] , \SumTmp[3][2] }), .CO(n197) );
  geofence_DW01_add_17 u_add_PartRem_2 ( .A({\PartRem[3][11] , 
        \PartRem[3][10] , n54, n51, n56, n55, n66, n69, \PartRem[3][3] , n79}), 
        .B({1'b1, 1'b1, n104, n105, n53, n90, n85, \PartRoot[5][2] , 
        \PartRoot[4][2] , \PartRoot[3][2] }), .CI(\CryTmp[2][2] ), .SUM({
        SYNOPSYS_UNCONNECTED__5, \SumTmp[2][10] , \SumTmp[2][9] , 
        \SumTmp[2][8] , \SumTmp[2][7] , \SumTmp[2][6] , \SumTmp[2][5] , 
        \SumTmp[2][4] , \SumTmp[2][3] , \SumTmp[2][2] }), .CO(n198) );
  geofence_DW01_add_18 u_add_PartRem_1 ( .A({\PartRem[2][12] , 
        \PartRem[2][11] , n45, \PartRem[2][9] , \PartRem[2][8] , 
        \PartRem[2][7] , \PartRem[2][6] , \PartRem[2][5] , \PartRem[2][4] , 
        \PartRem[2][3] , \PartRem[2][2] }), .B({1'b1, 1'b1, n104, n105, n53, 
        n89, n86, \PartRoot[5][2] , \PartRoot[4][2] , \PartRoot[3][2] , 
        \PartRoot[2][2] }), .CI(\CryTmp[1][2] ), .SUM({SYNOPSYS_UNCONNECTED__6, 
        \SumTmp[1][11] , \SumTmp[1][10] , \SumTmp[1][9] , \SumTmp[1][8] , 
        \SumTmp[1][7] , \SumTmp[1][6] , \SumTmp[1][5] , \SumTmp[1][4] , 
        \SumTmp[1][3] , \SumTmp[1][2] }), .CO(n199) );
  geofence_DW01_add_19 u_add_PartRem_0 ( .A({\PartRem[1][13] , 
        \PartRem[1][12] , \PartRem[1][11] , \PartRem[1][10] , \PartRem[1][9] , 
        \PartRem[1][8] , \PartRem[1][7] , \PartRem[1][6] , \PartRem[1][5] , 
        \PartRem[1][4] , \PartRem[1][3] , \PartRem[1][2] }), .B({1'b1, 1'b1, 
        n104, n105, n53, n89, n86, \PartRoot[5][2] , \PartRoot[4][2] , 
        \PartRoot[3][2] , \PartRoot[2][2] , \PartRoot[1][2] }), .CI(
        \CryTmp[0][2] ), .CO(root[0]) );
  MX2X4 U3 ( .A(n78), .B(\SumTmp[4][2] ), .S0(n196), .Y(n63) );
  INVX1 U4 ( .A(root[6]), .Y(n86) );
  NAND3X4 U5 ( .A(\CryTmp[6][2] ), .B(n183), .C(root[6]), .Y(n133) );
  INVX4 U6 ( .A(root[6]), .Y(n85) );
  NOR2X6 U7 ( .A(\PartRoot[7][2] ), .B(\CryTmp[7][2] ), .Y(n147) );
  MX2X8 U8 ( .A(\PartRem[5][5] ), .B(\SumTmp[4][5] ), .S0(root[4]), .Y(n61) );
  INVX8 U9 ( .A(n126), .Y(\PartRem[9][3] ) );
  NAND2X6 U10 ( .A(n49), .B(n50), .Y(n51) );
  NAND2X4 U11 ( .A(\PartRem[4][6] ), .B(\PartRoot[3][2] ), .Y(n49) );
  NAND2X2 U12 ( .A(\SumTmp[3][6] ), .B(root[3]), .Y(n50) );
  NOR2X8 U13 ( .A(\PartRoot[1][2] ), .B(\CryTmp[1][2] ), .Y(n38) );
  NAND2X6 U14 ( .A(n48), .B(n182), .Y(n134) );
  NOR2X8 U15 ( .A(\PartRoot[4][2] ), .B(\CryTmp[4][2] ), .Y(n166) );
  INVX8 U16 ( .A(a[18]), .Y(n129) );
  INVX8 U17 ( .A(n115), .Y(n107) );
  INVX3 U18 ( .A(n121), .Y(\PartRem[8][5] ) );
  INVX3 U19 ( .A(\SumTmp[7][5] ), .Y(n125) );
  CLKINVX4 U20 ( .A(n108), .Y(n28) );
  CLKINVX3 U21 ( .A(n109), .Y(n108) );
  BUFX12 U22 ( .A(n110), .Y(n52) );
  INVX12 U23 ( .A(root[1]), .Y(\PartRoot[1][2] ) );
  MXI2X2 U24 ( .A(n163), .B(n184), .S0(root[1]), .Y(\PartRem[1][12] ) );
  INVX8 U25 ( .A(n157), .Y(\PartRem[2][3] ) );
  INVX16 U26 ( .A(n101), .Y(n103) );
  MXI2X4 U27 ( .A(n79), .B(\SumTmp[2][2] ), .S0(root[2]), .Y(n156) );
  INVX20 U28 ( .A(n100), .Y(\PartRoot[5][2] ) );
  INVX12 U29 ( .A(root[7]), .Y(\PartRoot[7][2] ) );
  INVX20 U30 ( .A(n96), .Y(root[4]) );
  INVX8 U31 ( .A(n196), .Y(n96) );
  NAND3X8 U32 ( .A(\CryTmp[5][2] ), .B(n190), .C(root[5]), .Y(n189) );
  INVX6 U33 ( .A(n98), .Y(root[5]) );
  INVX4 U34 ( .A(n158), .Y(\PartRem[2][2] ) );
  CLKMX2X6 U35 ( .A(n72), .B(\SumTmp[5][2] ), .S0(n100), .Y(n64) );
  NOR2X6 U36 ( .A(n105), .B(\CryTmp[9][2] ), .Y(n127) );
  NAND3X8 U37 ( .A(\CryTmp[4][2] ), .B(n168), .C(root[4]), .Y(n167) );
  CLKINVX16 U38 ( .A(n32), .Y(n33) );
  INVX20 U39 ( .A(n101), .Y(root[6]) );
  INVX6 U40 ( .A(n161), .Y(\PartRem[6][4] ) );
  INVX12 U41 ( .A(\CryTmp[10][2] ), .Y(n119) );
  NAND2X8 U42 ( .A(n24), .B(n25), .Y(n26) );
  NAND2X8 U43 ( .A(n26), .B(n189), .Y(n187) );
  INVX12 U44 ( .A(a[11]), .Y(n24) );
  INVX8 U45 ( .A(n188), .Y(n25) );
  NOR2X8 U46 ( .A(\PartRoot[5][2] ), .B(\CryTmp[5][2] ), .Y(n188) );
  INVX12 U47 ( .A(n187), .Y(\PartRem[5][3] ) );
  NAND2X6 U48 ( .A(\CryTmp[8][2] ), .B(n52), .Y(n27) );
  CLKAND2X12 U49 ( .A(n27), .B(n28), .Y(n68) );
  OR2X8 U50 ( .A(a[16]), .B(a[17]), .Y(\CryTmp[8][2] ) );
  NAND2X6 U51 ( .A(n80), .B(n29), .Y(n30) );
  NAND2X4 U52 ( .A(\SumTmp[8][2] ), .B(root[8]), .Y(n31) );
  NAND2X8 U53 ( .A(n30), .B(n31), .Y(n67) );
  INVX4 U54 ( .A(root[8]), .Y(n29) );
  CLKXOR2X4 U55 ( .A(n112), .B(n111), .Y(\SumTmp[8][2] ) );
  INVX16 U56 ( .A(n59), .Y(root[8]) );
  CLKINVX20 U57 ( .A(root[2]), .Y(\PartRoot[2][2] ) );
  CLKINVX2 U58 ( .A(n143), .Y(n172) );
  CLKAND2X12 U59 ( .A(n142), .B(n143), .Y(\PartRem[3][3] ) );
  OAI21X4 U60 ( .A0(\PartRoot[3][2] ), .A1(\CryTmp[3][2] ), .B0(n173), .Y(n143) );
  BUFX16 U61 ( .A(n198), .Y(n94) );
  NOR2X8 U62 ( .A(n107), .B(n106), .Y(n42) );
  CLKMX2X8 U63 ( .A(n65), .B(\SumTmp[3][5] ), .S0(root[3]), .Y(n56) );
  CLKMX2X3 U64 ( .A(\PartRem[5][3] ), .B(\SumTmp[4][3] ), .S0(n196), .Y(n65)
         );
  MXI2X1 U65 ( .A(n120), .B(n57), .S0(root[8]), .Y(\PartRem[8][6] ) );
  CLKINVX8 U66 ( .A(n120), .Y(n106) );
  NAND2X4 U67 ( .A(n39), .B(\SumTmp[9][2] ), .Y(n120) );
  CLKINVX20 U68 ( .A(n98), .Y(n100) );
  INVX20 U69 ( .A(n195), .Y(n98) );
  MXI2X4 U70 ( .A(n151), .B(n186), .S0(root[1]), .Y(\PartRem[1][11] ) );
  MXI2X2 U71 ( .A(n153), .B(n164), .S0(root[1]), .Y(\PartRem[1][9] ) );
  INVX20 U72 ( .A(n94), .Y(n32) );
  CLKINVX20 U73 ( .A(n32), .Y(root[2]) );
  CLKMX2X4 U74 ( .A(n81), .B(\SumTmp[7][3] ), .S0(root[7]), .Y(\PartRem[7][5] ) );
  CLKXOR2X4 U75 ( .A(root[8]), .B(a[16]), .Y(n71) );
  CLKMX2X3 U76 ( .A(\PartRem[7][4] ), .B(\SumTmp[6][4] ), .S0(n103), .Y(n62)
         );
  MXI2X4 U77 ( .A(n69), .B(\SumTmp[2][4] ), .S0(root[2]), .Y(n154) );
  MXI2X4 U78 ( .A(n156), .B(n174), .S0(root[1]), .Y(\PartRem[1][6] ) );
  XOR2X4 U79 ( .A(n100), .B(a[10]), .Y(n78) );
  XOR2X4 U80 ( .A(root[3]), .B(a[6]), .Y(n79) );
  CLKINVX3 U81 ( .A(a[17]), .Y(n123) );
  CLKINVX6 U82 ( .A(n155), .Y(\PartRem[2][5] ) );
  CLKINVX12 U83 ( .A(root[3]), .Y(\PartRoot[3][2] ) );
  INVX3 U84 ( .A(n119), .Y(n117) );
  NAND3X1 U85 ( .A(n144), .B(root[3]), .C(\CryTmp[3][2] ), .Y(n142) );
  INVX3 U86 ( .A(n138), .Y(\PartRem[5][8] ) );
  AND2X2 U87 ( .A(n133), .B(n134), .Y(n70) );
  INVX4 U88 ( .A(n151), .Y(\PartRem[2][9] ) );
  BUFX20 U89 ( .A(n119), .Y(n104) );
  INVX3 U90 ( .A(n152), .Y(\PartRem[2][8] ) );
  INVX1 U91 ( .A(\SumTmp[1][3] ), .Y(n175) );
  INVX3 U92 ( .A(\SumTmp[1][5] ), .Y(n170) );
  CLKINVX1 U93 ( .A(a[13]), .Y(n182) );
  OR2X1 U94 ( .A(a[8]), .B(a[9]), .Y(\CryTmp[4][2] ) );
  OR2X1 U95 ( .A(a[4]), .B(a[5]), .Y(\CryTmp[2][2] ) );
  OR2X1 U96 ( .A(a[6]), .B(a[7]), .Y(\CryTmp[3][2] ) );
  CLKINVX1 U97 ( .A(\SumTmp[6][6] ), .Y(n131) );
  CLKINVX1 U98 ( .A(n130), .Y(\PartRem[7][6] ) );
  CLKINVX1 U99 ( .A(\SumTmp[4][8] ), .Y(n140) );
  OR2X1 U100 ( .A(a[2]), .B(a[3]), .Y(\CryTmp[1][2] ) );
  MXI2X4 U101 ( .A(n171), .B(\SumTmp[2][3] ), .S0(n33), .Y(n155) );
  MXI2X2 U102 ( .A(n56), .B(\SumTmp[2][7] ), .S0(root[2]), .Y(n151) );
  XOR2X1 U103 ( .A(n118), .B(n117), .Y(\SumTmp[9][2] ) );
  CLKINVX1 U104 ( .A(n91), .Y(n39) );
  CLKINVX1 U105 ( .A(\CryTmp[9][2] ), .Y(n118) );
  CLKINVX1 U106 ( .A(n40), .Y(n41) );
  CLKINVX1 U107 ( .A(\SumTmp[3][9] ), .Y(n145) );
  MXI2X2 U108 ( .A(n55), .B(\SumTmp[2][6] ), .S0(root[2]), .Y(n152) );
  OR2X1 U109 ( .A(a[1]), .B(a[0]), .Y(\CryTmp[0][2] ) );
  NAND2X2 U110 ( .A(n43), .B(n44), .Y(n45) );
  NAND2X1 U111 ( .A(\SumTmp[2][8] ), .B(root[2]), .Y(n44) );
  NAND2X1 U112 ( .A(n51), .B(\PartRoot[2][2] ), .Y(n43) );
  CLKINVX1 U113 ( .A(\SumTmp[1][11] ), .Y(n181) );
  MXI2X1 U114 ( .A(n54), .B(\SumTmp[2][9] ), .S0(root[2]), .Y(n162) );
  NAND3X2 U115 ( .A(\CryTmp[7][2] ), .B(n149), .C(root[7]), .Y(n148) );
  INVXL U116 ( .A(n45), .Y(n163) );
  INVX16 U117 ( .A(root[8]), .Y(n53) );
  INVX8 U118 ( .A(\PartRoot[7][2] ), .Y(n88) );
  INVX6 U119 ( .A(n88), .Y(n89) );
  INVX16 U120 ( .A(n194), .Y(n101) );
  CLKMX2X12 U121 ( .A(\PartRem[6][5] ), .B(\SumTmp[5][5] ), .S0(n100), .Y(n35)
         );
  CLKMX2X12 U122 ( .A(\PartRem[5][6] ), .B(\SumTmp[4][6] ), .S0(root[4]), .Y(
        n36) );
  CLKBUFX3 U123 ( .A(n117), .Y(root[10]) );
  AND3X2 U124 ( .A(\CryTmp[3][2] ), .B(n144), .C(root[3]), .Y(n37) );
  CLKINVX1 U125 ( .A(a[12]), .Y(n183) );
  CLKMX2X8 U126 ( .A(n70), .B(\SumTmp[5][3] ), .S0(n100), .Y(\PartRem[5][5] )
         );
  NAND2BX4 U127 ( .AN(\CryTmp[6][2] ), .B(root[6]), .Y(n48) );
  BUFX20 U128 ( .A(n197), .Y(root[3]) );
  MXI2X1 U129 ( .A(n162), .B(n181), .S0(root[1]), .Y(\PartRem[1][13] ) );
  INVX12 U130 ( .A(n196), .Y(\PartRoot[4][2] ) );
  INVX8 U131 ( .A(n160), .Y(\PartRem[5][6] ) );
  MXI2X1 U132 ( .A(n35), .B(\SumTmp[4][7] ), .S0(root[4]), .Y(n139) );
  INVX8 U133 ( .A(n141), .Y(\PartRem[7][4] ) );
  BUFX20 U134 ( .A(n199), .Y(root[1]) );
  INVX8 U135 ( .A(n76), .Y(\PartRem[8][3] ) );
  INVX6 U136 ( .A(n192), .Y(n91) );
  MXI2X1 U137 ( .A(n150), .B(n159), .S0(root[2]), .Y(\PartRem[2][12] ) );
  NOR2X8 U138 ( .A(\PartRoot[2][2] ), .B(\CryTmp[2][2] ), .Y(n176) );
  NAND3X4 U139 ( .A(\CryTmp[2][2] ), .B(n178), .C(root[2]), .Y(n177) );
  XOR2X4 U140 ( .A(n196), .B(a[8]), .Y(n74) );
  OR2X8 U141 ( .A(n104), .B(\PartRem[9][3] ), .Y(n114) );
  INVX4 U142 ( .A(n82), .Y(n192) );
  CLKINVX1 U143 ( .A(n91), .Y(root[9]) );
  XOR2X4 U144 ( .A(n82), .B(n129), .Y(n80) );
  INVXL U145 ( .A(a[19]), .Y(n40) );
  NAND2BX4 U146 ( .AN(n114), .B(n42), .Y(n60) );
  NAND2X2 U147 ( .A(n105), .B(n80), .Y(n109) );
  MXI2X4 U148 ( .A(n154), .B(n169), .S0(root[1]), .Y(\PartRem[1][8] ) );
  INVX6 U149 ( .A(\SumTmp[1][6] ), .Y(n169) );
  INVX8 U150 ( .A(n165), .Y(\PartRem[4][3] ) );
  NAND2X6 U151 ( .A(n103), .B(n183), .Y(n46) );
  CLKMX2X4 U152 ( .A(n61), .B(\SumTmp[3][7] ), .S0(root[3]), .Y(n54) );
  XOR2X2 U153 ( .A(n113), .B(n68), .Y(\SumTmp[8][3] ) );
  CLKINVX8 U154 ( .A(n153), .Y(\PartRem[2][7] ) );
  MXI2X4 U155 ( .A(n66), .B(\SumTmp[2][5] ), .S0(root[2]), .Y(n153) );
  INVX8 U156 ( .A(n185), .Y(\PartRem[4][6] ) );
  INVX1 U157 ( .A(n88), .Y(n90) );
  NAND3X1 U158 ( .A(n124), .B(root[8]), .C(\CryTmp[8][2] ), .Y(n137) );
  MXI2X1 U159 ( .A(n130), .B(n131), .S0(n103), .Y(\PartRem[6][8] ) );
  MXI2X4 U160 ( .A(n71), .B(\SumTmp[7][2] ), .S0(root[7]), .Y(n141) );
  MX2X6 U161 ( .A(n74), .B(\SumTmp[3][2] ), .S0(root[3]), .Y(n69) );
  XOR2X2 U162 ( .A(root[7]), .B(a[14]), .Y(n75) );
  OR2X4 U163 ( .A(n105), .B(n80), .Y(n110) );
  CLKBUFX20 U164 ( .A(n82), .Y(n105) );
  MXI2X4 U165 ( .A(n158), .B(n179), .S0(root[1]), .Y(\PartRem[1][4] ) );
  INVX3 U166 ( .A(n162), .Y(\PartRem[2][11] ) );
  MXI2X4 U167 ( .A(n152), .B(n191), .S0(root[1]), .Y(\PartRem[1][10] ) );
  CLKINVX8 U168 ( .A(n154), .Y(\PartRem[2][6] ) );
  MX2X6 U169 ( .A(n63), .B(\SumTmp[3][4] ), .S0(root[3]), .Y(n55) );
  INVX4 U170 ( .A(n156), .Y(\PartRem[2][4] ) );
  AND3X2 U171 ( .A(n124), .B(root[8]), .C(\CryTmp[8][2] ), .Y(n77) );
  AND2X8 U172 ( .A(n134), .B(n133), .Y(\PartRem[6][3] ) );
  INVX6 U173 ( .A(n146), .Y(\PartRem[6][5] ) );
  NAND2X8 U174 ( .A(\CryTmp[9][2] ), .B(n119), .Y(n82) );
  NAND2X2 U175 ( .A(n101), .B(a[12]), .Y(n47) );
  NAND2X4 U176 ( .A(n46), .B(n47), .Y(n72) );
  XNOR2X4 U177 ( .A(n33), .B(a[4]), .Y(n158) );
  NAND2XL U178 ( .A(n52), .B(n109), .Y(n111) );
  CLKMX2X8 U179 ( .A(\PartRem[4][3] ), .B(\SumTmp[3][3] ), .S0(root[3]), .Y(
        n66) );
  BUFX20 U180 ( .A(n193), .Y(root[7]) );
  INVX3 U181 ( .A(n132), .Y(\PartRem[6][7] ) );
  MXI2X4 U182 ( .A(\PartRem[6][4] ), .B(\SumTmp[5][4] ), .S0(n100), .Y(n160)
         );
  INVXL U183 ( .A(a[7]), .Y(n173) );
  INVX3 U184 ( .A(n150), .Y(\PartRem[3][10] ) );
  XOR2X1 U185 ( .A(n106), .B(n58), .Y(n57) );
  OAI21XL U186 ( .A0(n116), .A1(n68), .B0(n115), .Y(n58) );
  INVXL U187 ( .A(\CryTmp[8][2] ), .Y(n112) );
  MXI2XL U188 ( .A(n157), .B(n175), .S0(root[1]), .Y(\PartRem[1][5] ) );
  OA21X2 U189 ( .A0(a[17]), .A1(n136), .B0(n137), .Y(n81) );
  INVXL U190 ( .A(a[4]), .Y(n178) );
  OR2X8 U191 ( .A(a[12]), .B(a[13]), .Y(\CryTmp[6][2] ) );
  OR2X8 U192 ( .A(a[10]), .B(a[11]), .Y(\CryTmp[5][2] ) );
  INVXL U193 ( .A(a[10]), .Y(n190) );
  INVXL U194 ( .A(a[8]), .Y(n168) );
  INVXL U195 ( .A(a[6]), .Y(n144) );
  INVX4 U196 ( .A(\SumTmp[1][8] ), .Y(n191) );
  CLKINVX1 U197 ( .A(\SumTmp[1][9] ), .Y(n186) );
  INVX4 U198 ( .A(\SumTmp[1][7] ), .Y(n164) );
  INVX4 U199 ( .A(\SumTmp[2][10] ), .Y(n159) );
  MXI2XL U200 ( .A(n138), .B(n140), .S0(root[4]), .Y(\PartRem[4][10] ) );
  CLKINVX1 U201 ( .A(n139), .Y(\PartRem[4][9] ) );
  CLKINVX1 U202 ( .A(\SumTmp[5][7] ), .Y(n135) );
  OAI2BB1X4 U203 ( .A0N(n42), .A1N(n68), .B0(n60), .Y(n59) );
  MXI2XL U204 ( .A(n132), .B(n135), .S0(n100), .Y(\PartRem[5][9] ) );
  NOR2X1 U205 ( .A(n172), .B(n37), .Y(n171) );
  INVX3 U206 ( .A(\SumTmp[1][10] ), .Y(n184) );
  INVX4 U207 ( .A(\SumTmp[1][4] ), .Y(n174) );
  MXI2XL U208 ( .A(n139), .B(n145), .S0(root[3]), .Y(\PartRem[3][11] ) );
  MXI2X1 U209 ( .A(n36), .B(\SumTmp[3][8] ), .S0(root[3]), .Y(n150) );
  CLKINVX1 U210 ( .A(n114), .Y(n116) );
  INVX3 U211 ( .A(\SumTmp[1][2] ), .Y(n179) );
  NAND2XL U212 ( .A(n114), .B(n115), .Y(n113) );
  MXI2X1 U213 ( .A(\PartRem[7][5] ), .B(\SumTmp[6][5] ), .S0(n103), .Y(n132)
         );
  NOR2XL U214 ( .A(\CryTmp[8][2] ), .B(n53), .Y(n136) );
  OA22X4 U215 ( .A0(n38), .A1(a[3]), .B0(n38), .B1(n180), .Y(\PartRem[1][3] )
         );
  OA21X4 U216 ( .A0(a[15]), .A1(n147), .B0(n148), .Y(n73) );
  NAND2BX4 U217 ( .AN(n77), .B(n122), .Y(n76) );
  XOR2X1 U218 ( .A(root[1]), .B(a[2]), .Y(\PartRem[1][2] ) );
  INVXL U219 ( .A(a[16]), .Y(n124) );
  INVXL U220 ( .A(a[14]), .Y(n149) );
  MXI2X2 U222 ( .A(n67), .B(\SumTmp[7][4] ), .S0(root[7]), .Y(n130) );
  MXI2XL U223 ( .A(n121), .B(n125), .S0(root[7]), .Y(\PartRem[7][7] ) );
  MXI2X1 U224 ( .A(\PartRem[9][3] ), .B(\SumTmp[8][3] ), .S0(root[8]), .Y(n121) );
  NAND2X8 U225 ( .A(n104), .B(\PartRem[9][3] ), .Y(n115) );
  NAND3X2 U226 ( .A(\CryTmp[9][2] ), .B(n129), .C(n192), .Y(n128) );
  OAI21X4 U227 ( .A0(\CryTmp[8][2] ), .A1(n53), .B0(n123), .Y(n122) );
  OAI21X4 U228 ( .A0(n127), .A1(n41), .B0(n128), .Y(n126) );
  MXI2X4 U229 ( .A(n62), .B(\SumTmp[5][6] ), .S0(n100), .Y(n138) );
  MXI2X4 U230 ( .A(n73), .B(\SumTmp[6][3] ), .S0(n103), .Y(n146) );
  MXI2X4 U231 ( .A(n75), .B(\SumTmp[6][2] ), .S0(n103), .Y(n161) );
  OAI21X4 U232 ( .A0(a[9]), .A1(n166), .B0(n167), .Y(n165) );
  MXI2X4 U233 ( .A(n155), .B(n170), .S0(root[1]), .Y(\PartRem[1][7] ) );
  OAI21X4 U234 ( .A0(a[5]), .A1(n176), .B0(n177), .Y(n157) );
  NAND2BX4 U235 ( .AN(a[2]), .B(root[1]), .Y(n180) );
  MXI2X4 U236 ( .A(n64), .B(\SumTmp[4][4] ), .S0(n196), .Y(n185) );
  OR2X8 U237 ( .A(a[19]), .B(a[18]), .Y(\CryTmp[9][2] ) );
  OR2X8 U238 ( .A(a[14]), .B(a[15]), .Y(\CryTmp[7][2] ) );
endmodule


module geofence_DW_mult_uns_7 ( a, b, product );
  input [22:0] a;
  input [22:0] b;
  output [45:0] product;
  wire   n1, n4, n5, n6, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n29, n30, n31, n32, n37, n39,
         n40, n41, n42, n44, n46, n47, n50, n51, n52, n53, n55, n56, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n133, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n156, n158, n159, n160, n161, n162, n163, n166,
         n167, n168, n170, n172, n174, n176, n177, n180, n181, n182, n184,
         n186, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329,
         n330, n331, n332, n333, n334, n335, n336, n337, n339, n340, n341,
         n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363,
         n364, n365, n366, n367, n368, n369, n370, n371, n372, n373, n374,
         n375, n376, n377, n378, n379, n380, n381, n382, n383, n384, n385,
         n386, n387, n388, n389, n390, n391, n392, n393, n394, n395, n396,
         n397, n398, n399, n400, n401, n402, n403, n404, n405, n406, n407,
         n408, n409, n410, n411, n412, n413, n414, n415, n416, n417, n418,
         n419, n420, n421, n422, n423, n424, n425, n426, n427, n428, n429,
         n430, n431, n432, n433, n434, n435, n436, n437, n438, n439, n440,
         n441, n442, n443, n444, n445, n446, n447, n448, n449, n450, n451,
         n452, n453, n454, n455, n456, n457, n458, n459, n460, n461, n462,
         n463, n464, n465, n466, n467, n468, n469, n470, n471, n472, n473,
         n474, n475, n476, n477, n478, n479, n480, n481, n482, n483, n484,
         n485, n486, n487, n488, n489, n490, n491, n492, n493, n494, n495,
         n496, n497, n498, n499, n500, n501, n502, n503, n504, n505, n506,
         n507, n508, n509, n510, n511, n512, n513, n514, n516, n517, n518,
         n519, n521, n522, n526, n528, n529, n530, n532, n533, n534, n535,
         n537, n538, n539, n540, n541, n542, n543, n544, n545, n546, n547,
         n549, n551, n553, n554, n555, n556, n557, n558, n559, n560, n561,
         n562, n563, n564, n565, n566, n567, n568, n569, n570, n571, n572,
         n648, n649, n650, n651, n652, n653, n654, n655, n656, n657, n658,
         n659, n660, n661, n662, n663, n664, n665, n666, n667, n668, n669,
         n670, n671, n672, n673, n674, n675, n676, n677, n678, n679, n680,
         n681, n682, n683, n684, n685, n686, n687, n688, n689, n690, n691,
         n692, n693, n694, n695, n696, n697, n698, n699;

  AOI21X4 U135 ( .A0(n129), .A1(n121), .B0(n122), .Y(n120) );
  OAI22X2 U534 ( .A0(n562), .A1(n469), .B0(n543), .B1(n468), .Y(n375) );
  ADDFHX2 U535 ( .A(n211), .B(n366), .CI(n342), .CO(n208), .S(n209) );
  OAI21X2 U536 ( .A0(n81), .A1(n73), .B0(n76), .Y(n72) );
  NOR2X1 U537 ( .A(n80), .B(n73), .Y(n71) );
  INVX3 U538 ( .A(n74), .Y(n73) );
  ADDFHX1 U539 ( .A(n364), .B(n388), .CI(n412), .CO(n304), .S(n305) );
  CLKAND2X8 U540 ( .A(n696), .B(n662), .Y(n4) );
  OAI22X4 U541 ( .A0(n538), .A1(n490), .B0(n545), .B1(n489), .Y(n396) );
  NAND2X4 U542 ( .A(n83), .B(n66), .Y(n696) );
  ADDFHX4 U543 ( .A(n269), .B(n276), .CI(n267), .CO(n264), .S(n265) );
  ADDFHX4 U544 ( .A(n290), .B(n288), .CI(n281), .CO(n276), .S(n277) );
  NOR2X6 U545 ( .A(n265), .B(n274), .Y(n112) );
  OAI22X2 U546 ( .A0(n537), .A1(n480), .B0(n544), .B1(n479), .Y(n386) );
  NAND2X8 U547 ( .A(n675), .B(n676), .Y(n453) );
  NAND2X4 U548 ( .A(n673), .B(n674), .Y(n676) );
  CLKINVX2 U549 ( .A(n250), .Y(n251) );
  NOR2X6 U550 ( .A(n540), .B(n428), .Y(n250) );
  NOR2BX2 U551 ( .AN(n1), .B(n541), .Y(n350) );
  CLKXOR2X2 U552 ( .A(a[11]), .B(a[10]), .Y(n528) );
  BUFX16 U553 ( .A(a[11]), .Y(n554) );
  OAI22X4 U554 ( .A0(n534), .A1(n443), .B0(n541), .B1(n442), .Y(n349) );
  XNOR2X4 U555 ( .A(n554), .B(n526), .Y(n442) );
  OA21X4 U556 ( .A0(n76), .A1(n68), .B0(n69), .Y(n662) );
  ADDFHX4 U557 ( .A(n234), .B(n223), .CI(n232), .CO(n220), .S(n221) );
  OAI22X4 U558 ( .A0(n537), .A1(n474), .B0(n544), .B1(n473), .Y(n380) );
  XNOR2X4 U559 ( .A(n557), .B(b[12]), .Y(n473) );
  OAI21X4 U560 ( .A0(n154), .A1(n152), .B0(n153), .Y(n151) );
  OAI22X1 U561 ( .A0(n539), .A1(n679), .B0(n514), .B1(n546), .Y(n330) );
  INVXL U562 ( .A(n83), .Y(n81) );
  NAND2X6 U563 ( .A(n231), .B(n240), .Y(n90) );
  XNOR2X1 U564 ( .A(n555), .B(b[12]), .Y(n445) );
  XNOR2X1 U565 ( .A(n556), .B(b[12]), .Y(n459) );
  INVX4 U566 ( .A(n120), .Y(n689) );
  ADDFHX4 U567 ( .A(n208), .B(n206), .CI(n201), .CO(n198), .S(n199) );
  OR2X1 U568 ( .A(n537), .B(n683), .Y(n648) );
  OR2X1 U569 ( .A(n544), .B(n486), .Y(n649) );
  NAND2X4 U570 ( .A(n648), .B(n649), .Y(n328) );
  INVX6 U571 ( .A(n557), .Y(n683) );
  ADDHX4 U572 ( .A(n391), .B(n328), .CO(n318), .S(n319) );
  OR2XL U573 ( .A(n539), .B(n513), .Y(n650) );
  OR2X1 U574 ( .A(n512), .B(n546), .Y(n651) );
  NAND2X1 U575 ( .A(n650), .B(n651), .Y(n419) );
  BUFX20 U576 ( .A(n565), .Y(n539) );
  XNOR2X4 U577 ( .A(n559), .B(n526), .Y(n512) );
  OR2X8 U578 ( .A(n535), .B(n447), .Y(n652) );
  OR2X4 U579 ( .A(n542), .B(n446), .Y(n653) );
  NAND2X6 U580 ( .A(n652), .B(n653), .Y(n353) );
  XNOR2X4 U581 ( .A(n555), .B(n517), .Y(n447) );
  BUFX20 U582 ( .A(n568), .Y(n542) );
  NAND2X2 U583 ( .A(n307), .B(n312), .Y(n140) );
  ADDFHX4 U584 ( .A(n311), .B(n314), .CI(n309), .CO(n306), .S(n307) );
  XNOR2X1 U585 ( .A(n655), .B(a[5]), .Y(n695) );
  OAI22XL U586 ( .A0(n539), .A1(n509), .B0(n508), .B1(n546), .Y(n415) );
  XNOR2X4 U587 ( .A(n559), .B(n522), .Y(n508) );
  XNOR2X2 U588 ( .A(n559), .B(n521), .Y(n507) );
  OAI22X2 U589 ( .A0(n538), .A1(n495), .B0(n545), .B1(n494), .Y(n401) );
  OAI21X2 U590 ( .A0(n4), .A1(n61), .B0(n58), .Y(n56) );
  XNOR2X2 U591 ( .A(n558), .B(b[3]), .Y(n496) );
  XNOR2X2 U592 ( .A(n553), .B(b[2]), .Y(n428) );
  OAI22X2 U593 ( .A0(n562), .A1(n466), .B0(n543), .B1(n465), .Y(n372) );
  BUFX3 U594 ( .A(n418), .Y(n654) );
  OAI22X4 U595 ( .A0(n535), .A1(n450), .B0(n542), .B1(n449), .Y(n356) );
  OR2X4 U596 ( .A(n542), .B(n450), .Y(n678) );
  BUFX20 U597 ( .A(n567), .Y(n541) );
  BUFX12 U598 ( .A(a[12]), .Y(n553) );
  NAND2X2 U599 ( .A(n265), .B(n274), .Y(n113) );
  NAND2X4 U600 ( .A(n671), .B(n672), .Y(n394) );
  XNOR2X2 U601 ( .A(n554), .B(b[3]), .Y(n440) );
  BUFX6 U602 ( .A(a[4]), .Y(n655) );
  OAI22X2 U603 ( .A0(n535), .A1(n457), .B0(n542), .B1(n456), .Y(n363) );
  XNOR2X2 U604 ( .A(n555), .B(n526), .Y(n456) );
  ADDHX2 U605 ( .A(n377), .B(n327), .CO(n310), .S(n311) );
  OAI22X4 U606 ( .A0(n562), .A1(n471), .B0(n543), .B1(n470), .Y(n377) );
  BUFX6 U607 ( .A(n361), .Y(n656) );
  BUFX20 U608 ( .A(b[5]), .Y(n522) );
  ADDFHX2 U609 ( .A(n362), .B(n386), .CI(n398), .CO(n288), .S(n289) );
  OAI22X1 U610 ( .A0(n538), .A1(n492), .B0(n545), .B1(n491), .Y(n398) );
  OAI22X2 U611 ( .A0(n539), .A1(n507), .B0(n506), .B1(n546), .Y(n413) );
  OAI22X2 U612 ( .A0(n539), .A1(n506), .B0(n505), .B1(n546), .Y(n412) );
  XNOR2X2 U613 ( .A(n559), .B(n658), .Y(n506) );
  OAI22X4 U614 ( .A0(n537), .A1(n483), .B0(n544), .B1(n482), .Y(n389) );
  XNOR2X2 U615 ( .A(n557), .B(b[3]), .Y(n482) );
  ADDFHX4 U616 ( .A(n258), .B(n247), .CI(n256), .CO(n242), .S(n243) );
  ADDFHX4 U617 ( .A(n358), .B(n382), .CI(n262), .CO(n246), .S(n247) );
  NOR2XL U618 ( .A(n419), .B(n330), .Y(n162) );
  NAND2X2 U619 ( .A(n419), .B(n330), .Y(n163) );
  NAND2X2 U620 ( .A(n683), .B(n684), .Y(n686) );
  ADDFHX4 U621 ( .A(n372), .B(n396), .CI(n348), .CO(n270), .S(n271) );
  BUFX8 U622 ( .A(n112), .Y(n657) );
  CLKINVX1 U623 ( .A(n103), .Y(n102) );
  NOR2X6 U624 ( .A(n96), .B(n103), .Y(n94) );
  NOR2X4 U625 ( .A(n253), .B(n264), .Y(n103) );
  OAI22X1 U626 ( .A0(n538), .A1(n491), .B0(n545), .B1(n490), .Y(n397) );
  XNOR2X2 U627 ( .A(n558), .B(n519), .Y(n491) );
  OAI22X1 U628 ( .A0(n562), .A1(n467), .B0(n543), .B1(n466), .Y(n373) );
  BUFX8 U629 ( .A(n569), .Y(n543) );
  OAI22X2 U630 ( .A0(n535), .A1(n456), .B0(n542), .B1(n455), .Y(n362) );
  XNOR2X2 U631 ( .A(n555), .B(b[2]), .Y(n455) );
  OAI22X1 U632 ( .A0(n534), .A1(n442), .B0(n541), .B1(n441), .Y(n348) );
  NAND2X4 U633 ( .A(n685), .B(n686), .Y(n479) );
  ADDFHX4 U634 ( .A(n385), .B(n656), .CI(n409), .CO(n280), .S(n281) );
  OAI22X1 U635 ( .A0(n535), .A1(n455), .B0(n542), .B1(n454), .Y(n361) );
  OAI22X1 U636 ( .A0(n539), .A1(n503), .B0(n502), .B1(n546), .Y(n409) );
  ADDFHX1 U637 ( .A(n397), .B(n373), .CI(n283), .CO(n278), .S(n279) );
  OAI22X1 U638 ( .A0(n537), .A1(n479), .B0(n544), .B1(n478), .Y(n385) );
  OAI22X1 U639 ( .A0(n537), .A1(n482), .B0(n544), .B1(n481), .Y(n388) );
  NOR2X2 U640 ( .A(n540), .B(n424), .Y(n210) );
  NOR2X4 U641 ( .A(n540), .B(n426), .Y(n228) );
  NOR2X2 U642 ( .A(n540), .B(n429), .Y(n336) );
  NOR2X4 U643 ( .A(n540), .B(n430), .Y(n324) );
  ADDFHX1 U644 ( .A(n210), .B(n333), .CI(n353), .CO(n202), .S(n203) );
  XNOR2X2 U645 ( .A(n559), .B(b[3]), .Y(n510) );
  ADDFHX2 U646 ( .A(n400), .B(n376), .CI(n310), .CO(n302), .S(n303) );
  OAI22X1 U647 ( .A0(n538), .A1(n494), .B0(n545), .B1(n493), .Y(n400) );
  NAND2X2 U648 ( .A(n667), .B(n668), .Y(n477) );
  NAND2X1 U649 ( .A(n683), .B(n666), .Y(n668) );
  NAND2X2 U650 ( .A(n59), .B(n50), .Y(n46) );
  NOR2X6 U651 ( .A(n205), .B(n212), .Y(n68) );
  INVX3 U652 ( .A(n158), .Y(n156) );
  CLKAND2X8 U653 ( .A(n94), .B(n110), .Y(n690) );
  OR2X2 U654 ( .A(n535), .B(n451), .Y(n677) );
  INVX3 U655 ( .A(n555), .Y(n673) );
  XNOR2X1 U656 ( .A(n557), .B(n659), .Y(n481) );
  XNOR2X1 U657 ( .A(n556), .B(b[2]), .Y(n469) );
  XNOR2X1 U658 ( .A(n558), .B(n659), .Y(n495) );
  OR2X1 U659 ( .A(n545), .B(n487), .Y(n672) );
  XNOR2X1 U660 ( .A(n558), .B(n658), .Y(n492) );
  XNOR2X1 U661 ( .A(n556), .B(n522), .Y(n466) );
  XNOR2X2 U662 ( .A(n555), .B(b[3]), .Y(n454) );
  ADDFHX2 U663 ( .A(n345), .B(n239), .CI(n248), .CO(n234), .S(n235) );
  OAI22X1 U664 ( .A0(n562), .A1(n462), .B0(n543), .B1(n461), .Y(n368) );
  OAI21XL U665 ( .A0(n109), .A1(n101), .B0(n104), .Y(n100) );
  NOR2X1 U666 ( .A(n108), .B(n101), .Y(n99) );
  OR2X1 U667 ( .A(n336), .B(n324), .Y(n262) );
  OR2X2 U668 ( .A(n669), .B(n670), .Y(n382) );
  ADDFHX2 U669 ( .A(n411), .B(n299), .CI(n304), .CO(n294), .S(n295) );
  CMPR22X2 U670 ( .A(n349), .B(n325), .CO(n282), .S(n283) );
  XNOR2X1 U671 ( .A(n557), .B(n658), .Y(n478) );
  ADDFHX2 U672 ( .A(n350), .B(n374), .CI(n410), .CO(n290), .S(n291) );
  ADDFX2 U673 ( .A(n371), .B(n359), .CI(n407), .CO(n260), .S(n261) );
  AO21X1 U674 ( .A0(n539), .A1(n546), .B0(n501), .Y(n407) );
  ADDFHX2 U675 ( .A(n244), .B(n242), .CI(n233), .CO(n230), .S(n231) );
  CLKBUFX8 U676 ( .A(b[8]), .Y(n519) );
  CLKINVX1 U677 ( .A(n84), .Y(n170) );
  CLKINVX1 U678 ( .A(n108), .Y(n106) );
  NOR2X4 U679 ( .A(n313), .B(n316), .Y(n145) );
  ADDFHX2 U680 ( .A(n289), .B(n294), .CI(n287), .CO(n284), .S(n285) );
  ADDFHX2 U681 ( .A(n279), .B(n286), .CI(n277), .CO(n274), .S(n275) );
  ADDFHX2 U682 ( .A(n263), .B(n272), .CI(n270), .CO(n256), .S(n257) );
  XNOR2X1 U683 ( .A(n336), .B(n324), .Y(n263) );
  ADDFHX2 U684 ( .A(n280), .B(n271), .CI(n278), .CO(n266), .S(n267) );
  NOR2X4 U685 ( .A(n230), .B(n221), .Y(n84) );
  NOR2X2 U686 ( .A(n231), .B(n240), .Y(n89) );
  ADDFHX2 U687 ( .A(n219), .B(n226), .CI(n217), .CO(n214), .S(n215) );
  BUFX6 U688 ( .A(b[10]), .Y(n517) );
  BUFX8 U689 ( .A(b[11]), .Y(n516) );
  XNOR2X1 U690 ( .A(n554), .B(n517), .Y(n433) );
  BUFX12 U691 ( .A(b[9]), .Y(n518) );
  CLKINVX1 U692 ( .A(n140), .Y(n138) );
  OR2X4 U693 ( .A(n301), .B(n306), .Y(n660) );
  CLKINVX1 U694 ( .A(n139), .Y(n137) );
  XNOR2X1 U695 ( .A(n559), .B(b[2]), .Y(n511) );
  NOR2X1 U696 ( .A(n5), .B(n61), .Y(n55) );
  AOI21X1 U697 ( .A0(n50), .A1(n60), .B0(n51), .Y(n47) );
  NOR2X2 U698 ( .A(n123), .B(n126), .Y(n121) );
  OAI21X2 U699 ( .A0(n123), .A1(n127), .B0(n124), .Y(n122) );
  NAND2X2 U700 ( .A(n275), .B(n284), .Y(n118) );
  NOR2X4 U701 ( .A(n75), .B(n68), .Y(n66) );
  NAND2X1 U702 ( .A(n198), .B(n193), .Y(n53) );
  CLKINVX1 U703 ( .A(n52), .Y(n50) );
  BUFX8 U704 ( .A(n566), .Y(n540) );
  XNOR2X1 U705 ( .A(n554), .B(n516), .Y(n432) );
  OAI22X1 U706 ( .A0(n538), .A1(n551), .B0(n545), .B1(n500), .Y(n329) );
  ADDFX2 U707 ( .A(n392), .B(n416), .CI(n404), .CO(n320), .S(n321) );
  NOR2BX1 U708 ( .AN(n1), .B(n544), .Y(n392) );
  OAI22X1 U709 ( .A0(n539), .A1(n510), .B0(n509), .B1(n546), .Y(n416) );
  OAI22XL U710 ( .A0(n539), .A1(n512), .B0(n511), .B1(n546), .Y(n418) );
  NOR2BX1 U711 ( .AN(n1), .B(n545), .Y(n406) );
  NOR2X4 U712 ( .A(n241), .B(n252), .Y(n96) );
  NAND2X2 U713 ( .A(n241), .B(n252), .Y(n97) );
  NAND2X4 U714 ( .A(n253), .B(n264), .Y(n104) );
  NAND2X1 U715 ( .A(n192), .B(n189), .Y(n42) );
  NOR2X1 U716 ( .A(n192), .B(n189), .Y(n41) );
  CLKINVX1 U717 ( .A(n53), .Y(n51) );
  NAND2X2 U718 ( .A(n50), .B(n39), .Y(n37) );
  NAND2X2 U719 ( .A(n204), .B(n199), .Y(n62) );
  NAND2X1 U720 ( .A(n323), .B(n329), .Y(n158) );
  NOR2X1 U721 ( .A(n654), .B(n406), .Y(n160) );
  NAND2X1 U722 ( .A(n654), .B(n406), .Y(n161) );
  NAND2X1 U723 ( .A(n698), .B(n29), .Y(n6) );
  BUFX20 U724 ( .A(a[5]), .Y(n557) );
  BUFX20 U725 ( .A(b[7]), .Y(n658) );
  OAI22X2 U726 ( .A0(n535), .A1(n446), .B0(n542), .B1(n445), .Y(n352) );
  XNOR2X1 U727 ( .A(n553), .B(n519), .Y(n422) );
  BUFX20 U728 ( .A(b[4]), .Y(n659) );
  OR2X8 U729 ( .A(n323), .B(n329), .Y(n661) );
  BUFX16 U730 ( .A(a[9]), .Y(n555) );
  INVX1 U731 ( .A(n41), .Y(n39) );
  CLKINVX1 U732 ( .A(n61), .Y(n59) );
  NOR2X4 U733 ( .A(n204), .B(n199), .Y(n61) );
  BUFX16 U734 ( .A(a[1]), .Y(n559) );
  NOR2X4 U735 ( .A(n89), .B(n84), .Y(n82) );
  NOR2X4 U736 ( .A(n220), .B(n213), .Y(n75) );
  CLKINVX1 U737 ( .A(n75), .Y(n74) );
  NOR2X2 U738 ( .A(n275), .B(n284), .Y(n117) );
  CLKINVX1 U739 ( .A(n117), .Y(n115) );
  NOR2X2 U740 ( .A(n307), .B(n312), .Y(n139) );
  XOR2X1 U741 ( .A(a[0]), .B(a[1]), .Y(n533) );
  XNOR2X2 U742 ( .A(n556), .B(n521), .Y(n465) );
  XNOR2X1 U743 ( .A(n557), .B(n1), .Y(n485) );
  AOI21X2 U744 ( .A0(n91), .A1(n31), .B0(n32), .Y(n30) );
  AOI21XL U745 ( .A0(n91), .A1(n71), .B0(n72), .Y(n70) );
  AOI21XL U746 ( .A0(n91), .A1(n64), .B0(n65), .Y(n63) );
  BUFX20 U747 ( .A(n560), .Y(n534) );
  NAND2X8 U748 ( .A(n528), .B(n567), .Y(n560) );
  OAI22X2 U749 ( .A0(n562), .A1(n549), .B0(n543), .B1(n472), .Y(n327) );
  CLKXOR2X4 U750 ( .A(a[8]), .B(a[9]), .Y(n529) );
  OR2X4 U751 ( .A(n538), .B(n488), .Y(n671) );
  XNOR2X4 U752 ( .A(n558), .B(b[12]), .Y(n487) );
  INVX1 U753 ( .A(n110), .Y(n108) );
  BUFX8 U754 ( .A(b[1]), .Y(n526) );
  OAI22X2 U755 ( .A0(n538), .A1(n489), .B0(n545), .B1(n488), .Y(n395) );
  INVX1 U756 ( .A(n516), .Y(n680) );
  ADDFHX4 U757 ( .A(n357), .B(n381), .CI(n393), .CO(n236), .S(n237) );
  OAI22X2 U758 ( .A0(n537), .A1(n475), .B0(n544), .B1(n474), .Y(n381) );
  ADDFHX4 U759 ( .A(n413), .B(n389), .CI(n401), .CO(n308), .S(n309) );
  XNOR2X4 U760 ( .A(n558), .B(n516), .Y(n488) );
  ADDFHX2 U761 ( .A(n387), .B(n375), .CI(n399), .CO(n296), .S(n297) );
  NAND2X2 U762 ( .A(n660), .B(n137), .Y(n130) );
  CLKAND2X12 U763 ( .A(n696), .B(n662), .Y(n663) );
  OAI22X2 U764 ( .A0(n562), .A1(n468), .B0(n543), .B1(n467), .Y(n374) );
  XNOR2X4 U765 ( .A(n556), .B(n659), .Y(n467) );
  OAI2BB1X4 U766 ( .A0N(n91), .A1N(n44), .B0(n664), .Y(n691) );
  OA21X4 U767 ( .A0(n663), .A1(n46), .B0(n47), .Y(n664) );
  XNOR2X4 U768 ( .A(n557), .B(n517), .Y(n475) );
  CLKBUFX2 U769 ( .A(n91), .Y(n665) );
  AOI2BB1X4 U770 ( .A0N(n37), .A1N(n62), .B0(n688), .Y(n687) );
  XNOR2X4 U771 ( .A(n555), .B(n516), .Y(n446) );
  OAI22X2 U772 ( .A0(n534), .A1(n437), .B0(n541), .B1(n436), .Y(n343) );
  INVXL U773 ( .A(n120), .Y(n119) );
  NAND2X8 U774 ( .A(n530), .B(n569), .Y(n562) );
  XOR2X2 U775 ( .A(a[2]), .B(a[3]), .Y(n532) );
  ADDFHX2 U776 ( .A(n341), .B(n365), .CI(n203), .CO(n200), .S(n201) );
  OAI22X1 U777 ( .A0(n534), .A1(n435), .B0(n541), .B1(n434), .Y(n341) );
  NOR2X2 U778 ( .A(n537), .B(n476), .Y(n669) );
  XNOR2X4 U779 ( .A(n557), .B(n518), .Y(n476) );
  INVXL U780 ( .A(n663), .Y(n65) );
  NAND2X4 U781 ( .A(n681), .B(n682), .Y(n502) );
  XNOR2X4 U782 ( .A(n559), .B(n517), .Y(n503) );
  NAND2X1 U783 ( .A(n559), .B(n516), .Y(n681) );
  OAI22X2 U784 ( .A0(n534), .A1(n440), .B0(n541), .B1(n439), .Y(n346) );
  OAI22X4 U785 ( .A0(n535), .A1(n453), .B0(n542), .B1(n452), .Y(n359) );
  XNOR2X1 U786 ( .A(n553), .B(n521), .Y(n424) );
  OAI21X4 U787 ( .A0(n663), .A1(n697), .B0(n687), .Y(n32) );
  XNOR2X2 U788 ( .A(n555), .B(n658), .Y(n450) );
  XNOR2X1 U789 ( .A(n555), .B(n1), .Y(n457) );
  XNOR2X4 U790 ( .A(n558), .B(n518), .Y(n490) );
  XNOR2X1 U791 ( .A(n554), .B(n1), .Y(n443) );
  OAI22X2 U792 ( .A0(n537), .A1(n485), .B0(n544), .B1(n484), .Y(n391) );
  ADDFHX2 U793 ( .A(n378), .B(n414), .CI(n402), .CO(n314), .S(n315) );
  NOR2X4 U794 ( .A(n145), .B(n148), .Y(n143) );
  XNOR2X4 U795 ( .A(n555), .B(n522), .Y(n452) );
  OAI21X4 U796 ( .A0(n145), .A1(n149), .B0(n146), .Y(n144) );
  OAI22X2 U797 ( .A0(n539), .A1(n511), .B0(n510), .B1(n546), .Y(n417) );
  XNOR2X4 U798 ( .A(n555), .B(n518), .Y(n448) );
  OAI22X4 U799 ( .A0(n535), .A1(n449), .B0(n542), .B1(n448), .Y(n355) );
  XNOR2X4 U800 ( .A(n555), .B(n519), .Y(n449) );
  NAND2X2 U801 ( .A(n532), .B(n571), .Y(n564) );
  ADDFHX4 U802 ( .A(n197), .B(n352), .CI(n340), .CO(n194), .S(n195) );
  OAI22X4 U803 ( .A0(n535), .A1(n454), .B0(n542), .B1(n453), .Y(n360) );
  INVX1 U804 ( .A(n123), .Y(n176) );
  OAI22X1 U805 ( .A0(n537), .A1(n481), .B0(n544), .B1(n480), .Y(n387) );
  OAI22X2 U806 ( .A0(n539), .A1(n508), .B0(n507), .B1(n546), .Y(n414) );
  ADDFHX4 U807 ( .A(n251), .B(n394), .CI(n346), .CO(n248), .S(n249) );
  OAI22X1 U808 ( .A0(n539), .A1(n505), .B0(n504), .B1(n546), .Y(n411) );
  XNOR2X2 U809 ( .A(n559), .B(n659), .Y(n509) );
  NAND2BX1 U810 ( .AN(n1), .B(n553), .Y(n430) );
  ADDFHX2 U811 ( .A(n229), .B(n380), .CI(n344), .CO(n226), .S(n227) );
  XNOR2X4 U812 ( .A(a[8]), .B(a[7]), .Y(n568) );
  NOR2BX1 U813 ( .AN(n1), .B(n542), .Y(n364) );
  OAI22X2 U814 ( .A0(n562), .A1(n470), .B0(n543), .B1(n469), .Y(n376) );
  INVX1 U815 ( .A(n142), .Y(n141) );
  ADDFHX2 U816 ( .A(n390), .B(n318), .CI(n315), .CO(n312), .S(n313) );
  NOR2X8 U817 ( .A(n285), .B(n292), .Y(n123) );
  XNOR2X4 U818 ( .A(n559), .B(n518), .Y(n504) );
  ADDFHX4 U819 ( .A(n305), .B(n308), .CI(n303), .CO(n300), .S(n301) );
  XOR2X4 U820 ( .A(a[6]), .B(a[7]), .Y(n530) );
  ADDFHX4 U821 ( .A(n351), .B(n191), .CI(n194), .CO(n188), .S(n189) );
  ADDFHX4 U822 ( .A(n196), .B(n332), .CI(n339), .CO(n190), .S(n191) );
  XNOR2X4 U823 ( .A(n557), .B(n516), .Y(n474) );
  XNOR2X1 U824 ( .A(n556), .B(n1), .Y(n471) );
  OAI21X2 U825 ( .A0(n96), .A1(n104), .B0(n97), .Y(n95) );
  NOR2X6 U826 ( .A(n198), .B(n193), .Y(n52) );
  ADDFHX4 U827 ( .A(n337), .B(n360), .CI(n408), .CO(n272), .S(n273) );
  OAI22X2 U828 ( .A0(n539), .A1(n502), .B0(n501), .B1(n546), .Y(n408) );
  XNOR2X1 U829 ( .A(n553), .B(n526), .Y(n429) );
  NOR2X2 U830 ( .A(n540), .B(n421), .Y(n332) );
  ADDHX2 U831 ( .A(n417), .B(n405), .CO(n322), .S(n323) );
  XNOR2X4 U832 ( .A(a[2]), .B(a[1]), .Y(n571) );
  OAI21X4 U833 ( .A0(n84), .A1(n90), .B0(n85), .Y(n83) );
  ADDHX2 U834 ( .A(n363), .B(n326), .CO(n298), .S(n299) );
  NAND2X2 U835 ( .A(n313), .B(n316), .Y(n146) );
  BUFX20 U836 ( .A(n563), .Y(n537) );
  NAND2X1 U837 ( .A(n557), .B(n521), .Y(n685) );
  BUFX20 U838 ( .A(b[6]), .Y(n521) );
  XNOR2X4 U839 ( .A(n556), .B(b[3]), .Y(n468) );
  NOR2X2 U840 ( .A(n5), .B(n697), .Y(n31) );
  ADDFHX4 U841 ( .A(n227), .B(n236), .CI(n225), .CO(n222), .S(n223) );
  NAND2X2 U842 ( .A(n555), .B(n659), .Y(n675) );
  OAI22X2 U843 ( .A0(n535), .A1(n452), .B0(n542), .B1(n451), .Y(n358) );
  AOI21X4 U844 ( .A0(n94), .A1(n111), .B0(n95), .Y(n93) );
  OAI21X4 U845 ( .A0(n657), .A1(n118), .B0(n113), .Y(n111) );
  ADDFHX2 U846 ( .A(n343), .B(n355), .CI(n379), .CO(n216), .S(n217) );
  OAI22X2 U847 ( .A0(n534), .A1(n441), .B0(n541), .B1(n440), .Y(n347) );
  NOR2X4 U848 ( .A(n293), .B(n300), .Y(n126) );
  OAI22X1 U849 ( .A0(n534), .A1(n433), .B0(n541), .B1(n432), .Y(n339) );
  ADDFHX4 U850 ( .A(n384), .B(n282), .CI(n273), .CO(n268), .S(n269) );
  OAI22X2 U851 ( .A0(n534), .A1(n547), .B0(n541), .B1(n444), .Y(n325) );
  ADDFHX4 U852 ( .A(n216), .B(n207), .CI(n214), .CO(n204), .S(n205) );
  ADDFHX4 U853 ( .A(n354), .B(n218), .CI(n209), .CO(n206), .S(n207) );
  XNOR2X2 U854 ( .A(n553), .B(n522), .Y(n425) );
  ADDFHX2 U855 ( .A(n395), .B(n347), .CI(n383), .CO(n258), .S(n259) );
  OAI22X2 U856 ( .A0(n535), .A1(n673), .B0(n542), .B1(n458), .Y(n326) );
  NAND2BX4 U857 ( .AN(n695), .B(n570), .Y(n563) );
  ADDFHX2 U858 ( .A(n370), .B(n249), .CI(n260), .CO(n244), .S(n245) );
  XNOR2X2 U859 ( .A(n553), .B(n659), .Y(n426) );
  ADDFHX4 U860 ( .A(n246), .B(n237), .CI(n235), .CO(n232), .S(n233) );
  NAND2X2 U861 ( .A(n293), .B(n300), .Y(n127) );
  XNOR2X2 U862 ( .A(n556), .B(n658), .Y(n464) );
  OAI22X1 U863 ( .A0(n562), .A1(n465), .B0(n543), .B1(n464), .Y(n371) );
  CLKINVX3 U864 ( .A(n210), .Y(n211) );
  OAI21X4 U865 ( .A0(n142), .A1(n130), .B0(n131), .Y(n129) );
  AOI21X4 U866 ( .A0(n143), .A1(n151), .B0(n144), .Y(n142) );
  OAI22X2 U867 ( .A0(n562), .A1(n461), .B0(n543), .B1(n460), .Y(n367) );
  XNOR2X4 U868 ( .A(n556), .B(n516), .Y(n460) );
  ADDFHX4 U869 ( .A(n259), .B(n261), .CI(n268), .CO(n254), .S(n255) );
  NAND2X2 U870 ( .A(n205), .B(n212), .Y(n69) );
  NAND2X6 U871 ( .A(n220), .B(n213), .Y(n76) );
  ADDFHX4 U872 ( .A(n224), .B(n215), .CI(n222), .CO(n212), .S(n213) );
  NAND2X4 U873 ( .A(n285), .B(n292), .Y(n124) );
  XNOR2X4 U874 ( .A(a[12]), .B(a[11]), .Y(n566) );
  ADDFHX4 U875 ( .A(n297), .B(n302), .CI(n295), .CO(n292), .S(n293) );
  OR2X4 U876 ( .A(n37), .B(n61), .Y(n697) );
  AOI21X4 U877 ( .A0(n660), .A1(n138), .B0(n133), .Y(n131) );
  XNOR2X1 U878 ( .A(n558), .B(n522), .Y(n494) );
  ADDFHX4 U879 ( .A(n298), .B(n291), .CI(n296), .CO(n286), .S(n287) );
  OAI22X2 U880 ( .A0(n534), .A1(n434), .B0(n541), .B1(n433), .Y(n340) );
  XNOR2X2 U881 ( .A(n554), .B(n518), .Y(n434) );
  ADDFHX4 U882 ( .A(n257), .B(n266), .CI(n255), .CO(n252), .S(n253) );
  XNOR2X2 U883 ( .A(n558), .B(n517), .Y(n489) );
  ADDFHX4 U884 ( .A(n202), .B(n195), .CI(n200), .CO(n192), .S(n193) );
  NAND2X2 U885 ( .A(n301), .B(n306), .Y(n135) );
  XNOR2X1 U886 ( .A(n558), .B(n521), .Y(n493) );
  NOR2X1 U887 ( .A(n540), .B(n423), .Y(n333) );
  NAND2X2 U888 ( .A(n230), .B(n221), .Y(n85) );
  XNOR2X4 U889 ( .A(a[10]), .B(a[9]), .Y(n567) );
  BUFX20 U890 ( .A(a[3]), .Y(n558) );
  NOR2X6 U891 ( .A(n317), .B(n320), .Y(n148) );
  ADDFHX4 U892 ( .A(n415), .B(n403), .CI(n319), .CO(n316), .S(n317) );
  XNOR2X4 U893 ( .A(n554), .B(n519), .Y(n435) );
  XNOR2X2 U894 ( .A(n555), .B(n521), .Y(n451) );
  NAND2X6 U895 ( .A(n82), .B(n66), .Y(n5) );
  ADDFHX2 U896 ( .A(n250), .B(n335), .CI(n369), .CO(n238), .S(n239) );
  NAND2XL U897 ( .A(n557), .B(n519), .Y(n667) );
  INVXL U898 ( .A(n519), .Y(n666) );
  OAI22X2 U899 ( .A0(n537), .A1(n478), .B0(n544), .B1(n477), .Y(n384) );
  OAI22X2 U900 ( .A0(n537), .A1(n477), .B0(n544), .B1(n476), .Y(n383) );
  NOR2X1 U901 ( .A(n544), .B(n475), .Y(n670) );
  BUFX20 U902 ( .A(n564), .Y(n538) );
  INVXL U903 ( .A(n659), .Y(n674) );
  NAND2X2 U904 ( .A(n677), .B(n678), .Y(n357) );
  NAND2X2 U905 ( .A(n679), .B(n680), .Y(n682) );
  INVXL U906 ( .A(n559), .Y(n679) );
  BUFX20 U907 ( .A(n570), .Y(n544) );
  XNOR2X1 U908 ( .A(n557), .B(n522), .Y(n480) );
  OAI22X1 U909 ( .A0(n538), .A1(n493), .B0(n545), .B1(n492), .Y(n399) );
  NOR2X4 U910 ( .A(n540), .B(n427), .Y(n335) );
  NOR2X4 U911 ( .A(n540), .B(n422), .Y(n196) );
  NOR2X1 U912 ( .A(n540), .B(n425), .Y(n334) );
  INVX3 U913 ( .A(n68), .Y(n168) );
  OAI22X1 U914 ( .A0(n534), .A1(n439), .B0(n541), .B1(n438), .Y(n345) );
  XNOR2X1 U915 ( .A(n554), .B(n659), .Y(n439) );
  OAI22X1 U916 ( .A0(n534), .A1(n438), .B0(n541), .B1(n437), .Y(n344) );
  XNOR2X1 U917 ( .A(n554), .B(n522), .Y(n438) );
  OAI22X4 U918 ( .A0(n562), .A1(n463), .B0(n543), .B1(n462), .Y(n369) );
  XNOR2X4 U919 ( .A(n556), .B(n518), .Y(n462) );
  XNOR2X4 U920 ( .A(n556), .B(n519), .Y(n463) );
  XNOR2X4 U921 ( .A(n556), .B(n517), .Y(n461) );
  XNOR2X2 U922 ( .A(n556), .B(n526), .Y(n470) );
  BUFX20 U923 ( .A(a[7]), .Y(n556) );
  AO21X2 U924 ( .A0(n537), .A1(n544), .B0(n473), .Y(n379) );
  NOR2X4 U925 ( .A(n657), .B(n117), .Y(n110) );
  NAND2X4 U926 ( .A(n317), .B(n320), .Y(n149) );
  INVXL U927 ( .A(n521), .Y(n684) );
  AND2X1 U928 ( .A(n39), .B(n42), .Y(n692) );
  INVXL U929 ( .A(n152), .Y(n182) );
  ADDFHX2 U930 ( .A(n228), .B(n334), .CI(n367), .CO(n218), .S(n219) );
  AO21X4 U931 ( .A0(n51), .A1(n39), .B0(n40), .Y(n688) );
  NAND2X1 U932 ( .A(n188), .B(n186), .Y(n29) );
  AND2XL U933 ( .A(n166), .B(n53), .Y(n694) );
  ADDFX2 U934 ( .A(n368), .B(n356), .CI(n238), .CO(n224), .S(n225) );
  AOI21X4 U935 ( .A0(n159), .A1(n661), .B0(n156), .Y(n154) );
  INVX1 U936 ( .A(n27), .Y(product[1]) );
  NAND2X4 U937 ( .A(n529), .B(n568), .Y(n561) );
  BUFX20 U938 ( .A(n561), .Y(n535) );
  BUFX8 U939 ( .A(b[0]), .Y(n1) );
  INVX3 U940 ( .A(n62), .Y(n60) );
  INVXL U941 ( .A(n61), .Y(n167) );
  INVXL U942 ( .A(n89), .Y(n87) );
  INVXL U943 ( .A(n90), .Y(n88) );
  OAI2BB1X4 U944 ( .A0N(n689), .A1N(n690), .B0(n93), .Y(n91) );
  INVX3 U945 ( .A(n42), .Y(n40) );
  INVXL U946 ( .A(n96), .Y(n172) );
  INVXL U947 ( .A(n657), .Y(n174) );
  INVXL U948 ( .A(n129), .Y(n128) );
  ADDFHX4 U949 ( .A(n245), .B(n254), .CI(n243), .CO(n240), .S(n241) );
  INVX3 U950 ( .A(n135), .Y(n133) );
  XOR2X4 U951 ( .A(n691), .B(n692), .Y(product[21]) );
  XOR2X4 U952 ( .A(n693), .B(n694), .Y(product[20]) );
  AO21X4 U953 ( .A0(n91), .A1(n55), .B0(n56), .Y(n693) );
  OAI22XL U954 ( .A0(n562), .A1(n464), .B0(n543), .B1(n463), .Y(n370) );
  BUFX12 U955 ( .A(n571), .Y(n545) );
  OAI21X4 U956 ( .A0(n160), .A1(n163), .B0(n161), .Y(n159) );
  NOR2XL U957 ( .A(n540), .B(n420), .Y(n331) );
  NAND2BXL U958 ( .AN(n162), .B(n163), .Y(n27) );
  XNOR2X4 U959 ( .A(a[6]), .B(a[5]), .Y(n569) );
  XNOR2X4 U960 ( .A(n655), .B(a[3]), .Y(n570) );
  XNOR2XL U961 ( .A(n553), .B(n518), .Y(n421) );
  BUFX12 U962 ( .A(n572), .Y(n546) );
  XNOR2XL U963 ( .A(n553), .B(n517), .Y(n420) );
  NAND2BXL U964 ( .AN(n1), .B(n554), .Y(n444) );
  NAND2BXL U965 ( .AN(n1), .B(n557), .Y(n486) );
  INVXL U966 ( .A(n558), .Y(n551) );
  NAND2BXL U967 ( .AN(n1), .B(n558), .Y(n500) );
  XNOR2XL U968 ( .A(n559), .B(n1), .Y(n513) );
  NAND2BXL U969 ( .AN(n1), .B(n559), .Y(n514) );
  NOR2X1 U970 ( .A(n5), .B(n46), .Y(n44) );
  CLKINVX1 U971 ( .A(n5), .Y(n64) );
  CLKINVX1 U972 ( .A(n60), .Y(n58) );
  CLKINVX1 U973 ( .A(n82), .Y(n80) );
  CLKINVX1 U974 ( .A(n111), .Y(n109) );
  CLKINVX1 U975 ( .A(n52), .Y(n166) );
  CLKINVX1 U976 ( .A(n102), .Y(n101) );
  CLKINVX1 U977 ( .A(n118), .Y(n116) );
  OR2X1 U978 ( .A(n188), .B(n186), .Y(n698) );
  CLKINVX1 U979 ( .A(n145), .Y(n180) );
  CLKINVX1 U980 ( .A(n151), .Y(n150) );
  XOR2X4 U981 ( .A(n30), .B(n6), .Y(product[22]) );
  CLKINVX1 U982 ( .A(n228), .Y(n229) );
  AO21X1 U983 ( .A0(n538), .A1(n545), .B0(n487), .Y(n393) );
  OAI22X1 U984 ( .A0(n535), .A1(n448), .B0(n542), .B1(n447), .Y(n354) );
  OAI22X2 U985 ( .A0(n562), .A1(n460), .B0(n543), .B1(n459), .Y(n366) );
  OAI22X1 U986 ( .A0(n534), .A1(n436), .B0(n541), .B1(n435), .Y(n342) );
  XNOR2X1 U987 ( .A(n559), .B(b[12]), .Y(n501) );
  AO21XL U988 ( .A0(n562), .A1(n543), .B0(n459), .Y(n365) );
  AO21XL U989 ( .A0(n535), .A1(n542), .B0(n445), .Y(n351) );
  CLKINVX1 U990 ( .A(n196), .Y(n197) );
  XOR2X1 U991 ( .A(n63), .B(n9), .Y(product[19]) );
  NAND2XL U992 ( .A(n167), .B(n62), .Y(n9) );
  XOR2X1 U993 ( .A(n70), .B(n10), .Y(product[18]) );
  NAND2XL U994 ( .A(n168), .B(n69), .Y(n10) );
  XOR3X2 U995 ( .A(n331), .B(n699), .C(n190), .Y(n186) );
  OA22XL U996 ( .A0(n534), .A1(n432), .B0(n541), .B1(n431), .Y(n699) );
  XNOR2XL U997 ( .A(n554), .B(b[12]), .Y(n431) );
  XOR2X1 U998 ( .A(n86), .B(n12), .Y(product[16]) );
  NAND2XL U999 ( .A(n170), .B(n85), .Y(n12) );
  AOI21XL U1000 ( .A0(n665), .A1(n87), .B0(n88), .Y(n86) );
  XOR2X1 U1001 ( .A(n77), .B(n11), .Y(product[17]) );
  NAND2XL U1002 ( .A(n74), .B(n76), .Y(n11) );
  AOI21XL U1003 ( .A0(n665), .A1(n82), .B0(n83), .Y(n77) );
  XNOR2XL U1004 ( .A(n665), .B(n13), .Y(product[15]) );
  NAND2XL U1005 ( .A(n87), .B(n90), .Y(n13) );
  XOR2X1 U1006 ( .A(n98), .B(n14), .Y(product[14]) );
  NAND2XL U1007 ( .A(n172), .B(n97), .Y(n14) );
  AOI21X1 U1008 ( .A0(n689), .A1(n99), .B0(n100), .Y(n98) );
  XOR2X1 U1009 ( .A(n105), .B(n15), .Y(product[13]) );
  NAND2XL U1010 ( .A(n102), .B(n104), .Y(n15) );
  AOI21XL U1011 ( .A0(n119), .A1(n106), .B0(n111), .Y(n105) );
  XOR2X1 U1012 ( .A(n114), .B(n16), .Y(product[12]) );
  NAND2XL U1013 ( .A(n174), .B(n113), .Y(n16) );
  AOI21XL U1014 ( .A0(n119), .A1(n115), .B0(n116), .Y(n114) );
  XNOR2XL U1015 ( .A(n119), .B(n17), .Y(product[11]) );
  NAND2XL U1016 ( .A(n115), .B(n118), .Y(n17) );
  XNOR2X1 U1017 ( .A(n125), .B(n18), .Y(product[10]) );
  NAND2XL U1018 ( .A(n176), .B(n124), .Y(n18) );
  OAI21XL U1019 ( .A0(n128), .A1(n126), .B0(n127), .Y(n125) );
  XOR2X1 U1020 ( .A(n128), .B(n19), .Y(product[9]) );
  NAND2XL U1021 ( .A(n177), .B(n127), .Y(n19) );
  INVXL U1022 ( .A(n126), .Y(n177) );
  XOR2X1 U1023 ( .A(n136), .B(n20), .Y(product[8]) );
  NAND2XL U1024 ( .A(n660), .B(n135), .Y(n20) );
  AOI21XL U1025 ( .A0(n141), .A1(n137), .B0(n138), .Y(n136) );
  XNOR2X1 U1026 ( .A(n141), .B(n21), .Y(product[7]) );
  NAND2XL U1027 ( .A(n137), .B(n140), .Y(n21) );
  XNOR2X1 U1028 ( .A(n147), .B(n22), .Y(product[6]) );
  OAI21XL U1029 ( .A0(n150), .A1(n148), .B0(n149), .Y(n147) );
  NAND2XL U1030 ( .A(n180), .B(n146), .Y(n22) );
  XOR2X1 U1031 ( .A(n150), .B(n23), .Y(product[5]) );
  NAND2X1 U1032 ( .A(n181), .B(n149), .Y(n23) );
  CLKINVX1 U1033 ( .A(n148), .Y(n181) );
  XOR2XL U1034 ( .A(n154), .B(n24), .Y(product[4]) );
  NAND2X1 U1035 ( .A(n182), .B(n153), .Y(n24) );
  XNOR2XL U1036 ( .A(n25), .B(n159), .Y(product[3]) );
  NAND2X1 U1037 ( .A(n661), .B(n158), .Y(n25) );
  XOR2X1 U1038 ( .A(n26), .B(n163), .Y(product[2]) );
  NAND2X1 U1039 ( .A(n184), .B(n161), .Y(n26) );
  CLKINVX1 U1040 ( .A(n160), .Y(n184) );
  XNOR2X1 U1041 ( .A(n553), .B(b[3]), .Y(n427) );
  INVXL U1042 ( .A(n554), .Y(n547) );
  INVXL U1043 ( .A(n556), .Y(n549) );
  OAI22X1 U1044 ( .A0(n537), .A1(n484), .B0(n544), .B1(n483), .Y(n390) );
  XNOR2X1 U1045 ( .A(n554), .B(n521), .Y(n437) );
  XNOR2X1 U1046 ( .A(n554), .B(b[2]), .Y(n441) );
  XNOR2X1 U1047 ( .A(n554), .B(n658), .Y(n436) );
  XNOR2X1 U1048 ( .A(n559), .B(n519), .Y(n505) );
  OAI22X1 U1049 ( .A0(n538), .A1(n497), .B0(n545), .B1(n496), .Y(n403) );
  XNOR2X1 U1050 ( .A(n557), .B(n526), .Y(n484) );
  XNOR2X1 U1051 ( .A(n557), .B(b[2]), .Y(n483) );
  XNOR2X1 U1052 ( .A(n553), .B(n658), .Y(n423) );
  NOR2X2 U1053 ( .A(n321), .B(n322), .Y(n152) );
  XNOR2X1 U1054 ( .A(n558), .B(n526), .Y(n498) );
  NAND2X1 U1055 ( .A(n321), .B(n322), .Y(n153) );
  XNOR2X1 U1056 ( .A(n558), .B(b[2]), .Y(n497) );
  NOR2BX2 U1057 ( .AN(n1), .B(n540), .Y(n337) );
  OAI22X1 U1058 ( .A0(n539), .A1(n504), .B0(n503), .B1(n546), .Y(n410) );
  OAI22X1 U1059 ( .A0(n538), .A1(n496), .B0(n545), .B1(n495), .Y(n402) );
  NOR2BX2 U1060 ( .AN(n1), .B(n543), .Y(n378) );
  NAND2BXL U1061 ( .AN(n1), .B(n556), .Y(n472) );
  NAND2BXL U1062 ( .AN(n1), .B(n555), .Y(n458) );
  OAI22X1 U1063 ( .A0(n538), .A1(n499), .B0(n545), .B1(n498), .Y(n405) );
  XNOR2X1 U1064 ( .A(n558), .B(n1), .Y(n499) );
  OAI22X1 U1065 ( .A0(n538), .A1(n498), .B0(n545), .B1(n497), .Y(n404) );
  NAND2X2 U1066 ( .A(n533), .B(n572), .Y(n565) );
  CLKINVX1 U1067 ( .A(a[0]), .Y(n572) );
  NOR2BXL U1068 ( .AN(n1), .B(n546), .Y(product[0]) );
endmodule


module geofence_DW_mult_uns_6 ( a, b, product );
  input [11:0] a;
  input [11:0] b;
  output [23:0] product;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n19, n20, n21, n22, n23, n24, n25, n26, n27, n29, n30, n31, n32,
         n37, n40, n42, n43, n44, n45, n46, n47, n51, n53, n54, n55, n56, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n80, n81, n82, n83, n84, n85, n86, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n99, n100, n101, n103, n104, n107, n108,
         n109, n110, n111, n112, n113, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n148, n149, n150, n151, n152, n153, n154, n157, n158,
         n159, n160, n161, n162, n163, n168, n170, n171, n172, n173, n174,
         n175, n176, n177, n179, n180, n181, n182, n183, n184, n186, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n322, n323, n324, n325, n326, n327, n328, n329, n330, n331, n332,
         n333, n334, n335, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377,
         n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388,
         n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399,
         n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410,
         n411, n412, n413, n414, n415, n416, n417, n418, n419, n420, n421,
         n422, n423, n424, n425, n426, n427, n428, n429, n430, n431, n432,
         n433, n434, n435, n436, n437, n438, n439, n440, n441, n442, n443,
         n444, n445, n446, n447, n448, n449, n450, n451, n452, n453, n454,
         n455, n456, n457, n458, n459, n460, n461, n462, n463, n464, n465,
         n466, n467, n468, n469, n470, n471, n472, n473, n474, n475, n476,
         n477, n478, n479, n480, n481, n482, n483, n484, n485, n486, n487,
         n488, n489, n490, n491, n492, n493, n494, n495, n496, n497, n498,
         n499, n500, n501, n502, n503, n504, n505, n507, n508, n509, n510,
         n511, n512, n513, n514, n515, n518, n519, n520, n521, n522, n524,
         n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, n535,
         n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, n546,
         n547, n548, n549, n550, n551, n552, n553, n554, n556, n557, n558,
         n559, n560, n561, n613, n614, n615, n616, n617, n618, n619, n620,
         n621, n622, n623, n624, n625, n626, n627, n628, n629, n630, n631,
         n632, n633, n634, n635, n636, n637, n638, n639, n640, n641, n642,
         n643, n644, n645, n646, n647, n648, n649, n650, n651, n652, n653;

  NOR2X8 U523 ( .A(n284), .B(n291), .Y(n123) );
  CLKINVX1 U524 ( .A(n109), .Y(n107) );
  AO21X4 U525 ( .A0(n119), .A1(n99), .B0(n100), .Y(n650) );
  NOR2X4 U526 ( .A(n322), .B(n327), .Y(n157) );
  ADDFHX4 U527 ( .A(n369), .B(n393), .CI(n405), .CO(n258), .S(n259) );
  OAI21X2 U528 ( .A0(n4), .A1(n46), .B0(n47), .Y(n45) );
  NOR2X8 U529 ( .A(n292), .B(n299), .Y(n126) );
  NAND2BX4 U530 ( .AN(n1), .B(n547), .Y(n492) );
  NAND2BX4 U531 ( .AN(n1), .B(n543), .Y(n440) );
  OAI21X2 U532 ( .A0(n96), .A1(n104), .B0(n97), .Y(n95) );
  INVX8 U533 ( .A(n134), .Y(n132) );
  ADDFHX4 U534 ( .A(n376), .B(n412), .CI(n400), .CO(n313), .S(n314) );
  NOR2X8 U535 ( .A(n312), .B(n315), .Y(n145) );
  AO21X4 U536 ( .A0(n141), .A1(n137), .B0(n138), .Y(n651) );
  INVX6 U537 ( .A(n142), .Y(n141) );
  XNOR2X4 U538 ( .A(n546), .B(n1), .Y(n478) );
  NOR2X6 U539 ( .A(n123), .B(n127), .Y(n640) );
  NOR2X8 U540 ( .A(n112), .B(n117), .Y(n110) );
  OAI22X4 U541 ( .A0(n525), .A1(n538), .B0(n532), .B1(n453), .Y(n324) );
  NAND2BX4 U542 ( .AN(n1), .B(n544), .Y(n453) );
  AOI21X4 U543 ( .A0(n94), .A1(n111), .B0(n95), .Y(n93) );
  NOR2X4 U544 ( .A(n96), .B(n103), .Y(n94) );
  CLKINVX2 U545 ( .A(n75), .Y(n74) );
  ADDFHX2 U546 ( .A(n224), .B(n215), .CI(n222), .CO(n212), .S(n213) );
  ADDFHX4 U547 ( .A(n382), .B(n281), .CI(n272), .CO(n267), .S(n268) );
  XNOR2X2 U548 ( .A(n141), .B(n21), .Y(product[7]) );
  NAND2X2 U549 ( .A(n179), .B(n140), .Y(n21) );
  NOR2X6 U550 ( .A(n274), .B(n283), .Y(n117) );
  INVX4 U551 ( .A(n647), .Y(n619) );
  ADDFHX4 U552 ( .A(n279), .B(n270), .CI(n277), .CO(n265), .S(n266) );
  NOR2X2 U553 ( .A(n75), .B(n68), .Y(n66) );
  NOR2X2 U554 ( .A(n220), .B(n213), .Y(n75) );
  NOR2X4 U555 ( .A(n205), .B(n212), .Y(n68) );
  BUFX12 U556 ( .A(n560), .Y(n535) );
  XNOR2X4 U557 ( .A(n545), .B(n1), .Y(n465) );
  INVX1 U558 ( .A(n110), .Y(n108) );
  NAND2X4 U559 ( .A(n94), .B(n110), .Y(n92) );
  CLKINVX4 U560 ( .A(n129), .Y(n128) );
  NOR2X6 U561 ( .A(n300), .B(n305), .Y(n134) );
  OAI22X4 U562 ( .A0(n529), .A1(n493), .B0(n542), .B1(n536), .Y(n406) );
  NAND2BX4 U563 ( .AN(n1), .B(n545), .Y(n466) );
  INVX2 U564 ( .A(n126), .Y(n177) );
  NAND2X1 U565 ( .A(n43), .B(n614), .Y(n615) );
  NAND2X4 U566 ( .A(n613), .B(n7), .Y(n616) );
  NAND2X4 U567 ( .A(n615), .B(n616), .Y(product[21]) );
  INVX2 U568 ( .A(n43), .Y(n613) );
  INVXL U569 ( .A(n7), .Y(n614) );
  AOI21X2 U570 ( .A0(n3), .A1(n44), .B0(n45), .Y(n43) );
  OR2X1 U571 ( .A(n529), .B(n501), .Y(n617) );
  OR2X1 U572 ( .A(n500), .B(n536), .Y(n618) );
  NAND2X4 U573 ( .A(n617), .B(n618), .Y(n414) );
  XNOR2X2 U574 ( .A(n548), .B(n513), .Y(n500) );
  ADDFHX4 U575 ( .A(n390), .B(n414), .CI(n402), .CO(n319), .S(n320) );
  NAND2X2 U576 ( .A(n647), .B(n11), .Y(n621) );
  NAND2X6 U577 ( .A(n619), .B(n620), .Y(n622) );
  NAND2X6 U578 ( .A(n621), .B(n622), .Y(product[17]) );
  INVX1 U579 ( .A(n11), .Y(n620) );
  AO21X4 U580 ( .A0(n3), .A1(n82), .B0(n83), .Y(n647) );
  OR2X4 U581 ( .A(n529), .B(n502), .Y(n623) );
  OR2X1 U582 ( .A(n501), .B(n536), .Y(n624) );
  NAND2X4 U583 ( .A(n623), .B(n624), .Y(n415) );
  XNOR2X2 U584 ( .A(n548), .B(n515), .Y(n502) );
  XNOR2X2 U585 ( .A(n548), .B(n514), .Y(n501) );
  BUFX8 U586 ( .A(n415), .Y(n632) );
  OR2X6 U587 ( .A(n526), .B(n465), .Y(n625) );
  OR2X1 U588 ( .A(n533), .B(n464), .Y(n626) );
  NAND2X6 U589 ( .A(n625), .B(n626), .Y(n375) );
  BUFX4 U590 ( .A(n551), .Y(n526) );
  BUFX3 U591 ( .A(n558), .Y(n533) );
  XNOR2XL U592 ( .A(n545), .B(b[1]), .Y(n464) );
  OR2X4 U593 ( .A(n529), .B(n494), .Y(n627) );
  OR2X1 U594 ( .A(n493), .B(n536), .Y(n628) );
  NAND2X4 U595 ( .A(n627), .B(n628), .Y(n407) );
  XNOR2X2 U596 ( .A(n548), .B(b[11]), .Y(n493) );
  ADDFHX4 U597 ( .A(n383), .B(n359), .CI(n407), .CO(n279), .S(n280) );
  OR2X4 U598 ( .A(n529), .B(n495), .Y(n629) );
  OR2X1 U599 ( .A(n494), .B(n536), .Y(n630) );
  NAND2X4 U600 ( .A(n629), .B(n630), .Y(n408) );
  XNOR2X2 U601 ( .A(n548), .B(n508), .Y(n495) );
  XNOR2X2 U602 ( .A(n548), .B(n507), .Y(n494) );
  ADDFHX4 U603 ( .A(n348), .B(n372), .CI(n408), .CO(n289), .S(n290) );
  XOR2X4 U604 ( .A(n347), .B(n323), .Y(n282) );
  CLKINVX6 U605 ( .A(n631), .Y(n281) );
  NAND2X4 U606 ( .A(n347), .B(n323), .Y(n631) );
  OAI22X4 U607 ( .A0(n524), .A1(n537), .B0(n531), .B1(n440), .Y(n323) );
  ADDFHX2 U608 ( .A(n395), .B(n371), .CI(n282), .CO(n277), .S(n278) );
  ADDFHX4 U609 ( .A(n335), .B(n358), .CI(n406), .CO(n271), .S(n272) );
  INVX4 U610 ( .A(n89), .Y(n171) );
  NOR2X4 U611 ( .A(n231), .B(n240), .Y(n89) );
  INVX3 U612 ( .A(n160), .Y(n184) );
  NOR2X2 U613 ( .A(n416), .B(n633), .Y(n160) );
  OAI22X2 U614 ( .A0(n528), .A1(n541), .B0(n535), .B1(n492), .Y(n327) );
  XNOR2X2 U615 ( .A(n547), .B(n1), .Y(n491) );
  XNOR2X2 U616 ( .A(n548), .B(n1), .Y(n504) );
  BUFX12 U617 ( .A(n553), .Y(n528) );
  XOR2X1 U618 ( .A(n154), .B(n24), .Y(product[4]) );
  XOR2X1 U619 ( .A(n150), .B(n23), .Y(product[5]) );
  BUFX6 U620 ( .A(n404), .Y(n633) );
  OAI22X4 U621 ( .A0(n529), .A1(n542), .B0(n505), .B1(n536), .Y(n328) );
  NAND2BX1 U622 ( .AN(n1), .B(n548), .Y(n505) );
  OAI22X4 U623 ( .A0(n529), .A1(n504), .B0(n503), .B1(n536), .Y(n417) );
  NOR2X8 U624 ( .A(n241), .B(n252), .Y(n96) );
  ADDFHX4 U625 ( .A(n257), .B(n265), .CI(n255), .CO(n252), .S(n253) );
  OAI22X2 U626 ( .A0(n529), .A1(n503), .B0(n502), .B1(n536), .Y(n416) );
  BUFX20 U627 ( .A(n561), .Y(n536) );
  ADDHX2 U628 ( .A(n375), .B(n325), .CO(n309), .S(n310) );
  XOR2X2 U629 ( .A(n26), .B(n163), .Y(product[2]) );
  CMPR32X2 U630 ( .A(n250), .B(n333), .C(n367), .CO(n238), .S(n239) );
  ADDHX2 U631 ( .A(n361), .B(n324), .CO(n297), .S(n298) );
  INVX1 U632 ( .A(n74), .Y(n73) );
  NOR2X4 U633 ( .A(n230), .B(n221), .Y(n84) );
  NOR2X2 U634 ( .A(n145), .B(n148), .Y(n143) );
  NAND2X2 U635 ( .A(n417), .B(n328), .Y(n163) );
  NAND2X6 U636 ( .A(n292), .B(n299), .Y(n127) );
  XNOR2X2 U637 ( .A(n3), .B(n13), .Y(product[15]) );
  NOR2X1 U638 ( .A(n530), .B(n426), .Y(n334) );
  AOI21X1 U639 ( .A0(n634), .A1(n60), .B0(n51), .Y(n47) );
  AND2X4 U640 ( .A(n176), .B(n124), .Y(n637) );
  CLKINVX1 U641 ( .A(b[1]), .Y(n427) );
  XNOR2X1 U642 ( .A(n544), .B(n512), .Y(n447) );
  XNOR2X1 U643 ( .A(n544), .B(n513), .Y(n448) );
  XNOR2X1 U644 ( .A(n544), .B(n514), .Y(n449) );
  CLKBUFX3 U645 ( .A(b[4]), .Y(n513) );
  XNOR2X1 U646 ( .A(n545), .B(n514), .Y(n462) );
  XNOR2X1 U647 ( .A(n546), .B(n513), .Y(n474) );
  XNOR2X1 U648 ( .A(n545), .B(n515), .Y(n463) );
  CLKBUFX3 U649 ( .A(a[11]), .Y(n543) );
  ADDFXL U650 ( .A(n227), .B(n236), .CI(n225), .CO(n222), .S(n223) );
  ADDFXL U651 ( .A(n219), .B(n226), .CI(n217), .CO(n214), .S(n215) );
  ADDFXL U652 ( .A(n211), .B(n364), .CI(n352), .CO(n208), .S(n209) );
  CLKINVX1 U653 ( .A(n210), .Y(n211) );
  ADDFXL U654 ( .A(n339), .B(n363), .CI(n203), .CO(n200), .S(n201) );
  ADDFXL U655 ( .A(n246), .B(n237), .CI(n235), .CO(n232), .S(n233) );
  ADDFXL U656 ( .A(n368), .B(n249), .CI(n260), .CO(n244), .S(n245) );
  OAI22X1 U657 ( .A0(n526), .A1(n539), .B0(n533), .B1(n466), .Y(n325) );
  ADDFHX2 U658 ( .A(n297), .B(n290), .CI(n295), .CO(n285), .S(n286) );
  ADDFX2 U659 ( .A(n289), .B(n287), .CI(n280), .CO(n275), .S(n276) );
  ADDFX2 U660 ( .A(n411), .B(n387), .CI(n399), .CO(n307), .S(n308) );
  OAI22XL U661 ( .A0(n527), .A1(n476), .B0(n534), .B1(n475), .Y(n387) );
  OAI22XL U662 ( .A0(n528), .A1(n487), .B0(n535), .B1(n486), .Y(n399) );
  OAI22X1 U663 ( .A0(n529), .A1(n498), .B0(n497), .B1(n536), .Y(n411) );
  ADDFX2 U664 ( .A(n362), .B(n386), .CI(n410), .CO(n303), .S(n304) );
  OAI22XL U665 ( .A0(n527), .A1(n475), .B0(n534), .B1(n474), .Y(n386) );
  NOR2BX1 U666 ( .AN(n1), .B(n532), .Y(n362) );
  ADDFHX2 U667 ( .A(n398), .B(n374), .CI(n309), .CO(n301), .S(n302) );
  OAI22XL U668 ( .A0(n526), .A1(n464), .B0(n533), .B1(n463), .Y(n374) );
  OAI22XL U669 ( .A0(n528), .A1(n486), .B0(n535), .B1(n485), .Y(n398) );
  CLKBUFX3 U670 ( .A(n549), .Y(n524) );
  CLKBUFX3 U671 ( .A(n537), .Y(n530) );
  CLKBUFX3 U672 ( .A(n550), .Y(n525) );
  CLKBUFX3 U673 ( .A(n557), .Y(n532) );
  ADDFXL U674 ( .A(n197), .B(n350), .CI(n338), .CO(n194), .S(n195) );
  CLKINVX1 U675 ( .A(n196), .Y(n197) );
  ADDFXL U676 ( .A(n202), .B(n195), .CI(n200), .CO(n192), .S(n193) );
  INVX3 U677 ( .A(n111), .Y(n109) );
  NOR2X2 U678 ( .A(n253), .B(n263), .Y(n103) );
  ADDFXL U679 ( .A(n216), .B(n207), .CI(n214), .CO(n204), .S(n205) );
  ADDFXL U680 ( .A(n208), .B(n206), .CI(n201), .CO(n198), .S(n199) );
  ADDFHX2 U681 ( .A(n278), .B(n285), .CI(n276), .CO(n273), .S(n274) );
  NOR2BX1 U682 ( .AN(n1), .B(n535), .Y(n404) );
  XNOR3X1 U683 ( .A(n329), .B(n645), .C(n190), .Y(n186) );
  ADDFXL U684 ( .A(n349), .B(n191), .CI(n194), .CO(n188), .S(n189) );
  CLKINVX1 U685 ( .A(n42), .Y(n40) );
  NOR2X1 U686 ( .A(n80), .B(n73), .Y(n71) );
  OAI21X1 U687 ( .A0(n81), .A1(n73), .B0(n76), .Y(n72) );
  NOR2X1 U688 ( .A(n5), .B(n61), .Y(n55) );
  OAI21X1 U689 ( .A0(n4), .A1(n61), .B0(n62), .Y(n56) );
  NAND2X1 U690 ( .A(n230), .B(n221), .Y(n85) );
  NOR2X1 U691 ( .A(n108), .B(n101), .Y(n99) );
  OAI21X1 U692 ( .A0(n109), .A1(n101), .B0(n104), .Y(n100) );
  NAND2X2 U693 ( .A(n253), .B(n263), .Y(n104) );
  NAND2X2 U694 ( .A(n284), .B(n291), .Y(n124) );
  CLKINVX1 U695 ( .A(n123), .Y(n176) );
  NAND2X1 U696 ( .A(n181), .B(n149), .Y(n23) );
  CLKINVX1 U697 ( .A(n148), .Y(n181) );
  XOR2X1 U698 ( .A(n638), .B(n22), .Y(product[6]) );
  XNOR2X1 U699 ( .A(n651), .B(n20), .Y(product[8]) );
  XNOR2X1 U700 ( .A(n119), .B(n17), .Y(product[11]) );
  XNOR2X1 U701 ( .A(n25), .B(n159), .Y(product[3]) );
  NAND2X1 U702 ( .A(n183), .B(n158), .Y(n25) );
  NAND2X1 U703 ( .A(n182), .B(n153), .Y(n24) );
  NAND2X1 U704 ( .A(n173), .B(n104), .Y(n15) );
  AOI21X2 U705 ( .A0(n3), .A1(n55), .B0(n56), .Y(n54) );
  OR2X1 U706 ( .A(n198), .B(n193), .Y(n634) );
  INVX1 U707 ( .A(n83), .Y(n81) );
  NOR2X1 U708 ( .A(n530), .B(n427), .Y(n250) );
  OR2X1 U709 ( .A(n192), .B(n189), .Y(n635) );
  INVX1 U710 ( .A(n103), .Y(n173) );
  CLKINVX1 U711 ( .A(n62), .Y(n60) );
  NOR2X1 U712 ( .A(n204), .B(n199), .Y(n61) );
  CLKINVX1 U713 ( .A(n61), .Y(n59) );
  CLKINVX1 U714 ( .A(n543), .Y(n537) );
  CLKINVX1 U715 ( .A(n548), .Y(n542) );
  OAI22X1 U716 ( .A0(n529), .A1(n496), .B0(n495), .B1(n536), .Y(n409) );
  XNOR2X1 U717 ( .A(n548), .B(n509), .Y(n496) );
  XNOR2X1 U718 ( .A(a[2]), .B(a[1]), .Y(n560) );
  XNOR2X1 U719 ( .A(n548), .B(n510), .Y(n497) );
  BUFX4 U720 ( .A(a[1]), .Y(n548) );
  XNOR2X1 U721 ( .A(n544), .B(n508), .Y(n443) );
  CLKINVX1 U722 ( .A(n544), .Y(n538) );
  CLKBUFX3 U723 ( .A(a[9]), .Y(n544) );
  INVX6 U724 ( .A(a[0]), .Y(n561) );
  INVX4 U725 ( .A(n124), .Y(n641) );
  INVX4 U726 ( .A(n135), .Y(n133) );
  NAND2X6 U727 ( .A(n300), .B(n305), .Y(n135) );
  NOR2X6 U728 ( .A(n320), .B(n321), .Y(n152) );
  AO21X4 U729 ( .A0(n529), .A1(n536), .B0(n542), .Y(n405) );
  OAI22X1 U730 ( .A0(n529), .A1(n497), .B0(n496), .B1(n536), .Y(n410) );
  XNOR2X4 U731 ( .A(n650), .B(n14), .Y(product[14]) );
  INVX8 U732 ( .A(n120), .Y(n119) );
  NAND2X2 U733 ( .A(n132), .B(n137), .Y(n130) );
  OR2X8 U734 ( .A(n639), .B(n116), .Y(n648) );
  NAND2X2 U735 ( .A(n320), .B(n321), .Y(n153) );
  CLKAND2X12 U736 ( .A(n119), .B(n115), .Y(n639) );
  OR2X8 U737 ( .A(n640), .B(n641), .Y(n122) );
  OAI22X2 U738 ( .A0(n528), .A1(n491), .B0(n535), .B1(n490), .Y(n403) );
  XOR2X4 U739 ( .A(n636), .B(n637), .Y(product[10]) );
  OAI21X4 U740 ( .A0(n128), .A1(n126), .B0(n127), .Y(n636) );
  XNOR2X4 U741 ( .A(n648), .B(n16), .Y(product[12]) );
  NOR2X2 U742 ( .A(n5), .B(n46), .Y(n44) );
  OAI22X4 U743 ( .A0(n524), .A1(n439), .B0(n531), .B1(n438), .Y(n347) );
  OAI21X4 U744 ( .A0(n112), .A1(n118), .B0(n113), .Y(n111) );
  NOR2BX4 U745 ( .AN(n1), .B(n531), .Y(n348) );
  CLKBUFX20 U746 ( .A(b[0]), .Y(n1) );
  ADDFHX4 U747 ( .A(n304), .B(n307), .CI(n302), .CO(n299), .S(n300) );
  OA21XL U748 ( .A0(n150), .A1(n148), .B0(n149), .Y(n638) );
  NOR2X6 U749 ( .A(n306), .B(n311), .Y(n139) );
  ADDFHX4 U750 ( .A(n310), .B(n313), .CI(n308), .CO(n305), .S(n306) );
  XNOR2X4 U751 ( .A(n543), .B(n1), .Y(n439) );
  NAND2X2 U752 ( .A(n322), .B(n327), .Y(n158) );
  ADDHX2 U753 ( .A(n632), .B(n403), .CO(n321), .S(n322) );
  OAI22X4 U754 ( .A0(n525), .A1(n452), .B0(n532), .B1(n451), .Y(n361) );
  OAI22X2 U755 ( .A0(n529), .A1(n499), .B0(n498), .B1(n536), .Y(n412) );
  NAND2BX4 U756 ( .AN(n1), .B(n546), .Y(n479) );
  ADDFHX4 U757 ( .A(n413), .B(n401), .CI(n318), .CO(n315), .S(n316) );
  OAI21X2 U758 ( .A0(n145), .A1(n149), .B0(n146), .Y(n144) );
  NAND2X4 U759 ( .A(n316), .B(n319), .Y(n149) );
  AOI21X4 U760 ( .A0(n143), .A1(n151), .B0(n144), .Y(n142) );
  NAND2X4 U761 ( .A(n312), .B(n315), .Y(n146) );
  NOR2X6 U762 ( .A(n316), .B(n319), .Y(n148) );
  OAI22X4 U763 ( .A0(n527), .A1(n478), .B0(n534), .B1(n477), .Y(n389) );
  BUFX20 U764 ( .A(n91), .Y(n3) );
  OAI21X4 U765 ( .A0(n92), .A1(n120), .B0(n93), .Y(n91) );
  XOR2X4 U766 ( .A(n54), .B(n8), .Y(product[20]) );
  AOI21X4 U767 ( .A0(n83), .A1(n66), .B0(n67), .Y(n4) );
  OAI22X1 U768 ( .A0(n528), .A1(n480), .B0(n535), .B1(n541), .Y(n392) );
  XOR2X1 U769 ( .A(n128), .B(n19), .Y(product[9]) );
  INVX3 U770 ( .A(n139), .Y(n137) );
  ADDFHX2 U771 ( .A(n345), .B(n271), .CI(n261), .CO(n256), .S(n257) );
  NOR2BX2 U772 ( .AN(n1), .B(n530), .Y(n335) );
  NAND2X2 U773 ( .A(n241), .B(n252), .Y(n97) );
  XOR2X4 U774 ( .A(n86), .B(n12), .Y(product[16]) );
  AOI21X4 U775 ( .A0(n3), .A1(n171), .B0(n88), .Y(n86) );
  AO21X4 U776 ( .A0(n119), .A1(n110), .B0(n107), .Y(n649) );
  ADDFHX4 U777 ( .A(n388), .B(n317), .CI(n314), .CO(n311), .S(n312) );
  ADDHX2 U778 ( .A(n389), .B(n326), .CO(n317), .S(n318) );
  XOR2X4 U779 ( .A(n70), .B(n10), .Y(product[18]) );
  AOI21X4 U780 ( .A0(n3), .A1(n71), .B0(n72), .Y(n70) );
  ADDFHX4 U781 ( .A(n269), .B(n259), .CI(n267), .CO(n254), .S(n255) );
  INVX3 U782 ( .A(n173), .Y(n101) );
  XNOR2X4 U783 ( .A(n544), .B(n1), .Y(n452) );
  NAND2BX4 U784 ( .AN(n646), .B(n561), .Y(n554) );
  XNOR2X4 U785 ( .A(a[0]), .B(a[1]), .Y(n646) );
  XOR2X4 U786 ( .A(n63), .B(n9), .Y(product[19]) );
  AOI21X2 U787 ( .A0(n3), .A1(n64), .B0(n65), .Y(n63) );
  ADDFHX4 U788 ( .A(n296), .B(n301), .CI(n294), .CO(n291), .S(n292) );
  INVX4 U789 ( .A(n151), .Y(n150) );
  NAND2X4 U790 ( .A(n306), .B(n311), .Y(n140) );
  NAND2X4 U791 ( .A(n274), .B(n283), .Y(n118) );
  ADDFHX4 U792 ( .A(n258), .B(n247), .CI(n256), .CO(n242), .S(n243) );
  NAND2X2 U793 ( .A(n264), .B(n273), .Y(n113) );
  BUFX20 U794 ( .A(n554), .Y(n529) );
  ADDFHX4 U795 ( .A(n244), .B(n242), .CI(n233), .CO(n230), .S(n231) );
  ADDFHX4 U796 ( .A(n288), .B(n293), .CI(n286), .CO(n283), .S(n284) );
  ADDFHX4 U797 ( .A(n409), .B(n298), .CI(n303), .CO(n293), .S(n294) );
  ADDFHX4 U798 ( .A(n245), .B(n254), .CI(n243), .CO(n240), .S(n241) );
  INVXL U799 ( .A(n117), .Y(n115) );
  OAI22X1 U800 ( .A0(n527), .A1(n540), .B0(n534), .B1(n479), .Y(n326) );
  NOR2X6 U801 ( .A(n264), .B(n273), .Y(n112) );
  ADDFHX4 U802 ( .A(n268), .B(n275), .CI(n266), .CO(n263), .S(n264) );
  ADDFX2 U803 ( .A(n251), .B(n357), .CI(n381), .CO(n260), .S(n261) );
  INVX1 U804 ( .A(n547), .Y(n541) );
  XNOR2X1 U805 ( .A(n547), .B(n511), .Y(n485) );
  INVXL U806 ( .A(n642), .Y(n159) );
  OAI22X1 U807 ( .A0(n525), .A1(n448), .B0(n532), .B1(n447), .Y(n357) );
  XNOR2X1 U808 ( .A(n543), .B(b[1]), .Y(n438) );
  OA21X4 U809 ( .A0(n160), .A1(n163), .B0(n161), .Y(n642) );
  NAND2X2 U810 ( .A(n82), .B(n66), .Y(n5) );
  AOI21X4 U811 ( .A0(n132), .A1(n138), .B0(n133), .Y(n131) );
  XNOR2X1 U812 ( .A(n547), .B(b[1]), .Y(n490) );
  NAND2XL U813 ( .A(n520), .B(n558), .Y(n551) );
  XNOR2XL U814 ( .A(n546), .B(n507), .Y(n468) );
  OAI22XL U815 ( .A0(n524), .A1(n436), .B0(n531), .B1(n435), .Y(n344) );
  INVXL U816 ( .A(n228), .Y(n229) );
  ADDFHX1 U817 ( .A(n229), .B(n378), .CI(n366), .CO(n226), .S(n227) );
  XNOR2XL U818 ( .A(n543), .B(n513), .Y(n435) );
  XNOR2X4 U819 ( .A(n649), .B(n15), .Y(product[13]) );
  INVX1 U820 ( .A(n27), .Y(product[1]) );
  NAND2XL U821 ( .A(n634), .B(n635), .Y(n37) );
  INVXL U822 ( .A(n546), .Y(n540) );
  OAI21X4 U823 ( .A0(n142), .A1(n130), .B0(n131), .Y(n129) );
  AOI21X4 U824 ( .A0(n129), .A1(n121), .B0(n122), .Y(n120) );
  NOR2X2 U825 ( .A(n123), .B(n126), .Y(n121) );
  OAI21X4 U826 ( .A0(n84), .A1(n90), .B0(n85), .Y(n83) );
  NAND2X2 U827 ( .A(n231), .B(n240), .Y(n90) );
  OAI21X2 U828 ( .A0(n76), .A1(n68), .B0(n69), .Y(n67) );
  INVX3 U829 ( .A(n140), .Y(n138) );
  NOR2X2 U830 ( .A(n89), .B(n84), .Y(n82) );
  INVXL U831 ( .A(n96), .Y(n172) );
  INVXL U832 ( .A(n118), .Y(n116) );
  AOI2BB1XL U833 ( .A0N(n37), .A1N(n62), .B0(n644), .Y(n643) );
  AO21XL U834 ( .A0(n51), .A1(n635), .B0(n40), .Y(n644) );
  INVXL U835 ( .A(n84), .Y(n170) );
  INVXL U836 ( .A(n68), .Y(n168) );
  OR2XL U837 ( .A(n37), .B(n61), .Y(n652) );
  OAI21X4 U838 ( .A0(n154), .A1(n152), .B0(n153), .Y(n151) );
  OA21X4 U839 ( .A0(n642), .A1(n157), .B0(n158), .Y(n154) );
  INVXL U840 ( .A(n145), .Y(n180) );
  XNOR2XL U841 ( .A(n546), .B(n515), .Y(n476) );
  INVXL U842 ( .A(n515), .Y(n426) );
  NAND2XL U843 ( .A(n522), .B(n560), .Y(n553) );
  XOR2XL U844 ( .A(a[2]), .B(a[3]), .Y(n522) );
  NAND2XL U845 ( .A(n198), .B(n193), .Y(n53) );
  XNOR2XL U846 ( .A(a[4]), .B(a[3]), .Y(n559) );
  XNOR2XL U847 ( .A(a[6]), .B(a[5]), .Y(n558) );
  CLKBUFX3 U848 ( .A(a[7]), .Y(n545) );
  XNOR2XL U849 ( .A(n545), .B(n508), .Y(n456) );
  XNOR2XL U850 ( .A(n545), .B(n507), .Y(n455) );
  INVXL U851 ( .A(n507), .Y(n418) );
  OAI22XL U852 ( .A0(n527), .A1(n477), .B0(n534), .B1(n476), .Y(n388) );
  NOR2XL U853 ( .A(n417), .B(n328), .Y(n162) );
  ADDFHX2 U854 ( .A(n360), .B(n384), .CI(n396), .CO(n287), .S(n288) );
  OAI22XL U855 ( .A0(n528), .A1(n484), .B0(n535), .B1(n483), .Y(n396) );
  OAI22X2 U856 ( .A0(n525), .A1(n451), .B0(n532), .B1(n450), .Y(n360) );
  XNOR2XL U857 ( .A(n546), .B(n509), .Y(n470) );
  XNOR2XL U858 ( .A(n545), .B(n509), .Y(n457) );
  ADDFHX2 U859 ( .A(n334), .B(n251), .CI(n392), .CO(n248), .S(n249) );
  CLKINVX1 U860 ( .A(n250), .Y(n251) );
  INVXL U861 ( .A(n514), .Y(n425) );
  XNOR2XL U862 ( .A(n543), .B(n515), .Y(n437) );
  XNOR2XL U863 ( .A(n543), .B(n514), .Y(n436) );
  ADDFHX2 U864 ( .A(n356), .B(n380), .CI(n344), .CO(n246), .S(n247) );
  INVXL U865 ( .A(n512), .Y(n423) );
  XNOR2XL U866 ( .A(n543), .B(n512), .Y(n434) );
  XNOR2XL U867 ( .A(n543), .B(n511), .Y(n433) );
  AO21XL U868 ( .A0(n526), .A1(n533), .B0(n539), .Y(n363) );
  XNOR2XL U869 ( .A(n543), .B(n510), .Y(n432) );
  XNOR2XL U870 ( .A(n543), .B(n509), .Y(n431) );
  OAI22XL U871 ( .A0(n524), .A1(n428), .B0(n531), .B1(n537), .Y(n645) );
  XNOR2XL U872 ( .A(n543), .B(n508), .Y(n430) );
  XNOR2XL U873 ( .A(n543), .B(n507), .Y(n429) );
  XNOR2XL U874 ( .A(n546), .B(b[11]), .Y(n467) );
  XNOR2XL U875 ( .A(n545), .B(b[11]), .Y(n454) );
  NAND2BXL U876 ( .AN(n162), .B(n163), .Y(n27) );
  CLKINVX1 U877 ( .A(n5), .Y(n64) );
  CLKINVX1 U878 ( .A(n4), .Y(n65) );
  CLKINVX1 U879 ( .A(n82), .Y(n80) );
  CLKINVX1 U880 ( .A(n112), .Y(n174) );
  CLKINVX1 U881 ( .A(n90), .Y(n88) );
  NOR2XL U882 ( .A(n5), .B(n652), .Y(n31) );
  NAND2X1 U883 ( .A(n59), .B(n634), .Y(n46) );
  OAI21XL U884 ( .A0(n4), .A1(n652), .B0(n643), .Y(n32) );
  ADDFXL U885 ( .A(n385), .B(n373), .CI(n397), .CO(n295), .S(n296) );
  OAI22XL U886 ( .A0(n527), .A1(n474), .B0(n534), .B1(n473), .Y(n385) );
  OAI22XL U887 ( .A0(n526), .A1(n463), .B0(n533), .B1(n462), .Y(n373) );
  OAI22XL U888 ( .A0(n528), .A1(n485), .B0(n535), .B1(n484), .Y(n397) );
  CLKBUFX3 U889 ( .A(n559), .Y(n534) );
  XNOR2X1 U890 ( .A(n547), .B(n513), .Y(n487) );
  XNOR2X1 U891 ( .A(n545), .B(n513), .Y(n461) );
  CLKINVX1 U892 ( .A(n53), .Y(n51) );
  CLKBUFX3 U893 ( .A(a[5]), .Y(n546) );
  CLKINVX1 U894 ( .A(n545), .Y(n539) );
  XNOR2X1 U895 ( .A(n546), .B(b[1]), .Y(n477) );
  XNOR2X1 U896 ( .A(n544), .B(b[1]), .Y(n451) );
  XNOR2X1 U897 ( .A(n548), .B(b[1]), .Y(n503) );
  XNOR2X1 U898 ( .A(n548), .B(n511), .Y(n498) );
  XNOR2X1 U899 ( .A(n548), .B(n512), .Y(n499) );
  NAND2X1 U900 ( .A(n220), .B(n213), .Y(n76) );
  NAND2X1 U901 ( .A(n205), .B(n212), .Y(n69) );
  XNOR2X1 U902 ( .A(n544), .B(n515), .Y(n450) );
  XNOR2X1 U903 ( .A(n547), .B(n515), .Y(n489) );
  XNOR2X1 U904 ( .A(n546), .B(n514), .Y(n475) );
  XNOR2X1 U905 ( .A(n547), .B(n514), .Y(n488) );
  CLKBUFX3 U906 ( .A(n552), .Y(n527) );
  NAND2X1 U907 ( .A(n521), .B(n559), .Y(n552) );
  XOR2XL U908 ( .A(a[4]), .B(a[5]), .Y(n521) );
  CLKBUFX3 U909 ( .A(a[3]), .Y(n547) );
  XNOR2X1 U910 ( .A(n547), .B(n507), .Y(n481) );
  XNOR2X1 U911 ( .A(n547), .B(n508), .Y(n482) );
  XNOR2X1 U912 ( .A(n547), .B(n512), .Y(n486) );
  XNOR2X1 U913 ( .A(n547), .B(n510), .Y(n484) );
  NAND2X1 U914 ( .A(n204), .B(n199), .Y(n62) );
  XNOR2X1 U915 ( .A(n546), .B(n512), .Y(n473) );
  XNOR2X1 U916 ( .A(n545), .B(n512), .Y(n460) );
  XNOR2X1 U917 ( .A(n546), .B(n508), .Y(n469) );
  XNOR2X1 U918 ( .A(n546), .B(n510), .Y(n471) );
  XNOR2X1 U919 ( .A(n546), .B(n511), .Y(n472) );
  XNOR2X1 U920 ( .A(n545), .B(n511), .Y(n459) );
  XNOR2X1 U921 ( .A(n544), .B(n511), .Y(n446) );
  NAND2X1 U922 ( .A(n192), .B(n189), .Y(n42) );
  XNOR2X1 U923 ( .A(n545), .B(n510), .Y(n458) );
  XNOR2X1 U924 ( .A(n544), .B(n510), .Y(n445) );
  CLKBUFX3 U925 ( .A(n556), .Y(n531) );
  XNOR2X1 U926 ( .A(n544), .B(n507), .Y(n442) );
  OAI22XL U927 ( .A0(n527), .A1(n471), .B0(n534), .B1(n470), .Y(n382) );
  OAI22XL U928 ( .A0(n526), .A1(n461), .B0(n533), .B1(n460), .Y(n371) );
  OAI22X1 U929 ( .A0(n528), .A1(n483), .B0(n535), .B1(n482), .Y(n395) );
  NAND2X1 U930 ( .A(n416), .B(n633), .Y(n161) );
  OAI22XL U931 ( .A0(n527), .A1(n473), .B0(n534), .B1(n472), .Y(n384) );
  ADDFX2 U932 ( .A(n234), .B(n232), .CI(n223), .CO(n220), .S(n221) );
  OAI22XL U933 ( .A0(n526), .A1(n458), .B0(n533), .B1(n457), .Y(n368) );
  OAI22XL U934 ( .A0(n527), .A1(n470), .B0(n534), .B1(n469), .Y(n381) );
  CLKBUFX3 U935 ( .A(b[2]), .Y(n515) );
  CLKBUFX3 U936 ( .A(b[3]), .Y(n514) );
  XNOR2X1 U937 ( .A(n547), .B(n509), .Y(n483) );
  CLKBUFX2 U938 ( .A(b[5]), .Y(n512) );
  CLKBUFX3 U939 ( .A(b[6]), .Y(n511) );
  AO21X1 U940 ( .A0(n525), .A1(n532), .B0(n538), .Y(n349) );
  OR2X1 U941 ( .A(n188), .B(n186), .Y(n653) );
  NAND2X1 U942 ( .A(n188), .B(n186), .Y(n29) );
  XNOR2X1 U943 ( .A(n544), .B(n509), .Y(n444) );
  CLKBUFX2 U944 ( .A(b[10]), .Y(n507) );
  OAI22X1 U945 ( .A0(n528), .A1(n488), .B0(n535), .B1(n487), .Y(n400) );
  NOR2BX1 U946 ( .AN(n1), .B(n533), .Y(n376) );
  OAI22X1 U947 ( .A0(n525), .A1(n449), .B0(n532), .B1(n448), .Y(n358) );
  OAI22XL U948 ( .A0(n524), .A1(n437), .B0(n531), .B1(n436), .Y(n345) );
  OAI22X1 U949 ( .A0(n526), .A1(n462), .B0(n533), .B1(n461), .Y(n372) );
  OAI22X1 U950 ( .A0(n528), .A1(n490), .B0(n535), .B1(n489), .Y(n402) );
  NOR2BX1 U951 ( .AN(n1), .B(n534), .Y(n390) );
  OAI22XL U952 ( .A0(n526), .A1(n459), .B0(n533), .B1(n458), .Y(n369) );
  OAI22X1 U953 ( .A0(n528), .A1(n481), .B0(n535), .B1(n480), .Y(n393) );
  OAI22X1 U954 ( .A0(n528), .A1(n489), .B0(n535), .B1(n488), .Y(n401) );
  OAI22X1 U955 ( .A0(n529), .A1(n500), .B0(n499), .B1(n536), .Y(n413) );
  OAI22XL U956 ( .A0(n527), .A1(n472), .B0(n534), .B1(n471), .Y(n383) );
  OAI22X1 U957 ( .A0(n525), .A1(n450), .B0(n532), .B1(n449), .Y(n359) );
  ADDFX2 U958 ( .A(n370), .B(n394), .CI(n346), .CO(n269), .S(n270) );
  OAI22XL U959 ( .A0(n526), .A1(n460), .B0(n533), .B1(n459), .Y(n370) );
  OAI22X1 U960 ( .A0(n524), .A1(n438), .B0(n531), .B1(n437), .Y(n346) );
  OAI22X1 U961 ( .A0(n528), .A1(n482), .B0(n535), .B1(n481), .Y(n394) );
  ADDFHX1 U962 ( .A(n343), .B(n248), .CI(n239), .CO(n234), .S(n235) );
  OAI22XL U963 ( .A0(n524), .A1(n435), .B0(n531), .B1(n434), .Y(n343) );
  CMPR32X2 U964 ( .A(n355), .B(n379), .C(n391), .CO(n236), .S(n237) );
  OAI22XL U965 ( .A0(n525), .A1(n446), .B0(n532), .B1(n445), .Y(n355) );
  OAI22XL U966 ( .A0(n527), .A1(n468), .B0(n534), .B1(n467), .Y(n379) );
  AO21X2 U967 ( .A0(n528), .A1(n535), .B0(n541), .Y(n391) );
  OAI22XL U968 ( .A0(n526), .A1(n457), .B0(n533), .B1(n456), .Y(n367) );
  NOR2X1 U969 ( .A(n530), .B(n425), .Y(n333) );
  CMPR32X2 U970 ( .A(n354), .B(n342), .C(n238), .CO(n224), .S(n225) );
  OAI22XL U971 ( .A0(n525), .A1(n445), .B0(n532), .B1(n444), .Y(n354) );
  OAI22XL U972 ( .A0(n524), .A1(n434), .B0(n531), .B1(n433), .Y(n342) );
  OAI22XL U973 ( .A0(n525), .A1(n447), .B0(n532), .B1(n446), .Y(n356) );
  OAI22XL U974 ( .A0(n527), .A1(n469), .B0(n534), .B1(n468), .Y(n380) );
  OAI22XL U975 ( .A0(n526), .A1(n456), .B0(n533), .B1(n455), .Y(n366) );
  OAI22XL U976 ( .A0(n527), .A1(n467), .B0(n534), .B1(n540), .Y(n378) );
  ADDFXL U977 ( .A(n341), .B(n353), .CI(n377), .CO(n216), .S(n217) );
  OAI22XL U978 ( .A0(n525), .A1(n444), .B0(n532), .B1(n443), .Y(n353) );
  OAI22XL U979 ( .A0(n524), .A1(n433), .B0(n531), .B1(n432), .Y(n341) );
  AO21X1 U980 ( .A0(n527), .A1(n534), .B0(n540), .Y(n377) );
  NOR2X1 U981 ( .A(n530), .B(n424), .Y(n228) );
  CLKINVX1 U982 ( .A(n513), .Y(n424) );
  ADDFXL U983 ( .A(n228), .B(n332), .CI(n365), .CO(n218), .S(n219) );
  OAI22XL U984 ( .A0(n526), .A1(n455), .B0(n533), .B1(n454), .Y(n365) );
  NOR2X1 U985 ( .A(n530), .B(n423), .Y(n332) );
  ADDFXL U986 ( .A(n340), .B(n218), .CI(n209), .CO(n206), .S(n207) );
  OAI22XL U987 ( .A0(n524), .A1(n432), .B0(n531), .B1(n431), .Y(n340) );
  OAI22XL U988 ( .A0(n525), .A1(n443), .B0(n532), .B1(n442), .Y(n352) );
  OAI22XL U989 ( .A0(n526), .A1(n454), .B0(n533), .B1(n539), .Y(n364) );
  OAI22XL U990 ( .A0(n524), .A1(n431), .B0(n531), .B1(n430), .Y(n339) );
  NOR2X1 U991 ( .A(n530), .B(n422), .Y(n210) );
  CLKINVX1 U992 ( .A(n511), .Y(n422) );
  ADDFXL U993 ( .A(n210), .B(n331), .CI(n351), .CO(n202), .S(n203) );
  OAI22XL U994 ( .A0(n525), .A1(n442), .B0(n532), .B1(n441), .Y(n351) );
  NOR2X1 U995 ( .A(n530), .B(n421), .Y(n331) );
  CLKINVX1 U996 ( .A(n510), .Y(n421) );
  NAND2XL U997 ( .A(n519), .B(n557), .Y(n550) );
  OAI22XL U998 ( .A0(n524), .A1(n430), .B0(n531), .B1(n429), .Y(n338) );
  OAI22XL U999 ( .A0(n525), .A1(n441), .B0(n532), .B1(n538), .Y(n350) );
  CLKBUFX2 U1000 ( .A(b[8]), .Y(n509) );
  NOR2X1 U1001 ( .A(n530), .B(n420), .Y(n196) );
  CLKINVX1 U1002 ( .A(n509), .Y(n420) );
  ADDFXL U1003 ( .A(n196), .B(n330), .CI(n337), .CO(n190), .S(n191) );
  OAI22XL U1004 ( .A0(n524), .A1(n429), .B0(n531), .B1(n428), .Y(n337) );
  NOR2X1 U1005 ( .A(n530), .B(n419), .Y(n330) );
  CLKINVX1 U1006 ( .A(n508), .Y(n419) );
  NOR2X1 U1007 ( .A(n530), .B(n418), .Y(n329) );
  XNOR2X1 U1008 ( .A(n547), .B(b[11]), .Y(n480) );
  NAND2XL U1009 ( .A(n518), .B(n556), .Y(n549) );
  XNOR2X1 U1010 ( .A(n544), .B(b[11]), .Y(n441) );
  XNOR2X1 U1011 ( .A(n543), .B(b[11]), .Y(n428) );
  NAND2XL U1012 ( .A(n74), .B(n76), .Y(n11) );
  NAND2XL U1013 ( .A(n170), .B(n85), .Y(n12) );
  NAND2XL U1014 ( .A(n174), .B(n113), .Y(n16) );
  NAND2XL U1015 ( .A(n168), .B(n69), .Y(n10) );
  NAND2XL U1016 ( .A(n175), .B(n118), .Y(n17) );
  INVXL U1017 ( .A(n117), .Y(n175) );
  NAND2XL U1018 ( .A(n171), .B(n90), .Y(n13) );
  NAND2XL U1019 ( .A(n172), .B(n97), .Y(n14) );
  NAND2X1 U1020 ( .A(n634), .B(n53), .Y(n8) );
  NAND2XL U1021 ( .A(n177), .B(n127), .Y(n19) );
  NAND2XL U1022 ( .A(n132), .B(n135), .Y(n20) );
  NAND2X1 U1023 ( .A(n635), .B(n42), .Y(n7) );
  NAND2X1 U1024 ( .A(n59), .B(n62), .Y(n9) );
  NAND2XL U1025 ( .A(n180), .B(n146), .Y(n22) );
  INVXL U1026 ( .A(n139), .Y(n179) );
  XOR2X1 U1027 ( .A(n30), .B(n6), .Y(product[22]) );
  NAND2X1 U1028 ( .A(n653), .B(n29), .Y(n6) );
  AOI21XL U1029 ( .A0(n3), .A1(n31), .B0(n32), .Y(n30) );
  INVXL U1030 ( .A(n152), .Y(n182) );
  NAND2XL U1031 ( .A(n184), .B(n161), .Y(n26) );
  INVXL U1032 ( .A(n157), .Y(n183) );
  NOR2BXL U1033 ( .AN(n1), .B(n536), .Y(product[0]) );
  XOR2XL U1034 ( .A(a[8]), .B(a[9]), .Y(n519) );
  XOR2XL U1035 ( .A(a[10]), .B(a[11]), .Y(n518) );
  CLKBUFX2 U1036 ( .A(b[9]), .Y(n508) );
  CLKBUFX2 U1037 ( .A(b[7]), .Y(n510) );
  XNOR2XL U1038 ( .A(a[8]), .B(a[7]), .Y(n557) );
  XOR2XL U1039 ( .A(a[6]), .B(a[7]), .Y(n520) );
  XNOR2XL U1040 ( .A(a[10]), .B(a[9]), .Y(n556) );
endmodule


module geofence_DW_mult_uns_5 ( a, b, product );
  input [9:0] a;
  input [9:0] b;
  output [19:0] product;
  wire   n1, n2, n4, n5, n6, n9, n10, n11, n12, n14, n15, n16, n17, n22, n23,
         n24, n25, n26, n28, n29, n32, n33, n36, n37, n38, n39, n40, n41, n42,
         n44, n46, n47, n48, n49, n50, n52, n53, n54, n55, n56, n58, n59, n61,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n73, n74, n77, n78, n80,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n107, n109,
         n112, n114, n115, n116, n119, n120, n121, n122, n123, n124, n125,
         n127, n128, n129, n130, n131, n133, n135, n136, n137, n138, n139,
         n140, n143, n144, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n246, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n312, n313, n314, n315, n316, n317, n318,
         n319;

  AOI21X4 U34 ( .A0(n53), .A1(n300), .B0(n44), .Y(n42) );
  AOI21X4 U54 ( .A0(n1), .A1(n61), .B0(n58), .Y(n56) );
  OAI21X4 U66 ( .A0(n66), .A1(n94), .B0(n67), .Y(n65) );
  OAI21X4 U92 ( .A0(n86), .A1(n92), .B0(n87), .Y(n85) );
  AOI21X4 U98 ( .A0(n93), .A1(n89), .B0(n90), .Y(n88) );
  XNOR2X4 U105 ( .A(n99), .B(n11), .Y(product[9]) );
  AOI21X4 U107 ( .A0(n95), .A1(n103), .B0(n96), .Y(n94) );
  NOR2X8 U118 ( .A(n185), .B(n190), .Y(n100) );
  OAI21X4 U122 ( .A0(n104), .A1(n116), .B0(n105), .Y(n103) );
  AOI21X4 U124 ( .A0(n301), .A1(n112), .B0(n107), .Y(n105) );
  ADDFHX4 U164 ( .A(a[8]), .B(n211), .CI(n204), .CO(n146), .S(n147) );
  ADDFHX4 U165 ( .A(n212), .B(n205), .CI(n152), .CO(n148), .S(n149) );
  ADDFHX4 U166 ( .A(n206), .B(n153), .CI(n156), .CO(n150), .S(n151) );
  ADDFHX4 U168 ( .A(n162), .B(n157), .CI(n160), .CO(n154), .S(n155) );
  ADDFHX4 U169 ( .A(n220), .B(n207), .CI(n214), .CO(n156), .S(n157) );
  ADDFHX4 U170 ( .A(n168), .B(n166), .CI(n161), .CO(n158), .S(n159) );
  ADDFHX4 U171 ( .A(n221), .B(n208), .CI(n163), .CO(n160), .S(n161) );
  ADDFHX4 U173 ( .A(n169), .B(n172), .CI(n167), .CO(n164), .S(n165) );
  ADDFHX4 U174 ( .A(n222), .B(n176), .CI(n174), .CO(n166), .S(n167) );
  ADDFHX4 U176 ( .A(n175), .B(n180), .CI(n173), .CO(n170), .S(n171) );
  ADDFHX4 U184 ( .A(n237), .B(n225), .CI(n234), .CO(n186), .S(n187) );
  ADDFHX4 U186 ( .A(n235), .B(n196), .CI(n193), .CO(n190), .S(n191) );
  ADDFHX4 U188 ( .A(n239), .B(n236), .CI(n197), .CO(n194), .S(n195) );
  NOR2X8 U194 ( .A(n259), .B(n256), .Y(n204) );
  NOR2X8 U215 ( .A(n255), .B(n258), .Y(n225) );
  NOR2X8 U224 ( .A(n263), .B(n260), .Y(n234) );
  BUFX16 U258 ( .A(n244), .Y(n298) );
  NOR2X8 U259 ( .A(n264), .B(n263), .Y(n244) );
  INVX1 U260 ( .A(n103), .Y(n102) );
  INVX4 U261 ( .A(n121), .Y(n308) );
  NOR2X6 U262 ( .A(n179), .B(n184), .Y(n97) );
  ADDFHX4 U263 ( .A(n183), .B(n186), .CI(n181), .CO(n178), .S(n179) );
  INVX16 U264 ( .A(a[6]), .Y(n259) );
  NOR2X8 U265 ( .A(n159), .B(n164), .Y(n77) );
  NOR2X6 U266 ( .A(n59), .B(n50), .Y(n48) );
  CLKINVX3 U267 ( .A(n52), .Y(n50) );
  CLKINVX8 U268 ( .A(n61), .Y(n59) );
  INVX1 U269 ( .A(n38), .Y(n36) );
  OAI21X1 U270 ( .A0(n38), .A1(n32), .B0(n33), .Y(n29) );
  INVX4 U271 ( .A(n40), .Y(n38) );
  CLKINVX6 U272 ( .A(n84), .Y(n82) );
  ADDFHX4 U273 ( .A(n227), .B(n209), .CI(n216), .CO(n168), .S(n169) );
  NOR2X6 U274 ( .A(n264), .B(n256), .Y(n209) );
  NOR2X2 U275 ( .A(n261), .B(n259), .Y(n227) );
  XNOR2X4 U276 ( .A(n1), .B(n6), .Y(product[14]) );
  INVX12 U277 ( .A(a[4]), .Y(n261) );
  XOR2X4 U278 ( .A(n88), .B(n9), .Y(product[11]) );
  ADDFHX4 U279 ( .A(n189), .B(n192), .CI(n187), .CO(n184), .S(n185) );
  ADDHX2 U280 ( .A(n238), .B(n231), .CO(n192), .S(n193) );
  NOR2X2 U281 ( .A(n255), .B(n259), .Y(n231) );
  NAND2X4 U282 ( .A(n201), .B(n243), .Y(n123) );
  NOR2X2 U283 ( .A(n255), .B(n262), .Y(n243) );
  NAND2X6 U284 ( .A(n158), .B(n155), .Y(n71) );
  AO21X2 U285 ( .A0(n115), .A1(n299), .B0(n112), .Y(n309) );
  NOR2X2 U286 ( .A(n255), .B(n257), .Y(n218) );
  CLKAND2X3 U287 ( .A(n39), .B(n23), .Y(n303) );
  CLKINVX8 U288 ( .A(n39), .Y(n37) );
  NOR2X6 U289 ( .A(n41), .B(n63), .Y(n39) );
  NOR2X4 U290 ( .A(n201), .B(n243), .Y(n122) );
  ADDHX2 U291 ( .A(n224), .B(n218), .CO(n182), .S(n183) );
  NOR2X2 U292 ( .A(n264), .B(n258), .Y(n224) );
  NAND2X6 U293 ( .A(n159), .B(n164), .Y(n78) );
  XOR2X4 U294 ( .A(n309), .B(n310), .Y(product[7]) );
  NAND2X4 U295 ( .A(n195), .B(n198), .Y(n114) );
  INVX4 U296 ( .A(n94), .Y(n93) );
  NOR2X4 U297 ( .A(n150), .B(n149), .Y(n54) );
  CLKINVX6 U298 ( .A(n54), .Y(n52) );
  INVX6 U299 ( .A(n109), .Y(n107) );
  INVX12 U300 ( .A(a[1]), .Y(n264) );
  NOR2X6 U301 ( .A(n154), .B(n151), .Y(n63) );
  NAND2X4 U302 ( .A(n52), .B(n300), .Y(n41) );
  INVX12 U303 ( .A(a[3]), .Y(n262) );
  INVX12 U304 ( .A(a[2]), .Y(n263) );
  AND2X2 U305 ( .A(n136), .B(n78), .Y(n305) );
  INVXL U306 ( .A(n70), .Y(n135) );
  INVXL U307 ( .A(n32), .Y(n131) );
  NOR2X2 U308 ( .A(n263), .B(n261), .Y(n238) );
  NOR2X6 U309 ( .A(n255), .B(n256), .Y(n210) );
  NOR2X4 U310 ( .A(n263), .B(n258), .Y(n223) );
  ADDFHX2 U311 ( .A(n233), .B(n229), .CI(n188), .CO(n180), .S(n181) );
  NOR2X2 U312 ( .A(n262), .B(n260), .Y(n233) );
  ADDFHX2 U313 ( .A(n232), .B(n177), .CI(n182), .CO(n172), .S(n173) );
  NOR2X2 U314 ( .A(n261), .B(n260), .Y(n232) );
  XOR2X2 U315 ( .A(a[2]), .B(n298), .Y(n201) );
  NOR2X4 U316 ( .A(n262), .B(n256), .Y(n207) );
  NAND2X2 U317 ( .A(n127), .B(n125), .Y(n124) );
  XNOR2X1 U318 ( .A(n115), .B(n14), .Y(product[6]) );
  NOR2X1 U319 ( .A(n82), .B(n77), .Y(n73) );
  NAND2X4 U320 ( .A(n171), .B(n178), .Y(n92) );
  NOR2X6 U321 ( .A(n158), .B(n155), .Y(n70) );
  NOR2X4 U322 ( .A(n171), .B(n178), .Y(n91) );
  CLKINVX1 U323 ( .A(n129), .Y(n127) );
  NAND2X1 U324 ( .A(n133), .B(n55), .Y(n5) );
  NOR2X2 U325 ( .A(n97), .B(n100), .Y(n95) );
  OAI21X2 U326 ( .A0(n97), .A1(n101), .B0(n98), .Y(n96) );
  OAI21X2 U327 ( .A0(n70), .A1(n78), .B0(n71), .Y(n69) );
  NOR2X1 U328 ( .A(n37), .B(n32), .Y(n28) );
  OAI21X2 U329 ( .A0(n41), .A1(n64), .B0(n42), .Y(n40) );
  NOR2X1 U330 ( .A(n146), .B(n203), .Y(n32) );
  CLKINVX1 U331 ( .A(n17), .Y(product[2]) );
  OR2X8 U332 ( .A(n195), .B(n198), .Y(n299) );
  OR2X8 U333 ( .A(n148), .B(n147), .Y(n300) );
  OR2X8 U334 ( .A(n191), .B(n194), .Y(n301) );
  NOR2X4 U335 ( .A(n262), .B(n259), .Y(n228) );
  AND2X2 U336 ( .A(a[2]), .B(n298), .Y(n302) );
  INVX3 U337 ( .A(n85), .Y(n83) );
  INVX3 U338 ( .A(n63), .Y(n61) );
  CLKINVX1 U339 ( .A(n55), .Y(n53) );
  NAND2X2 U340 ( .A(n150), .B(n149), .Y(n55) );
  NOR2X4 U341 ( .A(n86), .B(n91), .Y(n84) );
  INVX1 U342 ( .A(n91), .Y(n138) );
  OAI21X4 U343 ( .A0(n102), .A1(n100), .B0(n101), .Y(n99) );
  AO21X4 U344 ( .A0(n73), .A1(n93), .B0(n74), .Y(n314) );
  INVX12 U345 ( .A(a[9]), .Y(n256) );
  NAND2X1 U346 ( .A(n137), .B(n87), .Y(n9) );
  NOR2X2 U347 ( .A(n261), .B(n258), .Y(n221) );
  OAI21X2 U348 ( .A0(n83), .A1(n77), .B0(n78), .Y(n74) );
  NOR2X2 U349 ( .A(n262), .B(n258), .Y(n222) );
  NOR2X4 U350 ( .A(n259), .B(n258), .Y(n219) );
  XNOR2X4 U351 ( .A(n313), .B(n2), .Y(product[18]) );
  NOR2X4 U352 ( .A(n260), .B(n259), .Y(n226) );
  NOR2X4 U353 ( .A(n260), .B(n257), .Y(n213) );
  AOI21X4 U354 ( .A0(n85), .A1(n68), .B0(n69), .Y(n67) );
  NOR2X8 U355 ( .A(n165), .B(n170), .Y(n86) );
  AOI21X4 U356 ( .A0(n1), .A1(n48), .B0(n49), .Y(n47) );
  NOR2X4 U357 ( .A(n264), .B(n261), .Y(n239) );
  NOR2X4 U358 ( .A(n264), .B(n260), .Y(n235) );
  NOR2X4 U359 ( .A(n260), .B(n256), .Y(n205) );
  OAI2BB1X2 U360 ( .A0N(n1), .A1N(n303), .B0(n22), .Y(product[19]) );
  ADDHX4 U361 ( .A(a[5]), .B(n217), .CO(n176), .S(n177) );
  NOR2X6 U362 ( .A(n264), .B(n257), .Y(n217) );
  NAND2X6 U363 ( .A(n185), .B(n190), .Y(n101) );
  NAND2X4 U364 ( .A(n165), .B(n170), .Y(n87) );
  NAND3X4 U365 ( .A(n317), .B(n318), .C(n319), .Y(n174) );
  ADDHX2 U366 ( .A(a[3]), .B(n241), .CO(n196), .S(n197) );
  NOR2X4 U367 ( .A(n255), .B(n260), .Y(n236) );
  ADDFHX2 U368 ( .A(a[6]), .B(n215), .CI(n226), .CO(n162), .S(n163) );
  NOR2X6 U369 ( .A(n262), .B(n257), .Y(n215) );
  NOR2X4 U370 ( .A(n255), .B(n261), .Y(n240) );
  ADDHX4 U371 ( .A(n242), .B(n240), .CO(n198), .S(n199) );
  NOR2X4 U372 ( .A(n258), .B(n257), .Y(n211) );
  INVX12 U373 ( .A(a[8]), .Y(n257) );
  NOR2X1 U374 ( .A(n257), .B(n256), .Y(n202) );
  NOR2X2 U375 ( .A(n263), .B(n256), .Y(n208) );
  NOR2X4 U376 ( .A(n264), .B(n262), .Y(n242) );
  INVX6 U377 ( .A(n114), .Y(n112) );
  XOR2X4 U378 ( .A(n210), .B(n228), .Y(n312) );
  NOR2X1 U379 ( .A(n261), .B(n256), .Y(n206) );
  NOR2X2 U380 ( .A(n264), .B(n259), .Y(n230) );
  XNOR2X4 U381 ( .A(n93), .B(n10), .Y(product[10]) );
  NAND2X2 U382 ( .A(n246), .B(a[1]), .Y(n129) );
  NOR2X6 U383 ( .A(n255), .B(n264), .Y(n246) );
  XOR2X2 U384 ( .A(n102), .B(n12), .Y(product[8]) );
  NAND2X1 U385 ( .A(n140), .B(n101), .Y(n12) );
  AO21X2 U386 ( .A0(n1), .A1(n28), .B0(n29), .Y(n313) );
  BUFX16 U387 ( .A(n65), .Y(n1) );
  ADDFHX2 U388 ( .A(a[7]), .B(n219), .CI(n213), .CO(n152), .S(n153) );
  INVX1 U389 ( .A(n316), .Y(n125) );
  OR2X4 U390 ( .A(n255), .B(n263), .Y(n316) );
  OAI21X2 U391 ( .A0(n64), .A1(n50), .B0(n55), .Y(n49) );
  INVXL U392 ( .A(n64), .Y(n58) );
  NOR2X1 U393 ( .A(n32), .B(n25), .Y(n23) );
  NAND2X2 U394 ( .A(n301), .B(n299), .Y(n104) );
  NAND2X4 U395 ( .A(n148), .B(n147), .Y(n46) );
  OAI21X4 U396 ( .A0(n122), .A1(n124), .B0(n123), .Y(n121) );
  AND2X1 U397 ( .A(n135), .B(n71), .Y(n315) );
  INVX1 U398 ( .A(n97), .Y(n139) );
  AND2XL U399 ( .A(n131), .B(n33), .Y(n307) );
  NAND2X6 U400 ( .A(n154), .B(n151), .Y(n64) );
  AND2XL U401 ( .A(n301), .B(n109), .Y(n310) );
  INVXL U402 ( .A(n119), .Y(n143) );
  XOR2X4 U403 ( .A(n304), .B(n305), .Y(product[12]) );
  AO21X4 U404 ( .A0(n93), .A1(n80), .B0(n85), .Y(n304) );
  NAND2XL U405 ( .A(n138), .B(n92), .Y(n10) );
  NAND2BXL U406 ( .AN(n63), .B(n64), .Y(n6) );
  INVXL U407 ( .A(n92), .Y(n90) );
  XOR2X4 U408 ( .A(n306), .B(n307), .Y(product[17]) );
  AO21X4 U409 ( .A0(n1), .A1(n39), .B0(n36), .Y(n306) );
  NAND2X2 U410 ( .A(n300), .B(n46), .Y(n4) );
  OA21X4 U411 ( .A0(n308), .A1(n119), .B0(n120), .Y(n116) );
  NAND2XL U412 ( .A(n299), .B(n114), .Y(n14) );
  NAND2XL U413 ( .A(n143), .B(n120), .Y(n15) );
  XOR2X4 U414 ( .A(n223), .B(n312), .Y(n175) );
  NAND2X2 U415 ( .A(n228), .B(n210), .Y(n319) );
  NAND2X2 U416 ( .A(n228), .B(n223), .Y(n318) );
  NOR2X1 U417 ( .A(n199), .B(n302), .Y(n119) );
  NAND2X6 U418 ( .A(n191), .B(n194), .Y(n109) );
  NAND2X1 U419 ( .A(n146), .B(n203), .Y(n33) );
  XNOR2XL U420 ( .A(n316), .B(n127), .Y(product[3]) );
  INVX12 U421 ( .A(a[7]), .Y(n258) );
  INVX12 U422 ( .A(a[5]), .Y(n260) );
  NOR2X1 U423 ( .A(n202), .B(a[9]), .Y(n25) );
  NAND2XL U424 ( .A(n202), .B(a[9]), .Y(n26) );
  NAND2BXL U425 ( .AN(n128), .B(n129), .Y(n17) );
  INVX12 U426 ( .A(a[0]), .Y(n255) );
  CLKINVX1 U427 ( .A(n82), .Y(n80) );
  INVXL U428 ( .A(n77), .Y(n136) );
  XOR2X4 U429 ( .A(n56), .B(n5), .Y(product[15]) );
  INVXL U430 ( .A(n54), .Y(n133) );
  INVXL U431 ( .A(n86), .Y(n137) );
  XOR2X4 U432 ( .A(n314), .B(n315), .Y(product[13]) );
  INVXL U433 ( .A(n91), .Y(n89) );
  NAND2XL U434 ( .A(n139), .B(n98), .Y(n11) );
  INVXL U435 ( .A(n100), .Y(n140) );
  CLKINVX1 U436 ( .A(n116), .Y(n115) );
  XOR2X4 U437 ( .A(n47), .B(n4), .Y(product[16]) );
  CLKINVX1 U438 ( .A(n46), .Y(n44) );
  XNOR2X1 U439 ( .A(n121), .B(n15), .Y(product[5]) );
  XOR2X1 U440 ( .A(n16), .B(n124), .Y(product[4]) );
  NAND2X1 U441 ( .A(n144), .B(n123), .Y(n16) );
  CLKINVX1 U442 ( .A(n122), .Y(n144) );
  NOR2X2 U443 ( .A(n263), .B(n259), .Y(n229) );
  NOR2X1 U444 ( .A(n259), .B(n257), .Y(n212) );
  NAND2X1 U445 ( .A(n199), .B(n302), .Y(n120) );
  NAND2X1 U446 ( .A(n130), .B(n26), .Y(n2) );
  CLKINVX1 U447 ( .A(n25), .Y(n130) );
  AOI21XL U448 ( .A0(n40), .A1(n23), .B0(n24), .Y(n22) );
  OAI21XL U449 ( .A0(n33), .A1(n25), .B0(n26), .Y(n24) );
  NOR2X1 U450 ( .A(n258), .B(n256), .Y(n203) );
  NOR2XL U451 ( .A(n246), .B(a[1]), .Y(n128) );
  CLKBUFX2 U452 ( .A(a[0]), .Y(product[0]) );
  NOR2X4 U453 ( .A(n262), .B(n261), .Y(n237) );
  NOR2X4 U454 ( .A(n260), .B(n258), .Y(n220) );
  ADDHX2 U455 ( .A(a[4]), .B(n230), .CO(n188), .S(n189) );
  NOR2X8 U456 ( .A(n263), .B(n262), .Y(n241) );
  NAND2X2 U457 ( .A(n84), .B(n68), .Y(n66) );
  NOR2X6 U458 ( .A(n77), .B(n70), .Y(n68) );
  NOR2X2 U459 ( .A(n261), .B(n257), .Y(n214) );
  NOR2X2 U460 ( .A(n263), .B(n257), .Y(n216) );
  NAND2X4 U461 ( .A(n179), .B(n184), .Y(n98) );
  NAND2X4 U462 ( .A(n210), .B(n223), .Y(n317) );
endmodule


module geofence_DW_mult_uns_8 ( a, b, product );
  input [9:0] a;
  input [9:0] b;
  output [19:0] product;
  wire   n1, n2, n3, n5, n6, n9, n10, n11, n12, n13, n14, n15, n16, n22, n23,
         n24, n25, n26, n28, n29, n30, n31, n32, n33, n34, n36, n37, n38, n39,
         n40, n41, n42, n44, n46, n48, n49, n50, n53, n55, n56, n58, n61, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n73, n74, n75, n76, n77, n78,
         n80, n82, n83, n84, n85, n86, n87, n88, n90, n91, n92, n93, n94, n95,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n107, n109, n110,
         n112, n114, n115, n116, n119, n120, n121, n122, n123, n124, n125,
         n127, n128, n129, n130, n135, n136, n137, n138, n139, n140, n143,
         n144, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n246, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n309, n310, n311, n312, n314, n316, n317, n318, n319, n320, n321,
         n322;

  OAI21X4 U32 ( .A0(n41), .A1(n64), .B0(n42), .Y(n40) );
  AOI21X4 U54 ( .A0(n1), .A1(n61), .B0(n58), .Y(n56) );
  NOR2X8 U63 ( .A(n154), .B(n151), .Y(n63) );
  NOR2X8 U83 ( .A(n159), .B(n164), .Y(n77) );
  OAI21X4 U92 ( .A0(n86), .A1(n92), .B0(n87), .Y(n85) );
  AOI21X4 U98 ( .A0(n93), .A1(n138), .B0(n90), .Y(n88) );
  XNOR2X4 U105 ( .A(n99), .B(n11), .Y(product[9]) );
  OAI21X4 U122 ( .A0(n104), .A1(n116), .B0(n105), .Y(n103) );
  AOI21X4 U124 ( .A0(n302), .A1(n112), .B0(n107), .Y(n105) );
  ADDFHX4 U166 ( .A(n206), .B(n153), .CI(n156), .CO(n150), .S(n151) );
  ADDFHX4 U167 ( .A(a[7]), .B(n219), .CI(n213), .CO(n152), .S(n153) );
  ADDFHX4 U168 ( .A(n162), .B(n157), .CI(n160), .CO(n154), .S(n155) );
  ADDFHX4 U170 ( .A(n168), .B(n166), .CI(n161), .CO(n158), .S(n159) );
  ADDFHX4 U171 ( .A(n221), .B(n208), .CI(n163), .CO(n160), .S(n161) );
  ADDFHX4 U173 ( .A(n169), .B(n172), .CI(n167), .CO(n164), .S(n165) );
  ADDFHX4 U174 ( .A(n222), .B(n176), .CI(n174), .CO(n166), .S(n167) );
  ADDFHX4 U180 ( .A(n183), .B(n186), .CI(n181), .CO(n178), .S(n179) );
  INVX1 U258 ( .A(n91), .Y(n138) );
  ADDFHX2 U259 ( .A(n237), .B(n225), .CI(n234), .CO(n186), .S(n187) );
  OA21X4 U260 ( .A0(n97), .A1(n101), .B0(n98), .Y(n304) );
  NAND2X6 U261 ( .A(n165), .B(n170), .Y(n87) );
  NOR2X2 U262 ( .A(n263), .B(n258), .Y(n223) );
  INVX12 U263 ( .A(a[7]), .Y(n258) );
  INVX12 U264 ( .A(a[2]), .Y(n263) );
  NOR2X4 U265 ( .A(n146), .B(n203), .Y(n32) );
  ADDFHX2 U266 ( .A(a[8]), .B(n211), .CI(n204), .CO(n146), .S(n147) );
  NOR2X8 U267 ( .A(n41), .B(n63), .Y(n39) );
  NAND2X8 U268 ( .A(n303), .B(n300), .Y(n41) );
  NOR2X4 U269 ( .A(n38), .B(n30), .Y(n298) );
  NOR2X6 U270 ( .A(n263), .B(n262), .Y(n241) );
  XNOR2X4 U271 ( .A(n1), .B(n6), .Y(product[14]) );
  NOR2X4 U272 ( .A(n263), .B(n260), .Y(n234) );
  INVX12 U273 ( .A(a[4]), .Y(n261) );
  ADDFHX2 U274 ( .A(n223), .B(n210), .CI(n228), .CO(n174), .S(n175) );
  NOR2X4 U275 ( .A(n82), .B(n75), .Y(n73) );
  INVX4 U276 ( .A(n84), .Y(n82) );
  INVXL U277 ( .A(n33), .Y(n299) );
  OR2X4 U278 ( .A(n298), .B(n299), .Y(n29) );
  CLKINVX6 U279 ( .A(n40), .Y(n38) );
  INVX1 U280 ( .A(n31), .Y(n30) );
  NAND2X2 U281 ( .A(n146), .B(n203), .Y(n33) );
  AO21X1 U282 ( .A0(n1), .A1(n28), .B0(n29), .Y(n314) );
  AOI21X4 U283 ( .A0(n1), .A1(n39), .B0(n36), .Y(n34) );
  BUFX20 U284 ( .A(n65), .Y(n1) );
  OR2X6 U285 ( .A(n148), .B(n147), .Y(n300) );
  ADDFHX2 U286 ( .A(n212), .B(n205), .CI(n152), .CO(n148), .S(n149) );
  NOR2X8 U287 ( .A(n185), .B(n190), .Y(n100) );
  ADDFHX4 U288 ( .A(n189), .B(n192), .CI(n187), .CO(n184), .S(n185) );
  ADDHX2 U289 ( .A(n238), .B(n231), .CO(n192), .S(n193) );
  NOR2X2 U290 ( .A(n263), .B(n261), .Y(n238) );
  NOR2X4 U291 ( .A(n259), .B(n258), .Y(n219) );
  INVX8 U292 ( .A(a[6]), .Y(n259) );
  XOR2X2 U293 ( .A(n224), .B(n218), .Y(n183) );
  AND2X2 U294 ( .A(n300), .B(n46), .Y(n312) );
  NAND2X4 U295 ( .A(n195), .B(n198), .Y(n114) );
  INVX3 U296 ( .A(n121), .Y(n310) );
  NAND2X2 U297 ( .A(n191), .B(n194), .Y(n109) );
  INVX3 U298 ( .A(n103), .Y(n102) );
  CLKAND2X8 U299 ( .A(n136), .B(n78), .Y(n319) );
  INVX1 U300 ( .A(n77), .Y(n136) );
  INVX1 U301 ( .A(n70), .Y(n135) );
  NAND2X1 U302 ( .A(n31), .B(n33), .Y(n3) );
  INVX12 U303 ( .A(a[1]), .Y(n264) );
  NOR2X1 U304 ( .A(n32), .B(n25), .Y(n23) );
  NOR2X4 U305 ( .A(n264), .B(n259), .Y(n230) );
  NOR2X2 U306 ( .A(n255), .B(n257), .Y(n218) );
  NOR2X2 U307 ( .A(n264), .B(n258), .Y(n224) );
  NOR2X2 U308 ( .A(n255), .B(n258), .Y(n225) );
  NOR2X2 U309 ( .A(n262), .B(n261), .Y(n237) );
  ADDHX1 U310 ( .A(a[2]), .B(n244), .CO(n200), .S(n201) );
  NOR2X2 U311 ( .A(n264), .B(n263), .Y(n244) );
  INVX3 U312 ( .A(n76), .Y(n75) );
  INVX3 U313 ( .A(n77), .Y(n76) );
  NOR2X2 U314 ( .A(n263), .B(n256), .Y(n208) );
  ADDFHX2 U315 ( .A(n235), .B(n196), .CI(n193), .CO(n190), .S(n191) );
  NOR2X1 U316 ( .A(n264), .B(n260), .Y(n235) );
  ADDFHX2 U317 ( .A(n175), .B(n180), .CI(n173), .CO(n170), .S(n171) );
  XOR2X1 U318 ( .A(n110), .B(n13), .Y(product[7]) );
  NAND2X1 U319 ( .A(n302), .B(n109), .Y(n13) );
  XNOR2X2 U320 ( .A(n93), .B(n10), .Y(product[10]) );
  INVX4 U321 ( .A(n94), .Y(n93) );
  NOR2X1 U322 ( .A(n260), .B(n256), .Y(n205) );
  INVX6 U323 ( .A(a[8]), .Y(n257) );
  INVX3 U324 ( .A(n109), .Y(n107) );
  NAND2X1 U325 ( .A(n179), .B(n184), .Y(n98) );
  NAND2X2 U326 ( .A(n171), .B(n178), .Y(n92) );
  NAND2X2 U327 ( .A(n158), .B(n155), .Y(n71) );
  NOR2X6 U328 ( .A(n158), .B(n155), .Y(n70) );
  CLKINVX1 U329 ( .A(n303), .Y(n50) );
  OR2X2 U330 ( .A(n255), .B(n263), .Y(n322) );
  XOR2X1 U331 ( .A(n16), .B(n124), .Y(product[4]) );
  NAND2X1 U332 ( .A(n303), .B(n55), .Y(n5) );
  CLKINVX1 U333 ( .A(n63), .Y(n61) );
  NOR2X1 U334 ( .A(n259), .B(n256), .Y(n204) );
  NOR2X1 U335 ( .A(n258), .B(n257), .Y(n211) );
  NAND2X2 U336 ( .A(n154), .B(n151), .Y(n64) );
  NAND2X1 U337 ( .A(n148), .B(n147), .Y(n46) );
  NOR2X4 U338 ( .A(n86), .B(n91), .Y(n84) );
  NOR2X1 U339 ( .A(n37), .B(n30), .Y(n28) );
  NOR2X1 U340 ( .A(n128), .B(n127), .Y(product[2]) );
  OR2X6 U341 ( .A(n195), .B(n198), .Y(n301) );
  OR2X8 U342 ( .A(n191), .B(n194), .Y(n302) );
  OR2X8 U343 ( .A(n150), .B(n149), .Y(n303) );
  ADDHX1 U344 ( .A(a[4]), .B(n230), .CO(n188), .S(n189) );
  AND2X2 U345 ( .A(n39), .B(n23), .Y(n305) );
  AND2X2 U346 ( .A(n224), .B(n218), .Y(n306) );
  INVX3 U347 ( .A(n85), .Y(n83) );
  NOR2X4 U348 ( .A(n171), .B(n178), .Y(n91) );
  CLKINVX1 U349 ( .A(n39), .Y(n37) );
  CLKINVX1 U350 ( .A(n55), .Y(n53) );
  NAND2X2 U351 ( .A(n150), .B(n149), .Y(n55) );
  CLKINVX1 U352 ( .A(n32), .Y(n31) );
  OR2X4 U353 ( .A(n255), .B(n316), .Y(n129) );
  INVX3 U354 ( .A(n129), .Y(n127) );
  NOR2X2 U355 ( .A(n97), .B(n100), .Y(n95) );
  NOR2X4 U356 ( .A(n179), .B(n184), .Y(n97) );
  NAND2X6 U357 ( .A(n159), .B(n164), .Y(n78) );
  ADDFHX2 U358 ( .A(n233), .B(n229), .CI(n188), .CO(n180), .S(n181) );
  NOR2X4 U359 ( .A(n262), .B(n260), .Y(n233) );
  ADDFHX2 U360 ( .A(n239), .B(n236), .CI(n197), .CO(n194), .S(n195) );
  NOR2X1 U361 ( .A(n264), .B(n261), .Y(n239) );
  AO21X4 U362 ( .A0(n73), .A1(n93), .B0(n74), .Y(n320) );
  INVX12 U363 ( .A(a[3]), .Y(n262) );
  NOR2X4 U364 ( .A(n264), .B(n256), .Y(n209) );
  ADDFHX2 U365 ( .A(a[6]), .B(n215), .CI(n226), .CO(n162), .S(n163) );
  NAND2X4 U366 ( .A(n302), .B(n301), .Y(n104) );
  NAND2X1 U367 ( .A(n137), .B(n87), .Y(n9) );
  INVX1 U368 ( .A(n86), .Y(n137) );
  NAND2X2 U369 ( .A(n140), .B(n101), .Y(n12) );
  XOR2X4 U370 ( .A(n102), .B(n12), .Y(product[8]) );
  NOR2X1 U371 ( .A(n261), .B(n260), .Y(n232) );
  ADDFHX2 U372 ( .A(n232), .B(n177), .CI(n306), .CO(n172), .S(n173) );
  NOR2X1 U373 ( .A(n262), .B(n259), .Y(n228) );
  INVX12 U374 ( .A(a[9]), .Y(n256) );
  NAND2X2 U375 ( .A(n199), .B(n200), .Y(n120) );
  NOR2X1 U376 ( .A(n255), .B(n261), .Y(n240) );
  AOI21X1 U377 ( .A0(n115), .A1(n301), .B0(n112), .Y(n110) );
  INVX4 U378 ( .A(n116), .Y(n115) );
  OR2X8 U379 ( .A(n307), .B(n308), .Y(n74) );
  NOR2X6 U380 ( .A(n83), .B(n75), .Y(n307) );
  NOR2X4 U381 ( .A(n262), .B(n256), .Y(n207) );
  AND2X8 U382 ( .A(n309), .B(n304), .Y(n94) );
  NOR2X1 U383 ( .A(n262), .B(n258), .Y(n222) );
  NOR2X6 U384 ( .A(n165), .B(n170), .Y(n86) );
  NOR2X2 U385 ( .A(n260), .B(n259), .Y(n226) );
  OAI2BB1X1 U386 ( .A0N(n1), .A1N(n305), .B0(n22), .Y(product[19]) );
  AOI21X4 U387 ( .A0(n85), .A1(n68), .B0(n69), .Y(n67) );
  NOR2X2 U388 ( .A(n262), .B(n257), .Y(n215) );
  NOR2X2 U389 ( .A(n260), .B(n258), .Y(n220) );
  NOR2X4 U390 ( .A(n255), .B(n256), .Y(n210) );
  NOR2X2 U391 ( .A(n260), .B(n257), .Y(n213) );
  INVX12 U392 ( .A(a[5]), .Y(n260) );
  NAND2X4 U393 ( .A(n95), .B(n103), .Y(n309) );
  ADDHX2 U394 ( .A(n242), .B(n240), .CO(n198), .S(n199) );
  OAI21X4 U395 ( .A0(n102), .A1(n100), .B0(n101), .Y(n99) );
  NOR2X1 U396 ( .A(n261), .B(n258), .Y(n221) );
  OAI21X4 U397 ( .A0(n66), .A1(n94), .B0(n67), .Y(n65) );
  NOR2X6 U398 ( .A(n77), .B(n70), .Y(n68) );
  NAND2X2 U399 ( .A(n84), .B(n68), .Y(n66) );
  NOR2X2 U400 ( .A(n264), .B(n257), .Y(n217) );
  NOR2X1 U401 ( .A(n264), .B(n262), .Y(n242) );
  INVX16 U402 ( .A(n264), .Y(n317) );
  ADDFHX2 U403 ( .A(n220), .B(n207), .CI(n214), .CO(n156), .S(n157) );
  INVXL U404 ( .A(n78), .Y(n308) );
  AOI21X4 U405 ( .A0(n53), .A1(n300), .B0(n44), .Y(n42) );
  CLKINVX6 U406 ( .A(n46), .Y(n44) );
  INVXL U407 ( .A(n100), .Y(n140) );
  INVX1 U408 ( .A(n82), .Y(n80) );
  INVX8 U409 ( .A(n114), .Y(n112) );
  XNOR2X1 U410 ( .A(n115), .B(n14), .Y(product[6]) );
  INVXL U411 ( .A(n97), .Y(n139) );
  NAND2XL U412 ( .A(n139), .B(n98), .Y(n11) );
  AO21X4 U413 ( .A0(n1), .A1(n48), .B0(n49), .Y(n311) );
  NAND2XL U414 ( .A(n301), .B(n114), .Y(n14) );
  ADDHX1 U415 ( .A(a[3]), .B(n241), .CO(n196), .S(n197) );
  NOR2XL U416 ( .A(n246), .B(a[1]), .Y(n128) );
  INVXL U417 ( .A(n64), .Y(n58) );
  NAND2BXL U418 ( .AN(n63), .B(n64), .Y(n6) );
  OA21X4 U419 ( .A0(n310), .A1(n119), .B0(n120), .Y(n116) );
  OAI21X4 U420 ( .A0(n122), .A1(n124), .B0(n123), .Y(n121) );
  XOR2X4 U421 ( .A(n311), .B(n312), .Y(product[16]) );
  NAND2XL U422 ( .A(n143), .B(n120), .Y(n15) );
  INVXL U423 ( .A(n119), .Y(n143) );
  NAND2X4 U424 ( .A(n127), .B(n125), .Y(n124) );
  XNOR2X4 U425 ( .A(n314), .B(n2), .Y(product[18]) );
  NOR2X1 U426 ( .A(n255), .B(n260), .Y(n236) );
  NOR2X1 U427 ( .A(n202), .B(a[9]), .Y(n25) );
  NAND2XL U428 ( .A(n202), .B(a[9]), .Y(n26) );
  INVX12 U429 ( .A(a[0]), .Y(n255) );
  NAND2X6 U430 ( .A(n317), .B(n317), .Y(n316) );
  XOR2X4 U431 ( .A(n318), .B(n319), .Y(product[12]) );
  AO21X4 U432 ( .A0(n93), .A1(n80), .B0(n85), .Y(n318) );
  CLKINVX1 U433 ( .A(n38), .Y(n36) );
  NOR2XL U434 ( .A(n63), .B(n50), .Y(n48) );
  OAI21XL U435 ( .A0(n64), .A1(n50), .B0(n55), .Y(n49) );
  XOR2X4 U436 ( .A(n56), .B(n5), .Y(product[15]) );
  XOR2X4 U437 ( .A(n88), .B(n9), .Y(product[11]) );
  XOR2X4 U438 ( .A(n320), .B(n321), .Y(product[13]) );
  AND2XL U439 ( .A(n135), .B(n71), .Y(n321) );
  NAND2X1 U440 ( .A(n138), .B(n92), .Y(n10) );
  INVXL U441 ( .A(n92), .Y(n90) );
  XOR2X4 U442 ( .A(n34), .B(n3), .Y(product[17]) );
  NAND2X4 U443 ( .A(n185), .B(n190), .Y(n101) );
  XNOR2X1 U444 ( .A(n121), .B(n15), .Y(product[5]) );
  NAND2X1 U445 ( .A(n144), .B(n123), .Y(n16) );
  CLKINVX1 U446 ( .A(n122), .Y(n144) );
  NOR2X2 U447 ( .A(n263), .B(n259), .Y(n229) );
  NOR2X2 U448 ( .A(n199), .B(n200), .Y(n119) );
  NOR2X4 U449 ( .A(n201), .B(n243), .Y(n122) );
  ADDFHX2 U450 ( .A(n227), .B(n209), .CI(n216), .CO(n168), .S(n169) );
  NOR2X1 U451 ( .A(n261), .B(n259), .Y(n227) );
  NAND2X2 U452 ( .A(n201), .B(n243), .Y(n123) );
  CLKINVX1 U453 ( .A(n322), .Y(n125) );
  NOR2X1 U454 ( .A(n261), .B(n257), .Y(n214) );
  NOR2X1 U455 ( .A(n259), .B(n257), .Y(n212) );
  NOR2X1 U456 ( .A(n261), .B(n256), .Y(n206) );
  NAND2X1 U457 ( .A(n130), .B(n26), .Y(n2) );
  CLKINVX1 U458 ( .A(n25), .Y(n130) );
  AOI21XL U459 ( .A0(n40), .A1(n23), .B0(n24), .Y(n22) );
  OAI21XL U460 ( .A0(n33), .A1(n25), .B0(n26), .Y(n24) );
  NOR2X1 U461 ( .A(n258), .B(n256), .Y(n203) );
  XNOR2X1 U462 ( .A(n322), .B(n127), .Y(product[3]) );
  NOR2X1 U463 ( .A(n257), .B(n256), .Y(n202) );
  NOR2X1 U464 ( .A(n255), .B(n259), .Y(n231) );
  ADDHX2 U465 ( .A(a[5]), .B(n217), .CO(n176), .S(n177) );
  NOR2XL U466 ( .A(n255), .B(n264), .Y(n246) );
  CLKBUFX2 U467 ( .A(a[0]), .Y(product[0]) );
  OAI21X2 U468 ( .A0(n70), .A1(n78), .B0(n71), .Y(n69) );
  NOR2X2 U469 ( .A(n255), .B(n262), .Y(n243) );
  NOR2X2 U470 ( .A(n263), .B(n257), .Y(n216) );
endmodule


module geofence_DW01_add_20 ( A, B, CI, SUM, CO );
  input [12:0] A;
  input [12:0] B;
  output [12:0] SUM;
  input CI;
  output CO;
  wire   n2, n3, n4, n6, n8, n17, n18, n19, n20, n22, n23, n25, n26, n27, n31,
         n32, n33, n34, n35, n36, n39, n40, n41, n42, n43, n45, n46, n47, n48,
         n50, n51, n54, n55, n56, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n84, n86, n87, n88, n89, n90, n92, n93, n94, n142, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154;

  XNOR2X4 U34 ( .A(n42), .B(n4), .Y(SUM[8]) );
  AOI21X4 U63 ( .A0(n70), .A1(n61), .B0(n62), .Y(n56) );
  AOI21X4 U84 ( .A0(n80), .A1(n72), .B0(n73), .Y(n71) );
  OAI21X4 U99 ( .A0(n81), .A1(n84), .B0(n82), .Y(n80) );
  INVX4 U112 ( .A(n80), .Y(n79) );
  XOR2X4 U113 ( .A(n79), .B(n144), .Y(SUM[2]) );
  AOI21X4 U114 ( .A0(n70), .A1(n66), .B0(n67), .Y(n65) );
  XNOR2X4 U115 ( .A(n70), .B(n8), .Y(SUM[4]) );
  XNOR2X4 U116 ( .A(n152), .B(n84), .Y(SUM[1]) );
  OAI21X2 U117 ( .A0(n79), .A1(n77), .B0(n78), .Y(n76) );
  NAND2X1 U118 ( .A(n61), .B(n45), .Y(n43) );
  CLKAND2X3 U119 ( .A(n94), .B(n82), .Y(n152) );
  NOR2X1 U120 ( .A(A[9]), .B(B[9]), .Y(n35) );
  OAI21XL U121 ( .A0(n74), .A1(n78), .B0(n75), .Y(n73) );
  CLKINVX1 U122 ( .A(n77), .Y(n93) );
  OAI21XL U123 ( .A0(n32), .A1(n26), .B0(n27), .Y(n23) );
  AND2X2 U124 ( .A(n33), .B(n18), .Y(n151) );
  CLKINVX1 U125 ( .A(n62), .Y(n60) );
  NOR2X1 U126 ( .A(A[10]), .B(B[10]), .Y(n26) );
  AO21X1 U127 ( .A0(n62), .A1(n45), .B0(n46), .Y(n142) );
  CLKINVX1 U128 ( .A(n61), .Y(n59) );
  CLKINVX1 U129 ( .A(n40), .Y(n87) );
  NOR2X1 U130 ( .A(A[5]), .B(B[5]), .Y(n63) );
  XNOR2X4 U131 ( .A(n147), .B(n3), .Y(SUM[9]) );
  AO21X4 U132 ( .A0(n42), .A1(n22), .B0(n23), .Y(n148) );
  AO21X4 U133 ( .A0(n70), .A1(n50), .B0(n51), .Y(n153) );
  INVX8 U134 ( .A(n150), .Y(n42) );
  XNOR2X4 U135 ( .A(n148), .B(n20), .Y(SUM[11]) );
  INVX8 U136 ( .A(n71), .Y(n70) );
  AO21X4 U137 ( .A0(n42), .A1(n87), .B0(n39), .Y(n147) );
  XNOR2X4 U138 ( .A(n149), .B(n2), .Y(SUM[10]) );
  AO21X4 U139 ( .A0(n42), .A1(n33), .B0(n34), .Y(n149) );
  NOR2X1 U140 ( .A(A[8]), .B(B[8]), .Y(n40) );
  NAND2X8 U141 ( .A(A[0]), .B(B[0]), .Y(n84) );
  AOI2BB1X4 U142 ( .A0N(n71), .A1N(n43), .B0(n142), .Y(n150) );
  NOR2XL U143 ( .A(n26), .B(n20), .Y(n18) );
  NOR2X1 U144 ( .A(A[7]), .B(B[7]), .Y(n47) );
  NOR2X1 U145 ( .A(n77), .B(n74), .Y(n72) );
  OAI21X1 U146 ( .A0(n35), .A1(n41), .B0(n36), .Y(n34) );
  NOR2X1 U147 ( .A(n40), .B(n35), .Y(n33) );
  NAND2XL U148 ( .A(n93), .B(n78), .Y(n144) );
  AND2XL U149 ( .A(n92), .B(n75), .Y(n145) );
  NAND2XL U150 ( .A(n89), .B(n55), .Y(n6) );
  NAND2BXL U151 ( .AN(n68), .B(n69), .Y(n8) );
  NAND2XL U152 ( .A(n90), .B(n64), .Y(n146) );
  AND2XL U153 ( .A(n88), .B(n48), .Y(n154) );
  OAI21XL U154 ( .A0(n60), .A1(n54), .B0(n55), .Y(n51) );
  OAI2BB1XL U155 ( .A0N(n42), .A1N(n151), .B0(n17), .Y(SUM[12]) );
  NOR2XL U156 ( .A(n59), .B(n54), .Y(n50) );
  XOR2X4 U157 ( .A(n76), .B(n145), .Y(SUM[3]) );
  XOR2X4 U158 ( .A(n65), .B(n146), .Y(SUM[5]) );
  INVXL U159 ( .A(n35), .Y(n86) );
  NOR2X1 U160 ( .A(A[1]), .B(B[1]), .Y(n81) );
  NAND2XL U161 ( .A(A[1]), .B(B[1]), .Y(n82) );
  NOR2X1 U162 ( .A(A[3]), .B(B[3]), .Y(n74) );
  NAND2XL U163 ( .A(A[3]), .B(B[3]), .Y(n75) );
  NAND2XL U164 ( .A(A[4]), .B(B[4]), .Y(n69) );
  NOR2X1 U165 ( .A(A[4]), .B(B[4]), .Y(n68) );
  NAND2XL U166 ( .A(A[5]), .B(B[5]), .Y(n64) );
  NOR2X1 U167 ( .A(A[6]), .B(B[6]), .Y(n54) );
  NAND2XL U168 ( .A(A[6]), .B(B[6]), .Y(n55) );
  NAND2XL U169 ( .A(A[8]), .B(B[8]), .Y(n41) );
  NAND2XL U170 ( .A(A[9]), .B(B[9]), .Y(n36) );
  CLKINVX1 U171 ( .A(n34), .Y(n32) );
  CLKINVX1 U172 ( .A(n33), .Y(n31) );
  NAND2X1 U173 ( .A(n87), .B(n41), .Y(n4) );
  CLKINVX1 U174 ( .A(n69), .Y(n67) );
  CLKINVX1 U175 ( .A(n68), .Y(n66) );
  XOR2X4 U176 ( .A(n56), .B(n6), .Y(SUM[6]) );
  NOR2X1 U177 ( .A(n31), .B(n26), .Y(n22) );
  NAND2X1 U178 ( .A(n86), .B(n36), .Y(n3) );
  XOR2X4 U179 ( .A(n153), .B(n154), .Y(SUM[7]) );
  CLKINVX1 U180 ( .A(n81), .Y(n94) );
  CLKINVX1 U181 ( .A(n74), .Y(n92) );
  OAI21X1 U182 ( .A0(n63), .A1(n69), .B0(n64), .Y(n62) );
  NOR2X1 U183 ( .A(n68), .B(n63), .Y(n61) );
  CLKINVX1 U184 ( .A(n63), .Y(n90) );
  NOR2X1 U185 ( .A(n54), .B(n47), .Y(n45) );
  OAI21XL U186 ( .A0(n47), .A1(n55), .B0(n48), .Y(n46) );
  INVXL U187 ( .A(n47), .Y(n88) );
  CLKINVX1 U188 ( .A(n54), .Y(n89) );
  CLKINVX1 U189 ( .A(n41), .Y(n39) );
  AOI21X1 U190 ( .A0(n34), .A1(n18), .B0(n19), .Y(n17) );
  NOR2X2 U191 ( .A(A[2]), .B(B[2]), .Y(n77) );
  NAND2X1 U192 ( .A(A[2]), .B(B[2]), .Y(n78) );
  CLKINVX1 U193 ( .A(A[11]), .Y(n20) );
  NAND2XL U194 ( .A(A[7]), .B(B[7]), .Y(n48) );
  NAND2XL U195 ( .A(A[10]), .B(B[10]), .Y(n27) );
  INVXL U196 ( .A(n26), .Y(n25) );
  NAND2X1 U197 ( .A(n25), .B(n27), .Y(n2) );
  NOR2X1 U198 ( .A(n27), .B(n20), .Y(n19) );
endmodule


module geofence_DW01_sub_15 ( A, B, CI, DIFF, CO );
  input [12:0] A;
  input [12:0] B;
  output [12:0] DIFF;
  input CI;
  output CO;
  wire   n3, n4, n5, n6, n7, n8, n9, n11, n12, n13, n14, n15, n16, n17, n19,
         n20, n21, n22, n24, n26, n27, n28, n29, n30, n31, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n48, n49, n50, n54, n55,
         n56, n57, n58, n59, n62, n63, n64, n65, n66, n67, n69, n70, n72, n73,
         n74, n75, n76, n77, n78, n79, n81, n82, n83, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160;

  NAND2X2 U118 ( .A(n96), .B(A[5]), .Y(n59) );
  NAND2X4 U119 ( .A(n86), .B(n64), .Y(n9) );
  INVX1 U120 ( .A(n63), .Y(n86) );
  OAI21X4 U121 ( .A0(n76), .A1(n78), .B0(n77), .Y(n75) );
  NOR2X8 U122 ( .A(n100), .B(n148), .Y(n76) );
  NAND2X4 U123 ( .A(n100), .B(n148), .Y(n77) );
  AOI21X4 U124 ( .A0(n37), .A1(n14), .B0(n15), .Y(n13) );
  INVX12 U125 ( .A(n153), .Y(n37) );
  OAI21X2 U126 ( .A0(n22), .A1(n16), .B0(n17), .Y(n15) );
  BUFX16 U127 ( .A(n13), .Y(DIFF[12]) );
  CLKXOR2X8 U128 ( .A(n160), .B(n159), .Y(DIFF[3]) );
  BUFX8 U129 ( .A(A[1]), .Y(n148) );
  INVX4 U130 ( .A(n58), .Y(n85) );
  NOR2X4 U131 ( .A(n63), .B(n58), .Y(n56) );
  OAI21X4 U132 ( .A0(n58), .A1(n64), .B0(n149), .Y(n57) );
  NOR2X4 U133 ( .A(n96), .B(A[5]), .Y(n58) );
  BUFX6 U134 ( .A(n59), .Y(n149) );
  INVX3 U135 ( .A(B[5]), .Y(n96) );
  CLKINVX4 U136 ( .A(B[1]), .Y(n100) );
  NAND2X4 U137 ( .A(n97), .B(A[4]), .Y(n64) );
  CLKINVX4 U138 ( .A(B[4]), .Y(n97) );
  AOI21X4 U139 ( .A0(n65), .A1(n45), .B0(n46), .Y(n44) );
  OAI21X4 U140 ( .A0(n55), .A1(n49), .B0(n50), .Y(n46) );
  CLKINVX6 U141 ( .A(B[8]), .Y(n93) );
  INVX6 U142 ( .A(n66), .Y(n65) );
  CLKINVX1 U143 ( .A(B[7]), .Y(n94) );
  NOR2X1 U144 ( .A(n54), .B(n49), .Y(n45) );
  CLKINVX1 U145 ( .A(n56), .Y(n54) );
  NAND2X2 U146 ( .A(n95), .B(A[6]), .Y(n50) );
  NOR2X4 U147 ( .A(n94), .B(A[7]), .Y(n42) );
  NOR2X2 U148 ( .A(n97), .B(A[4]), .Y(n63) );
  CLKINVX1 U149 ( .A(n75), .Y(n74) );
  AND2X4 U150 ( .A(n152), .B(n151), .Y(n66) );
  NAND2X2 U151 ( .A(n75), .B(n67), .Y(n152) );
  NOR2X2 U152 ( .A(n72), .B(n69), .Y(n67) );
  NOR2X4 U153 ( .A(n49), .B(n42), .Y(n40) );
  XNOR2X2 U154 ( .A(n37), .B(n5), .Y(DIFF[8]) );
  AND2X2 U155 ( .A(n79), .B(n17), .Y(n155) );
  NOR2X1 U156 ( .A(n21), .B(n16), .Y(n14) );
  CLKINVX1 U157 ( .A(B[0]), .Y(n101) );
  INVX1 U158 ( .A(n49), .Y(n48) );
  OR2X8 U159 ( .A(n91), .B(A[10]), .Y(n150) );
  OA21X4 U160 ( .A0(n69), .A1(n73), .B0(n70), .Y(n151) );
  CLKINVX1 U161 ( .A(n57), .Y(n55) );
  NOR2X2 U162 ( .A(n93), .B(A[8]), .Y(n35) );
  NAND2X2 U163 ( .A(n56), .B(n40), .Y(n38) );
  INVX1 U164 ( .A(n76), .Y(n89) );
  INVXL U165 ( .A(n35), .Y(n82) );
  AOI21X4 U166 ( .A0(n57), .A1(n40), .B0(n41), .Y(n39) );
  XOR2X4 U167 ( .A(n44), .B(n6), .Y(DIFF[7]) );
  XNOR2X4 U168 ( .A(n156), .B(n4), .Y(DIFF[9]) );
  NOR2X8 U169 ( .A(n90), .B(A[11]), .Y(n16) );
  NAND2X4 U170 ( .A(n90), .B(A[11]), .Y(n17) );
  INVXL U171 ( .A(n16), .Y(n79) );
  XOR2X4 U172 ( .A(n74), .B(n11), .Y(DIFF[2]) );
  XNOR2X4 U173 ( .A(n65), .B(n9), .Y(DIFF[4]) );
  NOR2X6 U174 ( .A(n35), .B(n30), .Y(n28) );
  XNOR2X4 U175 ( .A(n158), .B(n8), .Y(DIFF[5]) );
  NAND2X4 U176 ( .A(n92), .B(A[9]), .Y(n31) );
  INVX3 U177 ( .A(n22), .Y(n20) );
  AOI21X4 U178 ( .A0(n37), .A1(n28), .B0(n29), .Y(n27) );
  NOR2X6 U179 ( .A(n98), .B(A[3]), .Y(n69) );
  XNOR2X4 U180 ( .A(n157), .B(n7), .Y(DIFF[6]) );
  AO21X4 U181 ( .A0(n65), .A1(n56), .B0(n57), .Y(n157) );
  CLKINVX8 U182 ( .A(B[2]), .Y(n99) );
  NOR2X6 U183 ( .A(n99), .B(A[2]), .Y(n72) );
  AO21X4 U184 ( .A0(n65), .A1(n86), .B0(n62), .Y(n158) );
  INVX3 U185 ( .A(n21), .Y(n19) );
  CLKINVX4 U186 ( .A(B[3]), .Y(n98) );
  XOR2X4 U187 ( .A(n27), .B(n3), .Y(DIFF[10]) );
  OAI21X2 U188 ( .A0(n42), .A1(n50), .B0(n43), .Y(n41) );
  AO21X4 U189 ( .A0(n37), .A1(n19), .B0(n20), .Y(n154) );
  NOR2X4 U190 ( .A(n95), .B(A[6]), .Y(n49) );
  AO21X4 U191 ( .A0(n37), .A1(n82), .B0(n34), .Y(n156) );
  NAND2X2 U192 ( .A(n94), .B(A[7]), .Y(n43) );
  NAND2X2 U193 ( .A(n98), .B(A[3]), .Y(n70) );
  NAND2X4 U194 ( .A(n93), .B(A[8]), .Y(n36) );
  OA21X4 U195 ( .A0(n66), .A1(n38), .B0(n39), .Y(n153) );
  NAND2X6 U196 ( .A(n99), .B(A[2]), .Y(n73) );
  NOR2X4 U197 ( .A(n101), .B(A[0]), .Y(n78) );
  NOR2X4 U198 ( .A(n92), .B(A[9]), .Y(n30) );
  OAI21X4 U199 ( .A0(n30), .A1(n36), .B0(n31), .Y(n29) );
  AOI21X4 U200 ( .A0(n29), .A1(n150), .B0(n24), .Y(n22) );
  XOR2X4 U201 ( .A(n154), .B(n155), .Y(DIFF[11]) );
  NAND2X4 U202 ( .A(n28), .B(n150), .Y(n21) );
  NAND2X2 U203 ( .A(n83), .B(n43), .Y(n6) );
  INVX3 U204 ( .A(n26), .Y(n24) );
  NAND2X2 U205 ( .A(n87), .B(n70), .Y(n159) );
  XNOR2XL U206 ( .A(n101), .B(A[0]), .Y(DIFF[0]) );
  NAND2X1 U207 ( .A(n81), .B(n31), .Y(n4) );
  NAND2X1 U208 ( .A(n150), .B(n26), .Y(n3) );
  NAND2X1 U209 ( .A(n82), .B(n36), .Y(n5) );
  NAND2X1 U210 ( .A(n48), .B(n50), .Y(n7) );
  NAND2X1 U211 ( .A(n85), .B(n149), .Y(n8) );
  OA21X4 U212 ( .A0(n74), .A1(n72), .B0(n73), .Y(n160) );
  NAND2X1 U213 ( .A(n88), .B(n73), .Y(n11) );
  CLKINVX1 U214 ( .A(n72), .Y(n88) );
  CLKINVX1 U215 ( .A(n36), .Y(n34) );
  CLKINVX1 U216 ( .A(n30), .Y(n81) );
  CLKINVX1 U217 ( .A(n69), .Y(n87) );
  CLKINVX1 U218 ( .A(n64), .Y(n62) );
  XOR2X1 U219 ( .A(n12), .B(n78), .Y(DIFF[1]) );
  NAND2X1 U220 ( .A(n89), .B(n77), .Y(n12) );
  CLKINVX1 U221 ( .A(n42), .Y(n83) );
  NAND2X1 U222 ( .A(n91), .B(A[10]), .Y(n26) );
  INVX3 U223 ( .A(B[11]), .Y(n90) );
  INVX3 U224 ( .A(B[6]), .Y(n95) );
  INVX3 U225 ( .A(B[9]), .Y(n92) );
  INVX3 U226 ( .A(B[10]), .Y(n91) );
endmodule


module geofence_DW01_sub_14 ( A, B, CI, DIFF, CO );
  input [12:0] A;
  input [12:0] B;
  output [12:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n5, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n28, n29, n30, n31, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n45, n46, n49, n50, n51, n52,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n69,
         n70, n71, n72, n73, n75, n76, n77, n78, n79, n81, n82, n83, n84, n85,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157;
  assign DIFF[12] = n13;

  AOI21X4 U72 ( .A0(n65), .A1(n61), .B0(n62), .Y(n60) );
  XNOR2X4 U79 ( .A(n71), .B(n10), .Y(DIFF[3]) );
  INVXL U118 ( .A(n76), .Y(n89) );
  INVX6 U119 ( .A(n75), .Y(n149) );
  OR2X8 U120 ( .A(n72), .B(n69), .Y(n150) );
  NOR2X4 U121 ( .A(n91), .B(n148), .Y(n25) );
  BUFX8 U122 ( .A(A[10]), .Y(n148) );
  NOR2X4 U123 ( .A(n49), .B(n42), .Y(n40) );
  NOR2X8 U124 ( .A(n94), .B(A[7]), .Y(n42) );
  NAND2X4 U125 ( .A(n28), .B(n23), .Y(n21) );
  INVX4 U126 ( .A(n25), .Y(n23) );
  INVX3 U127 ( .A(B[3]), .Y(n98) );
  NAND2X2 U128 ( .A(n96), .B(A[5]), .Y(n59) );
  NOR2X6 U129 ( .A(n96), .B(A[5]), .Y(n58) );
  CLKINVX6 U130 ( .A(B[5]), .Y(n96) );
  XOR2X4 U131 ( .A(n154), .B(n155), .Y(DIFF[10]) );
  NAND2X2 U132 ( .A(n94), .B(A[7]), .Y(n43) );
  INVX4 U133 ( .A(B[7]), .Y(n94) );
  OAI21X2 U134 ( .A0(n42), .A1(n50), .B0(n43), .Y(n41) );
  NOR2X6 U135 ( .A(n100), .B(A[1]), .Y(n76) );
  CLKINVX6 U136 ( .A(B[1]), .Y(n100) );
  XOR2X4 U137 ( .A(n51), .B(n7), .Y(DIFF[6]) );
  NAND2X2 U138 ( .A(n56), .B(n40), .Y(n38) );
  INVX4 U139 ( .A(n56), .Y(n54) );
  NOR2X1 U140 ( .A(n21), .B(n16), .Y(n14) );
  OAI21X1 U141 ( .A0(n22), .A1(n16), .B0(n17), .Y(n15) );
  NOR2X2 U142 ( .A(n63), .B(n58), .Y(n56) );
  CLKINVX1 U143 ( .A(B[11]), .Y(n90) );
  XNOR2X1 U144 ( .A(n65), .B(n9), .Y(DIFF[4]) );
  NOR2X4 U145 ( .A(n98), .B(A[3]), .Y(n69) );
  NAND2X2 U146 ( .A(n98), .B(A[3]), .Y(n70) );
  CLKXOR2X4 U147 ( .A(n156), .B(n157), .Y(DIFF[7]) );
  AOI21X2 U148 ( .A0(n29), .A1(n23), .B0(n24), .Y(n22) );
  CLKINVX1 U149 ( .A(n26), .Y(n24) );
  NOR2X2 U150 ( .A(n90), .B(A[11]), .Y(n16) );
  CLKINVX1 U151 ( .A(n22), .Y(n20) );
  CLKINVX1 U152 ( .A(n21), .Y(n19) );
  CLKINVX1 U153 ( .A(n72), .Y(n88) );
  NOR2X6 U154 ( .A(n101), .B(A[0]), .Y(n78) );
  AND2X2 U155 ( .A(n81), .B(n31), .Y(n153) );
  XNOR2X2 U156 ( .A(n1), .B(n5), .Y(DIFF[8]) );
  INVX3 U157 ( .A(n57), .Y(n55) );
  NOR2X4 U158 ( .A(n97), .B(A[4]), .Y(n63) );
  NOR2X6 U159 ( .A(n95), .B(A[6]), .Y(n49) );
  NOR2X2 U160 ( .A(n93), .B(A[8]), .Y(n35) );
  CLKINVX1 U161 ( .A(n35), .Y(n82) );
  XNOR2X1 U162 ( .A(n101), .B(A[0]), .Y(DIFF[0]) );
  INVX8 U163 ( .A(n66), .Y(n65) );
  NAND2X2 U164 ( .A(n79), .B(n17), .Y(n2) );
  INVX6 U165 ( .A(B[4]), .Y(n97) );
  NOR2X4 U166 ( .A(n54), .B(n49), .Y(n45) );
  AOI21X4 U167 ( .A0(n1), .A1(n19), .B0(n20), .Y(n18) );
  CLKINVX8 U168 ( .A(B[0]), .Y(n101) );
  NAND2X2 U169 ( .A(n87), .B(n70), .Y(n10) );
  INVXL U170 ( .A(n69), .Y(n87) );
  OAI21X4 U171 ( .A0(n55), .A1(n49), .B0(n50), .Y(n46) );
  NOR2X8 U172 ( .A(n99), .B(A[2]), .Y(n72) );
  CLKINVX8 U173 ( .A(B[2]), .Y(n99) );
  NAND2X4 U174 ( .A(n97), .B(A[4]), .Y(n64) );
  NOR2X8 U175 ( .A(n92), .B(A[9]), .Y(n30) );
  INVX8 U176 ( .A(B[9]), .Y(n92) );
  XOR2X4 U177 ( .A(n60), .B(n8), .Y(DIFF[5]) );
  INVX6 U178 ( .A(B[6]), .Y(n95) );
  BUFX20 U179 ( .A(n37), .Y(n1) );
  NAND2X8 U180 ( .A(n93), .B(A[8]), .Y(n36) );
  INVX8 U181 ( .A(B[8]), .Y(n93) );
  NAND2X4 U182 ( .A(n91), .B(n148), .Y(n26) );
  NOR2X4 U183 ( .A(n35), .B(n30), .Y(n28) );
  XOR2X4 U184 ( .A(n12), .B(n78), .Y(DIFF[1]) );
  NAND2X1 U185 ( .A(n61), .B(n64), .Y(n9) );
  AO21X4 U186 ( .A0(n1), .A1(n28), .B0(n29), .Y(n154) );
  AO21X4 U187 ( .A0(n65), .A1(n45), .B0(n46), .Y(n156) );
  OAI21X4 U188 ( .A0(n30), .A1(n36), .B0(n31), .Y(n29) );
  NAND2X1 U189 ( .A(n85), .B(n59), .Y(n8) );
  NAND2X6 U190 ( .A(n99), .B(A[2]), .Y(n73) );
  OAI21X4 U191 ( .A0(n76), .A1(n78), .B0(n77), .Y(n75) );
  AOI21X4 U192 ( .A0(n57), .A1(n40), .B0(n41), .Y(n39) );
  NAND2X4 U193 ( .A(n100), .B(A[1]), .Y(n77) );
  NAND2X2 U194 ( .A(n95), .B(A[6]), .Y(n50) );
  OAI21X4 U195 ( .A0(n66), .A1(n38), .B0(n39), .Y(n37) );
  INVX1 U196 ( .A(n58), .Y(n85) );
  AOI21X2 U197 ( .A0(n1), .A1(n14), .B0(n15), .Y(n13) );
  AO21X4 U198 ( .A0(n1), .A1(n82), .B0(n34), .Y(n152) );
  NAND2X2 U199 ( .A(n92), .B(A[9]), .Y(n31) );
  AOI21X2 U200 ( .A0(n65), .A1(n52), .B0(n57), .Y(n51) );
  OAI21X2 U201 ( .A0(n149), .A1(n72), .B0(n73), .Y(n71) );
  OAI21X4 U202 ( .A0(n58), .A1(n64), .B0(n59), .Y(n57) );
  AND2XL U203 ( .A(n83), .B(n43), .Y(n157) );
  AND2XL U204 ( .A(n23), .B(n26), .Y(n155) );
  XOR2X1 U205 ( .A(n149), .B(n11), .Y(DIFF[2]) );
  OA21X4 U206 ( .A0(n149), .A1(n150), .B0(n151), .Y(n66) );
  OA21X4 U207 ( .A0(n69), .A1(n73), .B0(n70), .Y(n151) );
  NAND2XL U208 ( .A(n82), .B(n36), .Y(n5) );
  XOR2X4 U209 ( .A(n152), .B(n153), .Y(DIFF[9]) );
  NAND2XL U210 ( .A(n84), .B(n50), .Y(n7) );
  NAND2XL U211 ( .A(n88), .B(n73), .Y(n11) );
  INVXL U212 ( .A(n36), .Y(n34) );
  NAND2XL U213 ( .A(n89), .B(n77), .Y(n12) );
  INVXL U214 ( .A(n64), .Y(n62) );
  INVX3 U215 ( .A(B[10]), .Y(n91) );
  CLKINVX1 U216 ( .A(n54), .Y(n52) );
  XOR2X4 U217 ( .A(n18), .B(n2), .Y(DIFF[11]) );
  CLKINVX1 U218 ( .A(n16), .Y(n79) );
  CLKINVX1 U219 ( .A(n30), .Y(n81) );
  CLKINVX1 U220 ( .A(n42), .Y(n83) );
  CLKINVX1 U221 ( .A(n49), .Y(n84) );
  CLKINVX1 U222 ( .A(n63), .Y(n61) );
  NAND2X1 U223 ( .A(n90), .B(A[11]), .Y(n17) );
endmodule


module geofence_DW01_cmp6_2 ( A, B, TC, LT, GT, EQ, LE, GE, NE );
  input [12:0] A;
  input [12:0] B;
  input TC;
  output LT, GT, EQ, LE, GE, NE;
  wire   n1, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n36, n37, n38,
         n39, n40, n41, n46, n47, n48, n49, n52, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117;

  NAND2BX4 U7 ( .AN(A[11]), .B(n7), .Y(n1) );
  AOI21X4 U9 ( .A0(n8), .A1(n15), .B0(n9), .Y(n7) );
  XNOR2X4 U12 ( .A(A[10]), .B(n54), .Y(n10) );
  OAI21X4 U17 ( .A0(n19), .A1(n16), .B0(n17), .Y(n15) );
  NAND2X2 U70 ( .A(n46), .B(n114), .Y(n40) );
  NOR2X2 U71 ( .A(n28), .B(n30), .Y(n26) );
  OAI21X4 U72 ( .A0(n48), .A1(n116), .B0(n49), .Y(n47) );
  AND2X8 U73 ( .A(n110), .B(n106), .Y(n19) );
  CLKINVX2 U74 ( .A(n1), .Y(LT) );
  NAND2X6 U75 ( .A(n103), .B(n104), .Y(n105) );
  NAND2X6 U76 ( .A(n105), .B(n39), .Y(n37) );
  CLKINVX6 U77 ( .A(n41), .Y(n103) );
  INVX12 U78 ( .A(n38), .Y(n104) );
  AOI21X4 U79 ( .A0(n47), .A1(n114), .B0(n107), .Y(n41) );
  XNOR2X4 U80 ( .A(A[3]), .B(n61), .Y(n38) );
  XNOR2X4 U81 ( .A(A[1]), .B(n63), .Y(n48) );
  NAND2X1 U82 ( .A(A[3]), .B(n61), .Y(n39) );
  XNOR2X2 U83 ( .A(A[7]), .B(n57), .Y(n22) );
  CLKXOR2X2 U84 ( .A(A[4]), .B(n60), .Y(n115) );
  NOR2X4 U85 ( .A(n22), .B(n24), .Y(n20) );
  XNOR2X1 U86 ( .A(A[6]), .B(n58), .Y(n24) );
  OAI21X1 U87 ( .A0(n10), .A1(n13), .B0(n11), .Y(n9) );
  NOR2X8 U88 ( .A(n10), .B(n12), .Y(n8) );
  XNOR2X2 U89 ( .A(A[9]), .B(n55), .Y(n12) );
  OA21X4 U90 ( .A0(n22), .A1(n25), .B0(n23), .Y(n106) );
  AND2X2 U91 ( .A(A[2]), .B(n62), .Y(n107) );
  OR2X2 U92 ( .A(n6), .B(A[11]), .Y(n108) );
  AND2X2 U93 ( .A(A[4]), .B(n60), .Y(n109) );
  XNOR2X4 U94 ( .A(A[8]), .B(n56), .Y(n16) );
  NAND2X2 U95 ( .A(A[1]), .B(n63), .Y(n49) );
  AND2X8 U96 ( .A(n1), .B(n108), .Y(GT) );
  NOR2BX2 U97 ( .AN(n52), .B(n117), .Y(n116) );
  NAND2X2 U98 ( .A(n36), .B(n115), .Y(n30) );
  NOR2X4 U99 ( .A(n38), .B(n40), .Y(n36) );
  NAND2X4 U100 ( .A(n8), .B(n14), .Y(n6) );
  NOR2X6 U101 ( .A(n18), .B(n16), .Y(n14) );
  NAND2X6 U102 ( .A(n20), .B(n26), .Y(n18) );
  NAND2X2 U103 ( .A(A[6]), .B(n58), .Y(n25) );
  NAND2X1 U104 ( .A(A[7]), .B(n57), .Y(n23) );
  NAND2X4 U105 ( .A(A[9]), .B(n55), .Y(n13) );
  NAND2X4 U106 ( .A(n20), .B(n27), .Y(n110) );
  XOR2X4 U107 ( .A(A[2]), .B(n62), .Y(n114) );
  OAI21X4 U108 ( .A0(n31), .A1(n28), .B0(n29), .Y(n27) );
  NAND2X1 U109 ( .A(A[5]), .B(n59), .Y(n112) );
  NAND2X2 U110 ( .A(n111), .B(B[5]), .Y(n113) );
  NAND2X4 U111 ( .A(n112), .B(n113), .Y(n28) );
  INVX1 U112 ( .A(A[5]), .Y(n111) );
  AOI21X4 U113 ( .A0(n37), .A1(n115), .B0(n109), .Y(n31) );
  AND2X1 U114 ( .A(A[0]), .B(n64), .Y(n117) );
  XNOR2X2 U115 ( .A(A[0]), .B(n64), .Y(n52) );
  NAND2XL U116 ( .A(A[8]), .B(n56), .Y(n17) );
  NAND2XL U117 ( .A(A[10]), .B(n54), .Y(n11) );
  NAND2XL U118 ( .A(A[5]), .B(n59), .Y(n29) );
  CLKINVX1 U119 ( .A(B[1]), .Y(n63) );
  CLKINVX1 U120 ( .A(B[2]), .Y(n62) );
  CLKINVX1 U121 ( .A(B[3]), .Y(n61) );
  CLKINVX1 U122 ( .A(B[4]), .Y(n60) );
  CLKINVX1 U123 ( .A(B[5]), .Y(n59) );
  CLKINVX1 U124 ( .A(B[7]), .Y(n57) );
  CLKINVX1 U125 ( .A(B[6]), .Y(n58) );
  CLKINVX1 U126 ( .A(B[8]), .Y(n56) );
  CLKINVX1 U127 ( .A(B[9]), .Y(n55) );
  CLKINVX1 U128 ( .A(B[10]), .Y(n54) );
  CLKINVX1 U129 ( .A(B[0]), .Y(n64) );
  NOR2X1 U130 ( .A(n48), .B(n52), .Y(n46) );
endmodule


module geofence_DW01_cmp6_3 ( A, B, TC, LT, GT, EQ, LE, GE, NE );
  input [12:0] A;
  input [12:0] B;
  input TC;
  output LT, GT, EQ, LE, GE, NE;
  wire   n1, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n36, n37,
         n38, n39, n40, n41, n46, n47, n48, n49, n52, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115;

  NAND2BX4 U7 ( .AN(A[11]), .B(n7), .Y(n1) );
  XNOR2X4 U70 ( .A(A[1]), .B(n63), .Y(n48) );
  OR2X8 U71 ( .A(n41), .B(n38), .Y(n103) );
  NAND2X6 U72 ( .A(n103), .B(n39), .Y(n37) );
  XNOR2X2 U73 ( .A(A[10]), .B(n54), .Y(n10) );
  NOR2X2 U74 ( .A(n48), .B(n52), .Y(n46) );
  AND2X8 U75 ( .A(n1), .B(n105), .Y(GT) );
  CLKAND2X3 U76 ( .A(n52), .B(n112), .Y(n114) );
  CLKXOR2X2 U77 ( .A(A[4]), .B(n60), .Y(n115) );
  NAND2X4 U78 ( .A(n110), .B(n111), .Y(n28) );
  NAND2X1 U79 ( .A(A[5]), .B(n59), .Y(n110) );
  NAND2X2 U80 ( .A(n108), .B(n109), .Y(n111) );
  NOR2X2 U81 ( .A(n22), .B(n24), .Y(n20) );
  NAND2X1 U82 ( .A(A[8]), .B(n56), .Y(n17) );
  XNOR2X1 U83 ( .A(A[9]), .B(n55), .Y(n12) );
  AND2X2 U84 ( .A(A[2]), .B(n62), .Y(n104) );
  OR2X2 U85 ( .A(n6), .B(A[11]), .Y(n105) );
  AND2X2 U86 ( .A(A[4]), .B(n60), .Y(n106) );
  XNOR2X4 U87 ( .A(A[7]), .B(n57), .Y(n22) );
  AOI21X4 U88 ( .A0(n37), .A1(n115), .B0(n106), .Y(n31) );
  NAND2X4 U89 ( .A(n36), .B(n115), .Y(n30) );
  OAI21X4 U90 ( .A0(n48), .A1(n114), .B0(n49), .Y(n47) );
  NAND2X1 U91 ( .A(A[1]), .B(n63), .Y(n49) );
  OAI21X2 U92 ( .A0(n10), .A1(n13), .B0(n11), .Y(n9) );
  NAND2X1 U93 ( .A(A[3]), .B(n61), .Y(n39) );
  CLKINVX2 U94 ( .A(n1), .Y(LT) );
  OAI21X4 U95 ( .A0(n31), .A1(n28), .B0(n29), .Y(n27) );
  NAND2X2 U96 ( .A(n8), .B(n14), .Y(n6) );
  AOI21X4 U97 ( .A0(n47), .A1(n113), .B0(n104), .Y(n41) );
  XNOR2X4 U98 ( .A(A[3]), .B(n61), .Y(n38) );
  NAND2X1 U99 ( .A(n46), .B(n113), .Y(n40) );
  XOR2X4 U100 ( .A(A[2]), .B(n62), .Y(n113) );
  AND2X8 U101 ( .A(n20), .B(n27), .Y(n107) );
  NOR2X8 U102 ( .A(n107), .B(n21), .Y(n19) );
  OAI21X4 U103 ( .A0(n22), .A1(n25), .B0(n23), .Y(n21) );
  OAI21X4 U104 ( .A0(n19), .A1(n16), .B0(n17), .Y(n15) );
  CLKINVX1 U105 ( .A(A[5]), .Y(n108) );
  CLKINVX1 U106 ( .A(n59), .Y(n109) );
  INVX1 U107 ( .A(B[5]), .Y(n59) );
  NOR2X4 U108 ( .A(n28), .B(n30), .Y(n26) );
  NOR2X4 U109 ( .A(n10), .B(n12), .Y(n8) );
  NAND2X1 U110 ( .A(A[6]), .B(n58), .Y(n25) );
  AOI21X4 U111 ( .A0(n8), .A1(n15), .B0(n9), .Y(n7) );
  NAND2X2 U112 ( .A(n20), .B(n26), .Y(n18) );
  NOR2X4 U113 ( .A(n18), .B(n16), .Y(n14) );
  XNOR2X1 U114 ( .A(A[6]), .B(n58), .Y(n24) );
  NAND2XL U115 ( .A(A[0]), .B(n64), .Y(n112) );
  XNOR2X2 U116 ( .A(A[8]), .B(n56), .Y(n16) );
  NAND2XL U117 ( .A(A[9]), .B(n55), .Y(n13) );
  NOR2X4 U118 ( .A(n38), .B(n40), .Y(n36) );
  XNOR2X1 U119 ( .A(A[0]), .B(n64), .Y(n52) );
  NAND2XL U120 ( .A(A[7]), .B(n57), .Y(n23) );
  NAND2XL U121 ( .A(A[10]), .B(n54), .Y(n11) );
  NAND2XL U122 ( .A(A[5]), .B(n59), .Y(n29) );
  CLKINVX1 U123 ( .A(B[2]), .Y(n62) );
  CLKINVX1 U124 ( .A(B[1]), .Y(n63) );
  CLKINVX1 U125 ( .A(B[4]), .Y(n60) );
  CLKINVX1 U126 ( .A(B[3]), .Y(n61) );
  CLKINVX1 U127 ( .A(B[7]), .Y(n57) );
  CLKINVX1 U128 ( .A(B[6]), .Y(n58) );
  CLKINVX1 U129 ( .A(B[10]), .Y(n54) );
  CLKINVX1 U130 ( .A(B[9]), .Y(n55) );
  CLKINVX1 U131 ( .A(B[8]), .Y(n56) );
  CLKINVX1 U132 ( .A(B[0]), .Y(n64) );
endmodule


module geofence_DW01_add_21 ( A, B, CI, SUM, CO );
  input [20:0] A;
  input [20:0] B;
  output [20:0] SUM;
  input CI;
  output CO;
  wire   n3, n4, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n20, n25,
         n26, n28, n29, n30, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n53, n54, n55, n56,
         n57, n58, n60, n61, n62, n63, n64, n65, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n88,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n133, n135, n136, n137, n138,
         n139, n141, n143, n145, n146, n147, n148, n149, n151, n152, n153,
         n227, n228, n229, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240;
  assign SUM[20] = n20;
  assign SUM[1] = n136;

  OAI21X4 U21 ( .A0(n72), .A1(n33), .B0(n34), .Y(n32) );
  OAI21X4 U112 ( .A0(n120), .A1(n100), .B0(n101), .Y(n99) );
  AOI21X4 U145 ( .A0(n129), .A1(n121), .B0(n122), .Y(n120) );
  OAI21X4 U147 ( .A0(n123), .A1(n127), .B0(n124), .Y(n122) );
  NOR2X6 U180 ( .A(A[10]), .B(B[10]), .Y(n96) );
  NAND2X6 U181 ( .A(A[18]), .B(B[18]), .Y(n29) );
  NOR2X8 U182 ( .A(A[16]), .B(B[16]), .Y(n46) );
  NOR2X8 U183 ( .A(A[11]), .B(B[11]), .Y(n93) );
  INVX1 U184 ( .A(n92), .Y(n90) );
  NOR2X8 U185 ( .A(n107), .B(n104), .Y(n102) );
  CLKINVX8 U186 ( .A(n71), .Y(n69) );
  NAND2X4 U187 ( .A(n91), .B(n73), .Y(n71) );
  NAND2X6 U188 ( .A(A[14]), .B(B[14]), .Y(n65) );
  OAI21X4 U189 ( .A0(n75), .A1(n83), .B0(n76), .Y(n74) );
  NOR2X8 U190 ( .A(A[13]), .B(B[13]), .Y(n75) );
  NOR2X8 U191 ( .A(A[9]), .B(B[9]), .Y(n104) );
  CLKINVX8 U192 ( .A(n99), .Y(n98) );
  NOR2X4 U193 ( .A(A[14]), .B(B[14]), .Y(n64) );
  OAI21X4 U194 ( .A0(n98), .A1(n49), .B0(n50), .Y(n48) );
  OAI21X2 U195 ( .A0(n98), .A1(n40), .B0(n41), .Y(n39) );
  OA21X4 U196 ( .A0(n98), .A1(n67), .B0(n68), .Y(n239) );
  OA21X4 U197 ( .A0(n98), .A1(n60), .B0(n61), .Y(n237) );
  OAI21X4 U198 ( .A0(n98), .A1(n85), .B0(n90), .Y(n84) );
  OAI21X2 U199 ( .A0(n98), .A1(n78), .B0(n79), .Y(n77) );
  AOI21X1 U200 ( .A0(n70), .A1(n42), .B0(n43), .Y(n41) );
  OAI21X2 U201 ( .A0(n104), .A1(n108), .B0(n105), .Y(n103) );
  OAI21X2 U202 ( .A0(n109), .A1(n107), .B0(n108), .Y(n106) );
  NAND2X4 U203 ( .A(n148), .B(n108), .Y(n12) );
  NAND2X4 U204 ( .A(A[8]), .B(B[8]), .Y(n108) );
  XNOR2X4 U205 ( .A(n39), .B(n3), .Y(SUM[17]) );
  INVX3 U206 ( .A(n53), .Y(n51) );
  CLKINVX1 U207 ( .A(n91), .Y(n85) );
  AOI21X1 U208 ( .A0(n88), .A1(n80), .B0(n81), .Y(n79) );
  OAI21X1 U209 ( .A0(n130), .A1(n133), .B0(n131), .Y(n129) );
  NAND2X2 U210 ( .A(A[7]), .B(B[7]), .Y(n113) );
  NAND2X1 U211 ( .A(A[6]), .B(B[6]), .Y(n118) );
  NOR2X4 U212 ( .A(A[7]), .B(B[7]), .Y(n112) );
  NAND2X1 U213 ( .A(A[4]), .B(B[4]), .Y(n127) );
  NOR2X1 U214 ( .A(A[4]), .B(B[4]), .Y(n126) );
  NAND2X1 U215 ( .A(n147), .B(n105), .Y(n11) );
  NOR2X4 U216 ( .A(n117), .B(n112), .Y(n110) );
  NAND2X1 U217 ( .A(A[2]), .B(B[2]), .Y(n133) );
  XNOR2X1 U218 ( .A(n48), .B(n4), .Y(SUM[16]) );
  OA21XL U219 ( .A0(n25), .A1(n29), .B0(n26), .Y(n235) );
  AND2X2 U220 ( .A(n231), .B(n135), .Y(SUM[0]) );
  AND2X2 U221 ( .A(n138), .B(n29), .Y(n227) );
  OR2X1 U222 ( .A(n28), .B(n25), .Y(n228) );
  NOR2X4 U223 ( .A(A[12]), .B(B[12]), .Y(n82) );
  CLKINVX1 U224 ( .A(n82), .Y(n80) );
  NOR2X1 U225 ( .A(A[6]), .B(B[6]), .Y(n117) );
  OR2X1 U226 ( .A(A[2]), .B(B[2]), .Y(n229) );
  AND2X2 U227 ( .A(n229), .B(n133), .Y(SUM[2]) );
  OR2X1 U228 ( .A(A[0]), .B(B[0]), .Y(n231) );
  CLKINVX1 U229 ( .A(n135), .Y(n136) );
  OAI21X1 U230 ( .A0(n30), .A1(n228), .B0(n235), .Y(n20) );
  NAND2X4 U231 ( .A(A[17]), .B(B[17]), .Y(n38) );
  NAND2X6 U232 ( .A(n55), .B(n35), .Y(n33) );
  INVX3 U233 ( .A(n72), .Y(n70) );
  CLKINVX1 U234 ( .A(n56), .Y(n54) );
  OAI21X2 U235 ( .A0(n54), .A1(n44), .B0(n47), .Y(n43) );
  AOI21X1 U236 ( .A0(n70), .A1(n51), .B0(n56), .Y(n50) );
  NOR2X8 U237 ( .A(A[15]), .B(B[15]), .Y(n57) );
  NAND2X4 U238 ( .A(A[15]), .B(B[15]), .Y(n58) );
  NOR2X4 U239 ( .A(n53), .B(n44), .Y(n42) );
  NAND2X2 U240 ( .A(n69), .B(n51), .Y(n49) );
  CLKINVX1 U241 ( .A(n55), .Y(n53) );
  XNOR2X4 U242 ( .A(n30), .B(n227), .Y(SUM[18]) );
  INVX4 U243 ( .A(n28), .Y(n138) );
  XOR2X4 U244 ( .A(n232), .B(n233), .Y(SUM[19]) );
  OAI21X4 U245 ( .A0(n30), .A1(n28), .B0(n29), .Y(n232) );
  CLKAND2X8 U246 ( .A(n137), .B(n26), .Y(n233) );
  NOR2X8 U247 ( .A(A[17]), .B(B[17]), .Y(n37) );
  NAND2X2 U248 ( .A(A[19]), .B(B[19]), .Y(n26) );
  OAI21X4 U249 ( .A0(n37), .A1(n47), .B0(n38), .Y(n36) );
  NOR2X8 U250 ( .A(n46), .B(n37), .Y(n35) );
  OAI21X4 U251 ( .A0(n57), .A1(n65), .B0(n58), .Y(n56) );
  NAND2X6 U252 ( .A(A[10]), .B(B[10]), .Y(n97) );
  AOI21X4 U253 ( .A0(n92), .A1(n73), .B0(n74), .Y(n72) );
  AOI21X4 U254 ( .A0(n56), .A1(n35), .B0(n36), .Y(n34) );
  NAND2X6 U255 ( .A(A[16]), .B(B[16]), .Y(n47) );
  NOR2X4 U256 ( .A(n64), .B(n57), .Y(n55) );
  NOR2X4 U257 ( .A(n96), .B(n93), .Y(n91) );
  NOR2X4 U258 ( .A(n82), .B(n75), .Y(n73) );
  NOR2X4 U259 ( .A(A[8]), .B(B[8]), .Y(n107) );
  AND2X4 U260 ( .A(n141), .B(n58), .Y(n238) );
  NAND2X2 U261 ( .A(A[9]), .B(B[9]), .Y(n105) );
  NAND2X2 U262 ( .A(A[13]), .B(B[13]), .Y(n76) );
  NAND2XL U263 ( .A(n91), .B(n80), .Y(n78) );
  NAND2X6 U264 ( .A(A[12]), .B(B[12]), .Y(n83) );
  NOR2X6 U265 ( .A(A[18]), .B(B[18]), .Y(n28) );
  NAND2XL U266 ( .A(A[3]), .B(B[3]), .Y(n131) );
  NAND2X2 U267 ( .A(A[11]), .B(B[11]), .Y(n94) );
  AOI21X4 U268 ( .A0(n111), .A1(n102), .B0(n103), .Y(n101) );
  OAI21X4 U269 ( .A0(n93), .A1(n97), .B0(n94), .Y(n92) );
  NAND2X2 U270 ( .A(n110), .B(n102), .Y(n100) );
  NAND2X2 U271 ( .A(n42), .B(n69), .Y(n40) );
  NOR2X2 U272 ( .A(A[19]), .B(B[19]), .Y(n25) );
  AOI21X4 U273 ( .A0(n99), .A1(n234), .B0(n32), .Y(n30) );
  NOR2X4 U274 ( .A(n71), .B(n33), .Y(n234) );
  INVXL U275 ( .A(n104), .Y(n147) );
  OAI21X4 U276 ( .A0(n112), .A1(n118), .B0(n113), .Y(n111) );
  INVXL U277 ( .A(n120), .Y(n119) );
  INVXL U278 ( .A(n117), .Y(n115) );
  INVXL U279 ( .A(n118), .Y(n116) );
  INVXL U280 ( .A(n123), .Y(n151) );
  XNOR2X1 U281 ( .A(n236), .B(n13), .Y(SUM[7]) );
  AO21XL U282 ( .A0(n119), .A1(n115), .B0(n116), .Y(n236) );
  CLKINVX1 U283 ( .A(n69), .Y(n67) );
  CLKINVX1 U284 ( .A(n70), .Y(n68) );
  NAND2XL U285 ( .A(n69), .B(n62), .Y(n60) );
  CLKINVX1 U286 ( .A(n83), .Y(n81) );
  CLKINVX1 U287 ( .A(n90), .Y(n88) );
  AOI21XL U288 ( .A0(n70), .A1(n62), .B0(n63), .Y(n61) );
  CLKINVX1 U289 ( .A(n65), .Y(n63) );
  CLKINVX1 U290 ( .A(n64), .Y(n62) );
  CLKINVX1 U291 ( .A(n57), .Y(n141) );
  CLKINVX1 U292 ( .A(n75), .Y(n143) );
  CLKINVX1 U293 ( .A(n93), .Y(n145) );
  AOI21X1 U294 ( .A0(n119), .A1(n110), .B0(n111), .Y(n109) );
  CLKINVX1 U295 ( .A(n25), .Y(n137) );
  CLKINVX1 U296 ( .A(n45), .Y(n44) );
  CLKINVX1 U297 ( .A(n46), .Y(n45) );
  CLKINVX1 U298 ( .A(n37), .Y(n139) );
  CLKINVX1 U299 ( .A(n112), .Y(n149) );
  NOR2X2 U300 ( .A(A[5]), .B(B[5]), .Y(n123) );
  NOR2X4 U301 ( .A(n126), .B(n123), .Y(n121) );
  NAND2X1 U302 ( .A(A[5]), .B(B[5]), .Y(n124) );
  CLKINVX1 U303 ( .A(n129), .Y(n128) );
  NOR2X1 U304 ( .A(A[3]), .B(B[3]), .Y(n130) );
  NAND2XL U305 ( .A(n139), .B(n38), .Y(n3) );
  NAND2XL U306 ( .A(n45), .B(n47), .Y(n4) );
  XNOR2X1 U307 ( .A(n237), .B(n238), .Y(SUM[15]) );
  XNOR2X1 U308 ( .A(n239), .B(n240), .Y(SUM[14]) );
  AND2XL U309 ( .A(n62), .B(n65), .Y(n240) );
  XNOR2X1 U310 ( .A(n77), .B(n7), .Y(SUM[13]) );
  NAND2XL U311 ( .A(n143), .B(n76), .Y(n7) );
  XNOR2X1 U312 ( .A(n84), .B(n8), .Y(SUM[12]) );
  NAND2XL U313 ( .A(n80), .B(n83), .Y(n8) );
  XNOR2X1 U314 ( .A(n95), .B(n9), .Y(SUM[11]) );
  NAND2XL U315 ( .A(n145), .B(n94), .Y(n9) );
  OAI21XL U316 ( .A0(n98), .A1(n96), .B0(n97), .Y(n95) );
  XOR2XL U317 ( .A(n98), .B(n10), .Y(SUM[10]) );
  NAND2XL U318 ( .A(n146), .B(n97), .Y(n10) );
  INVXL U319 ( .A(n96), .Y(n146) );
  XOR2X1 U320 ( .A(n109), .B(n12), .Y(SUM[8]) );
  INVXL U321 ( .A(n107), .Y(n148) );
  XNOR2X1 U322 ( .A(n106), .B(n11), .Y(SUM[9]) );
  NAND2XL U323 ( .A(n149), .B(n113), .Y(n13) );
  XNOR2X1 U324 ( .A(n119), .B(n14), .Y(SUM[6]) );
  NAND2XL U325 ( .A(n115), .B(n118), .Y(n14) );
  XNOR2X1 U326 ( .A(n125), .B(n15), .Y(SUM[5]) );
  OAI21XL U327 ( .A0(n128), .A1(n126), .B0(n127), .Y(n125) );
  NAND2XL U328 ( .A(n151), .B(n124), .Y(n15) );
  XOR2X1 U329 ( .A(n128), .B(n16), .Y(SUM[4]) );
  NAND2XL U330 ( .A(n152), .B(n127), .Y(n16) );
  INVXL U331 ( .A(n126), .Y(n152) );
  XOR2X1 U332 ( .A(n17), .B(n133), .Y(SUM[3]) );
  NAND2XL U333 ( .A(n153), .B(n131), .Y(n17) );
  INVXL U334 ( .A(n130), .Y(n153) );
  NAND2X1 U335 ( .A(A[0]), .B(B[0]), .Y(n135) );
endmodule


module geofence_DW01_add_23 ( A, B, CI, SUM, CO );
  input [4:0] A;
  input [4:0] B;
  output [4:0] SUM;
  input CI;
  output CO;
  wire   n82, n52, n53, n54, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81;

  INVX8 U39 ( .A(n79), .Y(n75) );
  INVX12 U40 ( .A(A[2]), .Y(n81) );
  CLKINVX20 U41 ( .A(n54), .Y(CO) );
  NAND2X8 U42 ( .A(n80), .B(n81), .Y(n66) );
  OR2X8 U43 ( .A(B[3]), .B(A[3]), .Y(n58) );
  OA21X4 U44 ( .A0(n73), .A1(n56), .B0(n59), .Y(n52) );
  NAND2X6 U45 ( .A(n52), .B(n74), .Y(n82) );
  CLKINVX6 U46 ( .A(A[4]), .Y(n74) );
  INVX12 U47 ( .A(n82), .Y(n54) );
  OR2X4 U48 ( .A(B[0]), .B(A[0]), .Y(n71) );
  CLKINVX1 U49 ( .A(n65), .Y(n62) );
  NAND2X1 U50 ( .A(n65), .B(n64), .Y(n68) );
  XOR2X1 U51 ( .A(n69), .B(n70), .Y(SUM[0]) );
  CLKINVX1 U52 ( .A(n58), .Y(n73) );
  NAND2X1 U53 ( .A(B[3]), .B(A[3]), .Y(n59) );
  NAND2BX2 U54 ( .AN(n80), .B(A[2]), .Y(n67) );
  OR2X4 U55 ( .A(B[1]), .B(A[1]), .Y(n65) );
  CLKINVX6 U56 ( .A(n64), .Y(n53) );
  NAND2X8 U57 ( .A(A[1]), .B(B[1]), .Y(n64) );
  NAND2X2 U58 ( .A(n66), .B(n65), .Y(n76) );
  OAI2BB1X4 U59 ( .A0N(n75), .A1N(n76), .B0(n77), .Y(n56) );
  NAND2X4 U60 ( .A(B[0]), .B(A[0]), .Y(n72) );
  OAI2BB1X4 U61 ( .A0N(n53), .A1N(n66), .B0(n67), .Y(n79) );
  NAND2X4 U62 ( .A(n63), .B(n75), .Y(n77) );
  NAND2XL U63 ( .A(n66), .B(n67), .Y(n60) );
  INVXL U64 ( .A(B[2]), .Y(n80) );
  NAND2XL U65 ( .A(n71), .B(n72), .Y(n70) );
  CLKINVX6 U66 ( .A(n78), .Y(n63) );
  XOR2X1 U67 ( .A(n60), .B(n61), .Y(SUM[2]) );
  XOR2X1 U68 ( .A(n68), .B(n63), .Y(SUM[1]) );
  XOR2XL U69 ( .A(n56), .B(n57), .Y(SUM[3]) );
  NAND2XL U70 ( .A(n58), .B(n59), .Y(n57) );
  INVXL U71 ( .A(CI), .Y(n69) );
  OAI2BB1X4 U72 ( .A0N(CI), .A1N(n71), .B0(n72), .Y(n78) );
  OA21XL U73 ( .A0(n62), .A1(n63), .B0(n64), .Y(n61) );
endmodule


module geofence_DW01_add_24 ( A, B, CI, SUM, CO );
  input [5:0] A;
  input [5:0] B;
  output [5:0] SUM;
  input CI;
  output CO;
  wire   n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102;

  NAND2X4 U50 ( .A(n99), .B(n100), .Y(n82) );
  NAND2X6 U51 ( .A(B[1]), .B(A[1]), .Y(n81) );
  NAND2X6 U52 ( .A(B[4]), .B(A[4]), .Y(n74) );
  INVX4 U53 ( .A(n85), .Y(n80) );
  OAI2BB1X4 U54 ( .A0N(CI), .A1N(n88), .B0(n89), .Y(n85) );
  AND2X2 U55 ( .A(n82), .B(n81), .Y(n67) );
  OA21X2 U56 ( .A0(n79), .A1(n80), .B0(n81), .Y(n78) );
  INVX4 U57 ( .A(n81), .Y(n97) );
  OR2X4 U58 ( .A(B[4]), .B(A[4]), .Y(n73) );
  OR2X1 U59 ( .A(B[0]), .B(A[0]), .Y(n88) );
  NAND2X1 U60 ( .A(B[0]), .B(A[0]), .Y(n89) );
  XOR2X1 U61 ( .A(n68), .B(n69), .Y(SUM[4]) );
  NAND2X1 U62 ( .A(B[2]), .B(A[2]), .Y(n84) );
  INVX1 U63 ( .A(n84), .Y(n98) );
  CLKINVX1 U64 ( .A(A[1]), .Y(n100) );
  CLKINVX1 U65 ( .A(n76), .Y(n70) );
  INVX3 U66 ( .A(n92), .Y(n65) );
  CLKINVX1 U67 ( .A(n74), .Y(n66) );
  NAND2BX2 U68 ( .AN(n72), .B(n73), .Y(n92) );
  NOR3X6 U69 ( .A(n93), .B(n71), .C(n70), .Y(n90) );
  CLKINVX3 U70 ( .A(A[2]), .Y(n102) );
  NAND2X6 U71 ( .A(n101), .B(n102), .Y(n83) );
  OA21X1 U72 ( .A0(n70), .A1(n71), .B0(n72), .Y(n69) );
  NAND2XL U73 ( .A(B[3]), .B(A[3]), .Y(n72) );
  NAND2X2 U74 ( .A(n83), .B(n84), .Y(n77) );
  CLKINVX1 U75 ( .A(n73), .Y(n93) );
  XNOR2X1 U76 ( .A(n67), .B(n80), .Y(SUM[1]) );
  OR3X6 U77 ( .A(n65), .B(A[5]), .C(n66), .Y(n91) );
  NAND2XL U78 ( .A(n73), .B(n74), .Y(n68) );
  OR2X8 U79 ( .A(n94), .B(n95), .Y(n71) );
  XOR2X1 U80 ( .A(n86), .B(n87), .Y(SUM[0]) );
  OR2XL U81 ( .A(B[3]), .B(A[3]), .Y(n76) );
  INVXL U82 ( .A(B[2]), .Y(n101) );
  INVXL U83 ( .A(n82), .Y(n79) );
  NAND2X1 U84 ( .A(n88), .B(n89), .Y(n87) );
  CLKINVX1 U85 ( .A(CI), .Y(n86) );
  INVXL U86 ( .A(B[1]), .Y(n99) );
  XOR2XL U87 ( .A(n71), .B(n75), .Y(SUM[3]) );
  NAND2XL U88 ( .A(n76), .B(n72), .Y(n75) );
  NOR2X4 U89 ( .A(n96), .B(n85), .Y(n95) );
  XOR2X4 U90 ( .A(n77), .B(n78), .Y(SUM[2]) );
  OR2X8 U91 ( .A(n90), .B(n91), .Y(CO) );
  AOI21X4 U92 ( .A0(n83), .A1(n82), .B0(n96), .Y(n94) );
  AO21X4 U93 ( .A0(n97), .A1(n83), .B0(n98), .Y(n96) );
endmodule


module geofence_DW01_add_25 ( A, B, CI, SUM, CO );
  input [6:0] A;
  input [6:0] B;
  output [6:0] SUM;
  input CI;
  output CO;
  wire   n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123;

  NOR2X4 U62 ( .A(n111), .B(n112), .Y(n110) );
  NOR2X2 U63 ( .A(n113), .B(n88), .Y(n111) );
  NOR2X6 U64 ( .A(n87), .B(n113), .Y(n112) );
  CLKINVX3 U65 ( .A(n103), .Y(n120) );
  NAND2X4 U66 ( .A(B[2]), .B(A[2]), .Y(n103) );
  NOR2X4 U67 ( .A(n118), .B(n105), .Y(n117) );
  NAND2X4 U68 ( .A(B[0]), .B(A[0]), .Y(n108) );
  OR2X6 U69 ( .A(B[0]), .B(A[0]), .Y(n107) );
  OAI2BB1X2 U70 ( .A0N(n114), .A1N(n79), .B0(n94), .Y(n87) );
  XOR2X1 U71 ( .A(n104), .B(n99), .Y(SUM[1]) );
  NAND2BX2 U72 ( .AN(A[6]), .B(n89), .Y(n113) );
  CLKINVX8 U73 ( .A(n100), .Y(n119) );
  OAI2BB1X1 U74 ( .A0N(CI), .A1N(n107), .B0(n108), .Y(n105) );
  NAND2X2 U75 ( .A(n121), .B(n122), .Y(n102) );
  INVX3 U76 ( .A(A[2]), .Y(n122) );
  XOR2X1 U77 ( .A(n82), .B(n83), .Y(SUM[5]) );
  OAI21X1 U78 ( .A0(n90), .A1(n84), .B0(n91), .Y(n81) );
  XOR2X1 U79 ( .A(n84), .B(n95), .Y(SUM[3]) );
  NAND2X2 U80 ( .A(n79), .B(n92), .Y(n85) );
  NOR3X8 U81 ( .A(n85), .B(n84), .C(n115), .Y(n109) );
  OR2X8 U82 ( .A(n109), .B(n110), .Y(CO) );
  OR2X2 U83 ( .A(B[3]), .B(A[3]), .Y(n92) );
  BUFX8 U84 ( .A(n93), .Y(n79) );
  NAND2BX2 U85 ( .AN(B[4]), .B(n123), .Y(n93) );
  INVX4 U86 ( .A(A[4]), .Y(n123) );
  OR2X4 U87 ( .A(B[5]), .B(A[5]), .Y(n88) );
  INVX3 U88 ( .A(n91), .Y(n114) );
  NAND2X2 U89 ( .A(n92), .B(n91), .Y(n95) );
  NAND2X4 U90 ( .A(B[3]), .B(A[3]), .Y(n91) );
  NAND2X4 U91 ( .A(B[5]), .B(A[5]), .Y(n89) );
  OA21X4 U92 ( .A0(n98), .A1(n99), .B0(n100), .Y(n97) );
  XNOR2X1 U93 ( .A(CI), .B(n106), .Y(SUM[0]) );
  XOR2X1 U94 ( .A(n80), .B(n81), .Y(SUM[4]) );
  AND2XL U95 ( .A(n79), .B(n94), .Y(n80) );
  NAND2XL U96 ( .A(n102), .B(n103), .Y(n96) );
  OR2X2 U97 ( .A(A[1]), .B(B[1]), .Y(n101) );
  CLKINVX1 U98 ( .A(n87), .Y(n86) );
  NAND2XL U99 ( .A(B[4]), .B(A[4]), .Y(n94) );
  CLKINVX1 U100 ( .A(n88), .Y(n115) );
  CLKINVX1 U101 ( .A(n101), .Y(n98) );
  NAND2XL U102 ( .A(n101), .B(n100), .Y(n104) );
  CLKINVX1 U103 ( .A(n92), .Y(n90) );
  NAND2X1 U104 ( .A(n88), .B(n89), .Y(n82) );
  INVXL U105 ( .A(B[2]), .Y(n121) );
  CLKINVX1 U106 ( .A(n105), .Y(n99) );
  NAND2X1 U107 ( .A(n107), .B(n108), .Y(n106) );
  NAND2X8 U108 ( .A(B[1]), .B(A[1]), .Y(n100) );
  OA21XL U109 ( .A0(n84), .A1(n85), .B0(n86), .Y(n83) );
  XOR2X4 U110 ( .A(n96), .B(n97), .Y(SUM[2]) );
  OR2X8 U111 ( .A(n116), .B(n117), .Y(n84) );
  AOI21X4 U112 ( .A0(n102), .A1(n101), .B0(n118), .Y(n116) );
  AO21X4 U113 ( .A0(n119), .A1(n102), .B0(n120), .Y(n118) );
endmodule


module geofence_DW01_add_26 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145;

  OR2X8 U73 ( .A(B[4]), .B(A[4]), .Y(n111) );
  NAND2X4 U74 ( .A(B[3]), .B(A[3]), .Y(n113) );
  NAND2X4 U75 ( .A(B[2]), .B(A[2]), .Y(n123) );
  AOI21X4 U76 ( .A0(n104), .A1(n97), .B0(n145), .Y(n94) );
  INVX2 U77 ( .A(n98), .Y(n145) );
  NAND2X1 U78 ( .A(B[0]), .B(A[0]), .Y(n129) );
  OR2X2 U79 ( .A(B[0]), .B(A[0]), .Y(n128) );
  XOR2X1 U80 ( .A(n126), .B(n127), .Y(SUM[0]) );
  NAND2X2 U81 ( .A(n97), .B(n101), .Y(n137) );
  AND2X4 U82 ( .A(n122), .B(n121), .Y(n92) );
  OA21XL U83 ( .A0(n118), .A1(n119), .B0(n120), .Y(n117) );
  CLKINVX1 U84 ( .A(n125), .Y(n119) );
  OAI2BB1X1 U85 ( .A0N(n113), .A1N(n99), .B0(n114), .Y(n109) );
  INVX3 U86 ( .A(n120), .Y(n141) );
  NAND2X4 U87 ( .A(n94), .B(n108), .Y(n131) );
  INVX4 U88 ( .A(n99), .Y(n134) );
  XOR2X1 U89 ( .A(n105), .B(n106), .Y(SUM[5]) );
  XOR2X1 U90 ( .A(n95), .B(n96), .Y(SUM[6]) );
  NAND3X4 U91 ( .A(n134), .B(n135), .C(n136), .Y(n133) );
  NAND2X4 U92 ( .A(n111), .B(n114), .Y(n102) );
  AOI21X1 U93 ( .A0(n101), .A1(n103), .B0(n104), .Y(n93) );
  NAND2X4 U94 ( .A(B[6]), .B(A[6]), .Y(n98) );
  CLKINVX8 U95 ( .A(n103), .Y(n108) );
  NAND2X1 U96 ( .A(B[5]), .B(A[5]), .Y(n107) );
  CLKXOR2X1 U97 ( .A(n99), .B(n115), .Y(SUM[3]) );
  OR2X8 U98 ( .A(n138), .B(n139), .Y(n99) );
  AOI22X1 U99 ( .A0(n93), .A1(n99), .B0(n93), .B1(n100), .Y(n95) );
  INVX3 U100 ( .A(n107), .Y(n104) );
  CLKINVX3 U101 ( .A(n137), .Y(n135) );
  OAI2BB1X4 U102 ( .A0N(n144), .A1N(n111), .B0(n112), .Y(n103) );
  CLKINVX3 U103 ( .A(A[1]), .Y(n143) );
  NAND2X6 U104 ( .A(B[1]), .B(A[1]), .Y(n120) );
  NOR2X4 U105 ( .A(n92), .B(n140), .Y(n138) );
  OR2X4 U106 ( .A(B[2]), .B(A[2]), .Y(n122) );
  NAND2X4 U107 ( .A(n114), .B(n113), .Y(n115) );
  OR2X8 U108 ( .A(B[3]), .B(A[3]), .Y(n114) );
  CLKINVX3 U109 ( .A(n113), .Y(n144) );
  NAND2X2 U110 ( .A(n94), .B(n137), .Y(n132) );
  OR2X1 U111 ( .A(B[5]), .B(A[5]), .Y(n101) );
  INVXL U112 ( .A(CI), .Y(n126) );
  AND2XL U113 ( .A(n97), .B(n98), .Y(n96) );
  OAI2BB1X4 U114 ( .A0N(n141), .A1N(n122), .B0(n123), .Y(n140) );
  NAND2XL U115 ( .A(n128), .B(n129), .Y(n127) );
  NAND2BX1 U116 ( .AN(n102), .B(n101), .Y(n100) );
  CLKINVX1 U117 ( .A(n102), .Y(n136) );
  NAND2XL U118 ( .A(B[4]), .B(A[4]), .Y(n112) );
  XOR2X1 U119 ( .A(n109), .B(n110), .Y(SUM[4]) );
  NAND2XL U120 ( .A(n111), .B(n112), .Y(n110) );
  NAND2XL U121 ( .A(n101), .B(n107), .Y(n106) );
  AO22X1 U122 ( .A0(n108), .A1(n99), .B0(n108), .B1(n102), .Y(n105) );
  NOR2X4 U123 ( .A(n140), .B(n125), .Y(n139) );
  OR2X8 U124 ( .A(B[6]), .B(A[6]), .Y(n97) );
  XOR2X2 U125 ( .A(n116), .B(n117), .Y(SUM[2]) );
  NAND2XL U126 ( .A(n122), .B(n123), .Y(n116) );
  INVXL U127 ( .A(n121), .Y(n118) );
  OAI2BB1X4 U128 ( .A0N(CI), .A1N(n128), .B0(n129), .Y(n125) );
  XOR2X1 U129 ( .A(n124), .B(n119), .Y(SUM[1]) );
  NAND2XL U130 ( .A(n121), .B(n120), .Y(n124) );
  INVXL U131 ( .A(B[1]), .Y(n142) );
  OR2X8 U132 ( .A(A[7]), .B(n130), .Y(CO) );
  OAI2BB1X4 U133 ( .A0N(n131), .A1N(n132), .B0(n133), .Y(n130) );
  NAND2X4 U134 ( .A(n142), .B(n143), .Y(n121) );
endmodule


module geofence_DW01_add_27 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166;

  OAI2BB1X1 U83 ( .A0N(n133), .A1N(n119), .B0(n134), .Y(n129) );
  CLKINVX8 U84 ( .A(n123), .Y(n128) );
  OAI2BB1X4 U85 ( .A0N(n155), .A1N(n131), .B0(n132), .Y(n123) );
  INVX8 U86 ( .A(n119), .Y(n105) );
  INVX3 U87 ( .A(n143), .Y(n162) );
  NAND2X6 U88 ( .A(B[2]), .B(A[2]), .Y(n143) );
  BUFX8 U89 ( .A(n140), .Y(n104) );
  NAND2X2 U90 ( .A(B[1]), .B(A[1]), .Y(n140) );
  NAND2X2 U91 ( .A(n121), .B(n127), .Y(n126) );
  NAND2BX2 U92 ( .AN(n122), .B(n121), .Y(n120) );
  NAND2X4 U93 ( .A(n117), .B(n121), .Y(n151) );
  NAND2X6 U94 ( .A(n156), .B(n157), .Y(n121) );
  XOR2X1 U95 ( .A(n136), .B(n137), .Y(SUM[2]) );
  XOR2X1 U96 ( .A(n144), .B(n139), .Y(SUM[1]) );
  OR2X1 U97 ( .A(B[0]), .B(A[0]), .Y(n148) );
  NAND2X1 U98 ( .A(B[0]), .B(A[0]), .Y(n149) );
  OAI2BB1X2 U99 ( .A0N(CI), .A1N(n148), .B0(n149), .Y(n145) );
  INVX4 U100 ( .A(n104), .Y(n161) );
  NAND2X2 U101 ( .A(n163), .B(n164), .Y(n141) );
  CLKINVX1 U102 ( .A(A[1]), .Y(n164) );
  CLKINVX1 U103 ( .A(n127), .Y(n124) );
  CLKINVX1 U104 ( .A(n133), .Y(n155) );
  XOR2X1 U105 ( .A(n129), .B(n130), .Y(SUM[4]) );
  CLKINVX1 U106 ( .A(A[5]), .Y(n157) );
  AOI21X1 U107 ( .A0(n121), .A1(n123), .B0(n124), .Y(n109) );
  CLKINVX1 U108 ( .A(n151), .Y(n107) );
  CLKINVX1 U109 ( .A(n112), .Y(n111) );
  NAND2X1 U110 ( .A(B[7]), .B(A[7]), .Y(n114) );
  OR2X1 U111 ( .A(B[7]), .B(A[7]), .Y(n113) );
  NAND2X8 U112 ( .A(n165), .B(n166), .Y(n142) );
  CLKINVX8 U113 ( .A(A[2]), .Y(n166) );
  NAND2X8 U114 ( .A(n108), .B(n152), .Y(n112) );
  NAND3X6 U115 ( .A(n105), .B(n106), .C(n107), .Y(n108) );
  NAND2BX2 U116 ( .AN(A[8]), .B(n114), .Y(n150) );
  NAND2X2 U117 ( .A(B[5]), .B(A[5]), .Y(n127) );
  CLKINVX4 U118 ( .A(n154), .Y(n153) );
  OAI2BB1X2 U119 ( .A0N(n124), .A1N(n117), .B0(n118), .Y(n154) );
  XOR2X4 U120 ( .A(n115), .B(n116), .Y(SUM[6]) );
  AO22X4 U121 ( .A0(n128), .A1(n153), .B0(n153), .B1(n151), .Y(n152) );
  OR2X2 U122 ( .A(B[6]), .B(A[6]), .Y(n117) );
  OR2X6 U123 ( .A(B[4]), .B(A[4]), .Y(n131) );
  CLKINVX1 U124 ( .A(n122), .Y(n106) );
  NAND2X2 U125 ( .A(n131), .B(n134), .Y(n122) );
  NAND2XL U126 ( .A(B[6]), .B(A[6]), .Y(n118) );
  OR2X4 U127 ( .A(B[3]), .B(A[3]), .Y(n134) );
  INVXL U128 ( .A(n141), .Y(n138) );
  NAND2XL U129 ( .A(n131), .B(n132), .Y(n130) );
  NAND2XL U130 ( .A(n142), .B(n143), .Y(n136) );
  NAND2XL U131 ( .A(n148), .B(n149), .Y(n147) );
  CLKINVX1 U132 ( .A(CI), .Y(n146) );
  XOR2X1 U133 ( .A(n110), .B(n111), .Y(SUM[7]) );
  NAND2X1 U134 ( .A(B[4]), .B(A[4]), .Y(n132) );
  INVXL U135 ( .A(B[5]), .Y(n156) );
  XOR2X1 U136 ( .A(n125), .B(n126), .Y(SUM[5]) );
  NAND2XL U137 ( .A(n113), .B(n114), .Y(n110) );
  INVXL U138 ( .A(B[2]), .Y(n165) );
  XOR2XL U139 ( .A(n119), .B(n135), .Y(SUM[3]) );
  NAND2XL U140 ( .A(n134), .B(n133), .Y(n135) );
  NAND2XL U141 ( .A(n117), .B(n118), .Y(n116) );
  AO22X1 U142 ( .A0(n109), .A1(n119), .B0(n109), .B1(n120), .Y(n115) );
  AO22X1 U143 ( .A0(n128), .A1(n119), .B0(n128), .B1(n122), .Y(n125) );
  NOR2X4 U144 ( .A(n160), .B(n145), .Y(n159) );
  INVXL U145 ( .A(B[1]), .Y(n163) );
  CLKINVX1 U146 ( .A(n145), .Y(n139) );
  NAND2X2 U147 ( .A(B[3]), .B(A[3]), .Y(n133) );
  NAND2XL U148 ( .A(n141), .B(n104), .Y(n144) );
  OA21XL U149 ( .A0(n138), .A1(n139), .B0(n104), .Y(n137) );
  XOR2X4 U150 ( .A(n146), .B(n147), .Y(SUM[0]) );
  OA22X4 U151 ( .A0(n150), .A1(n113), .B0(n112), .B1(n150), .Y(CO) );
  OR2X8 U152 ( .A(n158), .B(n159), .Y(n119) );
  AOI21X4 U153 ( .A0(n142), .A1(n141), .B0(n160), .Y(n158) );
  AO21X4 U154 ( .A0(n161), .A1(n142), .B0(n162), .Y(n160) );
endmodule


module geofence_DW01_add_28 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180;

  OAI2BB1X4 U91 ( .A0N(n136), .A1N(n129), .B0(n130), .Y(n170) );
  OR2X8 U92 ( .A(B[6]), .B(A[6]), .Y(n129) );
  INVX4 U93 ( .A(n135), .Y(n140) );
  OAI2BB1X4 U94 ( .A0N(n171), .A1N(n143), .B0(n144), .Y(n135) );
  NAND2X4 U95 ( .A(n174), .B(n175), .Y(n147) );
  INVX2 U96 ( .A(A[3]), .Y(n175) );
  NAND2X4 U97 ( .A(n143), .B(n147), .Y(n134) );
  CLKINVX8 U98 ( .A(n145), .Y(n171) );
  NAND2X4 U99 ( .A(B[5]), .B(A[5]), .Y(n139) );
  OR3X4 U100 ( .A(n131), .B(n134), .C(n167), .Y(n114) );
  NAND2X6 U101 ( .A(n114), .B(n168), .Y(n126) );
  OR2X8 U102 ( .A(n176), .B(n177), .Y(n131) );
  NAND2X1 U103 ( .A(n129), .B(n133), .Y(n167) );
  CLKINVX6 U104 ( .A(n126), .Y(n122) );
  AOI21X2 U105 ( .A0(n133), .A1(n135), .B0(n136), .Y(n116) );
  INVX4 U106 ( .A(A[2]), .Y(n180) );
  CLKINVX1 U107 ( .A(n139), .Y(n136) );
  NAND2X2 U108 ( .A(n155), .B(n154), .Y(n117) );
  NAND2X2 U109 ( .A(n172), .B(n173), .Y(n133) );
  CLKINVX1 U110 ( .A(A[5]), .Y(n173) );
  XOR2X1 U111 ( .A(n125), .B(n122), .Y(SUM[7]) );
  INVX3 U112 ( .A(n120), .Y(n165) );
  OR2X1 U113 ( .A(B[8]), .B(A[8]), .Y(n120) );
  OR2X4 U114 ( .A(B[1]), .B(A[1]), .Y(n154) );
  NAND2X8 U115 ( .A(n179), .B(n180), .Y(n155) );
  NAND2X4 U116 ( .A(B[2]), .B(A[2]), .Y(n156) );
  OR2X6 U117 ( .A(B[4]), .B(A[4]), .Y(n143) );
  OAI211X4 U118 ( .A0(n165), .A1(n123), .B0(n121), .C0(n166), .Y(n163) );
  AO22X2 U119 ( .A0(n116), .A1(n131), .B0(n116), .B1(n132), .Y(n127) );
  NAND2X2 U120 ( .A(B[4]), .B(A[4]), .Y(n144) );
  AO21X4 U121 ( .A0(n145), .A1(n131), .B0(n146), .Y(n141) );
  NAND2X2 U122 ( .A(B[6]), .B(A[6]), .Y(n130) );
  XOR2X4 U123 ( .A(n127), .B(n128), .Y(SUM[6]) );
  NAND2X6 U124 ( .A(B[3]), .B(A[3]), .Y(n145) );
  NAND2XL U125 ( .A(B[8]), .B(A[8]), .Y(n121) );
  OAI2BB1X4 U126 ( .A0N(CI), .A1N(n161), .B0(n162), .Y(n158) );
  OR2X8 U127 ( .A(B[0]), .B(A[0]), .Y(n161) );
  OR2XL U128 ( .A(B[7]), .B(A[7]), .Y(n124) );
  NAND2X1 U129 ( .A(n143), .B(n144), .Y(n142) );
  NAND2X2 U130 ( .A(B[0]), .B(A[0]), .Y(n162) );
  CLKINVX8 U131 ( .A(n153), .Y(n115) );
  INVX3 U132 ( .A(n170), .Y(n169) );
  NAND2BXL U133 ( .AN(n134), .B(n133), .Y(n132) );
  NAND2XL U134 ( .A(B[7]), .B(A[7]), .Y(n123) );
  XOR2X1 U135 ( .A(n141), .B(n142), .Y(SUM[4]) );
  NAND2XL U136 ( .A(n161), .B(n162), .Y(n160) );
  OAI2BB1X4 U137 ( .A0N(n115), .A1N(n155), .B0(n156), .Y(n178) );
  NAND2XL U138 ( .A(n147), .B(n145), .Y(n148) );
  INVXL U139 ( .A(n158), .Y(n152) );
  NAND2X1 U140 ( .A(n124), .B(n123), .Y(n125) );
  OAI2BB1X1 U141 ( .A0N(n122), .A1N(n123), .B0(n124), .Y(n118) );
  CLKINVX1 U142 ( .A(A[9]), .Y(n166) );
  INVXL U143 ( .A(B[5]), .Y(n172) );
  XOR2X1 U144 ( .A(n118), .B(n119), .Y(SUM[8]) );
  NAND2X1 U145 ( .A(n120), .B(n121), .Y(n119) );
  CLKINVX1 U146 ( .A(n147), .Y(n146) );
  XOR2XL U147 ( .A(n131), .B(n148), .Y(SUM[3]) );
  XOR2X1 U148 ( .A(n137), .B(n138), .Y(SUM[5]) );
  NAND2XL U149 ( .A(n133), .B(n139), .Y(n138) );
  AO22X1 U150 ( .A0(n140), .A1(n131), .B0(n140), .B1(n134), .Y(n137) );
  NAND2XL U151 ( .A(n129), .B(n130), .Y(n128) );
  INVXL U152 ( .A(B[3]), .Y(n174) );
  CLKINVX1 U153 ( .A(n154), .Y(n151) );
  NAND2XL U154 ( .A(n154), .B(n153), .Y(n157) );
  NOR2BX4 U155 ( .AN(n117), .B(n178), .Y(n176) );
  XOR2X1 U156 ( .A(n157), .B(n152), .Y(SUM[1]) );
  XOR2X1 U157 ( .A(n149), .B(n150), .Y(SUM[2]) );
  NAND2XL U158 ( .A(n155), .B(n156), .Y(n149) );
  INVXL U159 ( .A(B[2]), .Y(n179) );
  XOR2X1 U160 ( .A(n159), .B(n160), .Y(SUM[0]) );
  CLKINVX1 U161 ( .A(CI), .Y(n159) );
  OA21XL U162 ( .A0(n151), .A1(n152), .B0(n153), .Y(n150) );
  NOR2X4 U163 ( .A(n178), .B(n158), .Y(n177) );
  NAND2X6 U164 ( .A(B[1]), .B(A[1]), .Y(n153) );
  OA21X4 U165 ( .A0(n126), .A1(n163), .B0(n164), .Y(CO) );
  AO21X4 U166 ( .A0(n120), .A1(n124), .B0(n163), .Y(n164) );
  AO22X4 U167 ( .A0(n140), .A1(n169), .B0(n169), .B1(n167), .Y(n168) );
endmodule


module geofence_DW01_add_29 ( A, B, CI, SUM, CO );
  input [10:0] A;
  input [10:0] B;
  output [10:0] SUM;
  input CI;
  output CO;
  wire   n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205;

  NAND2X6 U109 ( .A(B[0]), .B(A[0]), .Y(n185) );
  AOI21X4 U110 ( .A0(n203), .A1(n145), .B0(n204), .Y(n135) );
  OR2X2 U111 ( .A(B[8]), .B(A[8]), .Y(n145) );
  NAND2X1 U112 ( .A(B[8]), .B(A[8]), .Y(n146) );
  NAND2X4 U113 ( .A(n145), .B(n148), .Y(n142) );
  OAI2BB1X4 U114 ( .A0N(CI), .A1N(n184), .B0(n185), .Y(n181) );
  OR2X8 U115 ( .A(B[0]), .B(A[0]), .Y(n184) );
  OAI2BB1X2 U116 ( .A0N(n141), .A1N(n147), .B0(n148), .Y(n143) );
  INVX6 U117 ( .A(n150), .Y(n141) );
  NAND2X2 U118 ( .A(n139), .B(n140), .Y(n138) );
  NAND2BX2 U119 ( .AN(A[10]), .B(n140), .Y(n205) );
  NAND2X1 U120 ( .A(B[9]), .B(A[9]), .Y(n140) );
  NAND2X2 U121 ( .A(B[3]), .B(A[3]), .Y(n169) );
  OR2X4 U122 ( .A(B[4]), .B(A[4]), .Y(n167) );
  OR2X1 U123 ( .A(B[7]), .B(A[7]), .Y(n148) );
  INVX3 U124 ( .A(n176), .Y(n199) );
  CLKINVX1 U125 ( .A(n179), .Y(n200) );
  OR2X2 U126 ( .A(B[1]), .B(A[1]), .Y(n177) );
  AO22X1 U127 ( .A0(n136), .A1(n155), .B0(n136), .B1(n156), .Y(n151) );
  XOR2X1 U128 ( .A(n165), .B(n166), .Y(SUM[4]) );
  INVX3 U129 ( .A(n205), .Y(n201) );
  CLKINVX1 U130 ( .A(n139), .Y(n202) );
  CLKINVX1 U131 ( .A(n142), .Y(n187) );
  INVX1 U132 ( .A(n147), .Y(n203) );
  INVX3 U133 ( .A(n191), .Y(n190) );
  AOI22X4 U134 ( .A0(n201), .A1(n135), .B0(n202), .B1(n201), .Y(n134) );
  AOI21X1 U135 ( .A0(n157), .A1(n159), .B0(n160), .Y(n136) );
  AO22X1 U136 ( .A0(n141), .A1(n135), .B0(n135), .B1(n142), .Y(n137) );
  OR2X1 U137 ( .A(B[9]), .B(A[9]), .Y(n139) );
  NAND2X4 U138 ( .A(B[1]), .B(A[1]), .Y(n176) );
  INVX1 U139 ( .A(n146), .Y(n204) );
  NOR2X6 U140 ( .A(n198), .B(n181), .Y(n197) );
  NAND2X1 U141 ( .A(B[4]), .B(A[4]), .Y(n168) );
  NAND2X1 U142 ( .A(B[5]), .B(A[5]), .Y(n163) );
  NAND2X4 U143 ( .A(n153), .B(n157), .Y(n188) );
  NAND2X4 U144 ( .A(n193), .B(n194), .Y(n157) );
  XOR2X4 U145 ( .A(n143), .B(n144), .Y(SUM[8]) );
  NAND2XL U146 ( .A(n145), .B(n146), .Y(n144) );
  XOR2X4 U147 ( .A(n151), .B(n152), .Y(SUM[6]) );
  OAI2BB1X4 U148 ( .A0N(n160), .A1N(n153), .B0(n154), .Y(n191) );
  NAND2X4 U149 ( .A(B[6]), .B(A[6]), .Y(n154) );
  CLKINVX6 U150 ( .A(n159), .Y(n164) );
  XOR2X2 U151 ( .A(n149), .B(n141), .Y(SUM[7]) );
  NAND2X4 U152 ( .A(B[7]), .B(A[7]), .Y(n147) );
  OR2X8 U153 ( .A(B[2]), .B(A[2]), .Y(n178) );
  AOI21X4 U154 ( .A0(n178), .A1(n177), .B0(n198), .Y(n196) );
  NAND2X4 U155 ( .A(B[2]), .B(A[2]), .Y(n179) );
  OR2X4 U156 ( .A(B[6]), .B(A[6]), .Y(n153) );
  NAND2XL U157 ( .A(n170), .B(n169), .Y(n171) );
  NAND2X4 U158 ( .A(n167), .B(n170), .Y(n158) );
  NAND2BX2 U159 ( .AN(B[3]), .B(n195), .Y(n170) );
  OR2X8 U160 ( .A(n196), .B(n197), .Y(n155) );
  INVX3 U161 ( .A(n163), .Y(n160) );
  OA21XL U162 ( .A0(n174), .A1(n175), .B0(n176), .Y(n173) );
  NAND2XL U163 ( .A(n148), .B(n147), .Y(n149) );
  OAI2BB1X4 U164 ( .A0N(n192), .A1N(n167), .B0(n168), .Y(n159) );
  INVXL U165 ( .A(A[5]), .Y(n194) );
  NAND2XL U166 ( .A(n167), .B(n168), .Y(n166) );
  NAND2BXL U167 ( .AN(n158), .B(n157), .Y(n156) );
  CLKINVX1 U168 ( .A(n169), .Y(n192) );
  NAND2X1 U169 ( .A(n153), .B(n154), .Y(n152) );
  XOR2X1 U170 ( .A(n161), .B(n162), .Y(SUM[5]) );
  NAND2XL U171 ( .A(n157), .B(n163), .Y(n162) );
  CLKINVX1 U172 ( .A(A[3]), .Y(n195) );
  XOR2X1 U173 ( .A(n137), .B(n138), .Y(SUM[9]) );
  XOR2X1 U174 ( .A(n155), .B(n171), .Y(SUM[3]) );
  OAI2BB1XL U175 ( .A0N(n169), .A1N(n155), .B0(n170), .Y(n165) );
  AO22XL U176 ( .A0(n164), .A1(n155), .B0(n164), .B1(n158), .Y(n161) );
  NAND2X1 U177 ( .A(n184), .B(n185), .Y(n183) );
  CLKINVX1 U178 ( .A(n177), .Y(n174) );
  XOR2X1 U179 ( .A(n172), .B(n173), .Y(SUM[2]) );
  NAND2XL U180 ( .A(n178), .B(n179), .Y(n172) );
  CLKINVX1 U181 ( .A(n181), .Y(n175) );
  XOR2X1 U182 ( .A(n182), .B(n183), .Y(SUM[0]) );
  XOR2X1 U183 ( .A(n180), .B(n175), .Y(SUM[1]) );
  NAND2XL U184 ( .A(n177), .B(n176), .Y(n180) );
  CLKINVX1 U185 ( .A(CI), .Y(n182) );
  INVXL U186 ( .A(B[5]), .Y(n193) );
  OA21X4 U187 ( .A0(n134), .A1(n150), .B0(n186), .Y(CO) );
  AO21X4 U188 ( .A0(n187), .A1(n139), .B0(n134), .Y(n186) );
  OAI31X2 U189 ( .A0(n155), .A1(n158), .A2(n188), .B0(n189), .Y(n150) );
  AO22X4 U190 ( .A0(n164), .A1(n190), .B0(n190), .B1(n188), .Y(n189) );
  AO21X4 U191 ( .A0(n199), .A1(n178), .B0(n200), .Y(n198) );
endmodule


module geofence_DW01_add_30 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192;

  INVX3 U117 ( .A(A[1]), .Y(n175) );
  INVX3 U118 ( .A(n169), .Y(n174) );
  AO21X4 U119 ( .A0(n159), .A1(n160), .B0(n145), .Y(n155) );
  CLKAND2X12 U120 ( .A(n162), .B(n161), .Y(n145) );
  OR2X6 U121 ( .A(B[4]), .B(A[4]), .Y(n163) );
  OAI21X4 U122 ( .A0(n179), .A1(n180), .B0(n151), .Y(n147) );
  INVX6 U123 ( .A(n186), .Y(n184) );
  OAI32X4 U124 ( .A0(n144), .A1(n187), .A2(n188), .B0(n189), .B1(n190), .Y(
        n186) );
  INVX3 U125 ( .A(A[6]), .Y(n161) );
  INVX4 U126 ( .A(n158), .Y(n154) );
  OAI32X2 U127 ( .A0(n145), .A1(n159), .A2(n160), .B0(n161), .B1(n162), .Y(
        n158) );
  CLKINVX1 U128 ( .A(B[2]), .Y(n178) );
  CLKINVX1 U129 ( .A(A[5]), .Y(n160) );
  OAI21X2 U130 ( .A0(n173), .A1(n146), .B0(n174), .Y(n171) );
  AOI32X1 U131 ( .A0(A[7]), .A1(B[7]), .A2(n191), .B0(B[8]), .B1(A[8]), .Y(
        n183) );
  AO21X2 U132 ( .A0(n187), .A1(n188), .B0(n144), .Y(n185) );
  NAND3X4 U133 ( .A(n149), .B(n150), .C(n151), .Y(n148) );
  CLKINVX1 U134 ( .A(n185), .Y(n192) );
  NAND3X4 U135 ( .A(n164), .B(n165), .C(n166), .Y(n149) );
  CLKAND2X12 U136 ( .A(n178), .B(n177), .Y(n146) );
  INVX6 U137 ( .A(n181), .Y(n151) );
  INVX6 U138 ( .A(A[10]), .Y(n189) );
  OR2X6 U139 ( .A(B[8]), .B(A[8]), .Y(n191) );
  AND3X4 U140 ( .A(n171), .B(n172), .C(n163), .Y(n164) );
  NAND3X2 U141 ( .A(n156), .B(n157), .C(n154), .Y(n152) );
  AND2X8 U142 ( .A(n147), .B(n148), .Y(CO) );
  NAND2X1 U143 ( .A(B[0]), .B(n170), .Y(n168) );
  INVX4 U144 ( .A(A[2]), .Y(n177) );
  CLKAND2X12 U145 ( .A(n190), .B(n189), .Y(n144) );
  NAND2BX4 U146 ( .AN(A[11]), .B(n182), .Y(n181) );
  AO22X4 U147 ( .A0(n183), .A1(n184), .B0(n184), .B1(n185), .Y(n182) );
  INVXL U148 ( .A(B[9]), .Y(n187) );
  INVXL U149 ( .A(B[10]), .Y(n190) );
  OAI32X2 U150 ( .A0(n175), .A1(n146), .A2(n176), .B0(n177), .B1(n178), .Y(
        n169) );
  NAND3X2 U151 ( .A(n167), .B(n168), .C(n174), .Y(n165) );
  NAND2XL U152 ( .A(CI), .B(A[0]), .Y(n167) );
  CLKINVX1 U153 ( .A(n191), .Y(n179) );
  INVXL U154 ( .A(B[5]), .Y(n159) );
  NAND2X1 U155 ( .A(n154), .B(n155), .Y(n153) );
  INVX3 U156 ( .A(A[9]), .Y(n188) );
  NAND3XL U157 ( .A(B[3]), .B(n163), .C(A[3]), .Y(n157) );
  OR2XL U158 ( .A(B[3]), .B(A[3]), .Y(n172) );
  NAND2X2 U159 ( .A(n152), .B(n153), .Y(n150) );
  INVXL U160 ( .A(B[1]), .Y(n176) );
  CLKINVX1 U161 ( .A(n155), .Y(n166) );
  OR2X1 U162 ( .A(CI), .B(A[0]), .Y(n170) );
  INVXL U163 ( .A(B[6]), .Y(n162) );
  NAND2X1 U164 ( .A(B[4]), .B(A[4]), .Y(n156) );
  OAI21XL U165 ( .A0(A[7]), .A1(B[7]), .B0(n192), .Y(n180) );
  NOR2X1 U166 ( .A(A[1]), .B(B[1]), .Y(n173) );
endmodule


module geofence_DW_sqrt_5 ( a, root );
  input [22:0] a;
  output [11:0] root;
  wire   n199, n200, n201, n202, n203, n204, \PartRem[10][4] ,
         \PartRem[10][3] , \PartRem[9][5] , \PartRem[9][4] , \PartRem[8][6] ,
         \PartRem[8][5] , \PartRem[8][3] , \PartRem[7][7] , \PartRem[7][6] ,
         \PartRem[7][5] , \PartRem[6][8] , \PartRem[6][6] , \PartRem[6][4] ,
         \PartRem[6][3] , \PartRem[5][9] , \PartRem[5][8] , \PartRem[5][7] ,
         \PartRem[5][5] , \PartRem[5][4] , \PartRem[5][3] , \PartRem[4][10] ,
         \PartRem[4][9] , \PartRem[4][8] , \PartRem[4][7] , \PartRem[4][6] ,
         \PartRem[4][5] , \PartRem[4][3] , \PartRem[3][11] , \PartRem[3][10] ,
         \PartRem[3][9] , \PartRem[3][3] , \PartRem[2][12] , \PartRem[2][11] ,
         \PartRem[2][10] , \PartRem[2][9] , \PartRem[2][8] , \PartRem[2][7] ,
         \PartRem[2][6] , \PartRem[2][5] , \PartRem[2][4] , \PartRem[2][3] ,
         \PartRem[2][2] , \PartRem[1][13] , \PartRem[1][12] , \PartRem[1][11] ,
         \PartRem[1][10] , \PartRem[1][9] , \PartRem[1][8] , \PartRem[1][7] ,
         \PartRem[1][6] , \PartRem[1][5] , \PartRem[1][4] , \PartRem[1][3] ,
         \PartRem[1][2] , \PartRoot[9][4] , \PartRoot[9][3] , \PartRoot[9][2] ,
         \PartRoot[8][2] , \PartRoot[7][2] , \PartRoot[6][2] ,
         \PartRoot[5][2] , \PartRoot[4][2] , \PartRoot[3][2] ,
         \PartRoot[2][2] , \PartRoot[1][2] , \SumTmp[9][2] , \SumTmp[8][3] ,
         \SumTmp[8][2] , \SumTmp[7][5] , \SumTmp[7][4] , \SumTmp[7][3] ,
         \SumTmp[7][2] , \SumTmp[6][6] , \SumTmp[6][5] , \SumTmp[6][4] ,
         \SumTmp[6][3] , \SumTmp[6][2] , \SumTmp[5][7] , \SumTmp[5][6] ,
         \SumTmp[5][5] , \SumTmp[5][4] , \SumTmp[5][3] , \SumTmp[5][2] ,
         \SumTmp[4][8] , \SumTmp[4][7] , \SumTmp[4][6] , \SumTmp[4][5] ,
         \SumTmp[4][4] , \SumTmp[4][3] , \SumTmp[4][2] , \SumTmp[3][9] ,
         \SumTmp[3][8] , \SumTmp[3][7] , \SumTmp[3][6] , \SumTmp[3][5] ,
         \SumTmp[3][4] , \SumTmp[3][3] , \SumTmp[3][2] , \SumTmp[2][10] ,
         \SumTmp[2][9] , \SumTmp[2][8] , \SumTmp[2][7] , \SumTmp[2][6] ,
         \SumTmp[2][5] , \SumTmp[2][4] , \SumTmp[2][3] , \SumTmp[2][2] ,
         \SumTmp[1][11] , \SumTmp[1][10] , \SumTmp[1][9] , \SumTmp[1][8] ,
         \SumTmp[1][7] , \SumTmp[1][6] , \SumTmp[1][5] , \SumTmp[1][4] ,
         \SumTmp[1][3] , \SumTmp[1][2] , \CryTmp[9][2] , \CryTmp[8][2] ,
         \CryTmp[7][2] , \CryTmp[6][2] , \CryTmp[5][2] , \CryTmp[4][2] ,
         \CryTmp[3][2] , \CryTmp[2][2] , \CryTmp[1][2] , \CryTmp[0][2] , n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n74, n75, n76, n77, n81, n83, n84, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6;

  geofence_DW01_add_23 u_add_PartRem_7 ( .A({\PartRem[8][6] , \PartRem[8][5] , 
        n56, \PartRem[8][3] , n69}), .B({1'b1, n87, n88, \PartRoot[9][2] , 
        \PartRoot[8][2] }), .CI(\CryTmp[7][2] ), .SUM({SYNOPSYS_UNCONNECTED__0, 
        \SumTmp[7][5] , \SumTmp[7][4] , \SumTmp[7][3] , \SumTmp[7][2] }), .CO(
        root[7]) );
  geofence_DW01_add_24 u_add_PartRem_6 ( .A({\PartRem[7][7] , \PartRem[7][6] , 
        \PartRem[7][5] , n29, n63, n65}), .B({1'b1, n87, n88, \PartRoot[9][2] , 
        \PartRoot[8][2] , n75}), .CI(\CryTmp[6][2] ), .SUM({
        SYNOPSYS_UNCONNECTED__1, \SumTmp[6][6] , \SumTmp[6][5] , 
        \SumTmp[6][4] , \SumTmp[6][3] , \SumTmp[6][2] }), .CO(root[6]) );
  geofence_DW01_add_25 u_add_PartRem_5 ( .A({\PartRem[6][8] , n41, 
        \PartRem[6][6] , n28, \PartRem[6][4] , \PartRem[6][3] , n68}), .B({
        1'b1, n87, n88, \PartRoot[9][2] , \PartRoot[8][2] , n33, 
        \PartRoot[6][2] }), .CI(\CryTmp[5][2] ), .SUM({SYNOPSYS_UNCONNECTED__2, 
        \SumTmp[5][7] , \SumTmp[5][6] , \SumTmp[5][5] , \SumTmp[5][4] , 
        \SumTmp[5][3] , \SumTmp[5][2] }), .CO(n200) );
  geofence_DW01_add_26 u_add_PartRem_4 ( .A({\PartRem[5][9] , \PartRem[5][8] , 
        \PartRem[5][7] , n49, \PartRem[5][5] , \PartRem[5][4] , 
        \PartRem[5][3] , n64}), .B({1'b1, n87, n88, \PartRoot[9][2] , 
        \PartRoot[8][2] , n75, \PartRoot[6][2] , \PartRoot[5][2] }), .CI(
        \CryTmp[4][2] ), .SUM({SYNOPSYS_UNCONNECTED__3, \SumTmp[4][8] , 
        \SumTmp[4][7] , \SumTmp[4][6] , \SumTmp[4][5] , \SumTmp[4][4] , 
        \SumTmp[4][3] , \SumTmp[4][2] }), .CO(n201) );
  geofence_DW01_add_27 u_add_PartRem_3 ( .A({\PartRem[4][10] , \PartRem[4][9] , 
        \PartRem[4][8] , \PartRem[4][7] , \PartRem[4][6] , \PartRem[4][5] , 
        n55, \PartRem[4][3] , n71}), .B({1'b1, n87, n88, \PartRoot[9][2] , 
        \PartRoot[8][2] , n75, \PartRoot[6][2] , \PartRoot[5][2] , 
        \PartRoot[4][2] }), .CI(\CryTmp[3][2] ), .SUM({SYNOPSYS_UNCONNECTED__4, 
        \SumTmp[3][9] , \SumTmp[3][8] , \SumTmp[3][7] , \SumTmp[3][6] , 
        \SumTmp[3][5] , \SumTmp[3][4] , \SumTmp[3][3] , \SumTmp[3][2] }), .CO(
        n202) );
  geofence_DW01_add_28 u_add_PartRem_2 ( .A({\PartRem[3][11] , 
        \PartRem[3][10] , \PartRem[3][9] , n48, n47, n50, n54, n67, 
        \PartRem[3][3] , n72}), .B({1'b1, \PartRoot[9][4] , n88, 
        \PartRoot[9][2] , \PartRoot[8][2] , n34, \PartRoot[6][2] , 
        \PartRoot[5][2] , \PartRoot[4][2] , \PartRoot[3][2] }), .CI(
        \CryTmp[2][2] ), .SUM({SYNOPSYS_UNCONNECTED__5, \SumTmp[2][10] , 
        \SumTmp[2][9] , \SumTmp[2][8] , \SumTmp[2][7] , \SumTmp[2][6] , 
        \SumTmp[2][5] , \SumTmp[2][4] , \SumTmp[2][3] , \SumTmp[2][2] }), .CO(
        n203) );
  geofence_DW01_add_29 u_add_PartRem_1 ( .A({\PartRem[2][12] , 
        \PartRem[2][11] , \PartRem[2][10] , \PartRem[2][9] , \PartRem[2][8] , 
        \PartRem[2][7] , \PartRem[2][6] , \PartRem[2][5] , \PartRem[2][4] , 
        \PartRem[2][3] , \PartRem[2][2] }), .B({1'b1, \PartRoot[9][4] , n88, 
        \PartRoot[9][2] , \PartRoot[8][2] , n75, \PartRoot[6][2] , 
        \PartRoot[5][2] , \PartRoot[4][2] , \PartRoot[3][2] , \PartRoot[2][2] }), .CI(\CryTmp[1][2] ), .SUM({SYNOPSYS_UNCONNECTED__6, \SumTmp[1][11] , 
        \SumTmp[1][10] , \SumTmp[1][9] , \SumTmp[1][8] , \SumTmp[1][7] , 
        \SumTmp[1][6] , \SumTmp[1][5] , \SumTmp[1][4] , \SumTmp[1][3] , 
        \SumTmp[1][2] }), .CO(n204) );
  geofence_DW01_add_30 u_add_PartRem_0 ( .A({\PartRem[1][13] , 
        \PartRem[1][12] , \PartRem[1][11] , \PartRem[1][10] , \PartRem[1][9] , 
        \PartRem[1][8] , \PartRem[1][7] , \PartRem[1][6] , \PartRem[1][5] , 
        \PartRem[1][4] , \PartRem[1][3] , \PartRem[1][2] }), .B({1'b1, n35, 
        n88, \PartRoot[9][2] , \PartRoot[8][2] , n34, \PartRoot[6][2] , 
        \PartRoot[5][2] , \PartRoot[4][2] , \PartRoot[3][2] , \PartRoot[2][2] , 
        \PartRoot[1][2] }), .CI(\CryTmp[0][2] ), .CO(root[0]) );
  OR2X4 U3 ( .A(\PartRoot[9][4] ), .B(\PartRem[9][4] ), .Y(n101) );
  CLKAND2X12 U4 ( .A(n128), .B(n127), .Y(\PartRem[6][3] ) );
  NAND3X2 U5 ( .A(\CryTmp[9][2] ), .B(n123), .C(root[9]), .Y(n122) );
  CLKINVX2 U6 ( .A(n88), .Y(n107) );
  CLKINVX8 U7 ( .A(n44), .Y(\PartRem[2][2] ) );
  CLKINVX20 U8 ( .A(root[9]), .Y(\PartRoot[9][2] ) );
  NAND3X2 U9 ( .A(\CryTmp[2][2] ), .B(n174), .C(root[2]), .Y(n173) );
  NAND2X6 U10 ( .A(n35), .B(\PartRem[10][3] ), .Y(n111) );
  XOR2X4 U11 ( .A(\CryTmp[9][2] ), .B(n57), .Y(\SumTmp[9][2] ) );
  AND2X4 U12 ( .A(n110), .B(n109), .Y(n57) );
  INVX3 U13 ( .A(n159), .Y(\PartRem[2][10] ) );
  CLKINVX12 U14 ( .A(root[7]), .Y(\PartRoot[7][2] ) );
  INVX8 U15 ( .A(n189), .Y(\PartRem[4][5] ) );
  NOR2X4 U16 ( .A(\PartRoot[9][2] ), .B(\CryTmp[9][2] ), .Y(n121) );
  CLKINVX20 U17 ( .A(n81), .Y(n83) );
  CLKINVX12 U18 ( .A(root[2]), .Y(\PartRoot[2][2] ) );
  INVX16 U19 ( .A(root[6]), .Y(\PartRoot[6][2] ) );
  INVX6 U20 ( .A(n161), .Y(\PartRem[4][3] ) );
  INVX20 U21 ( .A(n84), .Y(n86) );
  INVX12 U22 ( .A(n200), .Y(n84) );
  CLKINVX8 U23 ( .A(n157), .Y(\PartRem[6][4] ) );
  CLKAND2X12 U24 ( .A(n117), .B(n118), .Y(\PartRem[8][3] ) );
  NAND3X4 U25 ( .A(\CryTmp[8][2] ), .B(n133), .C(root[8]), .Y(n117) );
  INVX8 U26 ( .A(n124), .Y(\PartRem[7][6] ) );
  INVX6 U27 ( .A(n142), .Y(\PartRem[5][7] ) );
  MXI2X4 U28 ( .A(n56), .B(\SumTmp[7][4] ), .S0(root[7]), .Y(n124) );
  CLKMX2X12 U29 ( .A(n70), .B(\SumTmp[8][2] ), .S0(root[8]), .Y(n56) );
  CLKBUFX20 U30 ( .A(\PartRoot[9][3] ), .Y(n88) );
  CLKMX2X6 U31 ( .A(n69), .B(\SumTmp[7][2] ), .S0(root[7]), .Y(n29) );
  INVX4 U32 ( .A(n187), .Y(\PartRem[5][4] ) );
  INVX4 U33 ( .A(n147), .Y(\PartRem[2][9] ) );
  XNOR2X4 U34 ( .A(root[2]), .B(a[4]), .Y(n154) );
  INVX8 U35 ( .A(n25), .Y(\PartRem[8][5] ) );
  MX2X6 U36 ( .A(\PartRem[4][5] ), .B(\SumTmp[3][5] ), .S0(root[3]), .Y(n47)
         );
  CLKMX2X6 U37 ( .A(\PartRem[4][3] ), .B(\SumTmp[3][3] ), .S0(root[3]), .Y(n54) );
  NAND2X6 U38 ( .A(n42), .B(n43), .Y(n64) );
  NAND2X4 U39 ( .A(\PartRoot[5][2] ), .B(a[10]), .Y(n43) );
  NAND2X4 U40 ( .A(n86), .B(n193), .Y(n42) );
  CLKINVX16 U41 ( .A(n86), .Y(\PartRoot[5][2] ) );
  BUFX20 U42 ( .A(n199), .Y(root[9]) );
  OR2X6 U43 ( .A(\PartRoot[9][2] ), .B(n70), .Y(n96) );
  AND2X6 U44 ( .A(\PartRoot[9][2] ), .B(n70), .Y(n60) );
  BUFX8 U45 ( .A(n116), .Y(n25) );
  INVX12 U46 ( .A(\PartRoot[7][2] ), .Y(n74) );
  CLKMX2X12 U47 ( .A(n64), .B(\SumTmp[4][2] ), .S0(n83), .Y(n55) );
  MXI2X2 U48 ( .A(n68), .B(\SumTmp[5][2] ), .S0(n86), .Y(n187) );
  XOR2X4 U49 ( .A(root[6]), .B(a[12]), .Y(n68) );
  CLKAND2X12 U50 ( .A(n138), .B(n139), .Y(\PartRem[3][3] ) );
  OAI21X4 U51 ( .A0(\PartRoot[3][2] ), .A1(\CryTmp[3][2] ), .B0(n169), .Y(n139) );
  INVX3 U52 ( .A(n134), .Y(\PartRem[5][8] ) );
  OAI21X1 U53 ( .A0(a[17]), .A1(n132), .B0(n117), .Y(n130) );
  CLKINVX2 U54 ( .A(a[17]), .Y(n119) );
  INVX3 U55 ( .A(n115), .Y(\PartRem[9][4] ) );
  CLKINVX6 U56 ( .A(n156), .Y(\PartRem[4][8] ) );
  INVX6 U57 ( .A(n137), .Y(\PartRem[6][6] ) );
  INVX6 U58 ( .A(n181), .Y(\PartRem[3][9] ) );
  NAND2X2 U59 ( .A(root[7]), .B(n145), .Y(n37) );
  NOR2X6 U60 ( .A(n75), .B(\CryTmp[7][2] ), .Y(n143) );
  NAND2X2 U61 ( .A(\PartRem[7][5] ), .B(\PartRoot[6][2] ), .Y(n39) );
  INVX3 U62 ( .A(n152), .Y(\PartRem[2][4] ) );
  INVX4 U63 ( .A(n45), .Y(\PartRem[2][8] ) );
  CLKINVX3 U64 ( .A(n135), .Y(\PartRem[4][9] ) );
  INVX3 U65 ( .A(n158), .Y(\PartRem[2][11] ) );
  NOR2BX1 U66 ( .AN(root[10]), .B(n27), .Y(\PartRem[10][4] ) );
  OR2X1 U67 ( .A(a[6]), .B(a[7]), .Y(\CryTmp[3][2] ) );
  OR2X1 U68 ( .A(a[10]), .B(a[11]), .Y(\CryTmp[5][2] ) );
  OR2X1 U69 ( .A(a[8]), .B(a[9]), .Y(\CryTmp[4][2] ) );
  CLKMX2X2 U70 ( .A(n58), .B(\SumTmp[5][3] ), .S0(n86), .Y(\PartRem[5][5] ) );
  OR2X1 U71 ( .A(a[12]), .B(a[13]), .Y(\CryTmp[6][2] ) );
  CLKINVX1 U72 ( .A(n151), .Y(\PartRem[2][5] ) );
  OR2X1 U73 ( .A(a[2]), .B(a[3]), .Y(\CryTmp[1][2] ) );
  INVX3 U74 ( .A(n153), .Y(\PartRem[2][3] ) );
  CLKINVX1 U75 ( .A(\SumTmp[6][6] ), .Y(n125) );
  CLKBUFX3 U76 ( .A(n154), .Y(n44) );
  INVX6 U77 ( .A(root[3]), .Y(\PartRoot[3][2] ) );
  OR2X1 U78 ( .A(a[4]), .B(a[5]), .Y(\CryTmp[2][2] ) );
  MXI2X2 U79 ( .A(n67), .B(\SumTmp[2][4] ), .S0(root[2]), .Y(n150) );
  CLKMX2X2 U80 ( .A(\PartRem[4][6] ), .B(\SumTmp[3][6] ), .S0(root[3]), .Y(n48) );
  INVX16 U81 ( .A(n74), .Y(n75) );
  INVX3 U82 ( .A(n149), .Y(\PartRem[2][7] ) );
  CLKINVX1 U83 ( .A(\SumTmp[5][7] ), .Y(n129) );
  BUFX2 U84 ( .A(n148), .Y(n45) );
  INVX8 U85 ( .A(root[1]), .Y(\PartRoot[1][2] ) );
  OR2X1 U86 ( .A(a[1]), .B(a[0]), .Y(\CryTmp[0][2] ) );
  MXI2X1 U87 ( .A(n150), .B(n165), .S0(root[1]), .Y(\PartRem[1][8] ) );
  CLKINVX1 U88 ( .A(\SumTmp[1][6] ), .Y(n165) );
  INVX4 U89 ( .A(n146), .Y(\PartRem[3][10] ) );
  MXI2X1 U90 ( .A(n61), .B(\SumTmp[8][3] ), .S0(root[8]), .Y(n116) );
  NAND2X1 U91 ( .A(n88), .B(n66), .Y(n109) );
  OR2X2 U92 ( .A(a[18]), .B(a[19]), .Y(\CryTmp[9][2] ) );
  XOR2X1 U93 ( .A(n52), .B(n105), .Y(n51) );
  OA21XL U94 ( .A0(n104), .A1(n59), .B0(n103), .Y(n105) );
  MXI2X1 U95 ( .A(n152), .B(n170), .S0(root[1]), .Y(\PartRem[1][6] ) );
  MXI2X2 U96 ( .A(\PartRem[3][9] ), .B(\SumTmp[2][9] ), .S0(root[2]), .Y(n158)
         );
  MXI2X2 U97 ( .A(\PartRem[6][6] ), .B(\SumTmp[5][6] ), .S0(root[5]), .Y(n134)
         );
  CLKINVX1 U98 ( .A(\SumTmp[4][8] ), .Y(n136) );
  INVX3 U99 ( .A(n92), .Y(n94) );
  CLKINVX1 U100 ( .A(a[21]), .Y(n196) );
  INVX12 U101 ( .A(n81), .Y(root[4]) );
  INVX4 U102 ( .A(a[22]), .Y(\PartRoot[9][4] ) );
  NOR2X8 U103 ( .A(a[20]), .B(a[21]), .Y(n26) );
  XOR2X1 U104 ( .A(n26), .B(\PartRoot[9][4] ), .Y(n27) );
  CLKMX2X2 U105 ( .A(n63), .B(\SumTmp[6][3] ), .S0(root[6]), .Y(n28) );
  CLKINVX1 U106 ( .A(n41), .Y(n126) );
  NAND2X2 U107 ( .A(n39), .B(n40), .Y(n41) );
  XNOR2X1 U108 ( .A(n53), .B(n113), .Y(n30) );
  MXI2X2 U109 ( .A(n167), .B(\SumTmp[2][3] ), .S0(root[2]), .Y(n151) );
  AND3X2 U110 ( .A(\CryTmp[3][2] ), .B(n140), .C(root[3]), .Y(n31) );
  BUFX20 U111 ( .A(n204), .Y(root[1]) );
  INVXL U112 ( .A(n76), .Y(n32) );
  INVXL U113 ( .A(n32), .Y(n33) );
  INVXL U114 ( .A(n32), .Y(n34) );
  INVX8 U115 ( .A(n84), .Y(root[5]) );
  XOR2X2 U116 ( .A(root[10]), .B(a[20]), .Y(n66) );
  NAND3X2 U117 ( .A(\CryTmp[7][2] ), .B(n145), .C(root[7]), .Y(n144) );
  CLKINVX1 U118 ( .A(root[11]), .Y(n35) );
  MXI2X4 U119 ( .A(n28), .B(\SumTmp[5][5] ), .S0(n86), .Y(n142) );
  CLKINVX8 U120 ( .A(n103), .Y(n89) );
  MXI2X4 U121 ( .A(n65), .B(\SumTmp[6][2] ), .S0(root[6]), .Y(n157) );
  INVX8 U122 ( .A(n114), .Y(\PartRem[10][3] ) );
  NAND3X2 U123 ( .A(\CryTmp[6][2] ), .B(n184), .C(root[6]), .Y(n127) );
  INVX20 U124 ( .A(root[8]), .Y(\PartRoot[8][2] ) );
  INVX2 U125 ( .A(n61), .Y(n90) );
  NAND3X2 U126 ( .A(\CryTmp[5][2] ), .B(n193), .C(root[5]), .Y(n192) );
  NOR2X8 U127 ( .A(\PartRoot[4][2] ), .B(\CryTmp[4][2] ), .Y(n162) );
  MXI2X1 U128 ( .A(n134), .B(n136), .S0(root[4]), .Y(\PartRem[4][10] ) );
  INVX8 U129 ( .A(n186), .Y(\PartRem[4][6] ) );
  NAND2X6 U130 ( .A(n88), .B(n61), .Y(n103) );
  NAND2X2 U131 ( .A(n107), .B(n106), .Y(n110) );
  MXI2X1 U132 ( .A(n124), .B(n125), .S0(root[6]), .Y(\PartRem[6][8] ) );
  MXI2X1 U133 ( .A(n47), .B(\SumTmp[2][7] ), .S0(root[2]), .Y(n147) );
  NAND2BX2 U134 ( .AN(a[2]), .B(root[1]), .Y(n179) );
  CLKINVX6 U135 ( .A(\SumTmp[1][8] ), .Y(n194) );
  INVX12 U136 ( .A(n182), .Y(\PartRem[4][7] ) );
  MXI2X4 U137 ( .A(n45), .B(n194), .S0(root[1]), .Y(\PartRem[1][10] ) );
  INVX3 U138 ( .A(\SumTmp[1][9] ), .Y(n188) );
  INVX3 U139 ( .A(\SumTmp[1][10] ), .Y(n185) );
  XOR2X1 U140 ( .A(n99), .B(n59), .Y(\SumTmp[8][3] ) );
  MXI2X4 U141 ( .A(n159), .B(n185), .S0(root[1]), .Y(\PartRem[1][12] ) );
  XOR2X2 U142 ( .A(n98), .B(n97), .Y(\SumTmp[8][2] ) );
  MXI2X4 U143 ( .A(\PartRem[5][3] ), .B(\SumTmp[4][3] ), .S0(n83), .Y(n189) );
  XOR2X4 U144 ( .A(root[8]), .B(a[16]), .Y(n69) );
  MXI2X4 U145 ( .A(n66), .B(\SumTmp[9][2] ), .S0(root[9]), .Y(n115) );
  MXI2X4 U146 ( .A(n29), .B(\SumTmp[6][4] ), .S0(root[6]), .Y(n137) );
  INVX3 U147 ( .A(root[7]), .Y(n36) );
  NAND2X4 U148 ( .A(n36), .B(a[14]), .Y(n38) );
  XOR2X2 U149 ( .A(root[9]), .B(a[18]), .Y(n70) );
  OAI2BB1X4 U150 ( .A0N(\CryTmp[9][2] ), .A1N(n110), .B0(n109), .Y(n113) );
  CLKINVX20 U151 ( .A(n83), .Y(\PartRoot[4][2] ) );
  NAND3X2 U152 ( .A(n140), .B(root[3]), .C(\CryTmp[3][2] ), .Y(n138) );
  AOI21X4 U153 ( .A0(n94), .A1(n59), .B0(n93), .Y(n95) );
  OR2X8 U154 ( .A(\PartRoot[1][2] ), .B(\CryTmp[1][2] ), .Y(n176) );
  MXI2X1 U155 ( .A(n115), .B(n51), .S0(root[8]), .Y(\PartRem[8][6] ) );
  NAND2X2 U156 ( .A(\PartRoot[9][4] ), .B(\PartRem[9][4] ), .Y(n100) );
  XOR2X4 U157 ( .A(n83), .B(a[8]), .Y(n71) );
  MXI2X4 U158 ( .A(n72), .B(\SumTmp[2][2] ), .S0(root[2]), .Y(n152) );
  MXI2X4 U159 ( .A(\PartRem[4][8] ), .B(\SumTmp[3][8] ), .S0(root[3]), .Y(n146) );
  OAI21X4 U160 ( .A0(a[5]), .A1(n172), .B0(n173), .Y(n153) );
  CLKINVX12 U161 ( .A(n201), .Y(n81) );
  CLKMX2X6 U162 ( .A(\PartRem[6][4] ), .B(\SumTmp[5][4] ), .S0(n86), .Y(n49)
         );
  XOR2X4 U163 ( .A(root[3]), .B(a[6]), .Y(n72) );
  MXI2X4 U164 ( .A(n44), .B(n175), .S0(root[1]), .Y(\PartRem[1][4] ) );
  CLKMX2X4 U165 ( .A(n55), .B(\SumTmp[3][4] ), .S0(root[3]), .Y(n50) );
  MXI2X1 U166 ( .A(n151), .B(n166), .S0(root[1]), .Y(\PartRem[1][7] ) );
  MXI2X4 U167 ( .A(\PartRem[4][7] ), .B(\SumTmp[3][7] ), .S0(root[3]), .Y(n181) );
  NAND2BX4 U168 ( .AN(\PartRem[10][4] ), .B(n111), .Y(n108) );
  OR2X2 U169 ( .A(\PartRoot[9][4] ), .B(\PartRem[10][3] ), .Y(n112) );
  INVX3 U170 ( .A(n66), .Y(n106) );
  MXI2X4 U171 ( .A(n130), .B(n131), .S0(root[7]), .Y(\PartRem[7][5] ) );
  MXI2XL U172 ( .A(n25), .B(n120), .S0(root[7]), .Y(\PartRem[7][7] ) );
  AOI21X4 U173 ( .A0(n101), .A1(n102), .B0(n92), .Y(n93) );
  AOI2BB2X4 U174 ( .B0(n176), .B1(n177), .A0N(n178), .A1N(n179), .Y(
        \PartRem[1][3] ) );
  INVX4 U175 ( .A(n176), .Y(n178) );
  MXI2X4 U176 ( .A(\PartRem[5][5] ), .B(\SumTmp[4][5] ), .S0(n83), .Y(n182) );
  INVX8 U177 ( .A(root[10]), .Y(\PartRoot[9][3] ) );
  NAND2X6 U178 ( .A(n37), .B(n38), .Y(n65) );
  NAND2X2 U179 ( .A(\SumTmp[6][5] ), .B(root[6]), .Y(n40) );
  MXI2X4 U180 ( .A(n126), .B(n129), .S0(root[5]), .Y(\PartRem[5][9] ) );
  MX2X6 U181 ( .A(n71), .B(\SumTmp[3][2] ), .S0(root[3]), .Y(n67) );
  OR2X8 U182 ( .A(n88), .B(n62), .Y(n195) );
  MXI2X2 U183 ( .A(n149), .B(n160), .S0(root[1]), .Y(\PartRem[1][9] ) );
  MXI2X2 U184 ( .A(n54), .B(\SumTmp[2][5] ), .S0(root[2]), .Y(n149) );
  MXI2X1 U185 ( .A(n50), .B(\SumTmp[2][6] ), .S0(root[2]), .Y(n148) );
  MXI2X4 U186 ( .A(n48), .B(\SumTmp[2][8] ), .S0(root[2]), .Y(n159) );
  INVXL U187 ( .A(n74), .Y(n76) );
  MXI2X4 U188 ( .A(\PartRem[5][4] ), .B(\SumTmp[4][4] ), .S0(n83), .Y(n186) );
  INVX1 U189 ( .A(n26), .Y(n62) );
  INVXL U190 ( .A(a[13]), .Y(n183) );
  MXI2X4 U191 ( .A(n49), .B(\SumTmp[4][6] ), .S0(root[4]), .Y(n156) );
  AOI21X4 U192 ( .A0(\CryTmp[8][2] ), .A1(n96), .B0(n60), .Y(n59) );
  INVXL U193 ( .A(\CryTmp[8][2] ), .Y(n98) );
  INVXL U194 ( .A(a[7]), .Y(n169) );
  OA22X4 U195 ( .A0(n108), .A1(n112), .B0(n113), .B1(n108), .Y(n199) );
  OAI2BB1X4 U196 ( .A0N(n89), .A1N(n101), .B0(n100), .Y(n92) );
  NOR2X8 U197 ( .A(a[22]), .B(n26), .Y(root[10]) );
  INVX1 U198 ( .A(\SumTmp[7][5] ), .Y(n120) );
  CLKBUFX2 U199 ( .A(n35), .Y(n87) );
  NAND3X4 U200 ( .A(n198), .B(root[10]), .C(n195), .Y(n197) );
  INVXL U201 ( .A(a[12]), .Y(n184) );
  INVXL U202 ( .A(a[10]), .Y(n193) );
  INVXL U203 ( .A(a[8]), .Y(n164) );
  NOR2X4 U204 ( .A(\PartRoot[2][2] ), .B(\CryTmp[2][2] ), .Y(n172) );
  INVXL U205 ( .A(a[4]), .Y(n174) );
  INVXL U206 ( .A(a[6]), .Y(n140) );
  MXI2X1 U207 ( .A(n158), .B(n180), .S0(root[1]), .Y(\PartRem[1][13] ) );
  MXI2X1 U208 ( .A(n135), .B(n141), .S0(root[3]), .Y(\PartRem[3][11] ) );
  CLKINVX1 U209 ( .A(\SumTmp[3][9] ), .Y(n141) );
  BUFX20 U210 ( .A(n202), .Y(root[3]) );
  BUFX20 U211 ( .A(n203), .Y(root[2]) );
  MXI2X1 U212 ( .A(n147), .B(n188), .S0(root[1]), .Y(\PartRem[1][11] ) );
  CLKINVX1 U213 ( .A(\SumTmp[1][7] ), .Y(n160) );
  MXI2XL U214 ( .A(n146), .B(n155), .S0(root[2]), .Y(\PartRem[2][12] ) );
  INVX1 U215 ( .A(\SumTmp[2][10] ), .Y(n155) );
  INVX1 U216 ( .A(\SumTmp[1][11] ), .Y(n180) );
  MXI2X1 U217 ( .A(\PartRem[5][7] ), .B(\SumTmp[4][7] ), .S0(root[4]), .Y(n135) );
  CLKINVX1 U218 ( .A(n150), .Y(\PartRem[2][6] ) );
  INVX1 U219 ( .A(\SumTmp[1][5] ), .Y(n166) );
  AND2XL U220 ( .A(n101), .B(n100), .Y(n52) );
  INVXL U221 ( .A(n102), .Y(n104) );
  AND2XL U222 ( .A(n111), .B(n112), .Y(n53) );
  AND2XL U223 ( .A(n127), .B(n128), .Y(n58) );
  NOR2X1 U224 ( .A(n168), .B(n31), .Y(n167) );
  INVXL U225 ( .A(n88), .Y(n91) );
  NAND2XL U226 ( .A(n102), .B(n103), .Y(n99) );
  INVX1 U227 ( .A(\SumTmp[1][4] ), .Y(n170) );
  INVXL U228 ( .A(n139), .Y(n168) );
  OA21X4 U229 ( .A0(a[19]), .A1(n121), .B0(n122), .Y(n61) );
  INVX6 U230 ( .A(n190), .Y(\PartRem[5][3] ) );
  OA21X4 U231 ( .A0(a[15]), .A1(n143), .B0(n144), .Y(n63) );
  INVX1 U232 ( .A(\SumTmp[1][2] ), .Y(n175) );
  INVXL U233 ( .A(a[16]), .Y(n133) );
  INVX3 U234 ( .A(\SumTmp[7][3] ), .Y(n131) );
  NOR2XL U235 ( .A(\PartRoot[8][2] ), .B(\CryTmp[8][2] ), .Y(n132) );
  MXI2X1 U236 ( .A(n153), .B(n171), .S0(root[1]), .Y(\PartRem[1][5] ) );
  INVX1 U237 ( .A(\SumTmp[1][3] ), .Y(n171) );
  INVXL U238 ( .A(a[20]), .Y(n198) );
  INVXL U239 ( .A(a[18]), .Y(n123) );
  INVXL U240 ( .A(a[14]), .Y(n145) );
  CLKINVX1 U241 ( .A(a[3]), .Y(n177) );
  XOR2XL U242 ( .A(root[1]), .B(a[2]), .Y(\PartRem[1][2] ) );
  CLKBUFX2 U243 ( .A(a[22]), .Y(root[11]) );
  MXI2XL U244 ( .A(n114), .B(n30), .S0(root[9]), .Y(\PartRem[9][5] ) );
  INVXL U245 ( .A(n60), .Y(n77) );
  NAND2X1 U246 ( .A(n96), .B(n77), .Y(n97) );
  NOR2X8 U247 ( .A(\PartRoot[5][2] ), .B(\CryTmp[5][2] ), .Y(n191) );
  NAND2X4 U248 ( .A(n91), .B(n90), .Y(n102) );
  OR2X8 U249 ( .A(n95), .B(\PartRem[9][5] ), .Y(root[8]) );
  OAI21X4 U250 ( .A0(\PartRoot[8][2] ), .A1(\CryTmp[8][2] ), .B0(n119), .Y(
        n118) );
  OAI21X4 U251 ( .A0(a[9]), .A1(n162), .B0(n163), .Y(n161) );
  NAND3X6 U252 ( .A(\CryTmp[4][2] ), .B(n164), .C(root[4]), .Y(n163) );
  OAI21X4 U253 ( .A0(\CryTmp[6][2] ), .A1(\PartRoot[6][2] ), .B0(n183), .Y(
        n128) );
  OAI21X4 U254 ( .A0(a[11]), .A1(n191), .B0(n192), .Y(n190) );
  OAI2BB1X4 U255 ( .A0N(n195), .A1N(n196), .B0(n197), .Y(n114) );
  OR2X8 U256 ( .A(a[16]), .B(a[17]), .Y(\CryTmp[8][2] ) );
  OR2X8 U257 ( .A(a[14]), .B(a[15]), .Y(\CryTmp[7][2] ) );
endmodule


module geofence_DW_mult_uns_9 ( a, b, product );
  input [11:0] a;
  input [11:0] b;
  output [23:0] product;
  wire   n1, n3, n4, n5, n9, n10, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n29, n31, n32, n37, n40, n42, n44, n45,
         n46, n47, n51, n53, n55, n56, n57, n58, n59, n60, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n76, n78, n79, n81, n84, n85, n87,
         n88, n89, n90, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n104, n105, n106, n107, n109, n112, n113, n114, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n133, n135, n136, n138, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n156,
         n158, n159, n160, n161, n162, n163, n168, n169, n170, n172, n173,
         n174, n175, n176, n177, n180, n181, n182, n184, n186, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n423, n425, n426, n428,
         n429, n430, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, n450,
         n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461,
         n462, n463, n464, n465, n466, n467, n468, n469, n470, n471, n472,
         n473, n474, n475, n476, n477, n478, n479, n480, n481, n482, n483,
         n484, n485, n486, n487, n488, n489, n490, n491, n492, n493, n494,
         n495, n496, n497, n498, n499, n500, n501, n502, n503, n504, n505,
         n506, n507, n508, n509, n510, n511, n512, n513, n514, n515, n516,
         n519, n520, n521, n522, n523, n524, n525, n526, n527, n528, n531,
         n532, n534, n535, n543, n544, n545, n546, n547, n548, n561, n613,
         n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624,
         n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635,
         n636, n637, n638, n639, n640, n641, n642, n643, n644, n645, n646,
         n647, n648, n649, n650, n651, n652, n653, n654, n655, n656, n657,
         n658, n659, n660, n661, n662, n663, n664, n665, n666, n667, n668,
         n669, n670, n671, n672, n673, n674, n675;
  assign n1 = b[0];
  assign n506 = b[11];
  assign n507 = b[10];
  assign n508 = b[9];
  assign n509 = b[8];
  assign n510 = b[7];
  assign n511 = b[6];
  assign n512 = b[5];
  assign n513 = b[4];
  assign n514 = b[3];
  assign n515 = b[2];
  assign n516 = b[1];
  assign n543 = a[11];
  assign n544 = a[9];
  assign n545 = a[7];
  assign n546 = a[5];
  assign n547 = a[3];
  assign n548 = a[1];

  AOI21X4 U56 ( .A0(n79), .A1(n66), .B0(n67), .Y(n4) );
  OAI21X4 U80 ( .A0(n84), .A1(n90), .B0(n85), .Y(n79) );
  NOR2X8 U83 ( .A(n230), .B(n221), .Y(n84) );
  OAI21X4 U94 ( .A0(n92), .A1(n120), .B0(n93), .Y(n3) );
  AOI21X4 U96 ( .A0(n94), .A1(n107), .B0(n95), .Y(n93) );
  OAI21X4 U120 ( .A0(n112), .A1(n118), .B0(n113), .Y(n107) );
  AOI21X4 U135 ( .A0(n129), .A1(n121), .B0(n122), .Y(n120) );
  OAI21X4 U137 ( .A0(n123), .A1(n127), .B0(n124), .Y(n122) );
  ADDFHX4 U210 ( .A(n191), .B(n338), .CI(n194), .CO(n188), .S(n189) );
  ADDFHX4 U212 ( .A(n351), .B(n195), .CI(n200), .CO(n192), .S(n193) );
  ADDFHX4 U215 ( .A(n352), .B(n201), .CI(n206), .CO(n198), .S(n199) );
  ADDFHX4 U231 ( .A(n235), .B(n242), .CI(n233), .CO(n230), .S(n231) );
  ADDFHX4 U237 ( .A(n258), .B(n247), .CI(n245), .CO(n242), .S(n243) );
  ADDFHX4 U239 ( .A(n369), .B(n357), .CI(n381), .CO(n246), .S(n247) );
  ADDFHX4 U242 ( .A(n257), .B(n265), .CI(n255), .CO(n252), .S(n253) );
  ADDFHX4 U243 ( .A(n259), .B(n269), .CI(n267), .CO(n254), .S(n255) );
  ADDFHX4 U244 ( .A(n261), .B(n271), .CI(n394), .CO(n256), .S(n257) );
  ADDFHX4 U248 ( .A(n268), .B(n275), .CI(n266), .CO(n263), .S(n264) );
  ADDFHX4 U249 ( .A(n279), .B(n270), .CI(n277), .CO(n265), .S(n266) );
  ADDFHX4 U250 ( .A(n272), .B(n281), .CI(n406), .CO(n267), .S(n268) );
  ADDFHX4 U251 ( .A(n383), .B(n371), .CI(n395), .CO(n269), .S(n270) );
  ADDFHX4 U252 ( .A(n336), .B(n347), .CI(n359), .CO(n271), .S(n272) );
  ADDFHX4 U256 ( .A(n384), .B(n360), .CI(n396), .CO(n279), .S(n280) );
  ADDFHX4 U258 ( .A(n288), .B(n293), .CI(n286), .CO(n283), .S(n284) );
  ADDFHX4 U259 ( .A(n297), .B(n290), .CI(n295), .CO(n285), .S(n286) );
  ADDFHX4 U260 ( .A(n361), .B(n385), .CI(n408), .CO(n287), .S(n288) );
  ADDFHX4 U264 ( .A(n386), .B(n374), .CI(n398), .CO(n295), .S(n296) );
  ADDFHX4 U266 ( .A(n304), .B(n307), .CI(n302), .CO(n299), .S(n300) );
  ADDFHX4 U267 ( .A(n399), .B(n375), .CI(n309), .CO(n301), .S(n302) );
  ADDFHX4 U269 ( .A(n310), .B(n313), .CI(n308), .CO(n305), .S(n306) );
  ADDFHX4 U270 ( .A(n411), .B(n388), .CI(n400), .CO(n307), .S(n308) );
  ADDFHX4 U272 ( .A(n389), .B(n317), .CI(n314), .CO(n311), .S(n312) );
  OAI22X4 U308 ( .A0(n435), .A1(n654), .B0(n436), .B1(n524), .Y(n345) );
  OAI22X4 U310 ( .A0(n438), .A1(n524), .B0(n437), .B1(n654), .Y(n347) );
  XNOR2X4 U322 ( .A(n515), .B(n675), .Y(n437) );
  OAI22X4 U331 ( .A0(n444), .A1(n525), .B0(n443), .B1(n532), .Y(n354) );
  OAI22X4 U337 ( .A0(n450), .A1(n525), .B0(n449), .B1(n532), .Y(n360) );
  OAI22X4 U357 ( .A0(n454), .A1(n619), .B0(n455), .B1(n653), .Y(n366) );
  OAI22X4 U359 ( .A0(n457), .A1(n653), .B0(n456), .B1(n619), .Y(n368) );
  OAI22X4 U364 ( .A0(n461), .A1(n619), .B0(n462), .B1(n653), .Y(n373) );
  OAI22X4 U386 ( .A0(n468), .A1(n651), .B0(n469), .B1(n652), .Y(n381) );
  OAI22X4 U387 ( .A0(n470), .A1(n652), .B0(n469), .B1(n651), .Y(n382) );
  OAI22X4 U393 ( .A0(n476), .A1(n652), .B0(n475), .B1(n651), .Y(n388) );
  OAI22X4 U440 ( .A0(n493), .A1(n620), .B0(n657), .B1(n561), .Y(n406) );
  NAND2X8 U512 ( .A(n521), .B(n651), .Y(n527) );
  NAND2X8 U515 ( .A(n522), .B(n649), .Y(n528) );
  NOR2X6 U523 ( .A(n312), .B(n315), .Y(n145) );
  OAI22X4 U524 ( .A0(n467), .A1(n651), .B0(n468), .B1(n652), .Y(n380) );
  ADDFHX4 U525 ( .A(n340), .B(n203), .CI(n208), .CO(n200), .S(n201) );
  AOI2BB1X4 U526 ( .A0N(n37), .A1N(n58), .B0(n626), .Y(n625) );
  INVX3 U527 ( .A(n507), .Y(n613) );
  NAND2X6 U528 ( .A(n274), .B(n283), .Y(n118) );
  OAI22X2 U529 ( .A0(n496), .A1(n620), .B0(n495), .B1(n561), .Y(n409) );
  XNOR2X2 U530 ( .A(n508), .B(n656), .Y(n495) );
  OAI22X2 U531 ( .A0(n429), .A1(n654), .B0(n430), .B1(n524), .Y(n339) );
  XNOR2X4 U532 ( .A(n507), .B(n543), .Y(n429) );
  XNOR2X4 U533 ( .A(n507), .B(n663), .Y(n468) );
  NAND2X2 U534 ( .A(n507), .B(n656), .Y(n615) );
  NAND2X6 U535 ( .A(n613), .B(n614), .Y(n616) );
  NAND2X6 U536 ( .A(n615), .B(n616), .Y(n494) );
  INVX1 U537 ( .A(n656), .Y(n614) );
  CLKINVX12 U538 ( .A(n657), .Y(n656) );
  OR2X4 U539 ( .A(n494), .B(n561), .Y(n622) );
  ADDFHX4 U540 ( .A(n197), .B(n202), .CI(n339), .CO(n194), .S(n195) );
  ADDFHX2 U541 ( .A(n364), .B(n331), .CI(n210), .CO(n202), .S(n203) );
  NAND2X4 U542 ( .A(n322), .B(n404), .Y(n158) );
  OAI22X1 U543 ( .A0(n491), .A1(n650), .B0(n490), .B1(n649), .Y(n404) );
  OAI22X1 U544 ( .A0(n480), .A1(n649), .B0(n481), .B1(n650), .Y(n394) );
  BUFX3 U545 ( .A(n328), .Y(n617) );
  NOR2BX4 U546 ( .AN(n511), .B(n673), .Y(n210) );
  OAI22X1 U547 ( .A0(n467), .A1(n652), .B0(n651), .B1(n665), .Y(n379) );
  XNOR2X4 U548 ( .A(n621), .B(n663), .Y(n467) );
  XOR2X2 U549 ( .A(n70), .B(n10), .Y(product[18]) );
  AOI21X1 U550 ( .A0(n3), .A1(n71), .B0(n72), .Y(n70) );
  NOR2X2 U551 ( .A(n274), .B(n283), .Y(n117) );
  ADDFHX4 U552 ( .A(n278), .B(n285), .CI(n276), .CO(n273), .S(n274) );
  NAND2X2 U553 ( .A(n417), .B(n617), .Y(n163) );
  OAI22X1 U554 ( .A0(n504), .A1(n620), .B0(n503), .B1(n561), .Y(n417) );
  OAI22X1 U555 ( .A0(n466), .A1(n619), .B0(n653), .B1(n667), .Y(n325) );
  OAI22X2 U556 ( .A0(n465), .A1(n653), .B0(n464), .B1(n619), .Y(n376) );
  ADDFHX2 U557 ( .A(n349), .B(n373), .CI(n397), .CO(n289), .S(n290) );
  OAI22X2 U558 ( .A0(n483), .A1(n649), .B0(n484), .B1(n650), .Y(n397) );
  XNOR2X2 U559 ( .A(n510), .B(n663), .Y(n471) );
  OAI22X2 U560 ( .A0(n446), .A1(n525), .B0(n445), .B1(n532), .Y(n356) );
  OAI22X2 U561 ( .A0(n474), .A1(n651), .B0(n475), .B1(n652), .Y(n387) );
  OAI22X2 U562 ( .A0(n446), .A1(n532), .B0(n447), .B1(n525), .Y(n357) );
  OAI22X2 U563 ( .A0(n457), .A1(n619), .B0(n458), .B1(n653), .Y(n369) );
  NOR2BX2 U564 ( .AN(n655), .B(n673), .Y(n336) );
  OAI22X2 U565 ( .A0(n448), .A1(n532), .B0(n449), .B1(n525), .Y(n359) );
  ADDHX2 U566 ( .A(n323), .B(n348), .CO(n281), .S(n282) );
  OAI22X2 U567 ( .A0(n440), .A1(n654), .B0(n524), .B1(n673), .Y(n323) );
  NAND2X2 U568 ( .A(n622), .B(n623), .Y(n408) );
  OAI22X1 U569 ( .A0(n433), .A1(n524), .B0(n432), .B1(n654), .Y(n342) );
  XNOR2X2 U570 ( .A(n514), .B(n659), .Y(n488) );
  XNOR2X2 U571 ( .A(n514), .B(n675), .Y(n436) );
  XNOR2X2 U572 ( .A(n513), .B(n666), .Y(n461) );
  XNOR2X2 U573 ( .A(n509), .B(n663), .Y(n470) );
  XNOR2X2 U574 ( .A(n507), .B(n659), .Y(n481) );
  OAI22X2 U575 ( .A0(n472), .A1(n652), .B0(n471), .B1(n651), .Y(n384) );
  BUFX12 U576 ( .A(n526), .Y(n653) );
  INVX6 U577 ( .A(n644), .Y(n524) );
  CLKINVX2 U578 ( .A(n73), .Y(n169) );
  INVX3 U579 ( .A(n57), .Y(n59) );
  XNOR2X1 U580 ( .A(n655), .B(n666), .Y(n465) );
  XNOR2X1 U581 ( .A(n510), .B(n544), .Y(n445) );
  ADDFX2 U582 ( .A(n250), .B(n392), .CI(n333), .CO(n238), .S(n239) );
  NOR2X1 U583 ( .A(n425), .B(n673), .Y(n333) );
  CLKINVX1 U584 ( .A(n514), .Y(n425) );
  OAI22X1 U585 ( .A0(n478), .A1(n652), .B0(n477), .B1(n651), .Y(n390) );
  ADDFX2 U586 ( .A(n377), .B(n412), .CI(n401), .CO(n313), .S(n314) );
  XNOR2X2 U587 ( .A(n514), .B(n666), .Y(n462) );
  XNOR2X1 U588 ( .A(n511), .B(n656), .Y(n498) );
  XNOR2X1 U589 ( .A(n514), .B(n663), .Y(n475) );
  XNOR2X1 U590 ( .A(n509), .B(n666), .Y(n457) );
  XNOR2X1 U591 ( .A(n511), .B(n544), .Y(n446) );
  XNOR2X1 U592 ( .A(n509), .B(n656), .Y(n496) );
  XNOR2X2 U593 ( .A(n508), .B(n663), .Y(n469) );
  XNOR2X2 U594 ( .A(n513), .B(n544), .Y(n448) );
  XNOR2X2 U595 ( .A(n516), .B(n675), .Y(n438) );
  XNOR2X1 U596 ( .A(n509), .B(n659), .Y(n483) );
  XNOR2X2 U597 ( .A(n514), .B(n544), .Y(n449) );
  OR2X1 U598 ( .A(n495), .B(n620), .Y(n623) );
  XNOR2X1 U599 ( .A(n509), .B(n544), .Y(n444) );
  XNOR2X2 U600 ( .A(n508), .B(n666), .Y(n456) );
  XNOR2X1 U601 ( .A(n511), .B(n675), .Y(n433) );
  OAI22X2 U602 ( .A0(n500), .A1(n561), .B0(n501), .B1(n620), .Y(n414) );
  XNOR2X1 U603 ( .A(n510), .B(n543), .Y(n432) );
  ADDFX2 U604 ( .A(n378), .B(n332), .CI(n228), .CO(n218), .S(n219) );
  NOR2X1 U605 ( .A(n423), .B(n673), .Y(n332) );
  OAI22X1 U606 ( .A0(n485), .A1(n649), .B0(n486), .B1(n650), .Y(n399) );
  OAI22X2 U607 ( .A0(n464), .A1(n653), .B0(n463), .B1(n619), .Y(n375) );
  ADDFHX2 U608 ( .A(n409), .B(n298), .CI(n303), .CO(n293), .S(n294) );
  XNOR2X2 U609 ( .A(n621), .B(n659), .Y(n480) );
  ADDFX2 U610 ( .A(n262), .B(n335), .CI(n346), .CO(n260), .S(n261) );
  NOR2BX1 U611 ( .AN(n516), .B(n673), .Y(n335) );
  ADDFHX2 U612 ( .A(n372), .B(n282), .CI(n289), .CO(n277), .S(n278) );
  OAI22X1 U613 ( .A0(n470), .A1(n651), .B0(n471), .B1(n652), .Y(n383) );
  XNOR2X2 U614 ( .A(n621), .B(n656), .Y(n493) );
  XNOR2X2 U615 ( .A(n508), .B(n544), .Y(n443) );
  XNOR2X1 U616 ( .A(n509), .B(n543), .Y(n431) );
  ADDFHX1 U617 ( .A(n379), .B(n236), .CI(n234), .CO(n222), .S(n223) );
  ADDHX1 U618 ( .A(n327), .B(n415), .CO(n321), .S(n322) );
  OAI22X1 U619 ( .A0(n492), .A1(n649), .B0(n650), .B1(n661), .Y(n327) );
  NOR2X2 U620 ( .A(n316), .B(n319), .Y(n148) );
  NAND2X2 U621 ( .A(n316), .B(n319), .Y(n149) );
  AOI21X1 U622 ( .A0(n159), .A1(n647), .B0(n156), .Y(n154) );
  CLKINVX1 U623 ( .A(n158), .Y(n156) );
  ADDFX2 U624 ( .A(n296), .B(n301), .CI(n294), .CO(n291), .S(n292) );
  ADDFHX2 U625 ( .A(n407), .B(n280), .CI(n287), .CO(n275), .S(n276) );
  OAI22X2 U626 ( .A0(n493), .A1(n561), .B0(n494), .B1(n620), .Y(n407) );
  XNOR2X1 U627 ( .A(n507), .B(n544), .Y(n442) );
  OAI22X1 U628 ( .A0(n431), .A1(n524), .B0(n430), .B1(n654), .Y(n340) );
  INVX12 U629 ( .A(n618), .Y(n532) );
  BUFX4 U630 ( .A(n646), .Y(n618) );
  XOR2X1 U631 ( .A(n98), .B(n14), .Y(product[14]) );
  AOI21X1 U632 ( .A0(n119), .A1(n99), .B0(n100), .Y(n98) );
  OAI21X2 U633 ( .A0(n160), .A1(n163), .B0(n161), .Y(n159) );
  OR2X2 U634 ( .A(n322), .B(n404), .Y(n647) );
  NOR2X1 U635 ( .A(n416), .B(n405), .Y(n160) );
  OAI22XL U636 ( .A0(n505), .A1(n561), .B0(n620), .B1(n657), .Y(n328) );
  CLKINVX1 U637 ( .A(n196), .Y(n197) );
  NOR2X4 U638 ( .A(n253), .B(n263), .Y(n101) );
  NOR2X4 U639 ( .A(n284), .B(n291), .Y(n123) );
  AOI21X2 U640 ( .A0(n642), .A1(n138), .B0(n133), .Y(n131) );
  INVX3 U641 ( .A(n135), .Y(n133) );
  NOR2X2 U642 ( .A(n292), .B(n299), .Y(n126) );
  NAND2X4 U643 ( .A(n292), .B(n299), .Y(n127) );
  ADDFHX2 U644 ( .A(n256), .B(n254), .CI(n243), .CO(n240), .S(n241) );
  NOR2X6 U645 ( .A(n264), .B(n273), .Y(n112) );
  NAND2X2 U646 ( .A(n78), .B(n66), .Y(n5) );
  XNOR3X1 U647 ( .A(n329), .B(n190), .C(n627), .Y(n186) );
  NOR2X6 U648 ( .A(n241), .B(n252), .Y(n96) );
  NOR2X6 U649 ( .A(n112), .B(n117), .Y(n106) );
  NAND2X2 U650 ( .A(n253), .B(n263), .Y(n104) );
  XOR2X1 U651 ( .A(n638), .B(n639), .Y(product[17]) );
  XOR2X1 U652 ( .A(n640), .B(n641), .Y(product[16]) );
  CLKINVX1 U653 ( .A(n58), .Y(n60) );
  OAI21X1 U654 ( .A0(n4), .A1(n628), .B0(n625), .Y(n32) );
  AO21X1 U655 ( .A0(n51), .A1(n630), .B0(n40), .Y(n626) );
  XOR2XL U656 ( .A(a[8]), .B(n666), .Y(n646) );
  XNOR2X4 U657 ( .A(n664), .B(a[6]), .Y(n619) );
  NAND2X4 U658 ( .A(n523), .B(n561), .Y(n620) );
  NAND2X4 U659 ( .A(n519), .B(n532), .Y(n525) );
  CLKBUFX3 U660 ( .A(n671), .Y(n670) );
  INVX3 U661 ( .A(n667), .Y(n666) );
  CLKBUFX3 U662 ( .A(n662), .Y(n661) );
  INVX4 U663 ( .A(a[0]), .Y(n561) );
  INVX3 U664 ( .A(n140), .Y(n138) );
  NOR2BX1 U665 ( .AN(n655), .B(n649), .Y(n405) );
  NAND2BX1 U666 ( .AN(n655), .B(n675), .Y(n440) );
  ADDHX4 U667 ( .A(n325), .B(n376), .CO(n309), .S(n310) );
  OAI22X2 U668 ( .A0(n435), .A1(n524), .B0(n434), .B1(n654), .Y(n344) );
  ADDFHX4 U669 ( .A(n262), .B(n334), .CI(n345), .CO(n248), .S(n249) );
  NAND2X4 U670 ( .A(n230), .B(n221), .Y(n85) );
  OAI22X2 U671 ( .A0(n459), .A1(n619), .B0(n460), .B1(n653), .Y(n371) );
  OAI21X4 U672 ( .A0(n145), .A1(n149), .B0(n146), .Y(n144) );
  OAI22X2 U673 ( .A0(n459), .A1(n653), .B0(n458), .B1(n619), .Y(n370) );
  BUFX20 U674 ( .A(n506), .Y(n621) );
  XNOR2X4 U675 ( .A(n514), .B(n656), .Y(n501) );
  XNOR2X2 U676 ( .A(n513), .B(n656), .Y(n500) );
  OAI22X4 U677 ( .A0(n500), .A1(n620), .B0(n499), .B1(n561), .Y(n413) );
  NOR2X1 U678 ( .A(n5), .B(n46), .Y(n44) );
  NOR2BX1 U679 ( .AN(n510), .B(n673), .Y(n331) );
  OAI22X1 U680 ( .A0(n496), .A1(n561), .B0(n497), .B1(n620), .Y(n410) );
  OAI22X2 U681 ( .A0(n498), .A1(n620), .B0(n497), .B1(n561), .Y(n411) );
  NAND2BXL U682 ( .AN(n655), .B(n660), .Y(n492) );
  OAI22X2 U683 ( .A0(n452), .A1(n525), .B0(n451), .B1(n532), .Y(n362) );
  XNOR2X1 U684 ( .A(n655), .B(n544), .Y(n452) );
  OAI22X4 U685 ( .A0(n483), .A1(n650), .B0(n482), .B1(n649), .Y(n396) );
  NAND2XL U686 ( .A(n642), .B(n135), .Y(n20) );
  NAND2X4 U687 ( .A(n300), .B(n305), .Y(n135) );
  ADDHX2 U688 ( .A(n324), .B(n362), .CO(n297), .S(n298) );
  XNOR2X2 U689 ( .A(n621), .B(n666), .Y(n454) );
  XNOR2X1 U690 ( .A(n621), .B(n544), .Y(n441) );
  OAI22X2 U691 ( .A0(n474), .A1(n652), .B0(n473), .B1(n651), .Y(n386) );
  NAND2BX1 U692 ( .AN(n655), .B(n666), .Y(n466) );
  OAI22X2 U693 ( .A0(n487), .A1(n650), .B0(n486), .B1(n649), .Y(n400) );
  XNOR2X2 U694 ( .A(n512), .B(n659), .Y(n486) );
  XNOR2X1 U695 ( .A(n655), .B(n675), .Y(n439) );
  OAI22X4 U696 ( .A0(n481), .A1(n649), .B0(n482), .B1(n650), .Y(n395) );
  OAI21X4 U697 ( .A0(n96), .A1(n104), .B0(n97), .Y(n95) );
  OAI21X2 U698 ( .A0(n4), .A1(n46), .B0(n47), .Y(n45) );
  AOI21X1 U699 ( .A0(n629), .A1(n60), .B0(n51), .Y(n47) );
  NAND2BX1 U700 ( .AN(n655), .B(n669), .Y(n453) );
  NOR2X4 U701 ( .A(n145), .B(n148), .Y(n143) );
  AOI21X4 U702 ( .A0(n143), .A1(n151), .B0(n144), .Y(n142) );
  XNOR2X2 U703 ( .A(n512), .B(n656), .Y(n499) );
  XNOR2X2 U704 ( .A(n508), .B(n659), .Y(n482) );
  OAI22X2 U705 ( .A0(n490), .A1(n650), .B0(n489), .B1(n649), .Y(n403) );
  ADDFHX4 U706 ( .A(n209), .B(n214), .CI(n207), .CO(n204), .S(n205) );
  ADDFHX4 U707 ( .A(n353), .B(n365), .CI(n216), .CO(n206), .S(n207) );
  OAI22X4 U708 ( .A0(n454), .A1(n653), .B0(n619), .B1(n667), .Y(n365) );
  ADDFHX4 U709 ( .A(n224), .B(n215), .CI(n222), .CO(n212), .S(n213) );
  NAND2X8 U710 ( .A(n204), .B(n199), .Y(n58) );
  NOR2X8 U711 ( .A(n212), .B(n205), .Y(n68) );
  OAI21X4 U712 ( .A0(n154), .A1(n152), .B0(n153), .Y(n151) );
  INVX1 U713 ( .A(n145), .Y(n180) );
  OAI22X2 U714 ( .A0(n489), .A1(n650), .B0(n488), .B1(n649), .Y(n402) );
  OAI22X2 U715 ( .A0(n487), .A1(n649), .B0(n488), .B1(n650), .Y(n401) );
  OAI22X4 U716 ( .A0(n498), .A1(n561), .B0(n499), .B1(n620), .Y(n412) );
  AO21X4 U717 ( .A0(n3), .A1(n55), .B0(n56), .Y(n636) );
  ADDFHX4 U718 ( .A(n229), .B(n238), .CI(n355), .CO(n226), .S(n227) );
  NOR2X8 U719 ( .A(n73), .B(n68), .Y(n66) );
  OR2X4 U720 ( .A(n76), .B(n68), .Y(n624) );
  XNOR2X1 U721 ( .A(n655), .B(n663), .Y(n478) );
  ADDHX2 U722 ( .A(n326), .B(n390), .CO(n317), .S(n318) );
  NOR2X8 U723 ( .A(n89), .B(n84), .Y(n78) );
  NOR2X1 U724 ( .A(n5), .B(n57), .Y(n55) );
  OAI22X2 U725 ( .A0(n448), .A1(n525), .B0(n447), .B1(n532), .Y(n358) );
  ADDFHX4 U726 ( .A(n225), .B(n232), .CI(n223), .CO(n220), .S(n221) );
  NOR2X6 U727 ( .A(n204), .B(n199), .Y(n57) );
  AO21X4 U728 ( .A0(n3), .A1(n44), .B0(n45), .Y(n632) );
  XOR2X4 U729 ( .A(n636), .B(n637), .Y(product[20]) );
  ADDFHX4 U730 ( .A(n226), .B(n366), .CI(n217), .CO(n214), .S(n215) );
  OAI21X2 U731 ( .A0(n4), .A1(n57), .B0(n58), .Y(n56) );
  OAI22X1 U732 ( .A0(n441), .A1(n532), .B0(n442), .B1(n525), .Y(n352) );
  NAND2X2 U733 ( .A(n59), .B(n629), .Y(n46) );
  AO21X4 U734 ( .A0(n3), .A1(n31), .B0(n32), .Y(n634) );
  OR2X4 U735 ( .A(n37), .B(n57), .Y(n628) );
  NAND2X2 U736 ( .A(n192), .B(n189), .Y(n42) );
  ADDFHX2 U737 ( .A(n350), .B(n330), .CI(n196), .CO(n190), .S(n191) );
  NOR2BX2 U738 ( .AN(n508), .B(n673), .Y(n330) );
  NAND2X4 U739 ( .A(n624), .B(n69), .Y(n67) );
  NAND2X2 U740 ( .A(n212), .B(n205), .Y(n69) );
  OAI22X2 U741 ( .A0(n442), .A1(n532), .B0(n443), .B1(n525), .Y(n353) );
  NOR2BX2 U742 ( .AN(n509), .B(n673), .Y(n196) );
  INVX4 U743 ( .A(n89), .Y(n87) );
  NOR2X4 U744 ( .A(n231), .B(n240), .Y(n89) );
  OAI21X1 U745 ( .A0(n81), .A1(n73), .B0(n76), .Y(n72) );
  NOR2X6 U746 ( .A(n220), .B(n213), .Y(n73) );
  NAND2X4 U747 ( .A(n220), .B(n213), .Y(n76) );
  OR2X8 U748 ( .A(n192), .B(n189), .Y(n630) );
  NAND2X6 U749 ( .A(n231), .B(n240), .Y(n90) );
  NOR2BX2 U750 ( .AN(n513), .B(n673), .Y(n228) );
  INVX3 U751 ( .A(n665), .Y(n663) );
  OR2X8 U752 ( .A(n300), .B(n305), .Y(n642) );
  OAI22X2 U753 ( .A0(n503), .A1(n620), .B0(n502), .B1(n561), .Y(n416) );
  ADDFHX4 U754 ( .A(n237), .B(n246), .CI(n244), .CO(n232), .S(n233) );
  OAI22X2 U755 ( .A0(n463), .A1(n653), .B0(n462), .B1(n619), .Y(n374) );
  NAND2X2 U756 ( .A(n264), .B(n273), .Y(n113) );
  NAND2X4 U757 ( .A(n306), .B(n311), .Y(n140) );
  ADDFHX4 U758 ( .A(n413), .B(n402), .CI(n318), .CO(n315), .S(n316) );
  INVX4 U759 ( .A(n53), .Y(n51) );
  XOR2X4 U760 ( .A(n634), .B(n635), .Y(product[22]) );
  ADDFHX2 U761 ( .A(n211), .B(n341), .CI(n218), .CO(n208), .S(n209) );
  OAI22X2 U762 ( .A0(n431), .A1(n654), .B0(n432), .B1(n524), .Y(n341) );
  OAI22X2 U763 ( .A0(n428), .A1(n654), .B0(n429), .B1(n524), .Y(n338) );
  INVXL U764 ( .A(n649), .Y(n648) );
  ADDFHX4 U765 ( .A(n370), .B(n382), .CI(n358), .CO(n258), .S(n259) );
  OAI22X2 U766 ( .A0(n472), .A1(n651), .B0(n473), .B1(n652), .Y(n385) );
  OAI22X2 U767 ( .A0(n451), .A1(n525), .B0(n450), .B1(n532), .Y(n361) );
  AO21XL U768 ( .A0(n650), .A1(n649), .B0(n661), .Y(n392) );
  AO21X1 U769 ( .A0(n652), .A1(n651), .B0(n665), .Y(n378) );
  NAND2X2 U770 ( .A(n312), .B(n315), .Y(n146) );
  XNOR2X1 U771 ( .A(n515), .B(n656), .Y(n502) );
  BUFX8 U772 ( .A(n531), .Y(n654) );
  XOR2XL U773 ( .A(a[6]), .B(n666), .Y(n520) );
  NAND2BXL U774 ( .AN(n162), .B(n163), .Y(n27) );
  INVX1 U775 ( .A(n27), .Y(product[1]) );
  OAI22X1 U776 ( .A0(n461), .A1(n653), .B0(n460), .B1(n619), .Y(n372) );
  XNOR2X1 U777 ( .A(n516), .B(n656), .Y(n503) );
  INVXL U778 ( .A(n4), .Y(n65) );
  NAND2X4 U779 ( .A(n629), .B(n630), .Y(n37) );
  NOR2BXL U780 ( .AN(n78), .B(n73), .Y(n71) );
  INVXL U781 ( .A(n68), .Y(n168) );
  NOR2X8 U782 ( .A(n101), .B(n96), .Y(n94) );
  NAND2X6 U783 ( .A(n94), .B(n106), .Y(n92) );
  XNOR2X2 U784 ( .A(n507), .B(n666), .Y(n455) );
  XNOR2X1 U785 ( .A(n510), .B(n666), .Y(n458) );
  XNOR2X1 U786 ( .A(n512), .B(n544), .Y(n447) );
  BUFX8 U787 ( .A(n672), .Y(n674) );
  XNOR2X1 U788 ( .A(n510), .B(n656), .Y(n497) );
  XNOR2X1 U789 ( .A(n511), .B(n659), .Y(n485) );
  XNOR2X1 U790 ( .A(n511), .B(n666), .Y(n459) );
  XNOR2X1 U791 ( .A(n511), .B(n663), .Y(n472) );
  XNOR2X1 U792 ( .A(n512), .B(n666), .Y(n460) );
  XNOR2X1 U793 ( .A(n510), .B(n659), .Y(n484) );
  CLKBUFX2 U794 ( .A(n672), .Y(n675) );
  OAI21X4 U795 ( .A0(n142), .A1(n130), .B0(n131), .Y(n129) );
  NAND2X4 U796 ( .A(n642), .B(n643), .Y(n130) );
  AND2X4 U797 ( .A(n631), .B(n29), .Y(n635) );
  XNOR2X1 U798 ( .A(n513), .B(n663), .Y(n474) );
  OAI22XL U799 ( .A0(n428), .A1(n524), .B0(n654), .B1(n673), .Y(n627) );
  INVXL U800 ( .A(n665), .Y(n664) );
  INVXL U801 ( .A(n142), .Y(n141) );
  ADDFHX4 U802 ( .A(n260), .B(n249), .CI(n393), .CO(n244), .S(n245) );
  NOR2BX2 U803 ( .AN(n654), .B(n645), .Y(n644) );
  AO21XL U804 ( .A0(n620), .A1(n561), .B0(n657), .Y(n250) );
  XNOR2XL U805 ( .A(n669), .B(a[10]), .Y(n531) );
  NAND2X2 U806 ( .A(n520), .B(n619), .Y(n526) );
  NAND2XL U807 ( .A(n647), .B(n158), .Y(n25) );
  OAI22X1 U808 ( .A0(n477), .A1(n652), .B0(n476), .B1(n651), .Y(n389) );
  OAI22X2 U809 ( .A0(n437), .A1(n524), .B0(n436), .B1(n654), .Y(n346) );
  NAND2X1 U810 ( .A(n416), .B(n405), .Y(n161) );
  XNOR2X1 U811 ( .A(n516), .B(n666), .Y(n464) );
  CLKXOR2X1 U812 ( .A(n663), .B(a[4]), .Y(n521) );
  BUFX12 U813 ( .A(n535), .Y(n649) );
  XNOR2XL U814 ( .A(a[2]), .B(n656), .Y(n535) );
  CLKXOR2X1 U815 ( .A(n659), .B(a[2]), .Y(n522) );
  BUFX12 U816 ( .A(n534), .Y(n651) );
  XNOR2XL U817 ( .A(a[4]), .B(n659), .Y(n534) );
  NOR2XL U818 ( .A(n417), .B(n617), .Y(n162) );
  OAI22X2 U819 ( .A0(n479), .A1(n651), .B0(n652), .B1(n665), .Y(n326) );
  NOR2BXL U820 ( .AN(n655), .B(n619), .Y(n377) );
  XNOR2XL U821 ( .A(n655), .B(n660), .Y(n491) );
  NOR2BXL U822 ( .AN(n655), .B(n654), .Y(n349) );
  NOR2X1 U823 ( .A(n5), .B(n628), .Y(n31) );
  CLKINVX1 U824 ( .A(n5), .Y(n64) );
  CLKINVX1 U825 ( .A(n42), .Y(n40) );
  INVXL U826 ( .A(n79), .Y(n81) );
  INVX3 U827 ( .A(n674), .Y(n673) );
  INVXL U828 ( .A(n84), .Y(n170) );
  OR2X8 U829 ( .A(n198), .B(n193), .Y(n629) );
  XNOR2X1 U830 ( .A(n512), .B(n663), .Y(n473) );
  XNOR2X1 U831 ( .A(n512), .B(n675), .Y(n434) );
  NAND2X2 U832 ( .A(n198), .B(n193), .Y(n53) );
  XNOR2X1 U833 ( .A(n508), .B(n543), .Y(n430) );
  OR2X1 U834 ( .A(n188), .B(n186), .Y(n631) );
  NAND2XL U835 ( .A(n188), .B(n186), .Y(n29) );
  INVXL U836 ( .A(n507), .Y(n418) );
  CLKINVX1 U837 ( .A(n90), .Y(n88) );
  OAI21XL U838 ( .A0(n109), .A1(n101), .B0(n104), .Y(n100) );
  INVXL U839 ( .A(n107), .Y(n109) );
  INVX1 U840 ( .A(n120), .Y(n119) );
  NOR2BXL U841 ( .AN(n106), .B(n101), .Y(n99) );
  INVXL U842 ( .A(n96), .Y(n172) );
  INVXL U843 ( .A(n101), .Y(n173) );
  INVXL U844 ( .A(n112), .Y(n174) );
  CLKINVX1 U845 ( .A(n117), .Y(n175) );
  INVXL U846 ( .A(n118), .Y(n116) );
  CLKINVX1 U847 ( .A(n129), .Y(n128) );
  INVXL U848 ( .A(n123), .Y(n176) );
  XOR2X4 U849 ( .A(n632), .B(n633), .Y(product[21]) );
  AND2XL U850 ( .A(n630), .B(n42), .Y(n633) );
  ADDFHX2 U851 ( .A(n356), .B(n368), .CI(n239), .CO(n236), .S(n237) );
  NAND2X2 U852 ( .A(n241), .B(n252), .Y(n97) );
  ADDFHX2 U853 ( .A(n342), .B(n354), .CI(n219), .CO(n216), .S(n217) );
  XNOR2X2 U854 ( .A(n513), .B(n675), .Y(n435) );
  ADDFHX2 U855 ( .A(n343), .B(n367), .CI(n227), .CO(n224), .S(n225) );
  OAI22X1 U856 ( .A0(n433), .A1(n654), .B0(n434), .B1(n524), .Y(n343) );
  OAI22X2 U857 ( .A0(n455), .A1(n619), .B0(n456), .B1(n653), .Y(n367) );
  NOR2X4 U858 ( .A(n123), .B(n126), .Y(n121) );
  NAND2X2 U859 ( .A(n284), .B(n291), .Y(n124) );
  OAI22X2 U860 ( .A0(n441), .A1(n525), .B0(n532), .B1(n670), .Y(n351) );
  XNOR2X1 U861 ( .A(n513), .B(n659), .Y(n487) );
  CLKINVX1 U862 ( .A(n228), .Y(n229) );
  OAI22X2 U863 ( .A0(n444), .A1(n532), .B0(n445), .B1(n525), .Y(n355) );
  AND2XL U864 ( .A(n629), .B(n53), .Y(n637) );
  AO21X1 U865 ( .A0(n653), .A1(n619), .B0(n667), .Y(n364) );
  NAND2XL U866 ( .A(n168), .B(n69), .Y(n10) );
  XOR2X1 U867 ( .A(n63), .B(n9), .Y(product[19]) );
  NAND2XL U868 ( .A(n59), .B(n58), .Y(n9) );
  AO21X1 U869 ( .A0(n525), .A1(n532), .B0(n670), .Y(n350) );
  NOR2X1 U870 ( .A(n418), .B(n673), .Y(n329) );
  CLKINVX1 U871 ( .A(n670), .Y(n669) );
  CLKBUFX3 U872 ( .A(n543), .Y(n672) );
  INVX3 U873 ( .A(n661), .Y(n659) );
  CLKINVX1 U874 ( .A(n250), .Y(n262) );
  AO21XL U875 ( .A0(n3), .A1(n78), .B0(n79), .Y(n638) );
  AND2XL U876 ( .A(n169), .B(n76), .Y(n639) );
  AO21XL U877 ( .A0(n3), .A1(n87), .B0(n88), .Y(n640) );
  AND2XL U878 ( .A(n170), .B(n85), .Y(n641) );
  CLKINVX1 U879 ( .A(n661), .Y(n660) );
  NAND2XL U880 ( .A(n87), .B(n90), .Y(n13) );
  NAND2XL U881 ( .A(n172), .B(n97), .Y(n14) );
  XOR2X1 U882 ( .A(n105), .B(n15), .Y(product[13]) );
  NAND2XL U883 ( .A(n173), .B(n104), .Y(n15) );
  XOR2X1 U884 ( .A(n114), .B(n16), .Y(product[12]) );
  NAND2XL U885 ( .A(n174), .B(n113), .Y(n16) );
  AOI21XL U886 ( .A0(n119), .A1(n175), .B0(n116), .Y(n114) );
  XNOR2XL U887 ( .A(n119), .B(n17), .Y(product[11]) );
  NAND2XL U888 ( .A(n175), .B(n118), .Y(n17) );
  XNOR2X1 U889 ( .A(n125), .B(n18), .Y(product[10]) );
  NAND2XL U890 ( .A(n176), .B(n124), .Y(n18) );
  OAI21XL U891 ( .A0(n128), .A1(n126), .B0(n127), .Y(n125) );
  XOR2X1 U892 ( .A(n136), .B(n20), .Y(product[8]) );
  AOI21XL U893 ( .A0(n141), .A1(n643), .B0(n138), .Y(n136) );
  XOR2X1 U894 ( .A(n128), .B(n19), .Y(product[9]) );
  NAND2X1 U895 ( .A(n177), .B(n127), .Y(n19) );
  INVXL U896 ( .A(n126), .Y(n177) );
  XNOR2X1 U897 ( .A(n141), .B(n21), .Y(product[7]) );
  NAND2X1 U898 ( .A(n643), .B(n140), .Y(n21) );
  CLKINVX1 U899 ( .A(n151), .Y(n150) );
  ADDFHX2 U900 ( .A(n344), .B(n248), .CI(n380), .CO(n234), .S(n235) );
  NOR2X2 U901 ( .A(n426), .B(n673), .Y(n334) );
  CLKINVX2 U902 ( .A(n515), .Y(n426) );
  XNOR2X1 U903 ( .A(n515), .B(n544), .Y(n450) );
  XNOR2X1 U904 ( .A(n515), .B(n666), .Y(n463) );
  OAI22X1 U905 ( .A0(n485), .A1(n650), .B0(n484), .B1(n649), .Y(n398) );
  XNOR2X1 U906 ( .A(n515), .B(n663), .Y(n476) );
  OR2X4 U907 ( .A(n306), .B(n311), .Y(n643) );
  CLKINVX1 U908 ( .A(n512), .Y(n423) );
  XNOR2X1 U909 ( .A(n515), .B(n659), .Y(n489) );
  XNOR2XL U910 ( .A(a[10]), .B(n674), .Y(n645) );
  INVXL U911 ( .A(n544), .Y(n671) );
  XOR2X4 U912 ( .A(n544), .B(a[8]), .Y(n519) );
  CLKBUFX3 U913 ( .A(n668), .Y(n667) );
  CLKINVX1 U914 ( .A(n545), .Y(n668) );
  INVXL U915 ( .A(n547), .Y(n662) );
  CLKBUFX3 U916 ( .A(n658), .Y(n657) );
  CLKINVX1 U917 ( .A(n548), .Y(n658) );
  CLKINVX1 U918 ( .A(n546), .Y(n665) );
  XNOR2X1 U919 ( .A(n147), .B(n22), .Y(product[6]) );
  NAND2XL U920 ( .A(n180), .B(n146), .Y(n22) );
  OAI21XL U921 ( .A0(n150), .A1(n148), .B0(n149), .Y(n147) );
  XOR2X1 U922 ( .A(n150), .B(n23), .Y(product[5]) );
  NAND2X1 U923 ( .A(n181), .B(n149), .Y(n23) );
  CLKINVX1 U924 ( .A(n148), .Y(n181) );
  XOR2XL U925 ( .A(n154), .B(n24), .Y(product[4]) );
  NAND2X1 U926 ( .A(n182), .B(n153), .Y(n24) );
  CLKINVX1 U927 ( .A(n152), .Y(n182) );
  XNOR2XL U928 ( .A(n25), .B(n159), .Y(product[3]) );
  XOR2X1 U929 ( .A(n26), .B(n163), .Y(product[2]) );
  NAND2X1 U930 ( .A(n184), .B(n161), .Y(n26) );
  CLKINVX1 U931 ( .A(n160), .Y(n184) );
  XNOR2X1 U932 ( .A(n516), .B(n663), .Y(n477) );
  XNOR2X1 U933 ( .A(n516), .B(n544), .Y(n451) );
  NOR2X1 U934 ( .A(n320), .B(n321), .Y(n152) );
  NAND2X1 U935 ( .A(n320), .B(n321), .Y(n153) );
  XNOR2X1 U936 ( .A(n516), .B(n659), .Y(n490) );
  BUFX20 U937 ( .A(n527), .Y(n652) );
  BUFX20 U938 ( .A(n528), .Y(n650) );
  XOR2XL U939 ( .A(n656), .B(a[0]), .Y(n523) );
  OAI22X2 U940 ( .A0(n439), .A1(n524), .B0(n438), .B1(n654), .Y(n348) );
  ADDFHX2 U941 ( .A(n363), .B(n387), .CI(n410), .CO(n303), .S(n304) );
  NOR2BXL U942 ( .AN(n655), .B(n532), .Y(n363) );
  NAND2BXL U943 ( .AN(n655), .B(n664), .Y(n479) );
  OAI22X1 U944 ( .A0(n502), .A1(n620), .B0(n501), .B1(n561), .Y(n415) );
  OAI22X1 U945 ( .A0(n453), .A1(n532), .B0(n525), .B1(n670), .Y(n324) );
  XNOR2X1 U946 ( .A(n655), .B(n656), .Y(n504) );
  ADDFHX2 U947 ( .A(n391), .B(n414), .CI(n403), .CO(n319), .S(n320) );
  NOR2BXL U948 ( .AN(n655), .B(n651), .Y(n391) );
  NAND2BX1 U949 ( .AN(n655), .B(n656), .Y(n505) );
  NOR2BXL U950 ( .AN(n655), .B(n561), .Y(product[0]) );
  BUFX20 U951 ( .A(n1), .Y(n655) );
  OAI2BB2X4 U952 ( .B0(n480), .B1(n650), .A0N(n648), .A1N(n660), .Y(n393) );
  AOI21XL U953 ( .A0(n119), .A1(n106), .B0(n107), .Y(n105) );
  XNOR2X1 U954 ( .A(n621), .B(n674), .Y(n428) );
  XNOR2XL U955 ( .A(n3), .B(n13), .Y(product[15]) );
  AOI21XL U956 ( .A0(n3), .A1(n64), .B0(n65), .Y(n63) );
  CLKINVX6 U957 ( .A(n210), .Y(n211) );
endmodule


module geofence_DW01_add_31 ( A, B, CI, SUM, CO );
  input [22:0] A;
  input [22:0] B;
  output [22:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n33, n35, n36,
         n37, n38, n39, n40, n42, n43, n44, n45, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n58, n59, n60, n61, n62, n63, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n83, n85, n86,
         n87, n88, n89, n90, n93, n94, n95, n96, n98, n100, n101, n102, n103,
         n104, n105, n106, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n125, n127, n128,
         n130, n132, n133, n134, n136, n138, n139, n140, n141, n142, n144,
         n146, n147, n148, n149, n150, n151, n154, n156, n157, n158, n160,
         n164, n165, n166, n167, n171, n173, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272;

  OR2X6 U201 ( .A(B[11]), .B(A[11]), .Y(n267) );
  NAND2X4 U202 ( .A(B[13]), .B(A[13]), .Y(n85) );
  INVX8 U203 ( .A(n127), .Y(n125) );
  NAND2X8 U204 ( .A(B[6]), .B(A[6]), .Y(n127) );
  NAND2X6 U205 ( .A(n269), .B(n270), .Y(n122) );
  NAND2X2 U206 ( .A(B[21]), .B(A[21]), .Y(n35) );
  INVX2 U207 ( .A(n132), .Y(n130) );
  AOI21X4 U208 ( .A0(n73), .A1(n60), .B0(n61), .Y(n59) );
  XNOR2X4 U209 ( .A(n79), .B(n10), .Y(SUM[14]) );
  INVX8 U210 ( .A(n88), .Y(n90) );
  OR2X8 U211 ( .A(B[21]), .B(A[21]), .Y(n268) );
  NAND2X6 U212 ( .A(n89), .B(n266), .Y(n80) );
  INVX8 U213 ( .A(n87), .Y(n89) );
  NOR2X6 U214 ( .A(B[9]), .B(A[9]), .Y(n109) );
  NAND2X2 U215 ( .A(n73), .B(n53), .Y(n251) );
  INVX3 U216 ( .A(n54), .Y(n252) );
  AND2X8 U217 ( .A(n251), .B(n252), .Y(n52) );
  OAI21X1 U218 ( .A0(n63), .A1(n55), .B0(n255), .Y(n54) );
  XOR2X4 U219 ( .A(n52), .B(n6), .Y(SUM[18]) );
  OR2X6 U220 ( .A(n104), .B(n110), .Y(n253) );
  NAND2X6 U221 ( .A(n253), .B(n105), .Y(n103) );
  NOR2X8 U222 ( .A(B[10]), .B(A[10]), .Y(n104) );
  NAND2X4 U223 ( .A(B[9]), .B(A[9]), .Y(n110) );
  AOI21X4 U224 ( .A0(n103), .A1(n267), .B0(n98), .Y(n96) );
  AOI21X2 U225 ( .A0(n111), .A1(n102), .B0(n103), .Y(n101) );
  CLKAND2X12 U226 ( .A(n1), .B(n37), .Y(n254) );
  NOR2X8 U227 ( .A(n254), .B(n38), .Y(n36) );
  NOR2X2 U228 ( .A(n44), .B(n39), .Y(n37) );
  OAI21X4 U229 ( .A0(n39), .A1(n45), .B0(n40), .Y(n38) );
  NOR2X4 U230 ( .A(n55), .B(n50), .Y(n48) );
  NOR2X6 U231 ( .A(B[17]), .B(A[17]), .Y(n55) );
  OAI21X4 U232 ( .A0(n134), .A1(n122), .B0(n123), .Y(n121) );
  AOI21X4 U233 ( .A0(n269), .A1(n130), .B0(n125), .Y(n123) );
  INVX4 U234 ( .A(n134), .Y(n133) );
  AOI21X4 U235 ( .A0(n139), .A1(n271), .B0(n136), .Y(n134) );
  AO21X4 U236 ( .A0(n38), .A1(n268), .B0(n33), .Y(n257) );
  CLKAND2X3 U237 ( .A(n37), .B(n268), .Y(n256) );
  NAND2X2 U238 ( .A(n102), .B(n267), .Y(n95) );
  NOR2X4 U239 ( .A(n104), .B(n109), .Y(n102) );
  AOI21X4 U240 ( .A0(n61), .A1(n48), .B0(n49), .Y(n47) );
  OAI21X4 U241 ( .A0(n50), .A1(n255), .B0(n51), .Y(n49) );
  XOR2X1 U242 ( .A(n142), .B(n21), .Y(SUM[3]) );
  AOI21X4 U243 ( .A0(n147), .A1(n272), .B0(n144), .Y(n142) );
  BUFX8 U244 ( .A(n58), .Y(n255) );
  NOR2X4 U245 ( .A(B[20]), .B(A[20]), .Y(n39) );
  NAND2X1 U246 ( .A(B[17]), .B(A[17]), .Y(n58) );
  NOR2X4 U247 ( .A(n66), .B(n71), .Y(n60) );
  NAND2X1 U248 ( .A(n157), .B(n255), .Y(n7) );
  CLKINVX1 U249 ( .A(n55), .Y(n157) );
  NOR2X4 U250 ( .A(B[8]), .B(A[8]), .Y(n115) );
  NOR2X4 U251 ( .A(B[7]), .B(A[7]), .Y(n118) );
  NOR2X1 U252 ( .A(B[3]), .B(A[3]), .Y(n140) );
  CLKINVX1 U253 ( .A(n7), .Y(n261) );
  OR2X1 U254 ( .A(B[5]), .B(A[5]), .Y(n270) );
  NAND2X1 U255 ( .A(B[5]), .B(A[5]), .Y(n132) );
  NAND2X2 U256 ( .A(B[7]), .B(A[7]), .Y(n119) );
  OR2X4 U257 ( .A(B[6]), .B(A[6]), .Y(n269) );
  NAND2X2 U258 ( .A(B[11]), .B(A[11]), .Y(n100) );
  NAND2X1 U259 ( .A(B[3]), .B(A[3]), .Y(n141) );
  NAND2X1 U260 ( .A(B[4]), .B(A[4]), .Y(n138) );
  OR2X1 U261 ( .A(B[4]), .B(A[4]), .Y(n271) );
  OAI21X2 U262 ( .A0(n142), .A1(n140), .B0(n141), .Y(n139) );
  AND2X2 U263 ( .A(n154), .B(n40), .Y(n259) );
  XNOR2X1 U264 ( .A(n86), .B(n11), .Y(SUM[13]) );
  NAND2X1 U265 ( .A(n42), .B(n45), .Y(n5) );
  NAND2X1 U266 ( .A(n69), .B(n72), .Y(n9) );
  CLKINVX2 U267 ( .A(n94), .Y(n93) );
  INVX4 U268 ( .A(n74), .Y(n73) );
  NAND2X6 U269 ( .A(B[10]), .B(A[10]), .Y(n105) );
  NOR2X4 U270 ( .A(n115), .B(n118), .Y(n113) );
  OAI21X4 U271 ( .A0(n115), .A1(n119), .B0(n116), .Y(n114) );
  INVX4 U272 ( .A(n44), .Y(n42) );
  XOR2X4 U273 ( .A(n258), .B(n259), .Y(SUM[20]) );
  AO21X4 U274 ( .A0(n1), .A1(n42), .B0(n43), .Y(n258) );
  AOI21X4 U275 ( .A0(n1), .A1(n256), .B0(n257), .Y(n27) );
  INVX4 U276 ( .A(n71), .Y(n69) );
  AOI21X1 U277 ( .A0(n111), .A1(n165), .B0(n108), .Y(n106) );
  OAI21X4 U278 ( .A0(n81), .A1(n77), .B0(n78), .Y(n76) );
  INVX4 U279 ( .A(n74), .Y(n264) );
  XNOR2X1 U280 ( .A(n1), .B(n5), .Y(SUM[19]) );
  XOR2X4 U281 ( .A(n27), .B(n2), .Y(SUM[22]) );
  XNOR2X1 U282 ( .A(n73), .B(n9), .Y(SUM[15]) );
  INVX2 U283 ( .A(n85), .Y(n83) );
  CLKAND2X3 U284 ( .A(n48), .B(n60), .Y(n265) );
  AOI21X4 U285 ( .A0(n75), .A1(n94), .B0(n76), .Y(n74) );
  OAI21X4 U286 ( .A0(n112), .A1(n95), .B0(n96), .Y(n94) );
  NOR2X4 U287 ( .A(B[19]), .B(A[19]), .Y(n44) );
  NOR2X8 U288 ( .A(B[14]), .B(A[14]), .Y(n77) );
  NAND2X8 U289 ( .A(B[12]), .B(A[12]), .Y(n88) );
  INVX4 U290 ( .A(n61), .Y(n63) );
  NOR2X1 U291 ( .A(n62), .B(n55), .Y(n53) );
  NOR2X4 U292 ( .A(B[15]), .B(A[15]), .Y(n71) );
  OAI21X2 U293 ( .A0(n93), .A1(n87), .B0(n88), .Y(n86) );
  NOR2X8 U294 ( .A(B[12]), .B(A[12]), .Y(n87) );
  INVX1 U295 ( .A(n112), .Y(n111) );
  INVX1 U296 ( .A(n121), .Y(n120) );
  OAI21X2 U297 ( .A0(n93), .A1(n80), .B0(n81), .Y(n79) );
  OR2X4 U298 ( .A(B[2]), .B(A[2]), .Y(n272) );
  AOI21X4 U299 ( .A0(n266), .A1(n90), .B0(n83), .Y(n81) );
  OR2X8 U300 ( .A(B[13]), .B(A[13]), .Y(n266) );
  NOR2X4 U301 ( .A(n80), .B(n77), .Y(n75) );
  AOI21X2 U302 ( .A0(n73), .A1(n69), .B0(n70), .Y(n68) );
  NAND2X2 U303 ( .A(n59), .B(n261), .Y(n262) );
  NAND2X4 U304 ( .A(n260), .B(n7), .Y(n263) );
  NAND2X4 U305 ( .A(n262), .B(n263), .Y(SUM[17]) );
  INVX3 U306 ( .A(n59), .Y(n260) );
  OAI21X4 U307 ( .A0(n66), .A1(n72), .B0(n67), .Y(n61) );
  NAND2X6 U308 ( .A(B[15]), .B(A[15]), .Y(n72) );
  NAND2X6 U309 ( .A(B[14]), .B(A[14]), .Y(n78) );
  NAND2X6 U310 ( .A(B[2]), .B(A[2]), .Y(n146) );
  NAND2X2 U311 ( .A(B[8]), .B(A[8]), .Y(n116) );
  AOI21X4 U312 ( .A0(n113), .A1(n121), .B0(n114), .Y(n112) );
  INVX3 U313 ( .A(n100), .Y(n98) );
  OAI21X2 U314 ( .A0(n148), .A1(n151), .B0(n149), .Y(n147) );
  NAND2X6 U315 ( .A(B[0]), .B(A[0]), .Y(n151) );
  OAI21XL U316 ( .A0(n120), .A1(n118), .B0(n119), .Y(n117) );
  NAND2X2 U317 ( .A(B[19]), .B(A[19]), .Y(n45) );
  NOR2X2 U318 ( .A(B[22]), .B(A[22]), .Y(n25) );
  XNOR2XL U319 ( .A(n139), .B(n20), .Y(SUM[4]) );
  NAND2XL U320 ( .A(n272), .B(n146), .Y(n22) );
  NAND2XL U321 ( .A(n171), .B(n141), .Y(n21) );
  OAI2BB1X4 U322 ( .A0N(n264), .A1N(n265), .B0(n47), .Y(n1) );
  INVXL U323 ( .A(n109), .Y(n165) );
  INVXL U324 ( .A(n140), .Y(n171) );
  INVXL U325 ( .A(n148), .Y(n173) );
  NOR2X6 U326 ( .A(B[16]), .B(A[16]), .Y(n66) );
  NOR2X6 U327 ( .A(B[18]), .B(A[18]), .Y(n50) );
  XOR2X4 U328 ( .A(n36), .B(n3), .Y(SUM[21]) );
  NAND2X2 U329 ( .A(n268), .B(n35), .Y(n3) );
  NAND2XL U330 ( .A(n158), .B(n67), .Y(n8) );
  NAND2BX2 U331 ( .AN(n25), .B(n26), .Y(n2) );
  XOR2X1 U332 ( .A(n93), .B(n12), .Y(SUM[12]) );
  NAND2X2 U333 ( .A(B[1]), .B(A[1]), .Y(n149) );
  XNOR2X1 U334 ( .A(n111), .B(n15), .Y(SUM[9]) );
  XOR2X1 U335 ( .A(n120), .B(n17), .Y(SUM[7]) );
  XNOR2X1 U336 ( .A(n133), .B(n19), .Y(SUM[5]) );
  XOR2X1 U337 ( .A(n23), .B(n151), .Y(SUM[1]) );
  INVX1 U338 ( .A(n24), .Y(SUM[0]) );
  CLKINVX1 U339 ( .A(n45), .Y(n43) );
  CLKINVX1 U340 ( .A(n72), .Y(n70) );
  CLKINVX1 U341 ( .A(n60), .Y(n62) );
  CLKINVX1 U342 ( .A(n35), .Y(n33) );
  CLKINVX1 U343 ( .A(n39), .Y(n154) );
  CLKINVX1 U344 ( .A(n50), .Y(n156) );
  CLKINVX1 U345 ( .A(n66), .Y(n158) );
  CLKINVX1 U346 ( .A(n138), .Y(n136) );
  CLKINVX1 U347 ( .A(n146), .Y(n144) );
  CLKINVX1 U348 ( .A(n110), .Y(n108) );
  CLKINVX1 U349 ( .A(n77), .Y(n160) );
  CLKINVX1 U350 ( .A(n104), .Y(n164) );
  CLKINVX1 U351 ( .A(n115), .Y(n166) );
  CLKINVX1 U352 ( .A(n118), .Y(n167) );
  AOI21XL U353 ( .A0(n133), .A1(n270), .B0(n130), .Y(n128) );
  XOR2X1 U354 ( .A(n68), .B(n8), .Y(SUM[16]) );
  NAND2X1 U355 ( .A(n156), .B(n51), .Y(n6) );
  NAND2X2 U356 ( .A(B[16]), .B(A[16]), .Y(n67) );
  NAND2X2 U357 ( .A(B[18]), .B(A[18]), .Y(n51) );
  NAND2X2 U358 ( .A(B[20]), .B(A[20]), .Y(n40) );
  NAND2XL U359 ( .A(n266), .B(n85), .Y(n11) );
  NAND2XL U360 ( .A(n160), .B(n78), .Y(n10) );
  NAND2XL U361 ( .A(n89), .B(n88), .Y(n12) );
  NAND2X1 U362 ( .A(B[22]), .B(A[22]), .Y(n26) );
  NOR2X2 U363 ( .A(B[1]), .B(A[1]), .Y(n148) );
  XOR2X1 U364 ( .A(n106), .B(n14), .Y(SUM[10]) );
  NAND2XL U365 ( .A(n164), .B(n105), .Y(n14) );
  XOR2X1 U366 ( .A(n101), .B(n13), .Y(SUM[11]) );
  NAND2XL U367 ( .A(n267), .B(n100), .Y(n13) );
  NAND2XL U368 ( .A(n165), .B(n110), .Y(n15) );
  XNOR2X1 U369 ( .A(n117), .B(n16), .Y(SUM[8]) );
  NAND2XL U370 ( .A(n166), .B(n116), .Y(n16) );
  NAND2XL U371 ( .A(n167), .B(n119), .Y(n17) );
  XOR2X1 U372 ( .A(n128), .B(n18), .Y(SUM[6]) );
  NAND2XL U373 ( .A(n269), .B(n127), .Y(n18) );
  NAND2XL U374 ( .A(n270), .B(n132), .Y(n19) );
  NAND2XL U375 ( .A(n271), .B(n138), .Y(n20) );
  XNOR2XL U376 ( .A(n22), .B(n147), .Y(SUM[2]) );
  NAND2XL U377 ( .A(n173), .B(n149), .Y(n23) );
  NAND2BXL U378 ( .AN(n150), .B(n151), .Y(n24) );
  NOR2XL U379 ( .A(B[0]), .B(A[0]), .Y(n150) );
endmodule


module geofence_DW01_sub_17 ( A, B, CI, DIFF, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n14, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n30, n31, n32, n33, n35, n38,
         n39, n40, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n64, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n115, n116;

  AOI21X4 U56 ( .A0(n55), .A1(n47), .B0(n48), .Y(n46) );
  OAI21X2 U91 ( .A0(n46), .A1(n18), .B0(n19), .Y(n17) );
  AOI21X2 U92 ( .A0(n33), .A1(n20), .B0(n21), .Y(n19) );
  OAI21X2 U93 ( .A0(n38), .A1(n44), .B0(n39), .Y(n33) );
  CLKINVX1 U94 ( .A(B[7]), .Y(n70) );
  NOR2X8 U95 ( .A(A[6]), .B(n71), .Y(n27) );
  INVX6 U96 ( .A(B[6]), .Y(n71) );
  INVX4 U97 ( .A(B[5]), .Y(n72) );
  INVX8 U98 ( .A(B[4]), .Y(n73) );
  NAND2X1 U99 ( .A(A[7]), .B(n70), .Y(n23) );
  NAND2BX2 U100 ( .AN(n49), .B(n50), .Y(n7) );
  NOR2X1 U101 ( .A(n52), .B(n49), .Y(n47) );
  NOR2X2 U102 ( .A(A[3]), .B(n74), .Y(n49) );
  INVX3 U103 ( .A(B[3]), .Y(n74) );
  NOR2X1 U104 ( .A(A[4]), .B(n73), .Y(n43) );
  CLKINVX4 U105 ( .A(n43), .Y(n64) );
  INVX3 U106 ( .A(n46), .Y(n45) );
  XOR2X2 U107 ( .A(n40), .B(n5), .Y(DIFF[5]) );
  AOI21X1 U108 ( .A0(n17), .A1(n115), .B0(n14), .Y(n12) );
  OAI21XL U109 ( .A0(n54), .A1(n52), .B0(n53), .Y(n51) );
  AOI21X1 U110 ( .A0(n45), .A1(n64), .B0(n42), .Y(n40) );
  NAND2X1 U111 ( .A(A[3]), .B(n74), .Y(n50) );
  AOI21X1 U112 ( .A0(n45), .A1(n25), .B0(n26), .Y(n24) );
  NOR2BX1 U113 ( .AN(n32), .B(n27), .Y(n25) );
  OAI21X1 U114 ( .A0(n35), .A1(n27), .B0(n30), .Y(n26) );
  XOR2X1 U115 ( .A(n54), .B(n8), .Y(DIFF[2]) );
  XOR2X1 U116 ( .A(n31), .B(n4), .Y(DIFF[6]) );
  NAND2BX1 U117 ( .AN(n27), .B(n30), .Y(n4) );
  NOR2X1 U118 ( .A(A[0]), .B(n77), .Y(n58) );
  NAND2X4 U119 ( .A(A[1]), .B(n76), .Y(n57) );
  INVX4 U120 ( .A(B[1]), .Y(n76) );
  XNOR2X2 U121 ( .A(n17), .B(n2), .Y(DIFF[8]) );
  INVX1 U122 ( .A(B[2]), .Y(n75) );
  OAI21X2 U123 ( .A0(n56), .A1(n58), .B0(n57), .Y(n55) );
  NOR2X1 U124 ( .A(A[1]), .B(n76), .Y(n56) );
  AOI21X1 U125 ( .A0(n45), .A1(n32), .B0(n33), .Y(n31) );
  INVX3 U126 ( .A(n55), .Y(n54) );
  NOR2X2 U127 ( .A(A[5]), .B(n72), .Y(n38) );
  OAI21X1 U128 ( .A0(n49), .A1(n53), .B0(n50), .Y(n48) );
  NAND2X2 U129 ( .A(A[2]), .B(n75), .Y(n53) );
  NAND2X2 U130 ( .A(A[6]), .B(n71), .Y(n30) );
  NOR2X4 U131 ( .A(n27), .B(n22), .Y(n20) );
  NOR2X2 U132 ( .A(n43), .B(n38), .Y(n32) );
  NAND2X1 U133 ( .A(A[5]), .B(n72), .Y(n39) );
  CLKINVX4 U134 ( .A(B[0]), .Y(n77) );
  NAND2XL U135 ( .A(n64), .B(n44), .Y(n6) );
  OR2X1 U136 ( .A(A[8]), .B(n69), .Y(n115) );
  OAI21X1 U137 ( .A0(n22), .A1(n30), .B0(n23), .Y(n21) );
  NAND2XL U138 ( .A(n67), .B(n57), .Y(n9) );
  XOR2X2 U139 ( .A(n9), .B(n58), .Y(DIFF[1]) );
  XNOR2X2 U140 ( .A(n51), .B(n7), .Y(DIFF[3]) );
  XNOR2XL U141 ( .A(n45), .B(n6), .Y(DIFF[4]) );
  INVXL U142 ( .A(n44), .Y(n42) );
  NOR2X2 U143 ( .A(A[7]), .B(n70), .Y(n22) );
  NAND2XL U144 ( .A(A[8]), .B(n69), .Y(n16) );
  CLKINVX1 U145 ( .A(n33), .Y(n35) );
  XOR2X4 U146 ( .A(n12), .B(n1), .Y(DIFF[9]) );
  XOR2X4 U147 ( .A(n24), .B(n3), .Y(DIFF[7]) );
  NAND2X1 U148 ( .A(n32), .B(n20), .Y(n18) );
  CLKINVX1 U149 ( .A(n16), .Y(n14) );
  NAND2BXL U150 ( .AN(n52), .B(n53), .Y(n8) );
  NAND2BX1 U151 ( .AN(n38), .B(n39), .Y(n5) );
  NAND2X1 U152 ( .A(n115), .B(n16), .Y(n2) );
  NAND2BX1 U153 ( .AN(n22), .B(n23), .Y(n3) );
  CLKINVX1 U154 ( .A(n56), .Y(n67) );
  XNOR2XL U155 ( .A(A[0]), .B(n77), .Y(DIFF[0]) );
  NAND2X2 U156 ( .A(A[4]), .B(n73), .Y(n44) );
  INVXL U157 ( .A(B[8]), .Y(n69) );
  INVXL U158 ( .A(B[9]), .Y(n68) );
  OR2X2 U159 ( .A(n10), .B(n116), .Y(n1) );
  AND2XL U160 ( .A(A[9]), .B(n68), .Y(n116) );
  NOR2XL U161 ( .A(A[9]), .B(n68), .Y(n10) );
  NOR2X2 U162 ( .A(A[2]), .B(n75), .Y(n52) );
endmodule


module geofence_DW01_sub_19 ( A, B, CI, DIFF, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n11, n12, n14, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n30, n31, n32, n33, n35, n38,
         n39, n40, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n61, n62, n63, n64, n65, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n115, n116, n117, n118, n119;

  NOR2X4 U91 ( .A(A[3]), .B(n74), .Y(n49) );
  CLKINVX6 U92 ( .A(B[3]), .Y(n74) );
  NAND2X2 U93 ( .A(A[7]), .B(n70), .Y(n23) );
  NOR2X4 U94 ( .A(A[7]), .B(n70), .Y(n22) );
  CLKINVX4 U95 ( .A(n55), .Y(n54) );
  NAND2X2 U96 ( .A(A[1]), .B(n76), .Y(n57) );
  INVX4 U97 ( .A(B[1]), .Y(n76) );
  CLKAND2X4 U98 ( .A(n55), .B(n47), .Y(n115) );
  NOR2X8 U99 ( .A(n115), .B(n48), .Y(n46) );
  OAI21X4 U100 ( .A0(n56), .A1(n58), .B0(n57), .Y(n55) );
  OAI21X2 U101 ( .A0(n49), .A1(n53), .B0(n50), .Y(n48) );
  INVX8 U102 ( .A(n46), .Y(n45) );
  NAND2X6 U103 ( .A(n45), .B(n25), .Y(n116) );
  INVX4 U104 ( .A(n26), .Y(n117) );
  AND2X8 U105 ( .A(n116), .B(n117), .Y(n24) );
  NOR2BX4 U106 ( .AN(n32), .B(n27), .Y(n25) );
  OAI21X1 U107 ( .A0(n35), .A1(n27), .B0(n30), .Y(n26) );
  AOI21X2 U108 ( .A0(n45), .A1(n32), .B0(n33), .Y(n31) );
  INVX4 U109 ( .A(n33), .Y(n35) );
  OAI21X4 U110 ( .A0(n38), .A1(n44), .B0(n39), .Y(n33) );
  AOI21X2 U111 ( .A0(n17), .A1(n118), .B0(n14), .Y(n12) );
  XNOR2X2 U112 ( .A(n51), .B(n7), .Y(DIFF[3]) );
  NOR2X4 U113 ( .A(A[6]), .B(n71), .Y(n27) );
  OAI21XL U114 ( .A0(n54), .A1(n52), .B0(n53), .Y(n51) );
  AOI21X1 U115 ( .A0(n45), .A1(n64), .B0(n42), .Y(n40) );
  NAND2X1 U116 ( .A(n64), .B(n44), .Y(n6) );
  INVX3 U117 ( .A(B[7]), .Y(n70) );
  NOR2X1 U118 ( .A(n52), .B(n49), .Y(n47) );
  XOR2X2 U119 ( .A(n12), .B(n1), .Y(DIFF[9]) );
  NAND2X6 U120 ( .A(A[4]), .B(n73), .Y(n44) );
  NAND2X2 U121 ( .A(A[5]), .B(n72), .Y(n39) );
  INVX6 U122 ( .A(B[6]), .Y(n71) );
  NAND2X1 U123 ( .A(A[8]), .B(n69), .Y(n16) );
  NOR2X2 U124 ( .A(A[0]), .B(n77), .Y(n58) );
  XNOR2X2 U125 ( .A(n45), .B(n6), .Y(DIFF[4]) );
  NOR2X1 U126 ( .A(A[4]), .B(n73), .Y(n43) );
  INVX3 U127 ( .A(B[0]), .Y(n77) );
  CLKINVX6 U128 ( .A(B[5]), .Y(n72) );
  INVX3 U129 ( .A(B[4]), .Y(n73) );
  NOR2X2 U130 ( .A(A[2]), .B(n75), .Y(n52) );
  INVX3 U131 ( .A(B[2]), .Y(n75) );
  XOR2X1 U132 ( .A(n54), .B(n8), .Y(DIFF[2]) );
  OAI21X2 U133 ( .A0(n46), .A1(n18), .B0(n19), .Y(n17) );
  AOI21X1 U134 ( .A0(n33), .A1(n20), .B0(n21), .Y(n19) );
  XNOR2X4 U135 ( .A(n17), .B(n2), .Y(DIFF[8]) );
  NOR2X1 U136 ( .A(A[1]), .B(n76), .Y(n56) );
  NAND2XL U137 ( .A(n67), .B(n57), .Y(n9) );
  XOR2X2 U138 ( .A(n9), .B(n58), .Y(DIFF[1]) );
  NOR2X2 U139 ( .A(n43), .B(n38), .Y(n32) );
  NOR2X2 U140 ( .A(A[5]), .B(n72), .Y(n38) );
  XOR2X2 U141 ( .A(n31), .B(n4), .Y(DIFF[6]) );
  NAND2XL U142 ( .A(n62), .B(n30), .Y(n4) );
  INVXL U143 ( .A(n49), .Y(n65) );
  NAND2X1 U144 ( .A(A[2]), .B(n75), .Y(n53) );
  OR2X1 U145 ( .A(A[8]), .B(n69), .Y(n118) );
  XOR2X4 U146 ( .A(n24), .B(n3), .Y(DIFF[7]) );
  NAND2X1 U147 ( .A(n61), .B(n23), .Y(n3) );
  NAND2X1 U148 ( .A(n65), .B(n50), .Y(n7) );
  NAND2X1 U149 ( .A(n119), .B(n11), .Y(n1) );
  XOR2X4 U150 ( .A(n40), .B(n5), .Y(DIFF[5]) );
  NAND2X1 U151 ( .A(n63), .B(n39), .Y(n5) );
  NAND2X1 U152 ( .A(n118), .B(n16), .Y(n2) );
  CLKINVX1 U153 ( .A(n44), .Y(n42) );
  NAND2X1 U154 ( .A(n32), .B(n20), .Y(n18) );
  NOR2X1 U155 ( .A(n27), .B(n22), .Y(n20) );
  CLKINVX1 U156 ( .A(n16), .Y(n14) );
  OAI21XL U157 ( .A0(n22), .A1(n30), .B0(n23), .Y(n21) );
  CLKINVX1 U158 ( .A(n43), .Y(n64) );
  NAND2BX1 U159 ( .AN(n52), .B(n53), .Y(n8) );
  CLKINVX1 U160 ( .A(n27), .Y(n62) );
  CLKINVX1 U161 ( .A(n22), .Y(n61) );
  CLKINVX1 U162 ( .A(n38), .Y(n63) );
  CLKINVX1 U163 ( .A(n56), .Y(n67) );
  XNOR2XL U164 ( .A(A[0]), .B(n77), .Y(DIFF[0]) );
  NAND2X1 U165 ( .A(A[3]), .B(n74), .Y(n50) );
  NAND2X1 U166 ( .A(A[6]), .B(n71), .Y(n30) );
  INVXL U167 ( .A(B[8]), .Y(n69) );
  INVXL U168 ( .A(B[9]), .Y(n68) );
  OR2XL U169 ( .A(A[9]), .B(n68), .Y(n119) );
  NAND2XL U170 ( .A(A[9]), .B(n68), .Y(n11) );
endmodule


module geofence_DW01_sub_16 ( A, B, CI, DIFF, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n11, n12, n14, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n30, n31, n32, n33, n35, n38,
         n39, n40, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n61, n62, n63, n64, n66, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125;

  AOI21X4 U56 ( .A0(n55), .A1(n47), .B0(n48), .Y(n46) );
  NOR2X8 U61 ( .A(n74), .B(A[3]), .Y(n49) );
  XOR2X4 U91 ( .A(n24), .B(n3), .Y(DIFF[7]) );
  CLKINVX8 U92 ( .A(B[2]), .Y(n75) );
  NOR2X6 U93 ( .A(n72), .B(A[5]), .Y(n38) );
  INVX4 U94 ( .A(B[0]), .Y(n77) );
  OAI21X4 U95 ( .A0(n46), .A1(n18), .B0(n19), .Y(n17) );
  AOI21X2 U96 ( .A0(n33), .A1(n20), .B0(n21), .Y(n19) );
  AOI21X2 U97 ( .A0(n17), .A1(n124), .B0(n14), .Y(n12) );
  NAND2X2 U98 ( .A(n32), .B(n20), .Y(n18) );
  NOR2X4 U99 ( .A(n43), .B(n38), .Y(n32) );
  XOR2X4 U100 ( .A(n40), .B(n5), .Y(DIFF[5]) );
  NOR2X1 U101 ( .A(n54), .B(n52), .Y(n115) );
  INVXL U102 ( .A(n53), .Y(n116) );
  OR2X4 U103 ( .A(n115), .B(n116), .Y(n51) );
  INVX6 U104 ( .A(n55), .Y(n54) );
  XNOR2X4 U105 ( .A(n51), .B(n7), .Y(DIFF[3]) );
  NAND2X6 U106 ( .A(n73), .B(A[4]), .Y(n44) );
  NOR2X2 U107 ( .A(n73), .B(A[4]), .Y(n43) );
  NAND2X2 U108 ( .A(n31), .B(n118), .Y(n119) );
  NAND2X4 U109 ( .A(n117), .B(n4), .Y(n120) );
  NAND2X4 U110 ( .A(n119), .B(n120), .Y(DIFF[6]) );
  INVX3 U111 ( .A(n31), .Y(n117) );
  INVXL U112 ( .A(n4), .Y(n118) );
  AOI21X2 U113 ( .A0(n45), .A1(n32), .B0(n33), .Y(n31) );
  NAND2X4 U114 ( .A(n121), .B(n122), .Y(n123) );
  NAND2X2 U115 ( .A(n123), .B(n30), .Y(n26) );
  INVX3 U116 ( .A(n35), .Y(n121) );
  CLKINVX1 U117 ( .A(n27), .Y(n122) );
  CLKINVX2 U118 ( .A(n33), .Y(n35) );
  NOR2X6 U119 ( .A(n71), .B(A[6]), .Y(n27) );
  NAND2X4 U120 ( .A(n71), .B(A[6]), .Y(n30) );
  INVX8 U121 ( .A(B[7]), .Y(n70) );
  OAI21X1 U122 ( .A0(n22), .A1(n30), .B0(n23), .Y(n21) );
  CLKINVX4 U123 ( .A(B[5]), .Y(n72) );
  INVX2 U124 ( .A(B[6]), .Y(n71) );
  XOR2X1 U125 ( .A(n9), .B(n58), .Y(DIFF[1]) );
  NAND2BXL U126 ( .AN(n56), .B(n57), .Y(n9) );
  AOI21X1 U127 ( .A0(n45), .A1(n64), .B0(n42), .Y(n40) );
  NAND2X1 U128 ( .A(n62), .B(n30), .Y(n4) );
  AOI21X1 U129 ( .A0(n45), .A1(n25), .B0(n26), .Y(n24) );
  OAI21X2 U130 ( .A0(n38), .A1(n44), .B0(n39), .Y(n33) );
  NOR2X2 U131 ( .A(n70), .B(A[7]), .Y(n22) );
  OAI21XL U132 ( .A0(n49), .A1(n53), .B0(n50), .Y(n48) );
  NOR2X1 U133 ( .A(n52), .B(n49), .Y(n47) );
  XOR2X1 U134 ( .A(n54), .B(n8), .Y(DIFF[2]) );
  XOR2X2 U135 ( .A(n12), .B(n1), .Y(DIFF[9]) );
  NOR2BX1 U136 ( .AN(n32), .B(n27), .Y(n25) );
  INVX4 U137 ( .A(B[1]), .Y(n76) );
  OR2X2 U138 ( .A(n68), .B(A[9]), .Y(n125) );
  CLKINVX4 U139 ( .A(B[9]), .Y(n68) );
  NAND2X1 U140 ( .A(n68), .B(A[9]), .Y(n11) );
  OAI21X4 U141 ( .A0(n56), .A1(n58), .B0(n57), .Y(n55) );
  XNOR2X1 U142 ( .A(n45), .B(n6), .Y(DIFF[4]) );
  INVX6 U143 ( .A(n46), .Y(n45) );
  INVX4 U144 ( .A(B[4]), .Y(n73) );
  NAND2X2 U145 ( .A(n72), .B(A[5]), .Y(n39) );
  INVX6 U146 ( .A(B[3]), .Y(n74) );
  NAND2X4 U147 ( .A(n74), .B(A[3]), .Y(n50) );
  NOR2X1 U148 ( .A(n76), .B(A[1]), .Y(n56) );
  NAND2X4 U149 ( .A(n75), .B(A[2]), .Y(n53) );
  NOR2X1 U150 ( .A(n77), .B(A[0]), .Y(n58) );
  NOR2X4 U151 ( .A(n27), .B(n22), .Y(n20) );
  NAND2X2 U152 ( .A(n64), .B(n44), .Y(n6) );
  NAND2XL U153 ( .A(n66), .B(n53), .Y(n8) );
  NAND2XL U154 ( .A(n76), .B(A[1]), .Y(n57) );
  NOR2X1 U155 ( .A(n75), .B(A[2]), .Y(n52) );
  NAND2XL U156 ( .A(n70), .B(A[7]), .Y(n23) );
  OR2XL U157 ( .A(n69), .B(A[8]), .Y(n124) );
  NAND2XL U158 ( .A(n69), .B(A[8]), .Y(n16) );
  NAND2X1 U159 ( .A(n125), .B(n11), .Y(n1) );
  XNOR2X1 U160 ( .A(n17), .B(n2), .Y(DIFF[8]) );
  NAND2X1 U161 ( .A(n124), .B(n16), .Y(n2) );
  NAND2X1 U162 ( .A(n63), .B(n39), .Y(n5) );
  NAND2X1 U163 ( .A(n61), .B(n23), .Y(n3) );
  CLKINVX1 U164 ( .A(n16), .Y(n14) );
  CLKINVX1 U165 ( .A(n44), .Y(n42) );
  CLKINVX1 U166 ( .A(n38), .Y(n63) );
  CLKINVX1 U167 ( .A(n27), .Y(n62) );
  NAND2BXL U168 ( .AN(n49), .B(n50), .Y(n7) );
  CLKINVX1 U169 ( .A(n43), .Y(n64) );
  INVXL U170 ( .A(n22), .Y(n61) );
  CLKINVX1 U171 ( .A(n52), .Y(n66) );
  XNOR2XL U172 ( .A(n77), .B(A[0]), .Y(DIFF[0]) );
  INVXL U173 ( .A(B[8]), .Y(n69) );
endmodule


module geofence_DW01_sub_18 ( A, B, CI, DIFF, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n12, n14, n16, n17, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n30, n31, n32, n33, n35, n38, n39, n40,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n64, n66, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n115, n116, n117, n118, n119;

  AOI21X4 U7 ( .A0(n17), .A1(n119), .B0(n14), .Y(n12) );
  AOI21X4 U56 ( .A0(n55), .A1(n47), .B0(n48), .Y(n46) );
  OAI21X4 U58 ( .A0(n49), .A1(n53), .B0(n50), .Y(n48) );
  NOR2X4 U91 ( .A(n27), .B(n22), .Y(n20) );
  NOR2X4 U92 ( .A(n70), .B(A[7]), .Y(n22) );
  INVX8 U93 ( .A(B[7]), .Y(n70) );
  INVX6 U94 ( .A(n46), .Y(n45) );
  NOR2X8 U95 ( .A(n75), .B(A[2]), .Y(n52) );
  INVX6 U96 ( .A(B[2]), .Y(n75) );
  INVX6 U97 ( .A(n55), .Y(n54) );
  OAI21X4 U98 ( .A0(n56), .A1(n58), .B0(n57), .Y(n55) );
  XOR2X1 U99 ( .A(n54), .B(n8), .Y(DIFF[2]) );
  NAND2X1 U100 ( .A(n119), .B(n16), .Y(n2) );
  NOR2X4 U101 ( .A(n74), .B(A[3]), .Y(n49) );
  XNOR2X2 U102 ( .A(n51), .B(n7), .Y(DIFF[3]) );
  XOR2X2 U103 ( .A(n40), .B(n5), .Y(DIFF[5]) );
  NAND2X1 U104 ( .A(n64), .B(n44), .Y(n6) );
  INVX3 U105 ( .A(B[8]), .Y(n69) );
  AOI21X2 U106 ( .A0(n33), .A1(n20), .B0(n21), .Y(n19) );
  CLKINVX3 U107 ( .A(B[1]), .Y(n76) );
  INVX2 U108 ( .A(B[0]), .Y(n77) );
  OAI21XL U109 ( .A0(n54), .A1(n52), .B0(n53), .Y(n51) );
  AOI21X1 U110 ( .A0(n45), .A1(n64), .B0(n42), .Y(n40) );
  NAND2X1 U111 ( .A(n70), .B(A[7]), .Y(n23) );
  AOI21X1 U112 ( .A0(n45), .A1(n32), .B0(n33), .Y(n31) );
  OAI21XL U113 ( .A0(n22), .A1(n30), .B0(n23), .Y(n21) );
  NOR2X1 U114 ( .A(n43), .B(n38), .Y(n32) );
  NAND2X1 U115 ( .A(n76), .B(A[1]), .Y(n57) );
  XOR2X1 U116 ( .A(n12), .B(n1), .Y(DIFF[9]) );
  NAND2X1 U117 ( .A(n117), .B(n118), .Y(n1) );
  XNOR2X4 U118 ( .A(n17), .B(n2), .Y(DIFF[8]) );
  NOR2BX4 U119 ( .AN(n32), .B(n27), .Y(n25) );
  NOR2X6 U120 ( .A(n71), .B(A[6]), .Y(n27) );
  INVX8 U121 ( .A(B[6]), .Y(n71) );
  AND2X2 U122 ( .A(n32), .B(n20), .Y(n116) );
  AOI21X2 U123 ( .A0(n45), .A1(n25), .B0(n26), .Y(n24) );
  NAND2X2 U124 ( .A(n74), .B(A[3]), .Y(n50) );
  INVX4 U125 ( .A(B[3]), .Y(n74) );
  INVX3 U126 ( .A(n46), .Y(n115) );
  NOR2X1 U127 ( .A(n76), .B(A[1]), .Y(n56) );
  NOR2X4 U128 ( .A(n73), .B(A[4]), .Y(n43) );
  INVX6 U129 ( .A(B[4]), .Y(n73) );
  NOR2X4 U130 ( .A(n72), .B(A[5]), .Y(n38) );
  NAND2X2 U131 ( .A(n72), .B(A[5]), .Y(n39) );
  NOR2X2 U132 ( .A(n77), .B(A[0]), .Y(n58) );
  INVX4 U133 ( .A(B[5]), .Y(n72) );
  NAND2XL U134 ( .A(n66), .B(n53), .Y(n8) );
  OAI21X4 U135 ( .A0(n38), .A1(n44), .B0(n39), .Y(n33) );
  XOR2XL U136 ( .A(n9), .B(n58), .Y(DIFF[1]) );
  OAI21X4 U137 ( .A0(n35), .A1(n27), .B0(n30), .Y(n26) );
  NAND2X1 U138 ( .A(n73), .B(A[4]), .Y(n44) );
  NAND2X1 U139 ( .A(n71), .B(A[6]), .Y(n30) );
  OR2XL U140 ( .A(n68), .B(A[9]), .Y(n117) );
  NAND2XL U141 ( .A(n68), .B(A[9]), .Y(n118) );
  OAI2BB1X4 U142 ( .A0N(n115), .A1N(n116), .B0(n19), .Y(n17) );
  XNOR2X2 U143 ( .A(n45), .B(n6), .Y(DIFF[4]) );
  XOR2X2 U144 ( .A(n31), .B(n4), .Y(DIFF[6]) );
  NAND2BXL U145 ( .AN(n38), .B(n39), .Y(n5) );
  OR2XL U146 ( .A(n69), .B(A[8]), .Y(n119) );
  NAND2XL U147 ( .A(n69), .B(A[8]), .Y(n16) );
  CLKINVX1 U148 ( .A(n33), .Y(n35) );
  XOR2X4 U149 ( .A(n24), .B(n3), .Y(DIFF[7]) );
  NOR2X4 U150 ( .A(n52), .B(n49), .Y(n47) );
  CLKINVX1 U151 ( .A(n44), .Y(n42) );
  CLKINVX1 U152 ( .A(n16), .Y(n14) );
  NAND2BXL U153 ( .AN(n22), .B(n23), .Y(n3) );
  NAND2BX1 U154 ( .AN(n27), .B(n30), .Y(n4) );
  CLKINVX1 U155 ( .A(n43), .Y(n64) );
  NAND2BXL U156 ( .AN(n49), .B(n50), .Y(n7) );
  CLKINVX1 U157 ( .A(n52), .Y(n66) );
  NAND2BX1 U158 ( .AN(n56), .B(n57), .Y(n9) );
  XNOR2XL U159 ( .A(n77), .B(A[0]), .Y(DIFF[0]) );
  NAND2X1 U160 ( .A(n75), .B(A[2]), .Y(n53) );
  INVXL U161 ( .A(B[9]), .Y(n68) );
endmodule


module geofence ( clk, reset, X, Y, R, valid, is_inside );
  input [9:0] X;
  input [9:0] Y;
  input [10:0] R;
  input clk, reset;
  output valid, is_inside;
  wire   \store_counter2[1] , \geofence_X[1][9] , \geofence_X[1][8] ,
         \geofence_X[1][7] , \geofence_X[1][6] , \geofence_X[1][5] ,
         \geofence_X[1][4] , \geofence_X[1][3] , \geofence_X[1][2] ,
         \geofence_X[1][1] , \geofence_X[1][0] , \geofence_Y[1][9] ,
         \geofence_Y[1][8] , \geofence_Y[1][7] , \geofence_Y[1][6] ,
         \geofence_Y[1][5] , \geofence_Y[1][4] , \geofence_Y[1][3] ,
         \geofence_Y[1][2] , \geofence_Y[1][1] , \geofence_Y[1][0] , N1809,
         N1810, N1811, N1812, N1813, N1814, N1815, N1816, N1817, N1818, N1819,
         N1820, N1821, N1822, N1823, N1824, N1825, N1826, N1827, N1828, N1829,
         N1830, N1841, N1842, N1843, N1844, N1845, N1846, N1847, N1848, N1849,
         N1850, N1851, N1852, N1853, N1854, N1855, N1856, N1857, N1858, N1859,
         N1860, N1861, N1871, N1872, N1873, N1874, N1875, N1876, N1877, N1878,
         N1879, N1880, N1881, N1882, N1883, N1884, N1885, N1886, N1887, N1888,
         N1889, N1890, N1891, N1901, N1902, N1903, N1904, N1905, N1906, N1907,
         N1908, N1909, N1910, N1911, N1912, N1913, N1914, N1915, N1916, N1917,
         N1918, N1919, N1920, N1921, N1931, N1932, N1933, N1934, N1935, N1936,
         N1937, N1938, N1939, N1940, N1941, N1942, N1943, N1944, N1945, N1946,
         N1947, N1948, N1949, N1950, N1951, \geofence_X_reg[0][9] ,
         \geofence_X_reg[0][8] , \geofence_X_reg[0][7] ,
         \geofence_X_reg[0][6] , \geofence_X_reg[0][5] ,
         \geofence_X_reg[0][4] , \geofence_X_reg[0][3] ,
         \geofence_X_reg[0][2] , \geofence_X_reg[0][1] ,
         \geofence_X_reg[0][0] , \geofence_X_reg[1][9] ,
         \geofence_X_reg[1][8] , \geofence_X_reg[1][7] ,
         \geofence_X_reg[1][6] , \geofence_X_reg[1][5] ,
         \geofence_X_reg[1][4] , \geofence_X_reg[1][3] ,
         \geofence_X_reg[1][2] , \geofence_X_reg[1][1] ,
         \geofence_X_reg[1][0] , \geofence_Y_reg[0][9] ,
         \geofence_Y_reg[0][8] , \geofence_Y_reg[0][7] ,
         \geofence_Y_reg[0][6] , \geofence_Y_reg[0][5] ,
         \geofence_Y_reg[0][4] , \geofence_Y_reg[0][3] ,
         \geofence_Y_reg[0][2] , \geofence_Y_reg[0][1] ,
         \geofence_Y_reg[0][0] , \geofence_Y_reg[1][9] ,
         \geofence_Y_reg[1][8] , \geofence_Y_reg[1][7] ,
         \geofence_Y_reg[1][6] , \geofence_Y_reg[1][5] ,
         \geofence_Y_reg[1][4] , \geofence_Y_reg[1][3] ,
         \geofence_Y_reg[1][2] , \geofence_Y_reg[1][1] ,
         \geofence_Y_reg[1][0] , \geofence_R_reg[0][10] ,
         \geofence_R_reg[0][9] , \geofence_R_reg[0][8] ,
         \geofence_R_reg[0][7] , \geofence_R_reg[0][6] ,
         \geofence_R_reg[0][5] , \geofence_R_reg[0][4] ,
         \geofence_R_reg[0][3] , \geofence_R_reg[0][2] ,
         \geofence_R_reg[0][1] , \geofence_R_reg[0][0] ,
         \geofence_R_reg[1][10] , \geofence_R_reg[1][9] ,
         \geofence_R_reg[1][8] , \geofence_R_reg[1][7] ,
         \geofence_R_reg[1][6] , \geofence_R_reg[1][5] ,
         \geofence_R_reg[1][4] , \geofence_R_reg[1][3] ,
         \geofence_R_reg[1][2] , \geofence_R_reg[1][1] ,
         \geofence_R_reg[1][0] , N2092, N2093, N2094, N2095, N2096, N2097,
         N2098, N2099, N2100, N2101, N2102, N2103, N2104, N2105, N2106, N2107,
         N2108, N2109, N2110, N2111, N2112, N2113, N2117, N2118, N2119, N2120,
         N2121, N2122, N2123, N2124, N2125, N2126, N2127, N2128, N2129, N2130,
         N2131, N2132, N2133, N2134, N2135, N2136, N2149, N2150, N2151, N2152,
         N2153, N2154, N2155, N2156, N2157, N2158, N2159, N2160, N2161, N2162,
         N2163, N2164, N2165, N2166, N2167, N2168, N2219, N2220, N2221, N2222,
         N2223, N2224, N2225, N2226, N2227, N2228, N2229, N2230, N2231, N2232,
         N2233, N2234, N2235, N2236, N2237, N2238, N2239, N2252, N2253, N2254,
         N2255, N2256, N2257, N2258, N2259, N2260, N2261, N2262, N2263, N2264,
         N2265, N2266, N2267, N2268, N2269, N2270, N2271, N2272, N2273, N2274,
         N2275, N2276, N2277, N2278, N2279, N2280, N2281, N2282, N2283, N2284,
         N2285, N2286, N2290, N2291, N2292, N2293, N2294, N2295, N2296, N2297,
         N2298, N2299, N2300, N2301, N2302, N2303, N2304, N2305, N2306, N2307,
         N2308, N2309, N2310, N2311, N2312, N2313, N2352, N2353, N2354, N2355,
         N2356, N2357, N2358, N2359, N2360, N2361, N2362, N2363, N2364, N2365,
         N2366, N2367, N2368, N2369, N2370, N2371, N2372, N2373, N2374, N2375,
         N2376, N2379, N2381, N2440, N2441, N2442, N2443, N2444, N2445, N2446,
         N2447, N2448, N2449, N2450, N2451, N2452, N2453, N2454, N2455, N2456,
         N2457, N2458, N2459, N2460, N2461, N2462, N2466, N2467, N2468, N2469,
         N2470, N2471, N2472, N2473, N2474, N2475, N2476, N2477, N2478, N2479,
         N2480, N2481, N2482, N2483, N2484, N2485, N2486, N2487, N2488, N2489,
         N2490, N2491, N2492, N2493, N2494, N2495, N2496, N2497, N2498, N2499,
         N2500, N2501, N2502, N2503, N2504, N2505, N2506, N2507, N2508, N2509,
         N2510, N2511, n106, n153, n154, n155, n157, n179, n203, n235, n237,
         n333, n336, n338, n340, n342, n344, n346, n348, n350, n352, n354,
         n356, n359, n360, n361, n362, n363, n365, n366, n367, n368, n370,
         n372, n374, n376, n378, n380, n382, n384, n386, n388, n392, n393,
         n394, n395, n396, n399, n402, n405, n408, n411, n414, n417, n420,
         n423, n426, n429, n430, n432, n433, n434, n435, n436, n438, n444,
         n460, n556, n559, n560, n734, n735, n736, n737, n738, n739, n740,
         n741, n742, n743, n744, n745, n746, n747, n748, n749, n750, n751,
         n752, n753, n754, n755, n756, n757, n758, n759, n760, n761, n762,
         n763, n764, n766, n767, n768, n769, n770, n771, n772, n797, n798,
         n799, n800, n801, n802, n803, n804, n805, n806, n807, n808, n809,
         n810, n811, n812, n813, n814, n815, n816, n817, n818, n819, n820,
         n821, n822, n823, n824, n825, n826, n827, n828, n829, n830, n831,
         n832, n833, n834, n835, n836, n837, n838, n839, n840, n841, n842,
         n843, n844, n845, n846, n847, n848, n849, n850, n851, n852, n853,
         n854, n855, n856, n857, n858, n859, n860, n861, n862, n863, n864,
         n865, n866, n867, n868, n869, n870, n871, n872, n873, n874, n875,
         n876, n877, n878, n879, n880, n881, n882, n883, n884, n885, n886,
         n887, n888, n889, n890, n891, n892, n893, n894, n895, n896, n897,
         n898, n899, n900, n901, n902, n903, n904, n905, n906, n907, n908,
         n909, n910, n911, n912, n913, n914, n915, n916, n917, n918, n919,
         n920, n921, n922, n923, n924, n925, n926, n927, n928, n929, n930,
         n931, n932, n933, n934, n935, n936, n937, n938, n939, n940, n941,
         n942, n943, n944, n945, n946, n947, n948, n949, n950, n951, n952,
         n953, n954, n955, n956, n957, n958, n959, n960, n961, n962, n963,
         n964, n965, n966, n967, n968, n969, n970, n971, n972, n973, n974,
         n975, n976, n977, n978, n979, n980, n981, n982, n983, n984, n985,
         n986, n987, n988, n989, n990, n991, n992, n993, n994, n995, n996,
         n997, n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006,
         n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016,
         n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026,
         n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036,
         n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046,
         n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056,
         n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066,
         n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076,
         n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086,
         n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096,
         n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106,
         n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116,
         n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126,
         n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136,
         n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146,
         n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156,
         n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166,
         n1167, n1168, n1169, n1170, n1171, n1172, N2351, N2350, N2349, N2348,
         N2347, N2346, N2345, N2344, N2343, N2342, N2341, N2340, N2339, N2338,
         N2337, N2336, N2335, N2334, N2333, N2332, N2331, N2330, N2329, N2328,
         N2327, N2326, N2218, N2217, N2216, N2215, N2214, N2213, N2212, N2211,
         N2210, N2209, N2208, N2207, N2206, N2205, N2204, N2203, N2202, N2201,
         N2199, N2198, N2197, N2196, N2195, N2194, N2193, N2192, N2191, N2190,
         N2189, N2188, N2187, N2186, N2185, N2184, N2183, N2182, N2181, N2179,
         N1808, N1807, N1806, N1805, N1804, N1803, N1802, N1801, N1800, N1799,
         N1798, N1797, N1796, N1795, N1794, N1793, N1792, N1791, N1790, N1789,
         N1788, N1787, N1786, N1785, N1784, N1783, N1782, N1781, N1780, N1779,
         N1778, N1777, N1776, N1775, N1774, N1773, N1772, N1771, N1770, N1769,
         N1768, N1767, N1766, N1765, N1764, N1763, \gt_699/A[11] ,
         \gt_699/A[10] , \gt_699/A[9] , \gt_699/A[8] , \gt_699/A[7] ,
         \gt_699/A[6] , \gt_699/A[5] , \gt_699/A[4] , \gt_699/A[3] ,
         \gt_699/A[2] , \gt_699/A[1] , \gt_699/A[0] , n1173, n1174, n1175,
         n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184, n1185,
         n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194, n1195,
         n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204, n1205,
         n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214, n1215,
         n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312, n1313, n1314,
         n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322, n1323, n1324,
         n1325, n1326, n1327, n1328, n1329, n1330, n1331, n1332, n1333, n1334,
         n1335, n1336, n1337, n1338, n1339, n1340, n1341, n1342, n1343, n1344,
         n1345, n1346, n1347, n1348, n1349, n1350, n1351, n1352, n1353, n1354,
         n1355, n1356, n1357, n1358, n1359, n1360, n1361, n1362, n1363, n1364,
         n1365, n1366, n1367, n1368, n1369, n1370, n1371, n1372, n1373, n1374,
         n1375, n1376, n1377, n1378, n1379, n1380, n1381, n1382, n1383, n1384,
         n1385, n1386, n1387, n1388, n1389, n1390, n1391, n1392, n1393, n1394,
         n1395, n1396, n1397, n1398, n1399, n1400, n1401, n1402, n1403, n1404,
         n1405, n1406, n1407, n1408, n1409, n1410, n1411, n1412, n1413, n1414,
         n1415, n1416, n1417, n1418, n1419, n1420, n1421, n1422, n1423, n1424,
         n1425, n1426, n1427, n1428, n1429, n1430, n1431, n1432, n1433, n1434,
         n1435, n1436, n1437, n1438, n1439, n1440, n1441, n1442, n1443, n1444,
         n1445, n1446, n1447, n1448, n1449, n1450, n1451, n1452, n1453, n1454,
         n1455, n1456, n1457, n1458, n1459, n1460, n1461, n1462, n1463, n1464,
         n1465, n1466, n1467, n1468, n1469, n1470, n1471, n1472, n1473, n1474,
         n1475, n1476, n1477, n1478, n1479, n1480, n1481, n1482, n1483, n1484,
         n1485, n1486, n1487, n1488, n1489, n1490, n1491, n1492, n1493, n1494,
         n1495, n1496, n1497, n1498, n1499, n1500, n1501, n1502, n1503, n1504,
         n1505, n1506, n1507, n1508, n1509, n1510, n1511, n1512, n1513, n1514,
         n1515, n1516, n1517, n1518, n1519, n1520, n1521, n1522, n1523, n1524,
         n1525, n1526, n1527, n1528, n1529, n1530, n1531, n1532, n1533, n1534,
         n1535, n1536, n1537, n1538, n1539, n1540, n1541, n1542, n1543, n1544,
         n1545, n1546, n1547, n1548, n1549, n1550, n1551, n1552, n1553, n1554,
         n1555, n1556, n1557, n1558, n1559, n1560, n1561, n1562, n1563, n1564,
         n1565, n1566, n1567, n1568, n1569, n1570, n1571, n1572, n1573, n1574,
         n1575, n1576, n1577, n1578, n1579, n1580, n1581, n1582, n1583, n1584,
         n1585, n1586, n1587, n1588, n1589, n1590, n1591, n1592, n1593, n1594,
         n1595, n1596, n1597, n1598, n1599, n1600, n1601, n1602, n1603, n1604,
         n1605, n1606, n1607, n1608, n1609, n1610, n1611, n1612, n1613, n1614,
         n1615, n1616, n1617, n1618, n1619, n1620, n1621, n1622, n1623, n1624,
         n1625, n1626, n1627, n1628, n1629, n1630, n1631, n1632, n1633, n1634,
         n1635, n1636, n1637, n1638, n1639, n1640, n1641, n1642, n1643, n1644,
         n1645, n1646, n1647, n1648, n1649, n1650, n1651, n1652, n1653, n1654,
         n1655, n1656, n1657, n1658, n1659, n1660, n1661, n1662, n1663, n1664,
         n1665, n1666, n1667, n1668, n1669, n1670, n1671, n1672, n1673, n1674,
         n1675, n1676, n1677, n1678, n1679, n1680, n1681, n1682, n1683, n1684,
         n1685, n1686, n1687, n1688, n1689, n1690, n1691, n1692, n1693, n1694,
         n1695, n1696, n1697, n1698, n1699, n1700, n1701, n1702, n1703, n1704,
         n1705, n1706, n1707, n1708, n1709, n1710, n1711, n1712, n1713, n1714,
         n1715, n1716, n1717, n1718, n1719, n1720, n1721, n1722, n1723, n1724,
         n1725, n1726, n1727, n1728, n1729, n1730, n1731, n1732, n1733, n1734,
         n1735, n1736, n1737, n1738, n1739, n1740, n1741, n1742, n1743, n1744,
         n1745, n1746, n1747, n1748, n1749, n1750, n1751, n1752, n1753, n1754,
         n1755, n1756, n1757, n1758, n1759, n1760, n1761, n1762, n1763, n1764,
         n1765, n1766, n1767, n1768, n1769, n1770, n1771, n1772, n1773, n1774,
         n1775, n1776, n1777, n1778, n1779, n1780, n1781, n1782, n1783, n1784,
         n1785, n1786, n1787, n1788, n1789, n1790, n1791, n1792, n1793, n1794,
         n1795, n1796, n1797, n1798, n1799, n1800, n1801, n1802, n1803, n1804,
         n1805, n1806, n1807, n1808, n1809, n1810, n1811, n1812, n1813, n1814,
         n1815, n1816, n1817, n1818, n1819, n1820, n1821, n1822, n1823, n1824,
         n1825, n1826, n1827, n1828, n1829, n1830, n1831, n1832, n1833, n1834,
         n1835, n1836, n1837, n1838, n1839, n1840, n1841, n1842, n1843, n1844,
         n1845, n1846, n1847, n1848, n1849, n1850, n1851, n1852, n1853, n1854,
         n1855, n1856, n1857, n1858, n1859, n1860, n1861, n1862, n1863, n1864,
         n1865, n1866, n1867, n1868, n1869, n1870, n1871, n1872, n1873, n1874,
         n1875, n1876, n1877, n1878, n1879, n1880, n1881, n1882, n1883, n1884,
         n1885, n1886, n1887, n1888, n1889, n1890, n1891, n1892, n1893, n1894,
         n1895, n1896, n1897, n1898, n1899, n1900, n1901, n1902, n1903, n1904,
         n1905, n1906, n1907, n1908, n1909, n1910, n1911, n1912, n1913, n1914,
         n1915, n1916, n1917, n1918, n1919, n1920, n1921, n1922, n1923, n1924,
         n1925, n1926, n1927, n1928, n1929, n1930, n1931, n1932, n1933, n1934,
         n1935, n1936, n1937, n1938, n1939, n1940, n1941, n1942, n1943, n1944,
         n1945, n1946, n1947, n1948, n1949, n1950, n1951, n1952, n1953, n1954,
         n1955, n1956, n1957, n1958, n1959, n1960, n1961, n1962, n1963, n1964,
         n1965, n1966, n1967, n1968, n1969, n1970, n1971, n1972, n1973, n1974,
         n1975, n1976, n1977, n1978, n1979, n1980, n1981, n1982, n1983, n1984,
         n1985, n1986, n1987, n1988, n1989, n1990, n1991, n1992, n1993, n1994,
         n1995, n1996, n1997, n1998, n1999, n2000, n2001, n2002, n2003, n2004,
         n2005, n2006, n2007, n2008, n2009, n2010, n2011, n2012, n2013, n2014,
         n2015, n2016, n2017, n2018, n2019, n2020, n2021, n2022, n2023, n2024,
         n2025, n2026, n2027, n2028, n2029, n2030, n2031, n2033, n2034, n2035,
         n2036, n2037, n2038, n2039, n2040, n2041, n2042, n2043, n2044, n2045,
         n2046, n2047, n2048, n2049, n2050, n2051, n2052, n2053, n2054, n2055,
         n2056, n2057, n2058, n2059, n2060, n2061, n2062, n2063, n2064, n2065,
         n2066, n2067, n2068, n2069, n2070, n2071, n2072, n2073, n2074, n2075,
         n2076, n2077, n2078, n2079, n2080, n2081, n2082, n2083, n2084, n2085,
         n2086, n2087, n2088, n2089, n2090, n2091, n2092, n2093, n2094, n2095,
         n2096, n2097, n2098, n2099, n2100, n2101, n2102, n2103, n2104, n2105,
         n2106, n2107, n2108, n2109, n2110, n2111, n2112, n2113, n2114, n2115,
         n2116, n2117, n2118, n2123, n2124, n2125, n2126, n2127, n2128, n2129,
         n2130, n2131, n2132, n2133, n2134;
  wire   [2:0] state;
  wire   [2:0] store_counter;
  wire   [11:0] F;
  wire   [11:0] G;
  wire   [11:0] H;
  wire   [11:0] I;
  wire   [9:0] X_REG;
  wire   [9:0] Y_REG;
  wire   [20:0] side_length_before;
  wire   [11:0] side_length_after;
  wire   [22:0] area_sqrt1_before;
  wire   [11:0] area_sqrt1_after;
  wire   [22:0] area_sqrt2_before;
  wire   [11:0] area_sqrt2_after;
  wire   [11:0] E;
  wire   [11:0] A;
  wire   [11:0] B;
  wire   [11:0] C;
  wire   [11:0] D;
  wire   [22:0] area_reg;
  wire   [22:0] area;
  wire   [21:0] area_6_reg;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31, 
        SYNOPSYS_UNCONNECTED__32;

  geofence_DW01_sub_0 sub_761 ( .A(area), .B({n1209, n1209, area_6_reg[20:0]}), 
        .CI(1'b0), .DIFF({N2511, N2510, N2509, N2508, N2507, N2506, N2505, 
        N2504, N2503, N2502, N2501, N2500, N2499, N2498, N2497, N2496, N2495, 
        N2494, N2493, N2492, N2491, N2490, N2489}) );
  geofence_DW01_sub_1 sub_702 ( .A({1'b0, side_length_after[10:0]}), .B({n1434, 
        n1202, n1433, \gt_699/A[8] , \gt_699/A[7] , \gt_699/A[6] , n1432, 
        \gt_699/A[4] , n1431, \gt_699/A[2] , n1430, \gt_699/A[0] }), .CI(1'b0), 
        .DIFF({N2313, N2312, N2311, N2310, N2309, N2308, N2307, N2306, N2305, 
        N2304, N2303, N2302}) );
  geofence_DW01_sub_2 sub_700 ( .A({n1434, n1202, n1433, \gt_699/A[8] , 
        \gt_699/A[7] , \gt_699/A[6] , n1432, \gt_699/A[4] , n1431, 
        \gt_699/A[2] , n1430, \gt_699/A[0] }), .B({1'b0, 
        side_length_after[10:0]}), .CI(1'b0), .DIFF({N2301, N2300, N2299, 
        N2298, N2297, N2296, N2295, N2294, N2293, N2292, N2291, N2290}) );
  geofence_DW01_sub_3 sub_488 ( .A({1'b0, N1931, N1932, N1933, N1934, N1935, 
        N1936, N1937, N1938, N1939, N1940}), .B({1'b0, \geofence_Y[1][9] , 
        \geofence_Y[1][8] , \geofence_Y[1][7] , \geofence_Y[1][6] , 
        \geofence_Y[1][5] , \geofence_Y[1][4] , \geofence_Y[1][3] , 
        \geofence_Y[1][2] , \geofence_Y[1][1] , \geofence_Y[1][0] }), .CI(1'b0), .DIFF({N1951, N1950, N1949, N1948, N1947, N1946, N1945, N1944, N1943, N1942, 
        N1941}) );
  geofence_DW01_sub_4 sub_487 ( .A({1'b0, N1901, N1902, N1903, N1904, N1905, 
        N1906, N1907, N1908, N1909, N1910}), .B({1'b0, \geofence_X[1][9] , 
        \geofence_X[1][8] , \geofence_X[1][7] , \geofence_X[1][6] , 
        \geofence_X[1][5] , \geofence_X[1][4] , \geofence_X[1][3] , 
        \geofence_X[1][2] , \geofence_X[1][1] , \geofence_X[1][0] }), .CI(1'b0), .DIFF({N1921, N1920, N1919, N1918, N1917, N1916, N1915, N1914, N1913, N1912, 
        N1911}) );
  geofence_DW01_sub_5 sub_486 ( .A({1'b0, N1871, N1872, N1873, N1874, N1875, 
        N1876, N1877, N1878, N1879, N1880}), .B({1'b0, \geofence_Y[1][9] , 
        \geofence_Y[1][8] , \geofence_Y[1][7] , \geofence_Y[1][6] , 
        \geofence_Y[1][5] , \geofence_Y[1][4] , \geofence_Y[1][3] , 
        \geofence_Y[1][2] , \geofence_Y[1][1] , \geofence_Y[1][0] }), .CI(1'b0), .DIFF({N1891, N1890, N1889, N1888, N1887, N1886, N1885, N1884, N1883, N1882, 
        N1881}) );
  geofence_DW01_sub_6 sub_485 ( .A({1'b0, N1841, N1842, N1843, N1844, N1845, 
        N1846, N1847, N1848, N1849, N1850}), .B({1'b0, \geofence_X[1][9] , 
        \geofence_X[1][8] , \geofence_X[1][7] , \geofence_X[1][6] , 
        \geofence_X[1][5] , \geofence_X[1][4] , \geofence_X[1][3] , 
        \geofence_X[1][2] , \geofence_X[1][1] , \geofence_X[1][0] }), .CI(1'b0), .DIFF({N1861, N1860, N1859, N1858, N1857, N1856, N1855, N1854, N1853, N1852, 
        N1851}) );
  geofence_DW01_add_3_DW01_add_5 add_1_root_add_0_root_add_687_2 ( .A({1'b0, 
        1'b0, \geofence_R_reg[0][10] , \geofence_R_reg[0][9] , 
        \geofence_R_reg[0][8] , \geofence_R_reg[0][7] , \geofence_R_reg[0][6] , 
        \geofence_R_reg[0][5] , \geofence_R_reg[0][4] , \geofence_R_reg[0][3] , 
        \geofence_R_reg[0][2] , \geofence_R_reg[0][1] , \geofence_R_reg[0][0] }), .B({1'b0, 1'b0, \geofence_R_reg[1][10] , \geofence_R_reg[1][9] , 
        \geofence_R_reg[1][8] , \geofence_R_reg[1][7] , \geofence_R_reg[1][6] , 
        \geofence_R_reg[1][5] , \geofence_R_reg[1][4] , \geofence_R_reg[1][3] , 
        \geofence_R_reg[1][2] , \geofence_R_reg[1][1] , \geofence_R_reg[1][0] }), .CI(1'b0), .SUM({SYNOPSYS_UNCONNECTED__0, n2134, n2133, n2132, n2131, n2130, 
        n2129, n2128, n2127, n2126, n2125, n2124, n2123}) );
  geofence_DW_mult_tc_1 mult_476 ( .a({n1211, n1211, F[9:0]}), .b({n1357, 
        n1357, G[9:0]}), .product({SYNOPSYS_UNCONNECTED__1, N1785, N1784, 
        N1783, N1782, N1781, N1780, N1779, N1778, N1777, N1776, N1775, N1774, 
        N1773, N1772, N1771, N1770, N1769, N1768, N1767, N1766, N1765, N1764, 
        N1763}) );
  geofence_DW_mult_tc_0 mult_476_2 ( .a({n1210, n1210, H[9:0]}), .b({n1358, 
        n1358, I[9:0]}), .product({SYNOPSYS_UNCONNECTED__2, N1808, N1807, 
        N1806, N1805, N1804, N1803, N1802, N1801, N1800, N1799, N1798, N1797, 
        N1796, N1795, N1794, N1793, N1792, N1791, N1790, N1789, N1788, N1787, 
        N1786}) );
  geofence_DW01_sub_11 sub_476 ( .A({N1785, N1784, N1783, N1782, N1781, N1780, 
        N1779, N1778, N1777, N1776, N1775, N1774, N1773, N1772, N1771, N1770, 
        N1769, N1768, N1767, N1766, N1765, N1764, N1763}), .B({N1808, N1807, 
        N1806, N1805, N1804, N1803, N1802, N1801, N1800, N1799, N1798, N1797, 
        N1796, N1795, N1794, N1793, N1792, N1791, N1790, N1789, N1788, N1787, 
        N1786}), .CI(1'b0), .DIFF({N1830, N1829, N1828, N1827, N1826, N1825, 
        N1824, N1823, N1822, N1821, N1820, N1819, N1818, N1817, N1816, N1815, 
        N1814, N1813, N1812, N1811, N1810, N1809, SYNOPSYS_UNCONNECTED__3}) );
  geofence_DW_sqrt_3 sqrt3 ( .a(area_sqrt2_before), .root(area_sqrt2_after) );
  geofence_DW_sqrt_4 sqrt1 ( .a({1'b0, 1'b0, n1366, side_length_before[19:0]}), 
        .root({SYNOPSYS_UNCONNECTED__4, side_length_after[10:0]}) );
  geofence_DW_mult_uns_7 mult_709 ( .a({N2338, N2338, N2338, N2338, N2338, 
        N2338, N2338, N2338, N2338, N2338, N2338, N2337, N2336, N2335, N2334, 
        N2333, N2332, N2331, N2330, N2329, N2328, N2327, N2326}), .b({N2351, 
        N2351, N2351, N2351, N2351, N2351, N2351, N2351, N2351, N2351, N2351, 
        N2350, N2349, N2348, N2347, N2346, N2345, N2344, N2343, N2342, N2341, 
        N2340, N2339}), .product({SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, N2374, N2373, 
        N2372, N2371, N2370, N2369, N2368, N2367, N2366, N2365, N2364, N2363, 
        N2362, N2361, N2360, N2359, N2358, N2357, N2356, N2355, N2354, N2353, 
        N2352}) );
  geofence_DW_mult_uns_6 mult_752 ( .a(area_sqrt1_after), .b(area_sqrt2_after), 
        .product({SYNOPSYS_UNCONNECTED__28, N2462, N2461, N2460, N2459, N2458, 
        N2457, N2456, N2455, N2454, N2453, N2452, N2451, N2450, N2449, N2448, 
        N2447, N2446, N2445, N2444, N2443, N2442, N2441, N2440}) );
  geofence_DW_mult_uns_5 mult_673_2 ( .a(Y_REG), .b(Y_REG), .product({N2218, 
        N2217, N2216, N2215, N2214, N2213, N2212, N2211, N2210, N2209, N2208, 
        N2207, N2206, N2205, N2204, N2203, N2202, N2201, 
        SYNOPSYS_UNCONNECTED__29, N2199}) );
  geofence_DW_mult_uns_8 mult_673 ( .a(X_REG), .b(X_REG), .product({N2198, 
        N2197, N2196, N2195, N2194, N2193, N2192, N2191, N2190, N2189, N2188, 
        N2187, N2186, N2185, N2184, N2183, N2182, N2181, 
        SYNOPSYS_UNCONNECTED__30, N2179}) );
  geofence_DW01_add_20 add_0_root_add_0_root_add_687_2 ( .A({1'b0, n2134, 
        n2133, n2132, n2131, n2130, n2129, n2128, n2127, n2126, n2125, n2124, 
        n2123}), .B({1'b0, 1'b0, side_length_after[10:0]}), .CI(1'b0), .SUM({
        N2263, N2262, N2261, N2260, N2259, N2258, N2257, N2256, N2255, N2254, 
        N2253, N2252, SYNOPSYS_UNCONNECTED__31}) );
  geofence_DW01_sub_15 sub_709_2 ( .A({1'b0, C}), .B({1'b0, D}), .CI(1'b0), 
        .DIFF({N2351, N2350, N2349, N2348, N2347, N2346, N2345, N2344, N2343, 
        N2342, N2341, N2340, N2339}) );
  geofence_DW01_sub_14 sub_709 ( .A({1'b0, A}), .B({1'b0, B}), .CI(1'b0), 
        .DIFF({N2338, N2337, N2336, N2335, N2334, N2333, N2332, N2331, N2330, 
        N2329, N2328, N2327, N2326}) );
  geofence_DW01_cmp6_2 r738 ( .A({1'b0, n1434, n1201, n1433, \gt_699/A[8] , 
        \gt_699/A[7] , \gt_699/A[6] , n1432, \gt_699/A[4] , n1431, 
        \gt_699/A[2] , n1430, \gt_699/A[0] }), .B({1'b0, 1'b0, 
        \geofence_R_reg[1][10] , \geofence_R_reg[1][9] , 
        \geofence_R_reg[1][8] , \geofence_R_reg[1][7] , \geofence_R_reg[1][6] , 
        \geofence_R_reg[1][5] , \geofence_R_reg[1][4] , \geofence_R_reg[1][3] , 
        \geofence_R_reg[1][2] , \geofence_R_reg[1][1] , \geofence_R_reg[1][0] }), .TC(1'b0), .LT(N2379), .GT(N2376) );
  geofence_DW01_cmp6_3 r737 ( .A({1'b0, n1434, n1202, n1433, \gt_699/A[8] , 
        \gt_699/A[7] , \gt_699/A[6] , n1432, \gt_699/A[4] , n1431, 
        \gt_699/A[2] , n1430, \gt_699/A[0] }), .B({1'b0, 1'b0, 
        \geofence_R_reg[0][10] , \geofence_R_reg[0][9] , 
        \geofence_R_reg[0][8] , \geofence_R_reg[0][7] , \geofence_R_reg[0][6] , 
        \geofence_R_reg[0][5] , \geofence_R_reg[0][4] , \geofence_R_reg[0][3] , 
        \geofence_R_reg[0][2] , \geofence_R_reg[0][1] , \geofence_R_reg[0][0] }), .TC(1'b0), .LT(N2381), .GT(N2375) );
  geofence_DW01_add_21 add_673 ( .A({1'b0, N2198, N2197, N2196, N2195, N2194, 
        N2193, N2192, N2191, N2190, N2189, N2188, N2187, N2186, N2185, N2184, 
        N2183, N2182, N2181, 1'b0, N2179}), .B({1'b0, N2218, N2217, N2216, 
        N2215, N2214, N2213, N2212, N2211, N2210, N2209, N2208, N2207, N2206, 
        N2205, N2204, N2203, N2202, N2201, 1'b0, N2199}), .CI(1'b0), .SUM({
        N2239, N2238, N2237, N2236, N2235, N2234, N2233, N2232, N2231, N2230, 
        N2229, N2228, N2227, N2226, N2225, N2224, N2223, N2222, N2221, N2220, 
        N2219}) );
  geofence_DW_sqrt_5 sqrt2 ( .a(area_sqrt1_before), .root(area_sqrt1_after) );
  geofence_DW_mult_uns_9 mult_693 ( .a({n1434, n1203, n1433, \gt_699/A[8] , 
        \gt_699/A[7] , \gt_699/A[6] , n1432, \gt_699/A[4] , n1431, 
        \gt_699/A[2] , n1430, \gt_699/A[0] }), .b(E), .product({
        SYNOPSYS_UNCONNECTED__32, N2286, N2285, N2284, N2283, N2282, N2281, 
        N2280, N2279, N2278, N2277, N2276, N2275, N2274, N2273, N2272, N2271, 
        N2270, N2269, N2268, N2267, N2266, N2265, N2264}) );
  geofence_DW01_add_31 add_759 ( .A(area), .B(area_reg), .CI(1'b0), .SUM({
        N2488, N2487, N2486, N2485, N2484, N2483, N2482, N2481, N2480, N2479, 
        N2478, N2477, N2476, N2475, N2474, N2473, N2472, N2471, N2470, N2469, 
        N2468, N2467, N2466}) );
  geofence_DW01_sub_17 sub_662 ( .A({\geofence_Y_reg[1][9] , 
        \geofence_Y_reg[1][8] , \geofence_Y_reg[1][7] , \geofence_Y_reg[1][6] , 
        \geofence_Y_reg[1][5] , \geofence_Y_reg[1][4] , \geofence_Y_reg[1][3] , 
        \geofence_Y_reg[1][2] , \geofence_Y_reg[1][1] , \geofence_Y_reg[1][0] }), .B({\geofence_Y_reg[0][9] , \geofence_Y_reg[0][8] , \geofence_Y_reg[0][7] , 
        \geofence_Y_reg[0][6] , \geofence_Y_reg[0][5] , \geofence_Y_reg[0][4] , 
        \geofence_Y_reg[0][3] , \geofence_Y_reg[0][2] , \geofence_Y_reg[0][1] , 
        \geofence_Y_reg[0][0] }), .CI(1'b0), .DIFF({N2168, N2167, N2166, N2165, 
        N2164, N2163, N2162, N2161, N2160, N2159}) );
  geofence_DW01_sub_19 sub_656 ( .A({\geofence_X_reg[1][9] , 
        \geofence_X_reg[1][8] , \geofence_X_reg[1][7] , \geofence_X_reg[1][6] , 
        \geofence_X_reg[1][5] , \geofence_X_reg[1][4] , \geofence_X_reg[1][3] , 
        \geofence_X_reg[1][2] , \geofence_X_reg[1][1] , \geofence_X_reg[1][0] }), .B({\geofence_X_reg[0][9] , \geofence_X_reg[0][8] , \geofence_X_reg[0][7] , 
        \geofence_X_reg[0][6] , \geofence_X_reg[0][5] , \geofence_X_reg[0][4] , 
        \geofence_X_reg[0][3] , \geofence_X_reg[0][2] , \geofence_X_reg[0][1] , 
        \geofence_X_reg[0][0] }), .CI(1'b0), .DIFF({N2136, N2135, N2134, N2133, 
        N2132, N2131, N2130, N2129, N2128, N2127}) );
  geofence_DW01_sub_16 sub_660 ( .A({\geofence_Y_reg[0][9] , 
        \geofence_Y_reg[0][8] , \geofence_Y_reg[0][7] , \geofence_Y_reg[0][6] , 
        \geofence_Y_reg[0][5] , \geofence_Y_reg[0][4] , \geofence_Y_reg[0][3] , 
        \geofence_Y_reg[0][2] , \geofence_Y_reg[0][1] , \geofence_Y_reg[0][0] }), .B({\geofence_Y_reg[1][9] , \geofence_Y_reg[1][8] , \geofence_Y_reg[1][7] , 
        \geofence_Y_reg[1][6] , \geofence_Y_reg[1][5] , \geofence_Y_reg[1][4] , 
        \geofence_Y_reg[1][3] , \geofence_Y_reg[1][2] , \geofence_Y_reg[1][1] , 
        \geofence_Y_reg[1][0] }), .CI(1'b0), .DIFF({N2158, N2157, N2156, N2155, 
        N2154, N2153, N2152, N2151, N2150, N2149}) );
  geofence_DW01_sub_18 sub_654 ( .A({\geofence_X_reg[0][9] , 
        \geofence_X_reg[0][8] , \geofence_X_reg[0][7] , \geofence_X_reg[0][6] , 
        \geofence_X_reg[0][5] , \geofence_X_reg[0][4] , \geofence_X_reg[0][3] , 
        \geofence_X_reg[0][2] , \geofence_X_reg[0][1] , \geofence_X_reg[0][0] }), .B({\geofence_X_reg[1][9] , \geofence_X_reg[1][8] , \geofence_X_reg[1][7] , 
        \geofence_X_reg[1][6] , \geofence_X_reg[1][5] , \geofence_X_reg[1][4] , 
        \geofence_X_reg[1][3] , \geofence_X_reg[1][2] , \geofence_X_reg[1][1] , 
        \geofence_X_reg[1][0] }), .CI(1'b0), .DIFF({N2126, N2125, N2124, N2123, 
        N2122, N2121, N2120, N2119, N2118, N2117}) );
  TLATXL \geofence_R_reg_reg[0][10]  ( .G(n1212), .D(N2113), .Q(
        \geofence_R_reg[0][10] ), .QN(n956) );
  TLATXL \geofence_R_reg_reg[0][9]  ( .G(n1212), .D(N2112), .Q(
        \geofence_R_reg[0][9] ), .QN(n957) );
  TLATXL \geofence_R_reg_reg[0][8]  ( .G(n1212), .D(N2111), .Q(
        \geofence_R_reg[0][8] ), .QN(n958) );
  TLATXL \geofence_R_reg_reg[0][7]  ( .G(n1212), .D(N2110), .Q(
        \geofence_R_reg[0][7] ), .QN(n959) );
  TLATXL \geofence_R_reg_reg[0][6]  ( .G(n1212), .D(N2109), .Q(
        \geofence_R_reg[0][6] ), .QN(n960) );
  TLATXL \geofence_R_reg_reg[0][5]  ( .G(n1212), .D(N2108), .Q(
        \geofence_R_reg[0][5] ), .QN(n961) );
  TLATXL \geofence_R_reg_reg[0][4]  ( .G(n1212), .D(N2107), .Q(
        \geofence_R_reg[0][4] ), .QN(n962) );
  TLATXL \geofence_R_reg_reg[0][3]  ( .G(n1212), .D(N2106), .Q(
        \geofence_R_reg[0][3] ), .QN(n963) );
  TLATXL \geofence_R_reg_reg[0][2]  ( .G(n1212), .D(N2105), .Q(
        \geofence_R_reg[0][2] ), .QN(n964) );
  TLATXL \geofence_R_reg_reg[0][1]  ( .G(n1212), .D(N2104), .Q(
        \geofence_R_reg[0][1] ), .QN(n965) );
  TLATXL \geofence_R_reg_reg[0][0]  ( .G(n1212), .D(N2103), .Q(
        \geofence_R_reg[0][0] ), .QN(n966) );
  DFFRX1 \store_counter_reg[2]  ( .D(n1164), .CK(clk), .RN(n2034), .Q(
        store_counter[2]), .QN(n1205) );
  DFFRX1 \store_counter2_reg[1]  ( .D(n771), .CK(clk), .RN(n2034), .Q(
        \store_counter2[1] ), .QN(n1208) );
  DFFRX1 \area_reg[9]_inst  ( .D(n2073), .CK(clk), .RN(n1429), .Q(area[9]) );
  DFFRX1 \area_reg[4]_inst  ( .D(n2078), .CK(clk), .RN(n1428), .Q(area[4]) );
  DFFRX1 \area_reg[3]_inst  ( .D(n2079), .CK(clk), .RN(n1428), .Q(area[3]) );
  DFFRX1 \area_reg[2]_inst  ( .D(n2080), .CK(clk), .RN(n1428), .Q(area[2]) );
  DFFRX1 \area_reg[0]_inst  ( .D(n2082), .CK(clk), .RN(n1428), .Q(area[0]) );
  TLATXL \geofence_R_reg_reg[1][7]  ( .G(n1212), .D(N2099), .Q(
        \geofence_R_reg[1][7] ), .QN(n970) );
  TLATXL \geofence_R_reg_reg[1][0]  ( .G(n1212), .D(N2092), .Q(
        \geofence_R_reg[1][0] ), .QN(n977) );
  TLATXL \geofence_R_reg_reg[1][4]  ( .G(n1212), .D(N2096), .Q(
        \geofence_R_reg[1][4] ), .QN(n973) );
  TLATXL \geofence_R_reg_reg[1][1]  ( .G(n1212), .D(N2093), .Q(
        \geofence_R_reg[1][1] ), .QN(n976) );
  TLATXL \geofence_R_reg_reg[1][2]  ( .G(n1212), .D(N2094), .Q(
        \geofence_R_reg[1][2] ), .QN(n975) );
  TLATXL \geofence_R_reg_reg[1][5]  ( .G(n1212), .D(N2097), .Q(
        \geofence_R_reg[1][5] ), .QN(n972) );
  TLATXL \geofence_R_reg_reg[1][10]  ( .G(n1212), .D(N2102), .Q(
        \geofence_R_reg[1][10] ), .QN(n967) );
  TLATXL \geofence_R_reg_reg[1][3]  ( .G(n1212), .D(N2095), .Q(
        \geofence_R_reg[1][3] ), .QN(n974) );
  TLATXL \geofence_R_reg_reg[1][6]  ( .G(n1212), .D(N2098), .Q(
        \geofence_R_reg[1][6] ), .QN(n971) );
  TLATXL \geofence_R_reg_reg[1][8]  ( .G(n1212), .D(N2100), .Q(
        \geofence_R_reg[1][8] ), .QN(n969) );
  TLATXL \geofence_R_reg_reg[1][9]  ( .G(n1212), .D(N2101), .Q(
        \geofence_R_reg[1][9] ), .QN(n968) );
  DFFRX1 \area_reg[12]_inst  ( .D(n2070), .CK(clk), .RN(n1429), .Q(area[12])
         );
  DFFRX1 \area_reg[11]_inst  ( .D(n2071), .CK(clk), .RN(n1429), .Q(area[11])
         );
  DFFRX1 \area_reg[10]_inst  ( .D(n2072), .CK(clk), .RN(n1429), .Q(area[10])
         );
  DFFRX1 \area_reg[8]_inst  ( .D(n2074), .CK(clk), .RN(n1428), .Q(area[8]) );
  DFFRX1 \area_reg[6]_inst  ( .D(n2076), .CK(clk), .RN(n1428), .Q(area[6]) );
  DFFRX1 \area_reg[7]_inst  ( .D(n2075), .CK(clk), .RN(n1428), .Q(area[7]) );
  DFFRX1 \area_reg[5]_inst  ( .D(n2077), .CK(clk), .RN(n1428), .Q(area[5]) );
  DFFRX1 \area_reg[17]_inst  ( .D(n2065), .CK(clk), .RN(n1215), .Q(area[17])
         );
  DFFRX1 \area_reg[15]_inst  ( .D(n2067), .CK(clk), .RN(n1214), .Q(area[15])
         );
  DFFRX1 \area_reg[19]_inst  ( .D(n2063), .CK(clk), .RN(n1215), .Q(area[19])
         );
  DFFRX1 \area_reg[13]_inst  ( .D(n2069), .CK(clk), .RN(n1214), .Q(area[13])
         );
  DFFRX1 \area_reg[14]_inst  ( .D(n2068), .CK(clk), .RN(n1215), .Q(area[14])
         );
  DFFRX1 \area_reg[21]_inst  ( .D(n2061), .CK(clk), .RN(n1214), .Q(area[21])
         );
  DFFRX1 \area_reg[16]_inst  ( .D(n2066), .CK(clk), .RN(n1215), .Q(area[16])
         );
  DFFRX1 \area_reg[20]_inst  ( .D(n2062), .CK(clk), .RN(n1214), .Q(area[20])
         );
  DFFRX1 \area_reg[18]_inst  ( .D(n2064), .CK(clk), .RN(n1215), .Q(area[18])
         );
  DFFSX1 \store_counter_reg[0]  ( .D(n1166), .CK(clk), .SN(n1214), .Q(
        store_counter[0]), .QN(n1493) );
  DFFRX4 \state_reg[2]  ( .D(n1170), .CK(clk), .RN(n1214), .Q(state[2]), .QN(
        n1461) );
  DFFRX4 \state_reg[0]  ( .D(n1169), .CK(clk), .RN(n1215), .Q(n768), .QN(n1475) );
  DFFRX4 \state_reg[1]  ( .D(n1168), .CK(clk), .RN(n1214), .Q(state[1]), .QN(
        n1471) );
  DFFRX1 \geofence_X_reg[1][9]_inst  ( .D(n1038), .CK(clk), .RN(n1214), .Q(
        \geofence_X[1][9] ), .QN(n856) );
  DFFRX1 \geofence_Y_reg[1][1]_inst  ( .D(n986), .CK(clk), .RN(n1215), .Q(
        \geofence_Y[1][1] ), .QN(n914) );
  DFFRX1 \geofence_Y_reg[1][2]_inst  ( .D(n985), .CK(clk), .RN(n1214), .Q(
        \geofence_Y[1][2] ), .QN(n913) );
  DFFRX1 \geofence_X_reg[1][7]_inst  ( .D(n1040), .CK(clk), .RN(n1215), .Q(
        \geofence_X[1][7] ), .QN(n858) );
  DFFRX1 \geofence_X_reg[1][6]_inst  ( .D(n1041), .CK(clk), .RN(n1214), .Q(
        \geofence_X[1][6] ), .QN(n859) );
  DFFRX1 \geofence_X_reg[1][4]_inst  ( .D(n1043), .CK(clk), .RN(n1215), .Q(
        \geofence_X[1][4] ), .QN(n861) );
  DFFRX1 \geofence_X_reg[1][2]_inst  ( .D(n1045), .CK(clk), .RN(n1214), .Q(
        \geofence_X[1][2] ), .QN(n863) );
  DFFSRX2 \caculate_counter_reg[1]  ( .D(n1167), .CK(clk), .SN(1'b1), .RN(
        n1215), .Q(n1647), .QN(n799) );
  DFFSRX2 \geofence_X_reg[4][6]  ( .D(n1071), .CK(clk), .SN(1'b1), .RN(n1215), 
        .QN(n879) );
  DFFSRX2 \geofence_Y_reg[4][1]  ( .D(n1016), .CK(clk), .SN(1'b1), .RN(n1214), 
        .QN(n934) );
  DFFSRX2 \geofence_X_reg[4][5]  ( .D(n1072), .CK(clk), .SN(1'b1), .RN(n1215), 
        .QN(n880) );
  DFFSRX2 \geofence_X_reg[4][4]  ( .D(n1073), .CK(clk), .SN(1'b1), .RN(n1214), 
        .QN(n881) );
  DFFSRX2 \geofence_X_reg[4][2]  ( .D(n1075), .CK(clk), .SN(1'b1), .RN(n1215), 
        .QN(n883) );
  DFFSRX2 \geofence_Y_reg[4][8]  ( .D(n1009), .CK(clk), .SN(1'b1), .RN(n1214), 
        .QN(n927) );
  DFFSRX2 \geofence_Y_reg[4][2]  ( .D(n1015), .CK(clk), .SN(1'b1), .RN(n1215), 
        .QN(n933) );
  DFFSRX2 \geofence_X_reg[4][0]  ( .D(n1077), .CK(clk), .SN(1'b1), .RN(n1214), 
        .QN(n885) );
  DFFRX1 \store_counter2_reg[0]  ( .D(n772), .CK(clk), .RN(n1215), .Q(n2031), 
        .QN(n797) );
  DFFRX1 \build_counter_reg[0]  ( .D(n770), .CK(clk), .RN(n1214), .Q(n2096), 
        .QN(n767) );
  DFFRX1 \build_counter_reg[1]  ( .D(n769), .CK(clk), .RN(n1215), .Q(n2030), 
        .QN(n766) );
  DFFRX1 \geofence_R_reg[3][6]  ( .D(n1124), .CK(clk), .RN(n1214), .Q(n2106), 
        .QN(n816) );
  DFFRX1 \geofence_R_reg[3][4]  ( .D(n1126), .CK(clk), .RN(n1215), .Q(n2110), 
        .QN(n818) );
  DFFRX1 \geofence_R_reg[3][3]  ( .D(n1127), .CK(clk), .RN(n1214), .Q(n2112), 
        .QN(n819) );
  DFFRX1 \geofence_R_reg[3][1]  ( .D(n1129), .CK(clk), .RN(n1215), .Q(n2116), 
        .QN(n821) );
  DFFRX1 \geofence_R_reg[3][0]  ( .D(n1130), .CK(clk), .RN(n1214), .Q(n2118), 
        .QN(n822) );
  DFFRX1 \geofence_R_reg[3][10]  ( .D(n1120), .CK(clk), .RN(n1215), .Q(n2098), 
        .QN(n812) );
  DFFRX1 \geofence_R_reg[3][9]  ( .D(n1121), .CK(clk), .RN(n1214), .Q(n2100), 
        .QN(n813) );
  DFFRX1 \geofence_R_reg[3][8]  ( .D(n1122), .CK(clk), .RN(n1215), .Q(n2102), 
        .QN(n814) );
  DFFRX1 \geofence_R_reg[3][7]  ( .D(n1123), .CK(clk), .RN(n1214), .Q(n2104), 
        .QN(n815) );
  DFFRX1 \geofence_R_reg[3][5]  ( .D(n1125), .CK(clk), .RN(n1215), .Q(n2108), 
        .QN(n817) );
  DFFRX1 \geofence_R_reg[3][2]  ( .D(n1128), .CK(clk), .RN(n1214), .Q(n2114), 
        .QN(n820) );
  DFFRX1 \geofence_R_reg[1][10]_inst  ( .D(n1098), .CK(clk), .RN(n1215), .Q(
        n1822), .QN(n744) );
  DFFRX1 \geofence_R_reg[1][9]_inst  ( .D(n1099), .CK(clk), .RN(n1214), .Q(
        n1824), .QN(n743) );
  DFFRX1 \geofence_R_reg[1][8]_inst  ( .D(n1100), .CK(clk), .RN(n1215), .Q(
        n1826), .QN(n742) );
  DFFRX1 \geofence_R_reg[1][7]_inst  ( .D(n1101), .CK(clk), .RN(n1214), .Q(
        n1828), .QN(n741) );
  DFFRX1 \geofence_R_reg[1][6]_inst  ( .D(n1102), .CK(clk), .RN(n1215), .Q(
        n1830), .QN(n740) );
  DFFRX1 \geofence_R_reg[1][5]_inst  ( .D(n1103), .CK(clk), .RN(n1214), .Q(
        n1832), .QN(n739) );
  DFFRX1 \geofence_R_reg[1][4]_inst  ( .D(n1104), .CK(clk), .RN(n1215), .Q(
        n1834), .QN(n738) );
  DFFRX1 \geofence_R_reg[1][3]_inst  ( .D(n1105), .CK(clk), .RN(n1214), .Q(
        n1836), .QN(n737) );
  DFFRX1 \geofence_R_reg[1][2]_inst  ( .D(n1106), .CK(clk), .RN(n1215), .Q(
        n1838), .QN(n736) );
  DFFRX1 \geofence_R_reg[1][1]_inst  ( .D(n1107), .CK(clk), .RN(n1214), .Q(
        n1840), .QN(n735) );
  DFFRX1 \geofence_R_reg[1][0]_inst  ( .D(n1108), .CK(clk), .RN(n1215), .Q(
        n1842), .QN(n734) );
  DFFRX1 \geofence_Y_reg[2][3]  ( .D(n994), .CK(clk), .RN(n1214), .Q(n1777), 
        .QN(n758) );
  DFFRX1 \geofence_X_reg[2][3]  ( .D(n1054), .CK(clk), .RN(n1215), .Q(n1578), 
        .QN(n748) );
  DFFRX1 \geofence_X_reg[2][1]  ( .D(n1056), .CK(clk), .RN(n1214), .Q(n1586), 
        .QN(n746) );
  DFFRX1 \geofence_X_reg[2][0]  ( .D(n1057), .CK(clk), .RN(n1215), .Q(n1590), 
        .QN(n745) );
  DFFRX1 \geofence_Y_reg[2][0]  ( .D(n997), .CK(clk), .RN(n1214), .Q(n1793), 
        .QN(n755) );
  DFFRX1 \geofence_R_reg[2][10]  ( .D(n1109), .CK(clk), .RN(n1215), .Q(n1847), 
        .QN(n801) );
  DFFRX1 \geofence_R_reg[2][9]  ( .D(n1110), .CK(clk), .RN(n1214), .Q(n1849), 
        .QN(n802) );
  DFFRX1 \geofence_R_reg[2][8]  ( .D(n1111), .CK(clk), .RN(n1215), .Q(n1851), 
        .QN(n803) );
  DFFRX1 \geofence_R_reg[2][7]  ( .D(n1112), .CK(clk), .RN(n1214), .Q(n1853), 
        .QN(n804) );
  DFFRX1 \geofence_R_reg[2][5]  ( .D(n1114), .CK(clk), .RN(n1215), .Q(n1857), 
        .QN(n806) );
  DFFRX1 \geofence_R_reg[2][3]  ( .D(n1116), .CK(clk), .RN(n1214), .Q(n1861), 
        .QN(n808) );
  DFFRX1 \geofence_R_reg[2][1]  ( .D(n1118), .CK(clk), .RN(n1215), .Q(n1865), 
        .QN(n810) );
  DFFRX1 \geofence_R_reg[2][6]  ( .D(n1113), .CK(clk), .RN(n1214), .Q(n1855), 
        .QN(n805) );
  DFFRX1 \geofence_R_reg[2][4]  ( .D(n1115), .CK(clk), .RN(n1215), .Q(n1859), 
        .QN(n807) );
  DFFRX1 \geofence_R_reg[2][2]  ( .D(n1117), .CK(clk), .RN(n1214), .Q(n1863), 
        .QN(n809) );
  DFFRX1 \geofence_R_reg[2][0]  ( .D(n1119), .CK(clk), .RN(n1215), .Q(n1867), 
        .QN(n811) );
  DFFRX1 \geofence_R_reg[5][10]  ( .D(n1142), .CK(clk), .RN(n1214), .Q(n2036), 
        .QN(n834) );
  DFFRX1 \geofence_R_reg[5][9]  ( .D(n1143), .CK(clk), .RN(n1215), .Q(n2038), 
        .QN(n835) );
  DFFRX1 \geofence_R_reg[5][8]  ( .D(n1144), .CK(clk), .RN(n1214), .Q(n2040), 
        .QN(n836) );
  DFFRX1 \geofence_R_reg[5][7]  ( .D(n1145), .CK(clk), .RN(n1215), .Q(n2042), 
        .QN(n837) );
  DFFRX1 \geofence_R_reg[5][6]  ( .D(n1146), .CK(clk), .RN(n1214), .Q(n2044), 
        .QN(n838) );
  DFFRX1 \geofence_R_reg[5][5]  ( .D(n1147), .CK(clk), .RN(n1215), .Q(n2046), 
        .QN(n839) );
  DFFRX1 \geofence_R_reg[5][4]  ( .D(n1148), .CK(clk), .RN(n1214), .Q(n2048), 
        .QN(n840) );
  DFFRX1 \geofence_R_reg[5][3]  ( .D(n1149), .CK(clk), .RN(n1215), .Q(n2050), 
        .QN(n841) );
  DFFRX1 \geofence_R_reg[5][2]  ( .D(n1150), .CK(clk), .RN(n1214), .Q(n2052), 
        .QN(n842) );
  DFFRX1 \geofence_R_reg[5][1]  ( .D(n1151), .CK(clk), .RN(n1215), .Q(n2054), 
        .QN(n843) );
  DFFRX1 \geofence_R_reg[5][0]  ( .D(n1152), .CK(clk), .RN(n1214), .Q(n2056), 
        .QN(n844) );
  DFFRX1 \geofence_R_reg[4][10]  ( .D(n1131), .CK(clk), .RN(n1215), .Q(n2097), 
        .QN(n823) );
  DFFRX1 \geofence_R_reg[4][9]  ( .D(n1132), .CK(clk), .RN(n1214), .Q(n2099), 
        .QN(n824) );
  DFFRX1 \geofence_R_reg[4][8]  ( .D(n1133), .CK(clk), .RN(n1215), .Q(n2101), 
        .QN(n825) );
  DFFRX1 \geofence_R_reg[4][7]  ( .D(n1134), .CK(clk), .RN(n1214), .Q(n2103), 
        .QN(n826) );
  DFFRX1 \geofence_R_reg[4][6]  ( .D(n1135), .CK(clk), .RN(n1215), .Q(n2105), 
        .QN(n827) );
  DFFRX1 \geofence_R_reg[4][5]  ( .D(n1136), .CK(clk), .RN(n1214), .Q(n2107), 
        .QN(n828) );
  DFFRX1 \geofence_R_reg[4][4]  ( .D(n1137), .CK(clk), .RN(n1215), .Q(n2109), 
        .QN(n829) );
  DFFRX1 \geofence_R_reg[4][3]  ( .D(n1138), .CK(clk), .RN(n1214), .Q(n2111), 
        .QN(n830) );
  DFFRX1 \geofence_R_reg[4][2]  ( .D(n1139), .CK(clk), .RN(n1215), .Q(n2113), 
        .QN(n831) );
  DFFRX1 \geofence_R_reg[4][1]  ( .D(n1140), .CK(clk), .RN(n1214), .Q(n2115), 
        .QN(n832) );
  DFFRX1 \geofence_R_reg[4][0]  ( .D(n1141), .CK(clk), .RN(n1215), .Q(n2117), 
        .QN(n833) );
  DFFRX1 \geofence_R_reg[6][5]  ( .D(n1158), .CK(clk), .RN(n1214), .Q(n2045), 
        .QN(n850) );
  DFFRX1 \geofence_R_reg[6][4]  ( .D(n1159), .CK(clk), .RN(n1215), .Q(n2047), 
        .QN(n851) );
  DFFRX1 \geofence_R_reg[6][3]  ( .D(n1160), .CK(clk), .RN(n1214), .Q(n2049), 
        .QN(n852) );
  DFFRX1 \geofence_R_reg[6][2]  ( .D(n1161), .CK(clk), .RN(n1215), .Q(n2051), 
        .QN(n853) );
  DFFRX1 \geofence_R_reg[6][1]  ( .D(n1162), .CK(clk), .RN(n1214), .Q(n2053), 
        .QN(n854) );
  DFFRX1 \geofence_R_reg[6][0]  ( .D(n1163), .CK(clk), .RN(n1215), .Q(n2055), 
        .QN(n855) );
  DFFRX1 \geofence_R_reg[6][10]  ( .D(n1153), .CK(clk), .RN(n1214), .Q(n2035), 
        .QN(n845) );
  DFFRX1 \geofence_R_reg[6][9]  ( .D(n1154), .CK(clk), .RN(n1215), .Q(n2037), 
        .QN(n846) );
  DFFRX1 \geofence_R_reg[6][8]  ( .D(n1155), .CK(clk), .RN(n1214), .Q(n2039), 
        .QN(n847) );
  DFFRX1 \geofence_R_reg[6][7]  ( .D(n1156), .CK(clk), .RN(n1215), .Q(n2041), 
        .QN(n848) );
  DFFRX1 \geofence_R_reg[6][6]  ( .D(n1157), .CK(clk), .RN(n1214), .Q(n2043), 
        .QN(n849) );
  DFFRX1 \geofence_Y_reg[6][3]  ( .D(n1034), .CK(clk), .RN(n1215), .Q(n1668), 
        .QN(n952) );
  DFFRX1 \geofence_X_reg[6][3]  ( .D(n1094), .CK(clk), .RN(n1214), .Q(n1716), 
        .QN(n902) );
  DFFRX1 \geofence_X_reg[6][1]  ( .D(n1096), .CK(clk), .RN(n1215), .Q(n1724), 
        .QN(n904) );
  DFFRX1 \geofence_Y_reg[6][0]  ( .D(n1037), .CK(clk), .RN(n1215), .Q(n1677), 
        .QN(n955) );
  DFFRX1 \geofence_X_reg[4][3]  ( .D(n1074), .CK(clk), .RN(n1214), .QN(n882)
         );
  DFFRX1 \geofence_Y_reg[4][3]  ( .D(n1014), .CK(clk), .RN(n1215), .QN(n932)
         );
  DFFRX1 \area_reg[1]_inst  ( .D(n2081), .CK(clk), .RN(n1214), .Q(area[1]) );
  DFFRX1 \area_reg[22]_inst  ( .D(n2060), .CK(clk), .RN(n1215), .Q(area[22])
         );
  DFFRXL \store_counter_reg[1]  ( .D(n1165), .CK(clk), .RN(n1214), .Q(
        store_counter[1]), .QN(n1548) );
  DFFRX2 \caculate_counter_reg[2]  ( .D(n1171), .CK(clk), .RN(n1215), .Q(n1551), .QN(n798) );
  DFFRX1 \geofence_Y_reg[1][0]_inst  ( .D(n987), .CK(clk), .RN(n1215), .Q(
        \geofence_Y[1][0] ), .QN(n915) );
  DFFRX1 \geofence_Y_reg[1][9]_inst  ( .D(n978), .CK(clk), .RN(n1214), .Q(
        \geofence_Y[1][9] ), .QN(n906) );
  DFFRX1 \geofence_Y_reg[1][8]_inst  ( .D(n979), .CK(clk), .RN(n1215), .Q(
        \geofence_Y[1][8] ), .QN(n907) );
  DFFRX1 \geofence_Y_reg[1][7]_inst  ( .D(n980), .CK(clk), .RN(n1214), .Q(
        \geofence_Y[1][7] ), .QN(n908) );
  DFFRX1 \geofence_Y_reg[1][6]_inst  ( .D(n981), .CK(clk), .RN(n1215), .Q(
        \geofence_Y[1][6] ), .QN(n909) );
  DFFRX1 \geofence_Y_reg[1][3]_inst  ( .D(n984), .CK(clk), .RN(n1214), .Q(
        \geofence_Y[1][3] ), .QN(n912) );
  DFFRX1 \geofence_X_reg[1][8]_inst  ( .D(n1039), .CK(clk), .RN(n1215), .Q(
        \geofence_X[1][8] ), .QN(n857) );
  DFFRX1 \geofence_X_reg[1][5]_inst  ( .D(n1042), .CK(clk), .RN(n1214), .Q(
        \geofence_X[1][5] ), .QN(n860) );
  DFFRX1 \geofence_X_reg[1][3]_inst  ( .D(n1044), .CK(clk), .RN(n1215), .Q(
        \geofence_X[1][3] ), .QN(n862) );
  DFFRX1 \geofence_X_reg[1][1]_inst  ( .D(n1046), .CK(clk), .RN(n1214), .Q(
        \geofence_X[1][1] ), .QN(n864) );
  DFFSRX1 \geofence_X_reg[2][8]  ( .D(n1049), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1558), .QN(n753) );
  DFFSRX1 \geofence_X_reg[2][7]  ( .D(n1050), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1562), .QN(n752) );
  DFFSRX1 \geofence_X_reg[2][6]  ( .D(n1051), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1566), .QN(n751) );
  DFFSRX1 \geofence_X_reg[2][5]  ( .D(n1052), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1570), .QN(n750) );
  DFFSRX1 \geofence_Y_reg[2][1]  ( .D(n996), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1787), .QN(n756) );
  DFFSRX1 \geofence_Y_reg[2][9]  ( .D(n988), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1747), .QN(n764) );
  DFFSRX1 \geofence_Y_reg[2][8]  ( .D(n989), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1752), .QN(n763) );
  DFFSRX1 \geofence_Y_reg[2][7]  ( .D(n990), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1757), .QN(n762) );
  DFFSRX1 \geofence_Y_reg[2][6]  ( .D(n991), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1762), .QN(n761) );
  DFFSRX1 \geofence_Y_reg[2][4]  ( .D(n993), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1772), .QN(n759) );
  DFFSRX1 \geofence_Y_reg[2][2]  ( .D(n995), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1782), .QN(n757) );
  DFFSRX1 \geofence_X_reg[2][4]  ( .D(n1053), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1574), .QN(n749) );
  DFFSRX1 \geofence_X_reg[2][2]  ( .D(n1055), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1582), .QN(n747) );
  DFFSRX1 \geofence_Y_reg[6][9]  ( .D(n1028), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1650), .QN(n946) );
  DFFSRX1 \geofence_Y_reg[6][8]  ( .D(n1029), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1653), .QN(n947) );
  DFFSRX1 \geofence_Y_reg[6][7]  ( .D(n1030), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1656), .QN(n948) );
  DFFSRX1 \geofence_Y_reg[6][6]  ( .D(n1031), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1659), .QN(n949) );
  DFFSRX1 \geofence_Y_reg[6][2]  ( .D(n1035), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1671), .QN(n953) );
  DFFSRX1 \geofence_Y_reg[6][1]  ( .D(n1036), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1674), .QN(n954) );
  DFFSRX1 \geofence_X_reg[6][9]  ( .D(n1088), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1692), .QN(n896) );
  DFFSRX1 \geofence_X_reg[6][8]  ( .D(n1089), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1696), .QN(n897) );
  DFFSRX1 \geofence_X_reg[6][7]  ( .D(n1090), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1700), .QN(n898) );
  DFFSRX1 \geofence_X_reg[6][6]  ( .D(n1091), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1704), .QN(n899) );
  DFFSRX1 \geofence_X_reg[6][5]  ( .D(n1092), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1708), .QN(n900) );
  DFFSRX1 \geofence_X_reg[6][4]  ( .D(n1093), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1712), .QN(n901) );
  DFFSRX1 \geofence_X_reg[6][2]  ( .D(n1095), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1720), .QN(n903) );
  DFFSRX1 \geofence_Y_reg[5][3]  ( .D(n1024), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1779), .QN(n942) );
  DFFSRX1 \geofence_Y_reg[5][2]  ( .D(n1025), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1784), .QN(n943) );
  DFFSRX1 \geofence_Y_reg[5][1]  ( .D(n1026), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1789), .QN(n944) );
  DFFSRX1 \geofence_X_reg[5][8]  ( .D(n1079), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1559), .QN(n887) );
  DFFSRX1 \geofence_X_reg[5][7]  ( .D(n1080), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1563), .QN(n888) );
  DFFSRX1 \geofence_X_reg[3][8]  ( .D(n1059), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1697), .QN(n867) );
  DFFSRX1 \geofence_X_reg[3][7]  ( .D(n1060), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1701), .QN(n868) );
  DFFSRX1 \geofence_X_reg[3][6]  ( .D(n1061), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1705), .QN(n869) );
  DFFSRX1 \geofence_X_reg[3][5]  ( .D(n1062), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1709), .QN(n870) );
  DFFSRX1 \geofence_X_reg[3][4]  ( .D(n1063), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1713), .QN(n871) );
  DFFSRX1 \geofence_X_reg[3][3]  ( .D(n1064), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1717), .QN(n872) );
  DFFSRX1 \geofence_X_reg[3][2]  ( .D(n1065), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1721), .QN(n873) );
  DFFSRX1 \geofence_X_reg[3][1]  ( .D(n1066), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1725), .QN(n874) );
  DFFSRX1 \geofence_X_reg[5][4]  ( .D(n1083), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1575), .QN(n891) );
  DFFSRX1 \geofence_Y_reg[5][6]  ( .D(n1021), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1764), .QN(n939) );
  DFFSRX1 \geofence_Y_reg[5][4]  ( .D(n1023), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1774), .QN(n941) );
  DFFSRX1 \geofence_Y_reg[5][9]  ( .D(n1018), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1749), .QN(n936) );
  DFFSRX1 \geofence_Y_reg[5][8]  ( .D(n1019), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1754), .QN(n937) );
  DFFSRX1 \geofence_X_reg[5][6]  ( .D(n1081), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1567), .QN(n889) );
  DFFSRX1 \geofence_X_reg[5][5]  ( .D(n1082), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1571), .QN(n890) );
  DFFSRX1 \geofence_X_reg[5][3]  ( .D(n1084), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1579), .QN(n892) );
  DFFSRX1 \geofence_X_reg[5][2]  ( .D(n1085), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1583), .QN(n893) );
  DFFSRX1 \geofence_X_reg[5][1]  ( .D(n1086), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1587), .QN(n894) );
  DFFSRX1 \geofence_X_reg[5][0]  ( .D(n1087), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1591), .QN(n895) );
  DFFSRX1 \geofence_Y_reg[3][9]  ( .D(n998), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1748), .QN(n916) );
  DFFSRX1 \geofence_Y_reg[3][8]  ( .D(n999), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1753), .QN(n917) );
  DFFSRX1 \geofence_Y_reg[3][7]  ( .D(n1000), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1758), .QN(n918) );
  DFFSRX1 \geofence_Y_reg[3][6]  ( .D(n1001), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1763), .QN(n919) );
  DFFSRX1 \geofence_Y_reg[3][3]  ( .D(n1004), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1778), .QN(n922) );
  DFFSRX1 \geofence_Y_reg[3][2]  ( .D(n1005), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1783), .QN(n923) );
  DFFSRX1 \geofence_Y_reg[3][1]  ( .D(n1006), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1788), .QN(n924) );
  DFFSRX1 \geofence_Y_reg[5][0]  ( .D(n1027), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1796), .QN(n945) );
  DFFSRX1 \geofence_Y_reg[3][0]  ( .D(n1007), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1794), .QN(n925) );
  DFFSRX1 \geofence_X_reg[4][9]  ( .D(n1068), .CK(clk), .SN(1'b1), .RN(n1214), 
        .QN(n876) );
  DFFSRX1 \geofence_X_reg[4][8]  ( .D(n1069), .CK(clk), .SN(1'b1), .RN(n1215), 
        .QN(n877) );
  DFFSRX1 \geofence_X_reg[4][7]  ( .D(n1070), .CK(clk), .SN(1'b1), .RN(n1214), 
        .QN(n878) );
  DFFSRX1 \geofence_X_reg[4][1]  ( .D(n1076), .CK(clk), .SN(1'b1), .RN(n1214), 
        .QN(n884) );
  DFFSRX1 \geofence_Y_reg[4][9]  ( .D(n1008), .CK(clk), .SN(1'b1), .RN(n1215), 
        .QN(n926) );
  DFFSRX1 \geofence_Y_reg[4][7]  ( .D(n1010), .CK(clk), .SN(1'b1), .RN(n1215), 
        .QN(n928) );
  DFFSRX1 \geofence_Y_reg[4][6]  ( .D(n1011), .CK(clk), .SN(1'b1), .RN(n1214), 
        .QN(n929) );
  DFFSRX1 \geofence_Y_reg[4][5]  ( .D(n1012), .CK(clk), .SN(1'b1), .RN(n1215), 
        .QN(n930) );
  DFFSRX1 \geofence_Y_reg[4][4]  ( .D(n1013), .CK(clk), .SN(1'b1), .RN(n1214), 
        .QN(n931) );
  DFFSRX1 \geofence_Y_reg[4][0]  ( .D(n1017), .CK(clk), .SN(1'b1), .RN(n1215), 
        .QN(n935) );
  DFFSRX4 \geofence_Y_reg[5][7]  ( .D(n1020), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1759), .QN(n938) );
  DFFSRX4 \geofence_Y_reg[2][5]  ( .D(n992), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1767), .QN(n760) );
  DFFSRX4 \geofence_Y_reg[3][5]  ( .D(n1002), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1768), .QN(n920) );
  DFFSRX4 \geofence_Y_reg[5][5]  ( .D(n1022), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1769), .QN(n940) );
  DFFRX4 \geofence_Y_reg[1][4]_inst  ( .D(n983), .CK(clk), .RN(n1215), .Q(
        \geofence_Y[1][4] ), .QN(n911) );
  DFFSRX4 \geofence_Y_reg[6][5]  ( .D(n1032), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1662), .QN(n950) );
  DFFRX4 \geofence_Y_reg[1][5]_inst  ( .D(n982), .CK(clk), .RN(n1214), .Q(
        \geofence_Y[1][5] ), .QN(n910) );
  DFFRX4 \geofence_X_reg[6][0]  ( .D(n1097), .CK(clk), .RN(n1214), .Q(n1729), 
        .QN(n905) );
  DFFSRX4 \geofence_X_reg[3][0]  ( .D(n1067), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1731), .QN(n875) );
  DFFRX4 \geofence_X_reg[1][0]_inst  ( .D(n1047), .CK(clk), .RN(n1215), .Q(
        \geofence_X[1][0] ), .QN(n865) );
  DFFSRX4 \geofence_Y_reg[6][4]  ( .D(n1033), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1665), .QN(n951) );
  DFFSRX4 \geofence_Y_reg[3][4]  ( .D(n1003), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1773), .QN(n921) );
  DFFSRX4 \geofence_X_reg[2][9]  ( .D(n1048), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1554), .QN(n754) );
  DFFSRX4 \geofence_X_reg[3][9]  ( .D(n1058), .CK(clk), .SN(1'b1), .RN(n1215), 
        .Q(n1693), .QN(n866) );
  DFFSRX4 \geofence_X_reg[5][9]  ( .D(n1078), .CK(clk), .SN(1'b1), .RN(n1214), 
        .Q(n1555), .QN(n886) );
  DFFRX4 \caculate_counter_reg[0]  ( .D(n1172), .CK(clk), .RN(n1214), .Q(n1466), .QN(n800) );
  AOI222X4 U1230 ( .A0(n1733), .A1(\geofence_X[1][8] ), .B0(n1732), .B1(n1697), 
        .C0(n1730), .C1(n1696), .Y(n1698) );
  NAND3X8 U1231 ( .A(n1199), .B(n1200), .C(n1938), .Y(n1943) );
  INVX8 U1232 ( .A(n1646), .Y(n1805) );
  OA22X2 U1233 ( .A0(n747), .A1(n1354), .B0(n883), .B1(n1728), .Y(n1723) );
  AO22X4 U1234 ( .A0(N2159), .A1(n1352), .B0(N2149), .B1(n1350), .Y(Y_REG[0])
         );
  CLKAND2X4 U1235 ( .A(n1648), .B(n799), .Y(n1360) );
  NAND2X2 U1236 ( .A(side_length_after[5]), .B(n1951), .Y(n1969) );
  NAND2X8 U1237 ( .A(N2257), .B(n1412), .Y(n1951) );
  INVX16 U1238 ( .A(n1987), .Y(n2001) );
  CLKAND2X2 U1239 ( .A(side_length_after[6]), .B(n1953), .Y(n1348) );
  NAND2X8 U1240 ( .A(N2254), .B(n1412), .Y(n1945) );
  INVX3 U1241 ( .A(\geofence_X_reg[0][5] ), .Y(n1876) );
  INVX16 U1242 ( .A(n2004), .Y(n2021) );
  AOI222X1 U1243 ( .A0(n1374), .A1(n1571), .B0(n1795), .B1(n1709), .C0(n1376), 
        .C1(n1570), .Y(n1572) );
  CLKAND2X4 U1244 ( .A(N2443), .B(n1408), .Y(area_reg[3]) );
  AOI32X4 U1245 ( .A0(n1886), .A1(n1891), .A2(\geofence_X_reg[0][4] ), .B0(
        \geofence_X_reg[0][5] ), .B1(n1877), .Y(n1894) );
  INVXL U1246 ( .A(\geofence_X_reg[1][5] ), .Y(n1877) );
  NAND2X6 U1247 ( .A(n2003), .B(n2009), .Y(n1320) );
  NAND3X6 U1248 ( .A(n2006), .B(n1988), .C(n2005), .Y(n2009) );
  CLKINVX20 U1249 ( .A(n1989), .Y(n2002) );
  AOI222X2 U1250 ( .A0(n1374), .A1(n1579), .B0(n1795), .B1(n1717), .C0(n1376), 
        .C1(n1578), .Y(n1580) );
  AO22X4 U1251 ( .A0(N2167), .A1(n1352), .B0(N2157), .B1(n1350), .Y(Y_REG[8])
         );
  NOR2BX4 U1252 ( .AN(\geofence_Y_reg[0][1] ), .B(\geofence_Y_reg[1][1] ), .Y(
        n1916) );
  AO22X4 U1253 ( .A0(N2162), .A1(n1352), .B0(N2152), .B1(n1350), .Y(Y_REG[3])
         );
  CLKAND2X12 U1254 ( .A(N2374), .B(n1415), .Y(area_sqrt2_before[22]) );
  AO22X4 U1255 ( .A0(n2002), .A1(n1993), .B0(n2001), .B1(\gt_699/A[7] ), .Y(
        A[7]) );
  AOI222X2 U1256 ( .A0(n1374), .A1(n1563), .B0(n1795), .B1(n1701), .C0(n1376), 
        .C1(n1562), .Y(n1564) );
  NAND2BX4 U1257 ( .AN(n1906), .B(n1412), .Y(n1905) );
  NAND3X8 U1258 ( .A(n1194), .B(n1195), .C(n1901), .Y(n1906) );
  INVX3 U1259 ( .A(\geofence_X_reg[1][7] ), .Y(n1875) );
  NAND2X2 U1260 ( .A(\geofence_X_reg[1][7] ), .B(n1896), .Y(n1897) );
  AO22X4 U1261 ( .A0(N2166), .A1(n1352), .B0(N2156), .B1(n1350), .Y(Y_REG[7])
         );
  AND2X8 U1262 ( .A(n1942), .B(n1412), .Y(n1352) );
  NAND2X8 U1263 ( .A(n1320), .B(n1321), .Y(n1989) );
  NAND3X4 U1264 ( .A(n1196), .B(n1197), .C(n1929), .Y(n1935) );
  OAI221X4 U1265 ( .A0(n813), .A1(n1375), .B0(n802), .B1(n1400), .C0(n1825), 
        .Y(N2112) );
  OAI221X4 U1266 ( .A0(n812), .A1(n1375), .B0(n801), .B1(n1400), .C0(n1823), 
        .Y(N2113) );
  OAI221X4 U1267 ( .A0(n814), .A1(n1375), .B0(n803), .B1(n1400), .C0(n1827), 
        .Y(N2111) );
  OAI221X4 U1268 ( .A0(n815), .A1(n1375), .B0(n804), .B1(n1400), .C0(n1829), 
        .Y(N2110) );
  OAI221X4 U1269 ( .A0(n816), .A1(n1375), .B0(n805), .B1(n1400), .C0(n1831), 
        .Y(N2109) );
  OAI221X4 U1270 ( .A0(n817), .A1(n1375), .B0(n806), .B1(n1400), .C0(n1833), 
        .Y(N2108) );
  OAI221X4 U1271 ( .A0(n818), .A1(n1375), .B0(n807), .B1(n1400), .C0(n1835), 
        .Y(N2107) );
  BUFX20 U1272 ( .A(n2026), .Y(n1411) );
  INVX12 U1273 ( .A(n1553), .Y(n2025) );
  INVX8 U1274 ( .A(n1324), .Y(n1325) );
  AND2X4 U1275 ( .A(n1732), .B(n1773), .Y(n1179) );
  INVX16 U1276 ( .A(n2007), .Y(n2026) );
  NAND3BX4 U1277 ( .AN(n800), .B(n799), .C(n1551), .Y(n1467) );
  INVX4 U1278 ( .A(n1818), .Y(n1324) );
  AND2X8 U1279 ( .A(N2237), .B(n1418), .Y(side_length_before[18]) );
  OAI2BB1X4 U1280 ( .A0N(N2480), .A1N(n1416), .B0(n1341), .Y(n2068) );
  NAND2X8 U1281 ( .A(state[1]), .B(n1461), .Y(n1465) );
  OAI2BB1X4 U1282 ( .A0N(N2479), .A1N(n1408), .B0(n1340), .Y(n2069) );
  OAI211X4 U1283 ( .A0(n906), .A1(n1800), .B0(n1751), .C0(n1750), .Y(
        \geofence_Y_reg[0][9] ) );
  AO22X4 U1284 ( .A0(N2164), .A1(n1352), .B0(N2154), .B1(n1350), .Y(Y_REG[5])
         );
  OAI21X4 U1285 ( .A0(n1920), .A1(n1919), .B0(n1918), .Y(n1922) );
  CLKAND2X12 U1286 ( .A(N2461), .B(n1409), .Y(area_reg[21]) );
  NAND2X8 U1287 ( .A(N2252), .B(n1413), .Y(n1946) );
  OAI2BB1X4 U1288 ( .A0N(N2486), .A1N(n1413), .B0(n1333), .Y(n2062) );
  AND2X6 U1289 ( .A(N2449), .B(n1408), .Y(area_reg[9]) );
  BUFX20 U1290 ( .A(n2025), .Y(n1403) );
  INVX16 U1291 ( .A(n1329), .Y(n1870) );
  NAND2X8 U1292 ( .A(n1818), .B(n1475), .Y(n2007) );
  INVX16 U1293 ( .A(n1945), .Y(\gt_699/A[2] ) );
  INVX20 U1294 ( .A(n1356), .Y(n2022) );
  NAND2X4 U1295 ( .A(N2253), .B(n1413), .Y(n1955) );
  AND2X8 U1296 ( .A(N2446), .B(n1408), .Y(area_reg[6]) );
  AND2X6 U1297 ( .A(N2239), .B(n1418), .Y(n1366) );
  AND2X8 U1298 ( .A(N2286), .B(n1417), .Y(area_sqrt1_before[22]) );
  OR2X4 U1299 ( .A(n1974), .B(n1973), .Y(n1173) );
  OR2XL U1300 ( .A(side_length_after[7]), .B(n1322), .Y(n1174) );
  NAND3X4 U1301 ( .A(n1173), .B(n1174), .C(n1971), .Y(n1981) );
  CLKAND2X12 U1302 ( .A(N2457), .B(n1414), .Y(area_reg[17]) );
  BUFX20 U1303 ( .A(\gt_699/A[3] ), .Y(n1431) );
  AND2XL U1304 ( .A(n1374), .B(n1555), .Y(n1175) );
  AND2X1 U1305 ( .A(n1795), .B(n1693), .Y(n1176) );
  AND2XL U1306 ( .A(n1376), .B(n1554), .Y(n1177) );
  NOR3X2 U1307 ( .A(n1175), .B(n1176), .C(n1177), .Y(n1556) );
  AND2X1 U1308 ( .A(n1733), .B(\geofence_Y[1][4] ), .Y(n1178) );
  CLKAND2X2 U1309 ( .A(n1730), .B(n1665), .Y(n1180) );
  NOR3X4 U1310 ( .A(n1178), .B(n1179), .C(n1180), .Y(n1666) );
  INVX8 U1311 ( .A(n1649), .Y(n1733) );
  AND2X4 U1312 ( .A(N2230), .B(n1418), .Y(side_length_before[11]) );
  OR2X6 U1313 ( .A(n1895), .B(n1204), .Y(n1181) );
  OR2X2 U1314 ( .A(\geofence_X_reg[1][6] ), .B(n1893), .Y(n1182) );
  NAND3X8 U1315 ( .A(n1181), .B(n1182), .C(n1892), .Y(n1898) );
  CLKINVX1 U1316 ( .A(n1887), .Y(n1895) );
  CLKINVX1 U1317 ( .A(\geofence_X_reg[0][6] ), .Y(n1893) );
  NAND3X4 U1318 ( .A(n1310), .B(n1311), .C(n1888), .Y(n1892) );
  CLKAND2X2 U1319 ( .A(n1733), .B(\geofence_X[1][0] ), .Y(n1183) );
  AND2X2 U1320 ( .A(n1380), .B(n1731), .Y(n1184) );
  CLKAND2X2 U1321 ( .A(n1730), .B(n1729), .Y(n1185) );
  NOR3X4 U1322 ( .A(n1183), .B(n1184), .C(n1185), .Y(n1734) );
  AND2X1 U1323 ( .A(n1733), .B(\geofence_Y[1][5] ), .Y(n1186) );
  AND2X2 U1324 ( .A(n1380), .B(n1768), .Y(n1187) );
  CLKAND2X2 U1325 ( .A(n1730), .B(n1662), .Y(n1188) );
  NOR3X4 U1326 ( .A(n1186), .B(n1187), .C(n1188), .Y(n1663) );
  OR2X8 U1327 ( .A(n1193), .B(n1359), .Y(n1380) );
  INVX12 U1328 ( .A(n1355), .Y(n1730) );
  BUFX8 U1329 ( .A(n1663), .Y(n1323) );
  OA21X4 U1330 ( .A0(n911), .A1(n1800), .B0(n1776), .Y(n1189) );
  NAND2X8 U1331 ( .A(n1189), .B(n1775), .Y(\geofence_Y_reg[0][4] ) );
  INVX12 U1332 ( .A(n1550), .Y(n1800) );
  AOI32X1 U1333 ( .A0(n1923), .A1(n1928), .A2(\geofence_Y_reg[0][4] ), .B0(
        \geofence_Y_reg[0][5] ), .B1(n1914), .Y(n1931) );
  AND2X1 U1334 ( .A(n1374), .B(n1769), .Y(n1190) );
  AND2X1 U1335 ( .A(n1795), .B(n1768), .Y(n1191) );
  CLKAND2X2 U1336 ( .A(n1376), .B(n1767), .Y(n1192) );
  NOR3X4 U1337 ( .A(n1190), .B(n1191), .C(n1192), .Y(n1770) );
  INVX16 U1338 ( .A(n1373), .Y(n1374) );
  AO22X4 U1339 ( .A0(N2165), .A1(n1352), .B0(N2155), .B1(n1350), .Y(Y_REG[6])
         );
  CLKAND2X2 U1340 ( .A(n1362), .B(n1406), .Y(n1193) );
  AND3X6 U1341 ( .A(n1466), .B(n798), .C(n1647), .Y(n1362) );
  BUFX20 U1342 ( .A(n1402), .Y(n1406) );
  AOI222X2 U1343 ( .A0(n1733), .A1(\geofence_Y[1][3] ), .B0(n1380), .B1(n1778), 
        .C0(n1730), .C1(n1668), .Y(n1669) );
  AOI222XL U1344 ( .A0(n1733), .A1(\geofence_X[1][9] ), .B0(n1380), .B1(n1693), 
        .C0(n1730), .C1(n1692), .Y(n1694) );
  AOI222X2 U1345 ( .A0(n1733), .A1(\geofence_X[1][6] ), .B0(n1380), .B1(n1705), 
        .C0(n1730), .C1(n1704), .Y(n1706) );
  OR2X4 U1346 ( .A(n1904), .B(n1903), .Y(n1194) );
  OR2X2 U1347 ( .A(\geofence_X_reg[1][9] ), .B(n1902), .Y(n1195) );
  AOI32X4 U1348 ( .A0(\geofence_X_reg[0][7] ), .A1(n1875), .A2(n1899), .B0(
        \geofence_X_reg[0][8] ), .B1(n1874), .Y(n1904) );
  OAI211X4 U1349 ( .A0(n886), .A1(n1331), .B0(n1695), .C0(n1694), .Y(
        \geofence_X_reg[1][9] ) );
  CLKINVX2 U1350 ( .A(\geofence_X_reg[0][9] ), .Y(n1902) );
  OR2X1 U1351 ( .A(n1932), .B(n1931), .Y(n1196) );
  OR2X1 U1352 ( .A(\geofence_Y_reg[1][6] ), .B(n1930), .Y(n1197) );
  NAND2X4 U1353 ( .A(n1312), .B(n1660), .Y(\geofence_Y_reg[1][6] ) );
  CLKINVX1 U1354 ( .A(\geofence_Y_reg[0][6] ), .Y(n1930) );
  OA21X4 U1355 ( .A0(n938), .A1(n1331), .B0(n1658), .Y(n1198) );
  NAND2X8 U1356 ( .A(n1198), .B(n1657), .Y(\geofence_Y_reg[1][7] ) );
  CLKAND2X12 U1357 ( .A(n1821), .B(n1370), .Y(n1331) );
  OA22X2 U1358 ( .A0(n762), .A1(n1354), .B0(n928), .B1(n1379), .Y(n1658) );
  AOI222X4 U1359 ( .A0(n1733), .A1(\geofence_Y[1][7] ), .B0(n1732), .B1(n1758), 
        .C0(n1730), .C1(n1656), .Y(n1657) );
  CLKINVX4 U1360 ( .A(\geofence_Y_reg[1][7] ), .Y(n1912) );
  NAND2X2 U1361 ( .A(\geofence_Y_reg[1][7] ), .B(n1933), .Y(n1934) );
  OR2X2 U1362 ( .A(n1941), .B(n1940), .Y(n1199) );
  OR2X1 U1363 ( .A(\geofence_Y_reg[1][9] ), .B(n1939), .Y(n1200) );
  AOI32X4 U1364 ( .A0(\geofence_Y_reg[0][7] ), .A1(n1912), .A2(n1936), .B0(
        \geofence_Y_reg[0][8] ), .B1(n1911), .Y(n1941) );
  CLKINVX1 U1365 ( .A(n1937), .Y(n1940) );
  OAI211X4 U1366 ( .A0(n936), .A1(n1331), .B0(n1652), .C0(n1651), .Y(
        \geofence_Y_reg[1][9] ) );
  AND2X8 U1367 ( .A(n1413), .B(n1943), .Y(n1350) );
  INVX6 U1368 ( .A(n1943), .Y(n1942) );
  AO22X1 U1369 ( .A0(n2002), .A1(n1203), .B0(n2001), .B1(n1990), .Y(B[10]) );
  NAND2X6 U1370 ( .A(n1473), .B(n1403), .Y(n1649) );
  AOI32X2 U1371 ( .A0(n1981), .A1(n1980), .A2(n1979), .B0(n1202), .B1(n1978), 
        .Y(n1982) );
  INVX8 U1372 ( .A(n1372), .Y(n1373) );
  OAI31X4 U1373 ( .A0(n799), .A1(n1553), .A2(n1552), .B0(n1819), .Y(n1372) );
  CLKINVX8 U1374 ( .A(n1552), .Y(n1648) );
  NAND2X4 U1375 ( .A(n800), .B(n798), .Y(n1552) );
  NAND2X4 U1376 ( .A(n1360), .B(n1412), .Y(n1846) );
  INVX8 U1377 ( .A(n1465), .Y(n1818) );
  CLKAND2X6 U1378 ( .A(N2445), .B(n1408), .Y(area_reg[5]) );
  AO22X2 U1379 ( .A0(N2308), .A1(n1326), .B0(N2296), .B1(n1384), .Y(E[6]) );
  CLKAND2X6 U1380 ( .A(N2444), .B(n1408), .Y(area_reg[4]) );
  BUFX16 U1381 ( .A(\gt_699/A[10] ), .Y(n1201) );
  BUFX12 U1382 ( .A(\gt_699/A[10] ), .Y(n1202) );
  CLKBUFX2 U1383 ( .A(\gt_699/A[10] ), .Y(n1203) );
  INVX12 U1384 ( .A(n1947), .Y(\gt_699/A[10] ) );
  AO22XL U1385 ( .A0(n2022), .A1(n2010), .B0(n1203), .B1(n2021), .Y(C[10]) );
  AO22XL U1386 ( .A0(n2002), .A1(n1990), .B0(n2001), .B1(n1203), .Y(A[10]) );
  BUFX3 U1387 ( .A(n1894), .Y(n1204) );
  AOI222X1 U1388 ( .A0(n1733), .A1(\geofence_X[1][3] ), .B0(n1380), .B1(n1717), 
        .C0(n1730), .C1(n1716), .Y(n1718) );
  AOI21X4 U1389 ( .A0(\geofence_X_reg[1][1] ), .A1(n1878), .B0(
        \geofence_X_reg[1][0] ), .Y(n1880) );
  CLKINVX8 U1390 ( .A(\geofence_X_reg[0][1] ), .Y(n1878) );
  BUFX20 U1391 ( .A(\gt_699/A[1] ), .Y(n1430) );
  INVX20 U1392 ( .A(n1351), .Y(n1376) );
  OA22X2 U1393 ( .A0(n757), .A1(n1354), .B0(n933), .B1(n1728), .Y(n1673) );
  OA22X2 U1394 ( .A0(n745), .A1(n1354), .B0(n885), .B1(n1728), .Y(n1735) );
  OA22X1 U1395 ( .A0(n755), .A1(n1354), .B0(n935), .B1(n1728), .Y(n1679) );
  OA22X2 U1396 ( .A0(n749), .A1(n1354), .B0(n881), .B1(n1728), .Y(n1715) );
  NAND3BX4 U1397 ( .AN(n1805), .B(n1648), .C(n1647), .Y(n1728) );
  BUFX2 U1398 ( .A(n1410), .Y(n1409) );
  BUFX2 U1399 ( .A(n1321), .Y(n1410) );
  NAND2BX2 U1400 ( .AN(\geofence_X_reg[1][2] ), .B(\geofence_X_reg[0][2] ), 
        .Y(n1881) );
  OR2X4 U1401 ( .A(\geofence_X_reg[0][4] ), .B(n1891), .Y(n1310) );
  INVX4 U1402 ( .A(\geofence_X_reg[1][4] ), .Y(n1891) );
  CLKINVX3 U1403 ( .A(\geofence_Y_reg[0][5] ), .Y(n1913) );
  CLKINVX3 U1404 ( .A(n1963), .Y(n1959) );
  AO22XL U1405 ( .A0(n2002), .A1(\gt_699/A[7] ), .B0(n2001), .B1(n1993), .Y(
        B[7]) );
  AND2X4 U1406 ( .A(n1434), .B(n2021), .Y(C[11]) );
  AND2X4 U1407 ( .A(N2458), .B(n1409), .Y(area_reg[18]) );
  AND2X4 U1408 ( .A(N2442), .B(n1414), .Y(area_reg[2]) );
  AND2X2 U1409 ( .A(n1887), .B(n1886), .Y(n1888) );
  CLKINVX1 U1410 ( .A(\geofence_Y_reg[0][9] ), .Y(n1939) );
  CLKINVX1 U1411 ( .A(n1900), .Y(n1903) );
  AND2X2 U1412 ( .A(N2235), .B(n1418), .Y(side_length_before[16]) );
  AND2X2 U1413 ( .A(N2236), .B(n1418), .Y(side_length_before[17]) );
  AO22X1 U1414 ( .A0(n2002), .A1(n1432), .B0(n2001), .B1(n1995), .Y(B[5]) );
  NAND2X2 U1415 ( .A(N2255), .B(n1413), .Y(n1958) );
  AND2X2 U1416 ( .A(N2220), .B(n1417), .Y(side_length_before[1]) );
  AND2X2 U1417 ( .A(n2022), .B(n2013), .Y(n1318) );
  AO22X1 U1418 ( .A0(\gt_699/A[7] ), .A1(n2022), .B0(n2021), .B1(n2013), .Y(
        D[7]) );
  AO22X1 U1419 ( .A0(n1432), .A1(n2022), .B0(n2021), .B1(n2015), .Y(D[5]) );
  AO22X1 U1420 ( .A0(n2022), .A1(n2015), .B0(n1432), .B1(n2021), .Y(C[5]) );
  CLKINVX6 U1421 ( .A(n1958), .Y(\gt_699/A[3] ) );
  AOI2BB1X1 U1422 ( .A0N(\gt_699/A[4] ), .A1N(n1967), .B0(n1348), .Y(n1968) );
  AO22X1 U1423 ( .A0(n2022), .A1(n2016), .B0(\gt_699/A[4] ), .B1(n2021), .Y(
        C[4]) );
  AO22X1 U1424 ( .A0(\gt_699/A[4] ), .A1(n2022), .B0(n2021), .B1(n2016), .Y(
        D[4]) );
  AO22X1 U1425 ( .A0(n2002), .A1(n1431), .B0(n2001), .B1(n1997), .Y(B[3]) );
  AO22X1 U1426 ( .A0(n2002), .A1(n1997), .B0(n2001), .B1(n1431), .Y(A[3]) );
  CLKINVX6 U1427 ( .A(n1955), .Y(\gt_699/A[1] ) );
  AO22X1 U1428 ( .A0(n1430), .A1(n2022), .B0(n2021), .B1(n2019), .Y(D[1]) );
  AO22X1 U1429 ( .A0(n2022), .A1(n2019), .B0(n1430), .B1(n2021), .Y(C[1]) );
  AO22X1 U1430 ( .A0(n2002), .A1(n1430), .B0(n2001), .B1(n1999), .Y(B[1]) );
  AND2X2 U1431 ( .A(N2279), .B(n1416), .Y(area_sqrt1_before[15]) );
  AND2X2 U1432 ( .A(N2365), .B(n1414), .Y(area_sqrt2_before[13]) );
  NAND2X4 U1433 ( .A(N2379), .B(N2375), .Y(n2006) );
  CLKAND2X3 U1434 ( .A(N2370), .B(n1415), .Y(area_sqrt2_before[18]) );
  AND2X2 U1435 ( .A(N2371), .B(n1415), .Y(area_sqrt2_before[19]) );
  AND2X2 U1436 ( .A(N2281), .B(n1416), .Y(area_sqrt1_before[17]) );
  AND2X2 U1437 ( .A(N2280), .B(n1416), .Y(area_sqrt1_before[16]) );
  AND2X2 U1438 ( .A(N2282), .B(n1417), .Y(area_sqrt1_before[18]) );
  AND2X2 U1439 ( .A(N2264), .B(n1415), .Y(area_sqrt1_before[0]) );
  OA22X1 U1440 ( .A0(n753), .A1(n1354), .B0(n877), .B1(n1728), .Y(n1699) );
  AOI222X1 U1441 ( .A0(n1733), .A1(\geofence_X[1][7] ), .B0(n1380), .B1(n1701), 
        .C0(n1730), .C1(n1700), .Y(n1702) );
  OA22X1 U1442 ( .A0(n751), .A1(n1354), .B0(n879), .B1(n1728), .Y(n1707) );
  OA22X1 U1443 ( .A0(n899), .A1(n1370), .B0(n879), .B1(n1371), .Y(n1569) );
  AOI222X1 U1444 ( .A0(n1797), .A1(n1567), .B0(n1795), .B1(n1705), .C0(n1376), 
        .C1(n1566), .Y(n1568) );
  AND2X2 U1445 ( .A(N2356), .B(n1414), .Y(area_sqrt2_before[4]) );
  OA22X1 U1446 ( .A0(n954), .A1(n1370), .B0(n934), .B1(n1371), .Y(n1791) );
  NOR3X2 U1447 ( .A(n1307), .B(n1308), .C(n1309), .Y(n1775) );
  AND2X2 U1448 ( .A(n1797), .B(n1774), .Y(n1307) );
  AND3X2 U1449 ( .A(n1313), .B(n1314), .C(n1315), .Y(n1780) );
  NAND2X1 U1450 ( .A(n1374), .B(n1779), .Y(n1313) );
  OA22X2 U1451 ( .A0(n756), .A1(n1354), .B0(n934), .B1(n1379), .Y(n1676) );
  OA22X1 U1452 ( .A0(n759), .A1(n1354), .B0(n931), .B1(n1728), .Y(n1667) );
  OA22X1 U1453 ( .A0(n947), .A1(n1370), .B0(n927), .B1(n1371), .Y(n1756) );
  AOI222XL U1454 ( .A0(n1797), .A1(n1754), .B0(n1795), .B1(n1753), .C0(n1376), 
        .C1(n1752), .Y(n1755) );
  OA22X2 U1455 ( .A0(n746), .A1(n1354), .B0(n884), .B1(n1379), .Y(n1727) );
  OA22X1 U1456 ( .A0(n950), .A1(n1370), .B0(n930), .B1(n1371), .Y(n1771) );
  OA22X2 U1457 ( .A0(n750), .A1(n1354), .B0(n880), .B1(n1379), .Y(n1711) );
  AOI222X1 U1458 ( .A0(n1733), .A1(\geofence_X[1][5] ), .B0(n1732), .B1(n1709), 
        .C0(n1730), .C1(n1708), .Y(n1710) );
  OA22X1 U1459 ( .A0(n949), .A1(n1370), .B0(n929), .B1(n1371), .Y(n1766) );
  AOI222X1 U1460 ( .A0(n1797), .A1(n1764), .B0(n1795), .B1(n1763), .C0(n1376), 
        .C1(n1762), .Y(n1765) );
  AOI222X1 U1461 ( .A0(n1733), .A1(\geofence_X[1][4] ), .B0(n1732), .B1(n1713), 
        .C0(n1730), .C1(n1712), .Y(n1714) );
  OA22X1 U1462 ( .A0(n763), .A1(n1354), .B0(n927), .B1(n1728), .Y(n1655) );
  OA22X1 U1463 ( .A0(n905), .A1(n1370), .B0(n885), .B1(n1371), .Y(n1593) );
  AOI222X1 U1464 ( .A0(n1797), .A1(n1591), .B0(n1795), .B1(n1731), .C0(n1376), 
        .C1(n1590), .Y(n1592) );
  OA22X1 U1465 ( .A0(n900), .A1(n1370), .B0(n880), .B1(n1371), .Y(n1573) );
  OA22X1 U1466 ( .A0(n761), .A1(n1354), .B0(n929), .B1(n1728), .Y(n1661) );
  OA22X1 U1467 ( .A0(n901), .A1(n1370), .B0(n881), .B1(n1371), .Y(n1577) );
  AOI222X1 U1468 ( .A0(n1797), .A1(n1575), .B0(n1795), .B1(n1713), .C0(n1376), 
        .C1(n1574), .Y(n1576) );
  AND2X2 U1469 ( .A(N2352), .B(n1414), .Y(area_sqrt2_before[0]) );
  OA22X1 U1470 ( .A0(n903), .A1(n1370), .B0(n883), .B1(n1371), .Y(n1585) );
  AOI222X1 U1471 ( .A0(n1797), .A1(n1583), .B0(n1795), .B1(n1721), .C0(n1376), 
        .C1(n1582), .Y(n1584) );
  OA22X1 U1472 ( .A0(n902), .A1(n1370), .B0(n882), .B1(n1371), .Y(n1581) );
  OA22X1 U1473 ( .A0(n955), .A1(n1370), .B0(n935), .B1(n1371), .Y(n1799) );
  AND2X2 U1474 ( .A(n798), .B(n799), .Y(n1361) );
  AND2X4 U1475 ( .A(N2448), .B(n1410), .Y(area_reg[8]) );
  AND2X2 U1476 ( .A(N2451), .B(n1410), .Y(area_reg[11]) );
  BUFX4 U1477 ( .A(n2025), .Y(n1402) );
  NAND3BX1 U1478 ( .AN(state[2]), .B(n768), .C(n1471), .Y(n1499) );
  OAI2BB1X2 U1479 ( .A0N(N2488), .A1N(n1414), .B0(n1335), .Y(n2060) );
  OAI221XL U1480 ( .A0(n1475), .A1(n1474), .B0(n1473), .B1(n1553), .C0(n1820), 
        .Y(n1478) );
  OAI2BB1X2 U1481 ( .A0N(N2484), .A1N(n1410), .B0(n1334), .Y(n2064) );
  AO21X2 U1482 ( .A0(N2482), .A1(n1408), .B0(n1807), .Y(n2066) );
  OAI2BB1X1 U1483 ( .A0N(N2485), .A1N(n1408), .B0(n1336), .Y(n2063) );
  INVX16 U1484 ( .A(n1213), .Y(n1214) );
  INVX16 U1485 ( .A(n1213), .Y(n1215) );
  OAI2BB1X1 U1486 ( .A0N(N2476), .A1N(n1410), .B0(n1342), .Y(n2072) );
  OAI221XL U1487 ( .A0(n820), .A1(n1375), .B0(n809), .B1(n1400), .C0(n1839), 
        .Y(N2105) );
  OAI221XL U1488 ( .A0(n819), .A1(n1375), .B0(n808), .B1(n1400), .C0(n1837), 
        .Y(N2106) );
  AO21X4 U1489 ( .A0(n2006), .A1(n2005), .B0(n2007), .Y(n1987) );
  INVX20 U1490 ( .A(n2001), .Y(n1305) );
  INVX8 U1491 ( .A(n1305), .Y(n1306) );
  CLKINVX1 U1492 ( .A(reset), .Y(n2034) );
  AND2X2 U1493 ( .A(n1484), .B(n1483), .Y(n1206) );
  AND2XL U1494 ( .A(n1325), .B(n2007), .Y(n1207) );
  OAI211X4 U1495 ( .A0(n895), .A1(n1331), .B0(n1735), .C0(n1734), .Y(
        \geofence_X_reg[1][0] ) );
  INVX12 U1496 ( .A(n1339), .Y(n1370) );
  AOI222X1 U1497 ( .A0(n1733), .A1(\geofence_Y[1][6] ), .B0(n1732), .B1(n1763), 
        .C0(n1730), .C1(n1659), .Y(n1660) );
  AND2X2 U1498 ( .A(N2231), .B(n1418), .Y(side_length_before[12]) );
  AND2X2 U1499 ( .A(N2278), .B(n1416), .Y(area_sqrt1_before[14]) );
  AND2X2 U1500 ( .A(N2274), .B(n1416), .Y(area_sqrt1_before[10]) );
  AND2X2 U1501 ( .A(N1830), .B(n1403), .Y(n1209) );
  AND2X2 U1502 ( .A(N1921), .B(n1390), .Y(n1210) );
  AND2X2 U1503 ( .A(N1861), .B(n1390), .Y(n1211) );
  INVX4 U1504 ( .A(n1207), .Y(n1212) );
  INVX3 U1505 ( .A(n2034), .Y(n1213) );
  NAND2X1 U1595 ( .A(n1362), .B(n1412), .Y(n1821) );
  INVX12 U1596 ( .A(n1975), .Y(\gt_699/A[8] ) );
  AND2X8 U1597 ( .A(n1417), .B(N2284), .Y(area_sqrt1_before[20]) );
  AND2X1 U1598 ( .A(n2002), .B(n1434), .Y(B[11]) );
  AO22X4 U1599 ( .A0(n2002), .A1(\gt_699/A[4] ), .B0(n2001), .B1(n1996), .Y(
        B[4]) );
  BUFX20 U1600 ( .A(\gt_699/A[5] ), .Y(n1432) );
  INVX8 U1601 ( .A(n1951), .Y(\gt_699/A[5] ) );
  AO22X4 U1602 ( .A0(\gt_699/A[8] ), .A1(n2022), .B0(n2021), .B1(n2012), .Y(
        D[8]) );
  INVX12 U1603 ( .A(n1905), .Y(n1909) );
  AO22X2 U1604 ( .A0(n1431), .A1(n2022), .B0(n2021), .B1(n2017), .Y(D[3]) );
  AO22X4 U1605 ( .A0(n2002), .A1(\gt_699/A[2] ), .B0(n1306), .B1(n1998), .Y(
        B[2]) );
  AO22X2 U1606 ( .A0(n2002), .A1(n1995), .B0(n2001), .B1(n1432), .Y(A[5]) );
  INVX12 U1607 ( .A(n1322), .Y(\gt_699/A[7] ) );
  AO22X2 U1608 ( .A0(n2022), .A1(n2020), .B0(n2021), .B1(\gt_699/A[0] ), .Y(
        C[0]) );
  NAND2X6 U1609 ( .A(\geofence_X_reg[1][5] ), .B(n1876), .Y(n1886) );
  AND2X8 U1610 ( .A(N2450), .B(n1410), .Y(area_reg[10]) );
  OAI211X4 U1611 ( .A0(n887), .A1(n1331), .B0(n1699), .C0(n1698), .Y(
        \geofence_X_reg[1][8] ) );
  INVX20 U1612 ( .A(n1944), .Y(\gt_699/A[4] ) );
  NAND2X8 U1613 ( .A(N2256), .B(n1413), .Y(n1944) );
  INVX1 U1614 ( .A(n1328), .Y(n1974) );
  AO22X4 U1615 ( .A0(n2002), .A1(n2000), .B0(n2001), .B1(\gt_699/A[0] ), .Y(
        A[0]) );
  NAND2X8 U1616 ( .A(n1362), .B(n1646), .Y(n1792) );
  CLKBUFX20 U1617 ( .A(n1792), .Y(n1371) );
  CLKAND2X12 U1618 ( .A(N2453), .B(n1410), .Y(area_reg[13]) );
  NAND4BX2 U1619 ( .AN(n1970), .B(n1328), .C(n1969), .D(n1968), .Y(n1971) );
  OAI211X4 U1620 ( .A0(n908), .A1(n1800), .B0(n1761), .C0(n1760), .Y(
        \geofence_Y_reg[0][7] ) );
  AOI222X1 U1621 ( .A0(n1374), .A1(n1759), .B0(n1795), .B1(n1758), .C0(n1376), 
        .C1(n1757), .Y(n1760) );
  CLKAND2X12 U1622 ( .A(N2238), .B(n1418), .Y(side_length_before[19]) );
  AO22X4 U1623 ( .A0(n2002), .A1(n1998), .B0(n2001), .B1(\gt_699/A[2] ), .Y(
        A[2]) );
  AO22X4 U1624 ( .A0(n2022), .A1(n2012), .B0(\gt_699/A[8] ), .B1(n2021), .Y(
        C[8]) );
  AO22X4 U1625 ( .A0(\gt_699/A[0] ), .A1(n2022), .B0(n2021), .B1(n2020), .Y(
        D[0]) );
  CLKAND2X6 U1626 ( .A(n1431), .B(n2021), .Y(n1317) );
  AOI21X4 U1627 ( .A0(\geofence_Y_reg[1][1] ), .A1(n1915), .B0(
        \geofence_Y_reg[1][0] ), .Y(n1917) );
  NAND2X1 U1628 ( .A(side_length_after[3]), .B(n1958), .Y(n1963) );
  AOI222X2 U1629 ( .A0(n1797), .A1(n1784), .B0(n1795), .B1(n1783), .C0(n1376), 
        .C1(n1782), .Y(n1785) );
  CLKINVX3 U1630 ( .A(\geofence_Y_reg[0][1] ), .Y(n1915) );
  BUFX8 U1631 ( .A(n1972), .Y(n1322) );
  AO22X4 U1632 ( .A0(n2002), .A1(\gt_699/A[6] ), .B0(n2001), .B1(n1994), .Y(
        B[6]) );
  AO22X4 U1633 ( .A0(n2002), .A1(n1992), .B0(n2001), .B1(\gt_699/A[8] ), .Y(
        A[8]) );
  AO22X4 U1634 ( .A0(n2002), .A1(\gt_699/A[8] ), .B0(n2001), .B1(n1992), .Y(
        B[8]) );
  NAND2X1 U1635 ( .A(n1376), .B(n1777), .Y(n1315) );
  CLKINVX12 U1636 ( .A(n1953), .Y(\gt_699/A[6] ) );
  AO22X4 U1637 ( .A0(N2302), .A1(n1326), .B0(N2290), .B1(n1384), .Y(E[0]) );
  NAND2X8 U1638 ( .A(N2381), .B(N2376), .Y(n1988) );
  OA22X1 U1639 ( .A0(n1954), .A1(n1348), .B0(side_length_after[6]), .B1(n1953), 
        .Y(n1973) );
  NAND2X6 U1640 ( .A(N2262), .B(n1413), .Y(n1947) );
  AND2X4 U1641 ( .A(n1922), .B(n1921), .Y(n1926) );
  AO22X4 U1642 ( .A0(n2022), .A1(n2011), .B0(n1433), .B1(n2021), .Y(C[9]) );
  AOI222X2 U1643 ( .A0(n1733), .A1(\geofence_Y[1][2] ), .B0(n1380), .B1(n1783), 
        .C0(n1730), .C1(n1671), .Y(n1672) );
  OR2X6 U1644 ( .A(n1316), .B(n1317), .Y(C[3]) );
  AND2X8 U1645 ( .A(N2459), .B(n1417), .Y(area_reg[19]) );
  NAND2X8 U1646 ( .A(n1343), .B(n1403), .Y(n1645) );
  NOR2BX4 U1647 ( .AN(\geofence_X_reg[0][1] ), .B(\geofence_X_reg[1][1] ), .Y(
        n1879) );
  AND2X6 U1648 ( .A(N2455), .B(n1415), .Y(area_reg[15]) );
  NAND2X2 U1649 ( .A(n2007), .B(n1553), .Y(n1646) );
  AND2X2 U1650 ( .A(n2022), .B(n2017), .Y(n1316) );
  OAI211X4 U1651 ( .A0(n907), .A1(n1800), .B0(n1756), .C0(n1755), .Y(
        \geofence_Y_reg[0][8] ) );
  CLKINVX3 U1652 ( .A(\geofence_X_reg[0][8] ), .Y(n1873) );
  OAI211X4 U1653 ( .A0(n857), .A1(n1800), .B0(n1561), .C0(n1560), .Y(
        \geofence_X_reg[0][8] ) );
  AOI222X2 U1654 ( .A0(n1733), .A1(\geofence_X[1][2] ), .B0(n1732), .B1(n1721), 
        .C0(n1730), .C1(n1720), .Y(n1722) );
  AND2X8 U1655 ( .A(N2373), .B(n1415), .Y(area_sqrt2_before[21]) );
  AO22X4 U1656 ( .A0(n2002), .A1(\gt_699/A[0] ), .B0(n2001), .B1(n2000), .Y(
        B[0]) );
  OAI211X4 U1657 ( .A0(n890), .A1(n1331), .B0(n1711), .C0(n1710), .Y(
        \geofence_X_reg[1][5] ) );
  AOI222X2 U1658 ( .A0(n1374), .A1(n1587), .B0(n1795), .B1(n1725), .C0(n1376), 
        .C1(n1586), .Y(n1588) );
  NAND2X4 U1659 ( .A(n1413), .B(n1906), .Y(n1907) );
  AOI222X2 U1660 ( .A0(n1733), .A1(\geofence_X[1][1] ), .B0(n1380), .B1(n1725), 
        .C0(n1730), .C1(n1724), .Y(n1726) );
  OAI31X4 U1661 ( .A0(n799), .A1(n1553), .A2(n1552), .B0(n1819), .Y(n1797) );
  AO22X4 U1662 ( .A0(n2002), .A1(n1433), .B0(n2001), .B1(n1991), .Y(B[9]) );
  AND3X8 U1663 ( .A(n1466), .B(n1403), .C(n1361), .Y(n1339) );
  NAND3BX1 U1664 ( .AN(n2007), .B(n1648), .C(n1647), .Y(n1872) );
  AOI222X2 U1665 ( .A0(n1733), .A1(\geofence_Y[1][0] ), .B0(n1380), .B1(n1794), 
        .C0(n1730), .C1(n1677), .Y(n1678) );
  AO22X4 U1666 ( .A0(\gt_699/A[2] ), .A1(n2022), .B0(n2021), .B1(n2018), .Y(
        D[2]) );
  AO22X4 U1667 ( .A0(n2022), .A1(n2018), .B0(\gt_699/A[2] ), .B1(n2021), .Y(
        C[2]) );
  BUFX20 U1668 ( .A(\gt_699/A[9] ), .Y(n1433) );
  BUFX20 U1669 ( .A(n1986), .Y(n1384) );
  NAND2X8 U1670 ( .A(N2258), .B(n1413), .Y(n1953) );
  AO22X4 U1671 ( .A0(n2002), .A1(n1999), .B0(n2001), .B1(n1430), .Y(A[1]) );
  OAI211X4 U1672 ( .A0(n909), .A1(n1800), .B0(n1766), .C0(n1765), .Y(
        \geofence_Y_reg[0][6] ) );
  OAI211X4 U1673 ( .A0(n941), .A1(n1331), .B0(n1667), .C0(n1666), .Y(
        \geofence_Y_reg[1][4] ) );
  AO22X4 U1674 ( .A0(n2002), .A1(n1991), .B0(n2001), .B1(n1433), .Y(A[9]) );
  NAND2BX2 U1675 ( .AN(n2006), .B(n2005), .Y(n2008) );
  OAI211X4 U1676 ( .A0(n892), .A1(n1331), .B0(n1719), .C0(n1718), .Y(
        \geofence_X_reg[1][3] ) );
  AO22X4 U1677 ( .A0(N2161), .A1(n1352), .B0(N2151), .B1(n1350), .Y(Y_REG[2])
         );
  OAI211X4 U1678 ( .A0(n910), .A1(n1800), .B0(n1771), .C0(n1770), .Y(
        \geofence_Y_reg[0][5] ) );
  NAND2XL U1679 ( .A(side_length_after[8]), .B(n1975), .Y(n1980) );
  INVX1 U1680 ( .A(side_length_after[8]), .Y(n1950) );
  AO22X4 U1681 ( .A0(n2002), .A1(n1994), .B0(n2001), .B1(\gt_699/A[6] ), .Y(
        A[6]) );
  OAI211X4 U1682 ( .A0(n889), .A1(n1331), .B0(n1707), .C0(n1706), .Y(
        \geofence_X_reg[1][6] ) );
  AND2X2 U1683 ( .A(n1924), .B(n1923), .Y(n1925) );
  CLKINVX4 U1684 ( .A(\geofence_X_reg[1][3] ), .Y(n1884) );
  INVX1 U1685 ( .A(\geofence_Y_reg[1][4] ), .Y(n1928) );
  AND3X6 U1686 ( .A(n1344), .B(n800), .C(n1551), .Y(n1343) );
  AO22X4 U1687 ( .A0(\gt_699/A[6] ), .A1(n2022), .B0(n2021), .B1(n2014), .Y(
        D[6]) );
  AO22X4 U1688 ( .A0(n2002), .A1(n1996), .B0(n2001), .B1(\gt_699/A[4] ), .Y(
        A[4]) );
  NAND2X2 U1689 ( .A(N2259), .B(n1412), .Y(n1972) );
  NAND2X8 U1690 ( .A(n1473), .B(n1412), .Y(n1820) );
  CLKAND2X12 U1691 ( .A(N2454), .B(n1417), .Y(area_reg[14]) );
  OAI211X4 U1692 ( .A0(n915), .A1(n1800), .B0(n1799), .C0(n1798), .Y(
        \geofence_Y_reg[0][0] ) );
  OAI211X4 U1693 ( .A0(n943), .A1(n1331), .B0(n1673), .C0(n1672), .Y(
        \geofence_Y_reg[1][2] ) );
  CLKAND2X12 U1694 ( .A(N2452), .B(n1408), .Y(area_reg[12]) );
  AND2X8 U1695 ( .A(N2372), .B(n1415), .Y(area_sqrt2_before[20]) );
  OR2X8 U1696 ( .A(n1890), .B(n1889), .Y(n1311) );
  OAI211X4 U1697 ( .A0(n888), .A1(n1331), .B0(n1703), .C0(n1702), .Y(
        \geofence_X_reg[1][7] ) );
  OA22X1 U1698 ( .A0(n752), .A1(n1354), .B0(n878), .B1(n1379), .Y(n1703) );
  AO22X4 U1699 ( .A0(N2127), .A1(n1909), .B0(N2117), .B1(n1908), .Y(X_REG[0])
         );
  CLKINVX12 U1700 ( .A(n1907), .Y(n1908) );
  AO21X2 U1701 ( .A0(n1360), .A1(n1646), .B0(n1549), .Y(n1550) );
  AND2X4 U1702 ( .A(n1885), .B(n1884), .Y(n1889) );
  AOI21X4 U1703 ( .A0(n1917), .A1(\geofence_Y_reg[0][0] ), .B0(n1916), .Y(
        n1919) );
  NAND4X4 U1704 ( .A(n1900), .B(n1899), .C(n1898), .D(n1897), .Y(n1901) );
  NAND2X8 U1705 ( .A(N2376), .B(N2375), .Y(n2005) );
  BUFX20 U1706 ( .A(n1411), .Y(n1407) );
  OAI211X4 U1707 ( .A0(n865), .A1(n1800), .B0(n1593), .C0(n1592), .Y(
        \geofence_X_reg[0][0] ) );
  OAI211X4 U1708 ( .A0(n859), .A1(n1800), .B0(n1569), .C0(n1568), .Y(
        \geofence_X_reg[0][6] ) );
  AO22X2 U1709 ( .A0(n2022), .A1(n2014), .B0(\gt_699/A[6] ), .B1(n2021), .Y(
        C[6]) );
  NAND3BX2 U1710 ( .AN(n1805), .B(n1648), .C(n1647), .Y(n1377) );
  AND2X8 U1711 ( .A(N2285), .B(n1417), .Y(area_sqrt1_before[21]) );
  OA22X4 U1712 ( .A0(n953), .A1(n1370), .B0(n933), .B1(n1371), .Y(n1786) );
  OAI211X4 U1713 ( .A0(n913), .A1(n1800), .B0(n1786), .C0(n1785), .Y(
        \geofence_Y_reg[0][2] ) );
  NAND2X8 U1714 ( .A(n768), .B(n1325), .Y(n1553) );
  OAI211X4 U1715 ( .A0(n863), .A1(n1800), .B0(n1585), .C0(n1584), .Y(
        \geofence_X_reg[0][2] ) );
  AO21X4 U1716 ( .A0(n2003), .A1(n2005), .B0(n2007), .Y(n2004) );
  NOR2BX2 U1717 ( .AN(\geofence_X_reg[1][2] ), .B(\geofence_X_reg[0][2] ), .Y(
        n1883) );
  AO21X4 U1718 ( .A0(n2009), .A1(n2008), .B0(n2007), .Y(n1356) );
  BUFX20 U1719 ( .A(n2026), .Y(n1412) );
  OAI21X4 U1720 ( .A0(n1883), .A1(n1882), .B0(n1881), .Y(n1885) );
  OAI2BB1X4 U1721 ( .A0N(N2483), .A1N(n1413), .B0(n1337), .Y(n2065) );
  AND2X2 U1722 ( .A(n1795), .B(n1773), .Y(n1308) );
  CLKAND2X3 U1723 ( .A(n1376), .B(n1772), .Y(n1309) );
  OAI211X4 U1724 ( .A0(n861), .A1(n1800), .B0(n1577), .C0(n1576), .Y(
        \geofence_X_reg[0][4] ) );
  OA21X2 U1725 ( .A0(n939), .A1(n1331), .B0(n1661), .Y(n1312) );
  NAND2X4 U1726 ( .A(\geofence_Y_reg[1][6] ), .B(n1930), .Y(n1924) );
  NAND2X1 U1727 ( .A(n1795), .B(n1778), .Y(n1314) );
  AND2XL U1728 ( .A(\gt_699/A[7] ), .B(n2021), .Y(n1319) );
  OR2X4 U1729 ( .A(n1318), .B(n1319), .Y(C[7]) );
  INVXL U1730 ( .A(n2007), .Y(n1321) );
  OAI211X4 U1731 ( .A0(n860), .A1(n1800), .B0(n1573), .C0(n1572), .Y(
        \geofence_X_reg[0][5] ) );
  CLKINVX3 U1732 ( .A(\geofence_X_reg[0][7] ), .Y(n1896) );
  OAI211X4 U1733 ( .A0(n858), .A1(n1800), .B0(n1565), .C0(n1564), .Y(
        \geofence_X_reg[0][7] ) );
  OAI211X4 U1734 ( .A0(n891), .A1(n1331), .B0(n1715), .C0(n1714), .Y(
        \geofence_X_reg[1][4] ) );
  OAI211X4 U1735 ( .A0(n912), .A1(n1800), .B0(n1781), .C0(n1780), .Y(
        \geofence_Y_reg[0][3] ) );
  NAND2X4 U1736 ( .A(\geofence_Y_reg[1][5] ), .B(n1913), .Y(n1923) );
  CLKINVX3 U1737 ( .A(\geofence_Y_reg[1][5] ), .Y(n1914) );
  OAI211X4 U1738 ( .A0(n940), .A1(n1331), .B0(n1664), .C0(n1323), .Y(
        \geofence_Y_reg[1][5] ) );
  NAND2BX4 U1739 ( .AN(n1988), .B(n2005), .Y(n2003) );
  OAI211X4 U1740 ( .A0(n942), .A1(n1331), .B0(n1670), .C0(n1669), .Y(
        \geofence_Y_reg[1][3] ) );
  BUFX20 U1741 ( .A(n1407), .Y(n1413) );
  NAND3BX1 U1742 ( .AN(state[2]), .B(n1475), .C(n1471), .Y(n1804) );
  NAND3BX1 U1743 ( .AN(n768), .B(state[2]), .C(n1471), .Y(n2027) );
  CLKAND2X12 U1744 ( .A(valid), .B(area[22]), .Y(is_inside) );
  INVX16 U1745 ( .A(n2027), .Y(valid) );
  AOI21X4 U1746 ( .A0(n1880), .A1(\geofence_X_reg[0][0] ), .B0(n1879), .Y(
        n1882) );
  CLKINVX1 U1747 ( .A(\geofence_Y_reg[1][3] ), .Y(n1921) );
  CLKINVX12 U1748 ( .A(n1946), .Y(\gt_699/A[0] ) );
  AND2X8 U1749 ( .A(n1645), .B(n1375), .Y(n1353) );
  NAND2BX1 U1750 ( .AN(\geofence_Y_reg[1][2] ), .B(\geofence_Y_reg[0][2] ), 
        .Y(n1918) );
  AND2X8 U1751 ( .A(n1819), .B(n1820), .Y(n1329) );
  CLKINVX8 U1752 ( .A(n1467), .Y(n1473) );
  INVXL U1753 ( .A(n1412), .Y(n1327) );
  INVX20 U1754 ( .A(n1353), .Y(n1795) );
  OAI221X2 U1755 ( .A0(\geofence_Y_reg[0][4] ), .A1(n1928), .B0(n1927), .B1(
        n1926), .C0(n1925), .Y(n1929) );
  OA21X4 U1756 ( .A0(n1921), .A1(n1922), .B0(\geofence_Y_reg[0][3] ), .Y(n1927) );
  OA21X4 U1757 ( .A0(n1884), .A1(n1885), .B0(\geofence_X_reg[0][3] ), .Y(n1890) );
  OAI2BB1XL U1758 ( .A0N(n1804), .A1N(n2027), .B0(n1472), .Y(n1480) );
  OA22XL U1759 ( .A0(n898), .A1(n1370), .B0(n878), .B1(n1371), .Y(n1565) );
  CLKINVX8 U1760 ( .A(n1647), .Y(n1344) );
  NAND3BXL U1761 ( .AN(n1804), .B(store_counter[2]), .C(n1548), .Y(n394) );
  CLKAND2X8 U1762 ( .A(N2456), .B(n1417), .Y(area_reg[16]) );
  NOR2X8 U1763 ( .A(n1384), .B(n1327), .Y(n1326) );
  AND2XL U1764 ( .A(N2221), .B(n1417), .Y(side_length_before[2]) );
  BUFX12 U1765 ( .A(\gt_699/A[11] ), .Y(n1434) );
  INVX3 U1766 ( .A(n1983), .Y(\gt_699/A[11] ) );
  NAND2XL U1767 ( .A(side_length_after[7]), .B(n1322), .Y(n1328) );
  CLKBUFX2 U1768 ( .A(n1410), .Y(n1408) );
  AND2X8 U1769 ( .A(n1846), .B(n1645), .Y(n1354) );
  AND2XL U1770 ( .A(n2001), .B(n1434), .Y(A[11]) );
  AOI21X1 U1771 ( .A0(n1391), .A1(n1489), .B0(n1488), .Y(n1330) );
  CLKBUFX3 U1772 ( .A(n1803), .Y(n1368) );
  CLKINVX16 U1773 ( .A(n1359), .Y(n1400) );
  INVX1 U1774 ( .A(\geofence_X_reg[1][8] ), .Y(n1874) );
  INVXL U1775 ( .A(\geofence_Y_reg[0][7] ), .Y(n1933) );
  CLKINVX4 U1776 ( .A(\geofence_Y_reg[0][8] ), .Y(n1910) );
  BUFX12 U1777 ( .A(n1872), .Y(n1375) );
  INVX1 U1778 ( .A(\geofence_Y_reg[1][8] ), .Y(n1911) );
  NOR2X1 U1779 ( .A(n2031), .B(n1208), .Y(n434) );
  CLKINVX1 U1780 ( .A(n1363), .Y(n1388) );
  OA21XL U1781 ( .A0(n432), .A1(n1499), .B0(n1498), .Y(n1332) );
  CLKINVX1 U1782 ( .A(n237), .Y(n1441) );
  CLKINVX1 U1783 ( .A(n155), .Y(n1453) );
  AO22X1 U1784 ( .A0(n1406), .A1(\geofence_X_reg[0][7] ), .B0(N1858), .B1(
        n1389), .Y(F[7]) );
  INVX3 U1785 ( .A(n435), .Y(n2095) );
  OAI21XL U1786 ( .A0(n360), .A1(n1499), .B0(n361), .Y(n1490) );
  CLKINVX2 U1787 ( .A(n1359), .Y(n1399) );
  AOI22X1 U1788 ( .A0(N2509), .A1(n1401), .B0(area[20]), .B1(n2024), .Y(n1333)
         );
  AOI22X1 U1789 ( .A0(N2507), .A1(n1401), .B0(area[18]), .B1(n2024), .Y(n1334)
         );
  AOI22X1 U1790 ( .A0(N2511), .A1(n1401), .B0(n2024), .B1(area[22]), .Y(n1335)
         );
  AOI22X1 U1791 ( .A0(N2508), .A1(n1404), .B0(area[19]), .B1(n2024), .Y(n1336)
         );
  AO21X4 U1792 ( .A0(N2487), .A1(n1408), .B0(n2023), .Y(n2061) );
  AOI22X1 U1793 ( .A0(N2506), .A1(n1401), .B0(area[17]), .B1(n2024), .Y(n1337)
         );
  OA22XL U1794 ( .A0(n748), .A1(n1354), .B0(n882), .B1(n1379), .Y(n1719) );
  OAI2BB1XL U1795 ( .A0N(N2481), .A1N(n1413), .B0(n1338), .Y(n2067) );
  AOI22X1 U1796 ( .A0(N2504), .A1(n1401), .B0(area[15]), .B1(n2024), .Y(n1338)
         );
  AOI22X1 U1797 ( .A0(N2502), .A1(n1401), .B0(area[13]), .B1(n2024), .Y(n1340)
         );
  AOI22X1 U1798 ( .A0(N2503), .A1(n1401), .B0(area[14]), .B1(n2024), .Y(n1341)
         );
  AOI22X1 U1799 ( .A0(N2499), .A1(n1401), .B0(area[10]), .B1(n2024), .Y(n1342)
         );
  OAI2BB1X1 U1800 ( .A0N(N2477), .A1N(n1416), .B0(n1345), .Y(n2071) );
  AOI22X1 U1801 ( .A0(N2500), .A1(n1401), .B0(area[11]), .B1(n2024), .Y(n1345)
         );
  OAI2BB1X1 U1802 ( .A0N(N2474), .A1N(n1415), .B0(n1346), .Y(n2074) );
  AOI22X1 U1803 ( .A0(N2497), .A1(n1401), .B0(area[8]), .B1(n2024), .Y(n1346)
         );
  OAI221XL U1804 ( .A0(n1386), .A1(n885), .B0(n1387), .B1(n875), .C0(n1691), 
        .Y(N1910) );
  NOR2X1 U1805 ( .A(n797), .B(\store_counter2[1] ), .Y(n362) );
  OA21XL U1806 ( .A0(n392), .A1(n1499), .B0(n1496), .Y(n1347) );
  OAI221XL U1807 ( .A0(n935), .A1(n1386), .B0(n925), .B1(n1387), .C0(n1644), 
        .Y(N1880) );
  OAI221XL U1808 ( .A0(n895), .A1(n2095), .B0(n885), .B1(n2059), .C0(n1547), 
        .Y(N1850) );
  NOR2X1 U1809 ( .A(n2031), .B(\store_counter2[1] ), .Y(n363) );
  NOR2X1 U1810 ( .A(n1208), .B(n797), .Y(n435) );
  OAI221XL U1811 ( .A0(n945), .A1(n2095), .B0(n935), .B1(n2059), .C0(n1746), 
        .Y(N1940) );
  CLKBUFX3 U1812 ( .A(n2094), .Y(n1369) );
  NAND3BXL U1813 ( .AN(n1418), .B(n1464), .C(n1463), .Y(n1168) );
  NOR2X1 U1814 ( .A(n766), .B(n767), .Y(n365) );
  INVXL U1815 ( .A(side_length_after[3]), .Y(n1960) );
  CLKINVX1 U1816 ( .A(side_length_after[4]), .Y(n1967) );
  INVXL U1817 ( .A(side_length_after[2]), .Y(n1961) );
  INVXL U1818 ( .A(side_length_after[9]), .Y(n1949) );
  AND2X2 U1819 ( .A(N2460), .B(n1415), .Y(area_reg[20]) );
  AND2X2 U1820 ( .A(N2447), .B(n1414), .Y(area_reg[7]) );
  AND2X2 U1821 ( .A(N2462), .B(n1409), .Y(area_reg[22]) );
  AND2X2 U1822 ( .A(N2441), .B(n1409), .Y(area_reg[1]) );
  AND2X2 U1823 ( .A(N2440), .B(n1415), .Y(area_reg[0]) );
  AND2X2 U1824 ( .A(N2367), .B(n1415), .Y(area_sqrt2_before[15]) );
  AND2X2 U1825 ( .A(N2366), .B(n1415), .Y(area_sqrt2_before[14]) );
  AND2X2 U1826 ( .A(N2232), .B(n1418), .Y(side_length_before[13]) );
  AND2X2 U1827 ( .A(N2364), .B(n1414), .Y(area_sqrt2_before[12]) );
  AND2X2 U1828 ( .A(N2277), .B(n1416), .Y(area_sqrt1_before[13]) );
  AND2X2 U1829 ( .A(N2276), .B(n1416), .Y(area_sqrt1_before[12]) );
  AND2X2 U1830 ( .A(N2229), .B(n1418), .Y(side_length_before[10]) );
  AND2X2 U1831 ( .A(N2363), .B(n1414), .Y(area_sqrt2_before[11]) );
  AND2X2 U1832 ( .A(N2362), .B(n1414), .Y(area_sqrt2_before[10]) );
  AND2X2 U1833 ( .A(N2275), .B(n1416), .Y(area_sqrt1_before[11]) );
  AND2X2 U1834 ( .A(N2227), .B(n1417), .Y(side_length_before[8]) );
  AND2X2 U1835 ( .A(N2228), .B(n1418), .Y(side_length_before[9]) );
  AND2X2 U1836 ( .A(N2361), .B(n1415), .Y(area_sqrt2_before[9]) );
  AND2X2 U1837 ( .A(N2360), .B(n1414), .Y(area_sqrt2_before[8]) );
  AND2X2 U1838 ( .A(N2272), .B(n1416), .Y(area_sqrt1_before[8]) );
  AND2X2 U1839 ( .A(N2273), .B(n1416), .Y(area_sqrt1_before[9]) );
  AND2X2 U1840 ( .A(N2359), .B(n1414), .Y(area_sqrt2_before[7]) );
  AND2X2 U1841 ( .A(N2226), .B(n1417), .Y(side_length_before[7]) );
  AND2X2 U1842 ( .A(N2225), .B(n1417), .Y(side_length_before[6]) );
  AND2X2 U1843 ( .A(N2358), .B(n1414), .Y(area_sqrt2_before[6]) );
  AND2X2 U1844 ( .A(N2271), .B(n1416), .Y(area_sqrt1_before[7]) );
  AND2X2 U1845 ( .A(N2357), .B(n1414), .Y(area_sqrt2_before[5]) );
  AND2X2 U1846 ( .A(N2224), .B(n1417), .Y(side_length_before[5]) );
  AND2X2 U1847 ( .A(N2223), .B(n1417), .Y(side_length_before[4]) );
  AND2X2 U1848 ( .A(N2355), .B(n1414), .Y(area_sqrt2_before[3]) );
  AND2X2 U1849 ( .A(N2222), .B(n1417), .Y(side_length_before[3]) );
  AND2X2 U1850 ( .A(N2354), .B(n1414), .Y(area_sqrt2_before[2]) );
  AND2X2 U1851 ( .A(N2353), .B(n1414), .Y(area_sqrt2_before[1]) );
  CLKBUFX3 U1852 ( .A(n1456), .Y(n1459) );
  CLKBUFX3 U1853 ( .A(n1457), .Y(n1458) );
  INVXL U1854 ( .A(n1976), .Y(n1985) );
  AOI32X4 U1855 ( .A0(\gt_699/A[8] ), .A1(n1977), .A2(n1950), .B0(n1433), .B1(
        n1949), .Y(n1984) );
  CLKBUFX3 U1856 ( .A(n1409), .Y(n1418) );
  AND2X2 U1857 ( .A(N2270), .B(n1416), .Y(area_sqrt1_before[6]) );
  AND2X2 U1858 ( .A(N2269), .B(n1416), .Y(area_sqrt1_before[5]) );
  AND2X2 U1859 ( .A(N2268), .B(n1416), .Y(area_sqrt1_before[4]) );
  CLKBUFX3 U1860 ( .A(n1409), .Y(n1417) );
  AND2X2 U1861 ( .A(N2267), .B(n1415), .Y(area_sqrt1_before[3]) );
  AND2X2 U1862 ( .A(N2266), .B(n1415), .Y(area_sqrt1_before[2]) );
  AND2X2 U1863 ( .A(N2219), .B(n1417), .Y(side_length_before[0]) );
  AND2X2 U1864 ( .A(N2265), .B(n1415), .Y(area_sqrt1_before[1]) );
  CLKBUFX3 U1865 ( .A(n1408), .Y(n1415) );
  CLKBUFX3 U1866 ( .A(n1408), .Y(n1416) );
  CLKBUFX3 U1867 ( .A(n153), .Y(n1456) );
  CLKBUFX3 U1868 ( .A(n1457), .Y(n1460) );
  CLKBUFX3 U1869 ( .A(n153), .Y(n1457) );
  INVX3 U1870 ( .A(n1397), .Y(n1395) );
  INVX3 U1871 ( .A(n1397), .Y(n1396) );
  CLKBUFX3 U1872 ( .A(n1418), .Y(n1414) );
  CLKBUFX3 U1873 ( .A(n1442), .Y(n1443) );
  CLKBUFX3 U1874 ( .A(n1446), .Y(n1447) );
  CLKBUFX3 U1875 ( .A(n154), .Y(n1454) );
  CLKBUFX3 U1876 ( .A(n154), .Y(n1455) );
  CLKBUFX3 U1877 ( .A(n1444), .Y(n1445) );
  AOI32X1 U1878 ( .A0(\gt_699/A[4] ), .A1(n1969), .A2(n1967), .B0(n1432), .B1(
        n1952), .Y(n1954) );
  INVXL U1879 ( .A(side_length_after[5]), .Y(n1952) );
  AOI32X1 U1880 ( .A0(n1966), .A1(n1965), .A2(n1964), .B0(n1963), .B1(n1962), 
        .Y(n1970) );
  NAND2XL U1881 ( .A(side_length_after[1]), .B(n1955), .Y(n1966) );
  AO22X1 U1882 ( .A0(\gt_699/A[0] ), .A1(n1957), .B0(n1430), .B1(n1956), .Y(
        n1965) );
  INVXL U1883 ( .A(side_length_after[1]), .Y(n1956) );
  INVXL U1884 ( .A(side_length_after[0]), .Y(n1957) );
  NAND2XL U1885 ( .A(N2263), .B(n1412), .Y(n1983) );
  CLKBUFX3 U1886 ( .A(n1389), .Y(n1391) );
  AND2X2 U1887 ( .A(n333), .B(n1390), .Y(n1349) );
  CLKINVX1 U1888 ( .A(n1349), .Y(n153) );
  INVX3 U1889 ( .A(n1452), .Y(n1448) );
  CLKBUFX3 U1890 ( .A(n1330), .Y(n1423) );
  CLKBUFX3 U1891 ( .A(n1330), .Y(n1424) );
  INVX3 U1892 ( .A(n1451), .Y(n1449) );
  INVX3 U1893 ( .A(n1451), .Y(n1450) );
  INVX3 U1894 ( .A(n1439), .Y(n1437) );
  INVX3 U1895 ( .A(n1439), .Y(n1438) );
  CLKBUFX3 U1896 ( .A(n1393), .Y(n1398) );
  INVX3 U1897 ( .A(n1440), .Y(n1435) );
  INVX3 U1898 ( .A(n1439), .Y(n1436) );
  CLKBUFX3 U1899 ( .A(n1392), .Y(n1397) );
  CLKBUFX3 U1900 ( .A(n1401), .Y(n1404) );
  CLKBUFX3 U1901 ( .A(n1401), .Y(n1405) );
  AND2X2 U1902 ( .A(N1810), .B(n1404), .Y(area_6_reg[1]) );
  AND2X2 U1903 ( .A(N1809), .B(n1404), .Y(area_6_reg[0]) );
  CLKBUFX3 U1904 ( .A(n235), .Y(n1442) );
  CLKBUFX3 U1905 ( .A(n179), .Y(n1446) );
  CLKBUFX3 U1906 ( .A(n203), .Y(n1444) );
  CLKBUFX3 U1907 ( .A(n2029), .Y(n1381) );
  CLKINVX1 U1908 ( .A(n1368), .Y(n2029) );
  CLKBUFX3 U1909 ( .A(n1419), .Y(n1420) );
  CLKBUFX3 U1910 ( .A(n1869), .Y(n1383) );
  CLKBUFX3 U1911 ( .A(n2034), .Y(n1428) );
  CLKBUFX3 U1912 ( .A(n2034), .Y(n1429) );
  AND2X8 U1913 ( .A(n1400), .B(n1649), .Y(n1351) );
  AND2XL U1914 ( .A(n1434), .B(n2022), .Y(D[11]) );
  CLKBUFX3 U1915 ( .A(n1390), .Y(n1389) );
  NAND2BX1 U1916 ( .AN(N1828), .B(n106), .Y(n366) );
  CLKBUFX3 U1917 ( .A(n1332), .Y(n1425) );
  CLKBUFX3 U1918 ( .A(n1332), .Y(n1426) );
  INVX3 U1919 ( .A(n1367), .Y(n1640) );
  NOR2X1 U1920 ( .A(n1745), .B(N1828), .Y(n333) );
  CLKBUFX3 U1921 ( .A(n1453), .Y(n1452) );
  CLKINVX1 U1922 ( .A(n1487), .Y(n1488) );
  CLKINVX1 U1923 ( .A(n333), .Y(n1489) );
  INVX3 U1924 ( .A(n560), .Y(n1689) );
  AND2X2 U1925 ( .A(n393), .B(n1388), .Y(n560) );
  CLKBUFX3 U1926 ( .A(n1394), .Y(n1392) );
  CLKBUFX3 U1927 ( .A(n1453), .Y(n1451) );
  CLKBUFX3 U1928 ( .A(n1394), .Y(n1393) );
  CLKBUFX3 U1929 ( .A(n1441), .Y(n1439) );
  CLKBUFX3 U1930 ( .A(n1441), .Y(n1440) );
  CLKBUFX3 U1931 ( .A(n1206), .Y(n1427) );
  INVX4 U1932 ( .A(n434), .Y(n2059) );
  CLKBUFX3 U1933 ( .A(n2025), .Y(n1401) );
  NAND2X1 U1934 ( .A(n1482), .B(n1481), .Y(n1483) );
  NAND2X1 U1935 ( .A(n1495), .B(n1483), .Y(n235) );
  NAND2X1 U1936 ( .A(n1495), .B(n1496), .Y(n179) );
  NAND2X1 U1937 ( .A(n1495), .B(n1487), .Y(n154) );
  CLKINVX1 U1938 ( .A(n1481), .Y(n2033) );
  NAND2X1 U1939 ( .A(n1495), .B(n1498), .Y(n203) );
  NAND2X1 U1940 ( .A(n1495), .B(n1490), .Y(n1803) );
  CLKBUFX3 U1941 ( .A(n2028), .Y(n1419) );
  CLKINVX1 U1942 ( .A(n1464), .Y(n1470) );
  CLKINVX2 U1943 ( .A(n1819), .Y(n1844) );
  CLKINVX2 U1944 ( .A(n1846), .Y(n1868) );
  CLKINVX1 U1945 ( .A(n1821), .Y(n1869) );
  CLKBUFX3 U1946 ( .A(n1843), .Y(n1382) );
  NAND2XL U1947 ( .A(n1846), .B(n1820), .Y(n1843) );
  AOI21X4 U1948 ( .A0(n1360), .A1(n1406), .B0(n1870), .Y(n1355) );
  INVXL U1949 ( .A(n1924), .Y(n1932) );
  INVXL U1950 ( .A(n1820), .Y(n1549) );
  INVX12 U1951 ( .A(n1378), .Y(n1379) );
  AO22X1 U1952 ( .A0(n1433), .A1(n2022), .B0(n2021), .B1(n2011), .Y(D[9]) );
  AO22X1 U1953 ( .A0(n1202), .A1(n2022), .B0(n2021), .B1(n2010), .Y(D[10]) );
  CLKBUFX3 U1954 ( .A(n1801), .Y(n1390) );
  INVXL U1955 ( .A(n1499), .Y(n1801) );
  AO22X1 U1956 ( .A0(n1405), .A1(\geofence_X_reg[1][1] ), .B0(N1912), .B1(
        n1391), .Y(H[1]) );
  AO22X1 U1957 ( .A0(n1405), .A1(\geofence_X_reg[1][3] ), .B0(N1914), .B1(
        n1391), .Y(H[3]) );
  AO22X1 U1958 ( .A0(n1401), .A1(\geofence_X_reg[0][3] ), .B0(N1854), .B1(
        n1390), .Y(F[3]) );
  AO22X1 U1959 ( .A0(n1405), .A1(\geofence_X_reg[1][2] ), .B0(N1913), .B1(
        n1391), .Y(H[2]) );
  AO22X1 U1960 ( .A0(n1401), .A1(\geofence_X_reg[0][2] ), .B0(N1853), .B1(
        n1389), .Y(F[2]) );
  CLKBUFX3 U1961 ( .A(n1347), .Y(n1421) );
  CLKBUFX3 U1962 ( .A(n1347), .Y(n1422) );
  AO22X1 U1963 ( .A0(n1404), .A1(\geofence_Y_reg[0][3] ), .B0(N1944), .B1(
        n1391), .Y(I[3]) );
  AO22X1 U1964 ( .A0(n1405), .A1(\geofence_Y_reg[1][1] ), .B0(N1882), .B1(
        n1390), .Y(G[1]) );
  AO22X1 U1965 ( .A0(n1405), .A1(\geofence_Y_reg[1][3] ), .B0(N1884), .B1(
        n1390), .Y(G[3]) );
  AO22X1 U1966 ( .A0(n1404), .A1(\geofence_Y_reg[0][2] ), .B0(N1943), .B1(
        n1391), .Y(I[2]) );
  NOR2X1 U1967 ( .A(n366), .B(n436), .Y(n432) );
  AO22X1 U1968 ( .A0(n1405), .A1(\geofence_X_reg[1][5] ), .B0(N1916), .B1(
        n1391), .Y(H[5]) );
  AO22X1 U1969 ( .A0(n1404), .A1(\geofence_Y_reg[0][0] ), .B0(N1941), .B1(
        n1389), .Y(I[0]) );
  CLKBUFX3 U1970 ( .A(n157), .Y(n1367) );
  AO21X1 U1971 ( .A0(n359), .A1(n1389), .B0(n1485), .Y(n157) );
  CLKINVX1 U1972 ( .A(n1490), .Y(n1485) );
  AO21X1 U1973 ( .A0(n1745), .A1(n365), .B0(n366), .Y(n359) );
  AO22X1 U1974 ( .A0(n1401), .A1(\geofence_X_reg[0][5] ), .B0(N1856), .B1(
        n1389), .Y(F[5]) );
  AO22X1 U1975 ( .A0(n1405), .A1(\geofence_X_reg[1][0] ), .B0(N1911), .B1(
        n1391), .Y(H[0]) );
  AO22X1 U1976 ( .A0(n1405), .A1(\geofence_Y_reg[1][0] ), .B0(N1881), .B1(
        n1390), .Y(G[0]) );
  AO22X1 U1977 ( .A0(n1405), .A1(\geofence_X_reg[0][0] ), .B0(N1851), .B1(
        n1389), .Y(F[0]) );
  NAND2X1 U1978 ( .A(n367), .B(n1390), .Y(n155) );
  AOI211X1 U1979 ( .A0(n2030), .A1(n2057), .B0(N1828), .C0(n2058), .Y(n367) );
  NOR2X1 U1980 ( .A(n434), .B(n362), .Y(n393) );
  CLKBUFX3 U1981 ( .A(n1802), .Y(n1394) );
  NAND2X1 U1982 ( .A(n430), .B(n1389), .Y(n1802) );
  NOR3X1 U1983 ( .A(n2030), .B(N1828), .C(n2059), .Y(n430) );
  AO22X1 U1984 ( .A0(n1404), .A1(\geofence_Y_reg[0][4] ), .B0(N1945), .B1(
        n1391), .Y(I[4]) );
  NAND2X1 U1985 ( .A(n429), .B(n1391), .Y(n237) );
  NOR4X1 U1986 ( .A(n2030), .B(n2095), .C(n2096), .D(N1828), .Y(n429) );
  AO22X1 U1987 ( .A0(n1405), .A1(\geofence_Y_reg[1][4] ), .B0(N1885), .B1(
        n1390), .Y(G[4]) );
  OAI31XL U1988 ( .A0(n438), .A1(n436), .A2(N1828), .B0(n1390), .Y(n1484) );
  AO22X1 U1989 ( .A0(n1405), .A1(\geofence_X_reg[1][4] ), .B0(N1915), .B1(
        n1391), .Y(H[4]) );
  AO22X1 U1990 ( .A0(n1401), .A1(\geofence_X_reg[0][4] ), .B0(N1855), .B1(
        n1389), .Y(F[4]) );
  AO22X1 U1991 ( .A0(n1404), .A1(\geofence_Y_reg[0][5] ), .B0(N1946), .B1(
        n1391), .Y(I[5]) );
  AO22X1 U1992 ( .A0(n1405), .A1(\geofence_Y_reg[1][5] ), .B0(N1886), .B1(
        n1390), .Y(G[5]) );
  INVX3 U1993 ( .A(n1385), .Y(n1386) );
  CLKINVX1 U1994 ( .A(n556), .Y(n1385) );
  NAND2BX1 U1995 ( .AN(n393), .B(n2031), .Y(n556) );
  INVX3 U1996 ( .A(n1363), .Y(n1387) );
  INVX3 U1997 ( .A(n363), .Y(n1745) );
  INVX4 U1998 ( .A(n362), .Y(n2058) );
  AO22X1 U1999 ( .A0(n1404), .A1(\geofence_Y_reg[0][6] ), .B0(N1947), .B1(
        n1391), .Y(I[6]) );
  AO22X1 U2000 ( .A0(n1405), .A1(\geofence_Y_reg[1][6] ), .B0(N1887), .B1(
        n1390), .Y(G[6]) );
  AO22X1 U2001 ( .A0(n1405), .A1(\geofence_X_reg[1][7] ), .B0(N1918), .B1(
        n1389), .Y(H[7]) );
  AO22X1 U2002 ( .A0(n1405), .A1(\geofence_X_reg[1][6] ), .B0(N1917), .B1(
        n1801), .Y(H[6]) );
  AO22X1 U2003 ( .A0(n1406), .A1(\geofence_X_reg[0][6] ), .B0(N1857), .B1(
        n1389), .Y(F[6]) );
  AO22X1 U2004 ( .A0(n1405), .A1(\geofence_X_reg[1][9] ), .B0(N1920), .B1(
        n1801), .Y(H[9]) );
  AO22X1 U2005 ( .A0(n1404), .A1(\geofence_Y_reg[0][7] ), .B0(N1948), .B1(
        n1391), .Y(I[7]) );
  AO22X1 U2006 ( .A0(n1405), .A1(\geofence_Y_reg[1][7] ), .B0(N1888), .B1(
        n1389), .Y(G[7]) );
  AO22X1 U2007 ( .A0(n1404), .A1(\geofence_X_reg[0][9] ), .B0(N1860), .B1(
        n1389), .Y(F[9]) );
  AO22X1 U2008 ( .A0(n1405), .A1(\geofence_Y_reg[1][8] ), .B0(N1889), .B1(
        n1389), .Y(G[8]) );
  AO22X1 U2009 ( .A0(n1405), .A1(\geofence_X_reg[1][8] ), .B0(N1919), .B1(
        n1390), .Y(H[8]) );
  AO22X1 U2010 ( .A0(n1404), .A1(\geofence_Y_reg[0][8] ), .B0(N1949), .B1(
        n1390), .Y(I[8]) );
  AO22X1 U2011 ( .A0(n1405), .A1(\geofence_X_reg[0][8] ), .B0(N1859), .B1(
        n1389), .Y(F[8]) );
  AND2X2 U2012 ( .A(N1891), .B(n1390), .Y(n1357) );
  AO22X1 U2013 ( .A0(n1406), .A1(\geofence_Y_reg[1][9] ), .B0(N1890), .B1(
        n1389), .Y(G[9]) );
  AND2X2 U2014 ( .A(N1951), .B(n1390), .Y(n1358) );
  AO22X1 U2015 ( .A0(n1404), .A1(\geofence_Y_reg[0][9] ), .B0(N1950), .B1(
        n1391), .Y(I[9]) );
  NAND2X1 U2016 ( .A(n1390), .B(n435), .Y(n1481) );
  AO22X1 U2017 ( .A0(n1494), .A1(n1493), .B0(n1390), .B1(n1492), .Y(n1496) );
  CLKINVX1 U2018 ( .A(n393), .Y(n1492) );
  CLKINVX1 U2019 ( .A(n394), .Y(n1494) );
  AO21X1 U2020 ( .A0(n1486), .A1(n1205), .B0(n1390), .Y(n1487) );
  OAI22XL U2021 ( .A0(n394), .A1(n1493), .B0(n433), .B1(n1499), .Y(n1498) );
  NOR2X1 U2022 ( .A(n434), .B(n435), .Y(n433) );
  NOR2X1 U2023 ( .A(n362), .B(n363), .Y(n360) );
  CLKINVX2 U2024 ( .A(n1804), .Y(n1495) );
  NAND2X1 U2025 ( .A(n1486), .B(store_counter[2]), .Y(n1482) );
  NAND2X1 U2026 ( .A(n2059), .B(n1479), .Y(n771) );
  CLKMX2X2 U2027 ( .A(n1208), .B(n2058), .S0(n1389), .Y(n1479) );
  CLKINVX1 U2028 ( .A(n1369), .Y(n2028) );
  INVX4 U2029 ( .A(n1806), .Y(n2024) );
  NAND2XL U2030 ( .A(n1805), .B(n1804), .Y(n1806) );
  OAI211X1 U2031 ( .A0(n1205), .A1(n1548), .B0(n1495), .C0(n1493), .Y(n1472)
         );
  OAI211X1 U2032 ( .A0(n444), .A1(n1205), .B0(n394), .C0(n361), .Y(n1164) );
  CLKINVX1 U2033 ( .A(n1480), .Y(n444) );
  OAI211XL U2034 ( .A0(n1495), .A1(n1493), .B0(n1472), .C0(n2027), .Y(n1166)
         );
  NAND2X1 U2035 ( .A(n438), .B(n435), .Y(n106) );
  CLKINVX1 U2036 ( .A(n395), .Y(n2057) );
  NAND2BX1 U2037 ( .AN(n365), .B(n2057), .Y(n436) );
  AND3X8 U2038 ( .A(n1466), .B(n1413), .C(n1361), .Y(n1359) );
  AO22X1 U2039 ( .A0(N2510), .A1(n1403), .B0(area[21]), .B1(n2024), .Y(n2023)
         );
  AO22X1 U2040 ( .A0(N2505), .A1(n1401), .B0(area[16]), .B1(n2024), .Y(n1807)
         );
  OA22XL U2041 ( .A0(n904), .A1(n1370), .B0(n884), .B1(n1371), .Y(n1589) );
  OA22XL U2042 ( .A0(n758), .A1(n1354), .B0(n932), .B1(n1379), .Y(n1670) );
  AOI222X1 U2043 ( .A0(n1797), .A1(n1796), .B0(n1795), .B1(n1794), .C0(n1376), 
        .C1(n1793), .Y(n1798) );
  OA22XL U2044 ( .A0(n760), .A1(n1354), .B0(n930), .B1(n1379), .Y(n1664) );
  AO21X1 U2045 ( .A0(N2478), .A1(n1410), .B0(n1808), .Y(n2070) );
  AO22X1 U2046 ( .A0(N2501), .A1(n1404), .B0(area[12]), .B1(n2024), .Y(n1808)
         );
  OA22XL U2047 ( .A0(n897), .A1(n1370), .B0(n877), .B1(n1371), .Y(n1561) );
  AOI222XL U2048 ( .A0(n1797), .A1(n1559), .B0(n1795), .B1(n1697), .C0(n1376), 
        .C1(n1558), .Y(n1560) );
  OA22XL U2049 ( .A0(n952), .A1(n1370), .B0(n932), .B1(n1371), .Y(n1781) );
  OA22XL U2050 ( .A0(n951), .A1(n1370), .B0(n931), .B1(n1371), .Y(n1776) );
  OA22XL U2051 ( .A0(n764), .A1(n1354), .B0(n926), .B1(n1379), .Y(n1652) );
  AOI222XL U2052 ( .A0(n1733), .A1(\geofence_Y[1][9] ), .B0(n1732), .B1(n1748), 
        .C0(n1730), .C1(n1650), .Y(n1651) );
  OA22XL U2053 ( .A0(n754), .A1(n1354), .B0(n876), .B1(n1379), .Y(n1695) );
  OA22XL U2054 ( .A0(n948), .A1(n1370), .B0(n928), .B1(n1371), .Y(n1761) );
  OA22XL U2055 ( .A0(n896), .A1(n1370), .B0(n876), .B1(n1371), .Y(n1557) );
  OA22XL U2056 ( .A0(n946), .A1(n1370), .B0(n926), .B1(n1371), .Y(n1751) );
  AOI222XL U2057 ( .A0(n1374), .A1(n1749), .B0(n1795), .B1(n1748), .C0(n1376), 
        .C1(n1747), .Y(n1750) );
  AO21X1 U2058 ( .A0(N2475), .A1(n1414), .B0(n1809), .Y(n2073) );
  AO22X1 U2059 ( .A0(N2498), .A1(n1401), .B0(area[9]), .B1(n2024), .Y(n1809)
         );
  AO21X1 U2060 ( .A0(N2473), .A1(n1414), .B0(n1810), .Y(n2075) );
  AO22X1 U2061 ( .A0(N2496), .A1(n1403), .B0(area[7]), .B1(n2024), .Y(n1810)
         );
  AO21X1 U2062 ( .A0(N2472), .A1(n1416), .B0(n1811), .Y(n2076) );
  AO22X1 U2063 ( .A0(N2495), .A1(n1403), .B0(area[6]), .B1(n2024), .Y(n1811)
         );
  AO21X1 U2064 ( .A0(N2471), .A1(n1416), .B0(n1812), .Y(n2077) );
  AO22X1 U2065 ( .A0(N2494), .A1(n1403), .B0(area[5]), .B1(n2024), .Y(n1812)
         );
  AO21X1 U2066 ( .A0(N2470), .A1(n1410), .B0(n1813), .Y(n2078) );
  AO22X1 U2067 ( .A0(N2493), .A1(n1403), .B0(area[4]), .B1(n2024), .Y(n1813)
         );
  AO21X1 U2068 ( .A0(N2469), .A1(n1416), .B0(n1814), .Y(n2079) );
  AO22X1 U2069 ( .A0(N2492), .A1(n1403), .B0(area[3]), .B1(n2024), .Y(n1814)
         );
  AO21X1 U2070 ( .A0(N2468), .A1(n1410), .B0(n1815), .Y(n2080) );
  AO22X1 U2071 ( .A0(N2491), .A1(n1403), .B0(area[2]), .B1(n2024), .Y(n1815)
         );
  AO21X1 U2072 ( .A0(N2467), .A1(n1410), .B0(n1816), .Y(n2081) );
  AO22X1 U2073 ( .A0(N2490), .A1(n1403), .B0(area[1]), .B1(n2024), .Y(n1816)
         );
  AO21X1 U2074 ( .A0(N2466), .A1(n1416), .B0(n1817), .Y(n2082) );
  AO22X1 U2075 ( .A0(N2489), .A1(n1403), .B0(area[0]), .B1(n2024), .Y(n1817)
         );
  OAI221XL U2076 ( .A0(n923), .A1(n1448), .B0(n943), .B1(n1398), .C0(n1632), 
        .Y(n1015) );
  OA22XL U2077 ( .A0(n933), .A1(n1421), .B0(n179), .B1(n1631), .Y(n1632) );
  OAI221XL U2078 ( .A0(n922), .A1(n1448), .B0(n942), .B1(n1398), .C0(n1627), 
        .Y(n1014) );
  OA22XL U2079 ( .A0(n932), .A1(n1421), .B0(n1446), .B1(n1626), .Y(n1627) );
  OAI221XL U2080 ( .A0(n921), .A1(n1448), .B0(n941), .B1(n1398), .C0(n1622), 
        .Y(n1013) );
  OA22XL U2081 ( .A0(n931), .A1(n1421), .B0(n179), .B1(n1621), .Y(n1622) );
  OAI221XL U2082 ( .A0(n920), .A1(n1448), .B0(n940), .B1(n1398), .C0(n1617), 
        .Y(n1012) );
  OA22XL U2083 ( .A0(n930), .A1(n1421), .B0(n179), .B1(n1616), .Y(n1617) );
  OAI221XL U2084 ( .A0(n919), .A1(n1449), .B0(n939), .B1(n1394), .C0(n1612), 
        .Y(n1011) );
  OA22XL U2085 ( .A0(n929), .A1(n1421), .B0(n179), .B1(n1611), .Y(n1612) );
  OAI221XL U2086 ( .A0(n918), .A1(n1448), .B0(n938), .B1(n1397), .C0(n1607), 
        .Y(n1010) );
  OA22XL U2087 ( .A0(n928), .A1(n1421), .B0(n179), .B1(n1606), .Y(n1607) );
  OAI221XL U2088 ( .A0(n917), .A1(n1449), .B0(n937), .B1(n1392), .C0(n1602), 
        .Y(n1009) );
  OA22XL U2089 ( .A0(n927), .A1(n1421), .B0(n1446), .B1(n1601), .Y(n1602) );
  OAI221XL U2090 ( .A0(n916), .A1(n1449), .B0(n936), .B1(n1802), .C0(n1597), 
        .Y(n1008) );
  OA22XL U2091 ( .A0(n926), .A1(n1421), .B0(n1446), .B1(n1596), .Y(n1597) );
  OAI221XL U2092 ( .A0(n875), .A1(n1449), .B0(n895), .B1(n1394), .C0(n1544), 
        .Y(n1077) );
  OA22XL U2093 ( .A0(n885), .A1(n1421), .B0(n1446), .B1(n1545), .Y(n1544) );
  OAI221XL U2094 ( .A0(n872), .A1(n1449), .B0(n892), .B1(n1392), .C0(n1529), 
        .Y(n1074) );
  OA22XL U2095 ( .A0(n882), .A1(n1421), .B0(n1446), .B1(n1530), .Y(n1529) );
  OAI221XL U2096 ( .A0(n871), .A1(n1450), .B0(n891), .B1(n1394), .C0(n1524), 
        .Y(n1073) );
  OA22XL U2097 ( .A0(n881), .A1(n1421), .B0(n1446), .B1(n1525), .Y(n1524) );
  OAI221XL U2098 ( .A0(n870), .A1(n1450), .B0(n890), .B1(n1802), .C0(n1519), 
        .Y(n1072) );
  OA22XL U2099 ( .A0(n880), .A1(n1421), .B0(n1446), .B1(n1520), .Y(n1519) );
  OAI221XL U2100 ( .A0(n869), .A1(n1450), .B0(n889), .B1(n1802), .C0(n1514), 
        .Y(n1071) );
  OA22XL U2101 ( .A0(n879), .A1(n1422), .B0(n1447), .B1(n1515), .Y(n1514) );
  OAI221XL U2102 ( .A0(n868), .A1(n1450), .B0(n888), .B1(n1802), .C0(n1509), 
        .Y(n1070) );
  OA22XL U2103 ( .A0(n878), .A1(n1422), .B0(n1447), .B1(n1510), .Y(n1509) );
  OAI221XL U2104 ( .A0(n867), .A1(n1450), .B0(n887), .B1(n1394), .C0(n1504), 
        .Y(n1069) );
  OA22XL U2105 ( .A0(n877), .A1(n1422), .B0(n179), .B1(n1505), .Y(n1504) );
  OAI221XL U2106 ( .A0(n866), .A1(n1450), .B0(n886), .B1(n1397), .C0(n1497), 
        .Y(n1068) );
  OA22XL U2107 ( .A0(n876), .A1(n1422), .B0(n1446), .B1(n1500), .Y(n1497) );
  OAI221XL U2108 ( .A0(n925), .A1(n1448), .B0(n945), .B1(n1394), .C0(n1643), 
        .Y(n1017) );
  OA22XL U2109 ( .A0(n935), .A1(n1422), .B0(n1447), .B1(n1642), .Y(n1643) );
  OAI221XL U2110 ( .A0(n924), .A1(n1450), .B0(n944), .B1(n1394), .C0(n1637), 
        .Y(n1016) );
  OA22XL U2111 ( .A0(n934), .A1(n1422), .B0(n1447), .B1(n1636), .Y(n1637) );
  OAI221XL U2112 ( .A0(n874), .A1(n1449), .B0(n894), .B1(n1394), .C0(n1539), 
        .Y(n1076) );
  OA22XL U2113 ( .A0(n884), .A1(n1421), .B0(n1446), .B1(n1540), .Y(n1539) );
  OAI221XL U2114 ( .A0(n873), .A1(n1449), .B0(n893), .B1(n1394), .C0(n1534), 
        .Y(n1075) );
  OA22XL U2115 ( .A0(n883), .A1(n1421), .B0(n1446), .B1(n1535), .Y(n1534) );
  CLKINVX1 U2116 ( .A(Y[0]), .Y(n1642) );
  CLKINVX1 U2117 ( .A(Y[1]), .Y(n1636) );
  CLKINVX1 U2118 ( .A(Y[2]), .Y(n1631) );
  CLKINVX1 U2119 ( .A(Y[3]), .Y(n1626) );
  CLKINVX1 U2120 ( .A(Y[4]), .Y(n1621) );
  CLKINVX1 U2121 ( .A(Y[5]), .Y(n1616) );
  CLKINVX1 U2122 ( .A(Y[6]), .Y(n1611) );
  CLKINVX1 U2123 ( .A(Y[7]), .Y(n1606) );
  CLKINVX1 U2124 ( .A(Y[8]), .Y(n1601) );
  CLKINVX1 U2125 ( .A(Y[9]), .Y(n1596) );
  CLKINVX1 U2126 ( .A(X[0]), .Y(n1545) );
  CLKINVX1 U2127 ( .A(X[1]), .Y(n1540) );
  CLKINVX1 U2128 ( .A(X[2]), .Y(n1535) );
  CLKINVX1 U2129 ( .A(X[3]), .Y(n1530) );
  CLKINVX1 U2130 ( .A(X[4]), .Y(n1525) );
  CLKINVX1 U2131 ( .A(X[5]), .Y(n1520) );
  CLKINVX1 U2132 ( .A(X[6]), .Y(n1515) );
  CLKINVX1 U2133 ( .A(X[7]), .Y(n1510) );
  CLKINVX1 U2134 ( .A(X[8]), .Y(n1505) );
  CLKINVX1 U2135 ( .A(X[9]), .Y(n1500) );
  OAI221XL U2136 ( .A0(n953), .A1(n1438), .B0(n943), .B1(n1426), .C0(n1630), 
        .Y(n1025) );
  OA22XL U2137 ( .A0(n1444), .A1(n1631), .B0(n933), .B1(n1398), .Y(n1630) );
  OAI221XL U2138 ( .A0(n952), .A1(n1438), .B0(n942), .B1(n1426), .C0(n1625), 
        .Y(n1024) );
  OA22XL U2139 ( .A0(n1444), .A1(n1626), .B0(n932), .B1(n1398), .Y(n1625) );
  OAI221XL U2140 ( .A0(n951), .A1(n1437), .B0(n941), .B1(n1426), .C0(n1620), 
        .Y(n1023) );
  OA22XL U2141 ( .A0(n1444), .A1(n1621), .B0(n931), .B1(n1394), .Y(n1620) );
  OAI221XL U2142 ( .A0(n950), .A1(n1437), .B0(n940), .B1(n1426), .C0(n1615), 
        .Y(n1022) );
  OA22XL U2143 ( .A0(n1444), .A1(n1616), .B0(n930), .B1(n1802), .Y(n1615) );
  OAI221XL U2144 ( .A0(n949), .A1(n1437), .B0(n939), .B1(n1426), .C0(n1610), 
        .Y(n1021) );
  OA22XL U2145 ( .A0(n1444), .A1(n1611), .B0(n929), .B1(n1802), .Y(n1610) );
  OAI221XL U2146 ( .A0(n948), .A1(n1438), .B0(n938), .B1(n1425), .C0(n1605), 
        .Y(n1020) );
  OA22XL U2147 ( .A0(n1444), .A1(n1606), .B0(n928), .B1(n1398), .Y(n1605) );
  OAI221XL U2148 ( .A0(n947), .A1(n1437), .B0(n937), .B1(n1425), .C0(n1600), 
        .Y(n1019) );
  OA22XL U2149 ( .A0(n203), .A1(n1601), .B0(n927), .B1(n1398), .Y(n1600) );
  OAI221XL U2150 ( .A0(n946), .A1(n1437), .B0(n936), .B1(n1425), .C0(n1595), 
        .Y(n1018) );
  OA22XL U2151 ( .A0(n203), .A1(n1596), .B0(n926), .B1(n1393), .Y(n1595) );
  OAI221XL U2152 ( .A0(n905), .A1(n1437), .B0(n895), .B1(n1425), .C0(n1546), 
        .Y(n1087) );
  OA22XL U2153 ( .A0(n203), .A1(n1545), .B0(n885), .B1(n1393), .Y(n1546) );
  OAI221XL U2154 ( .A0(n902), .A1(n1438), .B0(n892), .B1(n1425), .C0(n1531), 
        .Y(n1084) );
  OA22XL U2155 ( .A0(n203), .A1(n1530), .B0(n882), .B1(n1393), .Y(n1531) );
  OAI221XL U2156 ( .A0(n901), .A1(n1438), .B0(n891), .B1(n1425), .C0(n1526), 
        .Y(n1083) );
  OA22XL U2157 ( .A0(n1444), .A1(n1525), .B0(n881), .B1(n1392), .Y(n1526) );
  OAI221XL U2158 ( .A0(n900), .A1(n1438), .B0(n890), .B1(n1425), .C0(n1521), 
        .Y(n1082) );
  OA22XL U2159 ( .A0(n203), .A1(n1520), .B0(n880), .B1(n1397), .Y(n1521) );
  OAI221XL U2160 ( .A0(n899), .A1(n1438), .B0(n889), .B1(n1425), .C0(n1516), 
        .Y(n1081) );
  OA22XL U2161 ( .A0(n1445), .A1(n1515), .B0(n879), .B1(n1397), .Y(n1516) );
  OAI221XL U2162 ( .A0(n898), .A1(n1438), .B0(n888), .B1(n1425), .C0(n1511), 
        .Y(n1080) );
  OA22XL U2163 ( .A0(n1445), .A1(n1510), .B0(n878), .B1(n1398), .Y(n1511) );
  OAI221XL U2164 ( .A0(n897), .A1(n1438), .B0(n887), .B1(n1425), .C0(n1506), 
        .Y(n1079) );
  OA22XL U2165 ( .A0(n1445), .A1(n1505), .B0(n877), .B1(n1398), .Y(n1506) );
  OAI221XL U2166 ( .A0(n896), .A1(n1438), .B0(n886), .B1(n1425), .C0(n1501), 
        .Y(n1078) );
  OA22XL U2167 ( .A0(n1444), .A1(n1500), .B0(n876), .B1(n1398), .Y(n1501) );
  OAI221XL U2168 ( .A0(n955), .A1(n1438), .B0(n945), .B1(n1426), .C0(n1641), 
        .Y(n1027) );
  OA22XL U2169 ( .A0(n1445), .A1(n1642), .B0(n935), .B1(n1398), .Y(n1641) );
  OAI221XL U2170 ( .A0(n954), .A1(n1438), .B0(n944), .B1(n1426), .C0(n1635), 
        .Y(n1026) );
  OA22XL U2171 ( .A0(n1445), .A1(n1636), .B0(n934), .B1(n1398), .Y(n1635) );
  OAI221XL U2172 ( .A0(n904), .A1(n1438), .B0(n894), .B1(n1425), .C0(n1541), 
        .Y(n1086) );
  OA22XL U2173 ( .A0(n203), .A1(n1540), .B0(n884), .B1(n1392), .Y(n1541) );
  OAI221XL U2174 ( .A0(n903), .A1(n1438), .B0(n893), .B1(n1425), .C0(n1536), 
        .Y(n1085) );
  OA22XL U2175 ( .A0(n1444), .A1(n1535), .B0(n883), .B1(n1394), .Y(n1536) );
  OAI221XL U2176 ( .A0(n934), .A1(n1450), .B0(n924), .B1(n1640), .C0(n1634), 
        .Y(n1006) );
  OA22XL U2177 ( .A0(n1368), .A1(n1636), .B0(n756), .B1(n1459), .Y(n1634) );
  OAI221XL U2178 ( .A0(n933), .A1(n1448), .B0(n923), .B1(n1640), .C0(n1629), 
        .Y(n1005) );
  OA22XL U2179 ( .A0(n1368), .A1(n1631), .B0(n757), .B1(n1459), .Y(n1629) );
  OAI221XL U2180 ( .A0(n932), .A1(n1450), .B0(n922), .B1(n1640), .C0(n1624), 
        .Y(n1004) );
  OA22XL U2181 ( .A0(n1368), .A1(n1626), .B0(n758), .B1(n1459), .Y(n1624) );
  OAI221XL U2182 ( .A0(n931), .A1(n1449), .B0(n921), .B1(n1640), .C0(n1619), 
        .Y(n1003) );
  OA22XL U2183 ( .A0(n1368), .A1(n1621), .B0(n759), .B1(n1459), .Y(n1619) );
  OAI221XL U2184 ( .A0(n930), .A1(n1448), .B0(n920), .B1(n1640), .C0(n1614), 
        .Y(n1002) );
  OA22XL U2185 ( .A0(n1368), .A1(n1616), .B0(n760), .B1(n1459), .Y(n1614) );
  OAI221XL U2186 ( .A0(n929), .A1(n1450), .B0(n919), .B1(n1640), .C0(n1609), 
        .Y(n1001) );
  OA22XL U2187 ( .A0(n1368), .A1(n1611), .B0(n761), .B1(n1459), .Y(n1609) );
  OAI221XL U2188 ( .A0(n928), .A1(n1449), .B0(n918), .B1(n1640), .C0(n1604), 
        .Y(n1000) );
  OA22XL U2189 ( .A0(n1368), .A1(n1606), .B0(n762), .B1(n1459), .Y(n1604) );
  OAI221XL U2190 ( .A0(n927), .A1(n1449), .B0(n917), .B1(n1640), .C0(n1599), 
        .Y(n999) );
  OA22XL U2191 ( .A0(n1368), .A1(n1601), .B0(n763), .B1(n1459), .Y(n1599) );
  OAI221XL U2192 ( .A0(n926), .A1(n1449), .B0(n916), .B1(n1640), .C0(n1594), 
        .Y(n998) );
  OA22XL U2193 ( .A0(n1368), .A1(n1596), .B0(n764), .B1(n1459), .Y(n1594) );
  OAI221XL U2194 ( .A0(n885), .A1(n1449), .B0(n875), .B1(n1640), .C0(n1543), 
        .Y(n1067) );
  OA22XL U2195 ( .A0(n1368), .A1(n1545), .B0(n745), .B1(n1460), .Y(n1543) );
  OAI221XL U2196 ( .A0(n884), .A1(n1449), .B0(n874), .B1(n1640), .C0(n1538), 
        .Y(n1066) );
  OA22XL U2197 ( .A0(n1368), .A1(n1540), .B0(n746), .B1(n1460), .Y(n1538) );
  OAI221XL U2198 ( .A0(n883), .A1(n1449), .B0(n873), .B1(n1640), .C0(n1533), 
        .Y(n1065) );
  OA22XL U2199 ( .A0(n1368), .A1(n1535), .B0(n747), .B1(n1460), .Y(n1533) );
  OAI221XL U2200 ( .A0(n882), .A1(n1449), .B0(n872), .B1(n1640), .C0(n1528), 
        .Y(n1064) );
  OA22XL U2201 ( .A0(n1368), .A1(n1530), .B0(n748), .B1(n1460), .Y(n1528) );
  OAI221XL U2202 ( .A0(n881), .A1(n1450), .B0(n871), .B1(n1640), .C0(n1523), 
        .Y(n1063) );
  OA22XL U2203 ( .A0(n1368), .A1(n1525), .B0(n749), .B1(n1460), .Y(n1523) );
  OAI221XL U2204 ( .A0(n880), .A1(n1450), .B0(n870), .B1(n1640), .C0(n1518), 
        .Y(n1062) );
  OA22XL U2205 ( .A0(n1368), .A1(n1520), .B0(n750), .B1(n1460), .Y(n1518) );
  OAI221XL U2206 ( .A0(n879), .A1(n1450), .B0(n869), .B1(n1640), .C0(n1513), 
        .Y(n1061) );
  OA22XL U2207 ( .A0(n1368), .A1(n1515), .B0(n751), .B1(n1460), .Y(n1513) );
  OAI221XL U2208 ( .A0(n878), .A1(n1450), .B0(n868), .B1(n1640), .C0(n1508), 
        .Y(n1060) );
  OA22XL U2209 ( .A0(n1368), .A1(n1510), .B0(n752), .B1(n1460), .Y(n1508) );
  OAI221XL U2210 ( .A0(n877), .A1(n1450), .B0(n867), .B1(n1640), .C0(n1503), 
        .Y(n1059) );
  OA22XL U2211 ( .A0(n1368), .A1(n1505), .B0(n753), .B1(n1460), .Y(n1503) );
  OAI221XL U2212 ( .A0(n876), .A1(n1450), .B0(n866), .B1(n1640), .C0(n1491), 
        .Y(n1058) );
  OA22XL U2213 ( .A0(n1368), .A1(n1500), .B0(n754), .B1(n1460), .Y(n1491) );
  OAI221XL U2214 ( .A0(n935), .A1(n1448), .B0(n925), .B1(n1640), .C0(n1639), 
        .Y(n1007) );
  OA22XL U2215 ( .A0(n1642), .A1(n1368), .B0(n755), .B1(n1459), .Y(n1639) );
  OAI222XL U2216 ( .A0(n235), .A1(n2093), .B0(n855), .B1(n1427), .C0(n844), 
        .C1(n1436), .Y(n1163) );
  OAI222XL U2217 ( .A0(n235), .A1(n2092), .B0(n854), .B1(n1427), .C0(n843), 
        .C1(n1435), .Y(n1162) );
  OAI222XL U2218 ( .A0(n235), .A1(n2091), .B0(n853), .B1(n1427), .C0(n842), 
        .C1(n1435), .Y(n1161) );
  OAI222XL U2219 ( .A0(n235), .A1(n2090), .B0(n852), .B1(n1427), .C0(n841), 
        .C1(n1435), .Y(n1160) );
  OAI222XL U2220 ( .A0(n1442), .A1(n2089), .B0(n851), .B1(n1427), .C0(n840), 
        .C1(n1435), .Y(n1159) );
  OAI222XL U2221 ( .A0(n235), .A1(n2088), .B0(n850), .B1(n1427), .C0(n839), 
        .C1(n1435), .Y(n1158) );
  OAI222XL U2222 ( .A0(n1442), .A1(n2087), .B0(n849), .B1(n1206), .C0(n838), 
        .C1(n1435), .Y(n1157) );
  OAI222XL U2223 ( .A0(n1442), .A1(n2086), .B0(n848), .B1(n1206), .C0(n837), 
        .C1(n1435), .Y(n1156) );
  OAI222XL U2224 ( .A0(n1442), .A1(n2085), .B0(n847), .B1(n1206), .C0(n836), 
        .C1(n1435), .Y(n1155) );
  OAI222XL U2225 ( .A0(n1442), .A1(n2084), .B0(n846), .B1(n1206), .C0(n835), 
        .C1(n1435), .Y(n1154) );
  OAI222XL U2226 ( .A0(n1442), .A1(n2083), .B0(n845), .B1(n1206), .C0(n834), 
        .C1(n1435), .Y(n1153) );
  CLKINVX1 U2227 ( .A(R[0]), .Y(n2093) );
  CLKINVX1 U2228 ( .A(R[1]), .Y(n2092) );
  CLKINVX1 U2229 ( .A(R[2]), .Y(n2091) );
  CLKINVX1 U2230 ( .A(R[3]), .Y(n2090) );
  CLKINVX1 U2231 ( .A(R[4]), .Y(n2089) );
  CLKINVX1 U2232 ( .A(R[5]), .Y(n2088) );
  CLKINVX1 U2233 ( .A(R[6]), .Y(n2087) );
  CLKINVX1 U2234 ( .A(R[7]), .Y(n2086) );
  CLKINVX1 U2235 ( .A(R[8]), .Y(n2085) );
  CLKINVX1 U2236 ( .A(R[9]), .Y(n2084) );
  CLKINVX1 U2237 ( .A(R[10]), .Y(n2083) );
  OAI222XL U2238 ( .A0(n900), .A1(n1427), .B0(n1442), .B1(n1520), .C0(n890), 
        .C1(n1437), .Y(n1092) );
  OAI222XL U2239 ( .A0(n899), .A1(n1427), .B0(n1443), .B1(n1515), .C0(n889), 
        .C1(n1437), .Y(n1091) );
  OAI222XL U2240 ( .A0(n898), .A1(n1427), .B0(n1442), .B1(n1510), .C0(n888), 
        .C1(n1437), .Y(n1090) );
  OAI222XL U2241 ( .A0(n897), .A1(n1427), .B0(n1442), .B1(n1505), .C0(n887), 
        .C1(n1437), .Y(n1089) );
  OAI222XL U2242 ( .A0(n896), .A1(n1427), .B0(n235), .B1(n1500), .C0(n886), 
        .C1(n1435), .Y(n1088) );
  OAI222XL U2243 ( .A0(n955), .A1(n1206), .B0(n1443), .B1(n1642), .C0(n945), 
        .C1(n1435), .Y(n1037) );
  OAI222XL U2244 ( .A0(n954), .A1(n1206), .B0(n1442), .B1(n1636), .C0(n944), 
        .C1(n1436), .Y(n1036) );
  OAI222XL U2245 ( .A0(n953), .A1(n1206), .B0(n1443), .B1(n1631), .C0(n943), 
        .C1(n1436), .Y(n1035) );
  OAI222XL U2246 ( .A0(n952), .A1(n1206), .B0(n1443), .B1(n1626), .C0(n942), 
        .C1(n1436), .Y(n1034) );
  OAI222XL U2247 ( .A0(n951), .A1(n1206), .B0(n1443), .B1(n1621), .C0(n941), 
        .C1(n1436), .Y(n1033) );
  OAI222XL U2248 ( .A0(n950), .A1(n1206), .B0(n1443), .B1(n1616), .C0(n940), 
        .C1(n1436), .Y(n1032) );
  OAI222XL U2249 ( .A0(n949), .A1(n1206), .B0(n1443), .B1(n1611), .C0(n939), 
        .C1(n1436), .Y(n1031) );
  OAI222XL U2250 ( .A0(n948), .A1(n1206), .B0(n1443), .B1(n1606), .C0(n938), 
        .C1(n1436), .Y(n1030) );
  OAI222XL U2251 ( .A0(n947), .A1(n1427), .B0(n1443), .B1(n1601), .C0(n937), 
        .C1(n1436), .Y(n1029) );
  OAI222XL U2252 ( .A0(n946), .A1(n1427), .B0(n1443), .B1(n1596), .C0(n936), 
        .C1(n1436), .Y(n1028) );
  OAI222XL U2253 ( .A0(n905), .A1(n1427), .B0(n1443), .B1(n1545), .C0(n895), 
        .C1(n1436), .Y(n1097) );
  OAI222XL U2254 ( .A0(n904), .A1(n1427), .B0(n1443), .B1(n1540), .C0(n894), 
        .C1(n1436), .Y(n1096) );
  OAI222XL U2255 ( .A0(n903), .A1(n1427), .B0(n1443), .B1(n1535), .C0(n893), 
        .C1(n1437), .Y(n1095) );
  OAI222XL U2256 ( .A0(n902), .A1(n1427), .B0(n1443), .B1(n1530), .C0(n892), 
        .C1(n1437), .Y(n1094) );
  OAI222XL U2257 ( .A0(n901), .A1(n1427), .B0(n1443), .B1(n1525), .C0(n891), 
        .C1(n1437), .Y(n1093) );
  OAI221XL U2258 ( .A0(n833), .A1(n1422), .B0(n1447), .B1(n2093), .C0(n388), 
        .Y(n1141) );
  AOI22X1 U2259 ( .A0(n1451), .A1(n2118), .B0(n1395), .B1(n2056), .Y(n388) );
  OAI221XL U2260 ( .A0(n844), .A1(n1426), .B0(n1445), .B1(n2093), .C0(n426), 
        .Y(n1152) );
  AOI22X1 U2261 ( .A0(n1395), .A1(n2117), .B0(n1439), .B1(n2055), .Y(n426) );
  OAI221XL U2262 ( .A0(n832), .A1(n1422), .B0(n1447), .B1(n2092), .C0(n386), 
        .Y(n1140) );
  AOI22X1 U2263 ( .A0(n1451), .A1(n2116), .B0(n1395), .B1(n2054), .Y(n386) );
  OAI221XL U2264 ( .A0(n843), .A1(n1425), .B0(n1445), .B1(n2092), .C0(n423), 
        .Y(n1151) );
  AOI22X1 U2265 ( .A0(n1395), .A1(n2115), .B0(n1439), .B1(n2053), .Y(n423) );
  OAI221XL U2266 ( .A0(n831), .A1(n1422), .B0(n1447), .B1(n2091), .C0(n384), 
        .Y(n1139) );
  AOI22X1 U2267 ( .A0(n1452), .A1(n2114), .B0(n1396), .B1(n2052), .Y(n384) );
  OAI221XL U2268 ( .A0(n842), .A1(n1426), .B0(n1445), .B1(n2091), .C0(n420), 
        .Y(n1150) );
  AOI22X1 U2269 ( .A0(n1395), .A1(n2113), .B0(n1440), .B1(n2051), .Y(n420) );
  OAI221XL U2270 ( .A0(n830), .A1(n1422), .B0(n1447), .B1(n2090), .C0(n382), 
        .Y(n1138) );
  AOI22X1 U2271 ( .A0(n1451), .A1(n2112), .B0(n1396), .B1(n2050), .Y(n382) );
  OAI221XL U2272 ( .A0(n841), .A1(n1425), .B0(n1445), .B1(n2090), .C0(n417), 
        .Y(n1149) );
  AOI22X1 U2273 ( .A0(n1395), .A1(n2111), .B0(n1440), .B1(n2049), .Y(n417) );
  OAI221XL U2274 ( .A0(n829), .A1(n1422), .B0(n1447), .B1(n2089), .C0(n380), 
        .Y(n1137) );
  AOI22X1 U2275 ( .A0(n1451), .A1(n2110), .B0(n1396), .B1(n2048), .Y(n380) );
  OAI221XL U2276 ( .A0(n840), .A1(n1332), .B0(n1445), .B1(n2089), .C0(n414), 
        .Y(n1148) );
  AOI22X1 U2277 ( .A0(n1395), .A1(n2109), .B0(n1439), .B1(n2047), .Y(n414) );
  OAI221XL U2278 ( .A0(n828), .A1(n1422), .B0(n1447), .B1(n2088), .C0(n378), 
        .Y(n1136) );
  AOI22X1 U2279 ( .A0(n1452), .A1(n2108), .B0(n1396), .B1(n2046), .Y(n378) );
  OAI221XL U2280 ( .A0(n839), .A1(n1426), .B0(n1445), .B1(n2088), .C0(n411), 
        .Y(n1147) );
  AOI22X1 U2281 ( .A0(n1395), .A1(n2107), .B0(n1441), .B1(n2045), .Y(n411) );
  OAI221XL U2282 ( .A0(n827), .A1(n1422), .B0(n1447), .B1(n2087), .C0(n376), 
        .Y(n1135) );
  AOI22X1 U2283 ( .A0(n1453), .A1(n2106), .B0(n1396), .B1(n2044), .Y(n376) );
  OAI221XL U2284 ( .A0(n838), .A1(n1426), .B0(n1445), .B1(n2087), .C0(n408), 
        .Y(n1146) );
  AOI22X1 U2285 ( .A0(n1395), .A1(n2105), .B0(n1441), .B1(n2043), .Y(n408) );
  OAI221XL U2286 ( .A0(n826), .A1(n1422), .B0(n1447), .B1(n2086), .C0(n374), 
        .Y(n1134) );
  AOI22X1 U2287 ( .A0(n1453), .A1(n2104), .B0(n1396), .B1(n2042), .Y(n374) );
  OAI221XL U2288 ( .A0(n837), .A1(n1426), .B0(n1445), .B1(n2086), .C0(n405), 
        .Y(n1145) );
  AOI22X1 U2289 ( .A0(n1395), .A1(n2103), .B0(n1440), .B1(n2041), .Y(n405) );
  OAI221XL U2290 ( .A0(n825), .A1(n1422), .B0(n1447), .B1(n2085), .C0(n372), 
        .Y(n1133) );
  AOI22X1 U2291 ( .A0(n1453), .A1(n2102), .B0(n1396), .B1(n2040), .Y(n372) );
  OAI221XL U2292 ( .A0(n836), .A1(n1426), .B0(n1445), .B1(n2085), .C0(n402), 
        .Y(n1144) );
  AOI22X1 U2293 ( .A0(n1395), .A1(n2101), .B0(n1440), .B1(n2039), .Y(n402) );
  OAI221XL U2294 ( .A0(n824), .A1(n1421), .B0(n1447), .B1(n2084), .C0(n370), 
        .Y(n1132) );
  AOI22X1 U2295 ( .A0(n1451), .A1(n2100), .B0(n1396), .B1(n2038), .Y(n370) );
  OAI221XL U2296 ( .A0(n835), .A1(n1426), .B0(n1445), .B1(n2084), .C0(n399), 
        .Y(n1143) );
  AOI22X1 U2297 ( .A0(n1395), .A1(n2099), .B0(n1440), .B1(n2037), .Y(n399) );
  OAI221XL U2298 ( .A0(n823), .A1(n1422), .B0(n1447), .B1(n2083), .C0(n368), 
        .Y(n1131) );
  AOI22X1 U2299 ( .A0(n1453), .A1(n2098), .B0(n1396), .B1(n2036), .Y(n368) );
  OAI221XL U2300 ( .A0(n834), .A1(n1426), .B0(n1445), .B1(n2083), .C0(n396), 
        .Y(n1142) );
  AOI22X1 U2301 ( .A0(n1395), .A1(n2097), .B0(n1440), .B1(n2035), .Y(n396) );
  OAI222XL U2302 ( .A0(n811), .A1(n1423), .B0(n822), .B1(n1459), .C0(n1454), 
        .C1(n2093), .Y(n1119) );
  OAI222XL U2303 ( .A0(n810), .A1(n1423), .B0(n821), .B1(n1459), .C0(n154), 
        .C1(n2092), .Y(n1118) );
  OAI222XL U2304 ( .A0(n809), .A1(n1423), .B0(n820), .B1(n1459), .C0(n1455), 
        .C1(n2091), .Y(n1117) );
  OAI222XL U2305 ( .A0(n808), .A1(n1423), .B0(n819), .B1(n1456), .C0(n154), 
        .C1(n2090), .Y(n1116) );
  OAI222XL U2306 ( .A0(n807), .A1(n1423), .B0(n818), .B1(n1459), .C0(n154), 
        .C1(n2089), .Y(n1115) );
  OAI222XL U2307 ( .A0(n806), .A1(n1423), .B0(n817), .B1(n1460), .C0(n1455), 
        .C1(n2088), .Y(n1114) );
  OAI222XL U2308 ( .A0(n805), .A1(n1423), .B0(n816), .B1(n1459), .C0(n1455), 
        .C1(n2087), .Y(n1113) );
  OAI222XL U2309 ( .A0(n804), .A1(n1423), .B0(n815), .B1(n1456), .C0(n1455), 
        .C1(n2086), .Y(n1112) );
  OAI222XL U2310 ( .A0(n803), .A1(n1423), .B0(n814), .B1(n1460), .C0(n1455), 
        .C1(n2085), .Y(n1111) );
  OAI222XL U2311 ( .A0(n802), .A1(n1423), .B0(n813), .B1(n1457), .C0(n1455), 
        .C1(n2084), .Y(n1110) );
  OAI222XL U2312 ( .A0(n801), .A1(n1423), .B0(n812), .B1(n1456), .C0(n1455), 
        .C1(n2083), .Y(n1109) );
  OAI222XL U2313 ( .A0(n870), .A1(n1458), .B0(n750), .B1(n1423), .C0(n1454), 
        .C1(n1520), .Y(n1052) );
  OAI222XL U2314 ( .A0(n869), .A1(n1458), .B0(n751), .B1(n1424), .C0(n1454), 
        .C1(n1515), .Y(n1051) );
  OAI222XL U2315 ( .A0(n868), .A1(n1457), .B0(n752), .B1(n1423), .C0(n1454), 
        .C1(n1510), .Y(n1050) );
  OAI222XL U2316 ( .A0(n867), .A1(n153), .B0(n753), .B1(n1424), .C0(n1454), 
        .C1(n1505), .Y(n1049) );
  OAI222XL U2317 ( .A0(n866), .A1(n1457), .B0(n754), .B1(n1330), .C0(n1454), 
        .C1(n1500), .Y(n1048) );
  OAI222XL U2318 ( .A0(n925), .A1(n1457), .B0(n755), .B1(n1423), .C0(n1455), 
        .C1(n1642), .Y(n997) );
  OAI222XL U2319 ( .A0(n924), .A1(n153), .B0(n756), .B1(n1423), .C0(n1455), 
        .C1(n1636), .Y(n996) );
  OAI222XL U2320 ( .A0(n923), .A1(n1458), .B0(n757), .B1(n1424), .C0(n1455), 
        .C1(n1631), .Y(n995) );
  OAI222XL U2321 ( .A0(n922), .A1(n1458), .B0(n758), .B1(n1424), .C0(n1455), 
        .C1(n1626), .Y(n994) );
  OAI222XL U2322 ( .A0(n921), .A1(n1458), .B0(n759), .B1(n1424), .C0(n1455), 
        .C1(n1621), .Y(n993) );
  OAI222XL U2323 ( .A0(n920), .A1(n1458), .B0(n760), .B1(n1424), .C0(n1455), 
        .C1(n1616), .Y(n992) );
  OAI222XL U2324 ( .A0(n919), .A1(n1458), .B0(n761), .B1(n1424), .C0(n1455), 
        .C1(n1611), .Y(n991) );
  OAI222XL U2325 ( .A0(n918), .A1(n1458), .B0(n762), .B1(n1424), .C0(n1454), 
        .C1(n1606), .Y(n990) );
  OAI222XL U2326 ( .A0(n917), .A1(n1458), .B0(n763), .B1(n1424), .C0(n1454), 
        .C1(n1601), .Y(n989) );
  OAI222XL U2327 ( .A0(n916), .A1(n1458), .B0(n764), .B1(n1424), .C0(n1454), 
        .C1(n1596), .Y(n988) );
  OAI222XL U2328 ( .A0(n875), .A1(n1458), .B0(n745), .B1(n1424), .C0(n1454), 
        .C1(n1545), .Y(n1057) );
  OAI222XL U2329 ( .A0(n874), .A1(n1458), .B0(n746), .B1(n1424), .C0(n1454), 
        .C1(n1540), .Y(n1056) );
  OAI222XL U2330 ( .A0(n873), .A1(n153), .B0(n747), .B1(n1424), .C0(n1454), 
        .C1(n1535), .Y(n1055) );
  OAI222XL U2331 ( .A0(n872), .A1(n1458), .B0(n748), .B1(n1424), .C0(n1454), 
        .C1(n1530), .Y(n1054) );
  OAI222XL U2332 ( .A0(n871), .A1(n1460), .B0(n749), .B1(n1424), .C0(n1454), 
        .C1(n1525), .Y(n1053) );
  OAI22XL U2333 ( .A0(n1369), .A1(n2093), .B0(n734), .B1(n1419), .Y(n1108) );
  OAI22XL U2334 ( .A0(n1369), .A1(n2092), .B0(n735), .B1(n1419), .Y(n1107) );
  OAI22XL U2335 ( .A0(n1369), .A1(n2091), .B0(n736), .B1(n2028), .Y(n1106) );
  OAI22XL U2336 ( .A0(n1369), .A1(n2090), .B0(n737), .B1(n2028), .Y(n1105) );
  OAI22XL U2337 ( .A0(n1369), .A1(n2089), .B0(n738), .B1(n2028), .Y(n1104) );
  OAI22XL U2338 ( .A0(n1369), .A1(n2088), .B0(n739), .B1(n2028), .Y(n1103) );
  OAI22XL U2339 ( .A0(n1369), .A1(n2087), .B0(n740), .B1(n2028), .Y(n1102) );
  OAI22XL U2340 ( .A0(n1369), .A1(n2086), .B0(n741), .B1(n2028), .Y(n1101) );
  OAI22XL U2341 ( .A0(n1369), .A1(n2085), .B0(n742), .B1(n1419), .Y(n1100) );
  OAI22XL U2342 ( .A0(n1369), .A1(n2084), .B0(n743), .B1(n1419), .Y(n1099) );
  OAI22XL U2343 ( .A0(n1369), .A1(n2083), .B0(n744), .B1(n1419), .Y(n1098) );
  OAI221XL U2344 ( .A0(n811), .A1(n1458), .B0(n833), .B1(n1448), .C0(n356), 
        .Y(n1130) );
  AOI22X1 U2345 ( .A0(n1367), .A1(n2118), .B0(R[0]), .B1(n1381), .Y(n356) );
  OAI221XL U2346 ( .A0(n810), .A1(n1458), .B0(n832), .B1(n1448), .C0(n354), 
        .Y(n1129) );
  AOI22X1 U2347 ( .A0(n1367), .A1(n2116), .B0(R[1]), .B1(n1381), .Y(n354) );
  OAI221XL U2348 ( .A0(n809), .A1(n153), .B0(n831), .B1(n1448), .C0(n352), .Y(
        n1128) );
  AOI22X1 U2349 ( .A0(n1367), .A1(n2114), .B0(R[2]), .B1(n1381), .Y(n352) );
  OAI221XL U2350 ( .A0(n808), .A1(n1458), .B0(n830), .B1(n1448), .C0(n350), 
        .Y(n1127) );
  AOI22X1 U2351 ( .A0(n1367), .A1(n2112), .B0(R[3]), .B1(n1381), .Y(n350) );
  OAI221XL U2352 ( .A0(n807), .A1(n1458), .B0(n829), .B1(n1448), .C0(n348), 
        .Y(n1126) );
  AOI22X1 U2353 ( .A0(n1367), .A1(n2110), .B0(R[4]), .B1(n1381), .Y(n348) );
  OAI221XL U2354 ( .A0(n806), .A1(n153), .B0(n828), .B1(n1448), .C0(n346), .Y(
        n1125) );
  AOI22X1 U2355 ( .A0(n1367), .A1(n2108), .B0(R[5]), .B1(n1381), .Y(n346) );
  OAI221XL U2356 ( .A0(n805), .A1(n1458), .B0(n827), .B1(n1448), .C0(n344), 
        .Y(n1124) );
  AOI22X1 U2357 ( .A0(n1367), .A1(n2106), .B0(R[6]), .B1(n1381), .Y(n344) );
  OAI221XL U2358 ( .A0(n804), .A1(n1456), .B0(n826), .B1(n1448), .C0(n342), 
        .Y(n1123) );
  AOI22X1 U2359 ( .A0(n1367), .A1(n2104), .B0(R[7]), .B1(n1381), .Y(n342) );
  OAI221XL U2360 ( .A0(n803), .A1(n1457), .B0(n825), .B1(n1448), .C0(n340), 
        .Y(n1122) );
  AOI22X1 U2361 ( .A0(n1367), .A1(n2102), .B0(R[8]), .B1(n1381), .Y(n340) );
  OAI221XL U2362 ( .A0(n802), .A1(n1456), .B0(n824), .B1(n1448), .C0(n338), 
        .Y(n1121) );
  AOI22X1 U2363 ( .A0(n1367), .A1(n2100), .B0(R[9]), .B1(n1381), .Y(n338) );
  OAI221XL U2364 ( .A0(n801), .A1(n1457), .B0(n823), .B1(n1448), .C0(n336), 
        .Y(n1120) );
  AOI22X1 U2365 ( .A0(n1367), .A1(n2098), .B0(R[10]), .B1(n1381), .Y(n336) );
  MX2XL U2366 ( .A(\geofence_X[1][9] ), .B(X[9]), .S0(n1419), .Y(n1038) );
  MX2XL U2367 ( .A(\geofence_Y[1][0] ), .B(Y[0]), .S0(n1419), .Y(n987) );
  MX2XL U2368 ( .A(\geofence_Y[1][1] ), .B(Y[1]), .S0(n1419), .Y(n986) );
  MX2XL U2369 ( .A(\geofence_Y[1][2] ), .B(Y[2]), .S0(n1420), .Y(n985) );
  MX2XL U2370 ( .A(\geofence_Y[1][3] ), .B(Y[3]), .S0(n1420), .Y(n984) );
  MX2XL U2371 ( .A(\geofence_Y[1][4] ), .B(Y[4]), .S0(n1420), .Y(n983) );
  MX2XL U2372 ( .A(\geofence_Y[1][5] ), .B(Y[5]), .S0(n1420), .Y(n982) );
  MX2XL U2373 ( .A(\geofence_Y[1][6] ), .B(Y[6]), .S0(n1420), .Y(n981) );
  MX2XL U2374 ( .A(\geofence_Y[1][7] ), .B(Y[7]), .S0(n1420), .Y(n980) );
  MX2XL U2375 ( .A(\geofence_Y[1][8] ), .B(Y[8]), .S0(n1420), .Y(n979) );
  MX2XL U2376 ( .A(\geofence_Y[1][9] ), .B(Y[9]), .S0(n1420), .Y(n978) );
  MX2XL U2377 ( .A(\geofence_X[1][0] ), .B(X[0]), .S0(n1420), .Y(n1047) );
  MX2XL U2378 ( .A(\geofence_X[1][1] ), .B(X[1]), .S0(n1420), .Y(n1046) );
  MX2XL U2379 ( .A(\geofence_X[1][2] ), .B(X[2]), .S0(n1420), .Y(n1045) );
  MX2XL U2380 ( .A(\geofence_X[1][3] ), .B(X[3]), .S0(n1420), .Y(n1044) );
  MX2XL U2381 ( .A(\geofence_X[1][4] ), .B(X[4]), .S0(n1420), .Y(n1043) );
  MX2XL U2382 ( .A(\geofence_X[1][5] ), .B(X[5]), .S0(n1420), .Y(n1042) );
  MX2XL U2383 ( .A(\geofence_X[1][6] ), .B(X[6]), .S0(n1420), .Y(n1041) );
  MX2XL U2384 ( .A(\geofence_X[1][7] ), .B(X[7]), .S0(n1420), .Y(n1040) );
  MX2XL U2385 ( .A(\geofence_X[1][8] ), .B(X[8]), .S0(n1420), .Y(n1039) );
  AND2XL U2386 ( .A(N1829), .B(n1406), .Y(area_6_reg[20]) );
  AND2X2 U2387 ( .A(n1404), .B(N1828), .Y(area_6_reg[19]) );
  AOI211X1 U2388 ( .A0(n395), .A1(\store_counter2[1] ), .B0(n366), .C0(n365), 
        .Y(n392) );
  OA22XL U2389 ( .A0(n945), .A1(n1690), .B0(n955), .B1(n1689), .Y(n1644) );
  AND2X2 U2390 ( .A(n393), .B(n797), .Y(n1363) );
  OAI221XL U2391 ( .A0(n934), .A1(n1386), .B0(n924), .B1(n1387), .C0(n1638), 
        .Y(N1879) );
  OAI221XL U2392 ( .A0(n933), .A1(n556), .B0(n923), .B1(n1388), .C0(n1633), 
        .Y(N1878) );
  OA22XL U2393 ( .A0(n943), .A1(n1690), .B0(n953), .B1(n1689), .Y(n1633) );
  INVX3 U2394 ( .A(n559), .Y(n1690) );
  AND2X2 U2395 ( .A(n1387), .B(n797), .Y(n559) );
  AND2XL U2396 ( .A(N1827), .B(n1406), .Y(area_6_reg[18]) );
  OA22XL U2397 ( .A0(n895), .A1(n1690), .B0(n905), .B1(n1689), .Y(n1691) );
  OAI221XL U2398 ( .A0(n1386), .A1(n884), .B0(n1387), .B1(n874), .C0(n1688), 
        .Y(N1909) );
  OAI221XL U2399 ( .A0(n1386), .A1(n883), .B0(n1388), .B1(n873), .C0(n1687), 
        .Y(N1908) );
  OA22XL U2400 ( .A0(n893), .A1(n1690), .B0(n903), .B1(n1689), .Y(n1687) );
  OAI221XL U2401 ( .A0(n1386), .A1(n882), .B0(n1387), .B1(n872), .C0(n1686), 
        .Y(N1907) );
  OA22XL U2402 ( .A0(n892), .A1(n1690), .B0(n902), .B1(n1689), .Y(n1686) );
  OA22XL U2403 ( .A0(n944), .A1(n1690), .B0(n954), .B1(n1689), .Y(n1638) );
  OA22XL U2404 ( .A0(n894), .A1(n1690), .B0(n904), .B1(n1689), .Y(n1688) );
  OAI221XL U2405 ( .A0(n1386), .A1(n881), .B0(n1387), .B1(n871), .C0(n1685), 
        .Y(N1906) );
  OA22XL U2406 ( .A0(n891), .A1(n1690), .B0(n901), .B1(n1689), .Y(n1685) );
  OAI221XL U2407 ( .A0(n1386), .A1(n880), .B0(n1387), .B1(n870), .C0(n1684), 
        .Y(N1905) );
  OA22XL U2408 ( .A0(n890), .A1(n1690), .B0(n900), .B1(n1689), .Y(n1684) );
  AND2XL U2409 ( .A(N1826), .B(n1406), .Y(area_6_reg[17]) );
  OAI221XL U2410 ( .A0(n932), .A1(n556), .B0(n922), .B1(n1387), .C0(n1628), 
        .Y(N1877) );
  OA22XL U2411 ( .A0(n942), .A1(n1690), .B0(n952), .B1(n1689), .Y(n1628) );
  OAI221XL U2412 ( .A0(n931), .A1(n1386), .B0(n921), .B1(n1387), .C0(n1623), 
        .Y(N1876) );
  OA22XL U2413 ( .A0(n941), .A1(n1690), .B0(n951), .B1(n1689), .Y(n1623) );
  OA22XL U2414 ( .A0(n755), .A1(n1745), .B0(n925), .B1(n2058), .Y(n1746) );
  OAI221XL U2415 ( .A0(n944), .A1(n2095), .B0(n934), .B1(n2059), .C0(n1744), 
        .Y(N1939) );
  AND2XL U2416 ( .A(N1825), .B(n1406), .Y(area_6_reg[16]) );
  OAI221XL U2417 ( .A0(n930), .A1(n1386), .B0(n920), .B1(n1387), .C0(n1618), 
        .Y(N1875) );
  OA22XL U2418 ( .A0(n940), .A1(n1690), .B0(n950), .B1(n1689), .Y(n1618) );
  OA22XL U2419 ( .A0(n745), .A1(n1745), .B0(n875), .B1(n2058), .Y(n1547) );
  OAI221XL U2420 ( .A0(n894), .A1(n2095), .B0(n884), .B1(n2059), .C0(n1542), 
        .Y(N1849) );
  OAI221XL U2421 ( .A0(n893), .A1(n2095), .B0(n883), .B1(n2059), .C0(n1537), 
        .Y(N1848) );
  OA22XL U2422 ( .A0(n747), .A1(n1745), .B0(n873), .B1(n2058), .Y(n1537) );
  OAI221XL U2423 ( .A0(n892), .A1(n2095), .B0(n882), .B1(n2059), .C0(n1532), 
        .Y(N1847) );
  OA22XL U2424 ( .A0(n748), .A1(n1745), .B0(n872), .B1(n2058), .Y(n1532) );
  OA22XL U2425 ( .A0(n746), .A1(n1745), .B0(n874), .B1(n2058), .Y(n1542) );
  OA22XL U2426 ( .A0(n756), .A1(n1745), .B0(n924), .B1(n2058), .Y(n1744) );
  OAI221XL U2427 ( .A0(n891), .A1(n2095), .B0(n881), .B1(n2059), .C0(n1527), 
        .Y(N1846) );
  OA22XL U2428 ( .A0(n749), .A1(n1745), .B0(n871), .B1(n2058), .Y(n1527) );
  OAI221XL U2429 ( .A0(n890), .A1(n2095), .B0(n880), .B1(n2059), .C0(n1522), 
        .Y(N1845) );
  OA22XL U2430 ( .A0(n750), .A1(n1745), .B0(n870), .B1(n2058), .Y(n1522) );
  OAI221XL U2431 ( .A0(n556), .A1(n879), .B0(n1388), .B1(n869), .C0(n1683), 
        .Y(N1904) );
  OA22XL U2432 ( .A0(n889), .A1(n1690), .B0(n899), .B1(n1689), .Y(n1683) );
  OAI221XL U2433 ( .A0(n1386), .A1(n878), .B0(n1388), .B1(n868), .C0(n1682), 
        .Y(N1903) );
  OA22XL U2434 ( .A0(n888), .A1(n1690), .B0(n898), .B1(n1689), .Y(n1682) );
  AND2XL U2435 ( .A(N1824), .B(n1406), .Y(area_6_reg[15]) );
  OAI221XL U2436 ( .A0(n929), .A1(n556), .B0(n919), .B1(n1388), .C0(n1613), 
        .Y(N1874) );
  OA22XL U2437 ( .A0(n939), .A1(n1690), .B0(n949), .B1(n1689), .Y(n1613) );
  OAI221XL U2438 ( .A0(n943), .A1(n2095), .B0(n933), .B1(n2059), .C0(n1743), 
        .Y(N1938) );
  OA22XL U2439 ( .A0(n757), .A1(n1745), .B0(n923), .B1(n2058), .Y(n1743) );
  OAI221XL U2440 ( .A0(n942), .A1(n2095), .B0(n932), .B1(n2059), .C0(n1742), 
        .Y(N1937) );
  OA22XL U2441 ( .A0(n758), .A1(n1745), .B0(n922), .B1(n2058), .Y(n1742) );
  OAI221XL U2442 ( .A0(n941), .A1(n2095), .B0(n931), .B1(n2059), .C0(n1741), 
        .Y(N1936) );
  OA22XL U2443 ( .A0(n759), .A1(n1745), .B0(n921), .B1(n2058), .Y(n1741) );
  OAI221XL U2444 ( .A0(n1386), .A1(n877), .B0(n1387), .B1(n867), .C0(n1681), 
        .Y(N1902) );
  OA22XL U2445 ( .A0(n887), .A1(n1690), .B0(n897), .B1(n1689), .Y(n1681) );
  OAI221XL U2446 ( .A0(n556), .A1(n876), .B0(n1387), .B1(n866), .C0(n1680), 
        .Y(N1901) );
  OA22XL U2447 ( .A0(n886), .A1(n1690), .B0(n896), .B1(n1689), .Y(n1680) );
  OAI221XL U2448 ( .A0(n940), .A1(n2095), .B0(n930), .B1(n2059), .C0(n1740), 
        .Y(N1935) );
  OA22XL U2449 ( .A0(n760), .A1(n1745), .B0(n920), .B1(n2058), .Y(n1740) );
  AND2XL U2450 ( .A(N1823), .B(n1406), .Y(area_6_reg[14]) );
  OAI221XL U2451 ( .A0(n928), .A1(n556), .B0(n918), .B1(n1388), .C0(n1608), 
        .Y(N1873) );
  OA22XL U2452 ( .A0(n938), .A1(n1690), .B0(n948), .B1(n1689), .Y(n1608) );
  OAI221XL U2453 ( .A0(n927), .A1(n1386), .B0(n917), .B1(n1387), .C0(n1603), 
        .Y(N1872) );
  OA22XL U2454 ( .A0(n937), .A1(n1690), .B0(n947), .B1(n1689), .Y(n1603) );
  OAI221XL U2455 ( .A0(n889), .A1(n2095), .B0(n879), .B1(n2059), .C0(n1517), 
        .Y(N1844) );
  OA22XL U2456 ( .A0(n751), .A1(n1745), .B0(n869), .B1(n2058), .Y(n1517) );
  OAI221XL U2457 ( .A0(n888), .A1(n2095), .B0(n878), .B1(n2059), .C0(n1512), 
        .Y(N1843) );
  OA22XL U2458 ( .A0(n752), .A1(n1745), .B0(n868), .B1(n2058), .Y(n1512) );
  OAI221XL U2459 ( .A0(n939), .A1(n2095), .B0(n929), .B1(n2059), .C0(n1739), 
        .Y(N1934) );
  OA22XL U2460 ( .A0(n761), .A1(n1745), .B0(n919), .B1(n2058), .Y(n1739) );
  AND2XL U2461 ( .A(N1822), .B(n1406), .Y(area_6_reg[13]) );
  OAI221XL U2462 ( .A0(n887), .A1(n2095), .B0(n877), .B1(n2059), .C0(n1507), 
        .Y(N1842) );
  OA22XL U2463 ( .A0(n753), .A1(n1745), .B0(n867), .B1(n2058), .Y(n1507) );
  OAI221XL U2464 ( .A0(n886), .A1(n2095), .B0(n876), .B1(n2059), .C0(n1502), 
        .Y(N1841) );
  OA22XL U2465 ( .A0(n754), .A1(n1745), .B0(n866), .B1(n2058), .Y(n1502) );
  OAI221XL U2466 ( .A0(n1386), .A1(n926), .B0(n1387), .B1(n916), .C0(n1598), 
        .Y(N1871) );
  OA22XL U2467 ( .A0(n936), .A1(n1690), .B0(n946), .B1(n1689), .Y(n1598) );
  AND2XL U2468 ( .A(N1821), .B(n1406), .Y(area_6_reg[12]) );
  OAI221XL U2469 ( .A0(n938), .A1(n2095), .B0(n928), .B1(n2059), .C0(n1738), 
        .Y(N1933) );
  OA22XL U2470 ( .A0(n762), .A1(n1745), .B0(n918), .B1(n2058), .Y(n1738) );
  OAI221XL U2471 ( .A0(n937), .A1(n2095), .B0(n927), .B1(n2059), .C0(n1737), 
        .Y(N1932) );
  OA22XL U2472 ( .A0(n763), .A1(n1745), .B0(n917), .B1(n2058), .Y(n1737) );
  AND2XL U2473 ( .A(N1820), .B(n1406), .Y(area_6_reg[11]) );
  OAI221XL U2474 ( .A0(n936), .A1(n2095), .B0(n926), .B1(n2059), .C0(n1736), 
        .Y(N1931) );
  OA22XL U2475 ( .A0(n764), .A1(n1745), .B0(n916), .B1(n2058), .Y(n1736) );
  AND2XL U2476 ( .A(N1819), .B(n1406), .Y(area_6_reg[10]) );
  AND2X2 U2477 ( .A(N1818), .B(n1404), .Y(area_6_reg[9]) );
  AND2X2 U2478 ( .A(N1817), .B(n1404), .Y(area_6_reg[8]) );
  AND2X2 U2479 ( .A(N1816), .B(n1401), .Y(area_6_reg[7]) );
  AND2X2 U2480 ( .A(N1815), .B(n1401), .Y(area_6_reg[6]) );
  AND2X2 U2481 ( .A(N1814), .B(n1405), .Y(area_6_reg[5]) );
  AND2X2 U2482 ( .A(N1813), .B(n1406), .Y(area_6_reg[4]) );
  AND2X2 U2483 ( .A(N1812), .B(n1404), .Y(area_6_reg[3]) );
  AND2X2 U2484 ( .A(N1811), .B(n1404), .Y(area_6_reg[2]) );
  OAI221XL U2485 ( .A0(n106), .A1(n1499), .B0(n766), .B1(n2033), .C0(n2057), 
        .Y(n769) );
  OA22X1 U2486 ( .A0(n1471), .A1(n1474), .B0(n1481), .B1(n1462), .Y(n1463) );
  CLKINVX1 U2487 ( .A(n365), .Y(n1462) );
  XNOR2X1 U2488 ( .A(n767), .B(n2033), .Y(n770) );
  NAND4X1 U2489 ( .A(store_counter[1]), .B(store_counter[0]), .C(n1495), .D(
        n1205), .Y(n361) );
  CLKINVX1 U2490 ( .A(n1476), .Y(n1486) );
  NAND3BXL U2491 ( .AN(n1804), .B(store_counter[1]), .C(n1493), .Y(n1476) );
  NAND3BX1 U2492 ( .AN(store_counter[2]), .B(n1548), .C(n1364), .Y(n2094) );
  AND2X2 U2493 ( .A(store_counter[0]), .B(n1495), .Y(n1364) );
  NAND3BX1 U2494 ( .AN(n1478), .B(n1482), .C(n1477), .Y(n1169) );
  NAND2X1 U2495 ( .A(n460), .B(n1389), .Y(n1477) );
  NAND2X1 U2496 ( .A(n365), .B(n435), .Y(n460) );
  XOR2XL U2497 ( .A(n1499), .B(n797), .Y(n772) );
  CLKMX2X2 U2498 ( .A(n1364), .B(n1480), .S0(store_counter[1]), .Y(n1165) );
  AO22XL U2499 ( .A0(n1470), .A1(n1362), .B0(n1469), .B1(n1551), .Y(n1171) );
  NOR2X1 U2500 ( .A(n2030), .B(n767), .Y(n438) );
  MXI2XL U2501 ( .A(n1468), .B(n1365), .S0(n799), .Y(n1167) );
  NAND2XL U2502 ( .A(n1468), .B(n1467), .Y(n1365) );
  CLKINVX1 U2503 ( .A(n1469), .Y(n1468) );
  NOR2X1 U2504 ( .A(n2096), .B(n766), .Y(n395) );
  OAI221XL U2505 ( .A0(n833), .A1(n1375), .B0(n822), .B1(n1399), .C0(n1871), 
        .Y(N2092) );
  AOI222XL U2506 ( .A0(n1870), .A1(n2055), .B0(n1383), .B1(n2056), .C0(n1868), 
        .C1(n1867), .Y(n1871) );
  OAI221XL U2507 ( .A0(n832), .A1(n1375), .B0(n821), .B1(n1399), .C0(n1866), 
        .Y(N2093) );
  AOI222XL U2508 ( .A0(n1870), .A1(n2053), .B0(n1383), .B1(n2054), .C0(n1868), 
        .C1(n1865), .Y(n1866) );
  OAI221XL U2509 ( .A0(n831), .A1(n1375), .B0(n820), .B1(n1399), .C0(n1864), 
        .Y(N2094) );
  AOI222XL U2510 ( .A0(n1870), .A1(n2051), .B0(n1383), .B1(n2052), .C0(n1868), 
        .C1(n1863), .Y(n1864) );
  OAI221XL U2511 ( .A0(n830), .A1(n1375), .B0(n819), .B1(n1399), .C0(n1862), 
        .Y(N2095) );
  AOI222XL U2512 ( .A0(n1870), .A1(n2049), .B0(n1383), .B1(n2050), .C0(n1868), 
        .C1(n1861), .Y(n1862) );
  OAI221XL U2513 ( .A0(n829), .A1(n1375), .B0(n818), .B1(n1399), .C0(n1860), 
        .Y(N2096) );
  AOI222XL U2514 ( .A0(n1870), .A1(n2047), .B0(n1383), .B1(n2048), .C0(n1868), 
        .C1(n1859), .Y(n1860) );
  OAI221XL U2515 ( .A0(n828), .A1(n1375), .B0(n817), .B1(n1399), .C0(n1858), 
        .Y(N2097) );
  AOI222XL U2516 ( .A0(n1870), .A1(n2045), .B0(n1383), .B1(n2046), .C0(n1868), 
        .C1(n1857), .Y(n1858) );
  OAI221XL U2517 ( .A0(n827), .A1(n1375), .B0(n816), .B1(n1399), .C0(n1856), 
        .Y(N2098) );
  AOI222XL U2518 ( .A0(n1870), .A1(n2043), .B0(n1383), .B1(n2044), .C0(n1868), 
        .C1(n1855), .Y(n1856) );
  OAI221XL U2519 ( .A0(n826), .A1(n1375), .B0(n815), .B1(n1399), .C0(n1854), 
        .Y(N2099) );
  AOI222XL U2520 ( .A0(n1870), .A1(n2041), .B0(n1383), .B1(n2042), .C0(n1868), 
        .C1(n1853), .Y(n1854) );
  OAI221XL U2521 ( .A0(n825), .A1(n1375), .B0(n814), .B1(n1399), .C0(n1852), 
        .Y(N2100) );
  AOI222XL U2522 ( .A0(n1870), .A1(n2039), .B0(n1383), .B1(n2040), .C0(n1868), 
        .C1(n1851), .Y(n1852) );
  OAI221XL U2523 ( .A0(n824), .A1(n1375), .B0(n813), .B1(n1399), .C0(n1850), 
        .Y(N2101) );
  AOI222XL U2524 ( .A0(n1870), .A1(n2037), .B0(n1383), .B1(n2038), .C0(n1868), 
        .C1(n1849), .Y(n1850) );
  OAI221XL U2525 ( .A0(n823), .A1(n1375), .B0(n812), .B1(n1399), .C0(n1848), 
        .Y(N2102) );
  AOI222XL U2526 ( .A0(n1870), .A1(n2035), .B0(n1383), .B1(n2036), .C0(n1868), 
        .C1(n1847), .Y(n1848) );
  OAI221XL U2527 ( .A0(n822), .A1(n1375), .B0(n811), .B1(n1399), .C0(n1845), 
        .Y(N2103) );
  AOI222XL U2528 ( .A0(n1844), .A1(n2056), .B0(n1382), .B1(n1842), .C0(n2117), 
        .C1(n1869), .Y(n1845) );
  OAI221XL U2529 ( .A0(n821), .A1(n1375), .B0(n810), .B1(n1399), .C0(n1841), 
        .Y(N2104) );
  AOI222XL U2530 ( .A0(n1844), .A1(n2054), .B0(n1382), .B1(n1840), .C0(n2115), 
        .C1(n1869), .Y(n1841) );
  AOI222XL U2531 ( .A0(n1844), .A1(n2052), .B0(n1382), .B1(n1838), .C0(n2113), 
        .C1(n1869), .Y(n1839) );
  AOI222XL U2532 ( .A0(n1844), .A1(n2050), .B0(n1382), .B1(n1836), .C0(n2111), 
        .C1(n1869), .Y(n1837) );
  AOI222XL U2533 ( .A0(n1844), .A1(n2048), .B0(n1382), .B1(n1834), .C0(n2109), 
        .C1(n1869), .Y(n1835) );
  AOI222XL U2534 ( .A0(n1844), .A1(n2046), .B0(n1382), .B1(n1832), .C0(n2107), 
        .C1(n1869), .Y(n1833) );
  AOI222XL U2535 ( .A0(n1844), .A1(n2044), .B0(n1382), .B1(n1830), .C0(n2105), 
        .C1(n1383), .Y(n1831) );
  AOI222XL U2536 ( .A0(n1844), .A1(n2042), .B0(n1382), .B1(n1828), .C0(n2103), 
        .C1(n1383), .Y(n1829) );
  AOI222XL U2537 ( .A0(n1844), .A1(n2040), .B0(n1382), .B1(n1826), .C0(n2101), 
        .C1(n1383), .Y(n1827) );
  AOI222XL U2538 ( .A0(n1844), .A1(n2038), .B0(n1382), .B1(n1824), .C0(n2099), 
        .C1(n1383), .Y(n1825) );
  AOI222XL U2539 ( .A0(n1844), .A1(n2036), .B0(n1382), .B1(n1822), .C0(n2097), 
        .C1(n1383), .Y(n1823) );
  CLKINVX1 U2540 ( .A(n976), .Y(n2019) );
  CLKINVX1 U2541 ( .A(n974), .Y(n2017) );
  CLKINVX1 U2542 ( .A(n971), .Y(n2014) );
  CLKINVX1 U2543 ( .A(n975), .Y(n2018) );
  CLKINVX1 U2544 ( .A(n973), .Y(n2016) );
  CLKINVX1 U2545 ( .A(n972), .Y(n2015) );
  CLKINVX1 U2546 ( .A(n970), .Y(n2013) );
  CLKINVX1 U2547 ( .A(n967), .Y(n2010) );
  CLKINVX1 U2548 ( .A(n962), .Y(n1996) );
  CLKINVX1 U2549 ( .A(n961), .Y(n1995) );
  CLKINVX1 U2550 ( .A(n959), .Y(n1993) );
  CLKINVX1 U2551 ( .A(n958), .Y(n1992) );
  CLKINVX1 U2552 ( .A(n965), .Y(n1999) );
  CLKINVX1 U2553 ( .A(n957), .Y(n1991) );
  CLKINVX1 U2554 ( .A(n960), .Y(n1994) );
  CLKINVX1 U2555 ( .A(n963), .Y(n1997) );
  CLKINVX1 U2556 ( .A(n964), .Y(n1998) );
  CLKINVX1 U2557 ( .A(n956), .Y(n1990) );
  CLKINVX1 U2558 ( .A(n968), .Y(n2011) );
  CLKINVX1 U2559 ( .A(n969), .Y(n2012) );
  CLKINVX1 U2560 ( .A(n966), .Y(n2000) );
  CLKINVX1 U2561 ( .A(n977), .Y(n2020) );
  MX2XL U2562 ( .A(n1465), .B(n1470), .S0(n800), .Y(n1172) );
  NAND4X4 U2563 ( .A(n1937), .B(n1936), .C(n1935), .D(n1934), .Y(n1938) );
  OAI211X4 U2564 ( .A0(n864), .A1(n1800), .B0(n1589), .C0(n1588), .Y(
        \geofence_X_reg[0][1] ) );
  OAI211X4 U2565 ( .A0(n893), .A1(n1331), .B0(n1723), .C0(n1722), .Y(
        \geofence_X_reg[1][2] ) );
  AO21X4 U2566 ( .A0(n1362), .A1(n1406), .B0(n1359), .Y(n1732) );
  AO22X1 U2567 ( .A0(n1404), .A1(\geofence_Y_reg[0][1] ), .B0(N1942), .B1(
        n1391), .Y(I[1]) );
  OAI211X4 U2568 ( .A0(n914), .A1(n1800), .B0(n1791), .C0(n1790), .Y(
        \geofence_Y_reg[0][1] ) );
  NAND2X1 U2569 ( .A(side_length_after[10]), .B(n1947), .Y(n1976) );
  INVXL U2570 ( .A(side_length_after[10]), .Y(n1978) );
  AND2X1 U2571 ( .A(n1977), .B(n1976), .Y(n1979) );
  NAND2XL U2572 ( .A(n1325), .B(n1467), .Y(n1464) );
  NAND2XL U2573 ( .A(n1325), .B(n1466), .Y(n1469) );
  AO21XL U2574 ( .A0(n1475), .A1(n1471), .B0(n1461), .Y(n1474) );
  NAND2XL U2575 ( .A(n1649), .B(n1474), .Y(n1170) );
  AO22X1 U2576 ( .A0(n1404), .A1(\geofence_Y_reg[1][2] ), .B0(N1883), .B1(
        n1390), .Y(G[2]) );
  OAI211X4 U2577 ( .A0(n945), .A1(n1331), .B0(n1679), .C0(n1678), .Y(
        \geofence_Y_reg[1][0] ) );
  NAND2X8 U2578 ( .A(n1343), .B(n1412), .Y(n1819) );
  AO22X1 U2579 ( .A0(n1405), .A1(\geofence_X_reg[0][1] ), .B0(N1852), .B1(
        n1391), .Y(F[1]) );
  OAI211X4 U2580 ( .A0(n944), .A1(n1331), .B0(n1676), .C0(n1675), .Y(
        \geofence_Y_reg[1][1] ) );
  OAI211X4 U2581 ( .A0(n894), .A1(n1331), .B0(n1727), .C0(n1726), .Y(
        \geofence_X_reg[1][1] ) );
  NAND2X1 U2582 ( .A(side_length_after[9]), .B(n1948), .Y(n1977) );
  CLKINVX6 U2583 ( .A(n1377), .Y(n1378) );
  OAI211X2 U2584 ( .A0(n856), .A1(n1800), .B0(n1557), .C0(n1556), .Y(
        \geofence_X_reg[0][9] ) );
  OAI211X2 U2585 ( .A0(n862), .A1(n1800), .B0(n1581), .C0(n1580), .Y(
        \geofence_X_reg[0][3] ) );
  AOI222X2 U2586 ( .A0(n1733), .A1(\geofence_Y[1][8] ), .B0(n1380), .B1(n1753), 
        .C0(n1730), .C1(n1653), .Y(n1654) );
  OAI211X2 U2587 ( .A0(n937), .A1(n1331), .B0(n1655), .C0(n1654), .Y(
        \geofence_Y_reg[1][8] ) );
  AOI222X2 U2588 ( .A0(n1733), .A1(\geofence_Y[1][1] ), .B0(n1732), .B1(n1788), 
        .C0(n1730), .C1(n1674), .Y(n1675) );
  AOI222X2 U2589 ( .A0(n1374), .A1(n1789), .B0(n1795), .B1(n1788), .C0(n1376), 
        .C1(n1787), .Y(n1790) );
  NAND2X2 U2590 ( .A(\geofence_X_reg[1][8] ), .B(n1873), .Y(n1899) );
  NAND2X2 U2591 ( .A(\geofence_X_reg[1][9] ), .B(n1902), .Y(n1900) );
  NAND2X2 U2592 ( .A(\geofence_X_reg[1][6] ), .B(n1893), .Y(n1887) );
  AO22X4 U2593 ( .A0(N2136), .A1(n1909), .B0(N2126), .B1(n1908), .Y(X_REG[9])
         );
  AO22X4 U2594 ( .A0(N2135), .A1(n1909), .B0(N2125), .B1(n1908), .Y(X_REG[8])
         );
  AO22X4 U2595 ( .A0(N2134), .A1(n1909), .B0(N2124), .B1(n1908), .Y(X_REG[7])
         );
  AO22X4 U2596 ( .A0(N2133), .A1(n1909), .B0(N2123), .B1(n1908), .Y(X_REG[6])
         );
  AO22X4 U2597 ( .A0(N2132), .A1(n1909), .B0(N2122), .B1(n1908), .Y(X_REG[5])
         );
  AO22X4 U2598 ( .A0(N2131), .A1(n1909), .B0(N2121), .B1(n1908), .Y(X_REG[4])
         );
  AO22X4 U2599 ( .A0(N2130), .A1(n1909), .B0(N2120), .B1(n1908), .Y(X_REG[3])
         );
  AO22X4 U2600 ( .A0(N2129), .A1(n1909), .B0(N2119), .B1(n1908), .Y(X_REG[2])
         );
  AO22X4 U2601 ( .A0(N2128), .A1(n1909), .B0(N2118), .B1(n1908), .Y(X_REG[1])
         );
  NAND2X2 U2602 ( .A(\geofence_Y_reg[1][8] ), .B(n1910), .Y(n1936) );
  NAND2X2 U2603 ( .A(\geofence_Y_reg[1][9] ), .B(n1939), .Y(n1937) );
  NOR2BX4 U2604 ( .AN(\geofence_Y_reg[1][2] ), .B(\geofence_Y_reg[0][2] ), .Y(
        n1920) );
  AO22X4 U2605 ( .A0(N2168), .A1(n1352), .B0(N2158), .B1(n1350), .Y(Y_REG[9])
         );
  AO22X4 U2606 ( .A0(N2163), .A1(n1352), .B0(N2153), .B1(n1350), .Y(Y_REG[4])
         );
  AO22X4 U2607 ( .A0(N2160), .A1(n1352), .B0(N2150), .B1(n1350), .Y(Y_REG[1])
         );
  AND2X4 U2608 ( .A(N2234), .B(n1418), .Y(side_length_before[15]) );
  AND2X4 U2609 ( .A(N2233), .B(n1418), .Y(side_length_before[14]) );
  NAND2X2 U2610 ( .A(N2261), .B(n1413), .Y(n1948) );
  CLKINVX6 U2611 ( .A(n1948), .Y(\gt_699/A[9] ) );
  NAND2X2 U2612 ( .A(N2260), .B(n1412), .Y(n1975) );
  AOI2BB1X2 U2613 ( .A0N(\gt_699/A[2] ), .A1N(n1961), .B0(n1959), .Y(n1964) );
  AO22X4 U2614 ( .A0(\gt_699/A[2] ), .A1(n1961), .B0(n1431), .B1(n1960), .Y(
        n1962) );
  OAI211X2 U2615 ( .A0(n1985), .A1(n1984), .B0(n1983), .C0(n1982), .Y(n1986)
         );
  AO22X4 U2616 ( .A0(N2313), .A1(n1326), .B0(N2301), .B1(n1384), .Y(E[11]) );
  AO22X4 U2617 ( .A0(N2312), .A1(n1326), .B0(N2300), .B1(n1384), .Y(E[10]) );
  AO22X4 U2618 ( .A0(N2311), .A1(n1326), .B0(N2299), .B1(n1384), .Y(E[9]) );
  AO22X4 U2619 ( .A0(N2310), .A1(n1326), .B0(N2298), .B1(n1384), .Y(E[8]) );
  AO22X4 U2620 ( .A0(N2309), .A1(n1326), .B0(N2297), .B1(n1384), .Y(E[7]) );
  AO22X4 U2621 ( .A0(N2307), .A1(n1326), .B0(N2295), .B1(n1384), .Y(E[5]) );
  AO22X4 U2622 ( .A0(N2306), .A1(n1326), .B0(N2294), .B1(n1384), .Y(E[4]) );
  AO22X4 U2623 ( .A0(N2305), .A1(n1326), .B0(N2293), .B1(n1384), .Y(E[3]) );
  AO22X4 U2624 ( .A0(N2304), .A1(n1326), .B0(N2292), .B1(n1384), .Y(E[2]) );
  AO22X4 U2625 ( .A0(N2303), .A1(n1326), .B0(N2291), .B1(n1384), .Y(E[1]) );
  AND2X4 U2626 ( .A(N2283), .B(n1417), .Y(area_sqrt1_before[19]) );
  AND2X4 U2627 ( .A(N2369), .B(n1415), .Y(area_sqrt2_before[17]) );
  AND2X4 U2628 ( .A(N2368), .B(n1415), .Y(area_sqrt2_before[16]) );
endmodule

