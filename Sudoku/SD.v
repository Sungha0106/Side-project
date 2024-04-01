module SD( clk, rst_n, in_valid, in, out_valid, out);
input clk;
input rst_n;
input in_valid;
input [3:0] in;
output reg out_valid;
output reg [3:0] out;
//============================================================================
reg [2:0] state, next_state;
parameter  DATA_STORE = 3'b000, SOLVE = 3'b001, WRONG = 3'b010, DONE = 3'b011, GO = 3'b100;
reg [3:0] puzzle[1:9][1:9];
reg [3:0] blank_x[1:15];
reg [3:0] blank_y[1:15];
reg [3:0] blank_counter;
reg [3:0] store_counter_x, store_counter_y;
reg [1:0] x_step_counter, y_step_counter;
reg [3:0] number_counter;
reg [1:9] check_x, check_y;
reg check_region;
wire next, back, back2, back3;
wire wrong;
reg number_repeat;
reg wrong_detect;
reg [1:9] wrong_detect_x, wrong_detect_y;
reg wrong_detect_region;
reg [3:0] wrong_region_state_x[1:4];
reg [3:0] wrong_region_state_y[1:4];
reg [3:0] region_state_x[1:4];
reg [3:0] region_state_y[1:4];
wire [3:0] counter_1, counter_2, counter_3;
reg [3:0] index_x1, index_x2, index_x3, index_x4;
reg [3:0] index_y1, index_y2, index_y3, index_y4;
// wire [3:0] out_wire ;
integer i, j;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//FSM
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(*)
begin
    case(state)
        DATA_STORE :
        begin
            if(store_counter_x == 4'd9 && store_counter_y == 4'd9)
                next_state = SOLVE;
            else
                next_state = DATA_STORE;
        end

        SOLVE :
        begin
            if(wrong || number_repeat)
                next_state = WRONG;
            else if(blank_counter == 4'd15 && next)
                next_state = DONE;
            else
                next_state = SOLVE;
        end

        WRONG :
            next_state = GO;

        DONE :
        begin
            if(blank_counter == 4'd15)
                next_state = GO;
            else
                next_state = DONE;
        end

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
//store_counter_x
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        store_counter_x <= 4'd1;
    else if(state == DATA_STORE)
    begin
        if(in_valid)
        begin
            if(store_counter_x == 4'd9)
            begin
                if(store_counter_y == 4'd9)
                    store_counter_x <= 4'd9;
                else
                    store_counter_x <= 4'd1;
            end
            else
                store_counter_x <= store_counter_x + 4'd1;
        end
        else
            store_counter_x <= store_counter_x;
    end
    else if(state == GO)
        store_counter_x <= 4'd1;
end

//store_counter_y
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        store_counter_y <= 4'd1;
    else if(state == DATA_STORE)
    begin
        if(store_counter_x == 4'd9)
        begin
            if(store_counter_y == 4'd9)
                store_counter_y <= 4'd9;
            else
                store_counter_y <= store_counter_y + 4'd1;
        end
        else
            store_counter_y <= store_counter_y;
    end
    else if(state == GO)
        store_counter_y <= 4'd1;
end

//puzzle
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        for(i=1;i<10;i=i+1)
        begin
            for(j=1;j<10;j=j+1)
            begin
                puzzle[j][i] <= 4'd11;
            end
        end
    end
    else if(state == DATA_STORE)
    begin
        if(in_valid)
            puzzle[store_counter_y][store_counter_x] <= in;
        else
        begin
            for(i=1;i<10;i=i+1)
            begin
                for(j=1;j<10;j=j+1)
                begin
                    puzzle[j][i] <= puzzle[j][i];
                end
            end
        end
    end
    else if(state == SOLVE)
    begin
        if(back3)
        begin
            puzzle[index_y4][index_x4] <= 4'd0;
            puzzle[index_y3][index_x3] <= 4'd0;
            puzzle[index_y2][index_x2] <= 4'd0;
        end
        else if(back2)
        begin
            puzzle[index_y3][index_x3] <= 4'd0;
            puzzle[index_y2][index_x2] <= 4'd0;
        end
        else if(back)
            puzzle[index_y2][index_x2] <= 4'd0;
        else if(next)
            puzzle[index_y1][index_x1] <= number_counter;
        else
        begin
            for(i=1;i<10;i=i+1)
            begin
                for(j=1;j<10;j=j+1)
                begin
                    puzzle[j][i] <= puzzle[j][i];
                end
            end
        end
    end
    else if(state == GO)
    begin
        for(i=1;i<10;i=i+1)
        begin
            for(j=1;j<10;j=j+1)
            begin
                puzzle[j][i] <= 4'd11;
            end
        end
    end
end

//      index_x1
always @(*)
begin
    case(blank_counter)
        4'd0 :
            index_x1 = 4'd0;
        4'd1 :
            index_x1 = blank_x[1];
        4'd2 :
            index_x1 = blank_x[2];
        4'd3 :
            index_x1 = blank_x[3];
        4'd4 :
            index_x1 = blank_x[4];
        4'd5 :
            index_x1 = blank_x[5];
        4'd6 :
            index_x1 = blank_x[6];
        4'd7 :
            index_x1 = blank_x[7];
        4'd8 :
            index_x1 = blank_x[8];
        4'd9 :
            index_x1 = blank_x[9];
        4'd10 :
            index_x1 = blank_x[10];
        4'd11 :
            index_x1 = blank_x[11];
        4'd12 :
            index_x1 = blank_x[12];
        4'd13 :
            index_x1 = blank_x[13];
        4'd14 :
            index_x1 = blank_x[14];
        4'd15 :
            index_x1 = blank_x[15];
    endcase
end

//      index_y1
always @(*)
begin
    case(blank_counter)
        4'd0 :
            index_y1 = 4'd0;
        4'd1 :
            index_y1 = blank_y[1];
        4'd2 :
            index_y1 = blank_y[2];
        4'd3 :
            index_y1 = blank_y[3];
        4'd4 :
            index_y1 = blank_y[4];
        4'd5 :
            index_y1 = blank_y[5];
        4'd6 :
            index_y1 = blank_y[6];
        4'd7 :
            index_y1 = blank_y[7];
        4'd8 :
            index_y1 = blank_y[8];
        4'd9 :
            index_y1 = blank_y[9];
        4'd10 :
            index_y1 = blank_y[10];
        4'd11 :
            index_y1 = blank_y[11];
        4'd12 :
            index_y1 = blank_y[12];
        4'd13 :
            index_y1 = blank_y[13];
        4'd14 :
            index_y1 = blank_y[14];
        4'd15 :
            index_y1 = blank_y[15];
    endcase
end

assign counter_1 = blank_counter - 4'd1;
//      index_x2
always @(*)
begin
    case(counter_1)
        4'd0 :
            index_x2 = 4'd0;
        4'd1 :
            index_x2 = blank_x[1];
        4'd2 :
            index_x2 = blank_x[2];
        4'd3 :
            index_x2 = blank_x[3];
        4'd4 :
            index_x2 = blank_x[4];
        4'd5 :
            index_x2 = blank_x[5];
        4'd6 :
            index_x2 = blank_x[6];
        4'd7 :
            index_x2 = blank_x[7];
        4'd8 :
            index_x2 = blank_x[8];
        4'd9 :
            index_x2 = blank_x[9];
        4'd10 :
            index_x2 = blank_x[10];
        4'd11 :
            index_x2 = blank_x[11];
        4'd12 :
            index_x2 = blank_x[12];
        4'd13 :
            index_x2 = blank_x[13];
        4'd14 :
            index_x2 = blank_x[14];
        4'd15 :
            index_x2 = blank_x[15];
    endcase
end

//      index_y2
always @(*)
begin
    case(counter_1)
        4'd0 :
            index_y2 = 4'd0;
        4'd1 :
            index_y2 = blank_y[1];
        4'd2 :
            index_y2 = blank_y[2];
        4'd3 :
            index_y2 = blank_y[3];
        4'd4 :
            index_y2 = blank_y[4];
        4'd5 :
            index_y2 = blank_y[5];
        4'd6 :
            index_y2 = blank_y[6];
        4'd7 :
            index_y2 = blank_y[7];
        4'd8 :
            index_y2 = blank_y[8];
        4'd9 :
            index_y2 = blank_y[9];
        4'd10 :
            index_y2 = blank_y[10];
        4'd11 :
            index_y2 = blank_y[11];
        4'd12 :
            index_y2 = blank_y[12];
        4'd13 :
            index_y2 = blank_y[13];
        4'd14 :
            index_y2 = blank_y[14];
        4'd15 :
            index_y2 = blank_y[15];
    endcase
end

assign counter_2 = blank_counter - 4'd2;
//      index_x3
always @(*)
begin
    case(counter_2)
        4'd0 :
            index_x3 = 4'd0;
        4'd1 :
            index_x3 = blank_x[1];
        4'd2 :
            index_x3 = blank_x[2];
        4'd3 :
            index_x3 = blank_x[3];
        4'd4 :
            index_x3 = blank_x[4];
        4'd5 :
            index_x3 = blank_x[5];
        4'd6 :
            index_x3 = blank_x[6];
        4'd7 :
            index_x3 = blank_x[7];
        4'd8 :
            index_x3 = blank_x[8];
        4'd9 :
            index_x3 = blank_x[9];
        4'd10 :
            index_x3 = blank_x[10];
        4'd11 :
            index_x3 = blank_x[11];
        4'd12 :
            index_x3 = blank_x[12];
        4'd13 :
            index_x3 = blank_x[13];
        4'd14 :
            index_x3 = blank_x[14];
        4'd15 :
            index_x3 = blank_x[15];
    endcase
end

//      index_y3
always @(*)
begin
    case(counter_2)
        4'd0 :
            index_y3 = 4'd0;
        4'd1 :
            index_y3 = blank_y[1];
        4'd2 :
            index_y3 = blank_y[2];
        4'd3 :
            index_y3 = blank_y[3];
        4'd4 :
            index_y3 = blank_y[4];
        4'd5 :
            index_y3 = blank_y[5];
        4'd6 :
            index_y3 = blank_y[6];
        4'd7 :
            index_y3 = blank_y[7];
        4'd8 :
            index_y3 = blank_y[8];
        4'd9 :
            index_y3 = blank_y[9];
        4'd10 :
            index_y3 = blank_y[10];
        4'd11 :
            index_y3 = blank_y[11];
        4'd12 :
            index_y3 = blank_y[12];
        4'd13 :
            index_y3 = blank_y[13];
        4'd14 :
            index_y3 = blank_y[14];
        4'd15 :
            index_y3 = blank_y[15];
    endcase
end

assign counter_3 = blank_counter - 4'd3;
//      index_x4
always @(*)
begin
    case(counter_3)
        4'd0 :
            index_x4 = 4'd0;
        4'd1 :
            index_x4 = blank_x[1];
        4'd2 :
            index_x4 = blank_x[2];
        4'd3 :
            index_x4 = blank_x[3];
        4'd4 :
            index_x4 = blank_x[4];
        4'd5 :
            index_x4 = blank_x[5];
        4'd6 :
            index_x4 = blank_x[6];
        4'd7 :
            index_x4 = blank_x[7];
        4'd8 :
            index_x4 = blank_x[8];
        4'd9 :
            index_x4 = blank_x[9];
        4'd10 :
            index_x4 = blank_x[10];
        4'd11 :
            index_x4 = blank_x[11];
        4'd12 :
            index_x4 = blank_x[12];
        4'd13 :
            index_x4 = blank_x[13];
        4'd14 :
            index_x4 = blank_x[14];
        4'd15 :
            index_x4 = blank_x[15];
    endcase
end

//      index_y4
always @(*)
begin
    case(counter_3)
        4'd0 :
            index_y4 = 4'd0;
        4'd1 :
            index_y4 = blank_y[1];
        4'd2 :
            index_y4 = blank_y[2];
        4'd3 :
            index_y4 = blank_y[3];
        4'd4 :
            index_y4 = blank_y[4];
        4'd5 :
            index_y4 = blank_y[5];
        4'd6 :
            index_y4 = blank_y[6];
        4'd7 :
            index_y4 = blank_y[7];
        4'd8 :
            index_y4 = blank_y[8];
        4'd9 :
            index_y4 = blank_y[9];
        4'd10 :
            index_y4 = blank_y[10];
        4'd11 :
            index_y4 = blank_y[11];
        4'd12 :
            index_y4 = blank_y[12];
        4'd13 :
            index_y4 = blank_y[13];
        4'd14 :
            index_y4 = blank_y[14];
        4'd15 :
            index_y4 = blank_y[15];
    endcase
end
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//SOLVE
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//next
assign next = (state == SOLVE)? !(check_x || check_y || check_region)? 1'b1 : 1'b0 : 1'b0;

//back
assign back = (state == SOLVE)? (number_counter == 4'd9 && (check_x || check_y || check_region))? 1'b1 : 1'b0 : 1'b0;

//back2
assign back2 =  (back && puzzle[index_y2][index_x2] == 4'd9)? 1'b1 : 1'b0;

//back3
assign back3 =  (back2 && puzzle[index_y3][index_x3] == 4'd9)? 1'b1 : 1'b0;

//blank_counter
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        blank_counter <= 4'd1;
    else
    begin
        case(state)
            DATA_STORE :
            begin
                if(in_valid)
                begin
                    if(in == 4'd0)
                        blank_counter <= blank_counter + 4'd1;
                    else
                        blank_counter <= blank_counter;
                end
                else
                    blank_counter <= blank_counter;
            end
            SOLVE :
            begin
                if(back3)
                    blank_counter <= blank_counter - 4'd3;
                else if(back2)
                    blank_counter <= blank_counter - 4'd2;
                else if(back)
                    blank_counter <= blank_counter - 4'd1;
                else if(next)
                begin
                    if(blank_counter == 4'd15)
                        blank_counter <= 4'd1;
                    else
                        blank_counter <= blank_counter + 4'd1;
                end
                else
                    blank_counter <= blank_counter;
            end
            WRONG :
                blank_counter <= 4'd1;
            DONE :
            begin
                if(blank_counter == 4'd15)
                    blank_counter <= 4'd1;
                else
                    blank_counter <= blank_counter + 4'd1;
            end
        endcase
    end
end

//blank_x && blank_y
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        for(i=1;i<16;i=i+1)
        begin
            blank_x[i] <= 4'd0;
        end
    end
    else if(state == DATA_STORE)
    begin
        if(in_valid)
        begin
            if(in == 4'd0)
            begin
                blank_x[blank_counter] <= store_counter_x;
            end
            else
            begin
                for(i=1;i<16;i=i+1)
                begin
                    blank_x[i] <= blank_x[i];
                end
            end
        end
        else
        begin
            for(i=1;i<16;i=i+1)
            begin
                blank_x[i] <= blank_x[i];
            end
        end
    end
    else if(state == GO)
    begin
        for(i=1;i<16;i=i+1)
        begin
            blank_x[i] <= 4'd0;
        end
    end
end

//blank_x && blank_y
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        for(i=1;i<16;i=i+1)
        begin
            blank_y[i] <= 4'd0;
        end
    end
    else if(state == DATA_STORE)
    begin
        if(in_valid)
        begin
            if(in == 4'd0)
            begin
                blank_y[blank_counter] <= store_counter_y;
            end
            else
            begin
                for(i=1;i<16;i=i+1)
                begin
                    blank_y[i] <= blank_y[i];
                end
            end
        end
        else
        begin
            for(i=1;i<16;i=i+1)
            begin
                blank_y[i] <= blank_y[i];
            end
        end
    end
    else if(state == GO)
    begin
        for(i=1;i<16;i=i+1)
        begin
            blank_y[i] <= 4'd0;
        end
    end
end

//number_counter
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        number_counter <= 4'd15;
    else if(state == SOLVE)
    begin
        if(back3)
            number_counter <= puzzle[index_y4][index_x4] + 4'd1;
        else if(back2)
            number_counter <= puzzle[index_y3][index_x3] + 4'd1;
        else if(back)
            number_counter <= puzzle[index_y2][index_x2] + 4'd1;
        else if(next)
            number_counter <= 4'd1;
        else
            number_counter <= number_counter + 4'd1;
    end
    else if(state == GO)
        number_counter <= 4'd15;
end

//check_x
always @(*)
begin
    if(state == SOLVE)
    begin
        for(i=1;i<10;i=i+1)
        begin
            if(puzzle[index_y1][i] == number_counter)
                check_x[i] = 1'b1;
            else
                check_x[i] = 1'b0;
        end
    end
    else
        check_x = 9'd0;
end


//check_y
always @(*)
begin
    if(state == SOLVE)
    begin
        for(i=1;i<10;i=i+1)
        begin
            if(puzzle[i][index_x1] == number_counter)
                check_y[i] = 1'b1;
            else
                check_y[i] = 1'b0;
        end
    end
    else
        check_y = 9'd0;
end

//check_region
always @(*)
begin
    if(state == SOLVE)
    begin
        if(puzzle[region_state_y[1]][region_state_x[1]] == number_counter || puzzle[region_state_y[2]][region_state_x[2]] == number_counter
                || puzzle[region_state_y[3]][region_state_x[3]] == number_counter || puzzle[region_state_y[4]][region_state_x[4]] == number_counter)
            check_region = 1'b1;
        else
            check_region = 1'b0;
    end
    else
        check_region = 1'b0;
end

//region_state_x && region_state_y
always @(*)
begin
    if(blank_x[blank_counter] == 4'd1 || blank_x[blank_counter] == 4'd4 || blank_x[blank_counter] == 4'd7)
    begin
        if(blank_y[blank_counter] == 4'd1 || blank_y[blank_counter] == 4'd4 || blank_y[blank_counter] == 4'd7)
        begin
            region_state_x[1] = blank_x[blank_counter] + 4'd1;
            region_state_y[1] = blank_y[blank_counter] + 4'd1;
            region_state_x[2] = blank_x[blank_counter] + 4'd2;
            region_state_y[2] = blank_y[blank_counter] + 4'd1;
            region_state_x[3] = blank_x[blank_counter] + 4'd1;
            region_state_y[3] = blank_y[blank_counter] + 4'd2;
            region_state_x[4] = blank_x[blank_counter] + 4'd2;
            region_state_y[4] = blank_y[blank_counter] + 4'd2;
        end
        else if(blank_y[blank_counter] == 4'd2 || blank_y[blank_counter] == 4'd5 || blank_y[blank_counter] == 4'd8)
        begin
            region_state_x[1] = blank_x[blank_counter] + 4'd1;
            region_state_y[1] = blank_y[blank_counter] - 4'd1;
            region_state_x[2] = blank_x[blank_counter] + 4'd2;
            region_state_y[2] = blank_y[blank_counter] - 4'd1;
            region_state_x[3] = blank_x[blank_counter] + 4'd1;
            region_state_y[3] = blank_y[blank_counter] + 4'd1;
            region_state_x[4] = blank_x[blank_counter] + 4'd2;
            region_state_y[4] = blank_y[blank_counter] + 4'd1;
        end
        else
        begin
            region_state_x[1] = blank_x[blank_counter] + 4'd1;
            region_state_y[1] = blank_y[blank_counter] - 4'd2;
            region_state_x[2] = blank_x[blank_counter] + 4'd2;
            region_state_y[2] = blank_y[blank_counter] - 4'd2;
            region_state_x[3] = blank_x[blank_counter] + 4'd1;
            region_state_y[3] = blank_y[blank_counter] - 4'd1;
            region_state_x[4] = blank_x[blank_counter] + 4'd2;
            region_state_y[4] = blank_y[blank_counter] - 4'd1;
        end
    end
    else if(blank_x[blank_counter] == 4'd2 || blank_x[blank_counter] == 4'd5 || blank_x[blank_counter] == 4'd8)
    begin
        if(blank_y[blank_counter] == 4'd1 || blank_y[blank_counter] == 4'd4 || blank_y[blank_counter] == 4'd7)
        begin
            region_state_x[1] = blank_x[blank_counter] - 4'd1;
            region_state_y[1] = blank_y[blank_counter] + 4'd1;
            region_state_x[2] = blank_x[blank_counter] + 4'd1;
            region_state_y[2] = blank_y[blank_counter] + 4'd1;
            region_state_x[3] = blank_x[blank_counter] - 4'd1;
            region_state_y[3] = blank_y[blank_counter] + 4'd2;
            region_state_x[4] = blank_x[blank_counter] + 4'd1;
            region_state_y[4] = blank_y[blank_counter] + 4'd2;
        end
        else if(blank_y[blank_counter] == 4'd2 || blank_y[blank_counter] == 4'd5 || blank_y[blank_counter] == 4'd8)
        begin
            region_state_x[1] = blank_x[blank_counter] - 4'd1;
            region_state_y[1] = blank_y[blank_counter] - 4'd1;
            region_state_x[2] = blank_x[blank_counter] + 4'd1;
            region_state_y[2] = blank_y[blank_counter] - 4'd1;
            region_state_x[3] = blank_x[blank_counter] - 4'd1;
            region_state_y[3] = blank_y[blank_counter] + 4'd1;
            region_state_x[4] = blank_x[blank_counter] + 4'd1;
            region_state_y[4] = blank_y[blank_counter] + 4'd1;
        end
        else
        begin
            region_state_x[1] = blank_x[blank_counter] - 4'd1;
            region_state_y[1] = blank_y[blank_counter] - 4'd2;
            region_state_x[2] = blank_x[blank_counter] + 4'd1;
            region_state_y[2] = blank_y[blank_counter] - 4'd2;
            region_state_x[3] = blank_x[blank_counter] - 4'd1;
            region_state_y[3] = blank_y[blank_counter] - 4'd1;
            region_state_x[4] = blank_x[blank_counter] + 4'd1;
            region_state_y[4] = blank_y[blank_counter] - 4'd1;
        end
    end
    else
    begin
        if(blank_y[blank_counter] == 4'd1 || blank_y[blank_counter] == 4'd4 || blank_y[blank_counter] == 4'd7)
        begin
            region_state_x[1] = blank_x[blank_counter] - 4'd2;
            region_state_y[1] = blank_y[blank_counter] + 4'd1;
            region_state_x[2] = blank_x[blank_counter] - 4'd1;
            region_state_y[2] = blank_y[blank_counter] + 4'd1;
            region_state_x[3] = blank_x[blank_counter] - 4'd2;
            region_state_y[3] = blank_y[blank_counter] + 4'd2;
            region_state_x[4] = blank_x[blank_counter] - 4'd1;
            region_state_y[4] = blank_y[blank_counter] + 4'd2;
        end
        else if(blank_y[blank_counter] == 4'd2 || blank_y[blank_counter] == 4'd5 || blank_y[blank_counter] == 4'd8)
        begin
            region_state_x[1] = blank_x[blank_counter] - 4'd2;
            region_state_y[1] = blank_y[blank_counter] - 4'd1;
            region_state_x[2] = blank_x[blank_counter] - 4'd1;
            region_state_y[2] = blank_y[blank_counter] - 4'd1;
            region_state_x[3] = blank_x[blank_counter] - 4'd2;
            region_state_y[3] = blank_y[blank_counter] + 4'd1;
            region_state_x[4] = blank_x[blank_counter] - 4'd1;
            region_state_y[4] = blank_y[blank_counter] + 4'd1;
        end
        else
        begin
            region_state_x[1] = blank_x[blank_counter] - 4'd2;
            region_state_y[1] = blank_y[blank_counter] - 4'd2;
            region_state_x[2] = blank_x[blank_counter] - 4'd1;
            region_state_y[2] = blank_y[blank_counter] - 4'd2;
            region_state_x[3] = blank_x[blank_counter] - 4'd2;
            region_state_y[3] = blank_y[blank_counter] - 4'd1;
            region_state_x[4] = blank_x[blank_counter] - 4'd1;
            region_state_y[4] = blank_y[blank_counter] - 4'd1;
        end
    end
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//WRONG
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//wrong_detect_x
always @(*)
begin
    if(in_valid)
    begin
        for(i=1;i<10;i=i+1)
        begin
            if(puzzle[store_counter_y][i] == in)
                wrong_detect_x[i] = 1'b1;
            else
                wrong_detect_x[i] = 1'b0;
        end
    end
    else
        wrong_detect_x = 9'd0;
end

//wrong_detect_y
always @(*)
begin
    if(in_valid)
    begin
        for(i=1;i<10;i=i+1)
        begin
            if(puzzle[i][store_counter_x] == in)
                wrong_detect_y[i] = 1'b1;
            else
                wrong_detect_y[i] = 1'b0;
        end
    end
    else
        wrong_detect_y = 9'd0;
end

//wrong_detect_region
always @(*)
begin
    if(in_valid)
    begin
        if(puzzle[wrong_region_state_y[1]][wrong_region_state_x[1]] == in || puzzle[wrong_region_state_y[2]][wrong_region_state_x[2]] == in
                || puzzle[wrong_region_state_y[3]][wrong_region_state_x[3]] == in || puzzle[wrong_region_state_y[4]][wrong_region_state_x[4]] == in)
            wrong_detect_region = 1'b1;
        else
            wrong_detect_region = 1'b0;
    end
    else
        wrong_detect_region = 1'b0;
end


//wrong_detect
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        wrong_detect <= 1'b0;
    else if(state == SOLVE)
    begin
        if(puzzle[blank_y[1]][blank_x[1]] == 4'd9)
            wrong_detect <= 1'b1;
        else
            wrong_detect <= 1'b0;
    end
    else if(state == WRONG)
        wrong_detect <= 1'b0;
end

//wrong
assign wrong = (state == SOLVE)? (wrong_detect)?(blank_counter == 4'd3 && back2)? 1'b1 :(blank_counter == 4'd2 && back)? 1'b1 : 1'b0 :(blank_counter == 4'd1 && back) ? 1'b1 : 1'b0 : 1'b0;

//number_repeat
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        number_repeat <= 1'b0;
    else if(state == DATA_STORE)
    begin
        if(in_valid)
        begin
            if(in)
            begin
                if(wrong_detect_x || wrong_detect_y || wrong_detect_region)
                    number_repeat <= 1'b1;
                else
                    number_repeat <= number_repeat;
            end
            else
                number_repeat <= number_repeat;
        end
        else
            number_repeat <= number_repeat;
    end
    else if(state == GO)
        number_repeat <= 1'b0;
end

//wrong_region_state_x && wrong_region_state_y
always @(*)
begin
    if(store_counter_x == 4'd1 || store_counter_x == 4'd4 || store_counter_x == 4'd7)
    begin
        if(store_counter_y == 4'd1 || store_counter_y == 4'd4 || store_counter_y == 4'd7)
        begin
            wrong_region_state_x[1] = store_counter_x + 4'd1;
            wrong_region_state_y[1] = store_counter_y + 4'd1;
            wrong_region_state_x[2] = store_counter_x + 4'd2;
            wrong_region_state_y[2] = store_counter_y + 4'd1;
            wrong_region_state_x[3] = store_counter_x + 4'd1;
            wrong_region_state_y[3] = store_counter_y + 4'd2;
            wrong_region_state_x[4] = store_counter_x + 4'd2;
            wrong_region_state_y[4] = store_counter_y + 4'd2;
        end
        else if(store_counter_y == 4'd2 || store_counter_y == 4'd5 || store_counter_y == 4'd8)
        begin
            wrong_region_state_x[1] = store_counter_x + 4'd1;
            wrong_region_state_y[1] = store_counter_y - 4'd1;
            wrong_region_state_x[2] = store_counter_x + 4'd2;
            wrong_region_state_y[2] = store_counter_y - 4'd1;
            wrong_region_state_x[3] = store_counter_x + 4'd1;
            wrong_region_state_y[3] = store_counter_y + 4'd1;
            wrong_region_state_x[4] = store_counter_x + 4'd2;
            wrong_region_state_y[4] = store_counter_y + 4'd1;
        end
        else
        begin
            wrong_region_state_x[1] = store_counter_x + 4'd1;
            wrong_region_state_y[1] = store_counter_y - 4'd2;
            wrong_region_state_x[2] = store_counter_x + 4'd2;
            wrong_region_state_y[2] = store_counter_y - 4'd2;
            wrong_region_state_x[3] = store_counter_x + 4'd1;
            wrong_region_state_y[3] = store_counter_y - 4'd1;
            wrong_region_state_x[4] = store_counter_x + 4'd2;
            wrong_region_state_y[4] = store_counter_y - 4'd1;
        end
    end
    else if(store_counter_x == 4'd2 || store_counter_x == 4'd5 || store_counter_x == 4'd8)
    begin
        if(store_counter_y == 4'd1 || store_counter_y == 4'd4 || store_counter_y == 4'd7)
        begin
            wrong_region_state_x[1] = store_counter_x - 4'd1;
            wrong_region_state_y[1] = store_counter_y + 4'd1;
            wrong_region_state_x[2] = store_counter_x + 4'd1;
            wrong_region_state_y[2] = store_counter_y + 4'd1;
            wrong_region_state_x[3] = store_counter_x - 4'd1;
            wrong_region_state_y[3] = store_counter_y + 4'd2;
            wrong_region_state_x[4] = store_counter_x + 4'd1;
            wrong_region_state_y[4] = store_counter_y + 4'd2;
        end
        else if(store_counter_y == 4'd2 || store_counter_y == 4'd5 || store_counter_y == 4'd8)
        begin
            wrong_region_state_x[1] = store_counter_x - 4'd1;
            wrong_region_state_y[1] = store_counter_y - 4'd1;
            wrong_region_state_x[2] = store_counter_x + 4'd1;
            wrong_region_state_y[2] = store_counter_y - 4'd1;
            wrong_region_state_x[3] = store_counter_x - 4'd1;
            wrong_region_state_y[3] = store_counter_y + 4'd1;
            wrong_region_state_x[4] = store_counter_x + 4'd1;
            wrong_region_state_y[4] = store_counter_y + 4'd1;
        end
        else
        begin
            wrong_region_state_x[1] = store_counter_x - 4'd1;
            wrong_region_state_y[1] = store_counter_y - 4'd2;
            wrong_region_state_x[2] = store_counter_x + 4'd1;
            wrong_region_state_y[2] = store_counter_y - 4'd2;
            wrong_region_state_x[3] = store_counter_x - 4'd1;
            wrong_region_state_y[3] = store_counter_y - 4'd1;
            wrong_region_state_x[4] = store_counter_x + 4'd1;
            wrong_region_state_y[4] = store_counter_y - 4'd1;
        end
    end
    else
    begin
        if(store_counter_y == 4'd1 || store_counter_y == 4'd4 || store_counter_y == 4'd7)
        begin
            wrong_region_state_x[1] = store_counter_x - 4'd2;
            wrong_region_state_y[1] = store_counter_y + 4'd1;
            wrong_region_state_x[2] = store_counter_x - 4'd1;
            wrong_region_state_y[2] = store_counter_y + 4'd1;
            wrong_region_state_x[3] = store_counter_x - 4'd2;
            wrong_region_state_y[3] = store_counter_y + 4'd2;
            wrong_region_state_x[4] = store_counter_x - 4'd1;
            wrong_region_state_y[4] = store_counter_y + 4'd2;
        end
        else if(store_counter_y == 4'd2 || store_counter_y == 4'd5 || store_counter_y == 4'd8)
        begin
            wrong_region_state_x[1] = store_counter_x - 4'd2;
            wrong_region_state_y[1] = store_counter_y - 4'd1;
            wrong_region_state_x[2] = store_counter_x - 4'd1;
            wrong_region_state_y[2] = store_counter_y - 4'd1;
            wrong_region_state_x[3] = store_counter_x - 4'd2;
            wrong_region_state_y[3] = store_counter_y + 4'd1;
            wrong_region_state_x[4] = store_counter_x - 4'd1;
            wrong_region_state_y[4] = store_counter_y + 4'd1;
        end
        else
        begin
            wrong_region_state_x[1] = store_counter_x - 4'd2;
            wrong_region_state_y[1] = store_counter_y - 4'd2;
            wrong_region_state_x[2] = store_counter_x - 4'd1;
            wrong_region_state_y[2] = store_counter_y - 4'd2;
            wrong_region_state_x[3] = store_counter_x - 4'd2;
            wrong_region_state_y[3] = store_counter_y - 4'd1;
            wrong_region_state_x[4] = store_counter_x - 4'd1;
            wrong_region_state_y[4] = store_counter_y - 4'd1;
        end
    end
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//out_valid
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        out_valid <= 1'b0;
    else
    begin
        case(state)
            WRONG :
                out_valid <= 1'b1;
            DONE :
                out_valid <= 1'b1;
            GO :
                out_valid <= 1'b0;
        endcase
    end
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//out
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        out <= 4'd0;
    else
    begin
        case(state)
            WRONG :
                out <= 4'd10;
            DONE :
                out <= puzzle[index_y1][index_x1];
            GO :
                out <= 4'd0;
        endcase
    end
end

endmodule
