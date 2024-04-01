/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03
// Date      : Thu Nov 23 18:48:46 2023
/////////////////////////////////////////////////////////////


module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, 
        lbp_valid, lbp_data, finish );
  output [13:0] gray_addr;
  input [7:0] gray_data;
  output [13:0] lbp_addr;
  output [7:0] lbp_data;
  input clk, reset, gray_ready;
  output gray_req, lbp_valid, finish;
  wire   n669, n670, n671, n672, n673, n674, n675, n676, n677, n678, n679,
         n680, n681, n682, n683, n684, n685, n686, n687, n688, n689, n690,
         n691, n692, n693, n694, n695, n696, n697, N53, N54, N55, N56, N71,
         N72, N73, N74, N75, N76, N77, N78, N79, N80, N366, N405, N406, N407,
         N408, N409, N410, N411, N412, N518, N679, N680, N714, \C39/DATA3_0 ,
         \C39/DATA3_1 , \C39/DATA3_2 , \C39/DATA3_3 , \C39/DATA3_4 ,
         \C39/DATA3_5 , \C39/DATA3_6 , \C39/DATA3_7 , \C39/DATA3_8 ,
         \C39/DATA3_9 , \C39/DATA3_10 , \C39/DATA3_11 , \C39/DATA3_12 ,
         \C38/DATA6_2 , \C38/DATA5_3 , \C38/DATA3_5 , \C38/DATA2_6 , n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, \C1/Z_0 ,
         \DP_OP_184J1_123_1844/n26 , \DP_OP_184J1_123_1844/n21 ,
         \DP_OP_184J1_123_1844/n19 , \DP_OP_184J1_123_1844/n14 ,
         \DP_OP_184J1_123_1844/n13 , \DP_OP_184J1_123_1844/n12 ,
         \DP_OP_184J1_123_1844/n11 , \DP_OP_184J1_123_1844/n10 ,
         \DP_OP_184J1_123_1844/n9 , \DP_OP_184J1_123_1844/n8 ,
         \DP_OP_184J1_123_1844/n7 , \DP_OP_184J1_123_1844/n6 ,
         \DP_OP_184J1_123_1844/n5 , \DP_OP_184J1_123_1844/n4 ,
         \DP_OP_184J1_123_1844/n3 , \DP_OP_184J1_123_1844/n2 , n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n318, n320,
         n322, n324, n326, n328, n330, n332, n334, n336, n338, n340, n342,
         n344, n346, n348, n350, n352, n354, n356, n358, n360, n362, n364,
         n366, n368, n370, n372, n374, n376, n378, n380, n382, n383, n384,
         n385, n386, n387, n388, n389, n390, n391, n392, n393, n394, n395,
         n396, n397, n398, n399, n400, n401, n402, n403, n404, n405, n406,
         n407, n408, n409, n410, n411, n412, n413, n414, n415, n416, n417,
         n418, n419, n420, n421, n422, n423, n424, n425, n426, n427, n428,
         n429, n430, n431, n432, n433, n434, n435, n436, n437, n438, n439,
         n440, n441, n442, n443, n444, n445, n446, n447, n448, n449, n450,
         n451, n452, n453, n454, n455, n456, n457, n458, n459, n460, n461,
         n462, n463, n464, n465, n466, n467, n468, n469, n470, n471, n472,
         n473, n474, n475, n476, n477, n478, n479, n480, n481, n482, n483,
         n484, n485, n486, n487, n488, n489, n490, n491, n492, n493, n494,
         n495, n496, n497, n498, n499, n500, n501, n502, n503, n504, n505,
         n506, n507, n508, n509, n510, n511, n512, n513, n514, n515, n516,
         n517, n518, n519, n520, n521, n522, n523, n524, n525, n526, n527,
         n528, n529, n530, n531, n532, n533, n534, n535, n536, n537, n538,
         n539, n540, n541, n542, n543, n544, n545, n546, n547, n548, n549,
         n550, n551, n552, n553, n554, n555, n556, n557, n558, n559, n560,
         n561, n562, n563, n564, n565, n566, n567, n568, n569, n570, n571,
         n572, n573, n574, n575, n576, n577, n578, n579, n580, n581, n582,
         n583, n584, n585, n586, n587, n588, n589, n590, n591, n592, n593,
         n594, n595, n596, n597, n598, n599, n600, n601, n602, n603, n604,
         n605, n606, n607, n608, n609, n610, n611, n612, n613, n614, n615,
         n616, n617, n618, n619, n620, n621, n622, n623, n624, n625, n626,
         n627, n628, n629, n630, n631, n632, n633, n634, n635, n636, n637,
         n638, n639, n640, n641, n642, n643, n644, n645, n646, n647, n648,
         n649, n650, n651, n652, n653, n654, n655, n656, n657, n658, n659,
         n660, n661, n662, n663, n664, n665, n666, n667, n668;
  wire   [3:0] counter;
  wire   [10:0] edge_counter;
  wire   [13:0] gray_0;
  wire   [7:0] gray_data8;
  wire   [7:0] gray_data7;
  wire   [7:0] gray_data6;
  wire   [7:0] gray_data5;
  wire   [7:0] gray_data4;
  wire   [7:0] gray_data3;
  wire   [7:0] gray_data2;
  wire   [7:0] gray_data1;
  wire   [7:0] gray_data0;

  DFFRX1 \edge_counter_reg[0]  ( .D(n655), .CK(clk), .RN(n301), .Q(
        edge_counter[0]), .QN(n655) );
  DFFRX1 \edge_counter_reg[1]  ( .D(N71), .CK(clk), .RN(n664), .Q(
        edge_counter[1]) );
  DFFRX1 \edge_counter_reg[2]  ( .D(N72), .CK(clk), .RN(n301), .Q(
        edge_counter[2]), .QN(n634) );
  DFFRX1 \edge_counter_reg[3]  ( .D(N73), .CK(clk), .RN(n301), .Q(
        edge_counter[3]), .QN(n636) );
  DFFRX1 \edge_counter_reg[4]  ( .D(N74), .CK(clk), .RN(n664), .Q(
        edge_counter[4]) );
  DFFRX1 \edge_counter_reg[5]  ( .D(N75), .CK(clk), .RN(n301), .Q(
        edge_counter[5]), .QN(n638) );
  DFFRX1 \edge_counter_reg[6]  ( .D(N76), .CK(clk), .RN(n301), .Q(
        edge_counter[6]) );
  DFFRX1 \edge_counter_reg[7]  ( .D(N77), .CK(clk), .RN(n301), .Q(
        edge_counter[7]), .QN(n650) );
  DFFRX1 \edge_counter_reg[8]  ( .D(N78), .CK(clk), .RN(n301), .Q(
        edge_counter[8]) );
  DFFRX1 \edge_counter_reg[9]  ( .D(N79), .CK(clk), .RN(n664), .Q(
        edge_counter[9]), .QN(n653) );
  DFFRX1 \edge_counter_reg[10]  ( .D(N80), .CK(clk), .RN(n301), .Q(
        edge_counter[10]) );
  DFFRX1 \gray_0_reg[13]  ( .D(n287), .CK(clk), .RN(n301), .Q(gray_0[13]), 
        .QN(n654) );
  DFFRX1 \gray_0_reg[11]  ( .D(n285), .CK(clk), .RN(n301), .Q(gray_0[11]), 
        .QN(n648) );
  DFFRX1 \gray_0_reg[10]  ( .D(n284), .CK(clk), .RN(n301), .Q(gray_0[10]), 
        .QN(n651) );
  DFFRX1 \gray_0_reg[9]  ( .D(n283), .CK(clk), .RN(n301), .Q(gray_0[9]), .QN(
        n647) );
  DFFRX1 \gray_0_reg[8]  ( .D(n282), .CK(clk), .RN(n301), .Q(gray_0[8]), .QN(
        n637) );
  DFFRX1 \gray_0_reg[6]  ( .D(n280), .CK(clk), .RN(n301), .Q(gray_0[6]), .QN(
        n652) );
  DFFRX1 \gray_0_reg[5]  ( .D(n279), .CK(clk), .RN(n301), .Q(gray_0[5]), .QN(
        n644) );
  DFFRX1 \gray_0_reg[4]  ( .D(n278), .CK(clk), .RN(n301), .Q(gray_0[4]), .QN(
        n646) );
  DFFRX1 \gray_0_reg[3]  ( .D(n277), .CK(clk), .RN(n301), .Q(gray_0[3]), .QN(
        n642) );
  DFFRX1 \gray_0_reg[2]  ( .D(n276), .CK(clk), .RN(n301), .Q(gray_0[2]), .QN(
        n645) );
  DFFRX1 \gray_0_reg[1]  ( .D(n275), .CK(clk), .RN(n301), .Q(gray_0[1]), .QN(
        n649) );
  DFFSX1 \gray_0_reg[7]  ( .D(n281), .CK(clk), .SN(n405), .Q(gray_0[7]), .QN(
        n635) );
  DFFSX1 \gray_0_reg[0]  ( .D(n288), .CK(clk), .SN(n301), .Q(gray_0[0]), .QN(
        n639) );
  TLATX1 \LBP_4_reg[4]  ( .G(n667), .D(N408), .QN(n660) );
  TLATX1 \LBP_3_reg[3]  ( .G(n382), .D(N409), .Q(\C38/DATA5_3 ) );
  TLATX1 \LBP_2_reg[2]  ( .G(n661), .D(N410), .Q(\C38/DATA6_2 ) );
  TLATX1 \LBP_5_reg[5]  ( .G(n668), .D(N407), .Q(\C38/DATA3_5 ) );
  TLATX1 \gray_data1_reg[7]  ( .G(n665), .D(gray_data[7]), .Q(gray_data1[7])
         );
  TLATX1 \gray_data1_reg[5]  ( .G(n665), .D(gray_data[5]), .Q(gray_data1[5])
         );
  TLATX1 \gray_data1_reg[3]  ( .G(n665), .D(gray_data[3]), .Q(gray_data1[3])
         );
  TLATX1 \gray_data8_reg[7]  ( .G(n663), .D(gray_data[7]), .Q(gray_data8[7])
         );
  TLATX1 \gray_data8_reg[5]  ( .G(n663), .D(gray_data[5]), .Q(gray_data8[5])
         );
  TLATX1 \gray_data8_reg[3]  ( .G(n663), .D(gray_data[3]), .Q(gray_data8[3])
         );
  TLATX1 \gray_data4_reg[7]  ( .G(n382), .D(gray_data[7]), .Q(gray_data4[7])
         );
  TLATX1 \gray_data4_reg[5]  ( .G(n382), .D(gray_data[5]), .Q(gray_data4[5])
         );
  TLATX1 \gray_data4_reg[3]  ( .G(n382), .D(gray_data[3]), .Q(gray_data4[3])
         );
  TLATX1 \gray_data2_reg[7]  ( .G(n666), .D(gray_data[7]), .Q(gray_data2[7])
         );
  TLATX1 \gray_data2_reg[5]  ( .G(n666), .D(gray_data[5]), .Q(gray_data2[5])
         );
  TLATX1 \gray_data2_reg[3]  ( .G(n666), .D(gray_data[3]), .Q(gray_data2[3])
         );
  TLATX1 \gray_data7_reg[7]  ( .G(n662), .D(gray_data[7]), .Q(gray_data7[7])
         );
  TLATX1 \gray_data7_reg[5]  ( .G(n662), .D(gray_data[5]), .Q(gray_data7[5])
         );
  TLATX1 \gray_data7_reg[3]  ( .G(n662), .D(gray_data[3]), .Q(gray_data7[3])
         );
  TLATX1 \gray_data6_reg[7]  ( .G(n668), .D(gray_data[7]), .Q(gray_data6[7])
         );
  TLATX1 \gray_data6_reg[5]  ( .G(n668), .D(gray_data[5]), .Q(gray_data6[5])
         );
  TLATX1 \gray_data6_reg[3]  ( .G(n668), .D(gray_data[3]), .Q(gray_data6[3])
         );
  TLATX1 \gray_data5_reg[7]  ( .G(n667), .D(gray_data[7]), .Q(gray_data5[7])
         );
  TLATX1 \gray_data5_reg[5]  ( .G(n667), .D(gray_data[5]), .Q(gray_data5[5])
         );
  TLATX1 \gray_data5_reg[3]  ( .G(n667), .D(gray_data[3]), .Q(gray_data5[3])
         );
  TLATX1 \gray_data3_reg[7]  ( .G(n661), .D(gray_data[7]), .Q(gray_data3[7])
         );
  TLATX1 \gray_data3_reg[5]  ( .G(n661), .D(gray_data[5]), .Q(gray_data3[5])
         );
  TLATX1 \gray_data3_reg[3]  ( .G(n661), .D(gray_data[3]), .Q(gray_data3[3])
         );
  TLATX1 \LBP_7_reg[7]  ( .G(n663), .D(N405), .Q(N518) );
  TLATX1 \LBP_6_reg[6]  ( .G(n662), .D(N406), .Q(\C38/DATA2_6 ) );
  TLATX1 \LBP_0_reg[0]  ( .G(n665), .D(N412), .Q(N679) );
  TLATX1 \LBP_1_reg[1]  ( .G(n666), .D(N411), .Q(N680) );
  TLATX1 \gray_data1_reg[0]  ( .G(n665), .D(gray_data[0]), .Q(gray_data1[0])
         );
  TLATX1 \gray_data8_reg[0]  ( .G(n663), .D(gray_data[0]), .Q(gray_data8[0])
         );
  TLATX1 \gray_data4_reg[0]  ( .G(n382), .D(gray_data[0]), .Q(gray_data4[0])
         );
  TLATX1 \gray_data2_reg[0]  ( .G(n666), .D(gray_data[0]), .Q(gray_data2[0])
         );
  TLATX1 \gray_data7_reg[0]  ( .G(n662), .D(gray_data[0]), .Q(gray_data7[0])
         );
  TLATX1 \gray_data6_reg[0]  ( .G(n668), .D(gray_data[0]), .Q(gray_data6[0])
         );
  TLATX1 \gray_data5_reg[0]  ( .G(n667), .D(gray_data[0]), .Q(gray_data5[0])
         );
  TLATX1 \gray_data3_reg[0]  ( .G(n661), .D(gray_data[0]), .Q(gray_data3[0])
         );
  TLATX1 \gray_data1_reg[1]  ( .G(n665), .D(gray_data[1]), .Q(gray_data1[1])
         );
  TLATX1 \gray_data8_reg[1]  ( .G(n663), .D(gray_data[1]), .Q(gray_data8[1])
         );
  TLATX1 \gray_data4_reg[1]  ( .G(n382), .D(gray_data[1]), .Q(gray_data4[1])
         );
  TLATX1 \gray_data2_reg[1]  ( .G(n666), .D(gray_data[1]), .Q(gray_data2[1])
         );
  TLATX1 \gray_data7_reg[1]  ( .G(n662), .D(gray_data[1]), .Q(gray_data7[1])
         );
  TLATX1 \gray_data6_reg[1]  ( .G(n668), .D(gray_data[1]), .Q(gray_data6[1])
         );
  TLATX1 \gray_data5_reg[1]  ( .G(n667), .D(gray_data[1]), .Q(gray_data5[1])
         );
  TLATX1 \gray_data3_reg[1]  ( .G(n661), .D(gray_data[1]), .Q(gray_data3[1])
         );
  TLATX1 \gray_data1_reg[6]  ( .G(n665), .D(gray_data[6]), .Q(gray_data1[6])
         );
  TLATX1 \gray_data1_reg[4]  ( .G(n665), .D(gray_data[4]), .Q(gray_data1[4])
         );
  TLATX1 \gray_data2_reg[6]  ( .G(n666), .D(gray_data[6]), .Q(gray_data2[6])
         );
  TLATX1 \gray_data2_reg[4]  ( .G(n666), .D(gray_data[4]), .Q(gray_data2[4])
         );
  TLATX1 \gray_data8_reg[6]  ( .G(n663), .D(gray_data[6]), .Q(gray_data8[6])
         );
  TLATX1 \gray_data8_reg[4]  ( .G(n663), .D(gray_data[4]), .Q(gray_data8[4])
         );
  TLATX1 \gray_data4_reg[6]  ( .G(n382), .D(gray_data[6]), .Q(gray_data4[6])
         );
  TLATX1 \gray_data4_reg[4]  ( .G(n382), .D(gray_data[4]), .Q(gray_data4[4])
         );
  TLATX1 \gray_data7_reg[6]  ( .G(n662), .D(gray_data[6]), .Q(gray_data7[6])
         );
  TLATX1 \gray_data7_reg[4]  ( .G(n662), .D(gray_data[4]), .Q(gray_data7[4])
         );
  TLATX1 \gray_data6_reg[6]  ( .G(n668), .D(gray_data[6]), .Q(gray_data6[6])
         );
  TLATX1 \gray_data6_reg[4]  ( .G(n668), .D(gray_data[4]), .Q(gray_data6[4])
         );
  TLATX1 \gray_data5_reg[6]  ( .G(n667), .D(gray_data[6]), .Q(gray_data5[6])
         );
  TLATX1 \gray_data5_reg[4]  ( .G(n667), .D(gray_data[4]), .Q(gray_data5[4])
         );
  TLATX1 \gray_data3_reg[6]  ( .G(n661), .D(gray_data[6]), .Q(gray_data3[6])
         );
  TLATX1 \gray_data3_reg[4]  ( .G(n661), .D(gray_data[4]), .Q(gray_data3[4])
         );
  TLATX1 \gray_data1_reg[2]  ( .G(n665), .D(gray_data[2]), .Q(gray_data1[2])
         );
  TLATX1 \gray_data8_reg[2]  ( .G(n663), .D(gray_data[2]), .Q(gray_data8[2])
         );
  TLATX1 \gray_data4_reg[2]  ( .G(n382), .D(gray_data[2]), .Q(gray_data4[2])
         );
  TLATX1 \gray_data2_reg[2]  ( .G(n666), .D(gray_data[2]), .Q(gray_data2[2])
         );
  TLATX1 \gray_data7_reg[2]  ( .G(n662), .D(gray_data[2]), .Q(gray_data7[2])
         );
  TLATX1 \gray_data6_reg[2]  ( .G(n668), .D(gray_data[2]), .Q(gray_data6[2])
         );
  TLATX1 \gray_data5_reg[2]  ( .G(n667), .D(gray_data[2]), .Q(gray_data5[2])
         );
  TLATX1 \gray_data3_reg[2]  ( .G(n661), .D(gray_data[2]), .Q(gray_data3[2])
         );
  DFFRX1 gray_req_reg ( .D(n289), .CK(clk), .RN(n664), .QN(n328) );
  DFFRX1 lbp_valid_reg ( .D(n474), .CK(clk), .RN(n301), .QN(n330) );
  DFFRX1 finish_reg ( .D(N714), .CK(clk), .RN(n301), .QN(n332) );
  DFFRX1 \lbp_data_reg[5]  ( .D(n258), .CK(clk), .RN(n301), .Q(n692), .QN(n376) );
  DFFRX1 \lbp_data_reg[3]  ( .D(n256), .CK(clk), .RN(n301), .Q(n694), .QN(n378) );
  DFFRX1 \lbp_data_reg[2]  ( .D(n255), .CK(clk), .RN(n664), .Q(n695), .QN(n380) );
  DFFRX1 \lbp_addr_reg[13]  ( .D(n252), .CK(clk), .RN(n664), .Q(n676), .QN(
        n352) );
  DFFRX1 \lbp_addr_reg[10]  ( .D(n249), .CK(clk), .RN(n664), .Q(n679), .QN(
        n354) );
  DFFRX1 \lbp_addr_reg[6]  ( .D(n245), .CK(clk), .RN(n664), .Q(n683), .QN(n356) );
  DFFRX1 \lbp_addr_reg[5]  ( .D(n244), .CK(clk), .RN(n664), .Q(n684), .QN(n358) );
  DFFRX1 \lbp_addr_reg[1]  ( .D(n240), .CK(clk), .RN(n301), .Q(n688), .QN(n360) );
  DFFRX1 \lbp_addr_reg[8]  ( .D(n247), .CK(clk), .RN(n664), .Q(n681), .QN(n362) );
  DFFRX1 \lbp_addr_reg[4]  ( .D(n243), .CK(clk), .RN(n664), .Q(n685), .QN(n364) );
  DFFRX1 \lbp_addr_reg[3]  ( .D(n242), .CK(clk), .RN(n664), .Q(n686), .QN(n366) );
  DFFRX1 \lbp_addr_reg[0]  ( .D(n239), .CK(clk), .RN(n301), .Q(n689), .QN(n368) );
  DFFRX1 \lbp_addr_reg[2]  ( .D(n241), .CK(clk), .RN(n301), .Q(n687), .QN(n348) );
  DFFRX1 \lbp_addr_reg[9]  ( .D(n248), .CK(clk), .RN(n664), .Q(n680), .QN(n370) );
  DFFRX1 \lbp_addr_reg[7]  ( .D(n246), .CK(clk), .RN(n664), .Q(n682), .QN(n372) );
  DFFRX1 \lbp_addr_reg[11]  ( .D(n250), .CK(clk), .RN(n664), .Q(n678), .QN(
        n374) );
  DFFRX1 \lbp_data_reg[4]  ( .D(n257), .CK(clk), .RN(n301), .Q(n693), .QN(n350) );
  ADDFX1 \DP_OP_184J1_123_1844/U3  ( .A(\C1/Z_0 ), .B(gray_0[12]), .CI(
        \DP_OP_184J1_123_1844/n3 ), .CO(\DP_OP_184J1_123_1844/n2 ), .S(
        \C39/DATA3_12 ) );
  ADDFX1 \DP_OP_184J1_123_1844/U4  ( .A(\C1/Z_0 ), .B(gray_0[11]), .CI(
        \DP_OP_184J1_123_1844/n4 ), .CO(\DP_OP_184J1_123_1844/n3 ), .S(
        \C39/DATA3_11 ) );
  ADDFX1 \DP_OP_184J1_123_1844/U5  ( .A(\C1/Z_0 ), .B(gray_0[10]), .CI(
        \DP_OP_184J1_123_1844/n5 ), .CO(\DP_OP_184J1_123_1844/n4 ), .S(
        \C39/DATA3_10 ) );
  ADDFXL \DP_OP_184J1_123_1844/U6  ( .A(\C1/Z_0 ), .B(gray_0[9]), .CI(
        \DP_OP_184J1_123_1844/n6 ), .CO(\DP_OP_184J1_123_1844/n5 ), .S(
        \C39/DATA3_9 ) );
  ADDFXL \DP_OP_184J1_123_1844/U7  ( .A(\C1/Z_0 ), .B(gray_0[8]), .CI(
        \DP_OP_184J1_123_1844/n7 ), .CO(\DP_OP_184J1_123_1844/n6 ), .S(
        \C39/DATA3_8 ) );
  ADDFXL \DP_OP_184J1_123_1844/U9  ( .A(\DP_OP_184J1_123_1844/n21 ), .B(
        gray_0[6]), .CI(\DP_OP_184J1_123_1844/n9 ), .CO(
        \DP_OP_184J1_123_1844/n8 ), .S(\C39/DATA3_6 ) );
  ADDFXL \DP_OP_184J1_123_1844/U13  ( .A(\DP_OP_184J1_123_1844/n21 ), .B(
        gray_0[2]), .CI(\DP_OP_184J1_123_1844/n13 ), .CO(
        \DP_OP_184J1_123_1844/n12 ), .S(\C39/DATA3_2 ) );
  ADDFXL \DP_OP_184J1_123_1844/U11  ( .A(\DP_OP_184J1_123_1844/n21 ), .B(
        gray_0[4]), .CI(\DP_OP_184J1_123_1844/n11 ), .CO(
        \DP_OP_184J1_123_1844/n10 ), .S(\C39/DATA3_4 ) );
  ADDFXL \DP_OP_184J1_123_1844/U15  ( .A(gray_0[0]), .B(\C1/Z_0 ), .CI(
        \DP_OP_184J1_123_1844/n26 ), .CO(\DP_OP_184J1_123_1844/n14 ), .S(
        \C39/DATA3_0 ) );
  ADDFHX2 \DP_OP_184J1_123_1844/U8  ( .A(\DP_OP_184J1_123_1844/n19 ), .B(
        gray_0[7]), .CI(\DP_OP_184J1_123_1844/n8 ), .CO(
        \DP_OP_184J1_123_1844/n7 ), .S(\C39/DATA3_7 ) );
  DFFRX1 \counter_reg[1]  ( .D(N54), .CK(clk), .RN(n301), .Q(counter[1]), .QN(
        n632) );
  TLATX4 \gray_data0_reg[2]  ( .G(N366), .D(gray_data[2]), .QN(n656) );
  TLATX4 \gray_data0_reg[4]  ( .G(N366), .D(gray_data[4]), .QN(n657) );
  TLATX4 \gray_data0_reg[6]  ( .G(N366), .D(gray_data[6]), .QN(n658) );
  TLATX4 \gray_data0_reg[1]  ( .G(N366), .D(gray_data[1]), .QN(n640) );
  TLATX4 \gray_data0_reg[3]  ( .G(N366), .D(gray_data[3]), .Q(gray_data0[3])
         );
  TLATX4 \gray_data0_reg[5]  ( .G(N366), .D(gray_data[5]), .Q(gray_data0[5])
         );
  TLATX4 \gray_data0_reg[7]  ( .G(N366), .D(gray_data[7]), .Q(gray_data0[7])
         );
  DFFRX1 \gray_addr_reg[7]  ( .D(n268), .CK(clk), .RN(n301), .Q(n673), .QN(
        n346) );
  DFFRX1 \gray_addr_reg[11]  ( .D(n272), .CK(clk), .RN(n405), .Q(n671), .QN(
        n344) );
  DFFRX1 \gray_addr_reg[9]  ( .D(n270), .CK(clk), .RN(n301), .Q(n672), .QN(
        n342) );
  DFFRX1 \gray_addr_reg[6]  ( .D(n267), .CK(clk), .RN(n301), .Q(n674), .QN(
        n340) );
  DFFRX1 \gray_addr_reg[13]  ( .D(n274), .CK(clk), .RN(n301), .Q(n669), .QN(
        n338) );
  DFFRX1 \gray_addr_reg[12]  ( .D(n273), .CK(clk), .RN(n301), .Q(n670), .QN(
        n336) );
  DFFRX1 \gray_addr_reg[0]  ( .D(n261), .CK(clk), .RN(n301), .Q(n675), .QN(
        n334) );
  DFFRX1 \lbp_addr_reg[12]  ( .D(n251), .CK(clk), .RN(n664), .Q(n677), .QN(
        n326) );
  DFFRX1 \lbp_data_reg[6]  ( .D(n259), .CK(clk), .RN(n301), .Q(n691), .QN(n324) );
  DFFRX1 \lbp_data_reg[7]  ( .D(n260), .CK(clk), .RN(n301), .Q(n690), .QN(n322) );
  DFFRX1 \lbp_data_reg[0]  ( .D(n253), .CK(clk), .RN(n301), .Q(n697), .QN(n320) );
  DFFRX1 \lbp_data_reg[1]  ( .D(n254), .CK(clk), .RN(n301), .Q(n696), .QN(n318) );
  DFFRX1 \gray_addr_reg[10]  ( .D(n271), .CK(clk), .RN(n664), .QN(n306) );
  DFFRX1 \gray_addr_reg[1]  ( .D(n262), .CK(clk), .RN(n301), .QN(n308) );
  DFFRX1 \gray_addr_reg[8]  ( .D(n269), .CK(clk), .RN(n301), .QN(n309) );
  DFFRX1 \gray_addr_reg[4]  ( .D(n265), .CK(clk), .RN(n301), .QN(n310) );
  DFFRX1 \gray_addr_reg[3]  ( .D(n264), .CK(clk), .RN(n301), .QN(n303) );
  DFFRX1 \gray_addr_reg[2]  ( .D(n263), .CK(clk), .RN(n301), .QN(n304) );
  DFFRX1 \gray_addr_reg[5]  ( .D(n266), .CK(clk), .RN(n301), .QN(n307) );
  DFFRX2 \gray_0_reg[12]  ( .D(n286), .CK(clk), .RN(n664), .Q(gray_0[12]) );
  TLATX2 \gray_data0_reg[0]  ( .G(N366), .D(gray_data[0]), .QN(n659) );
  DFFRX2 \counter_reg[2]  ( .D(N55), .CK(clk), .RN(n301), .Q(counter[2]), .QN(
        n643) );
  DFFRX1 \counter_reg[3]  ( .D(N56), .CK(clk), .RN(n301), .Q(counter[3]), .QN(
        n641) );
  DFFRX2 \counter_reg[0]  ( .D(N53), .CK(clk), .RN(n301), .Q(counter[0]), .QN(
        n633) );
  ADDFX1 \DP_OP_184J1_123_1844/U14  ( .A(\DP_OP_184J1_123_1844/n21 ), .B(
        gray_0[1]), .CI(\DP_OP_184J1_123_1844/n14 ), .CO(
        \DP_OP_184J1_123_1844/n13 ), .S(\C39/DATA3_1 ) );
  ADDFX1 \DP_OP_184J1_123_1844/U12  ( .A(\DP_OP_184J1_123_1844/n21 ), .B(
        gray_0[3]), .CI(\DP_OP_184J1_123_1844/n12 ), .CO(
        \DP_OP_184J1_123_1844/n11 ), .S(\C39/DATA3_3 ) );
  ADDFX1 \DP_OP_184J1_123_1844/U10  ( .A(\DP_OP_184J1_123_1844/n21 ), .B(
        gray_0[5]), .CI(\DP_OP_184J1_123_1844/n10 ), .CO(
        \DP_OP_184J1_123_1844/n9 ), .S(\C39/DATA3_5 ) );
  CLKINVX1 U329 ( .A(n489), .Y(n300) );
  CLKAND2X3 U330 ( .A(n413), .B(n633), .Y(n665) );
  NOR2X1 U331 ( .A(n632), .B(counter[3]), .Y(n401) );
  NOR2X4 U332 ( .A(n633), .B(n302), .Y(n382) );
  CLKBUFX3 U333 ( .A(n412), .Y(n302) );
  INVX1 U334 ( .A(n402), .Y(n490) );
  INVX1 U335 ( .A(n426), .Y(n470) );
  NAND2X1 U336 ( .A(gray_0[10]), .B(n438), .Y(n469) );
  NAND2X2 U337 ( .A(n474), .B(n450), .Y(n402) );
  NAND2X1 U338 ( .A(gray_0[8]), .B(n432), .Y(n439) );
  INVX2 U339 ( .A(n514), .Y(n543) );
  INVX6 U340 ( .A(n289), .Y(n474) );
  INVX1 U341 ( .A(n665), .Y(n485) );
  NAND2X1 U342 ( .A(gray_0[6]), .B(n443), .Y(n433) );
  NAND3X1 U343 ( .A(n450), .B(n407), .C(gray_ready), .Y(n387) );
  NOR2X1 U344 ( .A(n484), .B(n633), .Y(n396) );
  INVX2 U345 ( .A(n483), .Y(n668) );
  INVX1 U346 ( .A(n479), .Y(n407) );
  CLKBUFX8 U347 ( .A(n405), .Y(n301) );
  INVXL U348 ( .A(n666), .Y(n384) );
  BUFX2 U349 ( .A(n388), .Y(n533) );
  NAND2XL U350 ( .A(n448), .B(gray_0[6]), .Y(n422) );
  NAND2XL U351 ( .A(n300), .B(n418), .Y(n447) );
  NAND3XL U352 ( .A(n481), .B(n480), .C(n484), .Y(n482) );
  NAND3XL U353 ( .A(n632), .B(n641), .C(counter[2]), .Y(n412) );
  NAND2XL U354 ( .A(gray_0[5]), .B(n418), .Y(n419) );
  NAND2XL U355 ( .A(n300), .B(n448), .Y(n436) );
  NAND2XL U356 ( .A(n300), .B(n437), .Y(n442) );
  AOI21XL U357 ( .A0(n648), .A1(n469), .B0(n468), .Y(n540) );
  NOR2XL U358 ( .A(n489), .B(n430), .Y(n458) );
  INVXL U359 ( .A(n447), .Y(n416) );
  NAND3XL U360 ( .A(gray_0[2]), .B(gray_0[0]), .C(gray_0[1]), .Y(n463) );
  AND2X1 U361 ( .A(gray_0[3]), .B(n465), .Y(n418) );
  NAND2XL U362 ( .A(gray_0[4]), .B(n462), .Y(n444) );
  NAND3XL U363 ( .A(gray_0[10]), .B(gray_0[11]), .C(n470), .Y(n430) );
  INVXL U364 ( .A(n484), .Y(n411) );
  AOI21XL U365 ( .A0(n647), .A1(n439), .B0(n438), .Y(n530) );
  NAND2XL U366 ( .A(n437), .B(n425), .Y(n426) );
  NAND2XL U367 ( .A(edge_counter[8]), .B(n551), .Y(n550) );
  NAND4BX1 U368 ( .AN(n547), .B(edge_counter[10]), .C(edge_counter[5]), .D(
        edge_counter[6]), .Y(n386) );
  NAND2XL U369 ( .A(edge_counter[6]), .B(n451), .Y(n453) );
  NAND2XL U370 ( .A(edge_counter[4]), .B(n549), .Y(n548) );
  INVXL U371 ( .A(n398), .Y(n399) );
  NOR2XL U372 ( .A(n547), .B(n634), .Y(n398) );
  NAND3XL U373 ( .A(n510), .B(n509), .C(n508), .Y(n266) );
  NAND2XL U374 ( .A(n537), .B(\C39/DATA3_5 ), .Y(n508) );
  NAND2XL U375 ( .A(n539), .B(n507), .Y(n510) );
  NAND2XL U376 ( .A(n537), .B(\C39/DATA3_2 ), .Y(n512) );
  NAND2XL U377 ( .A(n537), .B(\C39/DATA3_3 ), .Y(n515) );
  AOI22XL U378 ( .A0(n514), .A1(gray_0[3]), .B0(n538), .B1(gray_addr[3]), .Y(
        n516) );
  NAND2XL U379 ( .A(n537), .B(\C39/DATA3_4 ), .Y(n519) );
  NAND2XL U380 ( .A(n537), .B(\C39/DATA3_8 ), .Y(n529) );
  AOI22XL U381 ( .A0(n514), .A1(gray_0[1]), .B0(n538), .B1(gray_addr[1]), .Y(
        n503) );
  NAND2XL U382 ( .A(n539), .B(n501), .Y(n504) );
  NAND2XL U383 ( .A(n537), .B(\C39/DATA3_10 ), .Y(n536) );
  OAI2BB1XL U384 ( .A0N(n479), .A1N(n696), .B0(n415), .Y(n254) );
  OAI2BB1XL U385 ( .A0N(n479), .A1N(n697), .B0(n414), .Y(n253) );
  NAND2XL U386 ( .A(n537), .B(\C39/DATA3_0 ), .Y(n505) );
  NAND2XL U387 ( .A(n537), .B(\C39/DATA3_12 ), .Y(n499) );
  NAND2XL U388 ( .A(n537), .B(\C39/DATA3_6 ), .Y(n522) );
  NAND2XL U389 ( .A(n537), .B(\C39/DATA3_9 ), .Y(n532) );
  NAND2XL U390 ( .A(n537), .B(\C39/DATA3_11 ), .Y(n542) );
  NAND2XL U391 ( .A(n537), .B(\C39/DATA3_7 ), .Y(n526) );
  NOR2XL U392 ( .A(n302), .B(counter[0]), .Y(n383) );
  AOI22XL U393 ( .A0(gray_0[7]), .A1(n434), .B0(n490), .B1(n524), .Y(n435) );
  OAI211XL U394 ( .A0(n402), .A1(n517), .B0(n467), .C0(n466), .Y(n277) );
  NAND2XL U395 ( .A(gray_0[3]), .B(n464), .Y(n467) );
  AOI22XL U396 ( .A0(gray_0[5]), .A1(n445), .B0(n490), .B1(n507), .Y(n446) );
  INVXL U397 ( .A(n436), .Y(n420) );
  INVXL U398 ( .A(n442), .Y(n423) );
  OAI211XL U399 ( .A0(n473), .A1(n648), .B0(n472), .C0(n471), .Y(n285) );
  NAND2XL U400 ( .A(n490), .B(n540), .Y(n472) );
  OAI211XL U401 ( .A0(n402), .A1(n461), .B0(n460), .C0(n459), .Y(n287) );
  NAND2XL U402 ( .A(gray_0[13]), .B(n457), .Y(n460) );
  AOI211XL U403 ( .A0(edge_counter[10]), .A1(n456), .B0(n455), .C0(n454), .Y(
        N80) );
  NOR2XL U404 ( .A(edge_counter[10]), .B(n456), .Y(n454) );
  NAND4XL U405 ( .A(gray_addr[3]), .B(gray_addr[2]), .C(gray_addr[1]), .D(n675), .Y(n305) );
  OR2X2 U406 ( .A(n666), .B(n667), .Y(n488) );
  CLKAND2X3 U407 ( .A(n413), .B(counter[0]), .Y(n666) );
  NAND2XL U408 ( .A(n470), .B(n495), .Y(n440) );
  NAND2XL U409 ( .A(n448), .B(n495), .Y(n445) );
  NAND2XL U410 ( .A(n437), .B(n495), .Y(n434) );
  NAND2XL U411 ( .A(n418), .B(n495), .Y(n464) );
  NAND2X2 U412 ( .A(n289), .B(n489), .Y(n495) );
  NAND2XL U413 ( .A(gray_0[12]), .B(n468), .Y(n429) );
  NAND2XL U414 ( .A(gray_0[12]), .B(n473), .Y(n457) );
  INVX16 U415 ( .A(n307), .Y(gray_addr[5]) );
  INVX16 U416 ( .A(n304), .Y(gray_addr[2]) );
  INVX16 U417 ( .A(n303), .Y(gray_addr[3]) );
  INVX16 U418 ( .A(n310), .Y(gray_addr[4]) );
  INVX16 U419 ( .A(n309), .Y(gray_addr[8]) );
  INVX16 U420 ( .A(n308), .Y(gray_addr[1]) );
  INVX16 U421 ( .A(n306), .Y(gray_addr[10]) );
  NAND2X2 U422 ( .A(n407), .B(n406), .Y(N366) );
  NOR2X4 U423 ( .A(n497), .B(n397), .Y(n667) );
  INVX12 U424 ( .A(n318), .Y(lbp_data[1]) );
  INVX12 U425 ( .A(n320), .Y(lbp_data[0]) );
  INVX12 U426 ( .A(n322), .Y(lbp_data[7]) );
  INVX12 U427 ( .A(n324), .Y(lbp_data[6]) );
  INVX12 U428 ( .A(n326), .Y(lbp_addr[12]) );
  INVX12 U429 ( .A(n328), .Y(gray_req) );
  INVX12 U430 ( .A(n330), .Y(lbp_valid) );
  INVX12 U431 ( .A(n332), .Y(finish) );
  NOR4XL U432 ( .A(n546), .B(n305), .C(n545), .D(n544), .Y(N714) );
  INVX12 U433 ( .A(n334), .Y(gray_addr[0]) );
  AOI22XL U434 ( .A0(n514), .A1(gray_0[0]), .B0(n538), .B1(n675), .Y(n506) );
  INVX12 U435 ( .A(n336), .Y(gray_addr[12]) );
  AOI22XL U436 ( .A0(n514), .A1(gray_0[12]), .B0(n538), .B1(n670), .Y(n498) );
  INVX12 U437 ( .A(n338), .Y(gray_addr[13]) );
  AOI22XL U438 ( .A0(n514), .A1(gray_0[13]), .B0(n538), .B1(n669), .Y(n394) );
  NAND2XL U439 ( .A(n669), .B(n670), .Y(n546) );
  INVX12 U440 ( .A(n340), .Y(gray_addr[6]) );
  INVX12 U441 ( .A(n342), .Y(gray_addr[9]) );
  AOI22XL U442 ( .A0(n530), .A1(n539), .B0(n672), .B1(n538), .Y(n531) );
  INVX12 U443 ( .A(n344), .Y(gray_addr[11]) );
  AOI22XL U444 ( .A0(n540), .A1(n539), .B0(n671), .B1(n538), .Y(n541) );
  NAND4XL U445 ( .A(n671), .B(gray_addr[10]), .C(n672), .D(gray_addr[8]), .Y(
        n544) );
  INVX12 U446 ( .A(n346), .Y(gray_addr[7]) );
  AOI22XL U447 ( .A0(n524), .A1(n539), .B0(n673), .B1(n538), .Y(n525) );
  NAND4XL U448 ( .A(n673), .B(n674), .C(gray_addr[5]), .D(gray_addr[4]), .Y(
        n545) );
  INVX12 U449 ( .A(n348), .Y(lbp_addr[2]) );
  INVX12 U450 ( .A(n350), .Y(lbp_data[4]) );
  OAI2BB2XL U451 ( .B0(n660), .B1(n477), .A0N(n479), .A1N(n693), .Y(n257) );
  INVX12 U452 ( .A(n352), .Y(lbp_addr[13]) );
  AOI2BB2X1 U453 ( .B0(n474), .B1(n654), .A0N(n474), .A1N(n676), .Y(n252) );
  INVX12 U454 ( .A(n354), .Y(lbp_addr[10]) );
  AOI2BB2X1 U455 ( .B0(n474), .B1(n651), .A0N(n474), .A1N(n679), .Y(n249) );
  INVX12 U456 ( .A(n356), .Y(lbp_addr[6]) );
  AOI2BB2X1 U457 ( .B0(n474), .B1(n652), .A0N(n474), .A1N(n683), .Y(n245) );
  INVX12 U458 ( .A(n358), .Y(lbp_addr[5]) );
  AOI2BB2X1 U459 ( .B0(n474), .B1(n644), .A0N(n474), .A1N(n684), .Y(n244) );
  INVX12 U460 ( .A(n360), .Y(lbp_addr[1]) );
  AOI2BB2X1 U461 ( .B0(n474), .B1(n649), .A0N(n474), .A1N(n688), .Y(n240) );
  INVX12 U462 ( .A(n362), .Y(lbp_addr[8]) );
  AOI2BB2X1 U463 ( .B0(n474), .B1(n637), .A0N(n474), .A1N(n681), .Y(n247) );
  INVX12 U464 ( .A(n364), .Y(lbp_addr[4]) );
  AOI2BB2X1 U465 ( .B0(n474), .B1(n646), .A0N(n474), .A1N(n685), .Y(n243) );
  INVX12 U466 ( .A(n366), .Y(lbp_addr[3]) );
  AOI2BB2X1 U467 ( .B0(n474), .B1(n642), .A0N(n474), .A1N(n686), .Y(n242) );
  INVX12 U468 ( .A(n368), .Y(lbp_addr[0]) );
  AOI2BB2X1 U469 ( .B0(n474), .B1(n639), .A0N(n474), .A1N(n689), .Y(n239) );
  INVX12 U470 ( .A(n370), .Y(lbp_addr[9]) );
  AOI2BB2X1 U471 ( .B0(n474), .B1(n647), .A0N(n474), .A1N(n680), .Y(n248) );
  INVX12 U472 ( .A(n372), .Y(lbp_addr[7]) );
  AOI2BB2X1 U473 ( .B0(n474), .B1(n635), .A0N(n474), .A1N(n682), .Y(n246) );
  INVX12 U474 ( .A(n374), .Y(lbp_addr[11]) );
  AOI2BB2X1 U475 ( .B0(n474), .B1(n648), .A0N(n474), .A1N(n678), .Y(n250) );
  INVX12 U476 ( .A(n376), .Y(lbp_data[5]) );
  AO22X1 U477 ( .A0(n479), .A1(n692), .B0(\C38/DATA3_5 ), .B1(n475), .Y(n258)
         );
  INVX12 U478 ( .A(n378), .Y(lbp_data[3]) );
  AO22X1 U479 ( .A0(n479), .A1(n694), .B0(\C38/DATA5_3 ), .B1(n478), .Y(n256)
         );
  INVX12 U480 ( .A(n380), .Y(lbp_data[2]) );
  AO22X1 U481 ( .A0(n479), .A1(n695), .B0(\C38/DATA6_2 ), .B1(n476), .Y(n255)
         );
  INVXL U482 ( .A(n488), .Y(n481) );
  CLKBUFX3 U483 ( .A(n387), .Y(n538) );
  NOR2XL U484 ( .A(n489), .B(n426), .Y(n427) );
  NAND2XL U485 ( .A(n537), .B(\C39/DATA3_1 ), .Y(n502) );
  AOI22XL U486 ( .A0(n514), .A1(gray_0[5]), .B0(n538), .B1(gray_addr[5]), .Y(
        n509) );
  NAND2XL U487 ( .A(n393), .B(n537), .Y(n395) );
  NAND2XL U488 ( .A(n477), .B(n302), .Y(n476) );
  AOI22XL U489 ( .A0(gray_0[9]), .A1(n440), .B0(n490), .B1(n530), .Y(n441) );
  NAND3XL U490 ( .A(n504), .B(n503), .C(n502), .Y(n262) );
  OAI211XL U491 ( .A0(n533), .A1(n461), .B0(n395), .C0(n394), .Y(n274) );
  AOI2BB2X1 U492 ( .B0(n474), .B1(n645), .A0N(n474), .A1N(n687), .Y(n241) );
  NAND2X1 U493 ( .A(n663), .B(gray_ready), .Y(n289) );
  AOI21XL U494 ( .A0(n653), .A1(n550), .B0(n456), .Y(N79) );
  INVX3 U495 ( .A(n401), .Y(n497) );
  NOR2X2 U496 ( .A(n497), .B(counter[2]), .Y(n413) );
  CLKBUFX3 U497 ( .A(n383), .Y(n661) );
  NOR2X1 U498 ( .A(counter[2]), .B(counter[1]), .Y(n390) );
  NAND2X1 U499 ( .A(n390), .B(n641), .Y(n406) );
  NOR2X1 U500 ( .A(n406), .B(n633), .Y(n486) );
  NOR2X2 U501 ( .A(n661), .B(n486), .Y(n480) );
  NAND3X4 U502 ( .A(n384), .B(n485), .C(n480), .Y(\C1/Z_0 ) );
  NAND2X1 U503 ( .A(edge_counter[0]), .B(edge_counter[1]), .Y(n547) );
  NOR4XL U504 ( .A(edge_counter[8]), .B(edge_counter[2]), .C(edge_counter[4]), 
        .D(edge_counter[9]), .Y(n385) );
  NAND4BX1 U505 ( .AN(n386), .B(edge_counter[3]), .C(edge_counter[7]), .D(n385), .Y(n450) );
  NOR2X2 U506 ( .A(n390), .B(n641), .Y(n479) );
  NAND2BX1 U507 ( .AN(n538), .B(n382), .Y(n388) );
  NOR2X1 U508 ( .A(n642), .B(n463), .Y(n462) );
  NOR2X1 U509 ( .A(n644), .B(n444), .Y(n443) );
  NOR2X1 U510 ( .A(n635), .B(n433), .Y(n432) );
  NOR2X1 U511 ( .A(n647), .B(n439), .Y(n438) );
  NOR2X1 U512 ( .A(n648), .B(n469), .Y(n468) );
  XOR2X1 U513 ( .A(gray_0[13]), .B(n429), .Y(n461) );
  XOR2X1 U514 ( .A(\C1/Z_0 ), .B(gray_0[13]), .Y(n389) );
  XOR2X1 U515 ( .A(\DP_OP_184J1_123_1844/n2 ), .B(n389), .Y(n393) );
  NAND2XL U516 ( .A(n633), .B(counter[2]), .Y(n397) );
  NAND2X1 U517 ( .A(n390), .B(counter[3]), .Y(n484) );
  OAI211XL U518 ( .A0(counter[2]), .A1(n633), .B0(n397), .C0(n484), .Y(n391)
         );
  NOR2XL U519 ( .A(counter[1]), .B(n391), .Y(n392) );
  NOR2X4 U520 ( .A(n538), .B(n392), .Y(n537) );
  NOR3X2 U521 ( .A(n538), .B(counter[0]), .C(n406), .Y(n514) );
  CLKBUFX3 U522 ( .A(n396), .Y(n663) );
  CLKINVX1 U523 ( .A(n450), .Y(n455) );
  AOI211XL U524 ( .A0(n547), .A1(n634), .B0(n398), .C0(n455), .Y(N72) );
  NOR2X1 U525 ( .A(n636), .B(n399), .Y(n549) );
  AOI211XL U526 ( .A0(n636), .A1(n399), .B0(n549), .C0(n455), .Y(N73) );
  NOR2X1 U527 ( .A(n638), .B(n548), .Y(n451) );
  AOI211XL U528 ( .A0(n638), .A1(n548), .B0(n451), .C0(n455), .Y(N75) );
  NOR2XL U529 ( .A(n643), .B(n633), .Y(n400) );
  NAND2X1 U530 ( .A(n401), .B(n400), .Y(n483) );
  AO22X1 U531 ( .A0(n411), .A1(\C38/DATA2_6 ), .B0(n479), .B1(n691), .Y(n259)
         );
  AO22X1 U532 ( .A0(n663), .A1(N518), .B0(n479), .B1(n690), .Y(n260) );
  AO22X1 U533 ( .A0(n474), .A1(gray_0[12]), .B0(n289), .B1(n677), .Y(n251) );
  NOR2XL U534 ( .A(n639), .B(n649), .Y(n492) );
  OAI21XL U535 ( .A0(gray_0[2]), .A1(n492), .B0(n463), .Y(n511) );
  NAND2X1 U536 ( .A(gray_ready), .B(n455), .Y(n489) );
  NOR2X1 U537 ( .A(gray_0[0]), .B(gray_0[1]), .Y(n493) );
  NOR2X1 U538 ( .A(n493), .B(n645), .Y(n465) );
  AOI211XL U539 ( .A0(n493), .A1(n645), .B0(n489), .C0(n465), .Y(n403) );
  AOI2BB1X1 U540 ( .A0N(n495), .A1N(n645), .B0(n403), .Y(n404) );
  OAI21XL U541 ( .A0(n402), .A1(n511), .B0(n404), .Y(n276) );
  INVX1 U542 ( .A(reset), .Y(n405) );
  CLKBUFX3 U543 ( .A(n405), .Y(n664) );
  NOR2XL U544 ( .A(counter[0]), .B(n479), .Y(N53) );
  NOR2XL U545 ( .A(n632), .B(n633), .Y(n409) );
  NOR2XL U546 ( .A(counter[2]), .B(n409), .Y(n408) );
  AOI211XL U547 ( .A0(counter[2]), .A1(n409), .B0(counter[3]), .C0(n408), .Y(
        N55) );
  NOR2XL U548 ( .A(counter[0]), .B(n484), .Y(n410) );
  CLKBUFX3 U549 ( .A(n410), .Y(n662) );
  NOR3X1 U550 ( .A(n411), .B(n667), .C(n668), .Y(n477) );
  OAI21XL U551 ( .A0(n413), .A1(n476), .B0(N679), .Y(n414) );
  OAI21XL U552 ( .A0(n666), .A1(n476), .B0(N680), .Y(n415) );
  OAI21XL U553 ( .A0(gray_0[4]), .A1(n462), .B0(n444), .Y(n518) );
  MXI2X1 U554 ( .A(n416), .B(n464), .S0(gray_0[4]), .Y(n417) );
  OAI21XL U555 ( .A0(n402), .A1(n518), .B0(n417), .Y(n278) );
  OAI21XL U556 ( .A0(gray_0[6]), .A1(n443), .B0(n433), .Y(n521) );
  NOR2X1 U557 ( .A(n646), .B(n419), .Y(n448) );
  MXI2X1 U558 ( .A(n420), .B(n445), .S0(gray_0[6]), .Y(n421) );
  OAI21XL U559 ( .A0(n402), .A1(n521), .B0(n421), .Y(n280) );
  OAI21XL U560 ( .A0(gray_0[8]), .A1(n432), .B0(n439), .Y(n527) );
  NOR2X1 U561 ( .A(n635), .B(n422), .Y(n437) );
  MXI2X1 U562 ( .A(n423), .B(n434), .S0(gray_0[8]), .Y(n424) );
  OAI21XL U563 ( .A0(n402), .A1(n527), .B0(n424), .Y(n282) );
  OAI21XL U564 ( .A0(gray_0[10]), .A1(n438), .B0(n469), .Y(n534) );
  NOR2XL U565 ( .A(n637), .B(n647), .Y(n425) );
  MXI2X1 U566 ( .A(n427), .B(n440), .S0(gray_0[10]), .Y(n428) );
  OAI21XL U567 ( .A0(n402), .A1(n534), .B0(n428), .Y(n284) );
  OAI21XL U568 ( .A0(gray_0[12]), .A1(n468), .B0(n429), .Y(n500) );
  NOR2BX1 U569 ( .AN(n495), .B(n430), .Y(n473) );
  OAI21XL U570 ( .A0(n458), .A1(gray_0[12]), .B0(n457), .Y(n431) );
  OAI21XL U571 ( .A0(n402), .A1(n500), .B0(n431), .Y(n286) );
  AOI21XL U572 ( .A0(n635), .A1(n433), .B0(n432), .Y(n524) );
  OAI31XL U573 ( .A0(n437), .A1(n436), .A2(n652), .B0(n435), .Y(n281) );
  OAI31XL U574 ( .A0(n470), .A1(n442), .A2(n637), .B0(n441), .Y(n283) );
  AOI21XL U575 ( .A0(n644), .A1(n444), .B0(n443), .Y(n507) );
  OAI31XL U576 ( .A0(n448), .A1(n447), .A2(n646), .B0(n446), .Y(n279) );
  INVXL U577 ( .A(n662), .Y(n449) );
  NAND2XL U578 ( .A(n483), .B(n449), .Y(N56) );
  OAI211XL U579 ( .A0(edge_counter[6]), .A1(n451), .B0(n453), .C0(n450), .Y(
        n452) );
  INVXL U580 ( .A(n452), .Y(N76) );
  NOR2X1 U581 ( .A(n650), .B(n453), .Y(n551) );
  AOI211XL U582 ( .A0(n650), .A1(n453), .B0(n551), .C0(n455), .Y(N77) );
  NOR2X1 U583 ( .A(n653), .B(n550), .Y(n456) );
  NAND3XL U584 ( .A(n458), .B(gray_0[12]), .C(n654), .Y(n459) );
  AO21X1 U585 ( .A0(n642), .A1(n463), .B0(n462), .Y(n517) );
  NAND3XL U586 ( .A(n642), .B(n300), .C(n465), .Y(n466) );
  NAND4XL U587 ( .A(n470), .B(gray_0[10]), .C(n300), .D(n648), .Y(n471) );
  NAND2XL U588 ( .A(n484), .B(n483), .Y(n475) );
  NAND2BX1 U589 ( .AN(n382), .B(n477), .Y(n478) );
  XOR2X1 U590 ( .A(\C1/Z_0 ), .B(n482), .Y(\DP_OP_184J1_123_1844/n26 ) );
  NAND4BX1 U591 ( .AN(n486), .B(n485), .C(n484), .D(n483), .Y(n487) );
  XOR2X1 U592 ( .A(\C1/Z_0 ), .B(n487), .Y(\DP_OP_184J1_123_1844/n19 ) );
  CLKXOR2X2 U593 ( .A(\C1/Z_0 ), .B(n488), .Y(\DP_OP_184J1_123_1844/n21 ) );
  OAI21XL U594 ( .A0(n490), .A1(n300), .B0(n639), .Y(n491) );
  OAI21XL U595 ( .A0(n495), .A1(n639), .B0(n491), .Y(n288) );
  NOR2X1 U596 ( .A(n493), .B(n492), .Y(n501) );
  OAI2BB2XL U597 ( .B0(n501), .B1(n300), .A0N(n501), .A1N(n402), .Y(n494) );
  OAI21XL U598 ( .A0(n495), .A1(n649), .B0(n494), .Y(n275) );
  NAND3XL U599 ( .A(n632), .B(n641), .C(counter[0]), .Y(n496) );
  OAI21XL U600 ( .A0(counter[0]), .A1(n497), .B0(n496), .Y(N54) );
  OAI211XL U601 ( .A0(n533), .A1(n500), .B0(n499), .C0(n498), .Y(n273) );
  CLKINVX1 U602 ( .A(n533), .Y(n539) );
  OAI211XL U603 ( .A0(n533), .A1(gray_0[0]), .B0(n506), .C0(n505), .Y(n261) );
  AOI2BB2X1 U604 ( .B0(gray_addr[2]), .B1(n538), .A0N(n511), .A1N(n533), .Y(
        n513) );
  OAI211XL U605 ( .A0(n543), .A1(n645), .B0(n513), .C0(n512), .Y(n263) );
  OAI211XL U606 ( .A0(n533), .A1(n517), .B0(n516), .C0(n515), .Y(n264) );
  AOI2BB2X1 U607 ( .B0(gray_addr[4]), .B1(n538), .A0N(n518), .A1N(n533), .Y(
        n520) );
  OAI211XL U608 ( .A0(n543), .A1(n646), .B0(n520), .C0(n519), .Y(n265) );
  AOI2BB2X1 U609 ( .B0(n674), .B1(n538), .A0N(n521), .A1N(n533), .Y(n523) );
  OAI211XL U610 ( .A0(n543), .A1(n652), .B0(n523), .C0(n522), .Y(n267) );
  OAI211XL U611 ( .A0(n635), .A1(n543), .B0(n526), .C0(n525), .Y(n268) );
  AOI2BB2X1 U612 ( .B0(gray_addr[8]), .B1(n538), .A0N(n527), .A1N(n533), .Y(
        n528) );
  OAI211XL U613 ( .A0(n543), .A1(n637), .B0(n529), .C0(n528), .Y(n269) );
  OAI211XL U614 ( .A0(n543), .A1(n647), .B0(n532), .C0(n531), .Y(n270) );
  AOI2BB2X1 U615 ( .B0(gray_addr[10]), .B1(n538), .A0N(n534), .A1N(n533), .Y(
        n535) );
  OAI211XL U616 ( .A0(n543), .A1(n651), .B0(n536), .C0(n535), .Y(n271) );
  OAI211XL U617 ( .A0(n543), .A1(n648), .B0(n542), .C0(n541), .Y(n272) );
  OA21XL U618 ( .A0(edge_counter[0]), .A1(edge_counter[1]), .B0(n547), .Y(N71)
         );
  OA21XL U619 ( .A0(edge_counter[4]), .A1(n549), .B0(n548), .Y(N74) );
  OA21XL U620 ( .A0(edge_counter[8]), .A1(n551), .B0(n550), .Y(N78) );
  OAI22XL U621 ( .A0(gray_data8[1]), .A1(n640), .B0(n659), .B1(gray_data8[0]), 
        .Y(n552) );
  OAI2BB1XL U622 ( .A0N(n640), .A1N(gray_data8[1]), .B0(n552), .Y(n553) );
  AOI222XL U623 ( .A0(n553), .A1(gray_data8[2]), .B0(n553), .B1(n656), .C0(
        gray_data8[2]), .C1(n656), .Y(n555) );
  OAI2BB1XL U624 ( .A0N(gray_data0[3]), .A1N(n555), .B0(gray_data8[3]), .Y(
        n554) );
  OAI21XL U625 ( .A0(gray_data0[3]), .A1(n555), .B0(n554), .Y(n556) );
  AOI222XL U626 ( .A0(gray_data8[4]), .A1(n657), .B0(gray_data8[4]), .B1(n556), 
        .C0(n657), .C1(n556), .Y(n558) );
  OAI2BB1XL U627 ( .A0N(gray_data0[5]), .A1N(n558), .B0(gray_data8[5]), .Y(
        n557) );
  OAI21XL U628 ( .A0(gray_data0[5]), .A1(n558), .B0(n557), .Y(n559) );
  AOI222XL U629 ( .A0(gray_data8[6]), .A1(n658), .B0(gray_data8[6]), .B1(n559), 
        .C0(n658), .C1(n559), .Y(n561) );
  OAI2BB1XL U630 ( .A0N(gray_data0[7]), .A1N(n561), .B0(gray_data8[7]), .Y(
        n560) );
  OAI21XL U631 ( .A0(gray_data0[7]), .A1(n561), .B0(n560), .Y(N405) );
  OAI22XL U632 ( .A0(gray_data7[1]), .A1(n640), .B0(n659), .B1(gray_data7[0]), 
        .Y(n562) );
  OAI2BB1XL U633 ( .A0N(n640), .A1N(gray_data7[1]), .B0(n562), .Y(n563) );
  AOI222XL U634 ( .A0(n563), .A1(gray_data7[2]), .B0(n563), .B1(n656), .C0(
        gray_data7[2]), .C1(n656), .Y(n565) );
  OAI2BB1XL U635 ( .A0N(gray_data0[3]), .A1N(n565), .B0(gray_data7[3]), .Y(
        n564) );
  OAI21XL U636 ( .A0(gray_data0[3]), .A1(n565), .B0(n564), .Y(n566) );
  AOI222XL U637 ( .A0(gray_data7[4]), .A1(n657), .B0(gray_data7[4]), .B1(n566), 
        .C0(n657), .C1(n566), .Y(n568) );
  OAI2BB1XL U638 ( .A0N(gray_data0[5]), .A1N(n568), .B0(gray_data7[5]), .Y(
        n567) );
  OAI21XL U639 ( .A0(gray_data0[5]), .A1(n568), .B0(n567), .Y(n569) );
  AOI222XL U640 ( .A0(gray_data7[6]), .A1(n658), .B0(gray_data7[6]), .B1(n569), 
        .C0(n658), .C1(n569), .Y(n571) );
  OAI2BB1XL U641 ( .A0N(gray_data0[7]), .A1N(n571), .B0(gray_data7[7]), .Y(
        n570) );
  OAI21XL U642 ( .A0(gray_data0[7]), .A1(n571), .B0(n570), .Y(N406) );
  OAI22XL U643 ( .A0(gray_data6[1]), .A1(n640), .B0(n659), .B1(gray_data6[0]), 
        .Y(n572) );
  OAI2BB1XL U644 ( .A0N(n640), .A1N(gray_data6[1]), .B0(n572), .Y(n573) );
  AOI222XL U645 ( .A0(n573), .A1(gray_data6[2]), .B0(n573), .B1(n656), .C0(
        gray_data6[2]), .C1(n656), .Y(n575) );
  OAI2BB1XL U646 ( .A0N(gray_data0[3]), .A1N(n575), .B0(gray_data6[3]), .Y(
        n574) );
  OAI21XL U647 ( .A0(gray_data0[3]), .A1(n575), .B0(n574), .Y(n576) );
  AOI222XL U648 ( .A0(gray_data6[4]), .A1(n657), .B0(gray_data6[4]), .B1(n576), 
        .C0(n657), .C1(n576), .Y(n578) );
  OAI2BB1XL U649 ( .A0N(gray_data0[5]), .A1N(n578), .B0(gray_data6[5]), .Y(
        n577) );
  OAI21XL U650 ( .A0(gray_data0[5]), .A1(n578), .B0(n577), .Y(n579) );
  AOI222XL U651 ( .A0(gray_data6[6]), .A1(n658), .B0(gray_data6[6]), .B1(n579), 
        .C0(n658), .C1(n579), .Y(n581) );
  OAI2BB1XL U652 ( .A0N(gray_data0[7]), .A1N(n581), .B0(gray_data6[7]), .Y(
        n580) );
  OAI21XL U653 ( .A0(gray_data0[7]), .A1(n581), .B0(n580), .Y(N407) );
  OAI22XL U654 ( .A0(gray_data5[1]), .A1(n640), .B0(n659), .B1(gray_data5[0]), 
        .Y(n582) );
  OAI2BB1XL U655 ( .A0N(n640), .A1N(gray_data5[1]), .B0(n582), .Y(n583) );
  AOI222XL U656 ( .A0(n583), .A1(gray_data5[2]), .B0(n583), .B1(n656), .C0(
        gray_data5[2]), .C1(n656), .Y(n585) );
  OAI2BB1XL U657 ( .A0N(gray_data0[3]), .A1N(n585), .B0(gray_data5[3]), .Y(
        n584) );
  OAI21XL U658 ( .A0(gray_data0[3]), .A1(n585), .B0(n584), .Y(n586) );
  AOI222XL U659 ( .A0(gray_data5[4]), .A1(n657), .B0(gray_data5[4]), .B1(n586), 
        .C0(n657), .C1(n586), .Y(n588) );
  OAI2BB1XL U660 ( .A0N(gray_data0[5]), .A1N(n588), .B0(gray_data5[5]), .Y(
        n587) );
  OAI21XL U661 ( .A0(gray_data0[5]), .A1(n588), .B0(n587), .Y(n589) );
  AOI222XL U662 ( .A0(gray_data5[6]), .A1(n658), .B0(gray_data5[6]), .B1(n589), 
        .C0(n658), .C1(n589), .Y(n591) );
  OAI2BB1XL U663 ( .A0N(gray_data0[7]), .A1N(n591), .B0(gray_data5[7]), .Y(
        n590) );
  OAI21XL U664 ( .A0(gray_data0[7]), .A1(n591), .B0(n590), .Y(N408) );
  OAI22XL U665 ( .A0(gray_data4[1]), .A1(n640), .B0(n659), .B1(gray_data4[0]), 
        .Y(n592) );
  OAI2BB1XL U666 ( .A0N(n640), .A1N(gray_data4[1]), .B0(n592), .Y(n593) );
  AOI222XL U667 ( .A0(n593), .A1(gray_data4[2]), .B0(n593), .B1(n656), .C0(
        gray_data4[2]), .C1(n656), .Y(n595) );
  OAI2BB1XL U668 ( .A0N(gray_data0[3]), .A1N(n595), .B0(gray_data4[3]), .Y(
        n594) );
  OAI21XL U669 ( .A0(gray_data0[3]), .A1(n595), .B0(n594), .Y(n596) );
  AOI222XL U670 ( .A0(gray_data4[4]), .A1(n657), .B0(gray_data4[4]), .B1(n596), 
        .C0(n657), .C1(n596), .Y(n598) );
  OAI2BB1XL U671 ( .A0N(gray_data0[5]), .A1N(n598), .B0(gray_data4[5]), .Y(
        n597) );
  OAI21XL U672 ( .A0(gray_data0[5]), .A1(n598), .B0(n597), .Y(n599) );
  AOI222XL U673 ( .A0(gray_data4[6]), .A1(n658), .B0(gray_data4[6]), .B1(n599), 
        .C0(n658), .C1(n599), .Y(n601) );
  OAI2BB1XL U674 ( .A0N(gray_data0[7]), .A1N(n601), .B0(gray_data4[7]), .Y(
        n600) );
  OAI21XL U675 ( .A0(gray_data0[7]), .A1(n601), .B0(n600), .Y(N409) );
  OAI22XL U676 ( .A0(gray_data3[1]), .A1(n640), .B0(n659), .B1(gray_data3[0]), 
        .Y(n602) );
  OAI2BB1XL U677 ( .A0N(n640), .A1N(gray_data3[1]), .B0(n602), .Y(n603) );
  AOI222XL U678 ( .A0(n603), .A1(gray_data3[2]), .B0(n603), .B1(n656), .C0(
        gray_data3[2]), .C1(n656), .Y(n605) );
  OAI2BB1XL U679 ( .A0N(gray_data0[3]), .A1N(n605), .B0(gray_data3[3]), .Y(
        n604) );
  OAI21XL U680 ( .A0(gray_data0[3]), .A1(n605), .B0(n604), .Y(n606) );
  AOI222XL U681 ( .A0(gray_data3[4]), .A1(n657), .B0(gray_data3[4]), .B1(n606), 
        .C0(n657), .C1(n606), .Y(n608) );
  OAI2BB1XL U682 ( .A0N(gray_data0[5]), .A1N(n608), .B0(gray_data3[5]), .Y(
        n607) );
  OAI21XL U683 ( .A0(gray_data0[5]), .A1(n608), .B0(n607), .Y(n609) );
  AOI222XL U684 ( .A0(gray_data3[6]), .A1(n658), .B0(gray_data3[6]), .B1(n609), 
        .C0(n658), .C1(n609), .Y(n611) );
  OAI2BB1XL U685 ( .A0N(gray_data0[7]), .A1N(n611), .B0(gray_data3[7]), .Y(
        n610) );
  OAI21XL U686 ( .A0(gray_data0[7]), .A1(n611), .B0(n610), .Y(N410) );
  OAI22XL U687 ( .A0(gray_data2[1]), .A1(n640), .B0(n659), .B1(gray_data2[0]), 
        .Y(n612) );
  OAI2BB1XL U688 ( .A0N(n640), .A1N(gray_data2[1]), .B0(n612), .Y(n613) );
  AOI222XL U689 ( .A0(n613), .A1(gray_data2[2]), .B0(n613), .B1(n656), .C0(
        gray_data2[2]), .C1(n656), .Y(n615) );
  OAI2BB1XL U690 ( .A0N(gray_data0[3]), .A1N(n615), .B0(gray_data2[3]), .Y(
        n614) );
  OAI21XL U691 ( .A0(gray_data0[3]), .A1(n615), .B0(n614), .Y(n616) );
  AOI222XL U692 ( .A0(gray_data2[4]), .A1(n657), .B0(gray_data2[4]), .B1(n616), 
        .C0(n657), .C1(n616), .Y(n618) );
  OAI2BB1XL U693 ( .A0N(gray_data0[5]), .A1N(n618), .B0(gray_data2[5]), .Y(
        n617) );
  OAI21XL U694 ( .A0(gray_data0[5]), .A1(n618), .B0(n617), .Y(n619) );
  AOI222XL U695 ( .A0(gray_data2[6]), .A1(n658), .B0(gray_data2[6]), .B1(n619), 
        .C0(n658), .C1(n619), .Y(n621) );
  OAI2BB1XL U696 ( .A0N(gray_data0[7]), .A1N(n621), .B0(gray_data2[7]), .Y(
        n620) );
  OAI21XL U697 ( .A0(gray_data0[7]), .A1(n621), .B0(n620), .Y(N411) );
  OAI22XL U698 ( .A0(gray_data1[1]), .A1(n640), .B0(n659), .B1(gray_data1[0]), 
        .Y(n622) );
  OAI2BB1XL U699 ( .A0N(n640), .A1N(gray_data1[1]), .B0(n622), .Y(n623) );
  AOI222XL U700 ( .A0(n623), .A1(gray_data1[2]), .B0(n623), .B1(n656), .C0(
        gray_data1[2]), .C1(n656), .Y(n625) );
  OAI2BB1XL U701 ( .A0N(gray_data0[3]), .A1N(n625), .B0(gray_data1[3]), .Y(
        n624) );
  OAI21XL U702 ( .A0(gray_data0[3]), .A1(n625), .B0(n624), .Y(n626) );
  AOI222XL U703 ( .A0(gray_data1[4]), .A1(n657), .B0(gray_data1[4]), .B1(n626), 
        .C0(n657), .C1(n626), .Y(n628) );
  OAI2BB1XL U704 ( .A0N(gray_data0[5]), .A1N(n628), .B0(gray_data1[5]), .Y(
        n627) );
  OAI21XL U705 ( .A0(gray_data0[5]), .A1(n628), .B0(n627), .Y(n629) );
  AOI222XL U706 ( .A0(gray_data1[6]), .A1(n658), .B0(gray_data1[6]), .B1(n629), 
        .C0(n658), .C1(n629), .Y(n631) );
  OAI2BB1XL U707 ( .A0N(gray_data0[7]), .A1N(n631), .B0(gray_data1[7]), .Y(
        n630) );
  OAI21XL U708 ( .A0(gray_data0[7]), .A1(n631), .B0(n630), .Y(N412) );
endmodule

