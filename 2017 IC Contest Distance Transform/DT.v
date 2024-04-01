module DT(clk, reset, done, sti_rd, sti_addr, sti_di, res_wr, res_rd, res_addr, res_do, res_di);
input 			 clk;
input			 reset;
input[15:0]	     sti_di;
input[7:0]	     res_di;
output reg		 sti_rd;
output reg[9:0]	 sti_addr;
output reg		 res_wr;
output reg		 res_rd;
output reg[13:0] res_addr;
output reg[7:0]	 res_do;
output reg		 done;
//====================================================================
reg[1:0] state, next_state;
parameter[1:0] IDLE = 2'b00,TRANSFORM_FORWARD = 2'b01, TRANSFORM_BACKWARD = 2'b10, DONE = 2'b11;
reg[4:0] counter1;
reg[2:0] counter2;
reg[7:0] res_do_mem;
//====================================================================
//                 state 轉換                 //
always @(*)
begin
    case(state)
        IDLE :
        begin
            if(sti_rd)
                next_state = TRANSFORM_FORWARD;
            else
                next_state = IDLE;
        end

        TRANSFORM_FORWARD :
        begin
            if(sti_addr==10'd1015 && counter1>5'd13 && counter2 == 3'd1)
                next_state = TRANSFORM_BACKWARD;
            else
                next_state = TRANSFORM_FORWARD;
        end

        TRANSFORM_BACKWARD :
        begin
            if(done)
                next_state = DONE;
            else
                next_state = TRANSFORM_BACKWARD;
        end

        DONE :
            next_state = state;
    endcase
end

//                 state 儲存                 //
always @(posedge clk or negedge reset)
begin
    if(!reset)
        state <= IDLE;
    else
        state <= next_state;
end

//                 sti_rd 信號線                 //
always @(posedge clk or negedge reset)
begin
    if(!reset)
        sti_rd <= 1'd0;
    else if(state == IDLE)
        sti_rd <= 1'd1;
    else if(state == TRANSFORM_FORWARD)
        sti_rd <= 1'd1;
    else
        sti_rd <= 1'd0;
end

//             counter1 數FORWARD有沒有數到15or16            //
always @(posedge clk or negedge reset)
begin
    if(!reset)
        counter1 <= 5'd0;
    else if(state == TRANSFORM_FORWARD)
    begin
        if(sti_addr==10'd1015 && counter1>5'd13)
        begin
            if(sti_di[5'd15 - counter1])
            begin
                if(counter2<3'd5)
                    counter1 <= counter1;
                else
                    counter1 <= 5'd0;
            end
            else
            begin
                if(counter2 < 3'd1)
                    counter1 <= counter1 ;
                else
                    counter1 <= 5'd0;
            end
        end
        else if(!(|sti_addr[9:4]))
        begin
            if(!(|sti_addr[2:0]) || (&sti_addr[2:0]))
            begin
                if(counter1<5'd14)
                    counter1 <= counter1 + 5'd1;
                else
                    counter1 <= 5'd0;
            end
            else
            begin
                if(counter1 <5'd15)
                    counter1 <= counter1 + 5'd1;
                else
                    counter1 <= 5'd0;
            end
        end
        else
        begin
            if(!(|sti_addr[2:0]))  //000
            begin
                if(counter1<5'd14)
                begin
                    if(sti_di[5'd14 - counter1])
                    begin
                        if(counter2<3'd5)
                            counter1 <= counter1;
                        else
                            counter1 <= counter1 + 5'd1;
                    end
                    else
                    begin
                        if(counter2 < 3'd1)
                            counter1 <= counter1;
                        else
                            counter1 <= counter1 + 5'd1;
                    end
                end
                else
                begin
                    if(sti_di[5'd14 - counter1])
                    begin
                        if(counter2<3'd5)
                            counter1 <= counter1;
                        else
                            counter1 <= 5'd0;
                    end
                    else
                    begin
                        if(counter2 < 3'd1)
                            counter1 <= counter1;
                        else
                            counter1 <= 5'd0;
                    end
                end
            end
            else if(&sti_addr[2:0])
            begin
                if(counter1<5'd14)
                begin
                    if(sti_di[5'd15 - counter1])
                    begin
                        if(counter2<3'd5)
                            counter1 <= counter1;
                        else
                            counter1 <= counter1 + 5'd1;
                    end
                    else
                    begin
                        if(counter2 < 3'd1)
                            counter1 <= counter1 ;
                        else
                            counter1 <= counter1 + 5'd1;
                    end
                end
                else
                begin
                    if(sti_di[5'd15 - counter1])
                    begin
                        if(counter2<3'd5)
                            counter1 <= counter1;
                        else
                            counter1 <= 5'd0;
                    end
                    else
                    begin
                        if(counter2 == 3'd1)
                            counter1 <= 5'd0;
                        else
                            counter1 <= counter1;
                    end
                end
            end
            else
            begin
                if(counter1<5'd15)
                begin
                    if(sti_di[5'd15 - counter1])
                    begin
                        if(counter2<3'd5)
                            counter1 <= counter1;
                        else
                            counter1 <= counter1 + 5'd1;
                    end
                    else
                    begin
                        if(counter2 == 3'd1)
                            counter1 <= counter1 +5'd1;
                        else
                            counter1 <= counter1;
                    end
                end
                else
                begin
                    if(sti_di[5'd15 - counter1])
                    begin
                        if(counter2<3'd5)
                            counter1 <= counter1;
                        else
                            counter1 <= 5'd0;
                    end
                    else
                    begin
                        if(counter2 == 3'd1)
                            counter1 <= 5'd0;
                        else
                            counter1 <= counter1;
                    end
                end
            end
        end
    end
    else
        counter1 <= counter1;
end

//                counter2 讓forward時分成4(3)階段 backword分成5(4)階段              //
always @(posedge clk or negedge reset)
begin
    if(!reset)
        counter2 <= 3'd0;
    else if(state == TRANSFORM_FORWARD)
    begin
        if(sti_addr==10'd1015 && counter1>5'd13)
        begin
            if(!sti_di[5'd15 - counter1])
            begin
                if(counter2 < 3'd1)
                    counter2 <= counter2 + 3'd1;
                else
                    counter2 <= 3'd0;
            end
            else
            begin
                if(counter2 < 3'd5)
                    counter2 <= counter2 + 3'd1;
                else
                    counter2 <= 3'd0;
            end
        end
        else if(!(|sti_addr[9:4]))
            counter2 <= 3'd0;
        else
        begin
            if(!(|sti_addr[2:0]))
            begin
                if(!sti_di[5'd14 - counter1])
                begin
                    if(counter2 < 3'd1)
                        counter2 <= counter2 + 3'd1;
                    else
                        counter2 <= 3'd0;
                end
                else
                begin
                    if(counter2 < 3'd5)
                        counter2 <= counter2 + 3'd1;
                    else
                        counter2 <= 3'd0;
                end
            end
            else if(&sti_addr[2:0])
            begin
                if(!sti_di[5'd15 - counter1])
                begin
                    if(counter2 < 3'd1)
                        counter2 <= counter2 + 3'd1;
                    else
                        counter2 <= 3'd0;
                end
                else
                begin
                    if(counter2 < 3'd5)
                        counter2 <= counter2 + 3'd1;
                    else
                        counter2 <= 3'd0;
                end
            end
            else
            begin
                if(!sti_di[5'd15 - counter1])
                begin
                    if(counter2 < 3'd1)
                        counter2 <= counter2 + 3'd1;
                    else
                        counter2 <= 3'd0;
                end
                else
                begin
                    if(counter2 < 3'd5)
                        counter2 <= counter2 + 3'd1;
                    else
                        counter2 <= 3'd0;
                end
            end
        end
    end
    else if(state == TRANSFORM_BACKWARD)
    begin
        if(!counter2)
            counter2 <= counter2 + 3'd1;
        else
        begin
            if(!res_do_mem)
            begin
                if(counter2 < 3'd2)
                    counter2 <= counter2 + 3'd1;
                else
                    counter2 <= 3'd0;
            end
            else
            begin
                if(counter2 < 3'd5)
                    counter2 <= counter2 + 3'd1;
                else
                    counter2 <= 3'd0;
            end
        end
    end
    else
        counter2 <= counter2;
end

//                 DATA_PASS 給 第二排 address 和儲存第二排                 //
always @(posedge clk or negedge reset)
begin
    if(!reset)
        sti_addr <= 10'd8;
    else if(state == TRANSFORM_FORWARD)
    begin
        if(sti_addr==10'd1015 && counter1>5'd13)
        begin
            if(sti_di[5'd15 - counter1])
            begin
                if(counter2 <3'd5)
                    sti_addr <= sti_addr;
                else
                    sti_addr <= 10'd8;
            end
            else
            begin
                if(counter2 < 3'd1)
                    sti_addr <= sti_addr;
                else
                    sti_addr <= 10'd8;
            end
        end
        else if(!(|sti_addr[9:4]))
        begin
            if(!(|sti_addr[2:0]) || (&sti_addr[2:0]))
            begin
                if(counter1<5'd14)
                    sti_addr <= sti_addr;
                else
                    sti_addr <= sti_addr + 10'd1;
            end
            else
            begin
                if(counter1<5'd15)
                    sti_addr <= sti_addr;
                else
                    sti_addr <= sti_addr + 10'd1;
            end
        end
        else if(!(|sti_addr[2:0]))
        begin
            if(counter1<5'd14)
                sti_addr <= sti_addr;
            else
            begin
                if(sti_di[5'd14 - counter1])
                begin
                    if(counter2 <3'd5)
                        sti_addr <= sti_addr;
                    else
                        sti_addr <= sti_addr + 10'd1;
                end
                else
                begin
                    if(counter2 < 3'd1)
                        sti_addr <= sti_addr;
                    else
                        sti_addr <= sti_addr + 10'd1;
                end
            end
        end
        else if(&sti_addr[2:0])
        begin
            if(counter1<5'd14)
                sti_addr <= sti_addr;
            else
            begin
                if(sti_di[5'd15 - counter1])
                begin
                    if(counter2 <3'd5)
                        sti_addr <= sti_addr;
                    else
                        sti_addr <= sti_addr + 10'd1;
                end
                else
                begin
                    if(counter2 < 3'd1)
                        sti_addr <= sti_addr;
                    else
                        sti_addr <= sti_addr + 10'd1;
                end
            end
        end
        else
        begin
            if(counter1<5'd15)
                sti_addr <= sti_addr;
            else
            begin
                if(sti_di[5'd15 - counter1])
                begin
                    if(counter2 <3'd5)
                        sti_addr <= sti_addr;
                    else
                        sti_addr <= sti_addr + 10'd1;
                end
                else
                begin
                    if(counter2 < 3'd1)
                        sti_addr <= sti_addr;
                    else
                        sti_addr <= sti_addr + 10'd1;
                end
            end
        end
    end
    else
        sti_addr <= sti_addr;
end

//                 res_wr 信號線                 //
always @(posedge clk or negedge reset)
begin
    if(!reset)
        res_wr <= 1'd0;
    else if(state == IDLE)
        res_wr <= 1'd1;
    else if(state == TRANSFORM_FORWARD)
    begin
        if(!(|sti_addr[9:4]))
        begin
            if(!(|sti_addr[2:0]))
            begin
                if(!sti_di[5'd14 - counter1])
                begin
                    if(counter2 < 3'd1)
                        res_wr <= 1'd1;
                    else
                        res_wr <= 1'd0;
                end
                else
                begin
                    if(counter2 >3'd3)
                        res_wr <= 1'd1;
                    else
                        res_wr <= 1'd0;
                end
            end
            else
            begin
                if(!sti_di[5'd15 - counter1])
                begin
                    if(counter2 < 3'd1)
                        res_wr <= 1'd1;
                    else
                        res_wr <= 1'd0;
                end
                else
                begin
                    if(counter2 > 3'd3)
                        res_wr <= 1'd1;
                    else
                        res_wr <= 1'd0;
                end
            end
        end
        else
        begin
            if(!(|sti_addr[2:0]))
            begin
                if(!sti_di[5'd14 - counter1])
                begin
                    if(counter2 < 3'd1)
                        res_wr <= 1'd1;
                    else
                        res_wr <= 1'd0;
                end
                else
                begin
                    if(counter2 >3'd3)
                        res_wr <= 1'd1;
                    else
                        res_wr <= 1'd0;
                end
            end
            else
            begin
                if(!sti_di[5'd15 - counter1])
                begin
                    if(counter2 < 3'd1)
                        res_wr <= 1'd1;
                    else
                        res_wr <= 1'd0;
                end
                else
                begin
                    if(counter2 > 3'd3)
                        res_wr <= 1'd1;
                    else
                        res_wr <= 1'd0;
                end
            end
        end
    end
    else if(state == TRANSFORM_BACKWARD)
    begin
        case(counter2)
            3'd0 :
                res_wr <= 1'd0;
            3'd1 :
            begin
                if(!res_do_mem)
                    res_wr <= 1'd1;
                else
                    res_wr <= 1'd0;
            end
            3'd2 :
                res_wr <= 1'd0;
            3'd3 :
                res_wr <= 1'd0;
            3'd4 :
                res_wr <= 1'd1;
            3'd5 :
                res_wr <= 1'd0;
            default :
                res_wr <= res_wr;
        endcase
    end
    else
        res_wr <= 1'd0;
end

//                 res_rd 信號線                 //
always @(posedge clk or negedge reset)
begin
    if(!reset)
        res_rd <= 1'd0;
    else if(state == TRANSFORM_FORWARD)
    begin
        if(!(|sti_addr[9:4]))
            res_rd <= 1'd0;
        else if(sti_addr==10'd1015 && counter1>5'd13)
        begin
            if(!sti_di[5'd15 - counter1])
            begin
                if(counter2 < 1'd1)
                    res_rd <= 1'd0;
                else
                    res_rd <= 1'd1;
            end
            else
            begin
                if(counter2 == 3'd0 || counter2 == 3'd1 || counter2 == 3'd2 || counter2 == 3'd3 || counter2 == 3'd5)
                    res_rd <= 1'd1;
                else
                    res_rd <= 1'd0;
            end
        end
        else
        begin
            if(!(|sti_addr[2:0]))
            begin
                if(!sti_di[5'd14 - counter1])
                    res_rd <= 1'd0;
                else
                begin
                    if(counter2 == 3'd0 || counter2 == 3'd1 || counter2 == 3'd2 || counter2 == 3'd3)
                        res_rd <= 1'd1;
                    else
                        res_rd <= 1'd0;
                end
            end
            else
            begin
                if(!sti_di[5'd15 - counter1])
                    res_rd <= 1'd0;
                else
                begin
                    if(counter2 == 3'd0 || counter2 == 3'd1 || counter2 == 3'd2 || counter2 == 3'd3)
                        res_rd <= 1'd1;
                    else
                        res_rd <= 1'd0;
                end
            end
        end
    end
    else if(state == TRANSFORM_BACKWARD)
    begin
        case(counter2)
            3'd0 :
                res_rd <= 1'd1;
            3'd1 :
            begin
                if(!res_do_mem)
                    res_rd <= 1'd0;
                else
                    res_rd <= 1'd1;
            end
            3'd2 :
                res_rd <= 1'd1;
            3'd3 :
                res_rd <= 1'd1;
            3'd4 :
                res_rd <= 1'd0;
            3'd5 :
                res_rd <= 1'd1;
            default :
                res_rd <= res_rd;
        endcase

    end
end
//                 TRANSFORM_FORWARD的結果存入res_do                 //
always @(posedge clk or negedge reset)
begin
    if(!reset)
    begin
        res_do <= 8'd0;
        res_do_mem <= 8'd0;
    end
    else if(state == TRANSFORM_FORWARD)
    begin
        if(!(|sti_addr[9:4]))   // 第一行
        begin
            if(!(|sti_addr[2:0]))
            begin
                if(sti_di[5'd14 - counter1])
                    res_do <= 8'd1;
                else
                    res_do <= 8'd0;
            end
            else
            begin
                if(sti_di[5'd15 - counter1])
                    res_do <= 8'd1;
                else
                    res_do <= 8'd0;
            end
        end
        else
        begin
            if(!(|sti_addr[2:0]))
            begin
                if(!sti_di[5'd14 - counter1])
                    res_do <= 8'd0;
                else
                begin
                    case(counter2)
                        3'd0 :
                            res_do_mem <= 8'd0;
                        3'd1 :
                            res_do_mem <= res_di;

                        3'd2 :
                        begin
                            if(res_do_mem >= res_di)
                                res_do_mem <= res_di;
                            else
                                res_do_mem<= res_do_mem;
                        end

                        3'd3 :
                        begin
                            if(res_do_mem >= res_di)
                                res_do_mem <= res_di;
                            else
                                res_do_mem<= res_do_mem;
                        end

                        3'd4 :
                        begin
                            if(res_do_mem >= res_di)
                                res_do <= res_di + 8'd1;
                            else
                                res_do<= res_do_mem + 8'd1;
                        end
                        3'd5:
                            res_do <= res_do;

                        default :
                        begin
                            res_do_mem<= res_do_mem;
                            res_do <= res_do;
                        end
                    endcase
                end
            end
            else
            begin
                if(!sti_di[5'd15 - counter1])
                    res_do <= 8'd0;
                else
                begin
                    case(counter2)
                        3'd0 :
                            res_do_mem <= 1'd0;
                        3'd1 :
                            res_do_mem <= res_di;

                        3'd2 :
                        begin
                            if(res_do_mem >= res_di)
                                res_do_mem <= res_di;
                            else
                                res_do_mem<= res_do_mem;
                        end

                        3'd3 :
                        begin
                            if(res_do_mem >= res_di)
                                res_do_mem <= res_di;
                            else
                                res_do_mem<= res_do_mem;
                        end

                        3'd4 :
                        begin
                            if(res_do_mem >= res_di)
                                res_do <= res_di + 8'd1;
                            else
                                res_do<= res_do_mem + 8'd1;
                        end
                        3'd5:
                            res_do <= res_do;

                        default :
                        begin
                            res_do_mem<= res_do_mem;
                            res_do <= res_do;
                        end
                    endcase
                end
            end
        end
    end
    else if(state == TRANSFORM_BACKWARD)
    begin
        begin
            case(counter2)
                3'd0 :
                    res_do_mem <= res_di;
                3'd1 :
                begin
                    if(!res_do_mem)
                    begin
                        res_do <= res_do_mem;
                        res_do_mem <= res_do_mem;
                    end
                    else
                    begin
                        if(res_do_mem >= (res_di + 8'd1))
                            res_do_mem <= res_di + 8'd1;
                        else
                            res_do_mem<= res_do_mem;
                    end
                end

                3'd2 :
                begin
                    if(!res_do_mem)
                        res_do_mem<= res_do_mem;
                    else
                    begin
                        if(res_do_mem >= (res_di + 8'd1))
                            res_do_mem <= res_di + 8'd1;
                        else
                            res_do_mem<= res_do_mem;
                    end
                end

                3'd3 :
                begin
                    if(res_do_mem >= (res_di + 8'd1))
                        res_do_mem <= res_di + 8'd1;
                    else
                        res_do_mem<= res_do_mem;
                end

                3'd4 :
                begin
                    if(res_do_mem >= (res_di + 8'd1))
                        res_do <= res_di + 8'd1;
                    else
                        res_do<= res_do_mem;
                end
                3'd5:
                    res_do <= res_do;

                default :
                begin
                    res_do_mem<= res_do_mem;
                    res_do <= res_do;
                end
            endcase
        end
    end
    else
    begin
        res_do_mem<= res_do_mem;
        res_do <= res_do;
    end
end

//                 RES_addr 輸送                 //
always @(posedge clk or negedge reset)
begin
    if(!reset)
        res_addr <= 14'd129;
    else if(state == TRANSFORM_FORWARD)
    begin
        if(!(|sti_addr[9:4]))
        begin
            if((&sti_addr[2:0]) && counter1 == 5'd14)
                res_addr <= res_addr + 14'd3;
            else
                res_addr <= res_addr + 14'd1;
        end
        else if((sti_addr==10'd1015 && counter1>5'd13))
        begin
            if(!sti_di[5'd15 - counter1])
                res_addr <= res_addr;
            else
            begin
                case(counter2)
                    3'd0 :
                        res_addr <= res_addr - 14'd1;

                    3'd1 :
                        res_addr <= res_addr - 14'd126;

                    3'd2 :
                        res_addr <= res_addr - 14'd1;

                    3'd3 :
                        res_addr <= res_addr - 14'd1;

                    3'd4 :
                        res_addr <= res_addr + 14'd128;

                    3'd5 :
                        res_addr <= res_addr;

                    default :
                        res_addr <= res_addr;
                endcase
            end
        end
        else
        begin
            if(&sti_addr[2:0])
            begin
                if(counter1 == 5'd14)
                begin
                    if(!sti_di[5'd15 - counter1])
                    begin
                        if(counter2 == 3'd1)
                            res_addr <= res_addr +5'd3;
                        else
                            res_addr <= res_addr;
                    end
                    else
                    begin
                        case(counter2)
                            3'd0 :
                                res_addr <= res_addr - 14'd1;

                            3'd1 :
                                res_addr <= res_addr - 14'd126;

                            3'd2 :
                                res_addr <= res_addr - 14'd1;

                            3'd3 :
                                res_addr <= res_addr - 14'd1;

                            3'd4 :
                                res_addr <= res_addr + 14'd129;

                            3'd5 :
                                res_addr <= res_addr + 14'd3;

                            default :
                                res_addr <= res_addr;
                        endcase
                    end
                end
                else
                begin
                    if(!sti_di[5'd15 - counter1])
                    begin
                        if(counter2 == 3'd1)
                            res_addr <= res_addr +5'd1;
                        else
                            res_addr <= res_addr;
                    end
                    else
                    begin
                        case(counter2)
                            3'd0 :
                                res_addr <= res_addr - 14'd1;

                            3'd1 :
                                res_addr <= res_addr - 14'd126;

                            3'd2 :
                                res_addr <= res_addr - 14'd1;

                            3'd3 :
                                res_addr <= res_addr - 14'd1;

                            3'd4 :
                                res_addr <= res_addr + 14'd129;

                            3'd5 :
                                res_addr <= res_addr + 14'd1;

                            default :
                                res_addr <= res_addr;
                        endcase
                    end
                end
            end

            else if(!(|sti_addr[2:0]))
            begin
                if(!sti_di[5'd14 - counter1])
                begin
                    if(counter2 == 3'd1)
                        res_addr <= res_addr +5'd1;
                    else
                        res_addr <= res_addr;
                end
                else
                begin
                    case(counter2)
                        3'd0 :
                            res_addr <= res_addr - 14'd1;

                        3'd1 :
                            res_addr <= res_addr - 14'd126;

                        3'd2 :
                            res_addr <= res_addr - 14'd1;

                        3'd3 :
                            res_addr <= res_addr - 14'd1;

                        3'd4 :
                            res_addr <= res_addr + 14'd129;
                        3'd5 :
                            res_addr <= res_addr + 14'd1;
                        default :
                            res_addr <= res_addr;
                    endcase
                end
            end
            else
            begin
                if(!sti_di[5'd15 - counter1])
                begin
                    if(counter2 == 3'd1)
                        res_addr <= res_addr +5'd1;
                    else
                        res_addr <= res_addr;
                end
                else
                begin
                    case(counter2)
                        3'd0 :
                            res_addr <= res_addr - 14'd1;

                        3'd1 :
                            res_addr <= res_addr - 14'd126;

                        3'd2 :
                            res_addr <= res_addr - 14'd1;

                        3'd3 :
                            res_addr <= res_addr - 14'd1;

                        3'd4 :
                            res_addr <= res_addr + 14'd129;

                        3'd5 :
                            res_addr <= res_addr + 14'd1;

                        default :
                            res_addr <= res_addr;
                    endcase
                end
            end

        end
    end
    else if(state == TRANSFORM_BACKWARD)
    begin
        case(counter2)
            3'd0 :
                res_addr <= res_addr + 14'd1;

            3'd1 :
            begin
                if(!res_do_mem)
                    res_addr <= res_addr - 14'd1;
                else
                    res_addr <= res_addr + 14'd126;
            end
            3'd2 :
            begin
                if(!res_do_mem)
                    res_addr <= res_addr - 14'd1;
                else
                    res_addr <= res_addr + 14'd1;
            end
            3'd3 :
                res_addr <= res_addr + 14'd1;

            3'd4 :
                res_addr <= res_addr - 14'd129;

            3'd5 :
                res_addr <= res_addr - 14'd1;

            default :
                res_addr <= res_addr;
        endcase
    end
    else
        res_addr <= res_addr;
end


//                 done信號線                 //
always @(posedge clk or negedge reset)
begin
    if(!reset)
        done <= 1'd0;
    else if(state == TRANSFORM_BACKWARD)
    begin
        if(!res_do_mem)
        begin
            if(res_addr == 14'd129 && counter2 == 3'd2)
                done <= 1'd1;
            else
                done <= 1'd0;
        end
        else
        begin
            if(res_addr == 14'd129 && counter2 == 3'd5)
                done <= 1'd1;
            else
                done <= 1'd0;
        end
    end
    else
        done <= done;
end

endmodule
