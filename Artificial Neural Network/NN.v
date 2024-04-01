//synopsys translate_off
`include "/cad/synopsys/synthesis/2022.03/dw/sim_ver/DW_fp_mult.v"
`include "/cad/synopsys/synthesis/2022.03/dw/sim_ver/DW_fp_add.v"
`include "/cad/synopsys/synthesis/2022.03/dw/sim_ver/DW_fp_sub.v"
//synopsys translate_on
//evince /RAID2/EDA/synopsys/synthesis/cur/dw/doc/dwbb_overview.pdf & remember execute Xwin and setenv DISPLAY youp_IP:0
module NN( clk, rst_n, in_valid_d, in_valid_t, in_valid_w1, in_valid_w2, data_point, target, weight1, weight2, out_valid, out);
//============================================================================
parameter inst_sig = 23;
parameter inst_exp = 8;
// parameter inst_ieee_compliance = 0;
parameter inst_arch = 2;
//============================================================================
input  clk;
input rst_n;
input in_valid_d;
input in_valid_t;
input in_valid_w1;
input in_valid_w2;
input [inst_sig + inst_exp:0] data_point;
input [inst_sig + inst_exp:0] target;
input [inst_sig + inst_exp:0] weight1;
input [inst_sig + inst_exp:0] weight2;
output reg	out_valid;
output reg [inst_sig + inst_exp:0] out;
//============================================================================
reg [3:0] state, next_state;
parameter DATA_STORE = 4'b0000, FORWARD_layer_1 = 4'b0001, FORWARD_layer_2 = 4'b0010, BACKWARD_layer_2 = 4'b0011, BACKWARD_layer_1 = 4'b0100, UPDATE_layer_2 = 4'b0101, UPDATE_layer_1 = 4'b0110, DONE = 4'b0111, GO = 4'b1000;
reg [3:0] weight1_counter;
reg [1:0] weight2_counter;
reg [1:0] data_point_counter;
reg [31:0] weight1_reg [0:11];
reg [31:0] weight2_reg [0:2];
reg [31:0] data_point_reg [0:3];
reg [31:0] target_reg;
reg [31:0] learning_rate;
wire [31:0] learning_rate_reg;
wire inst_ieee_compliance;
reg start;
reg [6:0] data_counter;
integer i;
//============================================================================
wire [31:0] w_1, s_1, y_1, h_1, result_1;
reg [1:0] layer_1_s_counter;
reg [3:0] layer_1_w_counter;
reg [1:0] layer_1_y_counter;
reg [31:0] layer_1_y[0:2];
//============================================================================
wire [31:0] w_2, y_2_1, y_2, h_2, result_2;
reg [1:0] layer_2_w_counter;
reg [31:0] layer_2_y;
//============================================================================
wire [31:0] y_b_2, t_1, result_B_2; //BACKWARD_layer_2
wire [31:0] w_b_1, layer_2_second_1, result_B_1;
reg [1:0] first_counter;
reg [31:0] layer_2_second;
reg [31:0] layer_2_first[0:2];
//============================================================================
wire [31:0] w_u, l_r, layer_1_y_u,result_u_2_mult_1, result_u_2_mult_2, result_u_2_sub;
wire [31:0] c;
reg [1:0] layer_2_first_counter;
wire [31:0] answer;
assign answer = 32'b00111111111000010011001100111101;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//FSM
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(*)
begin
    case(state)
        DATA_STORE :
        begin
            if(start && !in_valid_d)
                next_state = FORWARD_layer_1;
            else
                next_state = DATA_STORE;
        end

        FORWARD_layer_1 :
        begin
            if(layer_1_w_counter == 4'd11 && layer_1_y_counter == 2'd2)
                next_state = FORWARD_layer_2;
            else
                next_state = FORWARD_layer_1;
        end

        FORWARD_layer_2 :
        begin
            if(layer_2_w_counter == 2'd2)
                next_state = BACKWARD_layer_2;
            else
                next_state = FORWARD_layer_2;
        end

        BACKWARD_layer_2 :
            next_state = BACKWARD_layer_1;

        BACKWARD_layer_1 :
        begin
            if(first_counter == 2'd2)
                next_state = UPDATE_layer_2;
            else
                next_state = BACKWARD_layer_1;
        end

        UPDATE_layer_2 :
        begin
            if(layer_2_w_counter == 2'd2)
                next_state = UPDATE_layer_1;
            else
                next_state = UPDATE_layer_2;
        end

        UPDATE_layer_1 :
        begin
            if(layer_1_s_counter == 2'd3 && layer_1_w_counter == 4'd11)
                next_state = DONE;
            else
                next_state = UPDATE_layer_1;
        end

        DONE :
            next_state = GO;

        GO :
            next_state = DATA_STORE;

        default :
            next_state = state;
    endcase
end

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        state <= DATA_STORE;
    else
        state <= next_state;
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//DATA_STORE
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//data_counter
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        data_counter <= 6'd0;
    else if(state == DATA_STORE)
    begin
        if(in_valid_t)
        begin
            if(data_counter == 7'd100)
                data_counter <= 6'd0;
            else
                data_counter <= data_counter + 6'd1;
        end
        else
            data_counter <= data_counter;
    end
    else if(state == DONE)
        data_counter <= 6'd0;
end

//learning_rate
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        learning_rate <= 32'h3A83126F;
    else
        learning_rate <= learning_rate;
end

//start
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        start <= 1'b0;
    else if(state == DATA_STORE)
    begin
        if(in_valid_d)
            start <= 1'b1;
        else
            start <= start;
    end
    else if(state == DONE)
        start <= 1'b0;
end

//weight1_counter
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        weight1_counter <= 4'd0;
    else if(state == DATA_STORE)
    begin
        if(in_valid_w1)
            weight1_counter <= weight1_counter + 4'd1;
        else
            weight1_counter <= 4'd0;
    end
end

//weight2_counter
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        weight2_counter <= 2'd0;
    else if(state == DATA_STORE)
    begin
        if(in_valid_w2)
            weight2_counter <= weight2_counter + 2'd1;
        else
            weight2_counter <= 2'd0;
    end
end

//data_point_counter
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        data_point_counter <= 2'd0;
    else if(state == DATA_STORE)
    begin
        if(in_valid_d)
            data_point_counter <= data_point_counter + 2'd1;
        else
            data_point_counter <= 2'd0;
    end
end

//weight1_reg
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        for(i=0;i<12;i=i+1)
        begin
            weight1_reg[i] <= 32'd0;
        end
    end
    else if(state == DATA_STORE)
    begin
        if(in_valid_w1)
            weight1_reg[weight1_counter] <= weight1;
        else
            weight1_reg[weight1_counter] <= weight1_reg[weight1_counter];
    end
    else if(state == UPDATE_layer_1)
        weight1_reg[layer_1_w_counter] <= result_u_2_sub;
end

//weight2_reg
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        for(i=0;i<3;i=i+1)
        begin
            weight2_reg[i] <= 32'd0;
        end
    end
    else if(state == DATA_STORE)
    begin
        if(in_valid_w2)
            weight2_reg[weight2_counter] <= weight2;
        else
            weight2_reg[weight2_counter] <= weight2_reg[weight2_counter];
    end
    else if(state == UPDATE_layer_2)
        weight2_reg[layer_2_w_counter] <= result_u_2_sub;
end

//data_point_reg
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        for(i=0;i<4;i=i+1)
        begin
            data_point_reg[i] <= 32'd0;
        end
    end
    else if(state == DATA_STORE)
    begin
        if(in_valid_d)
            data_point_reg[data_point_counter] <= data_point;
        else
            data_point_reg[data_point_counter] <= data_point_reg[data_point_counter];
    end
end

//data_point_reg
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        target_reg <= 32'd0;
    else if(state == DATA_STORE)
    begin
        if(in_valid_t)
            target_reg <= target;
        else
            target_reg <= target_reg;
    end
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//FORWARD_layer_1
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//layer_1_s_counter
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        layer_1_s_counter <= 2'd0;
    else if(state == FORWARD_layer_1 || state == UPDATE_layer_1)
    begin
        if(layer_1_s_counter == 2'd3)
            layer_1_s_counter <= 2'd0;
        else
            layer_1_s_counter <= layer_1_s_counter + 2'd1;
    end
end

//layer_1_y_counter
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        layer_1_y_counter <= 2'd0;
    else if(state == FORWARD_layer_1)
    begin
        if(layer_1_s_counter == 2'd3)
        begin
            if(layer_1_y_counter == 2'd2 && layer_1_w_counter == 4'd11)
                layer_1_y_counter <=  2'd0;
            else
                layer_1_y_counter <= layer_1_y_counter + 2'd1;
        end
        else
            layer_1_y_counter <= layer_1_y_counter;
    end
end

//layer_1_w_counter
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        layer_1_w_counter <= 4'd0;
    else if(state == FORWARD_layer_1 || state == UPDATE_layer_1)              /////////////////
    begin
        if(layer_1_w_counter == 4'd11)
            layer_1_w_counter <= 4'd0;
        else
            layer_1_w_counter <= layer_1_w_counter + 4'd1;
    end
end
assign s_1 = data_point_reg[layer_1_s_counter];

assign w_1 = weight1_reg[layer_1_w_counter];

assign y_1 = layer_1_y[layer_1_y_counter];

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        for(i=0;i<3;i=i+1)
        begin
            layer_1_y[i] <= 32'd0;
        end
    end
    else if(state == FORWARD_layer_1)
    begin
        if(layer_1_w_counter == 4'd3 || layer_1_w_counter == 4'd7 || layer_1_w_counter == 4'd11)
        begin
            if(!result_1[31])
                layer_1_y[layer_1_y_counter] <= result_1;
            else
                layer_1_y[layer_1_y_counter] <= 32'd0;
        end
        else
            layer_1_y[layer_1_y_counter] <= result_1;
    end
    else if(state == DONE)
    begin
        for(i=0;i<3;i=i+1)
        begin
            layer_1_y[i] <= 32'd0;
        end
    end
end

DW_fp_mult #(23, 8, 0)
           layer_1_mult ( .a(s_1), .b(w_1), .rnd(3'b000), .z(h_1));

DW_fp_add #(23, 8, 0)
          layer_1_add ( .a(h_1), .b(y_1),.rnd(3'b000), .z(result_1));

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//FORWARD_layer_2
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//layer_2_w_counter
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        layer_2_w_counter <= 2'd0;
    else if(state == FORWARD_layer_2 || state == UPDATE_layer_2)
    begin
        if(layer_2_w_counter == 2'd2)
            layer_2_w_counter <= 2'd0;
        else
            layer_2_w_counter <= layer_2_w_counter + 2'd1;
    end
end

assign w_2 = weight2_reg[layer_2_w_counter];

assign y_2_1 = layer_1_y[layer_2_w_counter];

assign y_2 = layer_2_y;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        layer_2_y <= 32'd0;
    else if(state == FORWARD_layer_2)
        layer_2_y <= result_2;
    else if(state == DONE)
        layer_2_y <= 32'd0;
end

DW_fp_mult #(23, 8, 0)
           layer_2_mult ( .a(w_2), .b(y_2_1), .rnd(3'b000), .z(h_2));

DW_fp_add #(23, 8, 0)
          layer_2_add ( .a(h_2), .b(y_2),.rnd(3'b000), .z(result_2));

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//BACKWARD_layer_2
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
assign y_b_2 = layer_2_y;

assign t_1 = target_reg;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        layer_2_second <= 32'd0;
    else if(state == BACKWARD_layer_2)
        layer_2_second <= result_B_2;
    else if(state == DONE)
        layer_2_second <= 32'd0;
end

DW_fp_sub #(23, 8, 0)
          BACKWARD_layer_2_sub ( .a(y_b_2), .b(t_1), .rnd(3'b000), .z(result_B_2));

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//BACKWARD_layer_1
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//first_counter
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        first_counter <= 2'd0;
    else if(state == BACKWARD_layer_1)
    begin
        if(first_counter == 2'd2)
            first_counter <= 2'd0;
        else
            first_counter <= first_counter + 2'd1;
    end
end

//layer_2_first
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        for(i=0;i<3;i=i+1)
        begin
            layer_2_first[i] <= 32'd0;
        end
    end
    else if(state == BACKWARD_layer_1)
    begin
        if(!layer_1_y[first_counter])
            layer_2_first[first_counter] <= 32'd0;
        else
            layer_2_first[first_counter] <= result_B_1;
    end
    else if(state == DONE)
    begin
        for(i=0;i<3;i=i+1)
        begin
            layer_2_first[i] <= 32'd0;
        end
    end
end

assign w_b_1 = weight2_reg[first_counter];

assign layer_2_second_1 = layer_2_second;

DW_fp_mult #(23, 8, 0)
           BACKWARD_layer_1_mult ( .a(w_b_1), .b(layer_2_second_1), .rnd(3'b000), .z(result_B_1));

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//UPDATE_layer_2
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        layer_2_first_counter <= 2'd0;
    else if(state == UPDATE_layer_1)
    begin
        if(layer_1_s_counter == 2'd3)
        begin
            if(layer_2_first_counter == 2'd2)
                layer_2_first_counter <= 2'd0;
            else
                layer_2_first_counter <= layer_2_first_counter + 2'd1;
        end
        else
            layer_2_first_counter <= layer_2_first_counter;
    end
    else if(state == DONE)
        layer_2_first_counter <= 2'd0;
end

//l_r
assign l_r = learning_rate;

assign layer_1_y_u = (state == UPDATE_layer_2)? layer_1_y[layer_2_w_counter] : data_point_reg[layer_1_s_counter];
assign w_u = (state == UPDATE_layer_2)? weight2_reg[layer_2_w_counter] : weight1_reg[layer_1_w_counter];
assign c = (state == UPDATE_layer_2)? layer_2_second : layer_2_first[layer_2_first_counter];

DW_fp_mult #(23, 8, 0)
           UPDATE_layer_2_mult1 ( .a(l_r), .b(c), .rnd(3'b000), .z(result_u_2_mult_1));

DW_fp_mult #(23, 8, 0)
           UPDATE_layer_2_mult2 ( .a(layer_1_y_u), .b(result_u_2_mult_1), .rnd(3'b000), .z(result_u_2_mult_2));

DW_fp_sub #(23, 8, 0)
          UPDATE_layer_2_sub ( .a(w_u), .b(result_u_2_mult_2), .rnd(3'b000), .z(result_u_2_sub));
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//out_valid
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// assign out_valid = (state == DONE)? 1'b1 : 1'b0;

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        out_valid <= 1'b0;
    else if(state == DONE)
        out_valid <= 1'b1;
    else if(state == GO)
        out_valid <= 1'b0;
end
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//out
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// assign out = (state == DONE)? layer_2_y : 32'd0;
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        out <= 32'd0;
    else if(state == DONE)
        out <= layer_2_y;
    else if(state == GO)
        out <= 32'd0;
end
endmodule

