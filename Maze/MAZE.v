module MAZE( clk, rst_n, in_valid, in, out_valid, out);
input clk;
input rst_n;
input in_valid;
input in;
output reg out_valid;
output reg [1:0] out;
//============================================================================
reg [1:0] state, next_state;
parameter[1:0] GENERATION = 2'b00, ALGORITHM = 2'b01, SOLVE_MAZE = 2'b10, DONE = 2'b11;
reg [0:18] maze [0:18];
reg [0:18] maze_result [0:18];
reg in_reg;
reg [4:0] x_count, y_count;
reg [5:0] ALGORITHM_counter;
reg [1:0] out_w;
reg start;
integer  i, j;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//FSM
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(*)
begin
    case (state)
        GENERATION :
        begin
            if(x_count == 5'd17 && y_count == 5'd17)
                next_state = ALGORITHM;
            else
                next_state = GENERATION;
        end

        ALGORITHM :
        begin
            if(ALGORITHM_counter == 6'd43)
                next_state = SOLVE_MAZE;
            else
                next_state = ALGORITHM;
        end

        SOLVE_MAZE :
        begin
            if(x_count == 5'd17 && y_count == 5'd17)
                next_state = DONE;
            else
                next_state = SOLVE_MAZE;
        end
        DONE :
            next_state = GENERATION;

        default:
            next_state = state;
    endcase
end

always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        state <= GENERATION;
    else
        state <= next_state;
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//GENERATION　&&　ALGORITHM
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//      start
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        start <= 1'b0;
    else if(state == GENERATION)
    begin
        if(in_valid)
            start <= 1'b1;
        else
            start <= 1'b0;
    end
end

//      in_reg
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        in_reg <= 1'b0;
    else if(state == GENERATION)
    begin
        if(in_valid)
            in_reg <= in;
        else
            in_reg <= in_reg;
    end
end

//      x_count
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        x_count <= 5'd1;
    else if(state == GENERATION)
    begin
        if(y_count == 5'd17 && start)
        begin
            if(x_count == 5'd17)
                x_count <= 5'd1;
            else
                x_count <= x_count + 5'd1;
        end
        else
            x_count <= x_count;
    end
    else if(state == SOLVE_MAZE)
    begin
        case(out_w)
            2'b00 :
                x_count <= x_count;
            2'b01 :
                x_count <= x_count + 5'd1;
            2'b10 :
                x_count <= x_count ;
            2'b11 :
                x_count <= x_count - 5'd1;
        endcase
    end
    else if(state == DONE)
        x_count <= 5'd1;
end

//      y_count
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        y_count <= 5'd1;
    else if(state == GENERATION && start)
    begin
        if(y_count == 5'd17)
            y_count <= 5'd1;
        else
            y_count <= y_count + 5'd1;
    end
    else if(state == SOLVE_MAZE)
    begin
        case(out_w)
            2'b00 :
                y_count <= y_count + 5'd1;
            2'b01 :
                y_count <= y_count;
            2'b10 :
                y_count <= y_count - 5'd1;
            2'b11 :
                y_count <= y_count;
        endcase
    end
    else if(state == DONE)
        y_count <= 5'd1;
end

//      maze
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
    begin
        for (i=1;i<18;i=i+1)
        begin
            maze[i] <= 19'd0;
        end
        maze[0] <= 19'b0100000000000000000;
        maze[18] <= 19'b0000000000000000010;
    end
    else if(state == GENERATION && start)
        maze[x_count][y_count] <= in_reg;
    else if(state == ALGORITHM)
    begin
        for (i=1;i<18;i=i+1)
        begin
            for(j=1;j<18;j=j+1)
            begin
                maze[i][j] <= maze_result[i][j];
            end
        end
    end
    else if(state == SOLVE_MAZE  && out_valid)
        maze[x_count][y_count] <= 1'b0;
    else if(state == DONE)
    begin
        for (i=1;i<18;i=i+1)
        begin
            maze[i] <= 19'd0;
        end
        maze[0] <= 19'b0100000000000000000;
        maze[18] <= 19'b0000000000000000010;
    end
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//ALGORITHM
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//      maze_result
always @(*)
begin
    for(i=1;i<18;i=i+1)
    begin
        for(j=1;j<18;j=j+1)
        begin
            if(!maze[i][j])
                maze_result[i][j] = 1'b0;
            else
                maze_result[i][j] = (maze[i-1][j] && (maze[i][j-1] || maze[i][j+1] || maze[i+1][j])) || (maze[i][j-1] && (maze[i][j+1] || maze[i+1][j])) || (maze[i][j+1] && maze[i+1][j]);
        end
    end
end

//      ALGORITHM_counter
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        ALGORITHM_counter <= 6'd0;
    else if(state == ALGORITHM)
    begin
        if(ALGORITHM_counter == 6'd43)
            ALGORITHM_counter <= 6'd0;
        else
            ALGORITHM_counter <= ALGORITHM_counter + 6'd1;
    end
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//out
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//      out_w
always @(*)
begin
    if(maze[x_count][y_count + 5'd1])
        out_w = 2'd0;
    else if(maze[x_count + 5'd1][y_count])
        out_w = 2'd1;
    else if(maze[x_count][y_count - 5'd1])
        out_w = 2'd2;
    else if(maze[x_count - 5'd1][y_count])
        out_w = 2'd3;
    else
        out_w = 2'd0;
end

//      out
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        out <= 2'd0;
    else if(state == SOLVE_MAZE)
    begin
        if(x_count == 5'd17 && y_count == 5'd17)
            out <= 2'd0;
        else
            out <= out_w;
    end
end
    
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//out_valid
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//      out_valid
always @(posedge clk or negedge rst_n)
begin
    if(!rst_n)
        out_valid <= 1'b0;
    else if(state == SOLVE_MAZE)
    begin
        if(x_count == 5'd17 && y_count == 5'd17)
            out_valid <= 1'b0;
        else
            out_valid <= 1'b1;
    end
end

endmodule
