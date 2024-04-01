module TT( clk, rst_n, in_valid, source, destination, out_valid, cost);
input clk;
input rst_n;
input in_valid;
input [3:0]source;
input [3:0]destination;
output reg out_valid;
output reg [3:0] cost;
//============================================================================
reg [1:0] state, next_state;
parameter  DATA_STORE = 2'b00, ALGORITHM = 2'b01, DONE = 2'b10, GO = 2'b11;
reg [3:0] departure_station, destination_station;
reg [3:0] train_station [0:15][0:7];
reg [3:0] store_counter[0:15];
reg [0:7] repeat_source, repeat_destination;
reg [3:0] station;
reg [4:0] path_reg[0:8];
reg [2:0]  step_next;
reg start;
reg [0:7] check_repeat;
reg [2:0] step_counter;
reg [2:0] step_reg [0:15];
wire back, back2, back3, back4, back5;
reg [2:0] cost_last;
wire go_destination;
reg possible;
reg done;
wire [2:0] counter_1, counter_2, counter_3, counter_4, counter_5;
reg [2:0] index, index_1, index_2, index_3, index_4, index_5;
reg [3:0] d_index, s_index;
integer i, j;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//FSM
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(*)
begin
    case(state)
        DATA_STORE :
        begin
            if(!in_valid && start)
            begin
                if(done)
                    next_state = DONE;
                else
                    next_state = ALGORITHM;
            end
            else
                next_state = DATA_STORE;
        end

        ALGORITHM :
        begin
            if ((step_counter == 3'd0 && (go_destination || (step_next == store_counter[path_reg[0]] && (back)))) || (step_counter == 3'd1 && (back2 || (back2 && go_destination))) || store_counter[path_reg[0]] == 3'd0 || (step_counter == 3'd2 && (back3 || (back3 && go_destination))) || (step_counter == 3'd3 && (back4 || (back4 && go_destination))))
                next_state = DONE;
            else
                next_state = ALGORITHM;
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
//start
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        start <= 1'b0;
    else if(state == DATA_STORE && in_valid)
        start <= 1'b1;
    else if(state == DONE)
        start <= 1'b0;
end

//departure_station
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        departure_station <= 4'd0;
    else if(state == DATA_STORE)
    begin
        if(in_valid && !start)
            departure_station <= source;
        else
            departure_station <= departure_station;
    end
end

//destination_station
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        destination_station <= 4'd0;
    else if(state == DATA_STORE)
    begin
        if(in_valid && !start)
            destination_station <= destination;
        else
            destination_station <= destination_station;
    end
end

//repeat_source
always @(*)
begin
    if(in_valid)
    begin
        for(i=0;i<8;i=i+1)
        begin
            if(train_station[source][i] == destination)
                repeat_source[i] = 1'b1;
            else
                repeat_source[i] = 1'b0;
        end
    end
    else
        repeat_source = 8'd0;
end

//repeat_destination
always @(*)
begin
    if(in_valid)
    begin
        for(i=0;i<8;i=i+1)
        begin
            if(train_station[destination][i] == source)
                repeat_destination[i] = 1'b1;
            else
                repeat_destination[i] = 1'b0;
        end
    end
    else
        repeat_destination = 8'd0;
end

//      s_index
always @(*)
begin
    case(source)
        4'd0 :
            s_index = store_counter[0];
        4'd1 :
            s_index = store_counter[1];
        4'd2 :
            s_index = store_counter[2];
        4'd3 :
            s_index = store_counter[3];
        4'd4 :
            s_index = store_counter[4];
        4'd5 :
            s_index = store_counter[5];
        4'd6 :
            s_index = store_counter[6];
        4'd7 :
            s_index = store_counter[7];
        4'd8 :
            s_index = store_counter[8];
        4'd9 :
            s_index = store_counter[9];
        4'd10 :
            s_index = store_counter[10];
        4'd11 :
            s_index = store_counter[11];
        4'd12 :
            s_index = store_counter[12];
        4'd13 :
            s_index = store_counter[13];
        4'd14 :
            s_index = store_counter[14];
        4'd15 :
            s_index = store_counter[15];
    endcase
end

//      d_index
always @(*)
begin
    case(destination)
        4'd0 :
            d_index = store_counter[0];
        4'd1 :
            d_index = store_counter[1];
        4'd2 :
            d_index = store_counter[2];
        4'd3 :
            d_index = store_counter[3];
        4'd4 :
            d_index = store_counter[4];
        4'd5 :
            d_index = store_counter[5];
        4'd6 :
            d_index = store_counter[6];
        4'd7 :
            d_index = store_counter[7];
        4'd8 :
            d_index = store_counter[8];
        4'd9 :
            d_index = store_counter[9];
        4'd10 :
            d_index = store_counter[10];
        4'd11 :
            d_index = store_counter[11];
        4'd12 :
            d_index = store_counter[12];
        4'd13 :
            d_index = store_counter[13];
        4'd14 :
            d_index = store_counter[14];
        4'd15 :
            d_index = store_counter[15];
    endcase
end

//train_station
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        for(i=0;i<16;i=i+1)
        begin
            for(j=0;j<8;j=j+1)
            begin
                train_station[i][j] <= 4'd15;
            end
        end
    end
    else if(state == DATA_STORE)
    begin
        if(in_valid && start)
        begin
            if(repeat_source)
                train_station[source][s_index] <= train_station[source][s_index];
            else
                train_station[source][s_index] <= destination;
            if(repeat_destination)
                train_station[destination][d_index] <= train_station[destination][d_index];
            else
                train_station[destination][d_index] <= source;
        end
        else
        begin
            for(i=0;i<16;i=i+1)
            begin
                for(j=0;j<8;j=j+1)
                begin
                    train_station[i][j] <= train_station[i][j];
                end
            end
        end
    end
    else if(state == DONE)
    begin
        for(i=0;i<16;i=i+1)
        begin
            for(j=0;j<8;j=j+1)
            begin
                train_station[i][j] <= 4'd15;
            end
        end
    end
end

//store_counter
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        for(i=0;i<16;i=i+1)
        begin
            store_counter[i] <= 4'd0;
        end
    end
    else if(state == DATA_STORE)
    begin
        if(in_valid && start)
        begin
            if(repeat_source)
                store_counter[source] <= store_counter[source];
            else
                store_counter[source] <= store_counter[source] + 4'd1;
            if(repeat_destination)
                store_counter[destination] <= store_counter[destination];
            else
                store_counter[destination] <= store_counter[destination] + 4'd1;
        end
        else
        begin
            for(i=0;i<16;i=i+1)
            begin
                store_counter[i] <= store_counter[i];
            end
        end
    end
    else if(state == DONE)
    begin
        for(i=0;i<16;i=i+1)
        begin
            store_counter[i] <= 4'd0;
        end
    end
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//ALGORITHM
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//back
assign back = (check_repeat && ((step_next + 3'd1) == store_counter[index]))? 1'b1 : 1'b0;

//back2
assign back2 = ((back || go_destination) && ((step_reg[index_1] + 3'd1) == store_counter[index_1]))? 1'b1 : 1'b0;

//back3
assign back3 = (back2 && ((step_reg[index_2] + 3'd1) == store_counter[index_2]))? 1'b1 : 1'b0;

//back4
assign back4 = (back3 && ((step_reg[index_3] + 3'd1) == store_counter[index_3]))? 1'b1 : 1'b0;

//back5
assign back5 = (back4 && ((step_reg[index_4] + 3'd1) == store_counter[index_4]))? 1'b1 : 1'b0;

//go_destination
assign go_destination = (train_station[index][step_next] == destination_station)? 1'b1 : 1'b0;

//possible
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        possible <= 1'b0;
    else if(state == ALGORITHM)
        if(go_destination)
            possible <= 1'b1;
        else
            possible <= possible;
    else
        possible <= 1'b0;
end

//done

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        done <= 1'b0;
    else if(state == DATA_STORE && start)
    begin
        if(in_valid)
        begin
            if((source == departure_station && destination == destination_station) || (source == destination_station && destination == departure_station))
                done <= 1'b1;
            else
                done <= done;
        end
        else
            done <= done;
    end
    else if(state == DONE)
        done <= 1'b0;
end

//      index
always @(*)
begin
    case(step_counter)
        3'd0 :
            index = path_reg[0];
        3'd1 :
            index = path_reg[1];
        3'd2 :
            index = path_reg[2];
        3'd3 :
            index = path_reg[3];
        3'd4 :
            index = path_reg[4];
        3'd5 :
            index = path_reg[5];
        3'd6 :
            index = path_reg[6];
        3'd7 :
            index = path_reg[7];
    endcase
end

assign counter_1 = step_counter - 3'd1;
//      index_1
always @(*)
begin
    case(counter_1)
        3'd0 :
            index_1 = path_reg[0];
        3'd1 :
            index_1 = path_reg[1];
        3'd2 :
            index_1 = path_reg[2];
        3'd3 :
            index_1 = path_reg[3];
        3'd4 :
            index_1 = path_reg[4];
        3'd5 :
            index_1 = path_reg[5];
        3'd6 :
            index_1 = path_reg[6];
        3'd7 :
            index_1 = path_reg[7];
    endcase
end

assign counter_2 = step_counter - 3'd2;
//      index_2
always @(*)
begin
    case(counter_2)
        3'd0 :
            index_2 = path_reg[0];
        3'd1 :
            index_2 = path_reg[1];
        3'd2 :
            index_2 = path_reg[2];
        3'd3 :
            index_2 = path_reg[3];
        3'd4 :
            index_2 = path_reg[4];
        3'd5 :
            index_2 = path_reg[5];
        3'd6 :
            index_2 = path_reg[6];
        3'd7 :
            index_2 = path_reg[7];
    endcase
end

assign counter_3 = step_counter - 3'd3;
//      index_3
always @(*)
begin
    case(counter_3)
        3'd0 :
            index_3 = path_reg[0];
        3'd1 :
            index_3 = path_reg[1];
        3'd2 :
            index_3 = path_reg[2];
        3'd3 :
            index_3 = path_reg[3];
        3'd4 :
            index_3 = path_reg[4];
        3'd5 :
            index_3 = path_reg[5];
        3'd6 :
            index_3 = path_reg[6];
        3'd7 :
            index_3 = path_reg[7];
    endcase
end

assign counter_4 = step_counter - 3'd4;
//      index_4
always @(*)
begin
    case(counter_4)
        3'd0 :
            index_4 = path_reg[0];
        3'd1 :
            index_4 = path_reg[1];
        3'd2 :
            index_4 = path_reg[2];
        3'd3 :
            index_4 = path_reg[3];
        3'd4 :
            index_4 = path_reg[4];
        3'd5 :
            index_4 = path_reg[5];
        3'd6 :
            index_4 = path_reg[6];
        3'd7 :
            index_4 = path_reg[7];
    endcase
end

assign counter_5 = step_counter - 3'd5;
//      index_5
always @(*)
begin
    case(counter_5)
        3'd0 :
            index_5 = path_reg[0];
        3'd1 :
            index_5 = path_reg[1];
        3'd2 :
            index_5 = path_reg[2];
        3'd3 :
            index_5 = path_reg[3];
        3'd4 :
            index_5 = path_reg[4];
        3'd5 :
            index_5 = path_reg[5];
        3'd6 :
            index_5 = path_reg[6];
        3'd7 :
            index_5 = path_reg[7];
    endcase
end

//step_next
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        step_next <= 3'd0;
    else if(state == ALGORITHM)
    begin
        if(back5)
            step_next <=step_reg[index_5] + 3'd1;
        else if(back4)
            step_next <=step_reg[index_4] + 3'd1;
        else if(back3)
            step_next <=step_reg[index_3] + 3'd1;
        else if(back2)
            step_next <=step_reg[index_2] + 3'd1;
        else if(back || go_destination)
            step_next <= step_reg[index_1] + 3'd1;
        else if(check_repeat)
        begin
            if(step_next == store_counter[index])
                step_next <= step_next;
            else
                step_next <= step_next + 3'd1;
        end
        else
            step_next <= 3'd0;
    end
    else if(state == DONE)
        step_next <= 3'd0;
end

//step_counter
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        step_counter <= 3'd0;
    else if(state == ALGORITHM)
    begin
        if(back5)
            step_counter <= step_counter - 3'd5;
        else if(back4)
            step_counter <= step_counter - 3'd4;
        else if(back3)
            step_counter <= step_counter - 3'd3;
        else if(back2)
            step_counter <= step_counter - 3'd2;
        else if(back || go_destination)
            step_counter <= step_counter - 3'd1;
        else if(!check_repeat)
            step_counter <= step_counter + 3'd1;
        else
            step_counter <= step_counter;
    end
    else if(state == DONE)
        step_counter <= 3'd0;
end

//path_reg
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        path_reg[0] <= 5'd0;
        for(i=1;i<9;i=i+1)
        begin
            path_reg[i] <= 5'd16;
        end
    end
    else if(state == DATA_STORE)
    begin
        if(in_valid && !start)
            path_reg[0] <= source;
        else
            path_reg[0] <= path_reg[0];
    end
    else if(state == ALGORITHM)
    begin
        if(back5)
        begin
            path_reg[step_counter - 3'd4] <= 5'd16;
            path_reg[step_counter - 3'd3] <= 5'd16;
            path_reg[step_counter - 3'd2] <= 5'd16;
            path_reg[step_counter - 3'd1] <= 5'd16;
            path_reg[step_counter] <= 5'd16;
        end
        else if(back4)
        begin
            path_reg[step_counter - 3'd3] <= 5'd16;
            path_reg[step_counter - 3'd2] <= 5'd16;
            path_reg[step_counter - 3'd1] <= 5'd16;
            path_reg[step_counter] <= 5'd16;
        end
        else if(back3)
        begin
            path_reg[step_counter - 3'd2] <= 5'd16;
            path_reg[step_counter - 3'd1] <= 5'd16;
            path_reg[step_counter] <= 5'd16;
        end
        else if(back2)
        begin
            path_reg[step_counter - 3'd1] <= 5'd16;
            path_reg[step_counter] <= 5'd16;
        end
        else if(back || go_destination)
            path_reg[step_counter] <= 5'd16;
        else if(!check_repeat)
            path_reg[step_counter + 3'd1] <= train_station[index][step_next];
        else
            path_reg[step_counter] <= path_reg[step_counter];
    end
    else if(state == DONE)
    begin
        for(i=1;i<9;i=i+1)
        begin
            path_reg[i] <= 5'd16;
        end
    end
end

//step_reg
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        for(i=0;i<16;i=i+1)
        begin
            step_reg[i] <= 3'd0;
        end
    end
    else if(state == ALGORITHM)
    begin
        if(back5)
        begin
            step_reg[index_4] <= 3'd0;
            step_reg[index_3] <= 3'd0;
            step_reg[index_2] <= 3'd0;
            step_reg[index_1] <= 3'd0;
        end
        else if(back4)
        begin
            step_reg[index_3] <= 3'd0;
            step_reg[index_2] <= 3'd0;
            step_reg[index_1] <= 3'd0;
        end
        else if(back3)
        begin
            step_reg[index_2] <= 3'd0;
            step_reg[index_1] <= 3'd0;
        end
        else if(back2)
            step_reg[index_1] <= 3'd0;
        else if(!check_repeat)
            step_reg[index] <= step_next;
        else
            step_reg[index] <= step_reg[index];
    end
    else if(state == DONE)
    begin
        for(i=0;i<16;i=i+1)
        begin
            step_reg[i] <= 3'd0;
        end
    end
end

//check_repeat
always @(*)
begin
    if(state == ALGORITHM)
    begin
        for(i=0;i<8;i=i+1)
        begin
            if(path_reg[i] == train_station[index][step_next])
                check_repeat[i] = 1'b1;
            else
                check_repeat[i] = 1'b0;
        end
    end
    else
        check_repeat = 8'd0;
end

//cost_last
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        cost_last <= 3'd7;
    else if(state == ALGORITHM && go_destination)
    begin
        if(cost_last > step_counter + 3'd1)
            cost_last <= step_counter + 3'd1;
        else
            cost_last <= cost_last;
    end
    else if(state == DONE)
        cost_last <= 3'd7;
end

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
//out_valid
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        cost <= 4'd0;
    else if(state == DONE)
    begin
        if(done)
            cost <= 4'd1;
        else if(possible)
            cost <= cost_last;
        else
            cost <= 4'd0;
    end
    else if(state == GO)
        cost <= 4'd0;
end

endmodule
