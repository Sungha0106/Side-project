module SET ( clk , rst, en, central, radius, mode, busy, valid, candidate);
input clk;
input rst;
input en;
input [23:0] central;
input [11:0] radius;
input [1:0] mode;
output reg busy;
output reg valid;
output reg [7:0] candidate;
// ===============================================================
// wire/reg
// ===============================================================
reg [2:0] state, next_state;
parameter DATA_STORE = 3'b000, ALGORITHM = 3'b001, DONE = 3'b010, IDLE = 3'b011;
reg [3:0] A_X, A_Y, B_X, B_Y, C_X, C_Y;
reg [3:0] A_radius, B_radius, C_radius;
reg [1:0] mode_select;
reg start;
wire [3:0] A_X_check, A_Y_check, B_X_check, B_Y_check, C_X_check, C_Y_check;
reg A_check, B_check, C_check;
wire [3:0] A_X_range, A_Y_range, B_X_range, B_Y_range, C_X_range, C_Y_range;
reg [3:0] x_axis, y_axis;

// ===============================================================
// FSM
// ===============================================================
//      next_state
always @(*)
begin
    case(state)
        DATA_STORE :
        begin
            if(start)
                next_state = ALGORITHM;
            else
                next_state = DATA_STORE;
        end

        ALGORITHM :
        begin
            if(x_axis == 4'd8 && y_axis == 4'd8)
                next_state = DONE;
            else
                next_state = ALGORITHM;
        end

        DONE :
            next_state = IDLE;

        IDLE :
            next_state = DATA_STORE;
        default :
            next_state = state;
    endcase
end

//      state
always @(posedge clk or posedge rst)
begin
    if(rst)
        state <= DATA_STORE;
    else
        state <= next_state;
end

// ===============================================================
// DATA_STORE
// ===============================================================
//      start
always @(posedge clk or posedge rst)
begin
    if(rst)
        start <= 1'b0;
    else if(state == DATA_STORE)
        start <= en;
    else if(state == IDLE)
        start <= 1'b0;
end
//      A_X
always @(posedge clk or posedge rst)
begin
    if(rst)
        A_X <= 4'd0;
    else if(state == DATA_STORE)
    begin
        if(en)
            A_X <= central[23:20];
        else
            A_X <= A_X;
    end
end

//      A_Y
always @(posedge clk or posedge rst)
begin
    if(rst)
        A_Y <= 4'd0;
    else if(state == DATA_STORE)
    begin
        if(en)
            A_Y <= central[19:16];
        else
            A_Y <= A_Y;
    end
end

//      B_X
always @(posedge clk or posedge rst)
begin
    if(rst)
        B_X <= 4'd0;
    else if(state == DATA_STORE)
    begin
        if(en)
            B_X <= central[15:12];
        else
            B_X <= B_X;
    end
end

//      B_Y
always @(posedge clk or posedge rst)
begin
    if(rst)
        B_Y <= 4'd0;
    else if(state == DATA_STORE)
    begin
        if(en)
            B_Y <= central[11:8];
        else
            B_Y <= B_Y;
    end
end

//      C_X
always @(posedge clk or posedge rst)
begin
    if(rst)
        C_X <= 4'd0;
    else if(state == DATA_STORE)
    begin
        if(en)
            C_X <= central[7:4];
        else
            C_X <= C_X;
    end
end

//      C_Y
always @(posedge clk or posedge rst)
begin
    if(rst)
        C_Y <= 4'd0;
    else if(state == DATA_STORE)
    begin
        if(en)
            C_Y <= central[3:0];
        else
            C_Y <= C_Y;
    end
end

//      A_radius
always @(posedge clk or posedge rst)
begin
    if(rst)
        A_radius <= 4'd0;
    else if(state == DATA_STORE)
    begin
        if(en)
            A_radius <= radius[11:8];
        else
            A_radius <= A_radius;
    end
end

//      B_radius
always @(posedge clk or posedge rst)
begin
    if(rst)
        B_radius <= 4'd0;
    else if(state == DATA_STORE)
    begin
        if(en)
            B_radius <= radius[7:4];
        else
            B_radius <= B_radius;
    end
end

//      C_radius
always @(posedge clk or posedge rst)
begin
    if(rst)
        C_radius <= 4'd0;
    else if(state == DATA_STORE)
    begin
        if(en)
            C_radius <= radius[3:0];
        else
            C_radius <= C_radius;
    end
end

//      mode_select
always @(posedge clk or posedge rst)
begin
    if(rst)
        mode_select <= 2'd0;
    else if(state == DATA_STORE)
    begin
        if(en)
            mode_select <= mode;
        else
            mode_select <= mode_select;
    end
end

// ===============================================================
// ALGORITHM
// ===============================================================
//      x_axis
always @(posedge clk or posedge rst)
begin
    if(rst)
        x_axis <= 4'd1;
    else if(state == ALGORITHM)
    begin
        if(x_axis == 4'd8)
            x_axis <= 4'd1;
        else
            x_axis <= x_axis + 4'd1;
    end
end

//      y_axis
always @(posedge clk or posedge rst)
begin
    if(rst)
        y_axis <= 4'd1;
    else if(state == ALGORITHM)
    begin
        if(x_axis == 4'd8)
        begin
            if(y_axis == 4'd8)
                y_axis <= 4'd1;
            else
                y_axis <= y_axis + 4'd1;
        end
        else
            y_axis <= y_axis;
    end
end

//      A_X_check
assign A_X_check = (A_X > x_axis)? A_X - x_axis : x_axis - A_X;

//      A_Y_check
assign A_Y_check = (A_Y > y_axis)? A_Y - y_axis : y_axis - A_Y;

//      B_X_check
assign B_X_check = (B_X > x_axis)? B_X - x_axis : x_axis - B_X;

//      B_Y_check
assign B_Y_check = (B_Y > y_axis)? B_Y - y_axis : y_axis - B_Y;

//      C_X_check
assign C_X_check = (C_X > x_axis)? C_X - x_axis : x_axis - C_X;

//      C_Y_check
assign C_Y_check = (C_Y > y_axis)? C_Y - y_axis : y_axis - C_Y;

//      A_X_range
assign A_X_range =  A_radius - 4'd1;

//      A_Y_range
assign A_Y_range =  A_radius - 4'd1;

//      B_X_range
assign B_X_range =  B_radius - 4'd1;

//      B_Y_range
assign B_Y_range =  B_radius - 4'd1;

//      C_X_range
assign C_X_range =  C_radius - 4'd1;

//      C_Y_range
assign C_Y_range =  C_radius - 4'd1;

//      A_check
always @(*)
begin
    if(A_X_check > A_radius || A_Y_check > A_radius )
        A_check = 1'b0;
    else if(A_X_check == 4'd0)
    begin
        if(A_Y_check > A_radius)
            A_check = 1'b0;
        else
            A_check = 1'b1;
    end
    else if(A_X_check == A_radius)
    begin
        if(A_Y_check == 4'd0)
            A_check = 1'b1;
        else
            A_check = 1'b0;
    end
    else
    begin
        if(A_X_check > A_X_range || A_Y_check > A_Y_range)
            A_check = 1'b0;
        else
        begin
            case(A_radius)
                4'd4 :
                begin
                    if(A_X_check > 4'd2 && A_Y_check > 4'd2)
                        A_check = 1'b0;
                    else
                        A_check = 1'b1;
                end
                4'd5 :
                begin
                    if(A_X_check > 4'd3 && A_Y_check > 4'd3)
                        A_check = 1'b0;
                    else
                        A_check = 1'b1;
                end
                4'd6 :
                begin
                    if((A_X_check > 4'd3 && A_Y_check > 4'd4) || (A_X_check > 4'd4 && A_Y_check > 4'd3))
                        A_check = 1'b0;
                    else
                        A_check = 1'b1;
                end
                4'd7 :
                begin
                    if((A_X_check > 4'd3 && A_Y_check > 4'd5) || (A_X_check > 4'd5 && A_Y_check > 4'd3))
                        A_check = 1'b0;
                    else
                        A_check = 1'b1;
                end
                default :
                    A_check = 1'b1;
            endcase
        end
    end
end

//      B_check
always @(*)
begin
    if(B_X_check > B_radius || B_Y_check > B_radius)
        B_check = 1'b0;
    else if(B_X_check == 4'd0)
    begin
        if(B_Y_check > B_radius)
            B_check = 1'b0;
        else
            B_check = 1'b1;
    end
    else if(B_X_check == B_radius)
    begin
        if(B_Y_check == 4'd0)
            B_check = 1'b1;
        else
            B_check = 1'b0;
    end
    else
    begin
        if(B_X_check > B_X_range || B_Y_check > B_Y_range)
            B_check = 1'b0;
        else
        begin
            case(B_radius)
                4'd4 :
                begin
                    if(B_X_check > 4'd2 && B_Y_check > 4'd2)
                        B_check = 1'b0;
                    else
                        B_check = 1'b1;
                end
                4'd5 :
                begin
                    if(B_X_check > 4'd3 && B_Y_check > 4'd3)
                        B_check = 1'b0;
                    else
                        B_check = 1'b1;
                end
                4'd6 :
                begin
                    if((B_X_check > 4'd3 && B_Y_check > 4'd4) || (B_X_check > 4'd4 && B_Y_check > 4'd3))
                        B_check = 1'b0;
                    else
                        B_check = 1'b1;
                end
                4'd7 :
                begin
                    if((B_X_check > 4'd3 && B_Y_check > 4'd5) || (B_X_check > 4'd5 && B_Y_check > 4'd3))
                        B_check = 1'b0;
                    else
                        B_check = 1'b1;
                end
                default :
                    B_check = 1'b1;
            endcase
        end
    end
end

//      C_check
always @(*)
begin
    if(C_X_check > C_radius || C_Y_check > C_radius)
        C_check = 1'b0;
    else if(C_X_check == 4'd0)
    begin
        if(C_Y_check > C_radius)
            C_check = 1'b0;
        else
            C_check = 1'b1;
    end
    else if(C_X_check == C_radius)
    begin
        if(C_Y_check == 4'd0)
            C_check = 1'b1;
        else
            C_check = 1'b0;
    end
    else
    begin
        if(C_X_check > C_X_range || C_Y_check > C_Y_range)
            C_check = 1'b0;
        else
        begin
            case(C_radius)
                4'd4 :
                begin
                    if(C_X_check > 4'd2 && C_Y_check > 4'd2)
                        C_check = 1'b0;
                    else
                        C_check = 1'b1;
                end
                4'd5 :
                begin
                    if(C_X_check > 4'd3 && C_Y_check > 4'd3)
                        C_check = 1'b0;
                    else
                        C_check = 1'b1;
                end
                4'd6 :
                begin
                    if((C_X_check > 4'd3 && C_Y_check > 4'd4) || (C_X_check > 4'd4 && C_Y_check > 4'd3))
                        C_check = 1'b0;
                    else
                        C_check = 1'b1;
                end
                4'd7 :
                begin
                    if((C_X_check > 4'd3 && C_Y_check > 4'd5) || (C_X_check > 4'd5 && C_Y_check > 4'd3))
                        C_check = 1'b0;
                    else
                        C_check = 1'b1;
                end
                default :
                    C_check = 1'b1;
            endcase
        end
    end
end

// ===============================================================
// busy
// ===============================================================
always @(posedge clk or posedge rst)
begin
    if(rst)
        busy <= 1'b0;
    else if(state == ALGORITHM)
        busy <= 1'b1;
    else if(state == IDLE)
        busy <= 1'b0;
end

// ===============================================================
// valid
// ===============================================================
always @(posedge clk or posedge rst)
begin
    if(rst)
        valid <= 1'b0;
    else if(state == DONE)
        valid <= 1'b1;
    else if(state == IDLE)
        valid <= 1'b0;
end

// ===============================================================
// candidate
// ===============================================================
always @(posedge clk or posedge rst)
begin
    if(rst)
        candidate <= 8'd0;
    else if(state == ALGORITHM)
    begin
        case(mode_select)
            2'd0 :
            begin
                if(A_check)
                    candidate <= candidate + 8'd1;
                else
                    candidate <= candidate;
            end

            2'd1 :
            begin
                if(A_check && B_check)
                    candidate <= candidate + 8'd1;
                else
                    candidate <= candidate;
            end

            2'd2 :
            begin
                if(A_check ^ B_check)
                    candidate <= candidate + 8'd1;
                else
                    candidate <= candidate;
            end

            2'd3 :
            begin
                if((A_check && B_check && !C_check) || (A_check && !B_check && C_check) || (!A_check && B_check && C_check))
                    candidate <= candidate + 8'd1;
                else
                    candidate <= candidate;
            end
        endcase
    end
    else if(state == IDLE)
        candidate <= 8'd0;
end

endmodule

