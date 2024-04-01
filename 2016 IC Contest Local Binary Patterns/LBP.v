`timescale 1ns/10ps
module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, lbp_valid, lbp_data, finish);
input               clk;
input               reset;
input               gray_ready;
input      [7:0]    gray_data;
output reg [13:0]   gray_addr;
output reg          gray_req;
output reg [13:0]   lbp_addr;
output reg          lbp_valid;
output reg [7:0]    lbp_data;
output reg          finish;
//====================================================================
reg[1:0] state, next_state;
parameter[1:0] IDLE = 2'b00, DATA_PASS_LBP = 2'b01, TRANSFORM = 2'b10, DATA_STORE_HOST = 2'b11;
reg[7:0] lbp_mem0, lbp_mem1, lbp_mem2, lbp_mem3, lbp_mem4, lbp_mem5, lbp_mem6, lbp_mem7, lbp_mem8;
reg[3:0] counter1;
//====================================================================
//  state 轉換  //
always @(*)
begin
    case(state)
        IDLE :
        begin
            if(finish)
                next_state = IDLE;
            else
            begin
                if(gray_req)
                    next_state = DATA_PASS_LBP;
                else
                    next_state = IDLE;
            end
        end

        DATA_PASS_LBP :
        begin
            if(gray_req)
                next_state = DATA_PASS_LBP;
            else
                next_state = TRANSFORM;
        end

        TRANSFORM :
            next_state = DATA_STORE_HOST;

        DATA_STORE_HOST :
        begin
            if(lbp_addr==14'd16254)
                next_state = IDLE;
            else
            begin
                if(gray_req)
                    next_state = DATA_PASS_LBP;
                else
                    next_state = IDLE;
            end
        end


    endcase
end

//  state 儲存  //
always@(posedge clk or posedge reset)
begin
    if(reset)
        state <= IDLE;
    else
        state <= next_state;
end
//  counter1 數 HOST 送到哪  //
always @(posedge clk or posedge reset)
begin
    if(reset)
        counter1 <= 4'd0;
    else
    begin
        if(state == DATA_PASS_LBP)
        begin
            if(counter1<4'd9)
                counter1 <= counter1 + 4'd1;
            else
                counter1 <= 4'd0;
        end
        else
            counter1 <= 4'd0;
    end
end
//  gray_req 信號線  //
always @(posedge clk or posedge reset)
begin
    if(reset)
        gray_req <= 1'b0;
    else
    begin
        if(state==IDLE)
        begin
            if(gray_ready)
                gray_req <= 1'b1;
            else
                gray_req <= 1'b0;
        end
        else if(state == DATA_PASS_LBP)
        begin
            if(counter1==4'd8)
                gray_req <= 1'b0;
            else
                gray_req <= gray_req;
        end
        else if(state == DATA_STORE_HOST && finish == 1'd0)
            gray_req <= 1'd1;
        else
            gray_req <= gray_req;
    end
end
//  給 address 後讀 data  //
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        gray_addr <= 14'd129;
        lbp_mem4 <= 8'd0;
    end
    else
    begin
        if(state == DATA_PASS_LBP)
        begin
            case(counter1)
                4'd0 :
                begin
                    lbp_mem4 <= gray_data;            //129
                    gray_addr <= gray_addr - 14'd129; //0
                end
                4'd1 :
                    gray_addr <= gray_addr + 14'd1;   //1
                4'd2 :
                    gray_addr <= gray_addr + 14'd1;   //2
                4'd3 :
                    gray_addr <= gray_addr + 14'd126; //128
                4'd4 :
                    gray_addr <= gray_addr + 14'd2 ;  //130
                4'd5 :
                    gray_addr <= gray_addr + 14'd126; //256
                4'd6 :
                    gray_addr <= gray_addr + 14'd1;   //257
                4'd7 :
                    gray_addr <= gray_addr + 14'd1; //258
                4'd8 :
                begin
                    if(gray_addr==14'd16383)
                        gray_addr <= 14'd129;
                    else
                    begin
                        if(&gray_addr[6:0])
                            gray_addr <= gray_addr - 14'd126;
                        else
                            gray_addr <= gray_addr - 14'd128;
                    end
                end
                default :
                    gray_addr <= gray_addr;
            endcase
        end
        else
            gray_addr <= gray_addr;
    end
end
//  進行 LBP 運算  //
//====================================================================
always @(posedge clk or posedge reset)
begin
    if(reset)
        lbp_mem0 <= 8'd0;
    else if(state == DATA_PASS_LBP && counter1 == 4'd1)
        lbp_mem0 <= gray_data;
    else if(state == TRANSFORM)
    begin
        if(lbp_mem0>=lbp_mem4)
            lbp_mem0 <= 8'd1;
        else
            lbp_mem0 <= 8'd0;
    end
    else
        lbp_mem0 <= lbp_mem0;
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        lbp_mem1 <= 8'd0;
    else if(state == DATA_PASS_LBP && counter1 == 4'd2)
        lbp_mem1 <= gray_data;
    else if(state == TRANSFORM)
    begin
        if(lbp_mem1>=lbp_mem4)
            lbp_mem1 <= 8'd1;
        else
            lbp_mem1 <= 8'd0;
    end
    else
        lbp_mem1 <= lbp_mem1;
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        lbp_mem2 <= 8'd0;
    else if(state == DATA_PASS_LBP && counter1 == 4'd3)
        lbp_mem2 <= gray_data;
    else if(state == TRANSFORM)
    begin
        if(lbp_mem2>=lbp_mem4)
            lbp_mem2 <= 8'd1;
        else
            lbp_mem2 <= 8'd0;
    end
    else
        lbp_mem2 <= lbp_mem2;
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        lbp_mem3 <= 8'd0;
    else if(state == DATA_PASS_LBP && counter1 == 4'd4)
        lbp_mem3 <= gray_data;
    else if(state == TRANSFORM)
    begin
        if(lbp_mem3>=lbp_mem4)
            lbp_mem3 <= 8'd1;
        else
            lbp_mem3 <= 8'd0;
    end
    else
        lbp_mem3 <= lbp_mem3;
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        lbp_mem5 <= 8'd0;
    else if(state == DATA_PASS_LBP && counter1 == 4'd5)
        lbp_mem5 <= gray_data;
    else if(state == TRANSFORM)
    begin
        if(lbp_mem5>=lbp_mem4)
            lbp_mem5 <= 8'd1;
        else
            lbp_mem5 <= 8'd0;
    end
    else
        lbp_mem5 <= lbp_mem5;
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        lbp_mem6 <= 8'd0;
    else if(state == DATA_PASS_LBP && counter1 == 4'd6)
        lbp_mem6 <= gray_data;
    else if(state == TRANSFORM)
    begin
        if(lbp_mem6>=lbp_mem4)
            lbp_mem6 <= 8'd1;
        else
            lbp_mem6 <= 8'd0;
    end
    else
        lbp_mem6 <= lbp_mem6;
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        lbp_mem7 <= 8'd0;
    else if(state == DATA_PASS_LBP && counter1 == 4'd7)
        lbp_mem7 <= gray_data;
    else if(state == TRANSFORM)
    begin
        if(lbp_mem7>=lbp_mem4)
            lbp_mem7 <= 8'd1;
        else
            lbp_mem7 <= 8'd0;
    end
    else
        lbp_mem7 <= lbp_mem7;
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        lbp_mem8 <= 8'd0;
    else if(state == DATA_PASS_LBP && counter1 == 4'd8)
        lbp_mem8 <= gray_data;
    else if(state == TRANSFORM)
    begin
        if(lbp_mem8>=lbp_mem4)
            lbp_mem8 <= 8'd1;
        else
            lbp_mem8 <= 8'd0;
    end
    else
        lbp_mem8 <= lbp_mem8;
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        lbp_data <= 8'd0;
    else
    begin
        if(state == DATA_STORE_HOST)
            lbp_data <= {lbp_mem8[0],lbp_mem7[0],lbp_mem6[0],lbp_mem5[0],lbp_mem3[0],lbp_mem2[0],lbp_mem1[0],lbp_mem0[0]};
        else
            lbp_data <= lbp_data;
    end
end
//====================================================================
//  lbp_valid 信號線  //
always @(posedge clk or posedge reset)
begin
    if(reset)
        lbp_valid <= 1'd0;
    else
    begin
        if(state==DATA_STORE_HOST)
            lbp_valid <= 1'd1;
        else
            lbp_valid <= 1'd0;
    end
end

//  address 傳給 lbp_addr  //
always @(posedge clk or posedge reset)
begin
    if(reset)
        lbp_addr <= 14'd0;
    else
    begin
        if(state == DATA_PASS_LBP)
        begin
            if(counter1==4'd0)
                lbp_addr <= gray_addr;
            else
                lbp_addr <= lbp_addr;
        end
        else
            lbp_addr <= lbp_addr;
    end
end


//  finish 信號線  //
always @(posedge clk or posedge reset)
begin
    if(reset)
        finish <= 1'd0;
    else
    begin
        if(state==IDLE && lbp_addr==14'd16254)
            finish <= 1'd1;
        else
            finish <= 1'd0;
    end
end

endmodule
