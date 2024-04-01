module KT( clk, rst_n, in_valid, in_x, in_y, move_num, priority_num, out_valid, out_x, out_y, move_out);
input clk,rst_n;
input in_valid;
input [2:0] in_x,in_y;
input [4:0] move_num;
input [2:0] priority_num;
output  out_valid;
output  [2:0] out_x,out_y;
output  [4:0] move_out;
//============================================================================
reg [1:0] state, next_state;
parameter DATA_STORE = 2'b00, MOVE = 2'b01, GO_BACK = 2'b10, DONE = 2'b11;
reg [2:0] in_x_reg[1:25];
reg [2:0] in_y_reg[1:25];
reg [4:0] move_num_reg;
reg [2:0] priority_num_reg;
reg start_store;
reg [4:0] store_counter;
reg  [2:0] x_move, y_move;
reg signed [2:0] x_0;
reg signed [2:0] y_0;
reg change_flag;
reg [1:24]check_flag;
wire round_check_flag;
wire round_check_flag3;
wire round_check_flag4;
reg [2:0] priority_num_counter;
reg [2:0] priority_round_check_reg [12:23];
wire a, b;
integer i;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//FSM
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(*)
begin
    case(state)
        DATA_STORE :
        begin
            if(!in_valid && start_store)
                next_state = MOVE;
            else
                next_state = DATA_STORE;
        end
        MOVE :
        begin
            if(move_num_reg == 5'd25)
                next_state = DONE;
            else
                next_state = MOVE;
        end

        DONE :
        begin
            if(store_counter == 5'd25)
                next_state = DATA_STORE;
            else
                next_state = DONE;
        end

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
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        start_store <= 1'b0;
    else if(in_valid)
        start_store <= 1'b1;
    else
        start_store <= 1'b0;
end

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        store_counter <= 5'd1;
    else if(state == DATA_STORE)
    begin
        if(in_valid)
            store_counter <= store_counter + 5'd1;
        else
            store_counter <= 5'd1;
    end
    else if(state == DONE)
    begin
        if(store_counter == 5'd25)
            store_counter <= 5'd1;
        else
            store_counter <= store_counter + 5'd1;
    end
end

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        for(i=1;i<26;i=i+1)
        begin
            in_x_reg[i] <= 3'd5;
            in_y_reg[i] <= 3'd5;
        end
    end
    else if(state == DATA_STORE && in_valid)
    begin
        in_x_reg[store_counter] <= in_x;
        in_y_reg[store_counter] <= in_y;
    end
    else if(state == MOVE)
    begin
        if(round_check_flag4)
        begin
            in_x_reg[move_num_reg - 5'd2] <= 3'd5;
            in_y_reg[move_num_reg - 5'd2] <= 3'd5;
        end
        if(round_check_flag3)
        begin
            in_x_reg[move_num_reg - 5'd1] <= 3'd5;
            in_y_reg[move_num_reg - 5'd1] <= 3'd5;
        end
        if(round_check_flag)
        begin
            in_x_reg[move_num_reg] <= 3'd5;
            in_y_reg[move_num_reg] <= 3'd5;
        end
        else if(b)
        begin
            in_x_reg[move_num_reg + 5'b1] <= x_move;
            in_y_reg[move_num_reg + 5'b1] <= y_move;
        end
    end
    else if(state == DONE && store_counter == 5'd25)
    begin
        for(i=1;i<26;i=i+1)
        begin
            in_x_reg[i] <= 3'd5;
            in_y_reg[i] <= 3'd5;
        end
    end
end

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        move_num_reg <= 5'd0;
    else if(state == DATA_STORE && in_valid && !start_store)
        move_num_reg <= move_num;
    else if(state == MOVE)
    begin
        if(round_check_flag4)
            move_num_reg <= move_num_reg - 5'd3;
        else if(round_check_flag3)
            move_num_reg <= move_num_reg - 5'd2;
        else if(round_check_flag)
            move_num_reg <= move_num_reg - 5'd1;
        else if(b)
            move_num_reg <= move_num_reg + 5'd1;
    end
end

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        priority_num_reg <= 3'd0;
    else if(state == DATA_STORE && in_valid && !start_store)
        priority_num_reg <= priority_num;
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//MOVE
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
assign a = change_flag || check_flag;
assign b = !change_flag && !check_flag;
assign round_check_flag = (a && priority_num_counter + 3'd1 == priority_num_reg)? 1'b1 : 1'b0;
assign round_check_flag3 = (round_check_flag && priority_round_check_reg[move_num_reg - 5'd1] == priority_num_reg)? 1'b1 : 1'b0;
assign round_check_flag4 = (round_check_flag3 && priority_round_check_reg[move_num_reg - 5'd2] == priority_num_reg)? 1'b1 : 1'b0;

//x_round_check_reg
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        for(i=12;i<25;i=i+1)
        begin
            priority_round_check_reg[i] <= 3'd0;
        end
    end
    else if(state == MOVE)
    begin
        if(b)
            priority_round_check_reg[move_num_reg] <= priority_num_counter + 3'd1;
        else
            priority_round_check_reg[move_num_reg] <= priority_round_check_reg[move_num_reg];
    end
    else if(state == DONE)
    begin
        for(i=12;i<25;i=i+1)
        begin
            priority_round_check_reg[i] <= 3'd0;
        end
    end
end

//priority_num_counter
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        priority_num_counter <= 3'd0;
    else if(state == DATA_STORE && in_valid && !start_store)
        priority_num_counter <= priority_num;
    else if(state == MOVE)
    begin
        if(round_check_flag4)
            priority_num_counter <= priority_round_check_reg[move_num_reg - 5'd3];
        else if(round_check_flag3)
            priority_num_counter <= priority_round_check_reg[move_num_reg - 5'd2];
        else if(round_check_flag)
            priority_num_counter <= priority_round_check_reg[move_num_reg - 5'd1];
        else if(a)
            priority_num_counter <= priority_num_counter + 3'd1;
        else
            priority_num_counter <= priority_num_reg;
    end
end

always @(*)
begin
    case(priority_num_counter)
        3'd0 :
            x_0 = 3'b111;
        3'd1 :
            x_0 = 3'b001;
        3'd2 :
            x_0 = 3'b010;
        3'd3 :
            x_0 = 3'b010;
        3'd4 :
            x_0 = 3'b001;
        3'd5 :
            x_0 = 3'b111;
        3'd6 :
            x_0 = 3'b110;
        3'd7 :
            x_0 = 3'b110;
    endcase
end

always @(*)
begin
    case(priority_num_counter)
        3'd0 :
            y_0 = 3'b010;
        3'd1 :
            y_0 = 3'b010;
        3'd2 :
            y_0 = 3'b001;
        3'd3 :
            y_0 = 3'b111;
        3'd4 :
            y_0 = 3'b110;
        3'd5 :
            y_0 = 3'b110;
        3'd6 :
            y_0 = 3'b111;
        3'd7 :
            y_0 = 3'b001;
    endcase
end
//x_move
always @(*)
begin
    x_move = $signed(in_x_reg[move_num_reg]) + x_0;
end

//y_move
always @(*)
begin
    y_move = $signed(in_y_reg[move_num_reg]) + y_0;
end

//change_flag
always @(*)
begin
    if(state == MOVE)
    begin
        if(x_move > 3'd4 || y_move > 3'd4)
            change_flag = 1'b1;
        else
            change_flag = 1'b0;
    end
    else
        change_flag = 1'b0;
end

//check_flag
always @(*)
begin
    if(state == MOVE)
    begin
        for(i=1;i<25;i=i+1)
        begin
            if(in_x_reg[i] == x_move && in_y_reg[i] == y_move)
                check_flag[i] = 1'b1;
            else
                check_flag[i] = 1'b0;
        end
    end
    else
        check_flag = 1'b0;
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//out_valid
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
assign out_valid =(state == DONE)? 1'b1 : 1'b0;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//out_x && out_y
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
assign out_x = (state == DONE)? in_x_reg[store_counter] : 3'd0;
assign out_y = (state == DONE)? in_y_reg[store_counter] : 3'd0;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//move_out
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
assign move_out = (state == DONE)? store_counter : 5'd0;
endmodule

