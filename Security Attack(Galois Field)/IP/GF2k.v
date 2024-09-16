module GF2k#(parameter DEG = 5 ,parameter OP = 0) (POLY, IN1, IN2, RESULT);
input [DEG:0] POLY;
input [DEG-1:0] IN1;
input [DEG-1:0] IN2;
output [DEG-1:0] RESULT;
// ===============================================================
// wire/reg
// ===============================================================
generate
    case(OP)
        2 :
            GF2k_mult #(DEG) GF_mult(.POLY(POLY), .IN1(IN1), .IN2(IN2), .RESULT(RESULT));
        3 :
            GF2k_div #(DEG) GF_div(.POLY(POLY), .IN1(IN1), .IN2(IN2), .RESULT(RESULT));
        default :
            GF2k_add_sub #(DEG) GF_add(.IN1(IN1), .IN2(IN2), .RESULT(RESULT));
    endcase
endgenerate
endmodule

    // ===============================================================
    // GF2k_add
    // ===============================================================
    module GF2k_add_sub #(parameter DEG = 5) (IN1, IN2, RESULT);
input [DEG-1:0] IN1;
input [DEG-1:0] IN2;
output [DEG-1:0] RESULT;

genvar GF2k_add_i;
generate
    for (GF2k_add_i = 0 ; GF2k_add_i < DEG ; GF2k_add_i = GF2k_add_i + 1)
    begin : GF2k_add_loop
        assign RESULT[GF2k_add_i] = IN1[GF2k_add_i] ^ IN2[GF2k_add_i];
    end
endgenerate
endmodule

    module GF2k_mult #(parameter DEG = 5) ( POLY, IN1, IN2, RESULT);
input [DEG:0] POLY;
input [DEG-1:0] IN1;
input [DEG-1:0] IN2;
output reg [DEG-1:0] RESULT;
reg [DEG+3:0] mult_result_0;
reg [DEG+2:0] mult_result_1;
reg [DEG+1:0] mult_result_2;
reg [DEG+3:0] sum[DEG-1:0];
reg [DEG+3:0] TOTAL[DEG-2:0];
wire [DEG+3:0] POLY_w;
wire [DEG+3:0] POLY_1;
wire [DEG+3:0] POLY_2;
wire [DEG+3:0] POLY_3;
wire [DEG+5:0] IN1_1, IN2_1;
assign IN1_1 = IN1;
assign IN2_1 = IN2;
assign POLY_w = POLY;
assign POLY_1 = POLY << 1;
assign POLY_2 = POLY << 2;
assign POLY_3 = POLY << 3;
genvar GF2k_mult_IN1, GF2k_mult_IN2, i, j, k;
generate
    for(GF2k_mult_IN1 = 0 ; GF2k_mult_IN1 < DEG -1; GF2k_mult_IN1 = GF2k_mult_IN1 + 1)
    begin
        always @(*)
        begin
            sum[0][GF2k_mult_IN1] = IN1_1[GF2k_mult_IN1] && IN2_1[0];
        end
    end
    for(GF2k_mult_IN2 = 0 ; GF2k_mult_IN2 < DEG ; GF2k_mult_IN2 = GF2k_mult_IN2 + 1)
    begin
        always @(*)
        begin
            sum[GF2k_mult_IN2][DEG-1] = IN1_1[DEG-1 - GF2k_mult_IN2] && IN2_1[GF2k_mult_IN2];
            sum[GF2k_mult_IN2][DEG] = IN1_1[DEG-1 - GF2k_mult_IN2 + 1] && IN2_1[GF2k_mult_IN2];
            sum[GF2k_mult_IN2][DEG+1] = IN1_1[DEG-1 - GF2k_mult_IN2 + 2] && IN2_1[GF2k_mult_IN2];
            sum[GF2k_mult_IN2][DEG+2] = IN1_1[DEG-1 - GF2k_mult_IN2 + 3] && IN2_1[GF2k_mult_IN2];
            sum[GF2k_mult_IN2][DEG+3] = IN1_1[DEG-1 - GF2k_mult_IN2 + 4] && IN2_1[GF2k_mult_IN2];
        end
    end
    for(GF2k_mult_IN2 = 1 ; GF2k_mult_IN2 < DEG ; GF2k_mult_IN2 = GF2k_mult_IN2 + 1)
    begin :GF2k_mult_1
        for(GF2k_mult_IN1 = 0 ; GF2k_mult_IN1 < DEG-1 ; GF2k_mult_IN1 = GF2k_mult_IN1 + 1)
        begin:GF2k_mult_2
            always @(*)
            begin
                if(GF2k_mult_IN2 > GF2k_mult_IN1)
                    sum[GF2k_mult_IN2][GF2k_mult_IN1] = 1'b0;
                else
                    sum[GF2k_mult_IN2][GF2k_mult_IN1] = IN1_1[GF2k_mult_IN1 - GF2k_mult_IN2] && IN2_1[GF2k_mult_IN2];
            end
        end
    end
    for(j=2;j<DEG;j=j+1)
    begin : TOTAL_result
        for(k=0;k<DEG + 4;k=k+1)
        begin:total_bit
            always @(*)
            begin
                TOTAL[j-1][k] = sum[j][k] ^ TOTAL[j-2][k];
            end
        end
    end

    for(i=0;i<DEG + 4;i=i+1)
    begin : result_mult_1
        always @(*)
        begin
            TOTAL[0][i] = sum[0][i] ^ sum[1][i];
            mult_result_0[i] = ((TOTAL[DEG-2][i]^POLY_3[i])&TOTAL[DEG-2][DEG+3]) || ((TOTAL[DEG-2][i]^POLY_2[i])&!TOTAL[DEG-2][DEG+3]&TOTAL[DEG-2][DEG+2]) || ((TOTAL[DEG-2][i]^POLY_1[i])&!TOTAL[DEG-2][DEG+3]&!TOTAL[DEG-2][DEG+2]&TOTAL[DEG-2][DEG+1]) ||
                         ((TOTAL[DEG-2][i]^POLY_w[i])&!TOTAL[DEG-2][DEG+3]&!TOTAL[DEG-2][DEG+2]&!TOTAL[DEG-2][DEG+1]&TOTAL[DEG-2][DEG])|| (TOTAL[DEG-2][i]&!TOTAL[DEG-2][DEG+3]&!TOTAL[DEG-2][DEG+2]&!TOTAL[DEG-2][DEG+1]&!TOTAL[DEG-2][DEG]);
        end
    end

    for(i=0;i<DEG + 3;i=i+1)
    begin : result_mult_2
        always @(*)
        begin
            mult_result_1[i] = ((mult_result_0[i]^POLY_2[i])&mult_result_0[DEG+2]) || ((mult_result_0[i]^POLY_1[i])&!mult_result_0[DEG+2]&mult_result_0[DEG+1]) || ((mult_result_0[i]^POLY_w[i])&!mult_result_0[DEG+2]&!mult_result_0[DEG+1]&mult_result_0[DEG]) || ((mult_result_0[i])&!mult_result_0[DEG+2]&!mult_result_0[DEG+1]&!mult_result_0[DEG]);
        end
    end


    for(i=0;i<DEG + 2;i=i+1)
    begin : result_mult_3
        always @(*)
        begin
            mult_result_2[i] = ((POLY_1[i]^mult_result_1[i])&mult_result_1[DEG+1]) || ((POLY_w[i]^mult_result_1[i])&!mult_result_1[DEG+1]&mult_result_1[DEG]) ||  (mult_result_1[i]&!mult_result_1[DEG+1]&!mult_result_1[DEG]);
        end
    end

    for(i=0;i<DEG;i=i+1)
    begin : result
        always @(*)
        begin
            RESULT[i] = (mult_result_2[DEG] && POLY_w[i]^mult_result_2[i]) || (!mult_result_2[DEG] && mult_result_2[i]);
        end
    end

endgenerate

endmodule

    module GF2k_div #(parameter DEG = 2) ( POLY, IN1, IN2, RESULT);
input [DEG:0] POLY;
input [DEG-1:0] IN1;
input [DEG-1:0] IN2;
output wire [DEG-1:0] RESULT;
reg [DEG:0] DN[DEG+3:0];
reg [DEG-1:0] DR[DEG+3:0];
reg [DEG:0] DN_div[DEG+3:0][DEG:0];
reg [DEG:0] DR_div[DEG+3:0][DEG-1:0];
reg [DEG:0] DN_check[DEG+3:0];
reg [DEG:0] DR_check[DEG+3:0];
wire [DEG:0] Q[DEG+3:0];
// wire [DEG:0] Q_result[DEG+3:0];
reg [DEG-1:0] R[DEG+3:0];
reg [DEG:0] mqh[DEG+3:0], mql[DEG+3:0];
reg [DEG:0] MQ[DEG+3:0];
wire [DEG:0] mult_result_1[DEG+3:0];
wire [DEG:0] mult_result_2[DEG+3:0];
wire [DEG:0] a, b;
reg [DEG:0] result_2[DEG+3:0];
reg [DEG:0] result_3;
wire [DEG+2:0] check;
wire [DEG+2:0] checkR;

assign a = 1;
assign b = 0;

always @(*)
begin
    DN[0] = POLY;
    DR[0] = IN2;
    mqh[0] = b;
    mql[0] = a;
    result_2[0] = b;
end
always @(*)
begin
    DN_div[0][0] = a;
    DN_check[0][0] = DN[0][DEG];
    DR_div[0][0] = a + a;
    DR_check[0][0] = DR[0][DEG-1];
    R[0][0] = mult_result_1[0][0] ^ DN[0][0];
    MQ[0][0] = mqh[0][0] ^ mult_result_2[0][0];
end
genvar div_i, div_k, div_ii;
generate
    for(div_ii = 1; div_ii < DEG + 4; div_ii = div_ii + 1)
    begin
        assign check[div_ii-1] = (R[div_ii-1] > DR[div_ii-1])? 1'b1 : 1'b0;
        assign checkR[div_ii-1] = (R[div_ii-1]==a)? 1'b1 : 1'b0;
        always @(*)
        begin
            DN[div_ii] = {1'b0,R[div_ii-1]}&{DEG+1{check[div_ii-1]}} | {1'b0,DR[div_ii-1]}&{DEG+1{!check[div_ii-1]}};
        end
        always @(*)
        begin
            DR[div_ii] = DR[div_ii-1]&{DEG{check[div_ii-1]}} | R[div_ii-1]&{DEG{!check[div_ii-1]}};
        end
        always @(*)
        begin
            mqh[div_ii] = MQ[div_ii-1]&{DEG+1{check[div_ii-1]}} | mql[div_ii-1]&{DEG+1{!check[div_ii-1]}};
        end
        always @(*)
        begin
            mql[div_ii] = mql[div_ii-1]&{DEG+1{check[div_ii-1]}} | MQ[div_ii-1]&{DEG+1{!check[div_ii-1]}};

        end
        always @(*)
        begin
            result_2[div_ii] = (MQ[div_ii-1]&{DEG+1{checkR[div_ii-1]}}) | (result_2[div_ii-1]&{DEG+1{!checkR[div_ii-1]}}) ;
        end

        always @(*)
        begin
            DN_div[div_ii][0] = a;
            DN_check[div_ii][0] = DN[div_ii][DEG];
            DR_div[div_ii][0] = a + a;
            DR_check[div_ii][0] = DR[div_ii][DEG-1];
            R[div_ii][0] = mult_result_1[div_ii][0] ^ DN[div_ii][0];
            MQ[div_ii][0] = mqh[div_ii][0] ^ mult_result_2[div_ii][0];
        end
    end
    for(div_i = 0; div_i < DEG + 4; div_i = div_i + 1)
    begin

        for(div_k=1;div_k<DEG+1;div_k=div_k+1)
        begin
            always @(*)
            begin
                DN_div[div_i][div_k] = DN_div[div_i][div_k - 1] + ({DEG+1{!DN_check[div_i][div_k - 1]}} & a);
                DN_check[div_i][div_k] = DN_check[div_i][div_k - 1] || DN[div_i][DEG-div_k];
            end

            always @(*)
            begin
                DR_div[div_i][div_k] = DR_div[div_i][div_k - 1] + ({DEG+1{!DR_check[div_i][div_k - 1]}} & a);
                DR_check[div_i][div_k] = DR_check[div_i][div_k - 1] || DR[div_i][DEG- 1 - div_k];
            end

            always @(*)
            begin
                R[div_i][div_k] = mult_result_1[div_i][div_k] ^ DN[div_i][div_k];
                MQ[div_i][div_k] = mqh[div_i][div_k] ^ mult_result_2[div_i][div_k];
            end
        end
        always @(*)
        begin
            result_3[div_i] = (result_2[DEG+3][DEG] && POLY[div_i]^result_2[DEG+3][div_i]) || (!result_2[DEG+3][DEG] &&result_2[DEG+3][div_i]);
        end

        assign Q[div_i] = DR_div[div_i][DEG-1] - DN_div[div_i][DEG];
        assign mult_result_1[div_i] = DR[div_i] << Q[div_i];
        assign mult_result_2[div_i] = mql[div_i] << Q[div_i];
    end
endgenerate

GF2k_div_mult #(DEG) GF_div_mult_solution(.POLY(POLY), .IN1({1'b0,IN1}), .IN2(result_3), .RESULT(RESULT));
endmodule

    module GF2k_div_mult #(parameter DEG = 5) ( POLY, IN1, IN2, RESULT);
input [DEG:0] POLY;
input [DEG:0] IN1;
input [DEG:0] IN2;
output reg [DEG-1:0] RESULT;
reg [DEG+3:0] mult_result_0;
reg [DEG+2:0] mult_result_1;
reg [DEG+1:0] mult_result_2;
reg [DEG+3:0] sum[DEG:0];
reg [DEG+3:0] TOTAL[DEG-1:0];
wire [DEG+3:0] POLY_w;
wire [DEG+3:0] POLY_1;
wire [DEG+3:0] POLY_2;
wire [DEG+3:0] POLY_3;
wire [DEG+5:0] IN1_1;
wire [DEG+5:0] IN2_1;
assign IN1_1 = IN1;
assign IN2_1 = IN2;
assign POLY_w = POLY;
assign POLY_1 = POLY << 1;
assign POLY_2 = POLY << 2;
assign POLY_3 = POLY << 3;

genvar GF2k_mult_IN1, GF2k_mult_IN2, i, j, k;
generate
    for(GF2k_mult_IN1 = 0 ; GF2k_mult_IN1 < DEG  ; GF2k_mult_IN1 = GF2k_mult_IN1 + 1)
    begin
        always @(*)
        begin
            sum[0][GF2k_mult_IN1] = IN1_1[GF2k_mult_IN1] && IN2_1[0];
        end
    end
    for(GF2k_mult_IN2 = 0 ; GF2k_mult_IN2 < DEG + 1; GF2k_mult_IN2 = GF2k_mult_IN2 + 1)
    begin
        always @(*)
        begin
            sum[GF2k_mult_IN2][DEG] = IN1_1[DEG - GF2k_mult_IN2 ] && IN2_1[GF2k_mult_IN2];
            sum[GF2k_mult_IN2][DEG+1] = IN1_1[DEG - GF2k_mult_IN2 + 1] && IN2_1[GF2k_mult_IN2];
            sum[GF2k_mult_IN2][DEG+2] = IN1_1[DEG - GF2k_mult_IN2 + 2] && IN2_1[GF2k_mult_IN2];
            sum[GF2k_mult_IN2][DEG+3] = IN1_1[DEG - GF2k_mult_IN2 + 3] && IN2_1[GF2k_mult_IN2];
        end
    end
    for(GF2k_mult_IN2 = 1 ; GF2k_mult_IN2 < DEG + 1 ; GF2k_mult_IN2 = GF2k_mult_IN2 + 1)
    begin :GF2k_mult_1
        for(GF2k_mult_IN1 = 0 ; GF2k_mult_IN1 < DEG ; GF2k_mult_IN1 = GF2k_mult_IN1 + 1)
        begin:GF2k_mult_2
            always @(*)
            begin
                if(GF2k_mult_IN2 > GF2k_mult_IN1)
                    sum[GF2k_mult_IN2][GF2k_mult_IN1] = 1'b0;
                else
                    sum[GF2k_mult_IN2][GF2k_mult_IN1] = IN1_1[GF2k_mult_IN1 - GF2k_mult_IN2] && IN2_1[GF2k_mult_IN2];
            end
        end
    end
    for(j=2;j<DEG+1;j=j+1)
    begin : TOTAL_result
        for(k=0;k<DEG + 4;k=k+1)
        begin:total_bit
            always @(*)
            begin
                TOTAL[j-1][k] = sum[j][k] ^ TOTAL[j-2][k];
            end
        end
    end
    for(i=0;i<DEG + 4;i=i+1)
    begin : result_mult_1
        always @(*)
        begin
            TOTAL[0][i] = sum[0][i] ^ sum[1][i];
            mult_result_0[i] = ((TOTAL[DEG-1][i]^POLY_3[i])&TOTAL[DEG-1][DEG+3]) || ((TOTAL[DEG-1][i]^POLY_2[i])&!TOTAL[DEG-1][DEG+3]&TOTAL[DEG-1][DEG+2]) || ((TOTAL[DEG-1][i]^POLY_1[i])&!TOTAL[DEG-1][DEG+3]&!TOTAL[DEG-1][DEG+2]&TOTAL[DEG-1][DEG+1]) ||
                         ((TOTAL[DEG-1][i]^POLY_w[i])&!TOTAL[DEG-1][DEG+3]&!TOTAL[DEG-1][DEG+2]&!TOTAL[DEG-1][DEG+1]&TOTAL[DEG-1][DEG])|| (TOTAL[DEG-1][i]&!TOTAL[DEG-1][DEG+3]&!TOTAL[DEG-1][DEG+2]&!TOTAL[DEG-1][DEG+1]&!TOTAL[DEG-1][DEG]);
        end
    end

    for(i=0;i<DEG + 3;i=i+1)
    begin : result_mult_2
        always @(*)
        begin
            mult_result_1[i] = ((mult_result_0[i]^POLY_2[i])&mult_result_0[DEG+2]) || ((mult_result_0[i]^POLY_1[i])&!mult_result_0[DEG+2]&mult_result_0[DEG+1]) || ((mult_result_0[i]^POLY_w[i])&!mult_result_0[DEG+2]&!mult_result_0[DEG+1]&mult_result_0[DEG]) || ((mult_result_0[i])&!mult_result_0[DEG+2]&!mult_result_0[DEG+1]&!mult_result_0[DEG]);
        end
    end

    for(i=0;i<DEG + 2;i=i+1)
    begin : result_mult_3
        always @(*)
        begin
            mult_result_2[i] = ((POLY_1[i]^mult_result_1[i])&mult_result_1[DEG+1]) || ((POLY_w[i]^mult_result_1[i])&!mult_result_1[DEG+1]&mult_result_1[DEG]) ||  (mult_result_1[i]&!mult_result_1[DEG+1]&!mult_result_1[DEG]);
        end
    end

    for(i=0;i<DEG;i=i+1)
    begin : result
        always @(*)
        begin
            RESULT[i] = (mult_result_2[DEG] && POLY_w[i]^mult_result_2[i]) || (!mult_result_2[DEG] && mult_result_2[i]);
        end
    end

endgenerate

endmodule
