`include "/home/lab911_1/Desktop/7112064132/NTHU/Digit_classification/sim/sram_model/sram_36x192b.v"
`include "/home/lab911_1/Desktop/7112064132/NTHU/Digit_classification/sim/sram_model/sram_640x72b.v"
`include "/home/lab911_1/Desktop/7112064132/NTHU/Digit_classification/sim/sram_model/sram_64x8b.v"
module Convnet_top #(
           parameter CH_NUM = 4,
           parameter ACT_PER_ADDR = 4,
           parameter BW_PER_ACT = 12,
           parameter WEIGHT_PER_ADDR = 9,
           parameter BIAS_PER_ADDR = 1,
           parameter BW_PER_PARAM = 8
       )
       ( clk, rst_n, enable, busy, valid, input_data,
         sram_rdata_a0, sram_rdata_a1, sram_rdata_a2, sram_rdata_a3,
         sram_rdata_b0, sram_rdata_b1, sram_rdata_b2, sram_rdata_b3,
         sram_rdata_weight, sram_rdata_bias,
         sram_raddr_a0, sram_raddr_a1, sram_raddr_a2, sram_raddr_a3,
         sram_raddr_b0, sram_raddr_b1, sram_raddr_b2, sram_raddr_b3,
         sram_raddr_weight, sram_raddr_bias,
         sram_wen_a0, sram_wen_a1, sram_wen_a2, sram_wen_a3,
         sram_wen_b0, sram_wen_b1, sram_wen_b2, sram_wen_b3,
         sram_wordmask_a, sram_wordmask_b, sram_waddr_a, sram_waddr_b, sram_wdata_a, sram_wdata_b);
input clk;
input rst_n; //(active low)
input enable; // start sending image from testbanch
output reg busy; // control signal for stopping loading input image
output reg valid; // output valid for testbench to check answers in corresponding SRAM groups
input [BW_PER_ACT - 1:0] input_data; // input image data
// read data from SRAM group A
input [CH_NUM * ACT_PER_ADDR * BW_PER_ACT - 1:0] sram_rdata_a0, sram_rdata_a1, sram_rdata_a2, sram_rdata_a3;
// read data from SRAM group B
input [CH_NUM * ACT_PER_ADDR * BW_PER_ACT - 1:0] sram_rdata_b0, sram_rdata_b1, sram_rdata_b2, sram_rdata_b3;
// read data from parameter SRAM
input [WEIGHT_PER_ADDR * BW_PER_PARAM - 1:0] sram_rdata_weight;
input [BIAS_PER_ADDR * BW_PER_PARAM - 1:0] sram_rdata_bias;
// read address to SRAM group A
output reg [5:0] sram_raddr_a0, sram_raddr_a1, sram_raddr_a2, sram_raddr_a3;
// read address to SRAM group B
output reg [5:0] sram_raddr_b0, sram_raddr_b1, sram_raddr_b2, sram_raddr_b3;
// read address to parameter SRAM
output reg [9:0] sram_raddr_weight;
output reg [5:0] sram_raddr_bias;
// write enable for SRAM groups A & B
output reg sram_wen_a0 , sram_wen_a1, sram_wen_a2, sram_wen_a3, sram_wen_b0, sram_wen_b1, sram_wen_b2, sram_wen_b3;
// word mask for SRAM groups A & B
output reg [CH_NUM * ACT_PER_ADDR - 1:0] sram_wordmask_a, sram_wordmask_b;
// write addrress to SRAM groups A & B
output reg [5:0] sram_waddr_a, sram_waddr_b;
// write data to SRAM groups A & B
output reg [CH_NUM * ACT_PER_ADDR * BW_PER_ACT - 1:0] sram_wdata_a, sram_wdata_b;
// ===============================================================
//       wire/reg/parameter
// ===============================================================
reg [2:0] state, next_state;
parameter [2:0] IDLE = 3'b000, UNSHUFFLE = 3'b001, CONV_1 = 3'b010, CONV_2 = 3'b011, CONV_3 = 3'b100, POOLING = 3'b101, DONE = 3'b110;
//      KERNEL && BIAS && REG
reg signed [19:0] output_reg[0:2][0:11][0:11];
reg signed [191:0] a0_reg, a1_reg, a2_reg, a3_reg;
reg signed [7:0] KERNEL[0:8];
reg signed [7:0] BIAS;
wire [1:0] mask_detect;
//      UNSHUFFLE
wire [15:0] UNSHUFFLE_mask;
reg [5:0] row_28_detect;
wire ch_change_flag;
reg [1:0] bank_horiz_flag, bank_verti_flag;
reg bank_change_flag;
reg start;
reg [5:0] UNSHUFFLE_sram_waddr_a;
//      CONV_1
reg [9:0] sram_raddr_weight_CONV_1;
reg [5:0] sram_raddr_bias_CONV_1;
reg [3:0] CONV_1_bank_verti_change;
reg [3:0] CONV_1_bank_horiz_change;
reg [3:0] CONV_1_bank_verti_store;
reg [3:0] CONV_1_bank_horiz_store;
reg [1:0] CONV_1_buffer_flag;
wire [15:0] CONV_1_mask;
wire [3:0] CONV_1_region_detect;
reg signed [7:0] KERNEL_CONV_1[0:8];
reg signed [11:0] CONV_1_Multiplicand[0:8];
reg signed [11:0] CONV_1_bank_0_ch_choose[0:3];
reg signed [11:0] CONV_1_bank_1_ch_choose[0:3];
reg signed [11:0] CONV_1_bank_2_ch_choose[0:3];
reg signed [11:0] CONV_1_bank_3_ch_choose[0:3];
reg signed [19:0] CONV_1_mult [0:8];
wire signed [19:0] CONV_1_add;
wire signed [19:0] CONV_1_result;
wire signed [19:0] CONV_1_add_bias;
wire signed [12:0] CONV_1_quantization;
wire signed [11:0] CONV_1_RELU;
reg [5:0] CONV_1_Store_Count;
reg [6:0] sram_raddr_a0_CONV_1, sram_raddr_a1_CONV_1, sram_raddr_a2_CONV_1, sram_raddr_a3_CONV_1;
reg [6:0] sram_waddr_b_CONV_1;
reg CONV_1_DONE;
reg signed [7:0] CONV_1_BIAS;

//      CONV_2
reg [6:0] sram_raddr_b0_CONV_2, sram_raddr_b1_CONV_2, sram_raddr_b2_CONV_2, sram_raddr_b3_CONV_2;
reg [9:0] sram_raddr_weight_CONV_2;
reg [5:0] sram_raddr_bias_CONV_2;
reg [6:0] sram_waddr_a_CONV_2;
reg signed [7:0] KERNEL_CONV_2[0:8];
reg signed [7:0] CONV_2_BIAS;
reg CONV_2_DONE;

//      CONV_3
reg [6:0] sram_raddr_a0_CONV_3, sram_raddr_a1_CONV_3, sram_raddr_a2_CONV_3, sram_raddr_a3_CONV_3;
reg [9:0] sram_raddr_weight_CONV_3;
reg [5:0] sram_raddr_bias_CONV_3;
wire [6:0] sram_waddr_b_CONV_3;
reg signed [7:0] KERNEL_CONV_3[0:8];
reg signed [7:0] CONV_3_BIAS;
reg signed [19:0] CONV_3_output_reg[0:1][0:7][0:7];
wire signed [19:0] CONV_3_result;
wire signed [19:0] CONV_3_add_bias;
wire signed [19:0] CONV_3_RELU;

//      POOLING
wire signed [19:0] POOLING_add;
wire signed [19:0] POOLING_average;
wire signed [12:0] POOLING_quantization;
wire signed [11:0] POOLING_result;
wire [3:0] POOLING_horiz_pointer, POOLING_verti_pointer;
reg POOLING_DONE;
integer i, j, k;

// ===============================================================
//       FSM
// ===============================================================
//     next_state
always @(*)
begin
    case(state)
        IDLE :
        begin
            if(enable)
                next_state = UNSHUFFLE;
            else
                next_state = IDLE;
        end

        UNSHUFFLE :
        begin
            if(sram_waddr_a == 6'd21 && row_28_detect == 6'd55 && bank_verti_flag[0])
                next_state = CONV_1;
            else
                next_state = UNSHUFFLE;
        end

        CONV_1 :
        begin
            if(CONV_1_DONE)
                next_state = CONV_2;
            else
                next_state = CONV_1;
        end

        CONV_2 :
        begin
            if(CONV_2_DONE)
                next_state = CONV_3;
            else
                next_state = CONV_2;
        end

        CONV_3 :
        begin
            if(CONV_1_bank_horiz_store == 4'd7 && CONV_1_bank_verti_store == 4'd7 && CONV_1_Store_Count == 6'd11)
                next_state = POOLING;
            else
                next_state = CONV_3;
        end

        POOLING :
        begin
            if(POOLING_DONE)
            begin
                if(sram_raddr_bias == 6'd63)
                    next_state = DONE;
                else
                    next_state = CONV_3;
            end
            else
                next_state = POOLING;
        end

        DONE :
            next_state = DONE;

        default :
            next_state = state;
    endcase
end

//     state
always @(posedge clk)
begin
    if(!rst_n)
        state <= IDLE;
    else
        state <= next_state;
end

// ===============================================================
//       Signal
// ===============================================================
//      busy
always @(posedge clk)
begin
    if(!rst_n)
        busy <= 1'b1;
    else if(state == IDLE)
        busy <= 1'b0;
    else if(state == UNSHUFFLE && sram_waddr_a == 6'd21 && row_28_detect == 6'd55 && bank_verti_flag[0])
        busy <= 1'b1;
    else if(state == DONE)
        busy <= 1'b0;
end

//    valid
always @(posedge clk)
begin
    if(!rst_n)
        valid <= 1'b0;
    else if(state == DONE)
        valid <= 1'b1;
end

//      sram_wordmask_a
always @(posedge clk)
begin
    if(!rst_n)
        sram_wordmask_a <= 16'b1111111111111111;
    else if(state == UNSHUFFLE)
        sram_wordmask_a <= UNSHUFFLE_mask;
    else if(state == CONV_2 && CONV_1_Store_Count[1:0] == 2'd3)
        sram_wordmask_a <= CONV_1_mask;
end

//      sram_wordmask_b
always @(posedge clk)
begin
    if(!rst_n)
        sram_wordmask_b <= 16'b0111111111111111;
    else if(state == CONV_1 && CONV_1_Store_Count[1:0] == 2'd3)
        sram_wordmask_b <= CONV_1_mask;
    else if(state == POOLING)
        sram_wordmask_b <= CONV_1_mask;
end

//      sram_wdata_a
always @(posedge clk)
begin
    if(!rst_n)
        sram_wdata_a <= 192'd0;
    else if(state == UNSHUFFLE)
        sram_wdata_a <= {16{input_data}};
    else if(state == CONV_2)
        sram_wdata_a <= {16{CONV_1_RELU}};
end

//      sram_wdata_b
always @(posedge clk)
begin
    if(!rst_n)
        sram_wdata_b <= 192'd0;
    else if(state == CONV_1)
        sram_wdata_b <= {16{CONV_1_RELU}};
    else if(state == POOLING)
        sram_wdata_b <= {16{POOLING_result}};
end

//      sram_waddr_a
always @(posedge clk)
begin
    if(!rst_n)
        sram_waddr_a <= 6'd0;
    else
    begin
        case(state)
            UNSHUFFLE :
                sram_waddr_a <= (start)? UNSHUFFLE_sram_waddr_a : sram_waddr_a;
            CONV_1 :
                sram_waddr_a <= 6'd0;
            CONV_2 :
            begin
                if(CONV_1_Store_Count[1:0] == 2'd3)
                    sram_waddr_a <= sram_waddr_a_CONV_2;
                else if(CONV_1_buffer_flag == 2'd3)
                begin
                    case(CONV_1_Store_Count[5:4])
                        2'd1 :
                            sram_waddr_a <= 6'd0;
                        2'd2 :
                            sram_waddr_a <= 6'd3;
                        2'd3 :
                            sram_waddr_a <= 6'd18;
                    endcase
                end
            end
        endcase
    end
end

//      sram_waddr_b
always @(posedge clk)
begin
    if(!rst_n)
        sram_waddr_b <= 6'd0;
    else if(state == CONV_1)
    begin
        if(CONV_1_Store_Count[1:0] == 2'd3)
            sram_waddr_b <= sram_waddr_b_CONV_1;
        else
            sram_waddr_b <= 6'd0;
    end
    else if(state == POOLING)
        sram_waddr_b <= sram_waddr_b_CONV_3[5:2];
end

//      sram_wen_a
always @(posedge clk)
begin
    if(!rst_n)
        sram_wen_a0 <= 1'b1;
    else if(state == UNSHUFFLE)
        sram_wen_a0 <= (!bank_verti_flag[1] && !bank_change_flag)? 1'b0 : 1'b1;
    else if(state == CONV_2)
        sram_wen_a0 <= (CONV_1_Store_Count[1:0] == 2'd3 && !CONV_1_bank_verti_store[1] && !CONV_1_bank_horiz_store[1]) ? 1'b0 : 1'b1;
end

always @(posedge clk)
begin
    if(!rst_n)
        sram_wen_a1 <= 1'b1;
    else if(state == UNSHUFFLE)
        sram_wen_a1 <= (!bank_verti_flag[1] && bank_change_flag)? 1'b0 : 1'b1;
    else if(state == CONV_2)
        sram_wen_a1 <= (CONV_1_Store_Count[1:0] == 2'd3 && !CONV_1_bank_verti_store[1] && CONV_1_bank_horiz_store[1]) ? 1'b0 : 1'b1;
end

always @(posedge clk)
begin
    if(!rst_n)
        sram_wen_a2 <= 1'b1;
    else if(state == UNSHUFFLE)
        sram_wen_a2 <= (bank_verti_flag[1] && !bank_change_flag)? 1'b0 : 1'b1;
    else if(state == CONV_2)
        sram_wen_a2 <= (CONV_1_Store_Count[1:0] == 2'd3 && CONV_1_bank_verti_store[1] && !CONV_1_bank_horiz_store[1]) ? 1'b0 : 1'b1;
end

always @(posedge clk)
begin
    if(!rst_n)
        sram_wen_a3 <= 1'b1;
    else if(state == UNSHUFFLE)
        sram_wen_a3 <= (bank_verti_flag[1] && bank_change_flag)? 1'b0 : 1'b1;
    else if(state == CONV_2)
        sram_wen_a3 <= (CONV_1_Store_Count[1:0] == 2'd3 && CONV_1_bank_verti_store[1] && CONV_1_bank_horiz_store[1]) ? 1'b0 : 1'b1;
end

//      sram_wen_b
always @(posedge clk)
begin
    if(!rst_n)
        sram_wen_b0 <= 1'b1;
    else if(state == CONV_1)
        sram_wen_b0 <= (CONV_1_Store_Count[1:0] == 2'd3 && !CONV_1_bank_verti_store[1] && !CONV_1_bank_horiz_store[1]) ? 1'b0 : 1'b1;
    else if(state == POOLING)
sram_wen_b0 <= (!CONV_1_bank_verti_store[1] && !CONV_1_bank_horiz_store[1]) ?(POOLING_DONE)? 1'b1 : 1'b0 : 1'b1;
end

always @(posedge clk)
begin
    if(!rst_n)
        sram_wen_b1 <= 1'b1;
    else if(state == CONV_1)
        sram_wen_b1 <= (CONV_1_Store_Count[1:0] == 2'd3 && !CONV_1_bank_verti_store[1] && CONV_1_bank_horiz_store[1]) ? 1'b0 : 1'b1;
    else if(state == POOLING)
        sram_wen_b1 <= (!CONV_1_bank_verti_store[1] && CONV_1_bank_horiz_store[1]) ? 1'b0 : 1'b1;
end

always @(posedge clk)
begin
    if(!rst_n)
        sram_wen_b2 <= 1'b1;
    else if(state == CONV_1)
        sram_wen_b2 <= (CONV_1_Store_Count[1:0] == 2'd3 && CONV_1_bank_verti_store[1] && !CONV_1_bank_horiz_store[1]) ? 1'b0 : 1'b1;
    else if(state == POOLING)
        sram_wen_b2 <= (CONV_1_bank_verti_store[1] && !CONV_1_bank_horiz_store[1]) ? 1'b0 : 1'b1;
end

always @(posedge clk)
begin
    if(!rst_n)
        sram_wen_b3 <= 1'b1;
    else if(state == CONV_1)
        sram_wen_b3 <= (CONV_1_Store_Count[1:0] == 2'd3 && CONV_1_bank_verti_store[1] && CONV_1_bank_horiz_store[1]) ? 1'b0 : 1'b1;
    else if(state == POOLING)
        sram_wen_b3 <= (CONV_1_bank_verti_store[1] && CONV_1_bank_horiz_store[1]) ? 1'b0 : 1'b1;
end

//      sram_raddr_weight
always @(posedge clk)
begin
    if(!rst_n)
        sram_raddr_weight <= 10'd0;
    else if(state == CONV_1)
        sram_raddr_weight <= sram_raddr_weight_CONV_1;
    else if(state == CONV_2)
        sram_raddr_weight <= sram_raddr_weight_CONV_2;
    else if(state == CONV_3)
        sram_raddr_weight <= sram_raddr_weight_CONV_3;
end

//      sram_raddr_bias
always @(posedge clk)
begin
    if(!rst_n)
        sram_raddr_bias <= 6'd0;
    else if(state == CONV_1)
        sram_raddr_bias <= sram_raddr_bias_CONV_1;
    else if(state == CONV_2)
        sram_raddr_bias <= sram_raddr_bias_CONV_2;
    else if(state == POOLING)
        sram_raddr_bias <= sram_raddr_bias_CONV_3;
end

//      sram_raddr_a0
always @(posedge clk)
begin
    if(!rst_n)
        sram_raddr_a0 <= 6'd0;
    else if(state == CONV_1)
    begin
        if(CONV_1_DONE)
            sram_raddr_a0 <= 6'd0;
        else
            sram_raddr_a0 <= sram_raddr_a0_CONV_1;
    end
    else if(state == CONV_3)
        sram_raddr_a0 <= sram_raddr_a0_CONV_3;
    else if(state == POOLING)
        sram_raddr_a0 <= 6'd0;
end

//      sram_raddr_a1
always @(posedge clk)
begin
    if(!rst_n)
        sram_raddr_a1 <= 6'd0;
    else if(state == CONV_1)
    begin
        if(CONV_1_DONE)
            sram_raddr_a1 <= 6'd0;
        else
            sram_raddr_a1 <= sram_raddr_a1_CONV_1;
    end
    else if(state == CONV_3)
        sram_raddr_a1 <= sram_raddr_a1_CONV_3;
    else if(state == POOLING)
        sram_raddr_a1 <= 6'd0;
end

//      sram_raddr_a2
always @(posedge clk)
begin
    if(!rst_n)
        sram_raddr_a2 <= 6'd0;
    else if(state == CONV_1)
    begin
        if(CONV_1_DONE)
            sram_raddr_a2 <= 6'd0;
        else
            sram_raddr_a2 <= sram_raddr_a2_CONV_1;
    end
    else if(state == CONV_3)
        sram_raddr_a2 <= sram_raddr_a2_CONV_3;
    else if(state == POOLING)
        sram_raddr_a2 <= 6'd0;
end

//      sram_raddr_a3
always @(posedge clk)
begin
    if(!rst_n)
        sram_raddr_a3 <= 6'd0;
    else if(state == CONV_1)
    begin
        if(CONV_1_DONE)
            sram_raddr_a3 <= 6'd0;
        else
            sram_raddr_a3 <= sram_raddr_a3_CONV_1;
    end
    else if(state == CONV_3)
        sram_raddr_a3 <= sram_raddr_a3_CONV_3;
    else if(state == POOLING)
        sram_raddr_a3 <= 6'd0;
end

//      sram_raddr_b0
always @(posedge clk)
begin
    if(!rst_n)
        sram_raddr_b0 <= 6'd0;
    else if(state == CONV_2)
        sram_raddr_b0 <= sram_raddr_b0_CONV_2;
end

//      sram_raddr_b1
always @(posedge clk)
begin
    if(!rst_n)
        sram_raddr_b1 <= 6'd0;
    else if(state == CONV_2)
        sram_raddr_b1 <= sram_raddr_b1_CONV_2;
end

//      sram_raddr_b2
always @(posedge clk)
begin
    if(!rst_n)
        sram_raddr_b2 <= 6'd0;
    else if(state == CONV_2)
        sram_raddr_b2 <= sram_raddr_b2_CONV_2;
end

//      sram_raddr_b3
always @(posedge clk)
begin
    if(!rst_n)
        sram_raddr_b3 <= 6'd0;
    else if(state == CONV_2)
        sram_raddr_b3 <= sram_raddr_b3_CONV_2;
end
// ===============================================================
//       KERNEL && BIAS && REG
// ===============================================================
//      a0_reg
always @(posedge clk)
begin
    if(!rst_n)
        a0_reg <= 192'd0;
    else if(state == CONV_1)
        a0_reg <= sram_rdata_a0;
    else if(state == CONV_2)
        a0_reg <= sram_rdata_b0;
    else if(state == CONV_3)
        a0_reg <= sram_rdata_a0;
end

//      a1_reg
always @(posedge clk)
begin
    if(!rst_n)
        a1_reg <= 192'd0;
    else if(state == CONV_1)
        a1_reg <= sram_rdata_a1;
    else if(state == CONV_2)
        a1_reg <= sram_rdata_b1;
    else if(state == CONV_3)
        a1_reg <= sram_rdata_a1;
end

//      a2_reg
always @(posedge clk)
begin
    if(!rst_n)
        a2_reg <= 192'd0;
    else if(state == CONV_1)
        a2_reg <= sram_rdata_a2;
    else if(state == CONV_2)
        a2_reg <= sram_rdata_b2;
    else if(state == CONV_3)
        a2_reg <= sram_rdata_a2;
end

//      a3_reg
always @(posedge clk)
begin
    if(!rst_n)
        a3_reg <= 192'd0;
    else if(state == CONV_1)
        a3_reg <= sram_rdata_a3;
    else if(state == CONV_2)
        a3_reg <= sram_rdata_b3;
    else if(state == CONV_3)
        a3_reg <= sram_rdata_a3;
end

//      output_reg
always @(posedge clk)
begin
    if(!rst_n)
    begin
        for(i=0;i<3;i=i+1)
        begin
            for(j=0;j<12;j=j+1)
            begin
                for(k=0;k<12;k=k+1)
                begin
                    output_reg[i][j][k] <= 12'd0;
                end
            end
        end
    end
    else if(state == CONV_1)
    begin
        if(CONV_1_bank_horiz_store == 4'd11 && CONV_1_bank_verti_store == 4'd11 && CONV_1_Store_Count[1:0] == 2'd3)
        begin
            for(i=0;i<3;i=i+1)
            begin
                for(j=0;j<12;j=j+1)
                begin
                    for(k=0;k<12;k=k+1)
                    begin
                        output_reg[i][j][k] <= 12'd0;
                    end
                end
            end
        end
        else
            output_reg[CONV_1_Store_Count[1:0]][CONV_1_bank_verti_store][CONV_1_bank_horiz_store] <= CONV_1_add;
    end
    else if(state == CONV_2)
    begin
        if(CONV_1_bank_horiz_store == 4'd9 && CONV_1_bank_verti_store == 4'd9 && CONV_1_Store_Count[1:0] == 2'd3)
        begin
            for(i=0;i<3;i=i+1)
            begin
                for(j=0;j<12;j=j+1)
                begin
                    for(k=0;k<12;k=k+1)
                    begin
                        output_reg[i][j][k] <= 12'd0;
                    end
                end
            end
        end
        else
            output_reg[CONV_1_Store_Count[1:0]][CONV_1_bank_verti_store][CONV_1_bank_horiz_store] <= CONV_1_add;
    end
    else if(state == CONV_3)
    begin
        if(CONV_1_bank_horiz_store == 4'd7 && CONV_1_bank_verti_store == 4'd7 && CONV_1_Store_Count[1:0] == 2'd3)
        begin
            for(i=0;i<3;i=i+1)
            begin
                for(j=0;j<12;j=j+1)
                begin
                    for(k=0;k<12;k=k+1)
                    begin
                        output_reg[i][j][k] <= 12'd0;
                    end
                end
            end
        end
        else
            output_reg[CONV_1_Store_Count[1:0]][CONV_1_bank_verti_store][CONV_1_bank_horiz_store] <= CONV_1_add;
    end
end

//      KERNEL
always @(posedge clk)
begin
    if(!rst_n)
    begin
        for(i=0;i<9;i=i+1)
        begin
            KERNEL[i] <= 8'd0;
        end
    end
    else if(state == UNSHUFFLE)
    begin
        for(i=0;i<9;i=i+1)
        begin
            KERNEL[i] <= sram_rdata_weight[71-(i<<3) -:8];
        end
    end
    else if(state == CONV_1)
    begin
        for(i=0;i<9;i=i+1)
        begin
            KERNEL[i] <= KERNEL_CONV_1[i];
        end
    end
    else if(state == CONV_2)
    begin
        for(i=0;i<9;i=i+1)
        begin
            KERNEL[i] <= KERNEL_CONV_2[i];
        end
    end
    else if(state == CONV_3)
    begin
        for(i=0;i<9;i=i+1)
        begin
            KERNEL[i] <= KERNEL_CONV_3[i];
        end
    end
end

//      BIAS
always @(posedge clk)
begin
    if(!rst_n)
        BIAS <= 8'd0;
    else if(state == CONV_1)
        BIAS <= CONV_1_BIAS;
    else if(state == CONV_2)
        BIAS <= CONV_2_BIAS;
    else if(state == CONV_3)
        BIAS <= CONV_3_BIAS;
end

// ===============================================================
//       UNSHUFFLE
// ===============================================================
//      start
always @(posedge clk)
begin
    if(!rst_n)
        start <= 1'b0;
    else if(state == UNSHUFFLE)
        start <= 1'b1;
end

//      UNSHUFFLE_sram_waddr_a
always @(*)
begin
    if(bank_horiz_flag == 2'd0)
    begin
        if(row_28_detect == 6'd28)
            UNSHUFFLE_sram_waddr_a = sram_waddr_a - 6'd3;
        else if(row_28_detect == 6'd0)
        begin
            if(bank_verti_flag !== 2'd0)
                UNSHUFFLE_sram_waddr_a= sram_waddr_a - 6'd3;
            else
            begin
                if(sram_waddr_a == 6'd21)
                    UNSHUFFLE_sram_waddr_a = 6'd0;
                else if(bank_verti_flag == 2'd0)
                    UNSHUFFLE_sram_waddr_a = sram_waddr_a + 6'd3;
                else
                    UNSHUFFLE_sram_waddr_a = sram_waddr_a;
            end
        end
        else if(!bank_change_flag)
            UNSHUFFLE_sram_waddr_a = sram_waddr_a + 6'd1;
        else
            UNSHUFFLE_sram_waddr_a = sram_waddr_a;
    end
    else
        UNSHUFFLE_sram_waddr_a = sram_waddr_a;
end

//    row_28_detect
always @(posedge clk)
begin
    if(!rst_n)
        row_28_detect <= 6'd0;
    else if(state == UNSHUFFLE)
    begin
        if(row_28_detect == 6'd55)
            row_28_detect <= 6'd0;
        else
            row_28_detect <= row_28_detect + 6'd1;
    end
end

//      ch_change_flag
assign ch_change_flag = (row_28_detect > 6'd27)? 1'b1 : 1'b0;

//      bank_verti_flag
always @(posedge clk)
begin
    if(!rst_n)
        bank_verti_flag <= 2'b0;
    else if(state == UNSHUFFLE)
    begin
        if(row_28_detect == 6'd55)
            bank_verti_flag <= bank_verti_flag + 2'b1;
        else
            bank_verti_flag <= bank_verti_flag;
    end
end

//      bank_horiz_flag
always @(posedge clk)
begin
    if(!rst_n)
        bank_horiz_flag <= 2'b0;
    else if(state == UNSHUFFLE)
        bank_horiz_flag <= bank_horiz_flag + 2'b1;
end

//      bank_change_flag
always @(posedge clk)
begin
    if(!rst_n)
        bank_change_flag <= 1'b0;
    else if(state == UNSHUFFLE)
    begin
        if(bank_horiz_flag == 2'd3 && !(row_28_detect == 6'd27) && !(row_28_detect == 6'd55))
            bank_change_flag <= bank_change_flag + 1'b1;
        else
            bank_change_flag <= bank_change_flag;
    end
end

assign UNSHUFFLE_mask =  ~ { bank_horiz_flag == 2'd0 && !bank_verti_flag[0] && !ch_change_flag,                                                                                         //ch0[191:180]     ch1[131:120] or ch3[11:0]
                             bank_horiz_flag == 2'd2 && !bank_verti_flag[0] && !ch_change_flag,                                                                                         //ch0[179:168]     ch1[143:132]
                             bank_horiz_flag == 2'd0 &&  bank_verti_flag[0] && !ch_change_flag,                                                                                         //ch0[167:156]     ch1[107:96]  or ch3[35:24]
                             bank_horiz_flag == 2'd2 &&  bank_verti_flag[0] && !ch_change_flag,                                                                                         //ch0[155:144]     ch1[119:108]
                             bank_horiz_flag == 2'd1 && !bank_verti_flag[0] && !ch_change_flag,                                                                                         //ch1[143:132]     ch0[191:180]
                             bank_horiz_flag == 2'd3 && !bank_verti_flag[0] && !ch_change_flag,                                                                                         //ch1[131:120]     ch0[179:168]
                             bank_horiz_flag == 2'd1 &&  bank_verti_flag[0] && !ch_change_flag,                                                                                         //ch1[119:108]     ch0[167:156]
                             bank_horiz_flag == 2'd3 &&  bank_verti_flag[0] && !ch_change_flag,                                                                                         //ch1[107:96]      ch0[179:168]
                             bank_horiz_flag == 2'd0 && !bank_verti_flag[0] && ch_change_flag,                                                                                          //ch2[95:84]       ch3[35:24]   or ch1[131:120]
                             bank_horiz_flag == 2'd2 && !bank_verti_flag[0] && ch_change_flag,                                                                                          //ch2[83:72]       ch3[47:36]
                             bank_horiz_flag == 2'd0 &&  bank_verti_flag[0] && ch_change_flag,                                                                                          //ch2[71:60]       ch3[11:0]    or ch1[107:96]
                             bank_horiz_flag == 2'd2 &&  bank_verti_flag[0] && ch_change_flag,                                                                                          //ch2[59:48]       ch3[23:12]
                             bank_horiz_flag == 2'd1 && !bank_verti_flag[0] && ch_change_flag,                                                                                          //ch3[47:36]       ch2[95:84]
                             bank_horiz_flag == 2'd3 && !bank_verti_flag[0] && ch_change_flag,                                                                                          //ch3[35:24]       ch2[83:72]
                             bank_horiz_flag == 2'd1 &&  bank_verti_flag[0] && ch_change_flag,                                                                                          //ch3[23:12]       ch2[71:60]
                             bank_horiz_flag == 2'd3 &&  bank_verti_flag[0] && ch_change_flag                                                                                           //ch3[11:0]        ch2[59:48]
                           };

// ===============================================================
//       CONV_1
// ===============================================================
//      CONV_1_bank_verti_change
always @(posedge clk)
begin
    if(!rst_n)
        CONV_1_bank_verti_change <= 4'd0;
    else if(state == CONV_1)
    begin
        if(CONV_1_DONE)
            CONV_1_bank_verti_change <= 4'd0;
        else if(CONV_1_bank_horiz_change == 4'd11)
        begin
            if(CONV_1_bank_verti_change == 4'd11)
                CONV_1_bank_verti_change <= 4'd0;
            else
                CONV_1_bank_verti_change <= CONV_1_bank_verti_change + 4'd1;
        end
        else
            CONV_1_bank_verti_change <= CONV_1_bank_verti_change;
    end
    else if(state == CONV_2)
    begin
        if(CONV_2_DONE)
            CONV_1_bank_verti_change <= 4'd0;
        else if(CONV_1_bank_horiz_change == 4'd9)
        begin
            if(CONV_1_bank_verti_change == 4'd9)
                CONV_1_bank_verti_change <= 4'd0;
            else
                CONV_1_bank_verti_change <= CONV_1_bank_verti_change + 4'd1;
        end
        else
            CONV_1_bank_verti_change <= CONV_1_bank_verti_change;
    end
    else if(state == CONV_3)
    begin
        if(CONV_1_bank_horiz_change == 4'd7)
        begin
            if(CONV_1_bank_verti_change == 4'd7)
                CONV_1_bank_verti_change <= 4'd0;
            else
                CONV_1_bank_verti_change <= CONV_1_bank_verti_change + 4'd1;
        end
        else
            CONV_1_bank_verti_change <= CONV_1_bank_verti_change;
    end
    else if(state == POOLING)
        CONV_1_bank_verti_change <= 4'd0;
end

//      CONV_1_bank_horiz_change
always @(posedge clk)
begin
    if(!rst_n)
        CONV_1_bank_horiz_change <= 4'd0;
    else if(state == CONV_1)
    begin
        if(CONV_1_DONE)
            CONV_1_bank_horiz_change <= 4'd0;
        else if(CONV_1_bank_horiz_change == 4'd11)
            CONV_1_bank_horiz_change <= 4'd0;
        else
            CONV_1_bank_horiz_change <= CONV_1_bank_horiz_change + 4'd1;
    end
    else if(state == CONV_2)
    begin
        if(CONV_2_DONE)
            CONV_1_bank_horiz_change <= 4'd0;
        else if(CONV_1_bank_horiz_change == 4'd9)
            CONV_1_bank_horiz_change <= 4'd0;
        else
            CONV_1_bank_horiz_change <= CONV_1_bank_horiz_change + 4'd1;
    end
    else if(state == CONV_3)
    begin
        if(CONV_1_bank_horiz_change == 4'd7)
            CONV_1_bank_horiz_change <= 4'd0;
        else
            CONV_1_bank_horiz_change <= CONV_1_bank_horiz_change + 4'd1;
    end
    else if(state == POOLING)
        CONV_1_bank_horiz_change <= 4'd0;
end

//      CONV_1_bank_verti_store
always @(posedge clk)
begin
    if(!rst_n)
        CONV_1_bank_verti_store <= 4'd0;
    else if(state == CONV_1 && CONV_1_buffer_flag == 2'd2)
    begin
        if(CONV_1_bank_horiz_store == 4'd11)
        begin
            if(CONV_1_bank_verti_store == 4'd11)
                CONV_1_bank_verti_store <= 4'd0;
            else
                CONV_1_bank_verti_store <= CONV_1_bank_verti_store + 4'd1;
        end
        else
            CONV_1_bank_verti_store <= CONV_1_bank_verti_store;
    end
    else if(state == CONV_2 && CONV_1_buffer_flag >= 2'd2)
    begin
        if(CONV_1_bank_horiz_store == 4'd9)
        begin
            if(CONV_1_bank_verti_store == 4'd9)
                CONV_1_bank_verti_store <= 4'd0;
            else
                CONV_1_bank_verti_store <= CONV_1_bank_verti_store + 4'd1;
        end
        else
            CONV_1_bank_verti_store <= CONV_1_bank_verti_store;
    end
    else if(state == CONV_3 && CONV_1_buffer_flag >= 2'd2)
    begin
        if(CONV_1_bank_horiz_store == 4'd7)
        begin
            if(CONV_1_bank_verti_store == 4'd7)
                CONV_1_bank_verti_store <= 4'd0;
            else
                CONV_1_bank_verti_store <= CONV_1_bank_verti_store + 4'd1;
        end
        else
            CONV_1_bank_verti_store <= CONV_1_bank_verti_store;
    end
    else if(state == POOLING || POOLING_DONE)
    begin
        if(CONV_1_bank_horiz_store == 4'd3)
        begin
            if(CONV_1_bank_verti_store == 4'd3)
                CONV_1_bank_verti_store <= 4'd0;
            else
                CONV_1_bank_verti_store <= CONV_1_bank_verti_store + 4'd1;
        end
        else
            CONV_1_bank_verti_store <= CONV_1_bank_verti_store;
    end
end

//      CONV_1_bank_horiz_store
always @(posedge clk)
begin
    if(!rst_n)
        CONV_1_bank_horiz_store <= 4'd0;
    else if(state == CONV_1 && CONV_1_buffer_flag == 2'd2)
    begin
        if(CONV_1_DONE)
            CONV_1_bank_horiz_store <= 4'd0;
        else if(CONV_1_bank_horiz_store == 4'd11)
            CONV_1_bank_horiz_store <= 4'd0;
        else
            CONV_1_bank_horiz_store <= CONV_1_bank_horiz_store + 4'd1;
    end
    else if(state == CONV_2 && CONV_1_buffer_flag >= 2'd2)
    begin
        if(CONV_2_DONE)
            CONV_1_bank_horiz_store <= 4'd0;
        else if(CONV_1_bank_horiz_store == 4'd9)
            CONV_1_bank_horiz_store <= 4'd0;
        else
            CONV_1_bank_horiz_store <= CONV_1_bank_horiz_store + 4'd1;
    end
    else if(state == CONV_3 && CONV_1_buffer_flag >= 2'd2)
    begin
        if(CONV_1_bank_horiz_store == 4'd7)
            CONV_1_bank_horiz_store <= 4'd0;
        else
            CONV_1_bank_horiz_store <= CONV_1_bank_horiz_store + 4'd1;
    end
    else if(state == POOLING)
    begin
        if(CONV_1_bank_horiz_store == 4'd3 || POOLING_DONE)
            CONV_1_bank_horiz_store <= 4'd0;
        else
            CONV_1_bank_horiz_store <= CONV_1_bank_horiz_store + 4'd1;
    end
end

//      sram_raddr_weight_CONV_1
always @(*)
begin
    if(CONV_1_bank_horiz_change == 4'd9 && CONV_1_bank_verti_change == 4'd11)
        sram_raddr_weight_CONV_1 = sram_raddr_weight + 10'd1;
    else
        sram_raddr_weight_CONV_1 = sram_raddr_weight;
end

//      sram_raddr_bias_CONV_1
always @(*)
begin
    if(CONV_1_bank_horiz_change == 4'd11 && CONV_1_bank_verti_change == 4'd11 && (&(CONV_1_Store_Count[1:0])))
        sram_raddr_bias_CONV_1 = sram_raddr_bias + 6'd1;
    else
        sram_raddr_bias_CONV_1 = sram_raddr_bias;
end

//      CONV_1_buffer_flag
always @(posedge clk)
begin
    if(!rst_n)
        CONV_1_buffer_flag <= 2'd0;
    else if(state == CONV_1)
    begin
        if(CONV_1_DONE)
            CONV_1_buffer_flag <= 2'd0;
        else if(CONV_1_buffer_flag == 2'd2)
            CONV_1_buffer_flag <= CONV_1_buffer_flag;
        else
            CONV_1_buffer_flag <= CONV_1_buffer_flag + 2'd1;
    end
    else if(state == CONV_2)
    begin
        if(CONV_2_DONE)
            CONV_1_buffer_flag <= 2'd0;
        else if(CONV_1_buffer_flag == 2'd3)
            CONV_1_buffer_flag <= CONV_1_buffer_flag;
        else
            CONV_1_buffer_flag <= CONV_1_buffer_flag + 2'd1;
    end
    else if(state == CONV_3)
    begin
        if(CONV_1_bank_horiz_store == 4'd7 && CONV_1_bank_verti_store == 4'd7 && CONV_1_Store_Count == 6'd11)
            CONV_1_buffer_flag <= 2'd0;
        else if(CONV_1_buffer_flag == 2'd3)
            CONV_1_buffer_flag <= CONV_1_buffer_flag;
        else
            CONV_1_buffer_flag <= CONV_1_buffer_flag + 2'd1;
    end

end

//      KERNEL_CONV_1
always @(*)
begin
    if(CONV_1_bank_horiz_store == 4'd11 && CONV_1_bank_verti_store == 4'd11)
    begin
        for(i=0;i<9;i=i+1)
        begin
            KERNEL_CONV_1[i] = sram_rdata_weight[71-(i<<3)-:8];
        end
    end
    else
    begin
        for(i=0;i<9;i=i+1)
        begin
            KERNEL_CONV_1[i] = KERNEL[i];
        end
    end
end


//      CONV_1_BIAS
always @(*)
begin
    if(CONV_1_bank_horiz_store == 4'd0 && CONV_1_bank_verti_store == 4'd0 && CONV_1_Store_Count == 4'd0)
        CONV_1_BIAS = sram_rdata_bias;
    else if(CONV_1_bank_horiz_store == 4'd11 && CONV_1_bank_verti_store == 4'd11 && CONV_1_Store_Count[1:0] == 2'd3)
        CONV_1_BIAS = sram_rdata_bias;
    else
        CONV_1_BIAS = BIAS;
end

//      CONV_1_bank_0_ch_choose[0:3]
always @(*)
begin
    case(CONV_1_Store_Count[1:0])
        2'd0 :
        begin
            CONV_1_bank_0_ch_choose[0] = a0_reg[191:180];
            CONV_1_bank_0_ch_choose[1] = a0_reg[179:168];
            CONV_1_bank_0_ch_choose[2] = a0_reg[167:156];
            CONV_1_bank_0_ch_choose[3] = a0_reg[155:144];
        end
        2'd1 :
        begin
            CONV_1_bank_0_ch_choose[0] = a0_reg[143:132];
            CONV_1_bank_0_ch_choose[1] = a0_reg[131:120];
            CONV_1_bank_0_ch_choose[2] = a0_reg[119:108];
            CONV_1_bank_0_ch_choose[3] = a0_reg[107:96];
        end
        2'd2 :
        begin
            CONV_1_bank_0_ch_choose[0] = a0_reg[95:84];
            CONV_1_bank_0_ch_choose[1] = a0_reg[83:72];
            CONV_1_bank_0_ch_choose[2] = a0_reg[71:60];
            CONV_1_bank_0_ch_choose[3] = a0_reg[59:48];
        end
        2'd3 :
        begin
            CONV_1_bank_0_ch_choose[0] = a0_reg[47:36];
            CONV_1_bank_0_ch_choose[1] = a0_reg[35:24];
            CONV_1_bank_0_ch_choose[2] = a0_reg[23:12];
            CONV_1_bank_0_ch_choose[3] = a0_reg[11:0];
        end
    endcase
end

//      CONV_1_bank_1_ch_choose[0:3]
always @(*)
begin
    case(CONV_1_Store_Count[1:0])
        2'd0 :
        begin
            CONV_1_bank_1_ch_choose[0] = a1_reg[191:180];
            CONV_1_bank_1_ch_choose[1] = a1_reg[179:168];
            CONV_1_bank_1_ch_choose[2] = a1_reg[167:156];
            CONV_1_bank_1_ch_choose[3] = a1_reg[155:144];
        end
        2'd1 :
        begin
            CONV_1_bank_1_ch_choose[0] = a1_reg[143:132];
            CONV_1_bank_1_ch_choose[1] = a1_reg[131:120];
            CONV_1_bank_1_ch_choose[2] = a1_reg[119:108];
            CONV_1_bank_1_ch_choose[3] = a1_reg[107:96];
        end
        2'd2 :
        begin
            CONV_1_bank_1_ch_choose[0] = a1_reg[95:84];
            CONV_1_bank_1_ch_choose[1] = a1_reg[83:72];
            CONV_1_bank_1_ch_choose[2] = a1_reg[71:60];
            CONV_1_bank_1_ch_choose[3] = a1_reg[59:48];
        end
        2'd3 :
        begin
            CONV_1_bank_1_ch_choose[0] = a1_reg[47:36];
            CONV_1_bank_1_ch_choose[1] = a1_reg[35:24];
            CONV_1_bank_1_ch_choose[2] = a1_reg[23:12];
            CONV_1_bank_1_ch_choose[3] = a1_reg[11:0];
        end
    endcase
end

//      CONV_1_bank_2_ch_choose[0:3]
always @(*)
begin
    case(CONV_1_Store_Count[1:0])
        2'd0 :
        begin
            CONV_1_bank_2_ch_choose[0] = a2_reg[191:180];
            CONV_1_bank_2_ch_choose[1] = a2_reg[179:168];
            CONV_1_bank_2_ch_choose[2] = a2_reg[167:156];
            CONV_1_bank_2_ch_choose[3] = a2_reg[155:144];
        end
        2'd1 :
        begin
            CONV_1_bank_2_ch_choose[0] = a2_reg[143:132];
            CONV_1_bank_2_ch_choose[1] = a2_reg[131:120];
            CONV_1_bank_2_ch_choose[2] = a2_reg[119:108];
            CONV_1_bank_2_ch_choose[3] = a2_reg[107:96];
        end
        2'd2 :
        begin
            CONV_1_bank_2_ch_choose[0] = a2_reg[95:84];
            CONV_1_bank_2_ch_choose[1] = a2_reg[83:72];
            CONV_1_bank_2_ch_choose[2] = a2_reg[71:60];
            CONV_1_bank_2_ch_choose[3] = a2_reg[59:48];
        end
        2'd3 :
        begin
            CONV_1_bank_2_ch_choose[0] = a2_reg[47:36];
            CONV_1_bank_2_ch_choose[1] = a2_reg[35:24];
            CONV_1_bank_2_ch_choose[2] = a2_reg[23:12];
            CONV_1_bank_2_ch_choose[3] = a2_reg[11:0];
        end
    endcase
end

//      CONV_1_bank_3_ch_choose[0:3]
always @(*)
begin
    case(CONV_1_Store_Count[1:0])
        2'd0 :
        begin
            CONV_1_bank_3_ch_choose[0] = a3_reg[191:180];
            CONV_1_bank_3_ch_choose[1] = a3_reg[179:168];
            CONV_1_bank_3_ch_choose[2] = a3_reg[167:156];
            CONV_1_bank_3_ch_choose[3] = a3_reg[155:144];
        end
        2'd1 :
        begin
            CONV_1_bank_3_ch_choose[0] = a3_reg[143:132];
            CONV_1_bank_3_ch_choose[1] = a3_reg[131:120];
            CONV_1_bank_3_ch_choose[2] = a3_reg[119:108];
            CONV_1_bank_3_ch_choose[3] = a3_reg[107:96];
        end
        2'd2 :
        begin
            CONV_1_bank_3_ch_choose[0] = a3_reg[95:84];
            CONV_1_bank_3_ch_choose[1] = a3_reg[83:72];
            CONV_1_bank_3_ch_choose[2] = a3_reg[71:60];
            CONV_1_bank_3_ch_choose[3] = a3_reg[59:48];
        end
        2'd3 :
        begin
            CONV_1_bank_3_ch_choose[0] = a3_reg[47:36];
            CONV_1_bank_3_ch_choose[1] = a3_reg[35:24];
            CONV_1_bank_3_ch_choose[2] = a3_reg[23:12];
            CONV_1_bank_3_ch_choose[3] = a3_reg[11:0];
        end
    endcase
end

//      CONV_1_Store_Count
always @(posedge clk)
begin
    if(!rst_n)
        CONV_1_Store_Count <= 6'd0;
    else if(state == CONV_1)
    begin
        if(CONV_1_bank_horiz_store == 4'd11)
        begin
            if(CONV_1_bank_verti_store == 4'd11)
                CONV_1_Store_Count <= CONV_1_Store_Count + 6'd1;
            else
                CONV_1_Store_Count <= CONV_1_Store_Count;
        end
        else
            CONV_1_Store_Count <= CONV_1_Store_Count;
    end
    else if(state == CONV_2)
    begin
        if(CONV_1_bank_horiz_store == 4'd9)
        begin
            if(CONV_1_bank_verti_store == 4'd9)
                CONV_1_Store_Count <= CONV_1_Store_Count + 6'd1;
            else
                CONV_1_Store_Count <= CONV_1_Store_Count;
        end
        else
            CONV_1_Store_Count <= CONV_1_Store_Count;
    end
    else if(state == CONV_3)
    begin
        if(CONV_1_bank_horiz_store == 4'd7)
        begin
            if(CONV_1_bank_verti_store == 4'd7)
            begin
                if(CONV_1_Store_Count == 6'd11)
                    CONV_1_Store_Count <= 6'd0;
                else
                    CONV_1_Store_Count <= CONV_1_Store_Count + 6'd1;
            end
            else
                CONV_1_Store_Count <= CONV_1_Store_Count;
        end
        else
            CONV_1_Store_Count <= CONV_1_Store_Count;
    end
end

//      mask_detect
assign mask_detect = (state === POOLING)? sram_raddr_bias[1:0] : CONV_1_Store_Count[3:2];
//      CONV_1_mask
assign CONV_1_mask = ~ {mask_detect == 2'd0 && !CONV_1_bank_verti_store[0] && !CONV_1_bank_horiz_store[0],
                        mask_detect == 2'd0 && !CONV_1_bank_verti_store[0] && CONV_1_bank_horiz_store[0],
                        mask_detect == 2'd0 && CONV_1_bank_verti_store[0] && !CONV_1_bank_horiz_store[0],
                        mask_detect == 2'd0 && CONV_1_bank_verti_store[0] && CONV_1_bank_horiz_store[0],
                        mask_detect == 2'd1 && !CONV_1_bank_verti_store[0] && !CONV_1_bank_horiz_store[0],
                        mask_detect == 2'd1 && !CONV_1_bank_verti_store[0] && CONV_1_bank_horiz_store[0],
                        mask_detect == 2'd1 && CONV_1_bank_verti_store[0] && !CONV_1_bank_horiz_store[0],
                        mask_detect == 2'd1 && CONV_1_bank_verti_store[0] && CONV_1_bank_horiz_store[0],
                        mask_detect == 2'd2 && !CONV_1_bank_verti_store[0] && !CONV_1_bank_horiz_store[0],
                        mask_detect == 2'd2 && !CONV_1_bank_verti_store[0] && CONV_1_bank_horiz_store[0],
                        mask_detect == 2'd2 && CONV_1_bank_verti_store[0] && !CONV_1_bank_horiz_store[0],
                        mask_detect == 2'd2 && CONV_1_bank_verti_store[0] && CONV_1_bank_horiz_store[0],
                        mask_detect == 2'd3 && !CONV_1_bank_verti_store[0] && !CONV_1_bank_horiz_store[0],
                        mask_detect == 2'd3 && !CONV_1_bank_verti_store[0] && CONV_1_bank_horiz_store[0],
                        mask_detect == 2'd3 && CONV_1_bank_verti_store[0] && !CONV_1_bank_horiz_store[0],
                        mask_detect == 2'd3 && CONV_1_bank_verti_store[0] && CONV_1_bank_horiz_store[0]};

//      CONV_1_region_detect
assign CONV_1_region_detect = {CONV_1_bank_verti_store[1:0], CONV_1_bank_horiz_store[1:0]};

//      sram_raddr_a0_CONV_1
always @(*)
begin
    if(CONV_1_bank_horiz_change == 4'd1 || CONV_1_bank_horiz_change == 4'd5 || CONV_1_bank_horiz_change == 4'd9)
        sram_raddr_a0_CONV_1 = sram_raddr_a0 + 6'd1;
    else if(CONV_1_bank_horiz_change == 4'd11)
    begin
        if(CONV_1_bank_verti_change == 4'd1 || CONV_1_bank_verti_change == 4'd5 || CONV_1_bank_verti_change == 4'd9)
            sram_raddr_a0_CONV_1 = sram_raddr_a0 + 6'd3;
        else if(CONV_1_bank_verti_change == 4'd11)
            sram_raddr_a0_CONV_1 = 6'd0;
        else
            sram_raddr_a0_CONV_1 = sram_raddr_a0 - 6'd3;
    end
    else
        sram_raddr_a0_CONV_1 = sram_raddr_a0;
end

//      sram_raddr_a1_CONV_1
always @(*)
begin
    if(CONV_1_bank_horiz_change == 4'd3 || CONV_1_bank_horiz_change == 4'd7)
        sram_raddr_a1_CONV_1 = sram_raddr_a1 + 6'd1;
    else if(CONV_1_bank_horiz_change == 4'd11)
    begin
        if(CONV_1_bank_verti_change == 4'd1 || CONV_1_bank_verti_change == 4'd5 || CONV_1_bank_verti_change == 4'd9)
            sram_raddr_a1_CONV_1 = sram_raddr_a1 + 6'd4;
        else if(CONV_1_bank_verti_change == 4'd11)
            sram_raddr_a1_CONV_1 = 6'd0;
        else
            sram_raddr_a1_CONV_1 = sram_raddr_a1 - 6'd2;
    end
    else
        sram_raddr_a1_CONV_1 = sram_raddr_a1;
end

//      sram_raddr_a2_CONV_1
always @(*)
begin
    if(CONV_1_bank_horiz_change == 4'd1 || CONV_1_bank_horiz_change == 4'd5 || CONV_1_bank_horiz_change == 4'd9)
        sram_raddr_a2_CONV_1 = sram_raddr_a2 + 6'd1;
    else if(CONV_1_bank_horiz_change == 4'd11)
    begin
        if(CONV_1_bank_verti_change == 4'd3 || CONV_1_bank_verti_change == 4'd7)
            sram_raddr_a2_CONV_1 = sram_raddr_a2 + 6'd3;
        else if(CONV_1_bank_verti_change == 4'd11)
            sram_raddr_a2_CONV_1 = 6'd0;
        else
            sram_raddr_a2_CONV_1 = sram_raddr_a2 - 6'd3;
    end
    else
        sram_raddr_a2_CONV_1 = sram_raddr_a2;
end

//      sram_raddr_a3_CONV_1
always @(*)
begin
    if(CONV_1_bank_horiz_change == 4'd3 || CONV_1_bank_horiz_change == 4'd7)
        sram_raddr_a3_CONV_1 = sram_raddr_a3 + 6'd1;
    else if(CONV_1_bank_horiz_change == 4'd11)
    begin
        if(CONV_1_bank_verti_change == 4'd3 || CONV_1_bank_verti_change == 4'd7)
            sram_raddr_a3_CONV_1 = sram_raddr_a3 + 6'd4;
        else if(CONV_1_bank_verti_change == 4'd11)
            sram_raddr_a3_CONV_1 = 6'd0;
        else
            sram_raddr_a3_CONV_1 = sram_raddr_a3 - 6'd2;
    end
    else
        sram_raddr_a3_CONV_1 = sram_raddr_a3;
end

//      CONV_1_DONE
always @(posedge clk)
begin
    if(!rst_n)
        CONV_1_DONE <= 1'b0;
    else if(CONV_1_bank_horiz_store == 4'd11 && CONV_1_bank_verti_store == 4'd11 && CONV_1_Store_Count == 4'd15)
        CONV_1_DONE <= 1'd1;
end

//      sram_waddr_b_CONV_1
always @(*)
begin
    if(CONV_1_bank_horiz_store == 4'd0)
    begin
        if(CONV_1_bank_verti_store == 4'd4 || CONV_1_bank_verti_store == 4'd8)
            sram_waddr_b_CONV_1 = sram_waddr_b + 6'd4;
        else if(CONV_1_bank_verti_store[1:0] !== 2'd0)
            sram_waddr_b_CONV_1 = sram_waddr_b - 6'd2;
        else
            sram_waddr_b_CONV_1 = sram_waddr_b;
    end
    else if(CONV_1_bank_horiz_store == 4'd4 || CONV_1_bank_horiz_store == 4'd8)
        sram_waddr_b_CONV_1 = sram_waddr_b + 6'd1;
    else
        sram_waddr_b_CONV_1 = sram_waddr_b;
end

//      CONV_1_Multiplicand
always @(*)
begin
    case(CONV_1_region_detect)
        4'd0 :
        begin
            CONV_1_Multiplicand[0] = CONV_1_bank_0_ch_choose[0];
            CONV_1_Multiplicand[1] = CONV_1_bank_0_ch_choose[1];
            CONV_1_Multiplicand[2] = CONV_1_bank_1_ch_choose[0];
            CONV_1_Multiplicand[3] = CONV_1_bank_0_ch_choose[2];
            CONV_1_Multiplicand[4] = CONV_1_bank_0_ch_choose[3];
            CONV_1_Multiplicand[5] = CONV_1_bank_1_ch_choose[2];
            CONV_1_Multiplicand[6] = CONV_1_bank_2_ch_choose[0];
            CONV_1_Multiplicand[7] = CONV_1_bank_2_ch_choose[1];
            CONV_1_Multiplicand[8] = CONV_1_bank_3_ch_choose[0];
        end
        4'd1 :
        begin
            CONV_1_Multiplicand[0] = CONV_1_bank_0_ch_choose[1];
            CONV_1_Multiplicand[1] = CONV_1_bank_1_ch_choose[0];
            CONV_1_Multiplicand[2] = CONV_1_bank_1_ch_choose[1];
            CONV_1_Multiplicand[3] = CONV_1_bank_0_ch_choose[3];
            CONV_1_Multiplicand[4] = CONV_1_bank_1_ch_choose[2];
            CONV_1_Multiplicand[5] = CONV_1_bank_1_ch_choose[3];
            CONV_1_Multiplicand[6] = CONV_1_bank_2_ch_choose[1];
            CONV_1_Multiplicand[7] = CONV_1_bank_3_ch_choose[0];
            CONV_1_Multiplicand[8] = CONV_1_bank_3_ch_choose[1];
        end
        4'd2 :
        begin
            CONV_1_Multiplicand[0] = CONV_1_bank_1_ch_choose[0];
            CONV_1_Multiplicand[1] = CONV_1_bank_1_ch_choose[1];
            CONV_1_Multiplicand[2] = CONV_1_bank_0_ch_choose[0];
            CONV_1_Multiplicand[3] = CONV_1_bank_1_ch_choose[2];
            CONV_1_Multiplicand[4] = CONV_1_bank_1_ch_choose[3];
            CONV_1_Multiplicand[5] = CONV_1_bank_0_ch_choose[2];
            CONV_1_Multiplicand[6] = CONV_1_bank_3_ch_choose[0];
            CONV_1_Multiplicand[7] = CONV_1_bank_3_ch_choose[1];
            CONV_1_Multiplicand[8] = CONV_1_bank_2_ch_choose[0];
        end
        4'd3 :
        begin
            CONV_1_Multiplicand[0] = CONV_1_bank_1_ch_choose[1];
            CONV_1_Multiplicand[1] = CONV_1_bank_0_ch_choose[0];
            CONV_1_Multiplicand[2] = CONV_1_bank_0_ch_choose[1];
            CONV_1_Multiplicand[3] = CONV_1_bank_1_ch_choose[3];
            CONV_1_Multiplicand[4] = CONV_1_bank_0_ch_choose[2];
            CONV_1_Multiplicand[5] = CONV_1_bank_0_ch_choose[3];
            CONV_1_Multiplicand[6] = CONV_1_bank_3_ch_choose[1];
            CONV_1_Multiplicand[7] = CONV_1_bank_2_ch_choose[0];
            CONV_1_Multiplicand[8] = CONV_1_bank_2_ch_choose[1];
        end
        4'd4 :
        begin
            CONV_1_Multiplicand[0] = CONV_1_bank_0_ch_choose[2];
            CONV_1_Multiplicand[1] = CONV_1_bank_0_ch_choose[3];
            CONV_1_Multiplicand[2] = CONV_1_bank_1_ch_choose[2];
            CONV_1_Multiplicand[3] = CONV_1_bank_2_ch_choose[0];
            CONV_1_Multiplicand[4] = CONV_1_bank_2_ch_choose[1];
            CONV_1_Multiplicand[5] = CONV_1_bank_3_ch_choose[0];
            CONV_1_Multiplicand[6] = CONV_1_bank_2_ch_choose[2];
            CONV_1_Multiplicand[7] = CONV_1_bank_2_ch_choose[3];
            CONV_1_Multiplicand[8] = CONV_1_bank_3_ch_choose[2];
        end
        4'd5 :
        begin
            CONV_1_Multiplicand[0] = CONV_1_bank_0_ch_choose[3];
            CONV_1_Multiplicand[1] = CONV_1_bank_1_ch_choose[2];
            CONV_1_Multiplicand[2] = CONV_1_bank_1_ch_choose[3];
            CONV_1_Multiplicand[3] = CONV_1_bank_2_ch_choose[1];
            CONV_1_Multiplicand[4] = CONV_1_bank_3_ch_choose[0];
            CONV_1_Multiplicand[5] = CONV_1_bank_3_ch_choose[1];
            CONV_1_Multiplicand[6] = CONV_1_bank_2_ch_choose[3];
            CONV_1_Multiplicand[7] = CONV_1_bank_3_ch_choose[2];
            CONV_1_Multiplicand[8] = CONV_1_bank_3_ch_choose[3];
        end
        4'd6 :
        begin
            CONV_1_Multiplicand[0] = CONV_1_bank_1_ch_choose[2];
            CONV_1_Multiplicand[1] = CONV_1_bank_1_ch_choose[3];
            CONV_1_Multiplicand[2] = CONV_1_bank_0_ch_choose[2];
            CONV_1_Multiplicand[3] = CONV_1_bank_3_ch_choose[0];
            CONV_1_Multiplicand[4] = CONV_1_bank_3_ch_choose[1];
            CONV_1_Multiplicand[5] = CONV_1_bank_2_ch_choose[0];
            CONV_1_Multiplicand[6] = CONV_1_bank_3_ch_choose[2];
            CONV_1_Multiplicand[7] = CONV_1_bank_3_ch_choose[3];
            CONV_1_Multiplicand[8] = CONV_1_bank_2_ch_choose[2];
        end
        4'd7 :
        begin
            CONV_1_Multiplicand[0] = CONV_1_bank_1_ch_choose[3];
            CONV_1_Multiplicand[1] = CONV_1_bank_0_ch_choose[2];
            CONV_1_Multiplicand[2] = CONV_1_bank_0_ch_choose[3];
            CONV_1_Multiplicand[3] = CONV_1_bank_3_ch_choose[1];
            CONV_1_Multiplicand[4] = CONV_1_bank_2_ch_choose[0];
            CONV_1_Multiplicand[5] = CONV_1_bank_2_ch_choose[1];
            CONV_1_Multiplicand[6] = CONV_1_bank_3_ch_choose[3];
            CONV_1_Multiplicand[7] = CONV_1_bank_2_ch_choose[2];
            CONV_1_Multiplicand[8] = CONV_1_bank_2_ch_choose[3];
        end
        4'd8 :
        begin
            CONV_1_Multiplicand[0] = CONV_1_bank_2_ch_choose[0];
            CONV_1_Multiplicand[1] = CONV_1_bank_2_ch_choose[1];
            CONV_1_Multiplicand[2] = CONV_1_bank_3_ch_choose[0];
            CONV_1_Multiplicand[3] = CONV_1_bank_2_ch_choose[2];
            CONV_1_Multiplicand[4] = CONV_1_bank_2_ch_choose[3];
            CONV_1_Multiplicand[5] = CONV_1_bank_3_ch_choose[2];
            CONV_1_Multiplicand[6] = CONV_1_bank_0_ch_choose[0];
            CONV_1_Multiplicand[7] = CONV_1_bank_0_ch_choose[1];
            CONV_1_Multiplicand[8] = CONV_1_bank_1_ch_choose[0];
        end
        4'd9 :
        begin
            CONV_1_Multiplicand[0] = CONV_1_bank_2_ch_choose[1];
            CONV_1_Multiplicand[1] = CONV_1_bank_3_ch_choose[0];
            CONV_1_Multiplicand[2] = CONV_1_bank_3_ch_choose[1];
            CONV_1_Multiplicand[3] = CONV_1_bank_2_ch_choose[3];
            CONV_1_Multiplicand[4] = CONV_1_bank_3_ch_choose[2];
            CONV_1_Multiplicand[5] = CONV_1_bank_3_ch_choose[3];
            CONV_1_Multiplicand[6] = CONV_1_bank_0_ch_choose[1];
            CONV_1_Multiplicand[7] = CONV_1_bank_1_ch_choose[0];
            CONV_1_Multiplicand[8] = CONV_1_bank_1_ch_choose[1];
        end
        4'd10 :
        begin
            CONV_1_Multiplicand[0] = CONV_1_bank_3_ch_choose[0];
            CONV_1_Multiplicand[1] = CONV_1_bank_3_ch_choose[1];
            CONV_1_Multiplicand[2] = CONV_1_bank_2_ch_choose[0];
            CONV_1_Multiplicand[3] = CONV_1_bank_3_ch_choose[2];
            CONV_1_Multiplicand[4] = CONV_1_bank_3_ch_choose[3];
            CONV_1_Multiplicand[5] = CONV_1_bank_2_ch_choose[2];
            CONV_1_Multiplicand[6] = CONV_1_bank_1_ch_choose[0];
            CONV_1_Multiplicand[7] = CONV_1_bank_1_ch_choose[1];
            CONV_1_Multiplicand[8] = CONV_1_bank_0_ch_choose[0];
        end
        4'd11 :
        begin
            CONV_1_Multiplicand[0] = CONV_1_bank_3_ch_choose[1];
            CONV_1_Multiplicand[1] = CONV_1_bank_2_ch_choose[0];
            CONV_1_Multiplicand[2] = CONV_1_bank_2_ch_choose[1];
            CONV_1_Multiplicand[3] = CONV_1_bank_3_ch_choose[3];
            CONV_1_Multiplicand[4] = CONV_1_bank_2_ch_choose[2];
            CONV_1_Multiplicand[5] = CONV_1_bank_2_ch_choose[3];
            CONV_1_Multiplicand[6] = CONV_1_bank_1_ch_choose[1];
            CONV_1_Multiplicand[7] = CONV_1_bank_0_ch_choose[0];
            CONV_1_Multiplicand[8] = CONV_1_bank_0_ch_choose[1];
        end
        4'd12 :
        begin
            CONV_1_Multiplicand[0] = CONV_1_bank_2_ch_choose[2];
            CONV_1_Multiplicand[1] = CONV_1_bank_2_ch_choose[3];
            CONV_1_Multiplicand[2] = CONV_1_bank_3_ch_choose[2];
            CONV_1_Multiplicand[3] = CONV_1_bank_0_ch_choose[0];
            CONV_1_Multiplicand[4] = CONV_1_bank_0_ch_choose[1];
            CONV_1_Multiplicand[5] = CONV_1_bank_1_ch_choose[0];
            CONV_1_Multiplicand[6] = CONV_1_bank_0_ch_choose[2];
            CONV_1_Multiplicand[7] = CONV_1_bank_0_ch_choose[3];
            CONV_1_Multiplicand[8] = CONV_1_bank_1_ch_choose[2];
        end
        4'd13 :
        begin
            CONV_1_Multiplicand[0] = CONV_1_bank_2_ch_choose[3];
            CONV_1_Multiplicand[1] = CONV_1_bank_3_ch_choose[2];
            CONV_1_Multiplicand[2] = CONV_1_bank_3_ch_choose[3];
            CONV_1_Multiplicand[3] = CONV_1_bank_0_ch_choose[1];
            CONV_1_Multiplicand[4] = CONV_1_bank_1_ch_choose[0];
            CONV_1_Multiplicand[5] = CONV_1_bank_1_ch_choose[1];
            CONV_1_Multiplicand[6] = CONV_1_bank_0_ch_choose[3];
            CONV_1_Multiplicand[7] = CONV_1_bank_1_ch_choose[2];
            CONV_1_Multiplicand[8] = CONV_1_bank_1_ch_choose[3];
        end
        4'd14 :
        begin
            CONV_1_Multiplicand[0] = CONV_1_bank_3_ch_choose[2];
            CONV_1_Multiplicand[1] = CONV_1_bank_3_ch_choose[3];
            CONV_1_Multiplicand[2] = CONV_1_bank_2_ch_choose[2];
            CONV_1_Multiplicand[3] = CONV_1_bank_1_ch_choose[0];
            CONV_1_Multiplicand[4] = CONV_1_bank_1_ch_choose[1];
            CONV_1_Multiplicand[5] = CONV_1_bank_0_ch_choose[0];
            CONV_1_Multiplicand[6] = CONV_1_bank_1_ch_choose[2];
            CONV_1_Multiplicand[7] = CONV_1_bank_1_ch_choose[3];
            CONV_1_Multiplicand[8] = CONV_1_bank_0_ch_choose[2];
        end
        4'd15 :
        begin
            CONV_1_Multiplicand[0] = CONV_1_bank_3_ch_choose[3];
            CONV_1_Multiplicand[1] = CONV_1_bank_2_ch_choose[2];
            CONV_1_Multiplicand[2] = CONV_1_bank_2_ch_choose[3];
            CONV_1_Multiplicand[3] = CONV_1_bank_1_ch_choose[1];
            CONV_1_Multiplicand[4] = CONV_1_bank_0_ch_choose[0];
            CONV_1_Multiplicand[5] = CONV_1_bank_0_ch_choose[1];
            CONV_1_Multiplicand[6] = CONV_1_bank_1_ch_choose[3];
            CONV_1_Multiplicand[7] = CONV_1_bank_0_ch_choose[2];
            CONV_1_Multiplicand[8] = CONV_1_bank_0_ch_choose[3];
        end
    endcase
end

//      CONV_1_mult
always @(*)
begin
    for(i=0;i<9;i=i+1)
    begin
        CONV_1_mult[i] = CONV_1_Multiplicand[i] * KERNEL[i];
    end
end

//      CONV_1_add
assign CONV_1_add = CONV_1_mult[0] + CONV_1_mult[1] + CONV_1_mult[2] + CONV_1_mult[3] + CONV_1_mult[4] + CONV_1_mult[5] + CONV_1_mult[6] + CONV_1_mult[7] + CONV_1_mult[8];

//      CONV_1_result
assign CONV_1_result = output_reg[0][CONV_1_bank_verti_store][CONV_1_bank_horiz_store] + output_reg[1][CONV_1_bank_verti_store][CONV_1_bank_horiz_store] +
       output_reg[2][CONV_1_bank_verti_store][CONV_1_bank_horiz_store] + CONV_1_add;

//      CONV_1_bias
assign CONV_1_add_bias = CONV_1_result + $signed({BIAS,8'b00000000});

//      CONV_1_quantization
assign CONV_1_quantization = CONV_1_add_bias[19:7] + CONV_1_add_bias[6];

//      CONV_1_RELU
assign CONV_1_RELU = (!CONV_1_quantization[12])? (CONV_1_quantization > 13'd2047)? 12'd2047 : CONV_1_quantization[11:0] : 12'd0;

// ===============================================================
//       CONV_2
// ===============================================================
//      sram_raddr_weight_CONV_2
always @(*)
begin
    if(CONV_1_bank_horiz_change == 4'd7 && CONV_1_bank_verti_change == 4'd9)
        sram_raddr_weight_CONV_2 = sram_raddr_weight + 10'd1;
    else
        sram_raddr_weight_CONV_2 = sram_raddr_weight;
end

//      sram_raddr_bias_CONV_2
always @(*)
begin
    if(CONV_1_bank_horiz_change == 4'd9 && CONV_1_bank_verti_change == 4'd9 && (&(CONV_1_Store_Count[1:0])))
        sram_raddr_bias_CONV_2 = sram_raddr_bias + 6'd1;
    else
        sram_raddr_bias_CONV_2 = sram_raddr_bias;
end

//      CONV_2_DONE
always @(posedge clk)
begin
    if(!rst_n)
        CONV_2_DONE <= 1'b0;
    else if(state == CONV_2 && CONV_1_bank_horiz_store == 4'd9 && CONV_1_bank_verti_store == 4'd9 && CONV_1_Store_Count == 6'd63)
        CONV_2_DONE <= 1'd1;
end

//      sram_raddr_b0_CONV_2
always @(*)
begin
    if(CONV_1_bank_horiz_change == 4'd1 || CONV_1_bank_horiz_change == 4'd5)
        sram_raddr_b0_CONV_2 = sram_raddr_b0 + 6'd1;
    else if(CONV_1_bank_horiz_change == 4'd9)
    begin
        if(CONV_1_bank_verti_change == 4'd1 || CONV_1_bank_verti_change == 4'd5)
            sram_raddr_b0_CONV_2 = sram_raddr_b0 + 6'd4;
        else if(CONV_1_bank_verti_change == 4'd9)
            sram_raddr_b0_CONV_2 = 6'd0;
        else
            sram_raddr_b0_CONV_2 = sram_raddr_b0 - 6'd2;
    end
    else
        sram_raddr_b0_CONV_2 = sram_raddr_b0;
end

//      sram_raddr_b1_CONV_2
always @(*)
begin
    if(CONV_1_bank_horiz_change == 4'd3 || CONV_1_bank_horiz_change == 4'd7)
        sram_raddr_b1_CONV_2 = sram_raddr_b1 + 6'd1;
    else if(CONV_1_bank_horiz_change == 4'd9)
    begin
        if(CONV_1_bank_verti_change == 4'd1 || CONV_1_bank_verti_change == 4'd5)
            sram_raddr_b1_CONV_2 = sram_raddr_b1 + 6'd4;
        else if(CONV_1_bank_verti_change == 4'd9)
            sram_raddr_b1_CONV_2 = 6'd0;
        else
            sram_raddr_b1_CONV_2 = sram_raddr_b1 - 6'd2;
    end
    else
        sram_raddr_b1_CONV_2 = sram_raddr_b1;
end

//      sram_raddr_b2_CONV_2
always @(*)
begin
    if(CONV_1_bank_horiz_change == 4'd1 || CONV_1_bank_horiz_change == 4'd5)
        sram_raddr_b2_CONV_2 = sram_raddr_b2 + 6'd1;
    else if(CONV_1_bank_horiz_change == 4'd9)
    begin
        if(CONV_1_bank_verti_change == 4'd3 || CONV_1_bank_verti_change == 4'd7)
            sram_raddr_b2_CONV_2 = sram_raddr_b2 + 6'd4;
        else if(CONV_1_bank_verti_change == 4'd9)
            sram_raddr_b2_CONV_2 = 6'd0;
        else
            sram_raddr_b2_CONV_2 = sram_raddr_b2 - 6'd2;
    end
    else
        sram_raddr_b2_CONV_2 = sram_raddr_b2;
end

//      sram_raddr_b3_CONV_2
always @(*)
begin
    if(CONV_1_bank_horiz_change == 4'd3 || CONV_1_bank_horiz_change == 4'd7)
        sram_raddr_b3_CONV_2 = sram_raddr_b3 + 6'd1;
    else if(CONV_1_bank_horiz_change == 4'd9)
    begin
        if(CONV_1_bank_verti_change == 4'd3 || CONV_1_bank_verti_change == 4'd7)
            sram_raddr_b3_CONV_2 = sram_raddr_b3 + 6'd4;
        else if(CONV_1_bank_verti_change == 4'd9)
            sram_raddr_b3_CONV_2 = 6'd0;
        else
            sram_raddr_b3_CONV_2 = sram_raddr_b3 - 6'd2;
    end
    else
        sram_raddr_b3_CONV_2 = sram_raddr_b3;
end

//      KERNEL_CONV_2
always @(*)
begin
    if(CONV_1_bank_horiz_store == 4'd9 && CONV_1_bank_verti_store == 4'd9)
    begin
        for(i=0;i<9;i=i+1)
        begin
            KERNEL_CONV_2[i] = sram_rdata_weight[71-(i<<3)-:8];
        end
    end
    else
    begin
        for(i=0;i<9;i=i+1)
        begin
            KERNEL_CONV_2[i] = KERNEL[i];
        end
    end
end

//      CONV_2_BIAS
always @(*)
begin
    if(CONV_1_bank_horiz_store == 4'd0 && CONV_1_bank_verti_store == 4'd0 && CONV_1_Store_Count == 4'd0)
        CONV_2_BIAS = sram_rdata_bias;
    else if(CONV_1_bank_horiz_store == 4'd9 && CONV_1_bank_verti_store == 4'd9 && CONV_1_Store_Count[1:0] == 2'd3)
        CONV_2_BIAS = sram_rdata_bias;
    else
        CONV_2_BIAS = BIAS;
end

//      sram_waddr_a_CONV_2
always @(*)
begin
    if(CONV_1_bank_horiz_store == 4'd0)
    begin
        if(CONV_1_bank_verti_store == 4'd4 || CONV_1_bank_verti_store == 4'd8)
            sram_waddr_a_CONV_2 = sram_waddr_a + 6'd4;
        else if(CONV_1_bank_verti_store[1:0] !== 2'd0)
            sram_waddr_a_CONV_2 = sram_waddr_a - 6'd2;
        else
            sram_waddr_a_CONV_2 = sram_waddr_a;
    end
    else if(CONV_1_bank_horiz_store == 4'd4 || CONV_1_bank_horiz_store == 4'd8)
        sram_waddr_a_CONV_2 = sram_waddr_a + 6'd1;
    else
        sram_waddr_a_CONV_2 = sram_waddr_a;
end

// ===============================================================
//       CONV_3 && POOLING
// ===============================================================
//      sram_raddr_weight_CONV_3
always @(*)
begin
    if(CONV_1_bank_horiz_change == 4'd5 && CONV_1_bank_verti_change == 4'd7)
        sram_raddr_weight_CONV_3 = sram_raddr_weight + 10'd1;
    else
        sram_raddr_weight_CONV_3 = sram_raddr_weight;
end

//      sram_raddr_bias_CONV_3
always @(*)
begin
    if(POOLING_DONE)
        sram_raddr_bias_CONV_3 = sram_raddr_bias + 6'd1;
    else
        sram_raddr_bias_CONV_3 = sram_raddr_bias;
end

//      sram_raddr_a0_CONV_3
always @(*)
begin
    if(CONV_1_bank_horiz_change == 4'd1 || CONV_1_bank_horiz_change == 4'd5)
        sram_raddr_a0_CONV_3 = sram_raddr_a0 + 6'd1;
    else if(CONV_1_bank_horiz_change == 4'd7)
    begin
        if(CONV_1_bank_verti_change == 4'd1 || CONV_1_bank_verti_change == 4'd5)
            sram_raddr_a0_CONV_3 = sram_raddr_a0 + 6'd4;
        else if(CONV_1_bank_verti_change == 4'd7)
        begin
            case(CONV_1_Store_Count[3:2])
                2'd0:
                begin
                    if(CONV_1_Store_Count[1:0] == 2'd3)
                        sram_raddr_a0_CONV_3 = 6'd3;
                    else
                        sram_raddr_a0_CONV_3 = 6'd0;
                end
                2'd1:
                begin
                    if(CONV_1_Store_Count[1:0] == 2'd3)
                        sram_raddr_a0_CONV_3 = 6'd18;
                    else
                        sram_raddr_a0_CONV_3 = 6'd3;
                end
                2'd2:
                begin
                    if(CONV_1_Store_Count[1:0] == 2'd3)
                        sram_raddr_a0_CONV_3 = 6'd0;
                    else
                        sram_raddr_a0_CONV_3 = 6'd18;
                end
                default :
                    sram_raddr_a0_CONV_3 = sram_raddr_a0;
            endcase
        end
        else
            sram_raddr_a0_CONV_3 = sram_raddr_a0 - 6'd2;
    end
    else
        sram_raddr_a0_CONV_3 = sram_raddr_a0;
end

//      sram_raddr_a1_CONV_3
always @(*)
begin
    if(CONV_1_bank_horiz_change == 4'd3)
        sram_raddr_a1_CONV_3 = sram_raddr_a1 + 6'd1;
    else if(CONV_1_bank_horiz_change == 4'd7)
    begin
        if(CONV_1_bank_verti_change == 4'd1 || CONV_1_bank_verti_change == 4'd5)
            sram_raddr_a1_CONV_3 = sram_raddr_a1 + 6'd5;
        else if(CONV_1_bank_verti_change == 4'd7)
        begin
            case(CONV_1_Store_Count[3:2])
                2'd0:
                begin
                    if(CONV_1_Store_Count[1:0] == 2'd3)
                        sram_raddr_a1_CONV_3 = 6'd3;
                    else
                        sram_raddr_a1_CONV_3 = 6'd0;
                end
                2'd1:
                begin
                    if(CONV_1_Store_Count[1:0] == 2'd3)
                        sram_raddr_a1_CONV_3 = 6'd18;
                    else
                        sram_raddr_a1_CONV_3 = 6'd3;
                end
                2'd2:
                begin
                    if(CONV_1_Store_Count[1:0] == 2'd3)
                        sram_raddr_a1_CONV_3 = 6'd0;
                    else
                        sram_raddr_a1_CONV_3 = 6'd18;
                end
                default :
                    sram_raddr_a1_CONV_3 = sram_raddr_a1;
            endcase
        end
        else
            sram_raddr_a1_CONV_3 = sram_raddr_a1 - 6'd1;
    end
    else
        sram_raddr_a1_CONV_3 = sram_raddr_a1;
end

//      sram_raddr_a2_CONV_3
always @(*)
begin
    if(CONV_1_bank_horiz_change == 4'd1 || CONV_1_bank_horiz_change == 4'd5)
        sram_raddr_a2_CONV_3 = sram_raddr_a2 + 6'd1;
    else if(CONV_1_bank_horiz_change == 4'd7)
    begin
        if(CONV_1_bank_verti_change == 4'd3)
            sram_raddr_a2_CONV_3 = sram_raddr_a2 + 6'd4;
        else if(CONV_1_bank_verti_change == 4'd7)
        begin
            case(CONV_1_Store_Count[3:2])
                2'd0:
                begin
                    if(CONV_1_Store_Count[1:0] == 2'd3)
                        sram_raddr_a2_CONV_3 = 6'd3;
                    else
                        sram_raddr_a2_CONV_3 = 6'd0;
                end
                2'd1:
                begin
                    if(CONV_1_Store_Count[1:0] == 2'd3)
                        sram_raddr_a2_CONV_3 = 6'd18;
                    else
                        sram_raddr_a2_CONV_3 = 6'd3;
                end
                2'd2:
                begin
                    if(CONV_1_Store_Count[1:0] == 2'd3)
                        sram_raddr_a2_CONV_3 = 6'd0;
                    else
                        sram_raddr_a2_CONV_3 = 6'd18;
                end
                default :
                    sram_raddr_a2_CONV_3 = sram_raddr_a2;
            endcase
        end
        else
            sram_raddr_a2_CONV_3 = sram_raddr_a2 - 6'd2;
    end
    else
        sram_raddr_a2_CONV_3 = sram_raddr_a2;
end

//      sram_raddr_a3_CONV_3
always @(*)
begin
    if(CONV_1_bank_horiz_change == 4'd3)
        sram_raddr_a3_CONV_3 = sram_raddr_a3 + 6'd1;
    else if(CONV_1_bank_horiz_change == 4'd7)
    begin
        if(CONV_1_bank_verti_change == 4'd3)
            sram_raddr_a3_CONV_3 = sram_raddr_a3 + 6'd5;
        else if(CONV_1_bank_verti_change == 4'd7)
        begin
            case(CONV_1_Store_Count[3:2])
                2'd0:
                begin
                    if(CONV_1_Store_Count[1:0] == 2'd3)
                        sram_raddr_a3_CONV_3 = 6'd3;
                    else
                        sram_raddr_a3_CONV_3 = 6'd0;
                end
                2'd1:
                begin
                    if(CONV_1_Store_Count[1:0] == 2'd3)
                        sram_raddr_a3_CONV_3 = 6'd18;
                    else
                        sram_raddr_a3_CONV_3 = 6'd3;
                end
                2'd2:
                begin
                    if(CONV_1_Store_Count[1:0] == 2'd3)
                        sram_raddr_a3_CONV_3 = 6'd0;
                    else
                        sram_raddr_a3_CONV_3 = 6'd18;
                end
                default :
                    sram_raddr_a3_CONV_3 = sram_raddr_a3;
            endcase
        end
        else
            sram_raddr_a3_CONV_3 = sram_raddr_a3 - 6'd1;
    end
    else
        sram_raddr_a3_CONV_3 = sram_raddr_a3;
end

//      KERNEL_CONV_3
always @(*)
begin
    if(CONV_1_bank_horiz_store == 4'd7 && CONV_1_bank_verti_store == 4'd7)
    begin
        for(i=0;i<9;i=i+1)
        begin
            KERNEL_CONV_3[i] = sram_rdata_weight[71-(i<<3)-:8];
        end
    end
    else
    begin
        for(i=0;i<9;i=i+1)
        begin
            KERNEL_CONV_3[i] = KERNEL[i];
        end
    end
end

//      CONV_3_BIAS
always @(*)
begin
    if(CONV_1_bank_horiz_store == 4'd7 && CONV_1_bank_verti_store == 4'd7 && CONV_1_Store_Count == 6'd10)
        CONV_3_BIAS = sram_rdata_bias;
    else
        CONV_3_BIAS = BIAS;
end

//      CONV_3_output_reg
always @(posedge clk)
begin
    if(!rst_n)
    begin
        for(i=0;i<2;i=i+1)
        begin
            for(j=0;j<8;j=j+1)
            begin
                for(k=0;k<8;k=k+1)
                begin
                    CONV_3_output_reg[i][j][k] <= 20'd0;
                end
            end
        end
    end
    else if(state == CONV_3)
    begin
        if(CONV_1_Store_Count == 6'd11)
            CONV_3_output_reg[0][CONV_1_bank_verti_store][CONV_1_bank_horiz_store] <= CONV_3_RELU;
        else if(CONV_1_Store_Count[1:0] == 2'd3)
            CONV_3_output_reg[CONV_1_Store_Count[3:2]][CONV_1_bank_verti_store][CONV_1_bank_horiz_store] <= CONV_1_result;
    end
    else if(state == POOLING && POOLING_DONE)
    begin
        for(i=0;i<2;i=i+1)
        begin
            for(j=0;j<8;j=j+1)
            begin
                for(k=0;k<8;k=k+1)
                begin
                    CONV_3_output_reg[i][j][k] <= 20'd0;
                end
            end
        end
    end
end

//      CONV_3_result
assign CONV_3_result = CONV_3_output_reg[0][CONV_1_bank_verti_store][CONV_1_bank_horiz_store] + CONV_3_output_reg[1][CONV_1_bank_verti_store][CONV_1_bank_horiz_store] + CONV_1_result;

//      CONV_3_add_bias
assign CONV_3_add_bias = CONV_3_result + $signed({BIAS,8'b00000000});

//      CONV_3_RELU
assign CONV_3_RELU = (!CONV_3_add_bias[19])? CONV_3_add_bias : 19'd0;

//      POOLING_DONE
always @(posedge clk)
begin
    if(!rst_n)
        POOLING_DONE <= 1'b0;
    else if(state == CONV_3)
        POOLING_DONE <= 1'b0;
    else if(state === POOLING)
    begin
        if(CONV_1_bank_horiz_store == 4'd3 && CONV_1_bank_verti_store == 4'd3)
            POOLING_DONE <= 1'b1;
        else
            POOLING_DONE <= POOLING_DONE;
    end
end

//      POOLING_horiz_pointer
assign POOLING_horiz_pointer = CONV_1_bank_horiz_store << 1;

//      POOLING_verti_pointer
assign POOLING_verti_pointer = CONV_1_bank_verti_store << 1;

//      POOLING_add
assign POOLING_add = CONV_3_output_reg[0][POOLING_verti_pointer][POOLING_horiz_pointer]
       + CONV_3_output_reg[0][POOLING_verti_pointer][POOLING_horiz_pointer + 4'd1]
       + CONV_3_output_reg[0][POOLING_verti_pointer + 4'd1][POOLING_horiz_pointer]
       + CONV_3_output_reg[0][POOLING_verti_pointer + 4'd1][POOLING_horiz_pointer + 4'd1];

//      POOLING_average
assign POOLING_average = POOLING_add >> 2;

//      POOLING_quantization
assign POOLING_quantization = POOLING_average[19:7] + POOLING_average[6];

//      POOLING_result
assign POOLING_result = (POOLING_quantization > 13'd2047)? 12'd2047 : POOLING_quantization[11:0];

//      sram_waddr_b_CONV_3
assign sram_waddr_b_CONV_3 = sram_raddr_bias - 6'd16;


endmodule
