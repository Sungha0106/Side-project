module CC(opt, in_n0, in_n1, in_n2, in_n3, in_n4, out_n);
//================================================================
//   INPUT AND OUTPUT DECLARATION
//================================================================
input [3:0] in_n0, in_n1, in_n2, in_n3, in_n4;
input [2:0] opt;
output wire signed [9:0] out_n;
//================================================================
//    Wire & Registers
//================================================================
wire [3:0] layer_a0, layer_a1, layer_a2, layer_a3, layer_a4, layer_a5, layer_a6, layer_a7;
wire [3:0] layer_b0, layer_b1, layer_b2, layer_b3, layer_b4, layer_b5;
wire [3:0] layer_c0, layer_c1, layer_c2, layer_c3;
wire [3:0] layer_d0, layer_d1;
wire [4:0] normalize;
wire  [4:0] average;
wire signed [4:0] one, two, three, four, five;
wire signed [4:0] mult_0a, mult_0b, mult_1a, mult_1b;
wire signed [9:0] mult_0, mult_1;
wire signed [4:0] n0, n1, n2, n3, n4;
wire signed [9:0] compare_a, compare_b;
wire signed [9:0] eq_1, eq_2;
wire compare1, compare2, compare3, compare4, compare5, compare6, compare7, compare8, compare9, compare10;
wire [3:0] result;
//================================================================
//    SORT
//================================================================
//    layer_a
assign compare1 = (in_n1 > in_n0)? 1'b1 : 1'b0;
assign layer_a0 = (compare1)? in_n0 : in_n1;
assign layer_a1 = (compare1)? in_n1 : in_n0;
assign compare2 = (in_n2 > layer_a1)? 1'b1 : 1'b0;
assign layer_a2 = (compare2)? layer_a1 : in_n2;
assign layer_a3 = (compare2)? in_n2 : layer_a1;
assign compare3 = (in_n3 > layer_a3)? 1'b1 : 1'b0;
assign layer_a4 = (compare3)? layer_a3 : in_n3;
assign layer_a5 = (compare3)? in_n3 : layer_a3;
assign compare4 = (in_n4 > layer_a5)? 1'b1 : 1'b0;
assign layer_a6 = (compare4)? layer_a5 : in_n4;
assign layer_a7 = (compare4)? in_n4 : layer_a5; //最大

//    layer_b
assign compare5 = (layer_a2 > layer_a0)? 1'b1 : 1'b0;
assign layer_b0 = (compare5)? layer_a0 : layer_a2;
assign layer_b1 = (compare5)? layer_a2 : layer_a0;
assign compare6 = (layer_a4 > layer_b1)? 1'b1 : 1'b0;
assign layer_b2 = (compare6)? layer_b1 : layer_a4;
assign layer_b3 = (compare6)? layer_a4 : layer_b1;
assign compare7 = (layer_a6 > layer_b3)? 1'b1 : 1'b0;
assign layer_b4 = (compare7)? layer_b3 : layer_a6;
assign layer_b5 = (compare7)? layer_a6 : layer_b3; //第二大

//    layer_c
assign compare8 = (layer_b2 > layer_b0)? 1'b1 : 1'b0;
assign layer_c0 = (compare8)? layer_b0 : layer_b2;
assign layer_c1 = (compare8)? layer_b2 : layer_b0;
assign compare9 = (layer_b4 > layer_c1)? 1'b1 : 1'b0;
assign layer_c2 = (compare9)? layer_c1 : layer_b4;
assign layer_c3 = (compare9)? layer_b4 : layer_c1; //第三大

//    layer_d
assign compare10 = (layer_c2 > layer_c0)? 1'b1 : 1'b0;
assign layer_d0 = (compare10)? layer_c0 : layer_c2; //最小
assign layer_d1 = (compare10)? layer_c2 : layer_c0; //第二小

assign {n0, n1, n2, n3, n4} = (opt[1])? {one, two, three, four, five} : {five, four, three, two, one};
//================================================================
//    AVERAGE
//================================================================
assign average = (one + two + three + four + five) / 5;

//================================================================
//    NORMALIZATION
//================================================================
assign normalize = (layer_d0 + layer_a7) >> 1;
assign result = { normalize[3] && opt[0], normalize[2] && opt[0], normalize[1] && opt[0], normalize[0] && opt[0]};
assign one = layer_a7 - result;
assign two = layer_b5 - result;
assign three = layer_c3 - result;
assign four = layer_d1 - result;
assign five = layer_d0 - result;

//================================================================
//    CALCULATION
//================================================================
//    mult_0
assign mult_0a = (opt[2])? n3 : n1;
assign mult_0b = (opt[2])? 5'd3 : n2;
assign mult_0 = mult_0a*mult_0b;

//    mult_1
assign mult_1a = (opt[2])? n0 : average;
assign mult_1b = (opt[2])? n4 : n3;
assign mult_1 = mult_1a*mult_1b;

//    eq1
assign compare_a = (mult_0 > mult_1)? mult_0 : mult_1;
assign compare_b = (mult_0 > mult_1)? mult_1 : mult_0;
assign eq_1 = compare_a - compare_b;

//    eq2
assign eq_2 = (n0 + mult_0 + mult_1)/3;

//================================================================
//    OUT
//================================================================
assign out_n = (opt[2])? eq_1 : eq_2;

endmodule
