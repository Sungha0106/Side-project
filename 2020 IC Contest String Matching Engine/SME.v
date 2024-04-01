module SME(clk,reset,chardata,isstring,ispattern,valid,match,match_index);
input clk;
input reset;
input [7:0] chardata;
input isstring;
input ispattern;
output reg match;
output reg [4:0] match_index;
output reg valid;
// reg match;
// reg [4:0] match_index;
// reg valid;
//============================================================================
reg [2:0] state, next_state;
parameter [2:0]  STRING_PATTERN_STORE = 3'b000, PATTERN_STORE = 3'b001, DETERMINE = 3'b010, DONE = 3'b011;
reg [7:0] STRING_reg [0:31];
reg [7:0] STRING_reg_store [0:31];
reg [7:0] PATTERN_reg [0:7];
reg [5:0] string_store_counter;
reg [2:0] pattern_store_counter, pattern_store_counter_reg, determine_counter;
reg match_flag;
reg STRING_flag;
integer i;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//FSM
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(*)
begin
    case(state)
        STRING_PATTERN_STORE :
        begin
            if(!ispattern && !isstring)
                next_state = DETERMINE;
            else
                next_state = STRING_PATTERN_STORE;
        end

        DETERMINE :
        begin
            if(match_flag || string_store_counter == 6'd32 )
                next_state = DONE;
            else
                next_state = DETERMINE;
        end

        DONE :
            next_state = STRING_PATTERN_STORE;
        default :
            next_state = state;
    endcase
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= STRING_PATTERN_STORE;
    else
        state <= next_state;
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//string_store_counter
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(posedge clk or posedge reset)
begin
    if(reset)
        string_store_counter <= 6'd0;
    else if(state == STRING_PATTERN_STORE)
    begin
        if(string_store_counter == 6'd31 || !isstring)
            string_store_counter <= 6'd0;
        else
            string_store_counter <= string_store_counter + 6'd1;
    end
    else if(state == DETERMINE)
    begin
        if(string_store_counter == 6'd32)
            string_store_counter <= 6'd0;
        else
        begin
            if(PATTERN_reg[determine_counter] == 8'h5E && string_store_counter == 6'd0)
                string_store_counter <= string_store_counter;
            else if(PATTERN_reg[determine_counter] == 8'h2A && PATTERN_reg[determine_counter + 3'd1] == STRING_reg[string_store_counter])
                string_store_counter <= string_store_counter;
            else if(PATTERN_reg[determine_counter] == 8'h24)
            begin
                if(string_store_counter == 6'd32 || STRING_reg[string_store_counter] ==  8'd0 || STRING_reg[string_store_counter] ==  8'h20)
                    string_store_counter <= string_store_counter;
                else
                    string_store_counter <= string_store_counter + 6'd1;
            end
            else if(determine_counter == pattern_store_counter_reg)
            begin
                if(STRING_reg[string_store_counter] == PATTERN_reg[determine_counter] || PATTERN_reg[determine_counter] == 8'h2E)
                    string_store_counter <= string_store_counter;
                else
                    string_store_counter <= string_store_counter + 6'd1;
            end
            else
                string_store_counter <= string_store_counter + 6'd1;
        end
    end
    else if(state == DONE)
        string_store_counter <= 6'd0;
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//pattern_store_counter
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(posedge clk or posedge reset)
begin
    if(reset)
        pattern_store_counter <= 3'd0;
    else if(state == STRING_PATTERN_STORE)
    begin
        if(pattern_store_counter == 3'd7 || !ispattern)
            pattern_store_counter <= 3'd0;
        else
            pattern_store_counter <= pattern_store_counter + 3'd1;
    end
    else if(state ==DONE)
        pattern_store_counter <= 3'd0;
end

//pattern_store_counter_reg
always @(posedge clk or posedge reset)
begin
    if(reset)
        pattern_store_counter_reg <= 3'd0;
    else if(state == STRING_PATTERN_STORE)
    begin
        if(!ispattern)
            pattern_store_counter_reg <= pattern_store_counter - 3'd1;
        else
            pattern_store_counter_reg <= pattern_store_counter_reg;
    end
    else if(state == DONE)
        pattern_store_counter_reg <= 3'd0;
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//determine_counter
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//pattern_store_counter_reg
always @(posedge clk or posedge reset)
begin
    if(reset)
        determine_counter <= 3'd0;
    else if(state == DETERMINE)
    begin
        if(PATTERN_reg[determine_counter] == 8'h5E)
        begin
            if(string_store_counter == 6'd0 || STRING_reg[string_store_counter] == 8'h20)
                determine_counter <= determine_counter + 3'd1;
            else if(determine_counter == pattern_store_counter_reg)
                determine_counter <= determine_counter;
            else if(STRING_reg[string_store_counter] == 8'h20)
                determine_counter <= 3'd0;
        end
        else if(PATTERN_reg[determine_counter] == 8'h24 && (STRING_reg[string_store_counter] ==  8'd0 || STRING_reg[string_store_counter] ==  8'h20 || string_store_counter == 6'd32))
            determine_counter <= determine_counter;
        else if(PATTERN_reg[determine_counter] == 8'h24 && PATTERN_reg[1] == 8'h2A)
            determine_counter <= 3'd1;
        else if(PATTERN_reg[determine_counter] == 8'h2E)
        begin
            if(determine_counter == pattern_store_counter_reg)
                determine_counter <= determine_counter;
            else
                determine_counter <= determine_counter + 3'd1;
        end
        else if(PATTERN_reg[determine_counter] == 8'h2A)
        begin
            if(determine_counter == pattern_store_counter_reg)
                determine_counter <= determine_counter;
            else if(PATTERN_reg[determine_counter + 3'd1] == STRING_reg[string_store_counter])  //這邊要讓string_store_counter下個clock保持不變一次
                determine_counter <= determine_counter + 3'd1;
            else
                determine_counter <= determine_counter;
        end
        else
        begin
            if(STRING_reg[string_store_counter] == PATTERN_reg[determine_counter])
            begin
                if(determine_counter == pattern_store_counter_reg)
                    determine_counter <= determine_counter;
                else

                    determine_counter <= determine_counter + 3'd1;
            end
            else
            begin
                if(PATTERN_reg[0] == 8'h2E)
                    determine_counter <= 3'd1;
                else if(PATTERN_reg[determine_counter - 3'd2] == 8'h2A)
                    determine_counter <= determine_counter - 3'd2;
                else
                    determine_counter <= 3'd0;
            end
        end
    end
    else if(state == DONE)
        determine_counter <= 3'd0;
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//STRING_STORE
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        for(i=0;i<32;i=i+1)
        begin
            STRING_reg[i] <= 8'd0;
        end
    end
    else if(state == STRING_PATTERN_STORE)
    begin
        if(isstring)
            STRING_reg[string_store_counter] <= chardata;
        else
        begin
            if(STRING_flag)
            begin
                for(i=0;i<32;i=i+1)
                begin
                    STRING_reg[i] <= STRING_reg_store[i];
                end
            end
            else
            begin
                for(i=0;i<32;i=i+1)
                begin
                    STRING_reg[i] <= STRING_reg[i];
                end
            end
        end
    end
    else if(state == DONE)
    begin
        for(i=0;i<32;i=i+1)
        begin
            STRING_reg[i] <= 8'd0;
        end
    end
end

//STRING_reg_store
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        for(i=0;i<32;i=i+1)
        begin
            STRING_reg_store[i] <= 8'd0;
        end
    end
    else if(state == STRING_PATTERN_STORE)
    begin
        if(ispattern && !STRING_flag)
            for(i=0;i<32;i=i+1)
            begin
                STRING_reg_store[i] <= STRING_reg[i];
            end
    end
end

//STRING_flag
always @(posedge clk or posedge reset)
begin
    if(reset)
        STRING_flag <= 1'b0;
    else if(state == STRING_PATTERN_STORE)
    begin
        if(isstring)
            STRING_flag <= 1'b0;
        else
            STRING_flag <= 1'b1;
    end
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//PATTERN_STORE
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        for(i=0;i<8;i=i+1)
        begin
            PATTERN_reg[i] <= 8'd0;
        end
    end
    else if(state == STRING_PATTERN_STORE && ispattern)
        PATTERN_reg[pattern_store_counter] <= chardata;
    else if(state ==DONE)
    begin
        for(i=0;i<8;i=i+1)
        begin
            PATTERN_reg[i] <= 8'd0;
        end
    end
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//match_flag && DONE
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(posedge clk or posedge reset)
begin
    if(reset)
        match_flag <= 1'b0;
    else if(state == DETERMINE)
    begin
        if(determine_counter == pattern_store_counter_reg)
        begin
            if(PATTERN_reg[determine_counter] == 8'h24 && (STRING_reg[string_store_counter] ==  8'd0 || STRING_reg[string_store_counter] ==  8'h20 || string_store_counter == 6'd32))
                match_flag <= 1'b1;
            else if(PATTERN_reg[determine_counter] == 8'h2E)
                match_flag <= 1'b1;
            else if(PATTERN_reg[determine_counter] == 8'h5E)
                match_flag <= 1'b1;
            else if(PATTERN_reg[determine_counter] == 8'h2A)
                match_flag <= 1'b1;
            else if(STRING_reg[string_store_counter] == PATTERN_reg[determine_counter])
                match_flag <= 1'b1;
            else
                match_flag <= 1'b0;
        end
        else
            match_flag <= match_flag;
    end
    else if(state == DONE)
        match_flag <= 1'b0;
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//match
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(posedge clk or posedge reset)
begin
    if(reset)
        match <= 1'b0;
    else if(state == DONE)
    begin
        if(match_flag)
            match <= 1'b1;
        else
            match <= 1'b0;
    end
    else
        match <= 1'b0;
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//match_index
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(posedge clk or posedge reset)
begin
    if(reset)
        match_index <= 5'd0;
    else if(state == DETERMINE)
    begin
        if(determine_counter == 3'd0)
        begin
            if(PATTERN_reg[determine_counter] == 8'h5E)
            begin
                if(string_store_counter == 6'd0)
                    match_index <= 5'd0;
                else if(STRING_reg[string_store_counter] == 8'h20)
                    match_index <= string_store_counter + 5'd1;
            end
            else if(PATTERN_reg[determine_counter] == 8'h2E)
            begin
                if(string_store_counter == 6'd0)
                    match_index <= 5'd0;
                else
                    match_index <= string_store_counter;
            end
            else if(PATTERN_reg[determine_counter] == 8'h2A)
                match_index <= 5'd0;
            else if(STRING_reg[string_store_counter] == PATTERN_reg[determine_counter])
                match_index <= string_store_counter;
        end
        else
        begin
            if(STRING_reg[string_store_counter] != PATTERN_reg[determine_counter])
            begin
                if(PATTERN_reg[determine_counter] == 8'h2A)
                    match_index <= match_index;
                else if(PATTERN_reg[0] == 8'h2E)
                    match_index <= string_store_counter;
            end
            else
                match_index <= match_index;
        end
    end
end
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//valid
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(posedge clk or posedge reset)
begin
    if(reset)
        valid <= 1'b0;
    else if(state == DONE)
        valid <= 1'b1;
    else
        valid <= 1'b0;
end

endmodule
