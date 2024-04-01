module huffman(clk, reset, gray_valid, gray_data, CNT_valid, CNT1, CNT2, CNT3, CNT4, CNT5, CNT6,code_valid, HC1, HC2, HC3, HC4, HC5, HC6, M1, M2, M3, M4, M5, M6);
input clk;
input reset;
input gray_valid;
input [7:0] gray_data;
output reg CNT_valid;
output reg [7:0] CNT1, CNT2, CNT3, CNT4, CNT5, CNT6;
output reg code_valid;
output reg [7:0] HC1, HC2, HC3, HC4, HC5, HC6;
output reg [7:0] M1, M2, M3, M4, M5, M6;
//----------------------------------------------------------------------------------
reg [3:0] state, next_state;
parameter [3:0] DATA_READ = 4'b0000, CNT_STORE = 4'b0001, INITIALIZATION = 4'b0010, COMBINATION = 4'b0011, REORDER = 4'b0100, SPLIT = 4'b0101, MAKE_HUFFMAN = 4'b0110, DONE = 4'b0111;
reg [6:0] counter1;
reg [7:0] INITIALIZATION_reg[1:6];
reg [2:0] INITIALIZATION_counter;
reg [2:0] REORDER_counter;
reg [17:0] INITIALIZATION_number[1:6];
reg [2:0] INITIALIZATION_number_reg[1:6];
reg [14:0] COMBINATION_number_reg[1:8];
reg [2:0] SPLIT_counter;
integer i;
//----------------------------------------------------------------------------------
//			FSM_NEXT_STATE
always @(*)
begin
    case(state)
        DATA_READ :
        begin
            if(counter1 == 7'd99)
                next_state = CNT_STORE;
            else
                next_state = DATA_READ;
        end
        CNT_STORE :
            next_state = INITIALIZATION;

        INITIALIZATION :
        begin
            if(INITIALIZATION_counter == 3'd5)
                next_state = COMBINATION;
            else
                next_state = INITIALIZATION;
        end

        COMBINATION :
            next_state = REORDER;

        REORDER :
        begin
            if(REORDER_counter == 3'd4)
                next_state = SPLIT;
            else
                next_state = COMBINATION;
        end

        SPLIT :
        begin
            if(SPLIT_counter == 3'd4)
                next_state = MAKE_HUFFMAN;
            else
                next_state = SPLIT;
        end

        MAKE_HUFFMAN :
            next_state = DONE;

        DONE :
            next_state = DONE;

        default :
            next_state = state;
    endcase
end
//			FSM_STATE
always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= DATA_READ;
    else
        state <= next_state;
end

//			counter1
always @(posedge clk or posedge reset)
begin
    if(reset)
        counter1 <= 7'd0;
    else if(state == DATA_READ)
    begin
        if(gray_valid)
        begin
            if(counter1 == 7'd99)
                counter1 <= 7'd0;
            else
                counter1 <= counter1 + 7'd1;
        end
        else
            counter1 <= 7'd0;
    end
    else
        counter1 <= counter1;
end

//			DATA_READ_CNT1
always @(posedge clk or posedge reset)
begin
    if(reset)
        CNT1 <= 8'd0;
    else if(state ==DATA_READ)
    begin
        if(gray_valid)
        begin
            if(gray_data == 8'd1)
                CNT1 <= CNT1 + 8'd1;
            else
                CNT1 <= CNT1;
        end
        else
            CNT1 <= CNT1;
    end
    else
        CNT1 <= CNT1;
end

//			DATA_READ_CNT2
always @(posedge clk or posedge reset)
begin
    if(reset)
        CNT2 <= 8'd0;
    else if(state ==DATA_READ)
    begin
        if(gray_valid)
        begin
            if(gray_data == 8'd2)
                CNT2 <= CNT2 + 8'd1;
            else
                CNT2 <= CNT2;
        end
        else
            CNT2 <= CNT2;
    end
    else
        CNT2 <= CNT2;
end

//			DATA_READ_CNT3
always @(posedge clk or posedge reset)
begin
    if(reset)
        CNT3 <= 8'd0;
    else if(state ==DATA_READ)
    begin
        if(gray_valid)
        begin
            if(gray_data == 8'd3)
                CNT3 <= CNT3 + 8'd1;
            else
                CNT3 <= CNT3;
        end
        else
            CNT3 <= CNT3;
    end
    else
        CNT3 <= CNT3;
end

//			DATA_READ_CNT4
always @(posedge clk or posedge reset)
begin
    if(reset)
        CNT4 <= 8'd0;
    else if(state ==DATA_READ)
    begin
        if(gray_valid)
        begin
            if(gray_data == 8'd4)
                CNT4 <= CNT4 + 8'd1;
            else
                CNT4 <= CNT4;
        end
        else
            CNT4 <= CNT4;
    end
    else
        CNT4 <= CNT4;
end

//			DATA_READ_CNT5
always @(posedge clk or posedge reset)
begin
    if(reset)
        CNT5 <= 8'd0;
    else if(state ==DATA_READ)
    begin
        if(gray_valid)
        begin
            if(gray_data == 8'd5)
                CNT5 <= CNT5 + 8'd1;
            else
                CNT5 <= CNT5;
        end
        else
            CNT5 <= CNT5;
    end
    else
        CNT5 <= CNT5;
end

//			DATA_READ_CNT6
always @(posedge clk or posedge reset)
begin
    if(reset)
        CNT6 <= 8'd0;
    else if(state ==DATA_READ)
    begin
        if(gray_valid)
        begin
            if(gray_data == 8'd6)
                CNT6 <= CNT6 + 8'd1;
            else
                CNT6 <= CNT6;
        end
        else
            CNT6 <= CNT6;
    end
    else
        CNT6 <= CNT6;
end

//          INITIALIZATION_counter
always @(posedge clk or posedge reset)
begin
    if(reset)
        INITIALIZATION_counter <= 3'd0;
    else if(state == INITIALIZATION)
    begin
        if(INITIALIZATION_counter == 3'd5)
            INITIALIZATION_counter <= 3'd0;
        else
            INITIALIZATION_counter <= INITIALIZATION_counter + 3'd1;
    end
    else if(state == COMBINATION)
    begin
        if(INITIALIZATION_counter == 3'd4)
            INITIALIZATION_counter <= 3'd4;
        else
            INITIALIZATION_counter <= INITIALIZATION_counter + 3'd1;
    end
    else
        INITIALIZATION_counter <= INITIALIZATION_counter;
end

//          REORDER_counter
always @(posedge clk or posedge reset)
begin
    if(reset)
        REORDER_counter <= 3'd0;
    else if(state == REORDER)
    begin
        if(REORDER_counter == 3'd4)
            REORDER_counter <= REORDER_counter;
        else
            REORDER_counter <= REORDER_counter + 3'd1;
    end

    else
        REORDER_counter <= REORDER_counter;
end

//          SPLIT_counter
always @(posedge clk or posedge reset)
begin
    if(reset)
        SPLIT_counter <= 3'd0;
    else if(state == SPLIT)
    begin
        if(SPLIT_counter == 3'd4)
            SPLIT_counter <= SPLIT_counter;
        else
            SPLIT_counter <= SPLIT_counter + 3'd1;
    end
    else
        SPLIT_counter <= SPLIT_counter;
end

//          INITIALIZATION
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        for(i=1;i<7;i=i+1)
        begin
            INITIALIZATION_reg[i] <= 8'd0;
        end
    end
    else if(state == CNT_STORE)
    begin
        INITIALIZATION_reg[1] <= CNT1;
        INITIALIZATION_reg[2] <= CNT2;
        INITIALIZATION_reg[3] <= CNT3;
        INITIALIZATION_reg[4] <= CNT4;
        INITIALIZATION_reg[5] <= CNT5;
        INITIALIZATION_reg[6] <= CNT6;
    end
    else if(state == INITIALIZATION)
    begin
        if(INITIALIZATION_counter == 3'd0 || INITIALIZATION_counter == 3'd2 || INITIALIZATION_counter == 3'd4)
        begin
            begin
                if(INITIALIZATION_reg[1] >= INITIALIZATION_reg[2])
                begin
                    INITIALIZATION_reg[1] <= INITIALIZATION_reg[1];
                    INITIALIZATION_reg[2] <=  INITIALIZATION_reg[2];
                end
                else
                begin
                    INITIALIZATION_reg[1] <= INITIALIZATION_reg[2];
                    INITIALIZATION_reg[2] <= INITIALIZATION_reg[1];
                end
            end
            begin
                if(INITIALIZATION_reg[3] >= INITIALIZATION_reg[4])
                begin
                    INITIALIZATION_reg[3] <= INITIALIZATION_reg[3];
                    INITIALIZATION_reg[4] <= INITIALIZATION_reg[4];
                end
                else
                begin
                    INITIALIZATION_reg[3] <= INITIALIZATION_reg[4];
                    INITIALIZATION_reg[4] <= INITIALIZATION_reg[3];
                end
            end
            begin
                if(INITIALIZATION_reg[5] >= INITIALIZATION_reg[6])
                begin
                    INITIALIZATION_reg[5] <= INITIALIZATION_reg[5];
                    INITIALIZATION_reg[6] <= INITIALIZATION_reg[6];
                end
                else
                begin
                    INITIALIZATION_reg[5] <= INITIALIZATION_reg[6];
                    INITIALIZATION_reg[6] <= INITIALIZATION_reg[5];
                end
            end
        end
        else
        begin
            begin
                if(INITIALIZATION_reg[2] >= INITIALIZATION_reg[3])
                begin
                    INITIALIZATION_reg[2] <= INITIALIZATION_reg[2];
                    INITIALIZATION_reg[3] <=  INITIALIZATION_reg[3];
                end
                else
                begin
                    INITIALIZATION_reg[2] <= INITIALIZATION_reg[3];
                    INITIALIZATION_reg[3] <= INITIALIZATION_reg[2];
                end
            end
            begin
                if(INITIALIZATION_reg[4] >= INITIALIZATION_reg[5])
                begin
                    INITIALIZATION_reg[4] <= INITIALIZATION_reg[4];
                    INITIALIZATION_reg[5] <= INITIALIZATION_reg[5];
                end
                else
                begin
                    INITIALIZATION_reg[4] <= INITIALIZATION_reg[5];
                    INITIALIZATION_reg[5] <= INITIALIZATION_reg[4];
                end
            end
        end
    end
    else if(state == COMBINATION)
    begin
        case(INITIALIZATION_counter)
            3'd0 :
            begin
                INITIALIZATION_reg[5] <= INITIALIZATION_reg[5] + INITIALIZATION_reg[6];
            end

            3'd1 :
            begin
                INITIALIZATION_reg[4] <= INITIALIZATION_reg[4] + INITIALIZATION_reg[5];
            end

            3'd2 :
            begin
                INITIALIZATION_reg[3] <= INITIALIZATION_reg[3] + INITIALIZATION_reg[4];
            end

            3'd3 :
            begin
                INITIALIZATION_reg[2] <= INITIALIZATION_reg[2] + INITIALIZATION_reg[3];
            end

            default :
            begin
                for(i=1;i<7;i=i+1)
                begin
                    INITIALIZATION_reg[i] <= INITIALIZATION_reg[i];
                end
            end
        endcase
    end
    else if(state == REORDER)
    begin
        case(REORDER_counter)
            3'd0 :
            begin
                if(INITIALIZATION_reg[5] > INITIALIZATION_reg[1])
                begin
                    INITIALIZATION_reg[1] <= INITIALIZATION_reg[5];
                    INITIALIZATION_reg[2] <= INITIALIZATION_reg[1];
                    INITIALIZATION_reg[3] <= INITIALIZATION_reg[2];
                    INITIALIZATION_reg[4] <= INITIALIZATION_reg[3];
                    INITIALIZATION_reg[5] <= INITIALIZATION_reg[4];
                end
                else if(INITIALIZATION_reg[5] > INITIALIZATION_reg[2])
                begin
                    INITIALIZATION_reg[2] <= INITIALIZATION_reg[5];
                    INITIALIZATION_reg[3] <= INITIALIZATION_reg[2];
                    INITIALIZATION_reg[4] <= INITIALIZATION_reg[3];
                    INITIALIZATION_reg[5] <= INITIALIZATION_reg[4];
                end
                else if(INITIALIZATION_reg[5] > INITIALIZATION_reg[3])
                begin
                    INITIALIZATION_reg[3] <= INITIALIZATION_reg[5];
                    INITIALIZATION_reg[4] <= INITIALIZATION_reg[3];
                    INITIALIZATION_reg[5] <= INITIALIZATION_reg[4];
                end
                else if(INITIALIZATION_reg[5] > INITIALIZATION_reg[4])
                begin
                    INITIALIZATION_reg[4] <= INITIALIZATION_reg[5];
                    INITIALIZATION_reg[5] <= INITIALIZATION_reg[4];
                end
                else
                begin
                    for(i=1;i<7;i=i+1)
                    begin
                        INITIALIZATION_reg[i] <= INITIALIZATION_reg[i];
                    end
                end
            end

            3'd1 :
            begin
                if(INITIALIZATION_reg[4] > INITIALIZATION_reg[1])
                begin
                    INITIALIZATION_reg[1] <= INITIALIZATION_reg[4];
                    INITIALIZATION_reg[2] <= INITIALIZATION_reg[1];
                    INITIALIZATION_reg[3] <= INITIALIZATION_reg[2];
                    INITIALIZATION_reg[4] <= INITIALIZATION_reg[3];
                end
                else if(INITIALIZATION_reg[4] > INITIALIZATION_reg[2])
                begin
                    INITIALIZATION_reg[2] <= INITIALIZATION_reg[4];
                    INITIALIZATION_reg[3] <= INITIALIZATION_reg[2];
                    INITIALIZATION_reg[4] <= INITIALIZATION_reg[3];
                end
                else if(INITIALIZATION_reg[4] > INITIALIZATION_reg[3])
                begin
                    INITIALIZATION_reg[3] <= INITIALIZATION_reg[4];
                    INITIALIZATION_reg[4] <= INITIALIZATION_reg[3];
                end
                else
                begin
                    for(i=1;i<7;i=i+1)
                    begin
                        INITIALIZATION_reg[i] <= INITIALIZATION_reg[i];
                    end
                end
            end

            3'd2 :
            begin
                if(INITIALIZATION_reg[3] > INITIALIZATION_reg[1])
                begin
                    INITIALIZATION_reg[1] <= INITIALIZATION_reg[3];
                    INITIALIZATION_reg[2] <= INITIALIZATION_reg[1];
                    INITIALIZATION_reg[3] <= INITIALIZATION_reg[2];
                end
                else if(INITIALIZATION_reg[3] > INITIALIZATION_reg[2])
                begin
                    INITIALIZATION_reg[2] <= INITIALIZATION_reg[3];
                    INITIALIZATION_reg[3] <= INITIALIZATION_reg[2];
                end
                else
                begin
                    for(i=1;i<7;i=i+1)
                    begin
                        INITIALIZATION_reg[i] <= INITIALIZATION_reg[i];
                    end
                end
            end

            3'd3 :
            begin
                if(INITIALIZATION_reg[2] > INITIALIZATION_reg[1])
                begin
                    INITIALIZATION_reg[1] <= INITIALIZATION_reg[2];
                    INITIALIZATION_reg[2] <= INITIALIZATION_reg[1];
                end
                else
                begin
                    for(i=1;i<7;i=i+1)
                    begin
                        INITIALIZATION_reg[i] <= INITIALIZATION_reg[i];
                    end
                end
            end


            default :
            begin
                for(i=1;i<7;i=i+1)
                begin
                    INITIALIZATION_reg[i] <= INITIALIZATION_reg[i];
                end
            end
        endcase
    end
    else
    begin
        for(i=1;i<7;i=i+1)
        begin
            INITIALIZATION_reg[i] <= INITIALIZATION_reg[i];
        end
    end
end


//          INITIALIZATION_number
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        INITIALIZATION_number[1] <= 18'd1;
        INITIALIZATION_number[2] <= 18'd2;
        INITIALIZATION_number[3] <= 18'd3;
        INITIALIZATION_number[4] <= 18'd4;
        INITIALIZATION_number[5] <= 18'd5;
        INITIALIZATION_number[6] <= 18'd6;
    end
    else if(state == INITIALIZATION)
    begin
        if(INITIALIZATION_counter == 3'd0 || INITIALIZATION_counter == 3'd2 || INITIALIZATION_counter == 3'd4)
        begin
            begin
                if(INITIALIZATION_reg[1] >= INITIALIZATION_reg[2])
                begin
                    INITIALIZATION_number[1] <= INITIALIZATION_number[1];
                    INITIALIZATION_number[2] <=  INITIALIZATION_number[2];
                end
                else
                begin
                    INITIALIZATION_number[1] <= INITIALIZATION_number[2];
                    INITIALIZATION_number[2] <= INITIALIZATION_number[1];
                end
            end
            begin
                if(INITIALIZATION_reg[3] >= INITIALIZATION_reg[4])
                begin
                    INITIALIZATION_number[3] <= INITIALIZATION_number[3];
                    INITIALIZATION_number[4] <= INITIALIZATION_number[4];
                end
                else
                begin
                    INITIALIZATION_number[3] <= INITIALIZATION_number[4];
                    INITIALIZATION_number[4] <= INITIALIZATION_number[3];
                end
            end
            begin
                if(INITIALIZATION_reg[5] >= INITIALIZATION_reg[6])
                begin
                    INITIALIZATION_number[5] <= INITIALIZATION_number[5];
                    INITIALIZATION_number[6] <= INITIALIZATION_number[6];
                end
                else
                begin
                    INITIALIZATION_number[5] <= INITIALIZATION_number[6];
                    INITIALIZATION_number[6] <= INITIALIZATION_number[5];
                end
            end
        end
        else
        begin
            begin
                if(INITIALIZATION_reg[2] >= INITIALIZATION_reg[3])
                begin
                    INITIALIZATION_number[2] <= INITIALIZATION_number[2];
                    INITIALIZATION_number[3] <=  INITIALIZATION_number[3];
                end
                else
                begin
                    INITIALIZATION_number[2] <= INITIALIZATION_number[3];
                    INITIALIZATION_number[3] <= INITIALIZATION_number[2];
                end
            end
            begin
                if(INITIALIZATION_reg[4] >= INITIALIZATION_reg[5])
                begin
                    INITIALIZATION_number[4] <= INITIALIZATION_number[4];
                    INITIALIZATION_number[5] <= INITIALIZATION_number[5];
                end
                else
                begin
                    INITIALIZATION_number[4] <= INITIALIZATION_number[5];
                    INITIALIZATION_number[5] <= INITIALIZATION_number[4];
                end
            end
        end
    end
    else if(state == COMBINATION)
    begin
        case(INITIALIZATION_counter)
            3'd0 :
            begin
                INITIALIZATION_number[5][5:0] <= {INITIALIZATION_number[5][2:0],INITIALIZATION_number[6][2:0]};
                INITIALIZATION_number[6] <= 18'd0;
            end

            3'd1 :
            begin
                if(INITIALIZATION_number[5][5:3] != 3'b000)
                begin
                    INITIALIZATION_number[4][8:0] <= {INITIALIZATION_number[4][2:0],INITIALIZATION_number[5][5:0]};
                    INITIALIZATION_number[5] <= 18'd0;
                end
                else if(INITIALIZATION_number[4][5:3] != 3'b000)
                begin
                    INITIALIZATION_number[4][8:0] <= {INITIALIZATION_number[4][5:0],INITIALIZATION_number[5][2:0]};
                    INITIALIZATION_number[5] <= 18'd0;
                end
                else
                begin
                    INITIALIZATION_number[4][5:0] <= {INITIALIZATION_number[4][2:0],INITIALIZATION_number[5][2:0]};
                    INITIALIZATION_number[5] <= 18'd0;
                end
            end

            3'd2 :
            begin
                if(INITIALIZATION_number[4][5:3] == 3'd0)
                begin
                    if(INITIALIZATION_number[3][5:3] == 3'd0)
                    begin
                        INITIALIZATION_number[3][5:0] <= {INITIALIZATION_number[3][2:0],INITIALIZATION_number[4][2:0]};
                        INITIALIZATION_number[4] <= 18'd0;
                    end
                    else if(INITIALIZATION_number[3][8:6] == 3'd0)
                    begin
                        INITIALIZATION_number[3][8:0] <= {INITIALIZATION_number[3][5:0],INITIALIZATION_number[4][2:0]};
                        INITIALIZATION_number[4] <= 18'd0;
                    end
                    else
                    begin
                        INITIALIZATION_number[3][11:0] <= {INITIALIZATION_number[3][8:0],INITIALIZATION_number[4][2:0]};
                        INITIALIZATION_number[4] <= 18'd0;
                    end
                end
                else if(INITIALIZATION_number[4][8:6] == 3'd0)
                begin
                    if(INITIALIZATION_number[3][5:3] == 3'd0)
                    begin
                        INITIALIZATION_number[3][8:0] <= {INITIALIZATION_number[3][2:0],INITIALIZATION_number[4][5:0]};
                        INITIALIZATION_number[4] <= 18'd0;
                    end
                    else
                    begin
                        INITIALIZATION_number[3][11:0] <= {INITIALIZATION_number[3][5:0],INITIALIZATION_number[4][5:0]};
                        INITIALIZATION_number[4] <= 18'd0;
                    end
                end
                else
                begin
                    INITIALIZATION_number[3][11:0] <= {INITIALIZATION_number[3][2:0],INITIALIZATION_number[4][8:0]};
                    INITIALIZATION_number[4] <= 18'd0;
                end
            end

            3'd3 :
            begin
                if(INITIALIZATION_number[3][5:3] == 3'd0)
                begin
                    if(INITIALIZATION_number[2][5:3] == 3'd0)
                    begin
                        INITIALIZATION_number[2][5:0] <= {INITIALIZATION_number[2][2:0],INITIALIZATION_number[3][2:0]};
                        INITIALIZATION_number[3] <= 18'd0;
                    end
                    else if(INITIALIZATION_number[2][8:6] == 3'd0)
                    begin
                        INITIALIZATION_number[2][8:0] <= {INITIALIZATION_number[2][5:0],INITIALIZATION_number[3][2:0]};
                        INITIALIZATION_number[3] <= 18'd0;
                    end
                    else if(INITIALIZATION_number[2][11:9] == 3'd0)
                    begin
                        INITIALIZATION_number[2][11:0] <= {INITIALIZATION_number[2][8:0],INITIALIZATION_number[3][2:0]};
                        INITIALIZATION_number[3] <= 18'd0;
                    end
                    else
                    begin
                        INITIALIZATION_number[2][14:0] <= {INITIALIZATION_number[2][11:0],INITIALIZATION_number[3][2:0]};
                        INITIALIZATION_number[3] <= 18'd0;
                    end
                end
                else if(INITIALIZATION_number[3][8:6] == 3'd0)
                begin
                    if(INITIALIZATION_number[2][5:3] == 3'd0)
                    begin
                        INITIALIZATION_number[2][8:0] <= {INITIALIZATION_number[2][2:0],INITIALIZATION_number[3][5:0]};
                        INITIALIZATION_number[3] <= 18'd0;
                    end
                    else if(INITIALIZATION_number[2][8:6] == 3'd0)
                    begin
                        INITIALIZATION_number[2][11:0] <= {INITIALIZATION_number[2][5:0],INITIALIZATION_number[3][5:0]};
                        INITIALIZATION_number[3] <= 18'd0;
                    end
                    else
                    begin
                        INITIALIZATION_number[2][14:0] <= {INITIALIZATION_number[2][8:0],INITIALIZATION_number[3][5:0]};
                        INITIALIZATION_number[3] <= 18'd0;
                    end
                end
                else if(INITIALIZATION_number[3][11:9] == 3'd0)
                begin
                    if(INITIALIZATION_number[2][5:3] == 3'd0)
                    begin
                        INITIALIZATION_number[2][11:0] <= {INITIALIZATION_number[2][2:0],INITIALIZATION_number[3][8:0]};
                        INITIALIZATION_number[3] <= 18'd0;
                    end
                    else
                    begin
                        INITIALIZATION_number[2][14:0] <= {INITIALIZATION_number[2][5:0],INITIALIZATION_number[3][8:0]};
                        INITIALIZATION_number[3] <= 18'd0;
                    end
                end
                else
                begin
                    INITIALIZATION_number[2][14:0] <= {INITIALIZATION_number[2][2:0],INITIALIZATION_number[3][11:0]};
                    INITIALIZATION_number[3] <= 18'd0;
                end
            end

            default :
            begin
                for(i=1;i<7;i=i+1)
                begin
                    INITIALIZATION_number[i] <= INITIALIZATION_number[i];
                end
            end
        endcase
    end
    else if(state == REORDER)
    begin
        case(REORDER_counter)
            3'd0 :
            begin
                if(INITIALIZATION_reg[5] > INITIALIZATION_reg[1])
                begin
                    INITIALIZATION_number[1] <= INITIALIZATION_number[5];
                    INITIALIZATION_number[2] <= INITIALIZATION_number[1];
                    INITIALIZATION_number[3] <= INITIALIZATION_number[2];
                    INITIALIZATION_number[4] <= INITIALIZATION_number[3];
                    INITIALIZATION_number[5] <= INITIALIZATION_number[4];
                end
                else if(INITIALIZATION_reg[5] > INITIALIZATION_reg[2])
                begin
                    INITIALIZATION_number[2] <= INITIALIZATION_reg[5];
                    INITIALIZATION_number[3] <= INITIALIZATION_number[2];
                    INITIALIZATION_number[4] <= INITIALIZATION_number[3];
                    INITIALIZATION_number[5] <= INITIALIZATION_number[4];
                end
                else if(INITIALIZATION_reg[5] > INITIALIZATION_reg[3])
                begin
                    INITIALIZATION_number[3] <= INITIALIZATION_number[5];
                    INITIALIZATION_number[4] <= INITIALIZATION_number[3];
                    INITIALIZATION_number[5] <= INITIALIZATION_number[4];
                end
                else if(INITIALIZATION_reg[5] > INITIALIZATION_reg[4])
                begin
                    INITIALIZATION_number[4] <= INITIALIZATION_number[5];
                    INITIALIZATION_number[5] <= INITIALIZATION_number[4];
                end
                else
                begin
                    for(i=1;i<7;i=i+1)
                    begin
                        INITIALIZATION_number[i] <= INITIALIZATION_number[i];
                    end
                end
            end

            3'd1 :
            begin
                if(INITIALIZATION_reg[4] > INITIALIZATION_reg[1])
                begin
                    INITIALIZATION_number[1] <= INITIALIZATION_number[4];
                    INITIALIZATION_number[2] <= INITIALIZATION_number[1];
                    INITIALIZATION_number[3] <= INITIALIZATION_number[2];
                    INITIALIZATION_number[4] <= INITIALIZATION_number[3];
                end
                else if(INITIALIZATION_reg[4] > INITIALIZATION_reg[2])
                begin
                    INITIALIZATION_number[2] <= INITIALIZATION_number[4];
                    INITIALIZATION_number[3] <= INITIALIZATION_number[2];
                    INITIALIZATION_number[4] <= INITIALIZATION_number[3];
                end
                else if(INITIALIZATION_reg[4] > INITIALIZATION_reg[3])
                begin
                    INITIALIZATION_number[3] <= INITIALIZATION_number[4];
                    INITIALIZATION_number[4] <= INITIALIZATION_number[3];
                end
                else
                begin
                    for(i=1;i<7;i=i+1)
                    begin
                        INITIALIZATION_number[i] <= INITIALIZATION_number[i];
                    end
                end
            end

            3'd2 :
            begin
                if(INITIALIZATION_reg[3] > INITIALIZATION_reg[1])
                begin
                    INITIALIZATION_number[1] <= INITIALIZATION_number[3];
                    INITIALIZATION_number[2] <= INITIALIZATION_number[1];
                    INITIALIZATION_number[3] <= INITIALIZATION_number[2];
                end
                else if(INITIALIZATION_reg[3] > INITIALIZATION_reg[2])
                begin
                    INITIALIZATION_number[2] <= INITIALIZATION_number[3];
                    INITIALIZATION_number[3] <= INITIALIZATION_number[2];
                end
                else
                begin
                    for(i=1;i<7;i=i+1)
                    begin
                        INITIALIZATION_number[i] <= INITIALIZATION_number[i];
                    end
                end
            end

            3'd3 :
            begin
                if(INITIALIZATION_reg[2] > INITIALIZATION_reg[1])
                begin
                    INITIALIZATION_number[1] <= INITIALIZATION_number[2];
                    INITIALIZATION_number[2] <= INITIALIZATION_number[1];
                end
                else
                begin
                    for(i=1;i<7;i=i+1)
                    begin
                        INITIALIZATION_number[i] <= INITIALIZATION_number[i];
                    end
                end
            end

            default :
            begin
                for(i=1;i<7;i=i+1)
                begin
                    INITIALIZATION_number[i] <= INITIALIZATION_number[i];
                end
            end
        endcase
    end
    else
    begin
        for(i=1;i<7;i=i+1)
        begin
            INITIALIZATION_number[i] <= INITIALIZATION_number[i];
        end
    end
end

//          INITIALIZATION_number_reg
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        for(i=1;i<9;i=i+1)
        begin
            INITIALIZATION_number_reg[i] <= 15'd0;
        end
    end
    else if(state == COMBINATION && INITIALIZATION_counter == 3'd0)
    begin
        for(i=1;i<9;i=i+1)
        begin
            INITIALIZATION_number_reg[i] <= INITIALIZATION_number[i];
        end
    end
    else
        for(i=1;i<9;i=i+1)
        begin
            INITIALIZATION_number_reg[i] <= INITIALIZATION_number_reg[i];
        end
end

//          COMBINATION_number_reg
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        for(i=1;i<9;i=i+1)
        begin
            COMBINATION_number_reg[i] <= 15'd0;
        end
    end
    else if(state == COMBINATION)
    begin
        case(REORDER_counter)
            3'd1 :
            begin
                COMBINATION_number_reg[1] <= INITIALIZATION_number[4];
                COMBINATION_number_reg[2] <= INITIALIZATION_number[5];
            end
            3'd2 :
            begin
                COMBINATION_number_reg[3] <= INITIALIZATION_number[3];
                COMBINATION_number_reg[4] <= INITIALIZATION_number[4];
            end
            3'd3 :
            begin
                COMBINATION_number_reg[5] <= INITIALIZATION_number[2];
                COMBINATION_number_reg[6] <= INITIALIZATION_number[3];
            end
            3'd4 :
            begin
                COMBINATION_number_reg[7] <= INITIALIZATION_number[1];
                COMBINATION_number_reg[8] <= INITIALIZATION_number[2];
            end

            default :
            begin
                for(i=0;i<9;i=i+1)
                begin
                    COMBINATION_number_reg[i] <= COMBINATION_number_reg[i];
                end
            end
        endcase
    end
    else
    begin
        for(i=0;i<9;i=i+1)
        begin
            COMBINATION_number_reg[i] <= COMBINATION_number_reg[i];
        end
    end
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        HC1 <= 8'd0;
    else if(state == SPLIT)
    begin
        case(SPLIT_counter)
            3'd0 :
            begin
                if(INITIALIZATION_number_reg[1] == COMBINATION_number_reg[7][14:12] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[7][11:9] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[7][8:6] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[7][5:3] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[7][2:0])
                    HC1 <= {HC1[6:0],1'b0};
                else
                    HC1 <= {HC1[6:0],1'b1};
            end

            3'd1 :
            begin
                if(INITIALIZATION_number_reg[1] == COMBINATION_number_reg[5][14:12] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[5][11:9] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[5][8:6] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[5][5:3] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[5][2:0])
                    HC1 <= {HC1[6:0],1'b0};
                else if(INITIALIZATION_number_reg[1] == COMBINATION_number_reg[6][14:12] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[6][11:9] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[6][8:6] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[6][5:3] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[6][2:0])
                    HC1 <= {HC1[6:0],1'b1};
                else
                    HC1 <= HC1;
            end

            3'd2 :
            begin
                if(INITIALIZATION_number_reg[1] == COMBINATION_number_reg[3][14:12] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[3][11:9] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[3][8:6] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[3][5:3] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[3][2:0])
                    HC1 <= {HC1[6:0],1'b0};
                else if(INITIALIZATION_number_reg[1] == COMBINATION_number_reg[4][14:12] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[4][11:9] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[4][8:6] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[4][5:3] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[4][2:0])
                    HC1 <= {HC1[6:0],1'b1};
                else
                    HC1 <= HC1;
            end

            3'd3 :
            begin
                if(INITIALIZATION_number_reg[1] == COMBINATION_number_reg[1][14:12] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[1][11:9] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[1][8:6] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[1][5:3] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[1][2:0])
                    HC1 <= {HC1[6:0],1'b0};
                else if(INITIALIZATION_number_reg[1] == COMBINATION_number_reg[2][14:12] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[2][11:9] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[2][8:6] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[2][5:3] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[2][2:0])
                    HC1 <= {HC1[6:0],1'b1};
                else
                    HC1 <= HC1;
            end

            default :
                HC1 <= HC1;
        endcase
    end
    else if(state == MAKE_HUFFMAN)
    begin
        if(INITIALIZATION_number_reg[1] == 3'd1)
            HC1 <= HC1;
        else if(INITIALIZATION_number_reg[2] == 3'd1)
            HC1 <= HC2;
        else if(INITIALIZATION_number_reg[3] == 3'd1)
            HC1 <= HC3;
        else if(INITIALIZATION_number_reg[4] == 3'd1)
            HC1 <= HC4;
        else if(INITIALIZATION_number_reg[5] == 3'd1)
            HC1 <= HC5;
        else
            HC1 <= HC6;
    end
    else
        HC1 <= HC1;
end
always @(posedge clk or posedge reset)
begin
    if(reset)
        HC2 <= 8'd0;
    else if(state == SPLIT)
    begin
        case(SPLIT_counter)
            3'd0 :
            begin
                if(INITIALIZATION_number_reg[2] == COMBINATION_number_reg[7][14:12] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[7][11:9] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[7][8:6] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[7][5:3] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[7][2:0])
                    HC2 <= {HC2[6:0],1'b0};
                else
                    HC2 <= {HC2[6:0],1'b1};
            end

            3'd1 :
            begin
                if(INITIALIZATION_number_reg[2] == COMBINATION_number_reg[5][14:12] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[5][11:9] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[5][8:6] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[5][5:3] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[5][2:0])
                    HC2 <= {HC2[6:0],1'b0};
                else if(INITIALIZATION_number_reg[2] == COMBINATION_number_reg[6][14:12] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[6][11:9] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[6][8:6] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[6][5:3] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[6][2:0])
                    HC2 <= {HC2[6:0],1'b1};
                else
                    HC2 <= HC2;
            end

            3'd2 :
            begin
                if(INITIALIZATION_number_reg[2] == COMBINATION_number_reg[3][14:12] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[3][11:9] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[3][8:6] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[3][5:3] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[3][2:0])
                    HC2 <= {HC2[6:0],1'b0};
                else if(INITIALIZATION_number_reg[2] == COMBINATION_number_reg[4][14:12] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[4][11:9] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[4][8:6] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[4][5:3] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[4][2:0])
                    HC2 <= {HC2[6:0],1'b1};
                else
                    HC2 <= HC2;
            end

            3'd3 :
            begin
                if(INITIALIZATION_number_reg[2] == COMBINATION_number_reg[1][14:12] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[1][11:9] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[1][8:6] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[1][5:3] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[1][2:0])
                    HC2 <= {HC2[6:0],1'b0};
                else if(INITIALIZATION_number_reg[2] == COMBINATION_number_reg[2][14:12] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[2][11:9] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[2][8:6] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[2][5:3] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[2][2:0])
                    HC2 <= {HC2[6:0],1'b1};
                else
                    HC2 <= HC2;
            end

            default :
                HC2 <= HC2;
        endcase
    end
    else if(state == MAKE_HUFFMAN)
    begin
        if(INITIALIZATION_number_reg[1] == 3'd2)
            HC2 <= HC1;
        else if(INITIALIZATION_number_reg[2] == 3'd2)
            HC2 <= HC2;
        else if(INITIALIZATION_number_reg[3] == 3'd2)
            HC2 <= HC3;
        else if(INITIALIZATION_number_reg[4] == 3'd2)
            HC2 <= HC4;
        else if(INITIALIZATION_number_reg[5] == 3'd2)
            HC2 <= HC5;
        else
            HC2 <= HC6;
    end
    else
        HC2 <= HC2;
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        HC3 <= 8'd0;
    else if(state == SPLIT)
    begin
        case(SPLIT_counter)
            3'd0 :
            begin
                if(INITIALIZATION_number_reg[3] == COMBINATION_number_reg[7][14:12] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[7][11:9] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[7][8:6] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[7][5:3] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[7][2:0])
                    HC3 <= {HC3[6:0],1'b0};
                else
                    HC3 <= {HC3[6:0],1'b1};
            end

            3'd1 :
            begin
                if(INITIALIZATION_number_reg[3] == COMBINATION_number_reg[5][14:12] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[5][11:9] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[5][8:6] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[5][5:3] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[5][2:0])
                    HC3 <= {HC3[6:0],1'b0};
                else if(INITIALIZATION_number_reg[3] == COMBINATION_number_reg[6][14:12] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[6][11:9] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[6][8:6] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[6][5:3] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[6][2:0])
                    HC3 <= {HC3[6:0],1'b1};
                else
                    HC3 <= HC3;
            end

            3'd2 :
            begin
                if(INITIALIZATION_number_reg[3] == COMBINATION_number_reg[3][14:12] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[3][11:9] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[3][8:6] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[3][5:3] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[3][2:0])
                    HC3 <= {HC3[6:0],1'b0};
                else if(INITIALIZATION_number_reg[3] == COMBINATION_number_reg[4][14:12] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[4][11:9] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[4][8:6] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[4][5:3] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[4][2:0])
                    HC3 <= {HC3[6:0],1'b1};
                else
                    HC3 <= HC3;
            end

            3'd3 :
            begin
                if(INITIALIZATION_number_reg[3] == COMBINATION_number_reg[1][14:12] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[1][11:9] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[1][8:6] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[1][5:3] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[1][2:0])
                    HC3 <= {HC3[6:0],1'b0};
                else if(INITIALIZATION_number_reg[3] == COMBINATION_number_reg[2][14:12] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[2][11:9] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[2][8:6] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[2][5:3] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[2][2:0])
                    HC3 <= {HC3[6:0],1'b1};
                else
                    HC3 <= HC3;
            end

            default :
                HC3 <= HC3;
        endcase
    end
    else if(state == MAKE_HUFFMAN)
    begin
        if(INITIALIZATION_number_reg[1] == 3'd3)
            HC3 <= HC1;
        else if(INITIALIZATION_number_reg[2] == 3'd3)
            HC3 <= HC2;
        else if(INITIALIZATION_number_reg[3] == 3'd3)
            HC3 <= HC3;
        else if(INITIALIZATION_number_reg[4] == 3'd3)
            HC3 <= HC4;
        else if(INITIALIZATION_number_reg[5] == 3'd3)
            HC3 <= HC5;
        else
            HC3 <= HC6;
    end
    else
        HC3 <= HC3;
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        HC4 <= 8'd0;
    else if(state == SPLIT)
    begin
        case(SPLIT_counter)
            3'd0 :
            begin
                if(INITIALIZATION_number_reg[4] == COMBINATION_number_reg[7][14:12] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[7][11:9] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[7][8:6] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[7][5:3] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[7][2:0])
                    HC4 <= {HC4[6:0],1'b0};
                else
                    HC4 <= {HC4[6:0],1'b1};
            end

            3'd1 :
            begin
                if(INITIALIZATION_number_reg[4] == COMBINATION_number_reg[5][14:12] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[5][11:9] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[5][8:6] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[5][5:3] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[5][2:0])
                    HC4 <= {HC4[6:0],1'b0};
                else if(INITIALIZATION_number_reg[4] == COMBINATION_number_reg[6][14:12] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[6][11:9] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[6][8:6] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[6][5:3] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[6][2:0])
                    HC4 <= {HC4[6:0],1'b1};
                else
                    HC4 <= HC4;
            end

            3'd2 :
            begin
                if(INITIALIZATION_number_reg[4] == COMBINATION_number_reg[3][14:12] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[3][11:9] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[3][8:6] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[3][5:3] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[3][2:0])
                    HC4 <= {HC4[6:0],1'b0};
                else if(INITIALIZATION_number_reg[4] == COMBINATION_number_reg[4][14:12] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[4][11:9] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[4][8:6] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[4][5:3] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[4][2:0])
                    HC4 <= {HC4[6:0],1'b1};
                else
                    HC4 <= HC4;
            end

            3'd3 :
            begin
                if(INITIALIZATION_number_reg[4] == COMBINATION_number_reg[1][14:12] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[1][11:9] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[1][8:6] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[1][5:3] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[1][2:0])
                    HC4 <= {HC4[6:0],1'b0};
                else if(INITIALIZATION_number_reg[4] == COMBINATION_number_reg[2][14:12] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[2][11:9] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[2][8:6] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[2][5:3] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[2][2:0])
                    HC4 <= {HC4[6:0],1'b1};
                else
                    HC4 <= HC4;
            end

            default :
                HC4 <= HC4;
        endcase
    end
    else if(state == MAKE_HUFFMAN)
    begin
        if(INITIALIZATION_number_reg[1] == 3'd4)
            HC4 <= HC1;
        else if(INITIALIZATION_number_reg[2] == 3'd4)
            HC4 <= HC2;
        else if(INITIALIZATION_number_reg[3] == 3'd4)
            HC4 <= HC3;
        else if(INITIALIZATION_number_reg[4] == 3'd4)
            HC4 <= HC4;
        else if(INITIALIZATION_number_reg[5] == 3'd4)
            HC4 <= HC5;
        else
            HC4 <= HC6;
    end
    else
        HC4 <= HC4;
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        HC5 <= 8'd0;
    else if(state == SPLIT)
    begin
        case(SPLIT_counter)
            3'd0 :
            begin
                if(INITIALIZATION_number_reg[5] == COMBINATION_number_reg[7][14:12] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[7][11:9] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[7][8:6] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[7][5:3] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[7][2:0])
                    HC5 <= {HC5[6:0],1'b0};
                else
                    HC5 <= {HC5[6:0],1'b1};
            end

            3'd1 :
            begin
                if(INITIALIZATION_number_reg[5] == COMBINATION_number_reg[5][14:12] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[5][11:9] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[5][8:6] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[5][5:3] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[5][2:0])
                    HC5 <= {HC5[6:0],1'b0};
                else if(INITIALIZATION_number_reg[5] == COMBINATION_number_reg[6][14:12] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[6][11:9] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[6][8:6] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[6][5:3] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[6][2:0])
                    HC5 <= {HC5[6:0],1'b1};
                else
                    HC5 <= HC5;
            end

            3'd2 :
            begin
                if(INITIALIZATION_number_reg[5] == COMBINATION_number_reg[3][14:12] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[3][11:9] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[3][8:6] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[3][5:3] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[3][2:0])
                    HC5 <= {HC5[6:0],1'b0};
                else if(INITIALIZATION_number_reg[5] == COMBINATION_number_reg[4][14:12] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[4][11:9] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[4][8:6] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[4][5:3] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[4][2:0])
                    HC5 <= {HC5[6:0],1'b1};
                else
                    HC5 <= HC5;
            end

            3'd3 :
            begin
                if(INITIALIZATION_number_reg[5] == COMBINATION_number_reg[1][14:12] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[1][11:9] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[1][8:6] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[1][5:3] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[1][2:0])
                    HC5 <= {HC5[6:0],1'b0};
                else if(INITIALIZATION_number_reg[5] == COMBINATION_number_reg[2][14:12] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[2][11:9] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[2][8:6] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[2][5:3] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[2][2:0])
                    HC5 <= {HC5[6:0],1'b1};
                else
                    HC5 <= HC5;
            end

            3'd4 :
                HC5 <= {HC5[6:0],1'b0};

            default :
                HC5 <= HC5;
        endcase
    end
    else if(state == MAKE_HUFFMAN)
    begin
        if(INITIALIZATION_number_reg[1] == 3'd5)
            HC5 <= HC1;
        else if(INITIALIZATION_number_reg[2] == 3'd5)
            HC5 <= HC2;
        else if(INITIALIZATION_number_reg[3] == 3'd5)
            HC5 <= HC3;
        else if(INITIALIZATION_number_reg[4] == 3'd5)
            HC5 <= HC4;
        else if(INITIALIZATION_number_reg[5] == 3'd5)
            HC5 <= HC5;
        else
            HC5 <= HC6;
    end
    else
        HC5 <= HC5;
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        HC6 <= 8'd0;
    else if(state == SPLIT)
    begin
        case(SPLIT_counter)
            3'd0 :
            begin
                if(INITIALIZATION_number_reg[6] == COMBINATION_number_reg[7][14:12] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[7][11:9] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[7][8:6] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[7][5:3] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[7][2:0])
                    HC6 <= {HC6[6:0],1'b0};
                else
                    HC6 <= {HC6[6:0],1'b1};
            end

            3'd1 :
            begin
                if(INITIALIZATION_number_reg[6] == COMBINATION_number_reg[5][14:12] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[5][11:9] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[5][8:6] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[5][5:3] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[5][2:0])
                    HC6 <= {HC6[6:0],1'b0};
                else if(INITIALIZATION_number_reg[6] == COMBINATION_number_reg[6][14:12] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[6][11:9] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[6][8:6] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[6][5:3] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[6][2:0])
                    HC6 <= {HC6[6:0],1'b1};
                else
                    HC6 <= HC6;
            end

            3'd2 :
            begin
                if(INITIALIZATION_number_reg[6] == COMBINATION_number_reg[3][14:12] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[3][11:9] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[3][8:6] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[3][5:3] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[3][2:0])
                    HC6 <= {HC6[6:0],1'b0};
                else if(INITIALIZATION_number_reg[6] == COMBINATION_number_reg[4][14:12] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[4][11:9] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[4][8:6] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[4][5:3] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[4][2:0])
                    HC6 <= {HC6[6:0],1'b1};
                else
                    HC6 <= HC6;
            end

            3'd3 :
            begin
                if(INITIALIZATION_number_reg[6] == COMBINATION_number_reg[1][14:12] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[1][11:9] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[1][8:6] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[1][5:3] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[1][2:0])
                    HC6 <= {HC6[6:0],1'b0};
                else if(INITIALIZATION_number_reg[6] == COMBINATION_number_reg[2][14:12] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[2][11:9] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[2][8:6] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[2][5:3] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[2][2:0])
                    HC6 <= {HC6[6:0],1'b1};
                else
                    HC6 <= HC6;
            end

            3'd4 :
                HC6 <= {HC6[6:0],1'b1};

            default :
                HC6 <= HC6;
        endcase
    end
    else if(state == MAKE_HUFFMAN)
    begin
        if(INITIALIZATION_number_reg[1] == 3'd6)
            HC6 <= HC1;
        else if(INITIALIZATION_number_reg[2] == 3'd6)
            HC6 <= HC2;
        else if(INITIALIZATION_number_reg[3] == 3'd6)
            HC6 <= HC3;
        else if(INITIALIZATION_number_reg[4] == 3'd6)
            HC6 <= HC4;
        else if(INITIALIZATION_number_reg[5] == 3'd6)
            HC6 <= HC5;
        else
            HC6 <= HC6;
    end
    else
        HC6 <= HC6;
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        M1 <= 8'd0;
    else if(state == SPLIT)
    begin
        case(SPLIT_counter)
            3'd0 :
                M1 <= {M1[6:0],1'b1};
            3'd1 :
            begin
                if(INITIALIZATION_number_reg[1] == COMBINATION_number_reg[5][14:12] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[5][11:9] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[5][8:6] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[5][5:3] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[5][2:0])
                    M1 <= {M1[6:0],1'b1};
                else if(INITIALIZATION_number_reg[1] == COMBINATION_number_reg[6][14:12] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[6][11:9] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[6][8:6] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[6][5:3] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[6][2:0])
                    M1 <= {M1[6:0],1'b1};
                else
                    M1 <= M1;
            end

            3'd2 :
            begin
                if(INITIALIZATION_number_reg[1] == COMBINATION_number_reg[3][14:12] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[3][11:9] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[3][8:6] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[3][5:3] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[3][2:0])
                    M1 <= {M1[6:0],1'b1};
                else if(INITIALIZATION_number_reg[1] == COMBINATION_number_reg[4][14:12] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[4][11:9] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[4][8:6] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[4][5:3] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[4][2:0])
                    M1 <= {M1[6:0],1'b1};
                else
                    M1 <= M1;
            end

            3'd3 :
            begin
                if(INITIALIZATION_number_reg[1] == COMBINATION_number_reg[1][14:12] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[1][11:9] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[1][8:6] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[1][5:3] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[1][2:0])
                    M1 <= {M1[6:0],1'b1};
                else if(INITIALIZATION_number_reg[1] == COMBINATION_number_reg[2][14:12] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[2][11:9] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[2][8:6] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[2][5:3] || INITIALIZATION_number_reg[1] == COMBINATION_number_reg[2][2:0])
                    M1 <= {M1[6:0],1'b1};
                else
                    M1 <= M1;
            end

            default :
                M1 <= M1;
        endcase
    end
    else if(state == MAKE_HUFFMAN)
    begin
        if(INITIALIZATION_number_reg[1] == 3'd1)
            M1 <= M1;
        else if(INITIALIZATION_number_reg[2] == 3'd1)
            M1 <= M2;
        else if(INITIALIZATION_number_reg[3] == 3'd1)
            M1 <= M3;
        else if(INITIALIZATION_number_reg[4] == 3'd1)
            M1 <= M4;
        else if(INITIALIZATION_number_reg[5] == 3'd1)
            M1 <= M5;
        else
            M1 <= M6;
    end
    else
        M1 <= M1;
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        M2 <= 8'd0;
    else if(state == SPLIT)
    begin
        case(SPLIT_counter)
            3'd0 :
                M2 <= {M2[6:0],1'b1};

            3'd1 :
            begin
                if(INITIALIZATION_number_reg[2] == COMBINATION_number_reg[5][14:12] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[5][11:9] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[5][8:6] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[5][5:3] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[5][2:0])
                    M2 <= {M2[6:0],1'b1};
                else if(INITIALIZATION_number_reg[2] == COMBINATION_number_reg[6][14:12] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[6][11:9] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[6][8:6] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[6][5:3] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[6][2:0])
                    M2 <= {M2[6:0],1'b1};
                else
                    M2 <= M2;
            end

            3'd2 :
            begin
                if(INITIALIZATION_number_reg[2] == COMBINATION_number_reg[3][14:12] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[3][11:9] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[3][8:6] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[3][5:3] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[3][2:0])
                    M2 <= {M2[6:0],1'b1};
                else if(INITIALIZATION_number_reg[2] == COMBINATION_number_reg[4][14:12] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[4][11:9] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[4][8:6] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[4][5:3] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[4][2:0])
                    M2 <= {M2[6:0],1'b1};
                else
                    M2 <= M2;
            end

            3'd3 :
            begin
                if(INITIALIZATION_number_reg[2] == COMBINATION_number_reg[1][14:12] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[1][11:9] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[1][8:6] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[1][5:3] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[1][2:0])
                    M2 <= {M2[6:0],1'b1};
                else if(INITIALIZATION_number_reg[2] == COMBINATION_number_reg[2][14:12] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[2][11:9] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[2][8:6] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[2][5:3] || INITIALIZATION_number_reg[2] == COMBINATION_number_reg[2][2:0])
                    M2 <= {M2[6:0],1'b1};
                else
                    M2 <= M2;
            end

            default :
                M2 <= M2;
        endcase
    end
    else if(state == MAKE_HUFFMAN)
    begin
        if(INITIALIZATION_number_reg[1] == 3'd2)
            M2 <= M1;
        else if(INITIALIZATION_number_reg[2] == 3'd2)
            M2 <= M2;
        else if(INITIALIZATION_number_reg[3] == 3'd2)
            M2 <= M3;
        else if(INITIALIZATION_number_reg[4] == 3'd2)
            M2 <= M4;
        else if(INITIALIZATION_number_reg[5] == 3'd2)
            M2 <= M5;
        else
            M2 <= M6;
    end
    else
        M2 <= M2;
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        M3 <= 8'd0;
    else if(state == SPLIT)
    begin
        case(SPLIT_counter)
            3'd0 :
                M3 <= {M3[6:0],1'b1};

            3'd1 :
            begin
                if(INITIALIZATION_number_reg[3] == COMBINATION_number_reg[5][14:12] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[5][11:9] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[5][8:6] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[5][5:3] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[5][2:0])
                    M3 <= {M3[6:0],1'b1};
                else if(INITIALIZATION_number_reg[3] == COMBINATION_number_reg[6][14:12] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[6][11:9] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[6][8:6] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[6][5:3] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[6][2:0])
                    M3 <= {M3[6:0],1'b1};
                else
                    M3 <= M3;
            end

            3'd2 :
            begin
                if(INITIALIZATION_number_reg[3] == COMBINATION_number_reg[3][14:12] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[3][11:9] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[3][8:6] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[3][5:3] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[3][2:0])
                    M3 <= {M3[6:0],1'b1};
                else if(INITIALIZATION_number_reg[3] == COMBINATION_number_reg[4][14:12] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[4][11:9] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[4][8:6] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[4][5:3] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[4][2:0])
                    M3 <= {M3[6:0],1'b1};
                else
                    M3 <= M3;
            end

            3'd3 :
            begin
                if(INITIALIZATION_number_reg[3] == COMBINATION_number_reg[1][14:12] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[1][11:9] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[1][8:6] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[1][5:3] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[1][2:0])
                    M3 <= {M3[6:0],1'b1};
                else if(INITIALIZATION_number_reg[3] == COMBINATION_number_reg[2][14:12] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[2][11:9] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[2][8:6] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[2][5:3] || INITIALIZATION_number_reg[3] == COMBINATION_number_reg[2][2:0])
                    M3 <= {M3[6:0],1'b1};
                else
                    M3 <= M3;
            end

            default :
                M3 <= M3;
        endcase
    end
    else if(state == MAKE_HUFFMAN)
    begin
        if(INITIALIZATION_number_reg[1] == 3'd3)
            M3 <= M1;
        else if(INITIALIZATION_number_reg[2] == 3'd3)
            M3 <= M2;
        else if(INITIALIZATION_number_reg[3] == 3'd3)
            M3 <= M3;
        else if(INITIALIZATION_number_reg[4] == 3'd3)
            M3 <= M4;
        else if(INITIALIZATION_number_reg[5] == 3'd3)
            M3 <= M5;
        else
            M3 <= M6;
    end
    else
        M3 <= M3;
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        M4 <= 8'd0;
    else if(state == SPLIT)
    begin
        case(SPLIT_counter)
            3'd0 :
                M4 <= {M4[6:0],1'b1};

            3'd1 :
            begin
                if(INITIALIZATION_number_reg[4] == COMBINATION_number_reg[5][14:12] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[5][11:9] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[5][8:6] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[5][5:3] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[5][2:0])
                    M4 <= {M4[6:0],1'b1};
                else if(INITIALIZATION_number_reg[4] == COMBINATION_number_reg[6][14:12] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[6][11:9] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[6][8:6] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[6][5:3] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[6][2:0])
                    M4 <= {M4[6:0],1'b1};
                else
                    M4 <= M4;
            end

            3'd2 :
            begin
                if(INITIALIZATION_number_reg[4] == COMBINATION_number_reg[3][14:12] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[3][11:9] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[3][8:6] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[3][5:3] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[3][2:0])
                    M4 <= {M4[6:0],1'b1};
                else if(INITIALIZATION_number_reg[4] == COMBINATION_number_reg[4][14:12] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[4][11:9] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[4][8:6] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[4][5:3] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[4][2:0])
                    M4 <= {M4[6:0],1'b1};
                else
                    M4 <= M4;
            end

            3'd3 :
            begin
                if(INITIALIZATION_number_reg[4] == COMBINATION_number_reg[1][14:12] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[1][11:9] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[1][8:6] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[1][5:3] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[1][2:0])
                    M4 <= {M4[6:0],1'b1};
                else if(INITIALIZATION_number_reg[4] == COMBINATION_number_reg[2][14:12] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[2][11:9] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[2][8:6] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[2][5:3] || INITIALIZATION_number_reg[4] == COMBINATION_number_reg[2][2:0])
                    M4 <= {M4[6:0],1'b1};
                else
                    M4 <= M4;
            end

            default :
                M4 <= M4;
        endcase
    end
    else if(state == MAKE_HUFFMAN)
    begin
        if(INITIALIZATION_number_reg[1] == 3'd4)
            M4 <= M1;
        else if(INITIALIZATION_number_reg[2] == 3'd4)
            M4 <= M2;
        else if(INITIALIZATION_number_reg[3] == 3'd4)
            M4 <= M3;
        else if(INITIALIZATION_number_reg[4] == 3'd4)
            M4 <= M4;
        else if(INITIALIZATION_number_reg[5] == 3'd4)
            M4 <= M5;
        else
            M4 <= M6;
    end
    else
        M4 <= M4;
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        M5 <= 8'd0;
    else if(state == SPLIT)
    begin
        case(SPLIT_counter)
            3'd0 :
                M5 <= {M5[6:0],1'b1};

            3'd1 :
            begin
                if(INITIALIZATION_number_reg[5] == COMBINATION_number_reg[5][14:12] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[5][11:9] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[5][8:6] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[5][5:3] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[5][2:0])
                    M5 <= {M5[6:0],1'b1};
                else if(INITIALIZATION_number_reg[5] == COMBINATION_number_reg[6][14:12] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[6][11:9] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[6][8:6] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[6][5:3] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[6][2:0])
                    M5 <= {M5[6:0],1'b1};
                else
                    M5 <= M5;
            end

            3'd2 :
            begin
                if(INITIALIZATION_number_reg[5] == COMBINATION_number_reg[3][14:12] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[3][11:9] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[3][8:6] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[3][5:3] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[3][2:0])
                    M5 <= {M5[6:0],1'b1};
                else if(INITIALIZATION_number_reg[5] == COMBINATION_number_reg[4][14:12] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[4][11:9] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[4][8:6] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[4][5:3] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[4][2:0])
                    M5 <= {M5[6:0],1'b1};
                else
                    M5 <= M5;
            end

            3'd3 :
            begin
                if(INITIALIZATION_number_reg[5] == COMBINATION_number_reg[1][14:12] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[1][11:9] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[1][8:6] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[1][5:3] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[1][2:0])
                    M5 <= {M5[6:0],1'b1};
                else if(INITIALIZATION_number_reg[5] == COMBINATION_number_reg[2][14:12] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[2][11:9] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[2][8:6] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[2][5:3] || INITIALIZATION_number_reg[5] == COMBINATION_number_reg[2][2:0])
                    M5 <= {M5[6:0],1'b1};
                else
                    M5 <= M5;
            end

            3'd4 :
                M5 <= {M5[6:0],1'b1};

            default :
                M5 <= M5;
        endcase
    end
    else if(state == MAKE_HUFFMAN)
    begin
        if(INITIALIZATION_number_reg[1] == 3'd5)
            M5 <= M1;
        else if(INITIALIZATION_number_reg[2] == 3'd5)
            M5 <= M2;
        else if(INITIALIZATION_number_reg[3] == 3'd5)
            M5 <= M3;
        else if(INITIALIZATION_number_reg[4] == 3'd5)
            M5 <= M4;
        else if(INITIALIZATION_number_reg[5] == 3'd5)
            M5 <= M5;
        else
            M5<= M6;
    end
    else
        M5 <= M5;
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        M6 <= 8'd0;
    else if(state == SPLIT)
    begin
        case(SPLIT_counter)
            3'd0 :
                M6 <= {M6[6:0],1'b1};

            3'd1 :
            begin
                if(INITIALIZATION_number_reg[6] == COMBINATION_number_reg[5][14:12] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[5][11:9] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[5][8:6] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[5][5:3] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[5][2:0])
                    M6 <= {M6[6:0],1'b1};
                else if(INITIALIZATION_number_reg[6] == COMBINATION_number_reg[6][14:12] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[6][11:9] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[6][8:6] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[6][5:3] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[6][2:0])
                    M6 <= {M6[6:0],1'b1};
                else
                    M6 <= M6;
            end

            3'd2 :
            begin
                if(INITIALIZATION_number_reg[6] == COMBINATION_number_reg[3][14:12] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[3][11:9] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[3][8:6] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[3][5:3] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[3][2:0])
                    M6 <= {M6[6:0],1'b1};
                else if(INITIALIZATION_number_reg[6] == COMBINATION_number_reg[4][14:12] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[4][11:9] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[4][8:6] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[4][5:3] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[4][2:0])
                    M6 <= {M6[6:0],1'b1};
                else
                    M6 <= M6;
            end

            3'd3 :
            begin
                if(INITIALIZATION_number_reg[6] == COMBINATION_number_reg[1][14:12] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[1][11:9] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[1][8:6] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[1][5:3] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[1][2:0])
                    M6 <= {M6[6:0],1'b1};
                else if(INITIALIZATION_number_reg[6] == COMBINATION_number_reg[2][14:12] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[2][11:9] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[2][8:6] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[2][5:3] || INITIALIZATION_number_reg[6] == COMBINATION_number_reg[2][2:0])
                    M6 <= {M6[6:0],1'b1};
                else
                    M6 <= M6;
            end

            3'd4 :
                M6 <= {M6[6:0],1'b1};

            default :
                M6 <= M6;
        endcase
    end
    else if(state == MAKE_HUFFMAN)
    begin
        if(INITIALIZATION_number_reg[1] == 3'd6)
            M6 <= M1;
        else if(INITIALIZATION_number_reg[2] == 3'd6)
            M6 <= M2;
        else if(INITIALIZATION_number_reg[3] == 3'd6)
            M6 <= M3;
        else if(INITIALIZATION_number_reg[4] == 3'd6)
            M6 <= M4;
        else if(INITIALIZATION_number_reg[5] == 3'd6)
            M6 <= M5;
        else
            M6 <= M6;
    end
    else
        M6 <= M6;
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        CNT_valid <= 1'b0;
    else if(state == DATA_READ && counter1 == 7'd99)
        CNT_valid <= 1'b1;
    else if(state == CNT_STORE)
        CNT_valid <= 1'b0;
    else
        CNT_valid <= CNT_valid;
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        code_valid <= 1'b0;
    else if(state == MAKE_HUFFMAN)
        code_valid <= 1'b1;
    else if(state == DONE)
        code_valid <= 1'b0;
    else
        code_valid <= code_valid;
end

endmodule
