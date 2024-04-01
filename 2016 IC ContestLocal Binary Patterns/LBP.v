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

reg[3:0] counter ;
reg[10:0] edge_counter ;
reg[13:0] gray_0 ; // 儲存中心gray_addr
reg[7:0] gray_data0, gray_data1, gray_data2, gray_data3, gray_data4, gray_data5, gray_data6, gray_data7, gray_data8 ; // 儲存gray_data ;
reg[7:0] LBP_0, LBP_1, LBP_2, LBP_3, LBP_4, LBP_5, LBP_6, LBP_7 ; // 儲存各LBP計算值

always @(posedge clk or posedge reset) // 計算9次
begin
    if (reset)
    begin
        counter <= 4'd0 ;
    end 
    else if (counter > 4'd8)
    begin
        counter <= 4'd0 ;
    end
    else
    begin
        counter <= counter + 1'd1 ;
    end
end

always @(posedge clk or posedge reset) // 邊緣偵測
begin
    if (reset)
    begin
        edge_counter <= 11'd0 ;
    end
    else if (edge_counter == 11'd1259)
    begin
        edge_counter <= 11'd0 ;
    end
    else
    begin
        edge_counter <= edge_counter + 1'd1 ;
    end
end


always @(posedge clk or posedge reset) // gray_req 輸出
begin
    if (reset)
    begin
        gray_req <= 1'd0 ; 
    end 
    else begin
        gray_req <= (gray_ready == 1'd1 && counter == 4'd9)?1'd0 : 1'd1 ;
    end
end

always @(posedge clk or posedge reset) // 設定gray_addr位置 儲存原始addr
begin
    if (reset) 
    begin
        gray_addr <= 14'd0 ;
        gray_0 <= 14'd129 ;
    end 
    else begin
        if (gray_ready == 1'd1)
        begin
            if (edge_counter == 11'd1259)
            begin
                gray_0 <= gray_0 + 2'd3 ;
            end
            else begin
                case (counter)
                    4'd9: begin
                         gray_addr <= gray_0 + 14'd129 ;
                         gray_0 <= gray_0 + 1'd1 ;
                    end
                    4'd8: gray_addr <= gray_0 + 14'd129 ;
                    4'd7: gray_addr <= gray_0 + 14'd128 ;
                    4'd6: gray_addr <= gray_0 + 14'd127 ;
                    4'd5: gray_addr <= gray_0 + 14'd1 ;
                    4'd4: gray_addr <= gray_0 - 14'd1 ;
                    4'd3: gray_addr <= gray_0 - 14'd127 ;
                    4'd2: gray_addr <= gray_0 - 14'd128 ;
                    4'd1: gray_addr <= gray_0 - 14'd129 ;
                    4'd0: gray_addr <= gray_0 ;
                    default: gray_addr <= gray_addr ; 
                endcase
            end
        end 
       else begin
          gray_addr <= gray_addr ;
       end
    end
end

always @(*) // 儲存gray_data
begin
     begin
        case (counter)
           4'd9: gray_data8 = gray_data ;
           4'd8: gray_data7 = gray_data ;
           4'd7: gray_data6 = gray_data ;
           4'd6: gray_data5 = gray_data ;
           4'd5: gray_data4 = gray_data ;
           4'd4: gray_data3 = gray_data ;
           4'd3: gray_data2 = gray_data ;
           4'd2: gray_data1 = gray_data ;
           4'd1: gray_data0 = gray_data ;
           default: gray_data0 = gray_data ; 
        endcase
    end
end

always @(posedge clk or posedge reset) // lbp_addr 位置
begin
    if (reset)
    begin
        lbp_addr <= 14'd0 ;
    end
    else begin
        lbp_addr <= (gray_ready == 1'd1 && counter == 4'd9)? gray_0 : lbp_addr ;
    end
end

always @(*) // LBP計算
begin
     begin
        case (counter)
           4'd9: LBP_7 = (gray_data0 <= gray_data8)? 8'd1<<8'd7 : 8'd0 ;
           4'd8: LBP_6 = (gray_data0 <= gray_data7)? 8'd1<<8'd6 : 8'd0 ;
           4'd7: LBP_5 = (gray_data0 <= gray_data6)? 8'd1<<8'd5 : 8'd0 ;
           4'd6: LBP_4 = (gray_data0 <= gray_data5)? 8'd1<<8'd4 : 8'd0 ;
           4'd5: LBP_3 = (gray_data0 <= gray_data4)? 8'd1<<8'd3 : 8'd0 ;
           4'd4: LBP_2 = (gray_data0 <= gray_data3)? 8'd1<<8'd2 : 8'd0 ;
           4'd3: LBP_1 = (gray_data0 <= gray_data2)? 8'd1<<8'd1 : 8'd0 ;
           4'd2: LBP_0 = (gray_data0 <= gray_data1)? 8'd1 : 8'd0 ; 
           default: LBP_0 = LBP_0 ; 
        endcase
    end
end

always @(posedge clk or posedge reset) // lbp_data輸出
begin
    if (reset)
    begin
        lbp_data <= 8'd0 ;
    end 
    else begin
       case (counter)
           4'd9: lbp_data <= LBP_0 + LBP_1 + LBP_2 + LBP_3 + LBP_4 + LBP_5 + LBP_6 + LBP_7 ; 
           4'd8: lbp_data <= LBP_0 + LBP_1 + LBP_2 + LBP_3 + LBP_4 + LBP_5 + LBP_6 ; 
           4'd7: lbp_data <= LBP_0 + LBP_1 + LBP_2 + LBP_3 + LBP_4 + LBP_5 ;
           4'd6: lbp_data <= LBP_0 + LBP_1 + LBP_2 + LBP_3 + LBP_4 ;
           4'd5: lbp_data <= LBP_0 + LBP_1 + LBP_2 + LBP_3 ;
           4'd4: lbp_data <= LBP_0 + LBP_1 + LBP_2 ;
           4'd3: lbp_data <= LBP_0 + LBP_1 ;
           4'd2: lbp_data <= LBP_0 ;
           4'd1: lbp_data <= 8'd0 ;
           4'd0: lbp_data <= 8'd0 ;
           default: lbp_data <= lbp_data ; 
       endcase
    end
end

always @(posedge clk or posedge reset) // lbp_valid 輸出
begin
    if (reset)
    begin
        lbp_valid <= 1'd0 ; 
    end 
    else begin
        lbp_valid <= (gray_ready == 1'd1 && counter == 4'd9)? 1'd1 : 1'd0 ;
    end
end

always @(posedge clk or posedge reset) // finish 輸出
begin
    if (reset)
    begin
        finish <= 1'd0 ;
    end 
    else begin
        if (gray_addr == 14'd16383)
        begin
            finish <= 1'd1 ;
        end
        else begin
            finish <= 1'd0 ;
        end
    end
end

endmodule