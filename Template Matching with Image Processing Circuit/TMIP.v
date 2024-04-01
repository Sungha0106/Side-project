`include "/home/lab911_1/Desktop/7112064132/Iclab_2021_Fall/ICLAB_05/RA2SH.v"
module TMIP( clk, rst_n, in_valid, in_valid_2, image, img_size, template, action, out_valid, out_x, out_y, out_img_pos, out_value);
input clk;
input rst_n;
input in_valid;
input in_valid_2;
input signed [15:0] image;
input signed [15:0] template;
input [4:0] img_size;
input [1:0] action;
output reg out_valid;
output reg [3:0] out_x;
output reg [3:0] out_y;
output reg [7:0] out_img_pos;
output reg signed [39:0] out_value;
// ===============================================================
// wire/reg
// ===============================================================
reg [2:0] state, next_state;
parameter IMAGE_STORE = 3'b000, ACTION_ALGORITHM = 3'b001, CROSS_CORRELATION = 3'b010, DONE = 3'b011, SAVE = 3'b100, IDLE = 3'b101;
reg signed [15:0] image_reg [0:255];
reg signed [15:0] kernel [0:8];
reg [4:0] img_size_reg;
reg [1:0] action_reg;
reg [7:0] image_counter;
reg start, start2;
//      CROSS_CORRELATION
reg signed [15:0] image_matrix[0:8];
reg signed [31:0] image_kernel_mult[0:8];
wire signed [39:0] CROSS_CORRELATION_result;
reg [7:0] CROSS_CORRELATION_counter;
wire [3:0] left_up_corner, left_down_corner, right_up_corner, right_down_corner, up, down, left, right;
wire [3:0] region;
reg a, b, c, d, e, f, g;
reg [7:0] step_number;
reg signed [39:0] maximum_value;
reg [3:0] x_coordination, y_coordination;
wire finish;
//      MATCHING_TEMPLATE_POSITION
reg [7:0] MATCHING_TEMPLATE_POSITION[0:8];
reg [3:0] matching_counter;
reg [3:0] counter;
//      BRIGHT_ADJUSTMENT
wire signed [6:0] bias;
reg signed [15:0] BRIGHT_ADJUSTMENT_result [0:255];
//      MAX_POOLING
reg signed [15:0] MAX_POOLING_layer1 [0:63];
reg signed [15:0] MAX_POOLING_layer2 [0:63];
reg signed [15:0] MAX_POOLING_layer3 [0:63];
//      index
wire [7:0] index_1, index_2, index_3, index_4, index_5, index_6,  index_7,  index_8, index_9;
//      SRAM
wire signed [39:0] SRAM_IN;
wire signed [39:0] SRAM_OUT;
wire [7:0] SRAM_ADDRESS;
wire SRAM_CEN;
wire SRAM_WEN;
wire SRAM_OEN;
integer i, j;

// ===============================================================
// FSM
// ===============================================================
//      next_state
always @(*)
begin
    case(state)
        IMAGE_STORE :
        begin
            if(!in_valid && start)
                next_state = ACTION_ALGORITHM;
            else
                next_state = IMAGE_STORE;
        end

        ACTION_ALGORITHM :
        begin
            if(!in_valid_2 && start2)
                next_state = CROSS_CORRELATION;
            else
                next_state = ACTION_ALGORITHM;
        end

        CROSS_CORRELATION :
        begin
            if(finish)
                next_state = SAVE;
            else
                next_state = CROSS_CORRELATION;
        end

        SAVE :
            next_state = DONE;
        DONE :
        begin
            if(!start2 && !CROSS_CORRELATION_counter)
                next_state = IDLE;
            else
                next_state = DONE;
        end

        IDLE :
            next_state = IMAGE_STORE;

        default :
            next_state = state;

    endcase
end

//      state
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        state <= 3'd0;
    else
        state <= next_state;
end

// ===============================================================
// IMAGE_STORE
// ===============================================================
//      start
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        start <= 1'b0;
    else if(state == IMAGE_STORE)
        start <= in_valid;
    else if(state == IDLE)
        start <= 1'b0;
end

//      bias
assign bias = $signed(7'd50);

//      kernel
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        for(i=0;i<9;i=i+1)
        begin
            kernel[i] <= 16'd0;
        end
    end
    else if(state == IMAGE_STORE)
    begin
        if(in_valid)
        begin
            if(image_counter > 8'd8)
            begin
                for(i=0;i<9;i=i+1)
                begin
                    kernel[i] <= kernel[i];
                end
            end
            else
                kernel[image_counter] <= template;
        end
        else
        begin
            for(i=0;i<9;i=i+1)
            begin
                kernel[i] <= kernel[i];
            end
        end
    end
    else if(state == IDLE)
    begin
        for(i=0;i<9;i=i+1)
        begin
            kernel[i] <= 16'd0;
        end
    end
end

//      img_size_reg
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        img_size_reg <= 5'd0;
    else if(state == IMAGE_STORE)
    begin
        if(in_valid && !start)
            img_size_reg <= img_size;
        else
            img_size_reg <= img_size_reg;
    end
    else if(state == ACTION_ALGORITHM)
    begin
        if(action_reg == 2'd1)
        begin
            if(img_size_reg == 5'd4)
                img_size_reg <= img_size_reg;
            else
                img_size_reg <= (img_size_reg >> 1);

        end
        else
            img_size_reg <= img_size_reg;
    end
end

//      image_counter
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        image_counter <= 8'd0;
    else if(state == IMAGE_STORE)
    begin
        if(in_valid)
            image_counter <= image_counter + 8'd1;
        else
            image_counter <= 8'd0;
    end
end

//      image_reg
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        for(i=0;i<256;i=i+1)
        begin
            image_reg[i] <= 16'd0;
        end
    end
    else if(state == IMAGE_STORE)
    begin
        if(in_valid)
            image_reg[image_counter] <= image;
        else
        begin
            for(i=0;i<256;i=i+1)
            begin
                image_reg[i] <= image_reg[i];
            end
        end
    end
    else if(state == ACTION_ALGORITHM)
    begin
        if(!in_valid_2)
        begin
            for(i=0;i<256;i=i+1)
            begin
                image_reg[i] <= image_reg[i];
            end
        end
        else
        begin
            case(action_reg)
                2'd0 :
                begin
                    for(i=0;i<256;i=i+1)
                    begin
                        image_reg[i] <= image_reg[i];
                    end
                end
                2'd1 :
                begin
                    if(img_size_reg == 5'd8)
                    begin
                        for(i=0;i<49;i=i+16)
                        begin
                            for(j=0;j<7;j=j+2)
                            begin
                                image_reg[(i>>2) + (j>>1)] <= MAX_POOLING_layer3[(i>>2) + (j>>1)];
                            end
                        end
                    end
                    else if(img_size_reg == 5'd16)
                    begin
                        for(i=0;i<225;i=i+32)
                        begin
                            for(j=0;j<15;j=j+2)
                            begin
                                image_reg[(i>>2) + (j>>1)] <= MAX_POOLING_layer3[(i>>2) + (j>>1)];
                            end
                        end
                    end
                end
                2'd2 :
                begin
                    if(img_size_reg == 5'd4)
                    begin
                        for(i=0;i<13;i=i+4)
                        begin
                            for(j=0;j<4;j=j+1)
                            begin
                                image_reg[i+j] <= image_reg[i+3-j];
                            end
                        end
                    end
                    else if(img_size_reg == 5'd8)
                    begin
                        for(i=0;i<57;i=i+8)
                        begin
                            for(j=0;j<8;j=j+1)
                            begin
                                image_reg[i+j] <= image_reg[i+7-j];
                            end
                        end
                    end
                    else
                    begin
                        for(i=0;i<241;i=i+16)
                        begin
                            for(j=0;j<16;j=j+1)
                            begin
                                image_reg[i+j] <= image_reg[i+15-j];
                            end
                        end
                    end
                end
                2'd3 :
                begin
                    for(i=0;i<256;i=i+1)
                    begin
                        image_reg[i] <= BRIGHT_ADJUSTMENT_result[i];
                    end
                end
            endcase
        end
    end
    else if(state == IDLE)
    begin
        for(i=0;i<256;i=i+1)
        begin
            image_reg[i] <= 16'd0;
        end
    end
end

// ===============================================================
// ACTION_ALGORITHM
// ===============================================================
//      start2
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        start2 <= 1'b0;
    else if(state == ACTION_ALGORITHM)
    begin
        if(in_valid_2)
            start2 <= 1'b1;
        else
            start2 <= start2;
    end
    else if(state == DONE)
    begin
        if(CROSS_CORRELATION_counter == step_number)
            start2 <= 1'b0;
        else
            start2 <= start2;
    end
end

//      action_reg
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        action_reg <= 2'd0;
    else if(state == ACTION_ALGORITHM)
    begin
        if(in_valid_2)
            action_reg <= action;
        else
            action_reg <= action_reg;
    end
    else if(state == IDLE)
        action_reg <= 2'd0;
end

// ===============================================================
// MAX_POOLING
// ===============================================================
//      MAX_POOLING_layer1
always @(*)
begin
    if(img_size_reg == 5'd8)
    begin
        for(i=0;i<49;i=i+16)
        begin
            for(j=0;j<7;j=j+2)
            begin
                if(image_reg[i+j] > image_reg[i+j+1])
                    MAX_POOLING_layer1[(i>>2) + (j>>1)] = image_reg[i+j];
                else
                    MAX_POOLING_layer1[(i>>2) + (j>>1)] = image_reg[i+j+1];
            end
        end
        for(i=16;i<64;i=i+1)
        begin
            MAX_POOLING_layer1[i] = 16'd0;
        end
    end
    else
    begin
        for(i=0;i<225;i=i+32)
        begin
            for(j=0;j<15;j=j+2)
            begin
                if(image_reg[i+j] > image_reg[i+j+1])
                    MAX_POOLING_layer1[(i>>2) + (j>>1)] = image_reg[i+j];
                else
                    MAX_POOLING_layer1[(i>>2) + (j>>1)] = image_reg[i+j+1];
            end
        end
    end
end

//      MAX_POOLING_layer2
always @(*)
begin
    if(img_size_reg == 5'd8)
    begin
        for(i=0;i<49;i=i+16)
        begin
            for(j=0;j<7;j=j+2)
            begin
                if(image_reg[i+j+8] > image_reg[i+j+9])
                    MAX_POOLING_layer2[(i>>2) + (j>>1)] = image_reg[i+j+8];
                else
                    MAX_POOLING_layer2[(i>>2) + (j>>1)] = image_reg[i+j+9];
            end
        end
        for(i=16;i<64;i=i+1)
        begin
            MAX_POOLING_layer2[i] = 16'd0;
        end
    end
    else
    begin
        for(i=0;i<225;i=i+32)
        begin
            for(j=0;j<15;j=j+2)
            begin
                if(image_reg[i+j+16] > image_reg[i+j+17])
                    MAX_POOLING_layer2[(i>>2) + (j>>1)] = image_reg[i+j+16];
                else
                    MAX_POOLING_layer2[(i>>2) + (j>>1)] = image_reg[i+j+17];
            end
        end
    end
end

//      MAX_POOLING_layer3
always @(*)
begin
    if(img_size_reg == 5'd8)
    begin
        for(i=0;i<49;i=i+16)
        begin
            for(j=0;j<7;j=j+2)
            begin
                if(MAX_POOLING_layer1[(i>>2) + (j>>1)] > MAX_POOLING_layer2[(i>>2) + (j>>1)])
                    MAX_POOLING_layer3[(i>>2) + (j>>1)] = MAX_POOLING_layer1[(i>>2) + (j>>1)];
                else
                    MAX_POOLING_layer3[(i>>2) + (j>>1)] = MAX_POOLING_layer2[(i>>2) + (j>>1)];
            end
        end
        for(i=16;i<64;i=i+1)
        begin
            MAX_POOLING_layer3[i] = 16'd0;
        end
    end
    else
    begin
        for(i=0;i<225;i=i+32)
        begin
            for(j=0;j<15;j=j+2)
            begin
                if(MAX_POOLING_layer1[(i>>2) + (j>>1)] > MAX_POOLING_layer2[(i>>2) + (j>>1)])
                    MAX_POOLING_layer3[(i>>2) + (j>>1)] = MAX_POOLING_layer1[(i>>2) + (j>>1)];
                else
                    MAX_POOLING_layer3[(i>>2) + (j>>1)] = MAX_POOLING_layer2[(i>>2) + (j>>1)];
            end
        end
    end
end

// ===============================================================
// BRIGHT_ADJUSTMENT
// ===============================================================
//      bias
assign bias = 7'd50;

//      BRIGHT_ADJUSTMENT_result
always @(*)
begin
    if(img_size_reg == 5'd4)
    begin
        for(i=0;i<16;i=i+1)
        begin
            BRIGHT_ADJUSTMENT_result[i] = (image_reg[i] >>> 1) + bias;
        end
        for(i=16;i<256;i=i+1)
        begin
            BRIGHT_ADJUSTMENT_result[i] = (image_reg[i] >>> 1) + bias;
        end
    end
    else if(img_size_reg == 5'd8)
    begin
        for(i=0;i<64;i=i+1)
        begin
            BRIGHT_ADJUSTMENT_result[i] = (image_reg[i] >>> 1) + bias;
        end
        for(i=64;i<256;i=i+1)
        begin
            BRIGHT_ADJUSTMENT_result[i] = (image_reg[i] >>> 1) + bias;
        end
    end
    else
    begin
        for(i=0;i<256;i=i+1)
        begin
            BRIGHT_ADJUSTMENT_result[i] = (image_reg[i] >>> 1) + bias;
        end
    end
end

// ===============================================================
// CROSS_CORRELATION
// ===============================================================
//      step_number
always @(*)
begin
    if(img_size_reg == 5'd4)
        step_number = 8'd15;
    else if(img_size_reg == 5'd8)
        step_number = 8'd63;
    else
        step_number = 8'd255;
end

//      finish
assign finish = (CROSS_CORRELATION_counter == step_number)? 1'b1 : 1'b0;

//      CROSS_CORRELATION_counter
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        CROSS_CORRELATION_counter <= 8'd0;
    else if(state == CROSS_CORRELATION || state == DONE || state == SAVE)
    begin
        if(finish)
            CROSS_CORRELATION_counter <= 8'd0;
        else
            CROSS_CORRELATION_counter <= CROSS_CORRELATION_counter + 8'd1;
    end
    else if(state == IDLE)
        CROSS_CORRELATION_counter <= 8'd0;
end

//      image_kernel_mult
always @(*)
begin
    for(i=0;i<9;i=i+1)
    begin
        image_kernel_mult[i] = kernel[i] * image_matrix[i];
    end
end

//      CROSS_CORRELATION_result
assign CROSS_CORRELATION_result = image_kernel_mult[0] + image_kernel_mult[1] + image_kernel_mult[2] + image_kernel_mult[3] + image_kernel_mult[4] + image_kernel_mult[5] + image_kernel_mult[6] + image_kernel_mult[7] + image_kernel_mult[8];

//      maximum_value
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        maximum_value <= 40'd0;
    else if(state == CROSS_CORRELATION)
    begin
        if(!CROSS_CORRELATION_counter)
            maximum_value <= CROSS_CORRELATION_result;
        else
        begin
            if(CROSS_CORRELATION_result > maximum_value)
                maximum_value <= CROSS_CORRELATION_result;
            else
                maximum_value <= maximum_value;
        end
    end
    else if(state == IDLE)
        maximum_value <= 40'd0;
end

//      x_coordination
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        x_coordination <= 4'd0;
    else if(state == CROSS_CORRELATION)
    begin
        if(!CROSS_CORRELATION_counter)
            x_coordination <= 4'd0;
        else
        begin
            if(CROSS_CORRELATION_result > maximum_value)
            begin
                if(img_size_reg == 5'd4)
                    x_coordination <= {2'd0, CROSS_CORRELATION_counter[3:2]};
                else if(img_size_reg == 5'd8)
                    x_coordination <= {1'b0, CROSS_CORRELATION_counter[5:3]};
                else
                    x_coordination <= CROSS_CORRELATION_counter[7:4];
            end
            else
                x_coordination <= x_coordination;
        end
    end
    else if(state == IDLE)
        x_coordination <= 4'd0;
end

//      y_coordination
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        y_coordination <= 4'd0;
    else if(state == CROSS_CORRELATION)
    begin
        if(!CROSS_CORRELATION_counter)
            y_coordination <= 4'd0;
        else
        begin
            if(CROSS_CORRELATION_result > maximum_value)
            begin
                if(img_size_reg == 5'd4)
                    y_coordination <= {2'd0, CROSS_CORRELATION_counter[1:0]};
                else if(img_size_reg == 5'd8)
                    y_coordination <= {1'b0, CROSS_CORRELATION_counter[2:0]};
                else
                    y_coordination <= CROSS_CORRELATION_counter[3:0];
            end
            else
                y_coordination <= y_coordination;
        end
    end
    else if(state == IDLE)
        y_coordination <= 4'd0;
end

//      index_1
assign index_1 = CROSS_CORRELATION_counter - img_size_reg - 8'd1;

//      index_2
assign index_2 = CROSS_CORRELATION_counter - img_size_reg;

//      index_3
assign index_3 = CROSS_CORRELATION_counter - img_size_reg + 8'd1;

//      index_4
assign index_4 = CROSS_CORRELATION_counter - 8'd1;

//      index_5
assign index_5 = CROSS_CORRELATION_counter;

//      index_6
assign index_6 = CROSS_CORRELATION_counter + 8'd1;

//      index_7
assign index_7 = CROSS_CORRELATION_counter + img_size_reg - 8'd1;

//      index_8
assign index_8 = CROSS_CORRELATION_counter + img_size_reg;

//      index_9
assign index_9 = CROSS_CORRELATION_counter + img_size_reg + 8'd1;

//      MATCHING_TEMPLATE_POSITION
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        for(i=0;i<9;i=i+1)
        begin
            MATCHING_TEMPLATE_POSITION[i] <= 8'd0;
        end
    end
    else if(state == CROSS_CORRELATION)
    begin
        if(!CROSS_CORRELATION_counter)
        begin
            if(img_size_reg == 5'd4)
            begin
                MATCHING_TEMPLATE_POSITION[0] <= 8'd0;
                MATCHING_TEMPLATE_POSITION[1] <= 8'd1;
                MATCHING_TEMPLATE_POSITION[2] <= 8'd4;
                MATCHING_TEMPLATE_POSITION[3] <= 8'd5;
            end
            else if(img_size_reg == 5'd8)
            begin
                MATCHING_TEMPLATE_POSITION[0] <= 8'd0;
                MATCHING_TEMPLATE_POSITION[1] <= 8'd1;
                MATCHING_TEMPLATE_POSITION[2] <= 8'd8;
                MATCHING_TEMPLATE_POSITION[3] <= 8'd9;
            end
            else
            begin
                MATCHING_TEMPLATE_POSITION[0] <= 8'd0;
                MATCHING_TEMPLATE_POSITION[1] <= 8'd1;
                MATCHING_TEMPLATE_POSITION[2] <= 8'd16;
                MATCHING_TEMPLATE_POSITION[3] <= 8'd17;
            end
        end
        else
        begin
            if(CROSS_CORRELATION_result > maximum_value)
            begin
                case(region)
                    4'd2 :
                    begin
                        MATCHING_TEMPLATE_POSITION[0] <= index_4;
                        MATCHING_TEMPLATE_POSITION[1] <= index_5;
                        MATCHING_TEMPLATE_POSITION[2] <= index_6;
                        MATCHING_TEMPLATE_POSITION[3] <= index_7;
                        MATCHING_TEMPLATE_POSITION[4] <= index_8;
                        MATCHING_TEMPLATE_POSITION[5] <= index_9;
                    end
                    4'd3 :
                    begin
                        MATCHING_TEMPLATE_POSITION[0] <= index_4;
                        MATCHING_TEMPLATE_POSITION[1] <= index_5;
                        MATCHING_TEMPLATE_POSITION[2] <= index_7;
                        MATCHING_TEMPLATE_POSITION[3] <= index_8;
                    end
                    4'd4 :
                    begin
                        MATCHING_TEMPLATE_POSITION[0] <= index_2;
                        MATCHING_TEMPLATE_POSITION[1] <= index_3;
                        MATCHING_TEMPLATE_POSITION[2] <= index_5;
                        MATCHING_TEMPLATE_POSITION[3] <= index_6;
                        MATCHING_TEMPLATE_POSITION[4] <= index_8;
                        MATCHING_TEMPLATE_POSITION[5] <= index_9;
                    end
                    4'd5 :
                    begin
                        MATCHING_TEMPLATE_POSITION[0] <= index_1;
                        MATCHING_TEMPLATE_POSITION[1] <= index_2;
                        MATCHING_TEMPLATE_POSITION[2] <= index_4;
                        MATCHING_TEMPLATE_POSITION[3] <= index_5;
                        MATCHING_TEMPLATE_POSITION[4] <= index_7;
                        MATCHING_TEMPLATE_POSITION[5] <= index_8;
                    end
                    4'd6 :
                    begin
                        MATCHING_TEMPLATE_POSITION[0] <= index_2;
                        MATCHING_TEMPLATE_POSITION[1] <= index_3;
                        MATCHING_TEMPLATE_POSITION[2] <= index_5;
                        MATCHING_TEMPLATE_POSITION[3] <= index_6;
                    end
                    4'd7 :
                    begin
                        MATCHING_TEMPLATE_POSITION[0] <= index_1;
                        MATCHING_TEMPLATE_POSITION[1] <= index_2;
                        MATCHING_TEMPLATE_POSITION[2] <= index_3;
                        MATCHING_TEMPLATE_POSITION[3] <= index_4;
                        MATCHING_TEMPLATE_POSITION[4] <= index_5;
                        MATCHING_TEMPLATE_POSITION[5] <= index_6;
                    end
                    4'd8 :
                    begin
                        MATCHING_TEMPLATE_POSITION[0] <= index_1;
                        MATCHING_TEMPLATE_POSITION[1] <= index_2;
                        MATCHING_TEMPLATE_POSITION[2] <= index_4;
                        MATCHING_TEMPLATE_POSITION[3] <= index_5;
                    end
                    default :
                    begin
                        MATCHING_TEMPLATE_POSITION[0] <= index_1;
                        MATCHING_TEMPLATE_POSITION[1] <= index_2;
                        MATCHING_TEMPLATE_POSITION[2] <= index_3;
                        MATCHING_TEMPLATE_POSITION[3] <= index_4;
                        MATCHING_TEMPLATE_POSITION[4] <= index_5;
                        MATCHING_TEMPLATE_POSITION[5] <= index_6;
                        MATCHING_TEMPLATE_POSITION[6] <= index_7;
                        MATCHING_TEMPLATE_POSITION[7] <= index_8;
                        MATCHING_TEMPLATE_POSITION[8] <= index_9;

                    end
                endcase
            end
            else
            begin
                for(i=0;i<9;i=i+1)
                begin
                    MATCHING_TEMPLATE_POSITION[i] <= MATCHING_TEMPLATE_POSITION[i];
                end
            end
        end
    end
    else if(state == IDLE)
    begin
        for(i=0;i<9;i=i+1)
        begin
            MATCHING_TEMPLATE_POSITION[i] <= 8'd0;
        end
    end
end

//      matching_counter
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        matching_counter <= 4'd0;
    else if(state == CROSS_CORRELATION)
    begin
        if(!CROSS_CORRELATION_counter)
            matching_counter <= 4'd3;
        else
        begin
            if(CROSS_CORRELATION_result > maximum_value)
            begin
                if(region == 4'd2 || region == 4'd4 || region == 4'd5 || region == 4'd7)
                    matching_counter <= 4'd5;
                else if(region == 4'd3 || region == 4'd6 || region == 4'd8)
                    matching_counter <= 4'd3;
                else
                    matching_counter <= 4'd8;
            end
            else
                matching_counter <= matching_counter;
        end
    end
    else if(state == IDLE)
        matching_counter <= 4'd0;
end

//      a
always @(*)
begin
    if(img_size_reg == 5'd4)
        a = (&CROSS_CORRELATION_counter[3:2]) && !(|CROSS_CORRELATION_counter[1:0]);
    else if(img_size_reg == 5'd8)
        a = (&CROSS_CORRELATION_counter[5:3]) && !(|CROSS_CORRELATION_counter[2:0]);
    else
        a = (&CROSS_CORRELATION_counter[7:4]) && !(|CROSS_CORRELATION_counter[3:0]);
end

//      b
always @(*)
begin
    if(img_size_reg == 5'd4)
        b = !(|CROSS_CORRELATION_counter[3:2]) && (&CROSS_CORRELATION_counter[1:0]);
    else if(img_size_reg == 5'd8)
        b = !(|CROSS_CORRELATION_counter[5:3]) && (&CROSS_CORRELATION_counter[2:0]);
    else
        b = !(|CROSS_CORRELATION_counter[7:4]) && (&CROSS_CORRELATION_counter[3:0]);
end

//      c
always @(*)
begin
    if(img_size_reg == 5'd4)
        c = &CROSS_CORRELATION_counter[3:0];
    else if(img_size_reg == 5'd8)
        c = &CROSS_CORRELATION_counter[5:0];
    else
        c = &CROSS_CORRELATION_counter[7:0];
end

//      d
always @(*)
begin
    if(img_size_reg == 5'd4)
        d = !(|CROSS_CORRELATION_counter[3:2]) && (|CROSS_CORRELATION_counter[1:0]) && !(&CROSS_CORRELATION_counter[1:0]);
    else if(img_size_reg == 5'd8)
        d = !(|CROSS_CORRELATION_counter[5:3]) && (|CROSS_CORRELATION_counter[2:0]) && !(&CROSS_CORRELATION_counter[2:0]);
    else
        d = !(|CROSS_CORRELATION_counter[7:4]) && (|CROSS_CORRELATION_counter[3:0]) && !(&CROSS_CORRELATION_counter[3:0]);
end

//      e
always @(*)
begin
    if(img_size_reg == 5'd4)
        e = (&CROSS_CORRELATION_counter[3:2]) && (|CROSS_CORRELATION_counter[1:0]) && !(&CROSS_CORRELATION_counter[1:0]);
    else if(img_size_reg == 5'd8)
        e = (&CROSS_CORRELATION_counter[5:3]) && (|CROSS_CORRELATION_counter[2:0]) && !(&CROSS_CORRELATION_counter[2:0]);
    else
        e = (&CROSS_CORRELATION_counter[7:4]) && (|CROSS_CORRELATION_counter[3:0]) && !(&CROSS_CORRELATION_counter[3:0]);
end

//      f
always @(*)
begin
    if(img_size_reg == 5'd4)
        f = !(&CROSS_CORRELATION_counter[3:2]) && (|CROSS_CORRELATION_counter[3:2]) && !(|CROSS_CORRELATION_counter[1:0]);
    else if(img_size_reg == 5'd8)
        f = !(&CROSS_CORRELATION_counter[5:3]) && (|CROSS_CORRELATION_counter[5:3]) && !(|CROSS_CORRELATION_counter[2:0]);
    else
        f = !(&CROSS_CORRELATION_counter[7:4]) && (|CROSS_CORRELATION_counter[7:4]) && !(|CROSS_CORRELATION_counter[3:0]);
end

//      g
always @(*)
begin
    if(img_size_reg == 5'd4)
        g = !(&CROSS_CORRELATION_counter[3:2]) && (|CROSS_CORRELATION_counter[3:2]) && (&CROSS_CORRELATION_counter[1:0]);
    else if(img_size_reg == 5'd8)
        g = !(&CROSS_CORRELATION_counter[5:3]) && (|CROSS_CORRELATION_counter[5:3]) && (&CROSS_CORRELATION_counter[2:0]);
    else
        g = !(&CROSS_CORRELATION_counter[7:4]) && (|CROSS_CORRELATION_counter[7:4]) && (&CROSS_CORRELATION_counter[3:0]);
end

//      left_up_corner
assign left_up_corner = (!CROSS_CORRELATION_counter)? 4'd1 : 4'd0;

//      left_down_corner
assign left_down_corner = (a)? 4'd6 : 4'd0;

//      right_up_corner
assign right_up_corner = (b)? 4'd3 : 4'd0;

//      right_down_corner
assign right_down_corner = (c)? 4'd8 : 4'd0;

//      up
assign up = (d)? 4'd2 : 4'd0;

//      down
assign down = (e)? 4'd7 : 4'd0;

//      left
assign left = (f)? 4'd4 : 4'd0;

//      right
assign right = (g)? 4'd5 : 4'd0;

//      region
assign region = left_up_corner + left_down_corner + right_up_corner + right_down_corner + up + down + left + right;

//      image_matrix
always @(*)
begin
    case(region)
        4'd1 :
        begin
            image_matrix[0] = 8'd0;
            image_matrix[1] = 8'd0;
            image_matrix[2] = 8'd0;
            image_matrix[3] = 8'd0;
            image_matrix[4] = image_reg[index_5];
            image_matrix[5] = image_reg[index_6];
            image_matrix[6] = 8'd0;
            image_matrix[7] = image_reg[index_8];
            image_matrix[8] = image_reg[index_9];
        end
        4'd2 :
        begin
            image_matrix[0] = 8'd0;
            image_matrix[1] = 8'd0;
            image_matrix[2] = 8'd0;
            image_matrix[3] = image_reg[index_4];
            image_matrix[4] = image_reg[index_5];
            image_matrix[5] = image_reg[index_6];
            image_matrix[6] = image_reg[index_7];
            image_matrix[7] = image_reg[index_8];
            image_matrix[8] = image_reg[index_9];
        end
        4'd3 :
        begin
            image_matrix[0] = 8'd0;
            image_matrix[1] = 8'd0;
            image_matrix[2] = 8'd0;
            image_matrix[3] = image_reg[index_4];
            image_matrix[4] = image_reg[index_5];
            image_matrix[5] = 8'd0;
            image_matrix[6] = image_reg[index_7];
            image_matrix[7] = image_reg[index_8];
            image_matrix[8] = 8'd0;
        end
        4'd4 :
        begin
            image_matrix[0] = 8'd0;
            image_matrix[1] = image_reg[index_2];
            image_matrix[2] = image_reg[index_3];
            image_matrix[3] = 8'd0;
            image_matrix[4] = image_reg[index_5];
            image_matrix[5] = image_reg[index_6];
            image_matrix[6] = 8'd0;
            image_matrix[7] = image_reg[index_8];
            image_matrix[8] = image_reg[index_9];
        end
        4'd5 :
        begin
            image_matrix[0] = image_reg[index_1];
            image_matrix[1] = image_reg[index_2];
            image_matrix[2] = 8'd0;
            image_matrix[3] = image_reg[index_4];
            image_matrix[4] = image_reg[index_5];
            image_matrix[5] = 8'd0;
            image_matrix[6] = image_reg[index_7];
            image_matrix[7] = image_reg[index_8];
            image_matrix[8] = 8'd0;
        end
        4'd6 :
        begin
            image_matrix[0] = 8'd0;
            image_matrix[1] = image_reg[index_2];
            image_matrix[2] = image_reg[index_3];
            image_matrix[3] = 8'd0;
            image_matrix[4] = image_reg[index_5];
            image_matrix[5] = image_reg[index_6];
            image_matrix[6] = 8'd0;
            image_matrix[7] = 8'd0;
            image_matrix[8] = 8'd0;
        end
        4'd7 :
        begin
            image_matrix[0] = image_reg[index_1];
            image_matrix[1] = image_reg[index_2];
            image_matrix[2] = image_reg[index_3];
            image_matrix[3] = image_reg[index_4];
            image_matrix[4] = image_reg[index_5];
            image_matrix[5] = image_reg[index_6];
            image_matrix[6] = 8'd0;
            image_matrix[7] = 8'd0;
            image_matrix[8] = 8'd0;
        end
        4'd8 :
        begin
            image_matrix[0] = image_reg[index_1];
            image_matrix[1] = image_reg[index_2];
            image_matrix[2] = 8'd0;
            image_matrix[3] = image_reg[index_4];
            image_matrix[4] = image_reg[index_5];
            image_matrix[5] = 8'd0;
            image_matrix[6] = 8'd0;
            image_matrix[7] = 8'd0;
            image_matrix[8] = 8'd0;
        end
        default :
        begin
            image_matrix[0] = image_reg[index_1];
            image_matrix[1] = image_reg[index_2];
            image_matrix[2] = image_reg[index_3];
            image_matrix[3] = image_reg[index_4];
            image_matrix[4] = image_reg[index_5];
            image_matrix[5] = image_reg[index_6];
            image_matrix[6] = image_reg[index_7];
            image_matrix[7] = image_reg[index_8];
            image_matrix[8] = image_reg[index_9];
        end
    endcase
end

//      counter
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        counter <= 4'd0;
    else if(state == DONE)
    begin
        if(counter > matching_counter)
            counter <= counter;
        else
            counter <= counter + 4'd1;
    end
    else if(state == IDLE)
        counter <= 4'd0;
end

// ===============================================================
// SRAM
// ===============================================================
//      RA2SH
RA2SH SRAM( .Q(SRAM_OUT), .CLK(clk), .CEN(SRAM_CEN), .WEN(SRAM_WEN), .A(SRAM_ADDRESS), .D(SRAM_IN), .OEN(SRAM_OEN));

//      SRAM_ADDRESS
assign SRAM_ADDRESS = CROSS_CORRELATION_counter;

//      SRAM_IN
assign SRAM_IN = CROSS_CORRELATION_result;

//      SRAM_CEN
assign SRAM_CEN = 1'b0;

//      SRAM_OEN
assign SRAM_OEN = (state == IMAGE_STORE || state == ACTION_ALGORITHM)? 1'b1 : 1'b0;

//      SRAM_WEN
assign SRAM_WEN = (state == CROSS_CORRELATION)? 1'b0 : 1'b1;

// ===============================================================
// DONE
// ===============================================================
//      out_valid
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        out_valid <= 1'b0;
    else if(state == DONE && CROSS_CORRELATION_counter)
        out_valid <= 1'b1;
    else if(state == IDLE)
        out_valid <= 1'b0;
end

//      out_x
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        out_x <= 4'd0;
    else if(state == DONE && CROSS_CORRELATION_counter)
        out_x <= x_coordination;
    else if(state == IDLE)
        out_x <= 4'd0;
end

//      out_y
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        out_y <= 4'd0;
    else if(state == DONE)
        out_y <= y_coordination;
    else if(state == IDLE)
        out_y <= 4'd0;
end

//      out_img_pos
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        out_img_pos <= 8'd0;
    else if(state == DONE)
    begin
        if(counter > matching_counter)
            out_img_pos <= 4'd0;
        else
            out_img_pos <= MATCHING_TEMPLATE_POSITION[counter];
    end
    else if(state == IDLE)
        out_img_pos <= 8'd0;
end

//      out_value
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        out_value <= 40'd0;
    else if(state == DONE)
        out_value <= SRAM_OUT;
    else if(state == IDLE)
        out_value <= 40'd0;
end

endmodule
