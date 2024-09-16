//synopsys translate_off
`include "/home/lab911_1/Desktop/7112064132/Iclab_2021_Fall/ICLAB_06/GF2k.v"
//synopsys translate_on
module GF_IA ( rst_n, clk, in_valid, in_data, deg, poly, out_data, out_valid);
input rst_n;
input clk;
input in_valid;
input [4:0] in_data;
input [2:0] deg;
input [5:0] poly;
output reg [4:0] out_data;
output reg out_valid;
// ===============================================================
// wire/reg
// ===============================================================
reg [1:0] state, next_state;
parameter DATA_STORE = 2'b00, ALGORITHM = 2'b01, DONE = 2'b10, IDLE = 2'b11;
reg [2:0] deg_r;
reg [5:0] poly_r;
wire [5:0] poly_w;
reg [4:0] array_value[0:3];
wire [4:0] array_value_w[0:3];
reg [1:0] store_counter;
reg start_store;
wire [4:0] det_A1_32, det_A2_32;
wire [4:0] det_A_32;
wire [3:0] det_A1_16, det_A2_16;
wire [3:0] det_A_16;
wire [2:0] det_A1_8, det_A2_8;
wire [2:0] det_A_8;
wire [1:0] det_A1_4, det_A2_4;
wire [1:0] det_A_4;
reg [4:0] det_A;
reg [4:0] det_Ar;
wire [4:0] det_Aw;
reg  [4:0] array_value_choose;
reg [4:0] inverse_array_value;
wire [4:0] inverse_array_value_32;
wire [3:0] inverse_array_value_16;
wire [2:0] inverse_array_value_8;
wire [1:0] inverse_array_value_4;
integer i;

// ===============================================================
// FSM
// ===============================================================
//      next_state
always @(*)
begin
    case(state)
        DATA_STORE :
        begin
            if(start_store && !in_valid)
                next_state = ALGORITHM;
            else
                next_state = DATA_STORE;
        end

        ALGORITHM :
        begin
            next_state = DONE;
        end

        DONE :
        begin
            if(store_counter == 2'd3)
                next_state = IDLE;
            else
                next_state = DONE;
        end

        IDLE :
            next_state = DATA_STORE;

        default :
            next_state = state;
    endcase
end

//      state
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        state <= DATA_STORE;
    else
        state <= next_state;
end

// ===============================================================
// DATA_STORE
// ===============================================================
//      start_store
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        start_store <= 1'b0;
    else if(state == DATA_STORE)
    begin
        if(in_valid)
            start_store <= 1'b1;
        else
            start_store <= start_store;
    end
    else if(state == IDLE)
        start_store <= 1'b0;
end

//      deg_r
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        deg_r <= 3'd0;
    else if(state == DATA_STORE)
    begin
        if(in_valid && !start_store)
            deg_r <= deg;
        else
            deg_r <= deg_r;
    end
    else if(state == IDLE)
        deg_r <= 3'd0;
end

//      poly_r
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        poly_r <= 6'd0;
    else if(state == DATA_STORE)
    begin
        if(in_valid && !start_store)
            poly_r <= poly;
        else
            poly_r <= poly_r;
    end
    else if(state == IDLE)
        poly_r <= 6'd0;
end

//      poly_w
assign poly_w = poly_r;

//      store_counter
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        store_counter <= 2'd0;
    else if(state == DATA_STORE)
    begin
        if(in_valid)
            store_counter <= store_counter + 2'd1;
        else
            store_counter <= store_counter;
    end
    else if(state == DONE)
        store_counter <= store_counter + 2'd1;
    else if(state == IDLE)
        store_counter <= 2'd0;
end

//      array_value
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        for(i=0;i<4;i=i+1)
        begin
            array_value[i] <= 5'd0;
        end
    end
    else if(state == DATA_STORE)
    begin
        if(in_valid)
            array_value[store_counter] <= in_data;
        else
            array_value[store_counter] <= array_value[store_counter];
    end
    else if(state == IDLE)
    begin
        for(i=0;i<4;i=i+1)
        begin
            array_value[i] <= 5'd0;
        end
    end
end

assign array_value_w[0] = array_value[0];
assign array_value_w[1] = array_value[1];
assign array_value_w[2] = array_value[2];
assign array_value_w[3] = array_value[3];
// ===============================================================
// ALGORITHM
// ===============================================================
//      det_A1
GF2k #(5,2) det_A1_MULT_32(.POLY(poly_w), .IN1(array_value_w[0]), .IN2(array_value_w[3]), .RESULT(det_A1_32));
GF2k #(4,2) det_A1_MULT_16(.POLY(poly_w[4:0]), .IN1(array_value_w[0][3:0]), .IN2(array_value_w[3][3:0]), .RESULT(det_A1_16));
GF2k #(3,2) det_A1_MULT_8(.POLY(poly_w[3:0]), .IN1(array_value_w[0][2:0]), .IN2(array_value_w[3][2:0]), .RESULT(det_A1_8));
GF2k #(2,2) det_A1_MULT_4(.POLY(poly_w[2:0]), .IN1(array_value_w[0][1:0]), .IN2(array_value_w[3][1:0]), .RESULT(det_A1_4));

//      det_A2
GF2k #(5,2) det_A2_MULT_32(.POLY(poly_w), .IN1(array_value_w[1]), .IN2(array_value_w[2]), .RESULT(det_A2_32));
GF2k #(4,2) det_A2_MULT_16(.POLY(poly_w[4:0]), .IN1(array_value_w[1][3:0]), .IN2(array_value_w[2][3:0]), .RESULT(det_A2_16));
GF2k #(3,2) det_A2_MULT_8(.POLY(poly_w[3:0]), .IN1(array_value_w[1][2:0]), .IN2(array_value_w[2][2:0]), .RESULT(det_A2_8));
GF2k #(2,2) det_A2_MULT_4(.POLY(poly_w[2:0]), .IN1(array_value_w[1][1:0]), .IN2(array_value_w[2][1:0]), .RESULT(det_A2_4));

//      det_A
GF2k #(5,1) det_A_SUB_32(.POLY(poly_w), .IN1(det_A1_32), .IN2(det_A2_32), .RESULT(det_A_32));
GF2k #(4,1) det_A_SUB_16(.POLY(poly_w[4:0]), .IN1(det_A1_16), .IN2(det_A2_16), .RESULT(det_A_16));
GF2k #(3,1) det_A_SUB_8(.POLY(poly_w[3:0]), .IN1(det_A1_8), .IN2(det_A2_8), .RESULT(det_A_8));
GF2k #(2,1) det_A_SUB_4(.POLY(poly_w[2:0]), .IN1(det_A1_4), .IN2(det_A2_4), .RESULT(det_A_4));

always @(*)
begin
    case(deg_r)
        3'd2:
            det_A = det_A_4;
        3'd3:
            det_A = det_A_8;
        3'd4:
            det_A = det_A_16;
        3'd5:
            det_A = det_A_32;
        default :
            det_A = 5'd0;
    endcase
end
//      det_Ar
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        det_Ar <= 5'd0;
    else if(state == ALGORITHM)
        det_Ar <= det_A;
    else if(state == IDLE)
        det_Ar <= 5'd0;
end

// ===============================================================
// DONE
// ===============================================================
assign det_Aw = det_Ar;
//      array_value_choose
always @(*)
begin
    case(store_counter)
        2'd0 :
            array_value_choose = array_value[3];
        2'd1 :
            array_value_choose = array_value[1];
        2'd2 :
            array_value_choose = array_value[2];
        2'd3 :
            array_value_choose = array_value[0];
    endcase
end

GF2k #(5,3) array_value_RESULT_32(.POLY(poly_w), .IN1(array_value_choose), .IN2(det_Aw), .RESULT(inverse_array_value_32));
GF2k #(4,3) array_value_RESULT_16(.POLY(poly_w[4:0]), .IN1(array_value_choose[3:0]), .IN2(det_Aw[3:0]), .RESULT(inverse_array_value_16));
GF2k #(3,3) array_value_RESULT_8(.POLY(poly_w[3:0]), .IN1(array_value_choose[2:0]), .IN2(det_Aw[2:0]), .RESULT(inverse_array_value_8));
GF2k #(2,3) array_value_RESULT_4(.POLY(poly_w[2:0]), .IN1(array_value_choose[1:0]), .IN2(det_Aw[1:0]), .RESULT(inverse_array_value_4));

always @(*)
begin
    if(state == DONE)
    begin
        case(deg_r)
            3'd2:
                inverse_array_value = inverse_array_value_4;
            3'd3:
                inverse_array_value = inverse_array_value_8;
            3'd4:
                inverse_array_value = inverse_array_value_16;
            3'd5:
                inverse_array_value = inverse_array_value_32;
            default :
                inverse_array_value = 5'd0;
        endcase
    end
    else
        inverse_array_value = 5'd0;
end

//      out_data
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        out_data <= 5'd0;
    else if(state == DONE)
    begin
        if(!det_Aw)
            out_data <= 5'd0;
        else
            out_data <= inverse_array_value;
    end
    else if(state == IDLE)
        out_data <= 5'd0;
end

//      out_valid
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        out_valid <= 1'b0;
    else if(state == DONE)
        out_valid <= 1'b1;
    else if(state == IDLE)
        out_valid <= 1'b0;
end

endmodule
