module JAM (CLK, RST, W, J, Cost, MatchCount, MinCost, Valid);
input CLK;
input RST;
input [6:0] Cost;
output reg [2:0] W; //row
output reg [2:0] J; //column
output reg [3:0] MatchCount;
output reg [9:0] MinCost;
output reg Valid;
//====================================================================
reg[2:0] state, next_state;
parameter[2:0] IDLE = 3'b000, PASS_ADDRESS_1 = 3'b001, TRANSFORM = 3'b010, PASS_ADDRESS_2 = 3'b011, COMPARE = 3'b100, DONE = 3'b101;
reg[2:0] J_0, J_1, J_2, J_3, J_4, J_5, J_6, J_7;
reg[9:0] MinCost_1;
reg counter;
//====================================================================
//                   state 轉換                  //
always @(*)
begin
    case(state)
        IDLE :
            next_state = PASS_ADDRESS_1;

        PASS_ADDRESS_1 :
        begin
            if(W == 3'd7 && counter == 1'b1)
                next_state = TRANSFORM;
            else
                next_state = PASS_ADDRESS_1;
        end

        TRANSFORM :
            next_state = PASS_ADDRESS_2;

        PASS_ADDRESS_2 :
        begin
            if(W == 3'd7 && counter == 1'b1)
                next_state = COMPARE;
            else
                next_state = PASS_ADDRESS_2;
        end

        COMPARE :
        begin
            if(Valid)
                next_state = DONE;
            else
                next_state = TRANSFORM;
        end

        DONE :
            next_state = DONE;
    endcase
end

//           TRANSFORM 位置運算          //
always @(posedge CLK or posedge RST)
begin
    if(RST)
    begin
        J_0 <= 3'd0;
        J_1 <= 3'd1;
        J_2 <= 3'd2;
        J_3 <= 3'd3;
        J_4 <= 3'd4;
        J_5 <= 3'd5;
        J_6 <= 3'd6;
        J_7 <= 3'd7;
    end
    else if(state == TRANSFORM)
    begin
        if(J_7 > J_6)
        begin
            J_7 <= J_6;
            J_6 <= J_7;
        end
        else if(J_6 > J_5)
        begin
            if(J_7 > J_5)
            begin
                J_5 <= J_7;
                J_6 <= J_5;
                J_7 <= J_6;
            end
            else
            begin
                J_5 <= J_6;
                J_6 <= J_7;
                J_7 <= J_5;
            end
        end
        else if(J_5 > J_4)
        begin
            if(J_7 > J_4)
            begin
                J_4 <= J_7;
                J_5 <= J_4;
                J_6 <= J_6;
                J_7 <= J_5;
            end
            else if(J_6 > J_4)
            begin
                J_4 <= J_6;
                J_5 <= J_7;
                J_6 <= J_4;
                J_7 <= J_5;
            end
            else
            begin
                J_4 <= J_5;
                J_5 <= J_7;
                J_6 <= J_6;
                J_7 <= J_4;
            end
        end
        else if(J_4 > J_3)
        begin
            if(J_7 > J_3)
            begin
                J_3 <= J_7;
                J_4 <= J_3;
                J_5 <= J_6;
                J_6 <= J_5;
                J_7 <= J_4;
            end
            else if(J_6 > J_3)
            begin
                J_3 <= J_6;
                J_4 <= J_7;
                J_5 <= J_3;
                J_6 <= J_5;
                J_7 <= J_4;
            end
            else if(J_5 > J_3)
            begin
                J_3 <= J_5;
                J_4 <= J_7;
                J_5 <= J_6;
                J_6 <= J_3;
                J_7 <= J_4;
            end
            else
            begin
                J_3 <= J_4;
                J_4 <= J_7;
                J_5 <= J_6;
                J_6 <= J_5;
                J_7 <= J_3;
            end
        end
        else if(J_3 > J_2)
        begin
            if(J_7 > J_2)
            begin
                J_2 <= J_7;
                J_3 <= J_2;
                J_4 <= J_6;
                J_5 <= J_5;
                J_6 <= J_4;
                J_7 <= J_3;
            end
            else if(J_6 > J_2)
            begin
                J_2 <= J_6;
                J_3 <= J_7;
                J_4 <= J_2;
                J_5 <= J_5;
                J_6 <= J_4;
                J_7 <= J_3;
            end
            else if(J_5 > J_2)
            begin
                J_2 <= J_5;
                J_3 <= J_7;
                J_4 <= J_6;
                J_5 <= J_2;
                J_6 <= J_4;
                J_7 <= J_3;
            end
            else if(J_4 > J_2)
            begin
                J_2 <= J_4;
                J_3 <= J_7;
                J_4 <= J_6;
                J_5 <= J_5;
                J_6 <= J_2;
                J_7 <= J_3;
            end
            else
            begin
                J_2 <= J_3;
                J_3 <= J_7;
                J_4 <= J_6;
                J_5 <= J_5;
                J_6 <= J_4;
                J_7 <= J_2;
            end
        end
        else if(J_2 > J_1)
        begin
            if(J_7 > J_1)
            begin
                J_1 <= J_7;
                J_2 <= J_1;
                J_3 <= J_6;
                J_4 <= J_5;
                J_5 <= J_4;
                J_6 <= J_3;
                J_7 <= J_2;
            end
            else if(J_6 > J_1)
            begin
                J_1 <= J_6;
                J_2 <= J_7;
                J_3 <= J_1;
                J_4 <= J_5;
                J_5 <= J_4;
                J_6 <= J_3;
                J_7 <= J_2;
            end
            else if(J_5 > J_1)
            begin
                J_1 <= J_5;
                J_2 <= J_7;
                J_3 <= J_6;
                J_4 <= J_1;
                J_5 <= J_4;
                J_6 <= J_3;
                J_7 <= J_2;
            end
            else if(J_4 > J_1)
            begin
                J_1 <= J_4;
                J_2 <= J_7;
                J_3 <= J_6;
                J_4 <= J_5;
                J_5 <= J_1;
                J_6 <= J_3;
                J_7 <= J_2;
            end
            else if(J_3 > J_1)
            begin
                J_1 <= J_3;
                J_2 <= J_7;
                J_3 <= J_6;
                J_4 <= J_5;
                J_5 <= J_4;
                J_6 <= J_1;
                J_7 <= J_2;
            end
            else
            begin
                J_1 <= J_2;
                J_2 <= J_7;
                J_3 <= J_6;
                J_4 <= J_5;
                J_5 <= J_4;
                J_6 <= J_3;
                J_7 <= J_1;
            end
        end
        else if(J_1 > J_0)
        begin
            if(J_7 > J_0)
            begin
                J_0 <= J_7;
                J_1 <= J_0;
                J_2 <= J_6;
                J_3 <= J_5;
                J_4 <= J_4;
                J_5 <= J_3;
                J_6 <= J_2;
                J_7 <= J_1;
            end
            else if(J_6 > J_0)
            begin
                J_0 <= J_6;
                J_1 <= J_7;
                J_2 <= J_0;
                J_3 <= J_5;
                J_4 <= J_4;
                J_5 <= J_3;
                J_6 <= J_2;
                J_7 <= J_1;
            end
            else if(J_5 > J_0)
            begin
                J_0 <= J_5;
                J_1 <= J_7;
                J_2 <= J_6;
                J_3 <= J_0;
                J_4 <= J_4;
                J_5 <= J_3;
                J_6 <= J_2;
                J_7 <= J_1;
            end
            else if(J_4 > J_0)
            begin
                J_0 <= J_4;
                J_1 <= J_7;
                J_2 <= J_6;
                J_3 <= J_5;
                J_4 <= J_0;
                J_5 <= J_3;
                J_6 <= J_2;
                J_7 <= J_1;
            end
            else if(J_3 > J_0)
            begin
                J_0 <= J_3;
                J_1 <= J_7;
                J_2 <= J_6;
                J_3 <= J_5;
                J_4 <= J_4;
                J_5 <= J_0;
                J_6 <= J_2;
                J_7 <= J_1;
            end
            else if(J_2 > J_0)
            begin
                J_0 <= J_2;
                J_1 <= J_7;
                J_2 <= J_6;
                J_3 <= J_5;
                J_4 <= J_4;
                J_5 <= J_3;
                J_6 <= J_0;
                J_7 <= J_1;
            end
            else
            begin
                J_0 <= J_1;
                J_1 <= J_7;
                J_2 <= J_6;
                J_3 <= J_5;
                J_4 <= J_4;
                J_5 <= J_3;
                J_6 <= J_2;
                J_7 <= J_0;
            end
        end
        else
        begin
            J_7 <= J_7;
            J_6 <= J_6;
            J_5 <= J_5;
            J_4 <= J_4;
            J_3 <= J_3;
            J_2 <= J_2;
            J_1 <= J_1;
            J_0 <= J_0;
        end

    end
end

//                 counter                 //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        counter <= 1'b0;
    else if(state == PASS_ADDRESS_1 || state == PASS_ADDRESS_2)
    begin
        if(W == 3'd7)
            if(counter)
                counter <= 1'b0;
            else
                counter <= counter + 1'b1;
    end
    else
        counter <= counter;
end
//              PASS_ADDRESS W              //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        W <= 3'd0;
    else if(state == PASS_ADDRESS_1 || state == PASS_ADDRESS_2)
    begin
        if(W > 3'd6)
        begin
            if(counter)
                W <= 3'd0;
            else
                W <= W;
        end
        else
            W <= W + 3'd1;
    end
    else
        W <= W;
end

//              PASS_ADDRESS J              //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        J <= J_0;
    else if(state == PASS_ADDRESS_1 || state == PASS_ADDRESS_2)
    begin
        case(W)
            3'd0 :
                J <= J_1;

            3'd1 :
                J <= J_2;

            3'd2 :
                J <= J_3;

            3'd3 :
                J <= J_4;

            3'd4 :
                J <= J_5;

            3'd5 :
                J <= J_6;

            3'd6 :
                J <= J_7;

            3'd7 :
            begin
                if(counter)
                    J <= J_0;
                else
                    J <= J;
            end

        endcase
    end
    else
        J <= J;
end

//           PASS_ADDRESS MinCost && MatchCount      //
always @(posedge CLK or posedge RST)
begin
    if(RST)
    begin
        MinCost <= 10'd0;
        MatchCount <= 4'd0;
    end
    else if(state == PASS_ADDRESS_1)
    begin
        if(W > 3'd0)
        begin
            MinCost <= MinCost + Cost;
            MatchCount <= 4'd1;
        end
        else
        begin
            MinCost <= MinCost;
            MatchCount <= MatchCount;
        end
    end
    else if(state == COMPARE)
    begin
        if(MinCost > MinCost_1)
        begin
            MinCost <= MinCost_1;
            MatchCount <= 4'd1;
        end
        else if(MinCost == MinCost_1)
        begin
            MinCost <= MinCost;
            MatchCount <= MatchCount + 4'd1;
        end
        else
        begin
            MinCost <= MinCost;
            MatchCount <= MatchCount;
        end
    end
    else
    begin
        MinCost <= MinCost;
        MatchCount <= MatchCount;
    end
end

//           PASS_ADDRESS MinCost_1      //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        MinCost_1 <= 10'd0;
    else if(state == PASS_ADDRESS_2)
    begin
        if(W > 3'd0)
            MinCost_1 <= MinCost_1 + Cost;
        else
            MinCost_1 <= MinCost_1;
    end
    else if(state == COMPARE)
        MinCost_1 <= 10'd0;
    else
        MinCost_1 <= MinCost_1;
end

//                 Valid                 //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        Valid <= 1'd0;
    else if(state == COMPARE && J_0 == 3'd7 && J_1 == 3'd6 && J_2 == 3'd5 && J_3 == 3'd4 && J_4 == 3'd3 && J_5 == 3'd2 && J_6 == 3'd1 && J_7 == 3'd0)
        Valid <= 1'd1;
    else
        Valid <= Valid;
end

//              state 儲存              //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        state <= IDLE;
    else
        state <= next_state;
end

endmodule
