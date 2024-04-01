module  CONV(clk, reset, busy, ready, iaddr, idata, cwr, caddr_wr, cdata_wr, crd, caddr_rd, cdata_rd, csel);
input		  clk;
input		  reset;
input         ready;
input [19:0] cdata_rd;
input signed [19:0] idata;
output reg busy;
output reg cwr;
output reg crd;
output reg [11:0] iaddr;
output reg [11:0] caddr_wr;
output reg [19:0] cdata_wr;
output reg [11:0] caddr_rd;
output reg [2:0] csel;
//====================================================================
reg[2:0] state, next_state;
parameter[2:0] IDLE = 3'b000, READY = 3'b001 , CONVOLUTIONAL_RELU_1 = 3'b010, CONVOLUTIONAL_RELU_2 = 3'b011, MAX_POOLING_1 = 3'b100, MAX_POOLING_2 = 3'b101, FLATTEN = 3'b110, DONE = 3'b111;
reg[6:0] counter_1;  //數行
reg[6:0] counter_2;  //數列
reg[3:0] counter_3;  //數內部運算
reg signed [40:0] convolution;
//====================================================================
//         FSM NEXT STATE        //
always @(*)
begin
    case(state)
        IDLE :
        begin
            if(ready)
                next_state = READY;
            else
                next_state = IDLE;
        end

        READY :
        begin
            if(busy)
                next_state = CONVOLUTIONAL_RELU_1;
            else
                next_state = READY;
        end

        CONVOLUTIONAL_RELU_1:
        begin
            if(caddr_wr == 12'd4095 && counter_3 == 4'd5)
                next_state =CONVOLUTIONAL_RELU_2;
            else
                next_state = CONVOLUTIONAL_RELU_1;
        end

        CONVOLUTIONAL_RELU_2:
        begin
            if(caddr_wr == 12'd4095 && counter_3 == 4'd5)
                next_state = MAX_POOLING_1;
            else
                next_state = CONVOLUTIONAL_RELU_2;
        end

        MAX_POOLING_1 :
        begin
            if(counter_1 == 7'd31 && counter_2 == 7'd31 && counter_3 == 4'd4)
                next_state = MAX_POOLING_2;
            else
                next_state = MAX_POOLING_1;
        end

        MAX_POOLING_2 :
        begin
            if(counter_1 == 7'd31 && counter_2 == 7'd31 && counter_3 == 4'd4)
                next_state = FLATTEN;
            else
                next_state = MAX_POOLING_2;
        end

        FLATTEN :
        begin
            if(caddr_rd== 12'd1023 && counter_3 == 4'd3)
                next_state = DONE;
            else
                next_state = FLATTEN;
        end

        DONE :
        begin
            next_state = DONE;
        end

        default :
            next_state = state  ;
    endcase
end

//          FSM CURRENT STATE        //
always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= IDLE;
    else
        state <= next_state;
end

//            busy 訊號線           //
always @(posedge clk or posedge reset)
begin
    if(reset)
        busy <= 1'b0;
    else if(state == READY)
        busy <= 1'b1;
    else if(state == DONE)
        busy <= 1'b0;
    else
        busy <= busy;
end

//         counter_1 計數器 數行         //
always @(posedge clk or posedge reset)
begin
    if(reset)
        counter_1 <= 7'd0;
    else if(state == CONVOLUTIONAL_RELU_1 || state == CONVOLUTIONAL_RELU_2)
    begin
        if(counter_1== 7'd63 && counter_2 == 7'd63 && counter_3 == 4'd5)
            counter_1 <= 7'd0;
        else if(counter_1 == 7'd0 && counter_2 == 7'd63 && counter_3 == 4'd5)
            counter_1 <= counter_1 + 7'd1;
        else if(counter_2 == 7'd63 && counter_3 == 3'd7)
            counter_1 <= counter_1 + 7'd1;
        else
            counter_1 <= counter_1;
    end
    else if(state == MAX_POOLING_1 || state == MAX_POOLING_2)
    begin
        if(counter_1 == 7'd31 && counter_2 == 7'd31 && counter_3 == 4'd4)
            counter_1 <= 7'd0;
        else if(counter_2 == 7'd31 && counter_3 == 4'd4)
            counter_1 <= counter_1 + 7'd1;
        else
            counter_1 <= counter_1;
    end
    else
        counter_1 <= counter_1;
end

//         counter_2 計數器 數列         //
always @(posedge clk or posedge reset)
begin
    if(reset)
        counter_2 <= 7'd0;
    else if(state == CONVOLUTIONAL_RELU_1 || state == CONVOLUTIONAL_RELU_2)
    begin
        if(!counter_1 || counter_1 == 7'd63)
        begin
            if(!counter_2)  //第一列第一格
            begin
                if(counter_3 > 4'd4)
                    counter_2 <= counter_2 + 7'd1;
                else
                    counter_2 <= counter_2;
            end
            else if(counter_2 == 7'd63)
            begin
                if(counter_3 > 4'd4)
                    counter_2 <= 7'd0;
                else
                    counter_2 <= counter_2;
            end
            else
            begin
                if(counter_3 > 4'd6)
                    counter_2 <= counter_2 + 4'd1;
                else
                    counter_2 <= counter_2;
            end
        end
        else
        begin
            if(!counter_2)
            begin
                if(counter_3 > 4'd6)
                    counter_2 <= counter_2 + 7'd1;
                else
                    counter_2 <= counter_2;
            end
            else if(counter_2 == 7'd63)
            begin
                if(counter_3 > 4'd6)
                    counter_2 <= 7'd0;
                else
                    counter_2 <= counter_2;
            end
            else
            begin
                if(counter_3 > 4'd9)
                    counter_2 <= counter_2 + 4'd1;
                else
                    counter_2 <= counter_2;
            end
        end
    end
    else if(state == MAX_POOLING_1 || state == MAX_POOLING_2)
    begin
        if(counter_2 == 7'd31 && counter_3 == 4'd4)
            counter_2 <= 7'd0;
        else
        begin
            if(counter_3 == 4'd4)
                counter_2 <= counter_2 + 7'd1;
            else
                counter_2 <= counter_2;
        end
    end
    else
        counter_2 <= counter_2;
end

//         counter_3 計數器 數內部運算         //
always @(posedge clk or posedge reset)
begin
    if(reset)
        counter_3 <= 4'd0;
    else if(state == CONVOLUTIONAL_RELU_1 || state == CONVOLUTIONAL_RELU_2)
    begin
        if(!counter_1 || counter_1 == 7'd63)
        begin
            if(!counter_2 || counter_2 == 7'd63)
            begin
                if(counter_3 > 4'd4)
                    counter_3 <= 4'd0;
                else
                    counter_3 <= counter_3 + 4'd1;
            end
            else
            begin
                if(counter_3 > 4'd6)
                    counter_3 <= 4'd0;
                else
                    counter_3 <= counter_3 + 4'd1;
            end
        end
        else
        begin
            if(!counter_2 || counter_2 == 7'd63)
            begin
                if(counter_3 > 4'd6)
                    counter_3 <= 4'd0;
                else
                    counter_3 <= counter_3 + 4'd1;
            end
            else
            begin
                if(counter_3 > 4'd9)
                    counter_3 <= 4'd0;
                else
                    counter_3 <= counter_3 + 4'd1;
            end
        end
    end
    else if(state == MAX_POOLING_1 || state == MAX_POOLING_2)
    begin
        if(counter_3 == 4'd4)
            counter_3 <= 4'd0;
        else
            counter_3 <= counter_3 + 4'd1;
    end
    else if(state == FLATTEN)
    begin
        if(counter_3 == 4'd3)
            counter_3 <= 4'd0;
        else
            counter_3 <= counter_3 + 4'd1;
    end
    else
        counter_3 <= counter_3;
end

//             csel 訊號線              //
always @(posedge clk or posedge reset)
begin
    if(reset)
        csel <= 3'd0;
    else if(state == CONVOLUTIONAL_RELU_1)
        csel <= 3'd1;
    else if(state == CONVOLUTIONAL_RELU_2)
        csel <= 3'd2;
    else if(state == MAX_POOLING_1)
    begin
        if(counter_3 == 4'd3)
            csel <= 3'd3;
        else
            csel <= 3'd1;
    end
    else if(state == MAX_POOLING_2)
    begin
        if(counter_3 == 4'd3)
            csel <= 3'd4;
        else if(counter_1 == 7'd31 && counter_2 == 7'd31 && counter_3 == 4'd4)
            csel <= 3'd3;
        else
            csel <= 3'd2;
    end
    else if(state == FLATTEN)
    begin
        case(counter_3)
            4'd0 :
                csel <= 3'd5;

            4'd1 :
                csel <= 3'd4;

            4'd2 :
                csel <= 3'd5;

            4'd3 :
                csel <= 3'd3;

            default :
                csel <= csel;
        endcase
    end
    else
        csel <= csel;

end

//             cwr 訊號線              //
always @(posedge clk or posedge reset)
begin
    if(reset)
        cwr <= 1'b0;
    else if(state == CONVOLUTIONAL_RELU_1)
    begin
        if(counter_1 == 7'd63 && counter_2 == 7'd63 && counter_3 == 4'd5)
            cwr <= 1'b0;
        else
            cwr <= 1'b1;
    end
    else if(state == CONVOLUTIONAL_RELU_2)
    begin
        if(counter_1 == 7'd63 && counter_2 == 7'd63 && counter_3 == 4'd5)
            cwr <= 1'b0;
        else
            cwr <= 1'b1;
    end
    else if(state == MAX_POOLING_1 || state == MAX_POOLING_2)
    begin
        if(counter_3 == 4'd3)
            cwr <= 1'b1;
        else
            cwr <= 1'b0;
    end
    else if(state == FLATTEN)
    begin
        case(counter_3)
            4'd0 :
                cwr <= 1'b1;
            4'd1 :
                cwr <= 1'b0;
            4'd2 :
                cwr <= 1'b1;
            4'd3 :
                cwr <= 1'b0;
            default :
                cwr <= cwr;
        endcase
    end
    else
        cwr <= 1'b0;
end

//            caddr_wr 訊號線           //
always @(posedge clk or posedge reset)
begin
    if(reset)
        caddr_wr <= 12'd0;
    else if(state == CONVOLUTIONAL_RELU_1 || state == CONVOLUTIONAL_RELU_2)
    begin
        if(!counter_1 || counter_1 == 7'd63)  //第一列和最後一列
        begin
            if(!counter_2 || counter_2 == 7'd63) //第一列第一格和最後一格
            begin
                if(caddr_wr == 12'd4095 && counter_3 == 4'd5)
                    caddr_wr <= 12'd0;
                else
                begin
                    if(counter_3 == 4'd5)
                        caddr_wr <= caddr_wr + 12'd1;
                    else
                        caddr_wr <= caddr_wr;
                end
            end
            else
            begin
                if(counter_3 == 4'd7)
                    caddr_wr <= caddr_wr + 12'd1;
                else
                    caddr_wr <= caddr_wr;
            end
        end
        else
        begin
            if(!counter_2 || counter_2 == 7'd63)
            begin
                if(counter_3 == 4'd7)
                    caddr_wr <= caddr_wr + 12'd1;
                else
                    caddr_wr <= caddr_wr;
            end
            else
            begin
                if(counter_3 == 4'd10)
                    caddr_wr <= caddr_wr + 12'd1;
                else
                    caddr_wr <= caddr_wr;
            end
        end
    end
    else if(state == MAX_POOLING_1 || state == MAX_POOLING_2)
    begin
        if(counter_1 == 7'd31 && counter_2 == 7'd31 && counter_3 == 4'd4)
            caddr_wr <= 12'd0;
        else
        begin
            if(counter_3 == 4'd4)
                caddr_wr <= caddr_wr + 4'd1;
            else
                caddr_wr <= caddr_wr;
        end
    end
    else if(state == FLATTEN)
    begin
        case(counter_3)
            4'd0 :
                caddr_wr <= caddr_wr;
            4'd1 :
                caddr_wr <= caddr_wr + 12'd1;
            4'd2 :
                caddr_wr <= caddr_wr;
            4'd3 :
                caddr_wr <= caddr_wr + 12'd1;
            default :
                caddr_wr <= caddr_wr;
        endcase
    end
    else
        caddr_wr <= caddr_wr;
end

//             iaddr 訊號線             //
always @(posedge clk or posedge reset)
begin
    if(reset)
        iaddr <= 12'd0;
    else if(state == CONVOLUTIONAL_RELU_1 || state == CONVOLUTIONAL_RELU_2)
    begin
        if(!counter_1)  //第一列
        begin
            if(!counter_2)  //第一列第一格
            begin
                case(counter_3)
                    4'd0 :
                        iaddr <= iaddr + 12'd1;

                    4'd1 :
                        iaddr <= iaddr + 12'd63;

                    4'd2 :
                        iaddr <= iaddr + 12'd1;

                    4'd3 :
                        iaddr <= iaddr - 12'd64;

                    default :
                        iaddr <= iaddr;
                endcase
            end
            else if(counter_2 == 7'd63)  //第一列最後一格
            begin
                case(counter_3)
                    4'd0 :
                        iaddr <= iaddr - 12'd1;

                    4'd1 :
                        iaddr <= iaddr + 12'd64;

                    4'd2 :
                        iaddr <= iaddr + 12'd1;

                    4'd3 :
                        iaddr <= iaddr - 12'd63;

                    default :
                        iaddr <= iaddr;
                endcase
            end
            else
            begin
                case(counter_3)  //  第一列中間
                    4'd0 :
                        iaddr <= iaddr - 12'd1;

                    4'd1 :
                        iaddr <= iaddr + 12'd2;

                    4'd2 :
                        iaddr <= iaddr + 12'd62;

                    4'd3 :
                        iaddr <= iaddr + 12'd1;

                    4'd4 :
                        iaddr <= iaddr + 12'd1;

                    4'd5 :
                        iaddr <= iaddr - 12'd64;

                    default :
                        iaddr <= iaddr;
                endcase
            end
        end
        else if(counter_1 == 7'd63)  //最後一列
        begin
            if(!counter_2)  //最後一列第一格
            begin
                case(counter_3)
                    4'd0 :
                        iaddr <= iaddr - 12'd64;

                    4'd1 :
                        iaddr <= iaddr + 12'd1;

                    4'd2 :
                        iaddr <= iaddr + 12'd64;

                    4'd3 :
                        iaddr <= iaddr;

                    default :
                        iaddr <= iaddr;
                endcase
            end
            else if(counter_2 == 7'd63) //最後一列最後一格
            begin
                case(counter_3)
                    4'd0 :
                        iaddr <= iaddr - 12'd65;

                    4'd1 :
                        iaddr <= iaddr + 12'd1;

                    4'd2 :
                        iaddr <= iaddr + 12'd63;

                    4'd3 :
                        iaddr <= iaddr + 12'd1;

                    4'd5 :
                        iaddr <= 12'd0;

                    default :
                        iaddr <= iaddr;
                endcase
            end
            else //最後一列中間
            begin
                case(counter_3)
                    4'd0 :
                        iaddr <= iaddr - 12'd65;

                    4'd1 :
                        iaddr <= iaddr + 12'd1;

                    4'd2 :
                        iaddr <= iaddr + 12'd1;

                    4'd3 :
                        iaddr <= iaddr + 12'd62;

                    4'd4 :
                        iaddr <= iaddr + 12'd2;

                    4'd5 :
                        iaddr <= iaddr;

                    default :
                        iaddr <= iaddr;
                endcase
            end
        end
        else //其他要算九宮格的
        begin
            if(!counter_2) //第一行
            begin
                case(counter_3)
                    4'd0 :
                        iaddr <= iaddr - 12'd64;

                    4'd1 :
                        iaddr <= iaddr + 12'd1;

                    4'd2 :
                        iaddr <= iaddr + 12'd64;

                    4'd3 :
                        iaddr <= iaddr + 12'd63;

                    4'd4 :
                        iaddr <= iaddr + 12'd1;

                    4'd5 :
                        iaddr <= iaddr - 12'd64;

                    default :
                        iaddr <= iaddr;
                endcase
            end
            else if(counter_2 == 7'd63)  //最後一行
            begin
                case(counter_3)
                    4'd0 :
                        iaddr <= iaddr - 12'd65;

                    4'd1 :
                        iaddr <= iaddr + 12'd1;

                    4'd2 :
                        iaddr <= iaddr + 12'd63;

                    4'd3 :
                        iaddr <= iaddr + 12'd64;

                    4'd4 :
                        iaddr <= iaddr + 12'd1;

                    4'd5 :
                        iaddr <= iaddr - 12'd63;

                    default :
                        iaddr <= iaddr;
                endcase
            end
            else  //中間要算九宮格的
            begin
                case(counter_3)
                    4'd0 :
                        iaddr <= iaddr - 12'd65;

                    4'd1 :
                        iaddr <= iaddr + 12'd1;

                    4'd2 :
                        iaddr <= iaddr + 12'd1;

                    4'd3 :
                        iaddr <= iaddr + 12'd62;

                    4'd4 :
                        iaddr <= iaddr + 12'd2;

                    4'd5 :
                        iaddr <= iaddr + 12'd62;

                    4'd6 :
                        iaddr <= iaddr + 12'd1;

                    4'd7 :
                        iaddr <= iaddr + 12'd1;

                    4'd8 :
                        iaddr <= iaddr - 12'd64;
                    default :
                        iaddr <= iaddr;
                endcase
            end
        end
    end
    else
        iaddr <= iaddr;
end

//        CONVOLUTIONAL_RELU_1 && CONVOLUTIONAL_RELU_2 && MAX_POOLING_1 && MAX_POOLING_2        //
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        cdata_wr <= 20'd0;
        convolution <= $signed(41'd0);
    end
    else if(state == CONVOLUTIONAL_RELU_1)
    begin
        if(!counter_1)  //第一列
        begin
            if(!counter_2)  //第一列第一格
            begin
                case(counter_3)
                    4'd0 :
                        convolution <= idata*$signed(20'hF8F71);

                    4'd1 :
                        convolution <= convolution + idata*$signed(20'hF6E54);

                    4'd2 :
                        convolution <= convolution + idata*$signed(20'hFC834);

                    4'd3 :
                        convolution <= convolution + idata*$signed(20'hFAC19) + $signed({20'h01310,16'd0});

                    4'd4 :
                    begin
                        convolution <= convolution;
                        if(convolution[40])
                            cdata_wr <= 20'd0;
                        else
                            cdata_wr <= convolution[35:16] + convolution[15];
                    end

                    default :
                    begin
                        convolution <= convolution;
                        cdata_wr <= cdata_wr;
                    end
                endcase
            end
            else if(counter_2 == 7'd63)  //第一列最後一格
            begin
                case(counter_3)
                    4'd0 :
                        convolution <= idata*$signed(20'hF8F71);

                    4'd1 :
                        convolution <= convolution + idata*$signed(20'h01004);

                    4'd2 :
                        convolution <= convolution + idata*$signed(20'hFA6D7);

                    4'd3 :
                        convolution <= convolution + idata*$signed(20'hFC834) + $signed({20'h01310,16'd0});

                    4'd4 :
                    begin
                        convolution <= convolution;
                        if(convolution[40])
                            cdata_wr <= 20'd0;
                        else
                            cdata_wr <= convolution[35:16] + convolution[15];
                    end

                    default :
                    begin
                        convolution <= convolution;
                        cdata_wr <= cdata_wr;
                    end
                endcase
            end
            else
            begin
                case(counter_3)  //  第一列中間
                    4'd0 :
                        convolution <= idata*$signed(20'hF8F71);

                    4'd1 :
                        convolution <= convolution + idata*$signed(20'h01004);

                    4'd2 :
                        convolution <= convolution + idata*$signed(20'hF6E54);

                    4'd3 :
                        convolution <= convolution + idata*$signed(20'hFA6D7);

                    4'd4 :
                        convolution <= convolution + idata*$signed(20'hFC834);

                    4'd5 :
                        convolution <= convolution + idata*$signed(20'hFAC19) + $signed({20'h01310,16'd0});

                    4'd6 :
                    begin
                        convolution <= convolution;
                        if(convolution[40])
                            cdata_wr <= 20'd0;
                        else
                            cdata_wr <= convolution[35:16] + convolution[15];
                    end

                    default :
                    begin
                        convolution <= convolution;
                        cdata_wr <= cdata_wr;
                    end
                endcase
            end
        end
        else if(counter_1 == 7'd63)  //最後一列
        begin
            if(!counter_2)  //最後一列第一格
            begin
                case(counter_3)
                    4'd0 :
                        convolution <= idata*$signed(20'hF8F71);

                    4'd1 :
                        convolution <= convolution + idata*$signed(20'h092D5);

                    4'd2 :
                        convolution <= convolution + idata*$signed(20'h06D43);

                    4'd3 :
                        convolution <= convolution + idata*$signed(20'hF6E54) + $signed({20'h01310,16'd0});

                    4'd4 :
                    begin
                        convolution <= convolution;
                        if(convolution[40])
                            cdata_wr <= 20'd0;
                        else
                            cdata_wr <= convolution[35:16] + convolution[15];
                    end

                    default :
                    begin
                        convolution <= convolution;
                        cdata_wr <= cdata_wr;
                    end
                endcase
            end
            else if(counter_2 == 7'd63) //最後一列最後一格
            begin
                case(counter_3)
                    4'd0 :
                        convolution <= idata*$signed(20'hF8F71);

                    4'd1 :
                        convolution <= convolution + idata*$signed(20'h0A89E);

                    4'd2 :
                        convolution <= convolution + idata*$signed(20'h092D5);

                    4'd3 :
                        convolution <= convolution + idata*$signed(20'h01004) + $signed({20'h01310,16'd0});

                    4'd4 :
                    begin
                        convolution <= convolution;
                        if(convolution[40])
                            cdata_wr <= 20'd0;
                        else
                            cdata_wr <= convolution[35:16] + convolution[15];
                    end

                    default :
                    begin
                        convolution <= convolution;
                        cdata_wr <= cdata_wr;
                    end
                endcase
            end
            else //最後一列中間
            begin
                case(counter_3)
                    4'd0 :
                        convolution <= idata*$signed(20'hF8F71);

                    4'd1 :
                        convolution <= convolution + idata*$signed(20'h0A89E);

                    4'd2 :
                        convolution <= convolution + idata*$signed(20'h092D5);

                    4'd3 :
                        convolution <= convolution + idata*$signed(20'h06D43);

                    4'd4 :
                        convolution <= convolution + idata*$signed(20'h01004);

                    4'd5 :
                        convolution <= convolution + idata*$signed(20'hF6E54) + $signed({20'h01310,16'd0});

                    4'd6 :
                    begin
                        convolution <= convolution;
                        if(convolution[40])
                            cdata_wr <= 20'd0;
                        else
                            cdata_wr <= convolution[35:16] + convolution[15];
                    end

                    default :
                    begin
                        convolution <= convolution;
                        cdata_wr <= cdata_wr;
                    end
                endcase
            end
        end
        else //其他要算九宮格的
        begin
            if(!counter_2) //第一行
            begin
                case(counter_3)
                    4'd0 :
                        convolution <= idata*$signed(20'hF8F71);

                    4'd1 :
                        convolution <= convolution + idata*$signed(20'h092D5);

                    4'd2 :
                        convolution <= convolution + idata*$signed(20'h06D43);

                    4'd3 :
                        convolution <= convolution + idata*$signed(20'hF6E54);

                    4'd4 :
                        convolution <= convolution + idata*$signed(20'hFC834);

                    4'd5 :
                        convolution <= convolution + idata*$signed(20'hFAC19) + $signed({20'h01310,16'd0});

                    4'd6 :
                    begin
                        convolution <= convolution;
                        if(convolution[40])
                            cdata_wr <= 20'd0;
                        else
                            cdata_wr <= convolution[35:16] + convolution[15];
                    end

                    default :
                    begin
                        convolution <= convolution;
                        cdata_wr <= cdata_wr;
                    end
                endcase
            end
            else if(counter_2 == 7'd63)  //最後一行
            begin
                case(counter_3)
                    4'd0 :
                        convolution <= idata*$signed(20'hF8F71);

                    4'd1 :
                        convolution <= convolution + idata*$signed(20'h0A89E);

                    4'd2 :
                        convolution <= convolution + idata*$signed(20'h092D5);

                    4'd3 :
                        convolution <= convolution + idata*$signed(20'h01004);

                    4'd4 :
                        convolution <= convolution + idata*$signed(20'hFA6D7);

                    4'd5 :
                        convolution <= convolution + idata*$signed(20'hFC834) + $signed({20'h01310,16'd0});

                    4'd6 :
                    begin
                        convolution <= convolution;
                        if(convolution[40])
                            cdata_wr <= 20'd0;
                        else
                            cdata_wr <= convolution[35:16] + convolution[15];
                    end

                    default :
                    begin
                        convolution <= convolution;
                        cdata_wr <= cdata_wr;
                    end
                endcase
            end
            else  //中間要算九宮格的
            begin
                case(counter_3)
                    4'd0 :
                        convolution <= idata*$signed(20'hF8F71);

                    4'd1 :
                        convolution <= convolution + idata*$signed(20'h0A89E);

                    4'd2 :
                        convolution <= convolution + idata*$signed(20'h092D5);

                    4'd3 :
                        convolution <= convolution + idata*$signed(20'h06D43);

                    4'd4 :
                        convolution <= convolution + idata*$signed(20'h01004);

                    4'd5 :
                        convolution <= convolution + idata*$signed(20'hF6E54);

                    4'd6 :
                        convolution <= convolution + idata*$signed(20'hFA6D7);

                    4'd7 :
                        convolution <= convolution + idata*$signed(20'hFC834);

                    4'd8 :
                        convolution <= convolution + idata*$signed(20'hFAC19) + $signed({20'h01310,16'd0});

                    4'd9 :
                    begin
                        convolution <= convolution;
                        if(convolution[40])
                            cdata_wr <= 20'd0;
                        else
                            cdata_wr <= convolution[35:16] + convolution[15];
                    end

                    default :
                    begin
                        convolution <= convolution;
                        cdata_wr <= cdata_wr;
                    end
                endcase
            end
        end
    end
    else if(state == CONVOLUTIONAL_RELU_2)
    begin
        if(!counter_1)  //第一列
        begin
            if(!counter_2)  //第一列第一格
            begin
                case(counter_3)
                    4'd0 :
                        convolution <= idata*$signed(20'h02F20);

                    4'd1 :
                        convolution <= convolution + idata*$signed(20'h0202D);

                    4'd2 :
                        convolution <= convolution + idata*$signed(20'hFD369);

                    4'd3 :
                        convolution <= convolution + idata*$signed(20'h05E68) + $signed({20'hF7295,16'd0});

                    4'd4 :
                    begin
                        convolution <= convolution;
                        if(convolution[40])
                            cdata_wr <= 20'd0;
                        else
                            cdata_wr <= convolution[35:16] + convolution[15];
                    end

                    default :
                    begin
                        convolution <= convolution;
                        cdata_wr <= cdata_wr;
                    end
                endcase
            end
            else if(counter_2 == 7'd63)  //第一列最後一格
            begin
                case(counter_3)
                    4'd0 :
                        convolution <= idata*$signed(20'h02F20);

                    4'd1 :
                        convolution <= convolution + idata*$signed(20'h050FD);

                    4'd2 :
                        convolution <= convolution + idata*$signed(20'h03BD7);

                    4'd3 :
                        convolution <= convolution + idata*$signed(20'hFD369) + $signed({20'hF7295,16'd0});

                    4'd4 :
                    begin
                        convolution <= convolution;
                        if(convolution[40])
                            cdata_wr <= 20'd0;
                        else
                            cdata_wr <= convolution[35:16] + convolution[15];
                    end

                    default :
                    begin
                        convolution <= convolution;
                        cdata_wr <= cdata_wr;
                    end
                endcase
            end
            else
            begin
                case(counter_3)  //  第一列中間
                    4'd0 :
                        convolution <= idata*$signed(20'h02F20);

                    4'd1 :
                        convolution <= convolution + idata*$signed(20'h050FD);

                    4'd2 :
                        convolution <= convolution + idata*$signed(20'h0202D);

                    4'd3 :
                        convolution <= convolution + idata*$signed(20'h03BD7);

                    4'd4 :
                        convolution <= convolution + idata*$signed(20'hFD369);

                    4'd5 :
                        convolution <= convolution + idata*$signed(20'h05E68) + $signed({20'hF7295,16'd0});

                    4'd6 :
                    begin
                        convolution <= convolution;
                        if(convolution[40])
                            cdata_wr <= 20'd0;
                        else
                            cdata_wr <= convolution[35:16] + convolution[15];
                    end

                    default :
                    begin
                        convolution <= convolution;
                        cdata_wr <= cdata_wr;
                    end
                endcase
            end
        end
        else if(counter_1 == 7'd63)  //最後一列
        begin
            if(!counter_2)  //最後一列第一格
            begin
                case(counter_3)
                    4'd0 :
                        convolution <= idata*$signed(20'h02F20);

                    4'd1 :
                        convolution <= convolution + idata*$signed(20'h02992);

                    4'd2 :
                        convolution <= convolution + idata*$signed(20'hFC994);

                    4'd3 :
                        convolution <= convolution + idata*$signed(20'h0202D) + $signed({20'hF7295,16'd0});

                    4'd4 :
                    begin
                        convolution <= convolution;
                        if(convolution[40])
                            cdata_wr <= 20'd0;
                        else
                            cdata_wr <= convolution[35:16] + convolution[15];
                    end

                    default :
                    begin
                        convolution <= convolution;
                        cdata_wr <= cdata_wr;
                    end
                endcase
            end
            else if(counter_2 == 7'd63) //最後一列最後一格
            begin
                case(counter_3)
                    4'd0 :
                        convolution <= idata*$signed(20'h02F20);

                    4'd1 :
                        convolution <= convolution + idata*$signed(20'hFDB55);

                    4'd2 :
                        convolution <= convolution + idata*$signed(20'h02992);

                    4'd3 :
                        convolution <= convolution + idata*$signed(20'h050FD) + $signed({20'hF7295,16'd0});

                    4'd4 :
                    begin
                        convolution <= convolution;
                        if(convolution[40])
                            cdata_wr <= 20'd0;
                        else
                            cdata_wr <= convolution[35:16] + convolution[15];
                    end

                    default :
                    begin
                        convolution <= convolution;
                        cdata_wr <= cdata_wr;
                    end
                endcase
            end
            else //最後一列中間
            begin
                case(counter_3)
                    4'd0 :
                        convolution <= idata*$signed(20'h02F20);

                    4'd1 :
                        convolution <= convolution + idata*$signed(20'hFDB55);

                    4'd2 :
                        convolution <= convolution + idata*$signed(20'h02992);

                    4'd3 :
                        convolution <= convolution + idata*$signed(20'hFC994);

                    4'd4 :
                        convolution <= convolution + idata*$signed(20'h050FD);

                    4'd5 :
                        convolution <= convolution + idata*$signed(20'h0202D) + $signed({20'hF7295,16'd0});

                    4'd6 :
                    begin
                        convolution <= convolution;
                        if(convolution[40])
                            cdata_wr <= 20'd0;
                        else
                            cdata_wr <= convolution[35:16] + convolution[15];
                    end

                    default :
                    begin
                        convolution <= convolution;
                        cdata_wr <= cdata_wr;
                    end
                endcase
            end
        end
        else //其他要算九宮格的
        begin
            if(!counter_2) //第一行
            begin
                case(counter_3)
                    4'd0 :
                        convolution <= idata*$signed(20'h02F20);

                    4'd1 :
                        convolution <= convolution + idata*$signed(20'h02992);

                    4'd2 :
                        convolution <= convolution + idata*$signed(20'hFC994);

                    4'd3 :
                        convolution <= convolution + idata*$signed(20'h0202D);

                    4'd4 :
                        convolution <= convolution + idata*$signed(20'hFD369);

                    4'd5 :
                        convolution <= convolution + idata*$signed(20'h05E68) + $signed({20'hF7295,16'd0});

                    4'd6 :
                    begin
                        convolution <= convolution;
                        if(convolution[40])
                            cdata_wr <= 20'd0;
                        else
                            cdata_wr <= convolution[35:16] + convolution[15];
                    end

                    default :
                    begin
                        convolution <= convolution;
                        cdata_wr <= cdata_wr;
                    end
                endcase
            end
            else if(counter_2 == 7'd63)  //最後一行
            begin
                case(counter_3)
                    4'd0 :
                        convolution <= idata*$signed(20'h02F20);

                    4'd1 :
                        convolution <= convolution + idata*$signed(20'hFDB55);

                    4'd2 :
                        convolution <= convolution + idata*$signed(20'h02992);

                    4'd3 :
                        convolution <= convolution + idata*$signed(20'h050FD);

                    4'd4 :
                        convolution <= convolution + idata*$signed(20'h03BD7);

                    4'd5 :
                        convolution <= convolution + idata*$signed(20'hFD369) + $signed({20'hF7295,16'd0});

                    4'd6 :
                    begin
                        convolution <= convolution;
                        if(convolution[40])
                            cdata_wr <= 20'd0;
                        else
                            cdata_wr <= convolution[35:16] + convolution[15];
                    end

                    default :
                    begin
                        convolution <= convolution;
                        cdata_wr <= cdata_wr;
                    end
                endcase
            end
            else  //中間要算九宮格的
            begin
                case(counter_3)
                    4'd0 :
                        convolution <= idata*$signed(20'h02F20);

                    4'd1 :
                        convolution <= convolution + idata*$signed(20'hFDB55);

                    4'd2 :
                        convolution <= convolution + idata*$signed(20'h02992);

                    4'd3 :
                        convolution <= convolution + idata*$signed(20'hFC994);

                    4'd4 :
                        convolution <= convolution + idata*$signed(20'h050FD);

                    4'd5 :
                        convolution <= convolution + idata*$signed(20'h0202D);

                    4'd6 :
                        convolution <= convolution + idata*$signed(20'h03BD7);

                    4'd7 :
                        convolution <= convolution + idata*$signed(20'hFD369);

                    4'd8 :
                        convolution <= convolution + idata*$signed(20'h05E68) + $signed({20'hF7295,16'd0});

                    4'd9 :
                    begin
                        convolution <= convolution;
                        if(convolution[40])
                            cdata_wr <= 20'd0;
                        else
                            cdata_wr <= convolution[35:16] + convolution[15];
                    end

                    default :
                    begin
                        convolution <= convolution;
                        cdata_wr <= cdata_wr;
                    end
                endcase
            end
        end
    end
    else if(state == MAX_POOLING_1 || state == MAX_POOLING_2)
    begin
        case(counter_3)
            4'd0 :
            begin
                cdata_wr <= cdata_rd;
                convolution <= convolution;
            end
            4'd1 :
            begin
                convolution <= convolution;
                if(cdata_rd > cdata_wr)
                    cdata_wr <= cdata_rd;
                else
                    cdata_wr <= cdata_wr;
            end

            4'd2 :
            begin
                convolution <= convolution;
                if(cdata_rd > cdata_wr)
                    cdata_wr <= cdata_rd;
                else
                    cdata_wr <= cdata_wr;
            end

            4'd3 :
            begin
                convolution <= convolution;
                if(cdata_rd > cdata_wr)
                    cdata_wr <= cdata_rd;
                else
                    cdata_wr <= cdata_wr;
            end

            4'd4 :
            begin
                convolution <= convolution;
                cdata_wr <= cdata_wr;
            end

            default :
            begin
                convolution <= convolution;
                cdata_wr <= cdata_wr;
            end
        endcase
    end
    else if(state == FLATTEN)
    begin
        convolution <= convolution;
        case(counter_3)
            4'd0 :
                cdata_wr <= cdata_rd;

            4'd2 :
                cdata_wr <= cdata_rd;

            default :
                cdata_wr <= cdata_wr;
        endcase
    end
    else
    begin
        cdata_wr <= cdata_wr;
        convolution <= convolution;
    end
end

//                    crd 訊號線                 //
always @(posedge clk or posedge reset)
begin
    if(reset)
        crd <= 1'b0;
    else if(state == CONVOLUTIONAL_RELU_2)
    begin
        if(caddr_wr == 12'd4095 && counter_3 == 4'd5)
            crd <= 1'b1;
        else
            crd <= 1'b0;
    end
    else if(state == MAX_POOLING_1 || state == MAX_POOLING_2)
    begin
        if(counter_3 == 4'd3)
            crd <= 1'b0;
        else
            crd <= 1'b1;
    end
    else if(state == FLATTEN)
    begin
        case(counter_3)
            4'd0 :
                crd <= 1'b0;
            4'd1 :
                crd <= 1'b1;
            4'd2 :
                crd <= 1'b0;
            4'd3 :
                crd <= 1'b1;
        endcase
    end
    else
        crd <= crd;
end

//                caddr_rd訊號線                 //
always @(posedge clk or posedge reset)
begin
    if(reset)
        caddr_rd <= 12'd0;
    else if(state == MAX_POOLING_1 || state == MAX_POOLING_2)
    begin
        if(counter_1 == 7'd31 && counter_2 == 7'd31 && counter_3 == 4'd4)
            caddr_rd <= 12'd0;
        else if(counter_2 == 7'd31)
        begin
            case(counter_3)
                4'd0 :
                    caddr_rd <= caddr_rd + 12'd1;

                4'd1 :
                    caddr_rd <= caddr_rd + 12'd63;

                4'd2 :
                    caddr_rd <= caddr_rd + 12'd1;

                4'd3 :
                    caddr_rd <= caddr_rd + 12'd1;

                default :
                    caddr_rd <= caddr_rd;
            endcase
        end
        else
        begin
            case(counter_3)
                4'd0 :
                    caddr_rd <= caddr_rd + 12'd1;

                4'd1 :
                    caddr_rd <= caddr_rd + 12'd63;

                4'd2 :
                    caddr_rd <= caddr_rd + 12'd1;

                4'd3 :
                    caddr_rd <= caddr_rd - 12'd63;

                default :
                    caddr_rd <= caddr_rd;
            endcase
        end
    end
    else if(state == FLATTEN)
    begin
        if(caddr_rd== 12'd1023 && counter_3 == 4'd3)
            caddr_rd <= 12'd0;
        else
        begin
            if(counter_3 == 4'd3)
                caddr_rd <= caddr_rd + 12'd1;
            else
                caddr_rd <= caddr_rd;
        end
    end
    else
        caddr_rd <= caddr_rd;
end

endmodule


