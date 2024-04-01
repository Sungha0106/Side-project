/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : T-2022.03
// Date      : Wed Jan  3 22:22:50 2024
/////////////////////////////////////////////////////////////


module JAM_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3;
  wire   [9:1] carry;

  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  CMPR32X2 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  AND2X2 U2 ( .A(A[8]), .B(n3), .Y(n2) );
  XOR2XL U3 ( .A(A[8]), .B(n3), .Y(SUM[8]) );
  XOR2X1 U4 ( .A(A[9]), .B(n2), .Y(SUM[9]) );
  AND2X2 U5 ( .A(A[7]), .B(carry[7]), .Y(n3) );
  XOR2X1 U6 ( .A(A[7]), .B(carry[7]), .Y(SUM[7]) );
  XOR2X1 U7 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module JAM_DW01_add_1 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3;
  wire   [9:1] carry;

  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2 U1 ( .A(A[7]), .B(carry[7]), .Y(n3) );
  AND2X2 U2 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U3 ( .A(A[8]), .B(n3), .Y(SUM[8]) );
  AND2X2 U4 ( .A(A[8]), .B(n3), .Y(n2) );
  XOR2X2 U5 ( .A(n2), .B(A[9]), .Y(SUM[9]) );
  XOR2XL U6 ( .A(A[7]), .B(carry[7]), .Y(SUM[7]) );
  XOR2XL U7 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module JAM ( CLK, RST, W, J, Cost, MatchCount, MinCost, Valid );
  output [2:0] W;
  output [2:0] J;
  input [6:0] Cost;
  output [3:0] MatchCount;
  output [9:0] MinCost;
  input CLK, RST;
  output Valid;
  wire   n893, n894, n895, n896, n897, n898, n899, n900, n901, n902, n903,
         n904, n905, n906, N61, N62, N63, N64, N373, N376, N377, N378, N379,
         N380, N381, N382, N383, N384, N385, N435, N436, N437, N438, N439,
         N440, N441, N442, N443, N444, N538, N539, N540, N541, N542, N543,
         N544, n136, n137, n138, n139, n140, n141, n142, n143, n144, n146,
         n147, n148, n149, n150, n151, n153, n154, n155, n157, n158, n159,
         n160, n161, n162, n163, n164, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n181, n183, n184, n185,
         n187, n188, n189, n190, n193, n194, n195, n196, n198, n199, n200,
         n201, n202, n203, n204, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n219, n220, n221, n223, n224, n225,
         n226, n227, n230, n232, n233, n234, n236, n238, n239, n240, n242,
         n244, n246, n247, n249, n250, n251, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n267, n268, n270, n271,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n286, n287, n289, n290, n293, n296, n297, n298, n299, n300,
         n301, n303, n304, n305, n306, n307, n308, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n322, n325, n326, n327, n330,
         n333, n335, n338, n340, n342, n343, n345, n346, n347, n350, n352,
         n355, n357, n358, n361, n362, n365, n366, n369, n370, n371, n373,
         n374, n375, n376, n377, n378, n380, n383, n384, n385, n387, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n444, n445, n446, n447, n449, n450, n451,
         n452, n453, n455, n457, n458, n459, n460, n461, n463, n464, n465,
         n466, n467, n468, n469, n470, n471, n472, n473, n475, n476, n477,
         n479, n482, n483, n484, n485, n486, n487, n488, n489, n491, n493,
         n494, n495, n496, n497, n498, n499, n501, n502, n503, n504, n505,
         n506, n507, n508, n509, n510, n511, n512, n513, n514, n515, n516,
         n517, n519, n520, n521, n522, n523, n525, n526, n527, n528, n529,
         n530, n532, n533, n534, n537, n538, n539, n540, n541, n542, n543,
         n544, n545, n546, n547, n548, n549, n550, n551, n552, n553, n554,
         n555, n556, n557, n558, n559, n560, n561, n562, n563, n564, n565,
         n566, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         n612, n613, n614, n616, n617, n618, n621, n622, n623, n624, n625,
         n627, n629, n630, n631, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671,
         n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682,
         n683, n684, n685, n686, n687, n688, n689, n690, n691, n692, n693,
         n694, n695, n696, n697, n698, n699, n700, n701, n702, n703, n704,
         n705, n706, n707, n708, n710, n711, n712, n713, n714, n715, n716,
         n717, n718, n719, n720, n721, n722, n723, n724, n725, n726, n727,
         n728, n729, n730, n731, n732, n733, n734, n735, n736, n737, n738,
         n739, n740, n741, n742, n743, n744, n745, n746, n747, n748, n749,
         n750, n751, n752, n753, n754, n755, n756, n757, n758, n759, n760,
         n762, n773, n774, n775, n776, n777, n778, n779, n780, n781, n782,
         n783, n784, n785, n786, n787, n788, n789, n790, n791, n792, n793,
         n794, n795, n796, n797, n798, n799, n800, n801, n802, n803, n804,
         n805, n806, n807, n808, n809, n810, n811, n812, n813, n814, n815,
         n816, n817, n818, n819, n820, n821, n822, n823, n824, n825, n826,
         n827, n828, n829, n830, n831, n832, n833, n834, n835, n836, n837,
         n838, n839, n840, n841, n842, n843, n844, n845, n846, n847, n848,
         n849, n850, n851, n852, n853, n854, n855, n856, n857, n858, n859,
         n860, n861, n862, n863, n864, n865, n866, n867, n868, n869, n870,
         n871, n872, n873, n874, n875, n876, n877, n878, n879, n880, n881,
         n882;
  wire   [2:0] state;
  wire   [2:0] next_state;
  wire   [9:0] MinCost_1;

  JAM_DW01_add_0 add_491_aco ( .A(MinCost_1), .B({1'b0, 1'b0, 1'b0, N544, N543, 
        N542, N541, N540, N539, N538}), .CI(1'b0), .SUM({N444, N443, N442, 
        N441, N440, N439, N438, N437, N436, N435}) );
  JAM_DW01_add_1 add_449_aco ( .A({n897, n898, n899, n900, n901, n902, 
        MinCost[3], n903, n904, n905}), .B({1'b0, 1'b0, 1'b0, N544, N543, N542, 
        N541, N540, N539, n778}), .CI(1'b0), .SUM({N385, N384, N383, N382, 
        N381, N380, N379, N378, N377, N376}) );
  DFFRX1 counter_reg ( .D(n745), .CK(CLK), .RN(n807), .Q(n760), .QN(n641) );
  DFFRX1 \MinCost_1_reg[7]  ( .D(n718), .CK(CLK), .RN(n808), .Q(MinCost_1[7]), 
        .QN(n703) );
  DFFRX1 \MinCost_1_reg[5]  ( .D(n720), .CK(CLK), .RN(n808), .Q(MinCost_1[5]), 
        .QN(n705) );
  DFFRX1 \MinCost_1_reg[6]  ( .D(n719), .CK(CLK), .RN(n808), .Q(MinCost_1[6]), 
        .QN(n704) );
  DFFRX1 \MinCost_1_reg[4]  ( .D(n721), .CK(CLK), .RN(n808), .Q(MinCost_1[4]), 
        .QN(n635) );
  DFFRX1 \state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(n807), .Q(state[1]), 
        .QN(n759) );
  DFFRX1 \MinCost_1_reg[0]  ( .D(n725), .CK(CLK), .RN(n807), .Q(MinCost_1[0]), 
        .QN(n631) );
  DFFRX1 \MinCost_1_reg[1]  ( .D(n724), .CK(CLK), .RN(n807), .Q(MinCost_1[1]), 
        .QN(n708) );
  DFFRX1 \MinCost_1_reg[2]  ( .D(n723), .CK(CLK), .RN(n807), .Q(MinCost_1[2]), 
        .QN(n707) );
  DFFRX1 \MinCost_1_reg[3]  ( .D(n722), .CK(CLK), .RN(n808), .Q(MinCost_1[3]), 
        .QN(n706) );
  DFFRX1 \J_0_reg[2]  ( .D(n742), .CK(CLK), .RN(n807), .QN(n660) );
  DFFSX1 \J_7_reg[2]  ( .D(n656), .CK(CLK), .SN(n807), .QN(n681) );
  DFFSX1 \J_6_reg[2]  ( .D(n654), .CK(CLK), .SN(n806), .QN(n678) );
  DFFSX1 \J_7_reg[0]  ( .D(n659), .CK(CLK), .SN(n809), .Q(n753), .QN(n683) );
  DFFSX1 \J_7_reg[1]  ( .D(n658), .CK(CLK), .SN(n807), .Q(n751), .QN(n682) );
  DFFRX1 \J_0_reg[1]  ( .D(n744), .CK(CLK), .RN(n806), .QN(n661) );
  DFFRX1 \J_6_reg[0]  ( .D(n657), .CK(CLK), .RN(n806), .Q(n757), .QN(n680) );
  DFFRX1 \J_3_reg[2]  ( .D(n739), .CK(CLK), .RN(n806), .QN(n669) );
  DFFSX1 \J_5_reg[0]  ( .D(n737), .CK(CLK), .SN(n809), .Q(n750), .QN(n677) );
  DFFRX1 \J_2_reg[2]  ( .D(n738), .CK(CLK), .RN(n806), .QN(n663) );
  DFFRX1 \J_5_reg[1]  ( .D(n736), .CK(CLK), .RN(n806), .Q(n756), .QN(n676) );
  DFFRX1 \J_0_reg[0]  ( .D(n743), .CK(CLK), .RN(n806), .QN(n662) );
  DFFSX1 \J_6_reg[1]  ( .D(n655), .CK(CLK), .SN(n809), .QN(n679) );
  DFFSX1 \J_3_reg[0]  ( .D(n733), .CK(CLK), .SN(n807), .Q(n754), .QN(n671) );
  DFFSX1 \J_3_reg[1]  ( .D(n732), .CK(CLK), .SN(n808), .QN(n670) );
  DFFSX1 \J_5_reg[2]  ( .D(n741), .CK(CLK), .SN(n806), .QN(n675) );
  DFFRX1 \J_2_reg[0]  ( .D(n731), .CK(CLK), .RN(n806), .Q(n749), .QN(n665) );
  DFFRX1 \J_1_reg[2]  ( .D(n727), .CK(CLK), .RN(n806), .QN(n666) );
  DFFRX1 \J_1_reg[1]  ( .D(n728), .CK(CLK), .RN(n806), .QN(n667) );
  DFFSX1 \J_1_reg[0]  ( .D(n729), .CK(CLK), .SN(n809), .Q(n752), .QN(n668) );
  TLATX1 \next_state_reg[2]  ( .G(N61), .D(N64), .Q(next_state[2]) );
  TLATX1 \next_state_reg[1]  ( .G(N61), .D(N63), .Q(next_state[1]) );
  TLATX1 \next_state_reg[0]  ( .G(N61), .D(N62), .Q(next_state[0]) );
  DFFRX1 \state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(n806), .Q(state[0])
         );
  DFFRX1 \state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(n807), .Q(state[2]), 
        .QN(n758) );
  DFFSX1 \J_4_reg[2]  ( .D(n740), .CK(CLK), .SN(n809), .QN(n672) );
  DFFRX1 \J_4_reg[0]  ( .D(n735), .CK(CLK), .RN(n806), .Q(n755), .QN(n674) );
  DFFRX1 \J_4_reg[1]  ( .D(n734), .CK(CLK), .RN(n806), .QN(n673) );
  DFFSX1 \J_2_reg[1]  ( .D(n730), .CK(CLK), .SN(n807), .QN(n664) );
  DFFRX1 \MinCost_1_reg[8]  ( .D(n726), .CK(CLK), .RN(n807), .Q(MinCost_1[8]), 
        .QN(n702) );
  DFFRX1 \MinCost_1_reg[9]  ( .D(n717), .CK(CLK), .RN(n808), .Q(MinCost_1[9]), 
        .QN(n701) );
  DFFRX1 \MinCost_reg[7]  ( .D(n687), .CK(CLK), .RN(n809), .Q(n899), .QN(n638)
         );
  DFFRX1 \MinCost_reg[0]  ( .D(n694), .CK(CLK), .RN(n808), .Q(n905), .QN(n697)
         );
  DFFRX1 \MinCost_reg[6]  ( .D(n688), .CK(CLK), .RN(n809), .Q(n900), .QN(n637)
         );
  DFFRX1 \MinCost_reg[5]  ( .D(n689), .CK(CLK), .RN(n809), .Q(n901), .QN(n636)
         );
  DFFRX1 \MinCost_reg[2]  ( .D(n692), .CK(CLK), .RN(n809), .Q(n903), .QN(n633)
         );
  DFFRX1 \W_reg[1]  ( .D(n748), .CK(CLK), .RN(n807), .Q(n893), .QN(n642) );
  DFFRX1 \MatchCount_reg[2]  ( .D(n714), .CK(CLK), .RN(n808), .QN(n698) );
  DFFRX1 \MatchCount_reg[3]  ( .D(n713), .CK(CLK), .RN(n808), .QN(n640) );
  DFFRX1 Valid_reg ( .D(n653), .CK(CLK), .RN(n807), .Q(n906), .QN(n646) );
  DFFRX1 \MatchCount_reg[1]  ( .D(n715), .CK(CLK), .RN(n808), .QN(n699) );
  DFFRX1 \MatchCount_reg[0]  ( .D(n716), .CK(CLK), .RN(n808), .QN(n700) );
  DFFSRX1 \J_reg[2]  ( .D(n712), .CK(CLK), .SN(n648), .RN(n647), .Q(n894), 
        .QN(n643) );
  DFFSRX1 \J_reg[0]  ( .D(n711), .CK(CLK), .SN(n650), .RN(n649), .Q(n896), 
        .QN(n644) );
  DFFSRX1 \J_reg[1]  ( .D(n710), .CK(CLK), .SN(n652), .RN(n651), .Q(n895), 
        .QN(n645) );
  DFFRX1 \MinCost_reg[1]  ( .D(n693), .CK(CLK), .RN(n809), .Q(n904), .QN(n632)
         );
  DFFRX1 \W_reg[0]  ( .D(n747), .CK(CLK), .RN(n809), .QN(n695) );
  DFFRX1 \W_reg[2]  ( .D(n746), .CK(CLK), .RN(n809), .Q(n880), .QN(n684) );
  DFFRX1 \MinCost_reg[3]  ( .D(n691), .CK(CLK), .RN(n809), .QN(n634) );
  DFFRX1 \MinCost_reg[8]  ( .D(n686), .CK(CLK), .RN(n808), .Q(n898), .QN(n630)
         );
  DFFRX1 \MinCost_reg[4]  ( .D(n690), .CK(CLK), .RN(n809), .Q(n902), .QN(n696)
         );
  DFFRX1 \MinCost_reg[9]  ( .D(n685), .CK(CLK), .RN(n809), .Q(n897), .QN(n639)
         );
  AND2X2 U570 ( .A(Cost[0]), .B(N373), .Y(N538) );
  INVX1 U571 ( .A(n340), .Y(n812) );
  CLKINVX1 U572 ( .A(n347), .Y(n833) );
  OAI21XL U573 ( .A0(n786), .A1(n873), .B0(n552), .Y(n513) );
  OAI21X2 U574 ( .A0(n788), .A1(n871), .B0(n596), .Y(n185) );
  AND2X2 U575 ( .A(Cost[1]), .B(N373), .Y(N539) );
  INVX16 U576 ( .A(n762), .Y(W[2]) );
  CLKINVX1 U577 ( .A(n880), .Y(n762) );
  OR2X1 U578 ( .A(n777), .B(n774), .Y(n685) );
  OR2X1 U579 ( .A(n775), .B(n776), .Y(n774) );
  OAI221X1 U580 ( .A0(n638), .A1(n781), .B0(n703), .B1(n780), .C0(n255), .Y(
        n687) );
  OAI221XL U581 ( .A0(n630), .A1(n781), .B0(n702), .B1(n780), .C0(n254), .Y(
        n686) );
  NAND2X1 U582 ( .A(N384), .B(n820), .Y(n254) );
  OAI2BB2XL U583 ( .B0(n701), .B1(n779), .A0N(N444), .A1N(n821), .Y(n717) );
  CLKINVX2 U584 ( .A(n297), .Y(N373) );
  INVX3 U585 ( .A(RST), .Y(n809) );
  INVX12 U586 ( .A(n634), .Y(MinCost[3]) );
  INVX16 U587 ( .A(n695), .Y(W[0]) );
  INVX12 U588 ( .A(n639), .Y(MinCost[9]) );
  INVX16 U589 ( .A(n632), .Y(MinCost[1]) );
  BUFX12 U590 ( .A(n895), .Y(J[1]) );
  BUFX12 U591 ( .A(n896), .Y(J[0]) );
  BUFX12 U592 ( .A(n894), .Y(J[2]) );
  INVX16 U593 ( .A(n700), .Y(MatchCount[0]) );
  INVX16 U594 ( .A(n699), .Y(MatchCount[1]) );
  BUFX12 U595 ( .A(n906), .Y(Valid) );
  INVX12 U596 ( .A(n640), .Y(MatchCount[3]) );
  INVX16 U597 ( .A(n698), .Y(MatchCount[2]) );
  BUFX12 U598 ( .A(n893), .Y(W[1]) );
  INVX12 U599 ( .A(n696), .Y(MinCost[4]) );
  BUFX12 U600 ( .A(n903), .Y(MinCost[2]) );
  INVX16 U601 ( .A(n636), .Y(MinCost[5]) );
  INVX16 U602 ( .A(n637), .Y(MinCost[6]) );
  BUFX12 U603 ( .A(n905), .Y(MinCost[0]) );
  INVX12 U604 ( .A(n638), .Y(MinCost[7]) );
  INVX16 U605 ( .A(n630), .Y(MinCost[8]) );
  INVX20 U606 ( .A(Cost[0]), .Y(n773) );
  NOR2X8 U607 ( .A(n773), .B(n297), .Y(n778) );
  NOR2XL U608 ( .A(n639), .B(n781), .Y(n775) );
  NOR2XL U609 ( .A(n701), .B(n780), .Y(n776) );
  AND2X2 U610 ( .A(N385), .B(n820), .Y(n777) );
  NOR3X1 U611 ( .A(n464), .B(n526), .C(n486), .Y(n499) );
  OAI21X2 U612 ( .A0(n798), .A1(n875), .B0(n606), .Y(n347) );
  OAI21XL U613 ( .A0(n795), .A1(n873), .B0(n607), .Y(n606) );
  NAND2X1 U614 ( .A(n831), .B(n173), .Y(n488) );
  AOI211X1 U615 ( .A0(n799), .A1(n874), .B0(n755), .C0(n789), .Y(n602) );
  OAI21X1 U616 ( .A0(n785), .A1(n860), .B0(n601), .Y(n482) );
  NOR2X1 U617 ( .A(n489), .B(n185), .Y(n190) );
  NAND2XL U618 ( .A(n859), .B(n458), .Y(n476) );
  OAI32XL U619 ( .A0(n752), .A1(n797), .A2(n149), .B0(n782), .B1(n835), .Y(
        n607) );
  AOI211XL U620 ( .A0(n796), .A1(n867), .B0(n868), .C0(n800), .Y(n585) );
  OAI32XL U621 ( .A0(n755), .A1(n792), .A2(n144), .B0(n790), .B1(n874), .Y(
        n528) );
  NOR2XL U622 ( .A(n751), .B(n796), .Y(n144) );
  AOI211XL U623 ( .A0(n782), .A1(n867), .B0(n868), .C0(n797), .Y(n580) );
  AO21X1 U624 ( .A0(n173), .A1(n240), .B0(n371), .Y(n387) );
  NAND3XL U625 ( .A(n859), .B(n457), .C(n370), .Y(n411) );
  NAND2XL U626 ( .A(n352), .B(n457), .Y(n396) );
  CLKINVX1 U627 ( .A(n526), .Y(n863) );
  CLKINVX1 U628 ( .A(n482), .Y(n859) );
  OA22XL U629 ( .A0(n525), .A1(n489), .B0(n477), .B1(n526), .Y(n431) );
  NOR2BX1 U630 ( .AN(n516), .B(n530), .Y(n370) );
  NOR2BX1 U631 ( .AN(n515), .B(n516), .Y(n446) );
  NOR2X1 U632 ( .A(n576), .B(n864), .Y(n227) );
  NOR2X2 U633 ( .A(n513), .B(n514), .Y(n246) );
  NOR2X1 U634 ( .A(n501), .B(n199), .Y(n239) );
  NAND3X1 U635 ( .A(n846), .B(n482), .C(n863), .Y(n183) );
  NOR2X1 U636 ( .A(n196), .B(n863), .Y(n184) );
  NAND4BXL U637 ( .AN(n147), .B(n148), .C(n149), .D(n150), .Y(n143) );
  OAI21X1 U638 ( .A0(n803), .A1(n873), .B0(n611), .Y(n529) );
  NOR2XL U639 ( .A(n783), .B(n878), .Y(n613) );
  AOI211XL U640 ( .A0(n783), .A1(n878), .B0(n749), .C0(n784), .Y(n612) );
  OAI21XL U641 ( .A0(n795), .A1(n876), .B0(n608), .Y(n551) );
  AOI211XL U642 ( .A0(n805), .A1(n867), .B0(n868), .C0(n793), .Y(n609) );
  NOR2X1 U643 ( .A(W[2]), .B(n276), .Y(n297) );
  OAI21X1 U644 ( .A0(n788), .A1(n876), .B0(n593), .Y(n226) );
  OAI22X1 U645 ( .A0(n788), .A1(n875), .B0(n540), .B1(n142), .Y(n194) );
  OAI211XL U646 ( .A0(n805), .A1(n751), .B0(n753), .C0(n793), .Y(n541) );
  OAI21XL U647 ( .A0(n785), .A1(n876), .B0(n588), .Y(n577) );
  OAI21XL U648 ( .A0(n791), .A1(n876), .B0(n584), .Y(n576) );
  OAI21X1 U649 ( .A0(n803), .A1(n875), .B0(n542), .Y(n223) );
  AOI211XL U650 ( .A0(n783), .A1(n835), .B0(n752), .C0(n784), .Y(n543) );
  OAI21XL U651 ( .A0(n786), .A1(n875), .B0(n532), .Y(n530) );
  AOI211XL U652 ( .A0(n787), .A1(n835), .B0(n752), .C0(n804), .Y(n533) );
  OAI22XL U653 ( .A0(n786), .A1(n876), .B0(n591), .B1(n140), .Y(n587) );
  OAI21XL U654 ( .A0(n785), .A1(n875), .B0(n537), .Y(n516) );
  AOI211XL U655 ( .A0(n799), .A1(n835), .B0(n752), .C0(n789), .Y(n538) );
  OAI21X1 U656 ( .A0(n788), .A1(n873), .B0(n555), .Y(n455) );
  NOR2XL U657 ( .A(n790), .B(n878), .Y(n557) );
  AOI211XL U658 ( .A0(n790), .A1(n878), .B0(n749), .C0(n792), .Y(n556) );
  OAI21X1 U659 ( .A0(n788), .A1(n866), .B0(n509), .Y(n479) );
  OAI21XL U660 ( .A0(n791), .A1(n875), .B0(n545), .Y(n515) );
  AOI211XL U661 ( .A0(n796), .A1(n835), .B0(n752), .C0(n800), .Y(n546) );
  NOR4X1 U662 ( .A(n303), .B(n304), .C(n305), .D(n306), .Y(n264) );
  AOI2BB1X1 U663 ( .A0N(n873), .A1N(n791), .B0(n560), .Y(n203) );
  NOR2XL U664 ( .A(n787), .B(n878), .Y(n554) );
  AOI211XL U665 ( .A0(n787), .A1(n878), .B0(n749), .C0(n804), .Y(n553) );
  OAI21XL U666 ( .A0(n786), .A1(n866), .B0(n506), .Y(n501) );
  OAI21X1 U667 ( .A0(n798), .A1(n876), .B0(n579), .Y(n236) );
  OA21XL U668 ( .A0(n788), .A1(n860), .B0(n527), .Y(n477) );
  OAI21X1 U669 ( .A0(n788), .A1(n872), .B0(n519), .Y(n196) );
  AND2X2 U670 ( .A(Cost[2]), .B(N373), .Y(N540) );
  BUFX2 U671 ( .A(n664), .Y(n782) );
  CLKBUFX3 U672 ( .A(n667), .Y(n805) );
  CLKBUFX3 U673 ( .A(n663), .Y(n798) );
  CLKBUFX3 U674 ( .A(n666), .Y(n795) );
  CLKBUFX3 U675 ( .A(n679), .Y(n787) );
  CLKBUFX3 U676 ( .A(n673), .Y(n796) );
  CLKBUFX3 U677 ( .A(n670), .Y(n783) );
  CLKBUFX3 U678 ( .A(n669), .Y(n803) );
  CLKBUFX3 U679 ( .A(n672), .Y(n791) );
  CLKBUFX3 U680 ( .A(n675), .Y(n785) );
  CLKBUFX3 U681 ( .A(n676), .Y(n799) );
  AOI211XL U682 ( .A0(n155), .A1(n878), .B0(n166), .C0(n167), .Y(n164) );
  CLKBUFX3 U683 ( .A(n678), .Y(n786) );
  CLKBUFX3 U684 ( .A(n681), .Y(n788) );
  CLKBUFX3 U685 ( .A(n682), .Y(n790) );
  CLKBUFX3 U686 ( .A(n660), .Y(n794) );
  NOR3X2 U687 ( .A(state[0]), .B(state[2]), .C(n759), .Y(n173) );
  NAND2X1 U688 ( .A(n822), .B(state[1]), .Y(n622) );
  NAND4XL U689 ( .A(n793), .B(n784), .C(n789), .D(n792), .Y(n138) );
  OR2X1 U690 ( .A(n642), .B(W[0]), .Y(n274) );
  NAND2X1 U691 ( .A(n642), .B(W[0]), .Y(n273) );
  CLKINVX1 U692 ( .A(n207), .Y(n831) );
  CLKINVX1 U693 ( .A(n486), .Y(n856) );
  CLKINVX1 U694 ( .A(n512), .Y(n854) );
  CLKINVX1 U695 ( .A(n209), .Y(n845) );
  OR2X1 U696 ( .A(n489), .B(n826), .Y(n433) );
  NAND2X1 U697 ( .A(n841), .B(n855), .Y(n412) );
  NAND2X1 U698 ( .A(n843), .B(n830), .Y(n378) );
  AOI2BB1X1 U699 ( .A0N(n486), .A1N(n487), .B0(n405), .Y(n404) );
  OAI31XL U700 ( .A0(n466), .A1(n861), .A2(n227), .B0(n830), .Y(n487) );
  CLKINVX1 U701 ( .A(n371), .Y(n811) );
  NAND3X1 U702 ( .A(n863), .B(n457), .C(n859), .Y(n489) );
  CLKINVX1 U703 ( .A(n190), .Y(n829) );
  NAND2X1 U704 ( .A(n859), .B(n857), .Y(n486) );
  NAND2X1 U705 ( .A(n499), .B(n846), .Y(n207) );
  CLKINVX1 U706 ( .A(n387), .Y(n810) );
  NAND2X1 U707 ( .A(n854), .B(n846), .Y(n209) );
  NAND2X1 U708 ( .A(n855), .B(n863), .Y(n512) );
  CLKINVX1 U709 ( .A(n485), .Y(n855) );
  CLKINVX1 U710 ( .A(n216), .Y(n840) );
  OAI221X1 U711 ( .A0(n206), .A1(n207), .B0(n208), .B1(n209), .C0(n177), .Y(
        n155) );
  OR2X1 U712 ( .A(n224), .B(n207), .Y(n159) );
  NAND2X1 U713 ( .A(n858), .B(n863), .Y(n491) );
  CLKINVX1 U714 ( .A(n240), .Y(n847) );
  CLKINVX1 U715 ( .A(n476), .Y(n858) );
  NAND2X1 U716 ( .A(n189), .B(n190), .Y(n160) );
  CLKINVX1 U717 ( .A(n444), .Y(n843) );
  NAND2X1 U718 ( .A(n853), .B(n493), .Y(n225) );
  CLKINVX1 U719 ( .A(n467), .Y(n853) );
  NAND2X1 U720 ( .A(n246), .B(n854), .Y(n430) );
  NAND2X1 U721 ( .A(n851), .B(n208), .Y(n461) );
  AND2X2 U722 ( .A(n468), .B(n242), .Y(n397) );
  OAI31XL U723 ( .A0(n469), .A1(n446), .A2(n370), .B0(n457), .Y(n468) );
  OAI21XL U724 ( .A0(n239), .A1(n200), .B0(n240), .Y(n215) );
  NOR3X1 U725 ( .A(n370), .B(n446), .C(n352), .Y(n232) );
  AOI2BB1X1 U726 ( .A0N(n848), .A1N(n183), .B0(n184), .Y(n174) );
  OA21XL U727 ( .A0(n839), .A1(n183), .B0(n168), .Y(n154) );
  CLKINVX1 U728 ( .A(n208), .Y(n850) );
  NAND2X1 U729 ( .A(n834), .B(n365), .Y(n343) );
  OAI21XL U730 ( .A0(n843), .A1(n366), .B0(n833), .Y(n365) );
  OA21XL U731 ( .A0(n491), .A1(n242), .B0(n498), .Y(n428) );
  OAI21XL U732 ( .A0(n225), .A1(n466), .B0(n499), .Y(n498) );
  CLKINVX1 U733 ( .A(n227), .Y(n852) );
  CLKINVX1 U734 ( .A(n239), .Y(n862) );
  CLKINVX1 U735 ( .A(n201), .Y(n839) );
  CLKINVX1 U736 ( .A(n464), .Y(n830) );
  NAND3BX1 U737 ( .AN(n246), .B(n247), .C(n842), .Y(n204) );
  NAND2X1 U738 ( .A(n837), .B(n242), .Y(n200) );
  NAND2X1 U739 ( .A(n227), .B(n499), .Y(n429) );
  NAND3X1 U740 ( .A(n856), .B(n830), .C(n467), .Y(n416) );
  CLKINVX1 U741 ( .A(n247), .Y(n841) );
  CLKINVX1 U742 ( .A(n370), .Y(n824) );
  NAND3X1 U743 ( .A(n830), .B(n857), .C(n861), .Y(n393) );
  CLKINVX1 U744 ( .A(n446), .Y(n826) );
  CLKINVX1 U745 ( .A(n493), .Y(n861) );
  OAI21X1 U746 ( .A0(n814), .A1(n209), .B0(n812), .Y(n371) );
  OAI21X1 U747 ( .A0(n814), .A1(n829), .B0(n488), .Y(n340) );
  NOR3X2 U748 ( .A(n458), .B(n833), .C(n529), .Y(n457) );
  AOI2BB1X1 U749 ( .A0N(n814), .A1N(n183), .B0(n387), .Y(n405) );
  CLKINVX1 U750 ( .A(n458), .Y(n857) );
  NAND3X1 U751 ( .A(n865), .B(n551), .C(n833), .Y(n464) );
  CLKINVX1 U752 ( .A(n185), .Y(n846) );
  NAND2X1 U753 ( .A(n856), .B(n529), .Y(n485) );
  INVX3 U754 ( .A(n529), .Y(n865) );
  OA21XL U755 ( .A0(n201), .A1(n183), .B0(n202), .Y(n161) );
  OAI21XL U756 ( .A0(n203), .A1(n204), .B0(n845), .Y(n202) );
  OAI2BB1X1 U757 ( .A0N(n240), .A1N(n199), .B0(n244), .Y(n216) );
  OAI21XL U758 ( .A0(n850), .A1(n204), .B0(n845), .Y(n244) );
  CLKINVX1 U759 ( .A(n221), .Y(n828) );
  OAI221XL U760 ( .A0(n206), .A1(n207), .B0(n829), .B1(n223), .C0(n159), .Y(
        n221) );
  OA21XL U761 ( .A0(n209), .A1(n851), .B0(n230), .Y(n178) );
  OAI31XL U762 ( .A0(n825), .A1(n189), .A2(n194), .B0(n190), .Y(n230) );
  CLKINVX1 U763 ( .A(n232), .Y(n825) );
  OA21XL U764 ( .A0(n847), .A1(n862), .B0(n193), .Y(n163) );
  OAI21XL U765 ( .A0(n194), .A1(n195), .B0(n190), .Y(n193) );
  NAND2BX1 U766 ( .AN(n236), .B(n831), .Y(n177) );
  AOI211X1 U767 ( .A0(n297), .A1(n820), .B0(n263), .C0(n298), .Y(n296) );
  NOR3X1 U768 ( .A(n817), .B(n820), .C(n264), .Y(n263) );
  NOR2X1 U769 ( .A(n491), .B(n185), .Y(n240) );
  NOR2X2 U770 ( .A(n515), .B(n827), .Y(n189) );
  AOI2BB2X1 U771 ( .B0(n482), .B1(n848), .A0N(n482), .A1N(n483), .Y(n415) );
  OAI31XL U772 ( .A0(n469), .A1(n446), .A2(n352), .B0(n457), .Y(n483) );
  NAND3BX1 U773 ( .AN(n189), .B(n223), .C(n834), .Y(n469) );
  CLKINVX1 U774 ( .A(n223), .Y(n827) );
  AOI2BB2X1 U775 ( .B0(n196), .B1(n846), .A0N(n198), .A1N(n847), .Y(n162) );
  NOR2X1 U776 ( .A(n199), .B(n200), .Y(n198) );
  NAND2X1 U777 ( .A(n844), .B(n587), .Y(n444) );
  NOR4X1 U778 ( .A(n225), .B(n226), .C(n227), .D(n843), .Y(n206) );
  CLKINVX1 U779 ( .A(n226), .Y(n844) );
  NOR2BX1 U780 ( .AN(n576), .B(n577), .Y(n467) );
  CLKBUFX3 U781 ( .A(n250), .Y(n781) );
  NOR2X1 U782 ( .A(n263), .B(n264), .Y(n250) );
  CLKINVX1 U783 ( .A(n449), .Y(n864) );
  CLKINVX1 U784 ( .A(n463), .Y(n832) );
  OAI31XL U785 ( .A0(n464), .A1(n465), .A2(n458), .B0(n862), .Y(n463) );
  NOR3X1 U786 ( .A(n466), .B(n227), .C(n467), .Y(n465) );
  CLKINVX1 U787 ( .A(n459), .Y(n836) );
  OAI31XL U788 ( .A0(n458), .A1(n865), .A2(n460), .B0(n837), .Y(n459) );
  NOR3X1 U789 ( .A(n461), .B(n246), .C(n841), .Y(n460) );
  CLKINVX1 U790 ( .A(n203), .Y(n851) );
  NOR3X1 U791 ( .A(n469), .B(n370), .C(n352), .Y(n525) );
  OA21XL U792 ( .A0(n183), .A1(n214), .B0(n215), .Y(n175) );
  NAND2X1 U793 ( .A(n514), .B(n851), .Y(n208) );
  NAND3X1 U794 ( .A(n449), .B(n444), .C(n844), .Y(n466) );
  AOI2BB1X1 U795 ( .A0N(n484), .A1N(n485), .B0(n839), .Y(n414) );
  NOR3X1 U796 ( .A(n461), .B(n246), .C(n455), .Y(n484) );
  AND2X2 U797 ( .A(n530), .B(n834), .Y(n352) );
  CLKINVX1 U798 ( .A(n194), .Y(n834) );
  NAND2X1 U799 ( .A(n232), .B(n223), .Y(n195) );
  NAND2BX1 U800 ( .AN(n587), .B(n577), .Y(n493) );
  CLKINVX1 U801 ( .A(n488), .Y(n815) );
  CLKINVX1 U802 ( .A(n264), .Y(n816) );
  AOI2BB1X1 U803 ( .A0N(n185), .A1N(n249), .B0(n814), .Y(n168) );
  NAND4X1 U804 ( .A(n863), .B(n865), .C(n833), .D(n550), .Y(n249) );
  NOR2X1 U805 ( .A(n486), .B(n551), .Y(n550) );
  AOI222XL U806 ( .A0(n246), .A1(n756), .B0(n850), .B1(n874), .C0(n203), .C1(
        n877), .Y(n380) );
  AOI222XL U807 ( .A0(n246), .A1(n872), .B0(n850), .B1(n860), .C0(n203), .C1(
        n866), .Y(n440) );
  AOI222XL U808 ( .A0(n246), .A1(n750), .B0(n850), .B1(n755), .C0(n203), .C1(
        n754), .Y(n385) );
  NAND3BX1 U809 ( .AN(n225), .B(n852), .C(n449), .Y(n366) );
  NAND2X1 U810 ( .A(n447), .B(n247), .Y(n374) );
  OAI21XL U811 ( .A0(n226), .A1(n366), .B0(n830), .Y(n447) );
  AOI2BB1X1 U812 ( .A0N(n502), .A1N(n491), .B0(n184), .Y(n427) );
  NOR3X1 U813 ( .A(n479), .B(n239), .C(n199), .Y(n502) );
  CLKINVX1 U814 ( .A(n548), .Y(n813) );
  OAI211X1 U815 ( .A0(n549), .A1(n512), .B0(n249), .C0(n426), .Y(n548) );
  NOR3X1 U816 ( .A(n461), .B(n841), .C(n455), .Y(n549) );
  NAND2X1 U817 ( .A(n842), .B(n445), .Y(n375) );
  OAI211X1 U818 ( .A0(n189), .A1(n195), .B0(n347), .C0(n865), .Y(n445) );
  NAND2X1 U819 ( .A(n477), .B(n214), .Y(n201) );
  OAI21X1 U820 ( .A0(n517), .A1(n196), .B0(n838), .Y(n432) );
  CLKINVX1 U821 ( .A(n184), .Y(n838) );
  AOI2BB1X1 U822 ( .A0N(n848), .A1N(n839), .B0(n859), .Y(n517) );
  NAND2X1 U823 ( .A(n842), .B(n513), .Y(n247) );
  CLKINVX1 U824 ( .A(n455), .Y(n842) );
  CLKINVX1 U825 ( .A(n214), .Y(n848) );
  NAND2X1 U826 ( .A(n864), .B(n236), .Y(n224) );
  CLKINVX1 U827 ( .A(n479), .Y(n837) );
  NAND2X1 U828 ( .A(n837), .B(n501), .Y(n242) );
  AOI222XL U829 ( .A0(n827), .A1(n878), .B0(n352), .B1(n870), .C0(n189), .C1(
        n877), .Y(n358) );
  AOI222XL U830 ( .A0(n827), .A1(n873), .B0(n352), .B1(n871), .C0(n189), .C1(
        n866), .Y(n350) );
  OA21XL U831 ( .A0(n475), .A1(n476), .B0(n477), .Y(n410) );
  NOR3BXL U832 ( .AN(n242), .B(n239), .C(n199), .Y(n475) );
  AOI222XL U833 ( .A0(n827), .A1(n749), .B0(n352), .B1(n757), .C0(n189), .C1(
        n754), .Y(n369) );
  NAND2X1 U834 ( .A(n858), .B(n479), .Y(n413) );
  NAND2X1 U835 ( .A(n199), .B(n458), .Y(n395) );
  NOR2X1 U836 ( .A(n185), .B(n196), .Y(n176) );
  NOR2X1 U837 ( .A(n814), .B(n185), .Y(n426) );
  NAND2X1 U838 ( .A(n857), .B(n455), .Y(n394) );
  NAND2X1 U839 ( .A(n865), .B(n194), .Y(n377) );
  INVX3 U840 ( .A(n299), .Y(n820) );
  NOR2X1 U841 ( .A(n347), .B(n844), .Y(n345) );
  NAND2X1 U842 ( .A(n822), .B(n879), .Y(n287) );
  NOR2X1 U843 ( .A(n878), .B(n805), .Y(n149) );
  INVX3 U844 ( .A(n782), .Y(n878) );
  OAI22X2 U845 ( .A0(n791), .A1(n866), .B0(n599), .B1(n141), .Y(n458) );
  OA21XL U846 ( .A0(n796), .A1(n877), .B0(n600), .Y(n599) );
  OAI211X1 U847 ( .A0(n783), .A1(n874), .B0(n755), .C0(n784), .Y(n600) );
  INVX3 U848 ( .A(n796), .Y(n874) );
  INVX3 U849 ( .A(n805), .Y(n835) );
  INVX3 U850 ( .A(n795), .Y(n875) );
  OAI22XL U851 ( .A0(n602), .A1(n603), .B0(n791), .B1(n872), .Y(n601) );
  NOR2X1 U852 ( .A(n799), .B(n874), .Y(n603) );
  INVX3 U853 ( .A(n791), .Y(n860) );
  NOR2X1 U854 ( .A(n860), .B(n803), .Y(n141) );
  INVX3 U855 ( .A(n785), .Y(n872) );
  INVX3 U856 ( .A(n783), .Y(n877) );
  OAI22XL U857 ( .A0(n597), .A1(n598), .B0(n786), .B1(n869), .Y(n596) );
  NOR2X1 U858 ( .A(n790), .B(n870), .Y(n598) );
  AOI211X1 U859 ( .A0(n790), .A1(n870), .B0(n757), .C0(n792), .Y(n597) );
  INVX3 U860 ( .A(n787), .Y(n870) );
  OAI21X1 U861 ( .A0(n786), .A1(n872), .B0(n604), .Y(n526) );
  OAI21XL U862 ( .A0(n785), .A1(n871), .B0(n605), .Y(n604) );
  OAI32X1 U863 ( .A0(n750), .A1(n804), .A2(n148), .B0(n787), .B1(n756), .Y(
        n605) );
  NOR2X1 U864 ( .A(n870), .B(n799), .Y(n148) );
  OAI22XL U865 ( .A0(n612), .A1(n613), .B0(n798), .B1(n866), .Y(n611) );
  OAI22XL U866 ( .A0(n609), .A1(n610), .B0(n794), .B1(n875), .Y(n608) );
  NOR2X1 U867 ( .A(n805), .B(n867), .Y(n610) );
  INVX3 U868 ( .A(n801), .Y(n868) );
  INVX3 U869 ( .A(n798), .Y(n873) );
  INVX3 U870 ( .A(n802), .Y(n867) );
  INVX3 U871 ( .A(n803), .Y(n866) );
  OAI222XL U872 ( .A0(n791), .A1(n161), .B0(n785), .B1(n162), .C0(n803), .C1(
        n163), .Y(n157) );
  OAI222XL U873 ( .A0(n796), .A1(n161), .B0(n799), .B1(n162), .C0(n783), .C1(
        n163), .Y(n166) );
  OAI222XL U874 ( .A0(n800), .A1(n161), .B0(n789), .B1(n162), .C0(n784), .C1(
        n163), .Y(n187) );
  INVX3 U875 ( .A(n786), .Y(n871) );
  OAI222XL U876 ( .A0(n798), .A1(n178), .B0(n795), .B1(n828), .C0(n803), .C1(
        n840), .Y(n170) );
  OAI222XL U877 ( .A0(n782), .A1(n178), .B0(n805), .B1(n828), .C0(n783), .C1(
        n840), .Y(n211) );
  INVX3 U878 ( .A(n788), .Y(n869) );
  INVX3 U879 ( .A(n794), .Y(n876) );
  OAI22XL U880 ( .A0(n797), .A1(n178), .B0(n793), .B1(n828), .Y(n220) );
  OA21XL U881 ( .A0(n816), .A1(MatchCount[1]), .B0(n296), .Y(n293) );
  CLKINVX1 U882 ( .A(n780), .Y(n817) );
  OAI21XL U883 ( .A0(n308), .A1(n882), .B0(n330), .Y(n327) );
  CLKINVX1 U884 ( .A(n312), .Y(n882) );
  AOI2BB2X1 U885 ( .B0(n234), .B1(n755), .A0N(n177), .A1N(n801), .Y(n233) );
  OAI21XL U886 ( .A0(n238), .A1(n183), .B0(n215), .Y(n234) );
  OAI222XL U887 ( .A0(n787), .A1(n414), .B0(n799), .B1(n415), .C0(n802), .C1(
        n416), .Y(n407) );
  OAI222XL U888 ( .A0(n804), .A1(n414), .B0(n789), .B1(n415), .C0(n801), .C1(
        n416), .Y(n418) );
  OAI22XL U889 ( .A0(n543), .A1(n544), .B0(n795), .B1(n866), .Y(n542) );
  NOR2X1 U890 ( .A(n783), .B(n835), .Y(n544) );
  OAI222XL U891 ( .A0(n786), .A1(n414), .B0(n785), .B1(n415), .C0(n794), .C1(
        n416), .Y(n471) );
  OAI22XL U892 ( .A0(n594), .A1(n595), .B0(n794), .B1(n869), .Y(n593) );
  NOR2X1 U893 ( .A(n790), .B(n867), .Y(n595) );
  AOI211X1 U894 ( .A0(n790), .A1(n867), .B0(n868), .C0(n792), .Y(n594) );
  OAI22XL U895 ( .A0(n585), .A1(n586), .B0(n794), .B1(n860), .Y(n584) );
  NOR2X1 U896 ( .A(n796), .B(n867), .Y(n586) );
  OAI22XL U897 ( .A0(n794), .A1(n429), .B0(n798), .B1(n430), .Y(n496) );
  OAI22XL U898 ( .A0(n801), .A1(n429), .B0(n797), .B1(n430), .Y(n436) );
  OAI22XL U899 ( .A0(n802), .A1(n429), .B0(n782), .B1(n430), .Y(n424) );
  OAI222XL U900 ( .A0(n786), .A1(n397), .B0(n785), .B1(n832), .C0(n788), .C1(
        n836), .Y(n451) );
  OAI21X1 U901 ( .A0(n803), .A1(n876), .B0(n582), .Y(n449) );
  OAI21XL U902 ( .A0(n794), .A1(n866), .B0(n583), .Y(n582) );
  OAI32X1 U903 ( .A0(n868), .A1(n784), .A2(n150), .B0(n783), .B1(n867), .Y(
        n583) );
  OAI33X1 U904 ( .A0(n878), .A1(n796), .A2(n561), .B0(n562), .B1(n800), .B2(
        n561), .Y(n560) );
  OAI21XL U905 ( .A0(n782), .A1(n874), .B0(n797), .Y(n562) );
  NOR2X1 U906 ( .A(n860), .B(n798), .Y(n561) );
  OAI22XL U907 ( .A0(n786), .A1(n176), .B0(n794), .B1(n177), .Y(n171) );
  OAI22XL U908 ( .A0(n787), .A1(n176), .B0(n802), .B1(n177), .Y(n212) );
  OAI222XL U909 ( .A0(n787), .A1(n397), .B0(n799), .B1(n832), .C0(n790), .C1(
        n836), .Y(n390) );
  OAI222XL U910 ( .A0(n804), .A1(n397), .B0(n789), .B1(n832), .C0(n792), .C1(
        n836), .Y(n401) );
  OAI222XL U911 ( .A0(n796), .A1(n431), .B0(n790), .B1(n432), .C0(n805), .C1(
        n433), .Y(n423) );
  OAI222XL U912 ( .A0(n791), .A1(n431), .B0(n788), .B1(n432), .C0(n795), .C1(
        n433), .Y(n495) );
  OAI222XL U913 ( .A0(n800), .A1(n431), .B0(n792), .B1(n432), .C0(n793), .C1(
        n433), .Y(n435) );
  OAI22XL U914 ( .A0(n589), .A1(n590), .B0(n794), .B1(n872), .Y(n588) );
  NOR2X1 U915 ( .A(n799), .B(n867), .Y(n590) );
  AOI211X1 U916 ( .A0(n799), .A1(n867), .B0(n868), .C0(n789), .Y(n589) );
  OA21XL U917 ( .A0(n790), .A1(n835), .B0(n541), .Y(n540) );
  NOR2X1 U918 ( .A(n877), .B(n802), .Y(n150) );
  OA21XL U919 ( .A0(n787), .A1(n867), .B0(n592), .Y(n591) );
  OAI211X1 U920 ( .A0(n802), .A1(n870), .B0(n757), .C0(n801), .Y(n592) );
  INVX3 U921 ( .A(n173), .Y(n814) );
  OAI22XL U922 ( .A0(n538), .A1(n539), .B0(n795), .B1(n872), .Y(n537) );
  NOR2X1 U923 ( .A(n799), .B(n835), .Y(n539) );
  NAND3BX1 U924 ( .AN(n314), .B(n315), .C(n316), .Y(n305) );
  OR4X1 U925 ( .A(n307), .B(n308), .C(n818), .D(n310), .Y(n306) );
  NAND3X1 U926 ( .A(n311), .B(n312), .C(n313), .Y(n307) );
  CLKINVX1 U927 ( .A(n139), .Y(n818) );
  NOR2X1 U928 ( .A(MatchCount[0]), .B(n816), .Y(n298) );
  AOI22X1 U929 ( .A0(n558), .A1(n147), .B0(n872), .B1(n798), .Y(n514) );
  OAI21XL U930 ( .A0(n799), .A1(n878), .B0(n559), .Y(n558) );
  OAI211X1 U931 ( .A0(n782), .A1(n756), .B0(n750), .C0(n797), .Y(n559) );
  OAI22XL U932 ( .A0(n546), .A1(n547), .B0(n795), .B1(n860), .Y(n545) );
  NOR2X1 U933 ( .A(n796), .B(n835), .Y(n547) );
  AOI2BB1X2 U934 ( .A0N(n866), .A1N(n785), .B0(n503), .Y(n199) );
  OAI33X1 U935 ( .A0(n877), .A1(n799), .A2(n504), .B0(n505), .B1(n789), .B2(
        n504), .Y(n503) );
  OAI21XL U936 ( .A0(n783), .A1(n756), .B0(n784), .Y(n505) );
  NOR2X1 U937 ( .A(n872), .B(n803), .Y(n504) );
  OAI211X1 U938 ( .A0(n297), .A1(n299), .B0(n300), .C0(n301), .Y(n716) );
  NOR2X1 U939 ( .A(n817), .B(n298), .Y(n301) );
  OAI21XL U940 ( .A0(n263), .A1(n820), .B0(MatchCount[0]), .Y(n300) );
  OAI22XL U941 ( .A0(n798), .A1(n412), .B0(n803), .B1(n413), .Y(n472) );
  OAI32X1 U942 ( .A0(n874), .A1(n787), .A2(n523), .B0(n786), .B1(n860), .Y(
        n238) );
  OAI31X1 U943 ( .A0(n522), .A1(n804), .A2(n523), .B0(n849), .Y(n214) );
  OAI21XL U944 ( .A0(n796), .A1(n870), .B0(n800), .Y(n522) );
  CLKINVX1 U945 ( .A(n238), .Y(n849) );
  OAI22XL U946 ( .A0(n782), .A1(n412), .B0(n783), .B1(n413), .Y(n408) );
  OAI22XL U947 ( .A0(n797), .A1(n412), .B0(n784), .B1(n413), .Y(n419) );
  OAI22XL U948 ( .A0(n556), .A1(n557), .B0(n798), .B1(n869), .Y(n555) );
  OAI22XL U949 ( .A0(n580), .A1(n581), .B0(n794), .B1(n873), .Y(n579) );
  NOR2X1 U950 ( .A(n782), .B(n867), .Y(n581) );
  OAI22XL U951 ( .A0(n510), .A1(n511), .B0(n803), .B1(n869), .Y(n509) );
  NOR2X1 U952 ( .A(n790), .B(n877), .Y(n511) );
  AOI211X1 U953 ( .A0(n790), .A1(n877), .B0(n754), .C0(n792), .Y(n510) );
  OAI22XL U954 ( .A0(n791), .A1(n395), .B0(n795), .B1(n396), .Y(n452) );
  OAI22XL U955 ( .A0(n533), .A1(n534), .B0(n795), .B1(n871), .Y(n532) );
  NOR2X1 U956 ( .A(n787), .B(n835), .Y(n534) );
  OAI22XL U957 ( .A0(n507), .A1(n508), .B0(n803), .B1(n871), .Y(n506) );
  NOR2X1 U958 ( .A(n787), .B(n877), .Y(n508) );
  AOI211X1 U959 ( .A0(n787), .A1(n877), .B0(n754), .C0(n804), .Y(n507) );
  NOR2X1 U960 ( .A(n871), .B(n791), .Y(n523) );
  OAI22XL U961 ( .A0(n796), .A1(n395), .B0(n805), .B1(n396), .Y(n391) );
  OAI22XL U962 ( .A0(n800), .A1(n395), .B0(n793), .B1(n396), .Y(n402) );
  OAI22XL U963 ( .A0(n553), .A1(n554), .B0(n798), .B1(n871), .Y(n552) );
  NOR2X1 U964 ( .A(n869), .B(n795), .Y(n142) );
  NAND2X1 U965 ( .A(n785), .B(n873), .Y(n147) );
  NOR2X1 U966 ( .A(n871), .B(n794), .Y(n140) );
  OAI21XL U967 ( .A0(n791), .A1(n869), .B0(n528), .Y(n527) );
  OAI22XL U968 ( .A0(n803), .A1(n852), .B0(n798), .B1(n224), .Y(n564) );
  OAI22XL U969 ( .A0(n784), .A1(n852), .B0(n797), .B1(n224), .Y(n570) );
  OAI22XL U970 ( .A0(n783), .A1(n852), .B0(n782), .B1(n224), .Y(n574) );
  OAI21X1 U971 ( .A0(n184), .A1(n185), .B0(n173), .Y(n153) );
  OAI22XL U972 ( .A0(n520), .A1(n521), .B0(n785), .B1(n869), .Y(n519) );
  NOR2X1 U973 ( .A(n790), .B(n756), .Y(n521) );
  AOI211X1 U974 ( .A0(n790), .A1(n756), .B0(n750), .C0(n792), .Y(n520) );
  OAI222XL U975 ( .A0(n804), .A1(n444), .B0(n789), .B1(n493), .C0(n792), .C1(
        n844), .Y(n569) );
  OAI222XL U976 ( .A0(n787), .A1(n444), .B0(n799), .B1(n493), .C0(n790), .C1(
        n844), .Y(n573) );
  OAI22XL U977 ( .A0(n795), .A1(n236), .B0(n791), .B1(n853), .Y(n565) );
  NAND3X1 U978 ( .A(MatchCount[0]), .B(MatchCount[1]), .C(n264), .Y(n289) );
  NAND2X1 U979 ( .A(n822), .B(n759), .Y(n299) );
  CLKINVX1 U980 ( .A(n286), .Y(n822) );
  CLKINVX1 U981 ( .A(n621), .Y(n879) );
  CLKINVX1 U982 ( .A(n265), .Y(n819) );
  AOI2BB1X1 U983 ( .A0N(n879), .A1N(n760), .B0(n286), .Y(n618) );
  NAND2X1 U984 ( .A(n618), .B(W[0]), .Y(n617) );
  CLKBUFX3 U985 ( .A(n338), .Y(n779) );
  NAND2X1 U986 ( .A(n622), .B(n818), .Y(n338) );
  OAI22XL U987 ( .A0(n795), .A1(N373), .B0(n794), .B1(n879), .Y(n284) );
  OAI22XL U988 ( .A0(n793), .A1(N373), .B0(n801), .B1(n879), .Y(n280) );
  OAI22XL U989 ( .A0(n805), .A1(N373), .B0(n802), .B1(n879), .Y(n271) );
  INVX3 U990 ( .A(n622), .Y(n821) );
  NOR3X1 U991 ( .A(n800), .B(n801), .C(n797), .Y(n146) );
  NAND2X1 U992 ( .A(n621), .B(n760), .Y(n623) );
  OAI21XL U993 ( .A0(n622), .A1(n623), .B0(n624), .Y(N64) );
  CLKBUFX3 U994 ( .A(n809), .Y(n808) );
  CLKBUFX3 U995 ( .A(n809), .Y(n807) );
  CLKBUFX3 U996 ( .A(n809), .Y(n806) );
  OAI2BB2XL U997 ( .B0(n702), .B1(n779), .A0N(N443), .A1N(n821), .Y(n726) );
  NAND2X1 U998 ( .A(N383), .B(n820), .Y(n255) );
  OAI2BB2XL U999 ( .B0(n703), .B1(n779), .A0N(N442), .A1N(n821), .Y(n718) );
  OAI221XL U1000 ( .A0(n637), .A1(n781), .B0(n704), .B1(n780), .C0(n256), .Y(
        n688) );
  NAND2X1 U1001 ( .A(N382), .B(n820), .Y(n256) );
  OAI2BB2XL U1002 ( .B0(n704), .B1(n779), .A0N(N441), .A1N(n821), .Y(n719) );
  OAI221XL U1003 ( .A0(n636), .A1(n781), .B0(n705), .B1(n780), .C0(n257), .Y(
        n689) );
  NAND2X1 U1004 ( .A(N381), .B(n820), .Y(n257) );
  OAI2BB2XL U1005 ( .B0(n705), .B1(n779), .A0N(N440), .A1N(n821), .Y(n720) );
  OAI221XL U1006 ( .A0(n696), .A1(n781), .B0(n635), .B1(n780), .C0(n258), .Y(
        n690) );
  NAND2X1 U1007 ( .A(N380), .B(n820), .Y(n258) );
  OAI2BB2XL U1008 ( .B0(n635), .B1(n779), .A0N(N439), .A1N(n821), .Y(n721) );
  OAI221XL U1009 ( .A0(n634), .A1(n781), .B0(n706), .B1(n780), .C0(n259), .Y(
        n691) );
  NAND2X1 U1010 ( .A(N379), .B(n820), .Y(n259) );
  OAI2BB2XL U1011 ( .B0(n706), .B1(n779), .A0N(N438), .A1N(n821), .Y(n722) );
  OAI221XL U1012 ( .A0(n633), .A1(n781), .B0(n707), .B1(n780), .C0(n260), .Y(
        n692) );
  NAND2X1 U1013 ( .A(N378), .B(n820), .Y(n260) );
  OAI2BB2XL U1014 ( .B0(n707), .B1(n779), .A0N(N437), .A1N(n821), .Y(n723) );
  OAI221XL U1015 ( .A0(n632), .A1(n781), .B0(n708), .B1(n780), .C0(n261), .Y(
        n693) );
  NAND2X1 U1016 ( .A(N377), .B(n820), .Y(n261) );
  OAI2BB2XL U1017 ( .B0(n708), .B1(n779), .A0N(N436), .A1N(n821), .Y(n724) );
  OAI221XL U1018 ( .A0(n697), .A1(n781), .B0(n631), .B1(n780), .C0(n262), .Y(
        n694) );
  NAND2X1 U1019 ( .A(N376), .B(n820), .Y(n262) );
  OAI2BB2XL U1020 ( .B0(n631), .B1(n779), .A0N(N435), .A1N(n821), .Y(n725) );
  OAI22XL U1021 ( .A0(n791), .A1(n404), .B0(n405), .B1(n470), .Y(n740) );
  NOR3X1 U1022 ( .A(n471), .B(n472), .C(n473), .Y(n470) );
  OAI22XL U1023 ( .A0(n788), .A1(n410), .B0(n795), .B1(n411), .Y(n473) );
  CLKBUFX3 U1024 ( .A(n668), .Y(n793) );
  OAI22XL U1025 ( .A0(n796), .A1(n404), .B0(n405), .B1(n406), .Y(n734) );
  NOR3X1 U1026 ( .A(n407), .B(n408), .C(n409), .Y(n406) );
  OAI22XL U1027 ( .A0(n790), .A1(n410), .B0(n805), .B1(n411), .Y(n409) );
  OAI22XL U1028 ( .A0(n800), .A1(n404), .B0(n405), .B1(n417), .Y(n735) );
  NOR3X1 U1029 ( .A(n418), .B(n419), .C(n420), .Y(n417) );
  OAI22XL U1030 ( .A0(n792), .A1(n410), .B0(n793), .B1(n411), .Y(n420) );
  OAI22XL U1031 ( .A0(n803), .A1(n387), .B0(n810), .B1(n450), .Y(n739) );
  NOR3X1 U1032 ( .A(n451), .B(n452), .C(n453), .Y(n450) );
  OAI22XL U1033 ( .A0(n794), .A1(n393), .B0(n798), .B1(n394), .Y(n453) );
  OAI22XL U1034 ( .A0(n783), .A1(n387), .B0(n810), .B1(n389), .Y(n732) );
  NOR3X1 U1035 ( .A(n390), .B(n391), .C(n392), .Y(n389) );
  OAI22XL U1036 ( .A0(n802), .A1(n393), .B0(n782), .B1(n394), .Y(n392) );
  OAI22XL U1037 ( .A0(n784), .A1(n387), .B0(n810), .B1(n400), .Y(n733) );
  NOR3X1 U1038 ( .A(n401), .B(n402), .C(n403), .Y(n400) );
  OAI22XL U1039 ( .A0(n801), .A1(n393), .B0(n797), .B1(n394), .Y(n403) );
  CLKBUFX3 U1040 ( .A(n665), .Y(n797) );
  CLKBUFX3 U1041 ( .A(n674), .Y(n800) );
  CLKBUFX3 U1042 ( .A(n671), .Y(n784) );
  NAND2X1 U1043 ( .A(n642), .B(n695), .Y(n276) );
  CLKBUFX3 U1044 ( .A(n662), .Y(n801) );
  CLKBUFX3 U1045 ( .A(n677), .Y(n789) );
  CLKBUFX3 U1046 ( .A(n680), .Y(n804) );
  CLKBUFX3 U1047 ( .A(n661), .Y(n802) );
  OAI22XL U1048 ( .A0(n797), .A1(n371), .B0(n811), .B1(n383), .Y(n731) );
  AOI221XL U1049 ( .A0(n374), .A1(n757), .B0(n375), .B1(n753), .C0(n384), .Y(
        n383) );
  OAI222XL U1050 ( .A0(n793), .A1(n377), .B0(n801), .B1(n378), .C0(n865), .C1(
        n385), .Y(n384) );
  OAI22XL U1051 ( .A0(n798), .A1(n371), .B0(n811), .B1(n438), .Y(n738) );
  AOI221XL U1052 ( .A0(n374), .A1(n871), .B0(n375), .B1(n869), .C0(n439), .Y(
        n438) );
  OAI222XL U1053 ( .A0(n795), .A1(n377), .B0(n794), .B1(n378), .C0(n865), .C1(
        n440), .Y(n439) );
  OAI22XL U1054 ( .A0(n782), .A1(n371), .B0(n811), .B1(n373), .Y(n730) );
  AOI221XL U1055 ( .A0(n374), .A1(n870), .B0(n375), .B1(n751), .C0(n376), .Y(
        n373) );
  OAI222XL U1056 ( .A0(n805), .A1(n377), .B0(n802), .B1(n378), .C0(n865), .C1(
        n380), .Y(n376) );
  OAI222XL U1057 ( .A0(n151), .A1(n814), .B0(n788), .B1(n153), .C0(n786), .C1(
        n154), .Y(n654) );
  AOI211X1 U1058 ( .A0(n155), .A1(n873), .B0(n157), .C0(n158), .Y(n151) );
  OAI22XL U1059 ( .A0(n794), .A1(n159), .B0(n795), .B1(n160), .Y(n158) );
  OAI222XL U1060 ( .A0(n164), .A1(n814), .B0(n790), .B1(n153), .C0(n787), .C1(
        n154), .Y(n655) );
  OAI22XL U1061 ( .A0(n802), .A1(n159), .B0(n805), .B1(n160), .Y(n167) );
  OAI222XL U1062 ( .A0(n181), .A1(n814), .B0(n792), .B1(n153), .C0(n804), .C1(
        n154), .Y(n657) );
  AOI211X1 U1063 ( .A0(n155), .A1(n749), .B0(n187), .C0(n188), .Y(n181) );
  OAI22XL U1064 ( .A0(n801), .A1(n159), .B0(n793), .B1(n160), .Y(n188) );
  CLKBUFX3 U1065 ( .A(n683), .Y(n792) );
  OAI21XL U1066 ( .A0(n788), .A1(n168), .B0(n169), .Y(n656) );
  OAI31XL U1067 ( .A0(n170), .A1(n171), .A2(n172), .B0(n173), .Y(n169) );
  OAI22XL U1068 ( .A0(n785), .A1(n174), .B0(n791), .B1(n175), .Y(n172) );
  OAI21XL U1069 ( .A0(n790), .A1(n168), .B0(n210), .Y(n658) );
  OAI31XL U1070 ( .A0(n211), .A1(n212), .A2(n213), .B0(n173), .Y(n210) );
  OAI22XL U1071 ( .A0(n799), .A1(n174), .B0(n796), .B1(n175), .Y(n213) );
  OAI22XL U1072 ( .A0(n792), .A1(n168), .B0(n217), .B1(n814), .Y(n659) );
  AOI211X1 U1073 ( .A0(n216), .A1(n754), .B0(n219), .C0(n220), .Y(n217) );
  OAI221XL U1074 ( .A0(n804), .A1(n176), .B0(n789), .B1(n174), .C0(n233), .Y(
        n219) );
  AOI32X1 U1075 ( .A0(n312), .A1(MinCost_1[2]), .A2(n633), .B0(MinCost_1[3]), 
        .B1(n634), .Y(n330) );
  XOR2X1 U1076 ( .A(n634), .B(MinCost_1[3]), .Y(n312) );
  OAI32X1 U1077 ( .A0(MatchCount[3]), .A1(n698), .A2(n289), .B0(n640), .B1(
        n290), .Y(n713) );
  OA21XL U1078 ( .A0(n816), .A1(MatchCount[2]), .B0(n293), .Y(n290) );
  OAI211X1 U1079 ( .A0(n708), .A1(MinCost[1]), .B0(n333), .C0(n330), .Y(n326)
         );
  OAI21XL U1080 ( .A0(n697), .A1(n315), .B0(n313), .Y(n333) );
  AOI2BB2X1 U1081 ( .B0(n311), .B1(n322), .A0N(MinCost[6]), .A1N(n704), .Y(
        n319) );
  OAI22XL U1082 ( .A0(n705), .A1(MinCost[5]), .B0(n325), .B1(n303), .Y(n322)
         );
  AOI32X1 U1083 ( .A0(n326), .A1(n327), .A2(n316), .B0(n696), .B1(MinCost_1[4]), .Y(n325) );
  CLKBUFX3 U1084 ( .A(n251), .Y(n780) );
  AO21X1 U1085 ( .A0(n317), .A1(n318), .B0(n818), .Y(n251) );
  OAI21XL U1086 ( .A0(n310), .A1(n304), .B0(n881), .Y(n317) );
  OAI221XL U1087 ( .A0(n319), .A1(n314), .B0(n703), .B1(MinCost[7]), .C0(n881), 
        .Y(n318) );
  OAI22XL U1088 ( .A0(n795), .A1(n340), .B0(n812), .B1(n342), .Y(n727) );
  AOI222XL U1089 ( .A0(n343), .A1(n869), .B0(n345), .B1(n876), .C0(n346), .C1(
        n347), .Y(n342) );
  OAI221XL U1090 ( .A0(n785), .A1(n824), .B0(n791), .B1(n826), .C0(n350), .Y(
        n346) );
  OAI22XL U1091 ( .A0(n805), .A1(n340), .B0(n812), .B1(n355), .Y(n728) );
  AOI222XL U1092 ( .A0(n343), .A1(n751), .B0(n345), .B1(n867), .C0(n357), .C1(
        n347), .Y(n355) );
  OAI221XL U1093 ( .A0(n799), .A1(n824), .B0(n796), .B1(n826), .C0(n358), .Y(
        n357) );
  OAI22XL U1094 ( .A0(n793), .A1(n340), .B0(n812), .B1(n361), .Y(n729) );
  AOI222XL U1095 ( .A0(n362), .A1(n347), .B0(n345), .B1(n868), .C0(n343), .C1(
        n753), .Y(n361) );
  OAI221XL U1096 ( .A0(n789), .A1(n824), .B0(n800), .B1(n826), .C0(n369), .Y(
        n362) );
  OAI21XL U1097 ( .A0(n785), .A1(n813), .B0(n494), .Y(n741) );
  OAI31XL U1098 ( .A0(n495), .A1(n496), .A2(n497), .B0(n426), .Y(n494) );
  OAI22XL U1099 ( .A0(n786), .A1(n427), .B0(n803), .B1(n428), .Y(n497) );
  OAI21XL U1100 ( .A0(n789), .A1(n813), .B0(n434), .Y(n737) );
  OAI31XL U1101 ( .A0(n435), .A1(n436), .A2(n437), .B0(n426), .Y(n434) );
  OAI22XL U1102 ( .A0(n804), .A1(n427), .B0(n784), .B1(n428), .Y(n437) );
  OAI21XL U1103 ( .A0(n799), .A1(n813), .B0(n422), .Y(n736) );
  OAI31XL U1104 ( .A0(n423), .A1(n424), .A2(n425), .B0(n426), .Y(n422) );
  OAI22XL U1105 ( .A0(n787), .A1(n427), .B0(n783), .B1(n428), .Y(n425) );
  OAI22XL U1106 ( .A0(n698), .A1(n293), .B0(n289), .B1(MatchCount[2]), .Y(n714) );
  XOR2X1 U1107 ( .A(MinCost[1]), .B(n708), .Y(n313) );
  OAI32X1 U1108 ( .A0(MatchCount[1]), .A1(n700), .A2(n816), .B0(n699), .B1(
        n296), .Y(n715) );
  XNOR2X1 U1109 ( .A(n697), .B(n631), .Y(n315) );
  OAI21XL U1110 ( .A0(n801), .A1(n815), .B0(n568), .Y(n743) );
  OAI31XL U1111 ( .A0(n569), .A1(n570), .A2(n571), .B0(n815), .Y(n568) );
  OAI22XL U1112 ( .A0(n793), .A1(n236), .B0(n800), .B1(n853), .Y(n571) );
  OAI21XL U1113 ( .A0(n802), .A1(n815), .B0(n572), .Y(n744) );
  OAI31XL U1114 ( .A0(n573), .A1(n574), .A2(n575), .B0(n815), .Y(n572) );
  OAI22XL U1115 ( .A0(n805), .A1(n236), .B0(n796), .B1(n853), .Y(n575) );
  NOR3X1 U1116 ( .A(state[0]), .B(state[1]), .C(n758), .Y(n139) );
  XNOR2X1 U1117 ( .A(n633), .B(MinCost_1[2]), .Y(n308) );
  XNOR2X1 U1118 ( .A(n696), .B(n635), .Y(n316) );
  OAI21XL U1119 ( .A0(n563), .A1(n488), .B0(n794), .Y(n742) );
  NOR4X1 U1120 ( .A(n564), .B(n565), .C(n869), .D(n566), .Y(n563) );
  OAI22XL U1121 ( .A0(n786), .A1(n444), .B0(n785), .B1(n493), .Y(n566) );
  XOR2X1 U1122 ( .A(n639), .B(n701), .Y(n310) );
  CLKINVX1 U1123 ( .A(n335), .Y(n881) );
  OAI32X1 U1124 ( .A0(n310), .A1(n702), .A2(MinCost[8]), .B0(n701), .B1(
        MinCost[9]), .Y(n335) );
  XOR2X1 U1125 ( .A(MinCost[6]), .B(n704), .Y(n311) );
  XNOR2X1 U1126 ( .A(MinCost[5]), .B(n705), .Y(n303) );
  XOR2X1 U1127 ( .A(n638), .B(n703), .Y(n314) );
  NAND2X1 U1128 ( .A(state[0]), .B(n758), .Y(n286) );
  XNOR2X1 U1129 ( .A(MinCost[8]), .B(n702), .Y(n304) );
  OAI21X1 U1130 ( .A0(n641), .A1(n286), .B0(n287), .Y(n265) );
  NAND2BX1 U1131 ( .AN(n642), .B(W[0]), .Y(n275) );
  OAI22XL U1132 ( .A0(n643), .A1(n265), .B0(n819), .B1(n281), .Y(n712) );
  AOI221XL U1133 ( .A0(n282), .A1(W[2]), .B0(n684), .B1(n283), .C0(n284), .Y(
        n281) );
  OAI222XL U1134 ( .A0(n788), .A1(n274), .B0(n785), .B1(n276), .C0(n786), .C1(
        n273), .Y(n282) );
  OAI222XL U1135 ( .A0(n798), .A1(n273), .B0(n803), .B1(n274), .C0(n791), .C1(
        n275), .Y(n283) );
  OAI22XL U1136 ( .A0(n644), .A1(n265), .B0(n819), .B1(n277), .Y(n711) );
  AOI221XL U1137 ( .A0(n278), .A1(W[2]), .B0(n684), .B1(n279), .C0(n280), .Y(
        n277) );
  OAI222XL U1138 ( .A0(n792), .A1(n274), .B0(n789), .B1(n276), .C0(n804), .C1(
        n273), .Y(n278) );
  OAI222XL U1139 ( .A0(n797), .A1(n273), .B0(n784), .B1(n274), .C0(n800), .C1(
        n275), .Y(n279) );
  OAI22XL U1140 ( .A0(n645), .A1(n265), .B0(n819), .B1(n267), .Y(n710) );
  AOI221XL U1141 ( .A0(n268), .A1(W[2]), .B0(n684), .B1(n270), .C0(n271), .Y(
        n267) );
  OAI222XL U1142 ( .A0(n790), .A1(n274), .B0(n799), .B1(n276), .C0(n787), .C1(
        n273), .Y(n268) );
  OAI222XL U1143 ( .A0(n782), .A1(n273), .B0(n783), .B1(n274), .C0(n796), .C1(
        n275), .Y(n270) );
  NOR2X1 U1144 ( .A(n275), .B(n684), .Y(n621) );
  OAI22XL U1145 ( .A0(n273), .A1(n287), .B0(n642), .B1(n823), .Y(n748) );
  CLKINVX1 U1146 ( .A(n617), .Y(n823) );
  OAI22XL U1147 ( .A0(n275), .A1(n287), .B0(n684), .B1(n616), .Y(n746) );
  NOR2X1 U1148 ( .A(n879), .B(n617), .Y(n616) );
  XOR2X1 U1149 ( .A(n614), .B(n641), .Y(n745) );
  NAND2X1 U1150 ( .A(n822), .B(n287), .Y(n614) );
  OAI22XL U1151 ( .A0(W[0]), .A1(n287), .B0(n695), .B1(n618), .Y(n747) );
  OAI31XL U1152 ( .A0(n136), .A1(n137), .A2(n138), .B0(n646), .Y(n653) );
  NAND4X1 U1153 ( .A(n139), .B(n140), .C(n141), .D(n142), .Y(n137) );
  NAND4BX1 U1154 ( .AN(n143), .B(n144), .C(n757), .D(n146), .Y(n136) );
  OAI211X1 U1155 ( .A0(state[2]), .A1(state[0]), .B0(n627), .C0(n624), .Y(N62)
         );
  OAI2BB1X1 U1156 ( .A0N(n622), .A1N(n629), .B0(n623), .Y(n627) );
  OAI211X1 U1157 ( .A0(n299), .A1(n623), .B0(n814), .C0(n625), .Y(N63) );
  AOI22X1 U1158 ( .A0(n821), .A1(n623), .B0(n646), .B1(n139), .Y(n625) );
  NAND3BX1 U1159 ( .AN(n779), .B(state[2]), .C(n629), .Y(N61) );
  NAND2X1 U1160 ( .A(state[0]), .B(n759), .Y(n629) );
  OA22X1 U1161 ( .A0(n758), .A1(n629), .B0(n646), .B1(n818), .Y(n624) );
  NAND2X1 U1162 ( .A(RST), .B(n868), .Y(n650) );
  NAND2X1 U1163 ( .A(RST), .B(n867), .Y(n652) );
  NAND2X1 U1164 ( .A(RST), .B(n876), .Y(n648) );
  NAND2X1 U1165 ( .A(n794), .B(RST), .Y(n647) );
  NAND2X1 U1166 ( .A(n801), .B(RST), .Y(n649) );
  NAND2X1 U1167 ( .A(n802), .B(RST), .Y(n651) );
  AND2X1 U1168 ( .A(Cost[3]), .B(N373), .Y(N541) );
  AND2X1 U1169 ( .A(Cost[4]), .B(N373), .Y(N542) );
  AND2X1 U1170 ( .A(Cost[5]), .B(N373), .Y(N543) );
  AND2X1 U1171 ( .A(N373), .B(Cost[6]), .Y(N544) );
endmodule

