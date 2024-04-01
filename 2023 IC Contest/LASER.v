module LASER ( CLK, RST, X, Y, C1X, C1Y, C2X, C2Y, DONE);
input CLK;
input RST;
input [3:0] X;
input [3:0] Y;
output reg [3:0] C1X;
output reg [3:0] C1Y;
output reg [3:0] C2X;
output reg [3:0] C2Y;
output reg DONE;
//============================================================================
reg [3:0] state, next_state;
parameter [3:0] DATA_STORE = 4'd0, CIRCLE1_CHANGE = 4'd1, COUNT_CIRCLE1 = 4'd2, COMPARE_1 = 4'd3, CIRCLE2_CHANGE = 4'd4,
          COUNT_CIRCLE2 = 4'd5, COMPARE_2 = 4'd6, CIRCLE1_CHANGE2 = 4'd7, COUNT_CIRCLE12 = 4'd8, COMPARE_ROUND2 = 4'd9, CIRCLE2_CHANGE2 = 4'd10,
          COUNT_CIRCLE22 = 4'd11, COMPARE_2_ROUND2 = 4'd12, COMPARE_TOTAL = 4'd13, FINISH = 4'd14;
reg [5:0] count_c1, count_c12, count_reg, count_total_reg; //找最佳解
reg [5:0] total_1, total_2;
reg [3:0] C1X_BEST;   //找最好的圓心
reg [3:0] C1Y_BEST;   //找最好的圓心
reg [3:0] C2X_BEST;   //找最好的圓心
reg [3:0] C2Y_BEST;   //找最好的圓心
reg [3:0]  X_1[39:0]; //存40個點
reg [3:0]  Y_1[39:0]; //存40個點
reg [5:0] counter1;
reg step1;
reg flag1;
reg flag2;
reg [3:0] C1X_COUNT, C1X_COUNT2; //算x座標有沒有在園內
reg [3:0] C1Y_COUNT, C1Y_COUNT2; //算y座標有沒有在園內
reg [3:0] C2X_COUNT; //算x座標有沒有在園內
reg [3:0] C2Y_COUNT; //算y座標有沒有在園內
reg [2:0] COLUMN, ROW;
integer  i;
//============================================================================
//                 state 轉換                 //
always @(*)
begin
    case(state)
        DATA_STORE :
            next_state = (counter1 == 6'd39)? CIRCLE1_CHANGE : DATA_STORE;

        CIRCLE1_CHANGE :
            next_state = COUNT_CIRCLE1;

        COUNT_CIRCLE1 :
            next_state =(step1 == 1 && counter1 == 6'd19)? COMPARE_1 :COUNT_CIRCLE1;

        COMPARE_1 :
            next_state =(C1X_BEST == 4'd15 && C1Y_BEST == 4'd15)? CIRCLE2_CHANGE : CIRCLE1_CHANGE;

        CIRCLE2_CHANGE :
            next_state = COUNT_CIRCLE2;

        COUNT_CIRCLE2 :
            next_state =(step1 == 1 && counter1 == 6'd39)? COMPARE_2 : COUNT_CIRCLE2;

        COMPARE_2 :
            next_state =(C2X_BEST == 4'd15 && C2Y_BEST == 4'd15)?  CIRCLE1_CHANGE2 : CIRCLE2_CHANGE;

        CIRCLE1_CHANGE2 :
            next_state = COUNT_CIRCLE12;

        COUNT_CIRCLE12 :
            next_state =(step1 == 1 && counter1 == 6'd39)? COMPARE_ROUND2 :COUNT_CIRCLE12;

        COMPARE_ROUND2 :
            next_state =(COLUMN == 3'd5 && ROW == 3'd4)? CIRCLE2_CHANGE2 : CIRCLE1_CHANGE2;

        CIRCLE2_CHANGE2 :
            next_state = COUNT_CIRCLE22;

        COUNT_CIRCLE22 :
            next_state =(step1 == 1 && counter1 == 6'd39)? COMPARE_2_ROUND2 : COUNT_CIRCLE22;

        COMPARE_2_ROUND2 :
            next_state =(COLUMN == 3'd5 && ROW == 3'd4)? COMPARE_TOTAL : CIRCLE2_CHANGE2;

        COMPARE_TOTAL :
            next_state =(total_1 == total_2)? FINISH : CIRCLE1_CHANGE2;

        FINISH :
            next_state = DATA_STORE;

        default :
            next_state = state;
    endcase
end

//                 state 儲存                 //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        state <= DATA_STORE;
    else
        state <= next_state;
end

//                  counter1                  //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        counter1 <= 6'd0;
    else
    begin
        case(state)
            DATA_STORE :
            begin
                if(counter1 == 6'd39)
                    counter1 <= 6'd0;
                else
                    counter1 <= counter1 + 6'd1;
            end

            COUNT_CIRCLE1 :
            begin
                if(counter1 == 6'd19 && step1 == 1'b1)
                    counter1 <= 6'd0;
                else
                begin
                    if(step1)
                        counter1 <= counter1 + 6'd1;
                    else
                        counter1 <= counter1;
                end
            end

            COUNT_CIRCLE2 :
            begin
                if(counter1 == 6'd39 && step1 == 1'b1)
                    counter1 <= 6'd0;
                else
                begin
                    if(step1)
                        counter1 <= counter1 + 6'd1;
                    else
                        counter1 <= counter1;
                end
            end

            COUNT_CIRCLE12 :
            begin
                if(counter1 == 6'd39 && step1 == 1'b1)
                    counter1 <= 6'd0;
                else
                begin
                    if(step1)
                        counter1 <= counter1 + 6'd1;
                    else
                        counter1 <= counter1;
                end
            end

            COUNT_CIRCLE22 :
            begin
                if(counter1 == 6'd39 && step1 == 1'b1)
                    counter1 <= 6'd0;
                else
                begin
                    if(step1)
                        counter1 <= counter1 + 6'd1;
                    else
                        counter1 <= counter1;
                end
            end

            default :
                counter1 <= counter1;
        endcase
    end
end

//                  step1                  //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        step1 <= 1'b0;
    else if(state == COUNT_CIRCLE1 || state == COUNT_CIRCLE2 || state == COUNT_CIRCLE12 || state == COUNT_CIRCLE22)
        step1 <= step1 + 1'b1;
    else if(state == FINISH)
        step1 <= 1'b0;
    else
        step1 <= step1;
end

//                  flag1                  //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        flag1 <= 1'b0;
    else if(state == COMPARE_1 || state == COMPARE_ROUND2)
        flag1 <=  1'b1;
    else if(state == CIRCLE2_CHANGE || state == FINISH)
        flag1 <= 1'b0;
    else if(state == FINISH)
        flag1 <= 1'b0;
    else
        flag1 <= flag1;
end

//                  flag2                  //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        flag2 <= 1'b0;
    else if(state == COMPARE_2 || state == COMPARE_2_ROUND2)
        flag2 <= 1'b1;
    else if(state == CIRCLE1_CHANGE2 || state == FINISH)
        flag2 <= 1'b0;
    else if(state == FINISH)
        flag2 <= 1'b0;
    else
        flag2 <= flag2;
end

//                 40個點x座標儲存                 //
always @(posedge CLK or posedge RST)
begin
    if(RST)
    begin
        for(i=0;i<40;i=i+1)
        begin
            X_1[i] <= 4'd0;
        end
    end
    else if(state == DATA_STORE)
        X_1[counter1] <= X;
    else
    begin
        for(i=0;i<40;i=i+1)
        begin
            X_1[i] <= X_1[i];
        end
    end
end

//                 40個點y座標儲存                 //
always @(posedge CLK or posedge RST)
begin
    if(RST)
    begin
        for(i=0;i<40;i=i+1)
        begin
            Y_1[i] <= 4'd0;
        end
    end
    else if(state == DATA_STORE)
        Y_1[counter1] <= Y;
    else
    begin
        for(i=0;i<40;i=i+1)
        begin
            Y_1[i] <= Y_1[i];
        end
    end
end

//      COLUMN
always @(posedge CLK or posedge RST)
begin
    if(RST)
        COLUMN <= 3'd0;
    else if(state == CIRCLE1_CHANGE2 || state == CIRCLE2_CHANGE2)
    begin
        if(COLUMN == 3'd5)
        begin
            if(ROW == 3'd4)
                COLUMN <= COLUMN;
            else
                COLUMN <= 3'd0;
        end
        else
            COLUMN <= COLUMN + 3'd1;
    end
    else if(state == COMPARE_ROUND2 && COLUMN == 3'd5 && ROW == 3'd4)
        COLUMN <= 3'd0;
    else if(state == COMPARE_2_ROUND2 && COLUMN == 3'd5 && ROW == 3'd4 )
        COLUMN <= 3'd0;
    else if(state == FINISH)
        COLUMN <= 3'd0;
    else
        COLUMN <= COLUMN;
end

//      ROW
always @(posedge CLK or posedge RST)
begin
    if(RST)
        ROW <= 3'd0;
    else if(state == CIRCLE1_CHANGE2 || state == CIRCLE2_CHANGE2)
    begin
        if(COLUMN == 3'd5)
        begin
            if(ROW == 3'd4)
                ROW <= ROW;
            else
                ROW <= ROW + 3'd1;
        end
        else
            ROW <= ROW;
    end
    else if(state == COMPARE_ROUND2 && COLUMN == 3'd5 && ROW == 3'd4)
        ROW <= 3'd0;
    else if(state == COMPARE_2_ROUND2 && COLUMN == 3'd5 && ROW == 3'd4 )
        ROW <= 3'd0;
    else if(state == FINISH)
        ROW <= 3'd0;
    else
        ROW <= ROW;
end

//                  C1X_BEST 運算                //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        C1X_BEST <= 4'd0;
    else if(state == CIRCLE1_CHANGE)
    begin
        if(C1Y_BEST == 4'd15)
        begin
            if(C1X_BEST == 4'd15)
                C1X_BEST <= 4'd0;
            else
                C1X_BEST <= C1X_BEST + 4'd1;
        end
        else
            C1X_BEST <= C1X_BEST;
    end
    else if(state == COMPARE_2 && C2X_BEST == 4'd15 && C2Y_BEST == 4'd15 && flag2 == 1'b1)
        C1X_BEST <= C1X - 4'd2;
    else if(state == COMPARE_TOTAL)
        C1X_BEST <= C1X - 4'd2;
    else if(state == CIRCLE1_CHANGE2)
    begin
        if(flag1)
        begin
            if(!COLUMN)
                C1X_BEST <= C1X_BEST;
            else
            begin
                if(COLUMN == 3'd5)
                begin
                    if(ROW == 3'd4)
                        C1X_BEST <= C1X_BEST;
                    else
                        C1X_BEST <= C1X_BEST - 4'd4;
                end
                else
                    C1X_BEST <= C1X_BEST + 4'd1;
            end
        end
        else
            C1X_BEST <= C1X_BEST;
    end
    else if(state == FINISH)
        C1X_BEST <= 4'd0;
    else
        C1X_BEST <= C1X_BEST;
end

//                  C1Y_BEST 運算                //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        C1Y_BEST <= 4'd0;
    else if(state == CIRCLE1_CHANGE)
    begin
        if(flag1)
        begin
            if(C1Y_BEST == 4'd15)
                C1Y_BEST <= 4'd0;
            else
                C1Y_BEST <= C1Y_BEST + 4'd1;
        end
        else
            C1Y_BEST <= 4'd0;
    end
    else if(state == COMPARE_2 && C2X_BEST == 4'd15 && C2Y_BEST == 4'd15 && flag2 == 1'b1)
        C1Y_BEST <= C1Y - 4'd2;
    else if(state == COMPARE_TOTAL)
        C1Y_BEST <= C1Y - 4'd2;
    else if(state == CIRCLE1_CHANGE2)
    begin
        if(COLUMN == 3'd5)
        begin
            if(ROW == 3'd4)
                C1Y_BEST <= C1Y_BEST;
            else
                C1Y_BEST <= C1Y_BEST + 4'd1;
        end
        else
            C1Y_BEST <= C1Y_BEST;
    end
    else if(state == FINISH)
        C1Y_BEST <= 4'd0;
    else
        C1Y_BEST <= C1Y_BEST;
end

//                COUNT_CIRCLE1 的 C1X_COUNT             //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        C1X_COUNT <= 4'd0;
    else if(state == COUNT_CIRCLE1 || state == COUNT_CIRCLE12)
    begin
        if(!step1)
        begin
            if(C1X_BEST > X_1[counter1])
                C1X_COUNT <= C1X_BEST - X_1[counter1];
            else
                C1X_COUNT <= X_1[counter1] - C1X_BEST;
        end
        else
            C1X_COUNT <= C1X_COUNT;
    end
    else if(state == COUNT_CIRCLE2 || state == COUNT_CIRCLE22)
    begin
        if(!step1)
        begin
            if(C1X > X_1[counter1])
                C1X_COUNT <= C1X - X_1[counter1];
            else
                C1X_COUNT <= X_1[counter1] - C1X;
        end
        else
            C1X_COUNT <= C1X_COUNT;
    end
    else if(state == FINISH)
        C1X_COUNT <= 4'd0;
    else
        C1X_COUNT <= C1X_COUNT;
end

//                COUNT_CIRCLE1 的 C1X_COUNT2             //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        C1X_COUNT2 <= 4'd0;
    else if(state == COUNT_CIRCLE1)
    begin
        if(!step1)
        begin
            if(C1X_BEST > X_1[counter1 + 6'd20])
                C1X_COUNT2 <= C1X_BEST - X_1[counter1 + 6'd20];
            else
                C1X_COUNT2 <= X_1[counter1 + 6'd20] - C1X_BEST;
        end
        else
            C1X_COUNT2 <= C1X_COUNT2;
    end
    else
        C1X_COUNT2 <= C1X_COUNT2;
end
//               COUNT_CIRCLE1 的 C1Y_COUNT2              //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        C1Y_COUNT2 <= 4'd0;
    else if(state == COUNT_CIRCLE1)
    begin
        if(!step1)
        begin
            if(C1Y_BEST > Y_1[counter1 + 6'd20])
                C1Y_COUNT2 <= C1Y_BEST - Y_1[counter1 + 6'd20];
            else
                C1Y_COUNT2 <= Y_1[counter1 + 6'd20] - C1Y_BEST;
        end
        else
            C1Y_COUNT2 <= C1Y_COUNT2;
    end
    else
        C1Y_COUNT2 <= C1Y_COUNT2;
end
//               COUNT_CIRCLE1 的 C1Y_COUNT               //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        C1Y_COUNT <= 4'd0;
    else if(state == COUNT_CIRCLE1 || state == COUNT_CIRCLE12)
    begin
        if(!step1)
        begin
            if(C1Y_BEST > Y_1[counter1])
                C1Y_COUNT <= C1Y_BEST - Y_1[counter1];
            else
                C1Y_COUNT <= Y_1[counter1] - C1Y_BEST;
        end
        else
            C1Y_COUNT <= C1Y_COUNT;
    end
    else if(state == COUNT_CIRCLE2 || state == COUNT_CIRCLE22)
    begin
        if(!step1)
        begin
            if(C1Y > Y_1[counter1])
                C1Y_COUNT <= C1Y - Y_1[counter1];
            else
                C1Y_COUNT <= Y_1[counter1] - C1Y;
        end
        else
            C1Y_COUNT <= C1Y_COUNT;
    end
    else if(state == FINISH)
        C1Y_COUNT <= 4'd0;
    else
        C1Y_COUNT <= C1Y_COUNT;
end

//               COUNT_CIRCLE12              //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        count_c12 <= 4'd0;
    else if(state == COUNT_CIRCLE1)
    begin
        if(step1)
        begin
            case(C1X_COUNT2)
                4'd0 :
                begin
                    if(C1Y_COUNT2 < 4'd5)
                        count_c12 <= count_c12 + 6'd1;
                    else
                        count_c12 <= count_c12;
                end
                4'd1 :
                begin
                    if(C1Y_COUNT2 < 4'd4)
                        count_c12 <= count_c12 + 6'd1;
                    else
                        count_c12 <= count_c12;
                end
                4'd2 :
                begin
                    if(C1Y_COUNT2 < 4'd4)
                        count_c12 <= count_c12 + 6'd1;
                    else
                        count_c12 <= count_c12;
                end
                4'd3 :
                begin
                    if(C1Y_COUNT2 < 4'd3)
                        count_c12 <= count_c12 + 6'd1;
                    else
                        count_c12 <= count_c12;
                end
                4'd4 :
                begin
                    if(!C1Y_COUNT2)
                        count_c12 <= count_c12 + 6'd1;
                    else
                        count_c12 <= count_c12;
                end
                default :
                    count_c12 <= count_c12;
            endcase
        end
        else
            count_c12 <= count_c12;
    end
    else if(state == COMPARE_1)
        count_c12 <= 6'd0;
    else if(state == FINISH)
        count_c12 <= 6'd0;
    else
        count_c12 <= count_c12;
end
//               COUNT_CIRCLE1              //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        count_c1 <= 4'd0;
    else if(state == COUNT_CIRCLE1)
    begin
        if(step1)
        begin
            case(C1X_COUNT)
                4'd0 :
                begin
                    if(C1Y_COUNT < 4'd5)
                        count_c1 <= count_c1 + 6'd1;
                    else
                        count_c1 <= count_c1;
                end
                4'd1 :
                begin
                    if(C1Y_COUNT < 4'd4)
                        count_c1 <= count_c1 + 6'd1;
                    else
                        count_c1 <= count_c1;
                end
                4'd2 :
                begin
                    if(C1Y_COUNT < 4'd4)
                        count_c1 <= count_c1 + 6'd1;
                    else
                        count_c1 <= count_c1;
                end
                4'd3 :
                begin
                    if(C1Y_COUNT < 4'd3)
                        count_c1 <= count_c1 + 6'd1;
                    else
                        count_c1 <= count_c1;
                end
                4'd4 :
                begin
                    if(!C1Y_COUNT)
                        count_c1 <= count_c1 + 6'd1;
                    else
                        count_c1 <= count_c1;
                end
                default :
                    count_c1 <= count_c1;
            endcase
        end
        else
            count_c1 <= count_c1;
    end
    else if(state == COMPARE_1 || state == COMPARE_ROUND2)
        count_c1 <= 6'd0;
    else if(state == COUNT_CIRCLE12)
    begin
        if(step1)
        begin
            if(C2X_COUNT == 4'd0 && C2Y_COUNT < 4'd5)
                count_c1 <= count_c1;
            else if(C2X_COUNT == 4'd1 && C2Y_COUNT < 4'd4)
                count_c1 <= count_c1;
            else if(C2X_COUNT == 4'd2 && C2Y_COUNT < 4'd4)
                count_c1 <= count_c1;
            else if(C2X_COUNT == 4'd3 && C2Y_COUNT < 4'd3)
                count_c1 <= count_c1;
            else if(C2X_COUNT == 4'd4 && C2Y_COUNT == 4'd0)
                count_c1 <= count_c1;
            else
            begin
                case(C1X_COUNT)
                    4'd0 :
                    begin
                        if(C1Y_COUNT < 4'd5)
                            count_c1 <= count_c1 + 6'd1;
                        else
                            count_c1 <= count_c1;
                    end
                    4'd1 :
                    begin
                        if(C1Y_COUNT < 4'd4)
                            count_c1 <= count_c1 + 6'd1;
                        else
                            count_c1 <= count_c1;
                    end
                    4'd2 :
                    begin
                        if(C1Y_COUNT < 4'd4)
                            count_c1 <= count_c1 + 6'd1;
                        else
                            count_c1 <= count_c1;
                    end
                    4'd3 :
                    begin
                        if(C1Y_COUNT < 4'd3)
                            count_c1 <= count_c1 + 6'd1;
                        else
                            count_c1 <= count_c1;
                    end
                    4'd4 :
                    begin
                        if(!C1Y_COUNT)
                            count_c1 <= count_c1 + 6'd1;
                        else
                            count_c1 <= count_c1;
                    end
                    default :
                        count_c1 <= count_c1;
                endcase
            end
        end
    end
    else if(state == FINISH)
        count_c1 <= 6'd0;
    else
        count_c1 <= count_c1;
end

//           count_reg          //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        count_reg <= 6'd0;
    else if(state == COMPARE_1 && C1X_BEST == 4'd15 && C1Y_BEST == 4'd15)  // count_reg是當中介站, count_c1是最後一個,count_total_reg是前面最大的
    begin
        if((count_c1 + count_c12) > count_total_reg)
            count_reg <= count_c1 + count_c12;
        else
            count_reg <= count_total_reg;
    end
    else if(state == COMPARE_ROUND2 && COLUMN == 3'd5 && ROW == 3'd4)
    begin
        if(count_c1 > count_total_reg)
            count_reg <= count_c1;
        else
            count_reg <= count_total_reg;
    end
    else if(state == FINISH)
        count_reg <= 6'd0;
    else
        count_reg <= count_reg;
end

//             COMPARE_1 && COMPARE_2           //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        count_total_reg <= 6'd0;
    else if(state == COMPARE_1)
    begin
        if(!flag1)
            count_total_reg <= count_c1 + count_c12;
        else
        begin
            if((count_c1 + count_c12) > count_total_reg)
                count_total_reg <= count_c1 + count_c12;
            else
                count_total_reg <= count_total_reg;
        end
    end
    else if(state == COMPARE_ROUND2)
    begin
        if(!flag1)
            count_total_reg <= count_c1;
        else
        begin
            if(count_c1 > count_total_reg)
                count_total_reg <= count_c1;
            else
                count_total_reg <= count_total_reg;
        end
    end
    else if(state == COUNT_CIRCLE2 || state == COUNT_CIRCLE22)
    begin
        if(step1)
        begin
            if(C1X_COUNT == 4'd0 && C1Y_COUNT < 4'd5)
                count_total_reg <= count_total_reg;
            else if(C1X_COUNT == 4'd1 && C1Y_COUNT < 4'd4)
                count_total_reg <= count_total_reg;
            else if(C1X_COUNT == 4'd2 && C1Y_COUNT < 4'd4)
                count_total_reg <= count_total_reg;
            else if(C1X_COUNT == 4'd3 && C1Y_COUNT < 4'd3)
                count_total_reg <= count_total_reg;
            else if(C1X_COUNT == 4'd4 && C1Y_COUNT == 4'd0)
                count_total_reg <= count_total_reg;
            else
            begin
                case(C2X_COUNT)
                    4'd0 :
                    begin
                        if(C2Y_COUNT < 4'd5)
                            count_total_reg <= count_total_reg + 6'd1;
                        else
                            count_total_reg <= count_total_reg;
                    end
                    4'd1 :
                    begin
                        if(C2Y_COUNT < 4'd4)
                            count_total_reg <= count_total_reg + 6'd1;
                        else
                            count_total_reg <= count_total_reg;
                    end
                    4'd2 :
                    begin
                        if(C2Y_COUNT < 4'd4)
                            count_total_reg <= count_total_reg + 6'd1;
                        else
                            count_total_reg <= count_total_reg;
                    end
                    4'd3 :
                    begin
                        if(C2Y_COUNT < 4'd3)
                            count_total_reg <= count_total_reg + 6'd1;
                        else
                            count_total_reg <= count_total_reg;
                    end
                    4'd4 :
                    begin
                        if(!C2Y_COUNT)
                            count_total_reg <= count_total_reg + 6'd1;
                        else
                            count_total_reg <= count_total_reg;
                    end
                    default :
                        count_total_reg <= count_total_reg;
                endcase
            end
        end
    end
    else if(state == COMPARE_2 || state == COMPARE_2_ROUND2)
        count_total_reg <= count_reg;  //洗回第一圈的結果
    else if(state == FINISH || state == COMPARE_TOTAL)
        count_total_reg <= 6'd0;
    else
        count_total_reg <= count_total_reg;
end


//               C1X 找最佳圓1               //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        C1X <= 4'd0;
    else if(state == COMPARE_1)
    begin
        if(!flag1)
            C1X <= C1X_BEST;
        else
        begin
            if((count_c1 + count_c12)>= count_total_reg)
                C1X <= C1X_BEST;
            else
                C1X <= C1X;
        end
    end
    else if(state == COMPARE_ROUND2)
    begin
        if(!flag1)
            C1X <= C1X_BEST;
        else
        begin
            if((count_c1 + count_c12)>= count_total_reg)
                C1X <= C1X_BEST;
            else
                C1X <= C1X;
        end
    end
    else if(state == FINISH)
        C1X <= 4'd0;
    else
        C1X <= C1X;
end

//               C1Y 找最佳圓1               //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        C1Y <= 4'd0;
    else if(state == COMPARE_1)
    begin
        if(!flag1)
            C1Y <= C1Y_BEST;
        else
        begin
            if((count_c1 + count_c12) >= count_total_reg)
                C1Y <= C1Y_BEST;
            else
                C1Y <= C1Y;
        end
    end
    else if(state == COMPARE_ROUND2)
    begin
        if(!flag1)
            C1Y <= C1Y_BEST;
        else
        begin
            if((count_c1 + count_c12) >= count_total_reg)
                C1Y <= C1Y_BEST;
            else
                C1Y <= C1Y;
        end
    end
    else if(state == FINISH)
        C1Y <= 4'd0;
    else
        C1Y <= C1Y;
end

//                  C2X_BEST 運算                //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        C2X_BEST <= 4'd0;
    else if(state == CIRCLE2_CHANGE)
    begin
        if(C2Y_BEST == 4'd15)
        begin
            if(C2X_BEST == 4'd15)
                C2X_BEST <= 4'd0;
            else
                C2X_BEST <= C2X_BEST + 4'd1;
        end
        else
            C2X_BEST <= C2X_BEST;
    end
    else if(state == CIRCLE1_CHANGE2)
        C2X_BEST <= C2X;
    else if(state == COMPARE_TOTAL)
        C2X_BEST <= C2X - 4'd2;
    else if(state == COMPARE_ROUND2 && COLUMN == 3'd5 && ROW == 3'd4 )
        C2X_BEST <= C2X - 4'd2;
    else if(state == CIRCLE2_CHANGE2)
    begin
        if(flag2)
        begin
            if(!COLUMN)
                C2X_BEST <= C2X_BEST;
            else
            begin
                if(COLUMN == 3'd5)
                begin
                    if(ROW == 3'd4)
                        C2X_BEST <= C2X_BEST;
                    else
                        C2X_BEST <= C2X_BEST - 4'd4;
                end
                else
                    C2X_BEST <= C2X_BEST + 4'd1;
            end
        end
        else
            C2X_BEST <= C2X_BEST;
    end
    else if(state == FINISH)
        C2X_BEST <= 4'd0;
    else
        C2X_BEST <= C2X_BEST;
end

//                  C2Y_BEST 運算                //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        C2Y_BEST <= 4'd0;
    else if(state == CIRCLE2_CHANGE)
    begin
        if(flag2)
        begin
            if(C2Y_BEST == 4'd15)
                C2Y_BEST <= 4'd0;
            else
                C2Y_BEST <= C2Y_BEST + 4'd1;
        end
        else
            C2Y_BEST <= 4'd0;
    end
    else if(state == CIRCLE1_CHANGE2)
        C2Y_BEST <= C2Y;
    else if(state == COMPARE_TOTAL)
        C2Y_BEST <= C2Y - 4'd2;
    else if(state == COMPARE_ROUND2 && COLUMN == 3'd5 && ROW == 3'd4 )
        C2Y_BEST <= C2Y - 4'd2;
    else if(state == CIRCLE2_CHANGE2)
    begin
        if(COLUMN == 3'd5)
        begin
            if(ROW == 3'd4)
                C2Y_BEST <= C2Y_BEST;
            else
                C2Y_BEST <= C2Y_BEST + 4'd1;
        end
        else
            C2Y_BEST <= C2Y_BEST;
    end
    else if(state == FINISH)
        C2Y_BEST <= 4'd0;
    else
        C2Y_BEST <= C2Y_BEST;
end

//                COUNT_CIRCLE2 的 C2X_COUNT             //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        C2X_COUNT <= 4'd0;
    else if(state == COUNT_CIRCLE2 || COUNT_CIRCLE22)
    begin
        if(!step1)
        begin
            if(C2X_BEST > X_1[counter1])
                C2X_COUNT <= C2X_BEST - X_1[counter1];
            else
                C2X_COUNT <= X_1[counter1] - C2X_BEST;
        end
        else
            C2X_COUNT <= C2X_COUNT;
    end
    else if(state == COUNT_CIRCLE12)
    begin
        if(!step1)
        begin
            if(C2X > X_1[counter1])
                C2X_COUNT <= C2X - X_1[counter1];
            else
                C2X_COUNT <= X_1[counter1] - C2X;
        end
        else
            C2X_COUNT <= C2X_COUNT;
    end
    else if(state == FINISH)
        C2X_COUNT <= 4'd0;
    else
        C2X_COUNT <= C2X_COUNT;
end

//               COUNT_CIRCLE2 的 C2Y_COUNT               //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        C2Y_COUNT <= 4'd0;
    else if(state == COUNT_CIRCLE2 || state == COUNT_CIRCLE22)
    begin
        if(!step1)
        begin
            if(C2Y_BEST > Y_1[counter1])
                C2Y_COUNT <= C2Y_BEST - Y_1[counter1];
            else
                C2Y_COUNT <= Y_1[counter1] - C2Y_BEST;
        end
        else
            C2Y_COUNT <= C2Y_COUNT;
    end
    else if( state == COUNT_CIRCLE12)
    begin
        if(!step1)
        begin
            if(C2Y > Y_1[counter1])
                C2Y_COUNT <= C2Y - Y_1[counter1];
            else
                C2Y_COUNT <= Y_1[counter1] - C2Y;
        end
        else
            C2Y_COUNT <= C2Y_COUNT;
    end
    else if(state == FINISH)
        C2Y_COUNT <= 4'd0;
    else
        C2Y_COUNT <= C2Y_COUNT;
end

//               COUNT_CIRCLE2              //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        total_1 <= 6'd0;
    else if(state == COMPARE_2)
    begin
        if(!flag2)
            total_1 <= count_total_reg;
        else
        begin
            if(C2X_BEST == 4'd15 && C2Y_BEST == 4'd15)
                total_1 <= 6'd0;
            else
            begin
                if(count_total_reg > total_1)
                    total_1 <= count_total_reg;
                else
                    total_1 <= total_1;
            end
        end
    end

    else if(state == COMPARE_TOTAL)
    begin
        if(total_2 > total_1)
            total_1 <= total_2;
        else
            total_1 <= total_1;
    end
    else if(state == FINISH)
        total_1 <= 6'd0;
    else
        total_1 <= total_1;
end

//               COUNT_CIRCLE22              //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        total_2 <= 6'd0;
    else if(state == COMPARE_2_ROUND2)
    begin
        if(!flag2)
            total_2 <= count_total_reg;
        else
        begin
            if(count_total_reg > total_2)
                total_2 <= count_total_reg;
            else
                total_2 <= total_2;
        end
    end
    else if(state == FINISH)
        total_2 <= 6'd0;
    else
        total_2 <= total_2;
end

//               C2X 找最佳圓2               //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        C2X <= 4'd0;
    else if(state == COMPARE_2)
    begin
        if(!flag2)
            C2X <= C2X_BEST;
        else
        begin
            if(count_total_reg >= total_1)
                C2X <= C2X_BEST;
            else
                C2X <= C2X;
        end
    end
    else if(state == COMPARE_2_ROUND2)
    begin
        if(!flag2)
            C2X <= C2X_BEST;
        else
        begin
            if(count_total_reg >= total_2)
                C2X <= C2X_BEST;
            else
                C2X <= C2X;
        end
    end
    else if(state == FINISH)
        C2X <= 4'd0;
    else
        C2X <= C2X;
end

//               C2Y 找最佳圓2               //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        C2Y <= 4'd0;
    else if(state == COMPARE_2)
    begin
        if(!flag2)
            C2Y <= C2Y_BEST;
        else
        begin
            if(count_total_reg >= total_1)
                C2Y <= C2Y_BEST;
            else
                C2Y <= C2Y;
        end
    end
    else if(state == COMPARE_2_ROUND2)
    begin
        if(!flag2)
            C2Y <= C2Y_BEST;
        else
        begin
            if(count_total_reg >= total_2)
                C2Y <= C2Y_BEST;
            else
                C2Y <= C2Y;
        end
    end
    else if(state == FINISH)
        C2Y <= 4'd0;
    else
        C2Y <= C2Y;
end

//                DONE訊號線                //
always @(posedge CLK or posedge RST)
begin
    if(RST)
        DONE <= 1'b0;
    else if(state == COMPARE_TOTAL && total_1 == total_2)
        DONE <= 1'b1;
    else if(state == FINISH)
        DONE <= 1'b0;
    else
        DONE <= DONE;
end

endmodule

