module HD( code_word1, code_word2, out_n);
input[6:0] code_word1;
input[6:0] code_word2;
output signed[5:0] out_n;
//============================================================================
reg signed [5:0] c1_correct, c2_correct;
wire x1_wrong_1, x2_wrong_1, x3_wrong_1, x4_wrong_1;
wire x1_wrong_2, x2_wrong_2, x3_wrong_2, x4_wrong_2;
wire x2_2_wrong1, x3_2_wrong1, x4_2_wrong1;
wire x2_2_wrong2, x3_2_wrong2, x4_2_wrong2;
wire a, b, c, d, e, f;
reg [1:0]opt;
wire signed [5:0] c1_wire, c2_wire;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//WRONG_DETECT_1
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//x1_wrong_1
assign x1_wrong_1 = !x2_wrong_1 && !x3_wrong_1 && !x4_wrong_1;

//x2_wrong_1
assign x2_wrong_1 = !(code_word1[4]^code_word1[3]^code_word1[1]^code_word1[0]); //(p3^x1^x3^x4)
assign x2_2_wrong1 = x3_wrong_1 && x4_wrong_1;
assign a = !x3_wrong_1 && !x4_wrong_1;

//x3_wrong_1
assign x3_wrong_1 = !(code_word1[5]^code_word1[3]^code_word1[2]^code_word1[0]); //(p2^x1^x2^x4)
assign x3_2_wrong1 = x2_wrong_1 && x4_wrong_1;
assign b = !x2_wrong_1 && !x4_wrong_1;
//x4_wrong_1
assign x4_wrong_1 = !(code_word1[6]^code_word1[3]^code_word1[2]^code_word1[1]); //(p1^x1^x2^x3)
assign x4_2_wrong1 = x2_wrong_1 && x3_wrong_1;
assign c = !x2_wrong_1 && !x4_wrong_1;

//c1_correct
always @(*)
begin
    if(x1_wrong_1)
        c1_correct = {!code_word1[3], !code_word1[3], !code_word1[3], code_word1[2], code_word1[1], code_word1[0]}; //x1
    else if(x2_2_wrong1 || x3_2_wrong1 || x4_2_wrong1)
        c1_correct = {code_word1[3], code_word1[3], code_word1[3], code_word1[2], code_word1[1], code_word1[0]}; //p1 || p2 || p3
    else if(a)
        c1_correct = {code_word1[3], code_word1[3], code_word1[3], !code_word1[2], code_word1[1], code_word1[0]}; //x2
    else if(b)
        c1_correct = {code_word1[3], code_word1[3], code_word1[3], code_word1[2], !code_word1[1], code_word1[0]}; //x2
    else
        c1_correct = {code_word1[3], code_word1[3], code_word1[3], code_word1[2], code_word1[1], !code_word1[0]}; //x2
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//WRONG_DETECT_2
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//x1_wrong_2
assign x1_wrong_2 = !x2_wrong_2 && !x3_wrong_2 && !x4_wrong_2;

//x2_wrong_1=2
assign x2_wrong_2 = !(code_word2[4]^code_word2[3]^code_word2[1]^code_word2[0]); //(p3^x1^x3^x4)
assign x2_2_wrong2 = x3_wrong_2 && x4_wrong_2;
assign d = !x3_wrong_2 && !x4_wrong_2;

//x3_wrong_2
assign x3_wrong_2 = !(code_word2[5]^code_word2[3]^code_word2[2]^code_word2[0]); //(p2^x1^x2^x4)
assign x3_2_wrong2 = x2_wrong_2 && x4_wrong_2;
assign e = !x2_wrong_2 && !x4_wrong_2;
//x4_wrong_2
assign x4_wrong_2 = !(code_word2[6]^code_word2[3]^code_word2[2]^code_word2[1]); //(p1^x1^x2^x3)
assign x4_2_wrong2 = x2_wrong_2 && x3_wrong_2;
assign f = !x3_wrong_2 && !x4_wrong_2;

//c_correct
always @(*)
begin
    if(x1_wrong_2)
        c2_correct = {!code_word2[3], !code_word2[3], !code_word2[3], code_word2[2], code_word2[1], code_word2[0]}; //x1
    else if(x2_2_wrong2 || x3_2_wrong2 || x4_2_wrong2)
        c2_correct = {code_word2[3], code_word2[3], code_word2[3], code_word2[2], code_word2[1], code_word2[0]}; //p1 || p2 || p3
    else if(d)
        c2_correct = {code_word2[3], code_word2[3], code_word2[3], !code_word2[2], code_word2[1], code_word2[0]}; //x2
    else if(e)
        c2_correct = {code_word2[3], code_word2[3], code_word2[3], code_word2[2], !code_word2[1], code_word2[0]}; //x2
    else
        c2_correct = {code_word2[3], code_word2[3], code_word2[3], code_word2[2], code_word2[1], !code_word2[0]}; //x2
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//opt
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//opt[1]
always @(*)
begin
    if(x1_wrong_1)
        opt[1] = code_word1[3]; //x1
    else if(x2_2_wrong1)
        opt[1] = code_word1[4]; //p3
    else if(x3_2_wrong1)
        opt[1] = code_word1[5]; //p2
    else if(x4_2_wrong1)
        opt[1] = code_word1[6]; //p1
    else if(a)
        opt[1] = code_word1[2]; //x2
    else if(b)
        opt[1] = code_word1[1]; //x3
    else
        opt[1] = code_word1[0]; //x4
end

//opt[0]
always @(*)
begin
    if(x1_wrong_2)
        opt[0] = code_word2[3]; //x1
    else if(x2_2_wrong2)
        opt[0] = code_word2[4]; //p3
    else if(x3_2_wrong2)
        opt[0] = code_word2[5]; //p2
    else if(x4_2_wrong2)
        opt[0] = code_word2[6]; //p1
    else if(d)
        opt[0] = code_word2[2]; //x2
    else if(e)
        opt[0] = code_word2[1]; //x3
    else
        opt[0] = code_word2[0]; //x4
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//out_n
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//c1_wire
assign c1_wire = (!opt[1])? c1_correct << 1 : c1_correct;

//c2_wire
assign c2_wire = (!opt[1])? c2_correct : c2_correct << 1;

//out_n
assign out_n = (opt[1] ^ opt[0])? c1_wire - c2_wire : c1_wire + c2_wire;

endmodule
