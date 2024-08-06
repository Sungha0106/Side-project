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
// ===============================================================
//       wire/reg/parameter
// ===============================================================
reg [2:0] state, next_state;
parameter [2:0] IDLE = 3'b000, CONVOLUTIONAL_RELU_1 = 3'b010, CONVOLUTIONAL_RELU_2 = 3'b011, MAX_POOLING_1 = 3'b100, MAX_POOLING_2 = 3'b101, FLATTEN = 3'b110, DONE = 3'b111;
parameter [2:0] KERNEL_0_CONV = 3'b001, KERNEL_1_CONV = 3'b010, KERNEL_0_MAX = 3'b011, KERNEL_1_MAX = 3'b100, FLATTEN_LAYER_2 = 3'b101;
parameter [35:0] bias_0 = 36'h013100000, bias_1 = 36'hF72950000;
wire signed [35:0] bias;
reg signed [19:0] Data_buffer;
wire [3:0] range_detect;
reg [3:0] range_detect_reg;
wire [3:0] range_detect_wire;
reg [1:0] range_detect_flag;
reg next_detect;
wire [3:0] Top_left_corner, Top_corner, Top_right_corner, Left_corner, Right_corner, Lower_left_corner, Lower_corner, Lower_right_corner;
reg buffer_signal;
reg [3:0] step_counter;
wire [11:0] iaddr_add_1, iaddr_sub_1, iaddr_add_2, iaddr_add_62,iaddr_add_63, iaddr_sub_63, iaddr_add_64, iaddr_sub_64, iaddr_sub_65;
wire signed [39:0] convolution;
wire signed [39:0] convolution_add;
wire signed [39:0] convolution_bias;
reg signed [39:0] convolution_result;
wire signed [19:0] convolution_relu;
reg signed [19:0] kernel_constant;
wire signed [19:0] Top_left_kernel, Top_kernel, Top_right_kernel, Left_kernel, corner_kernel, Right_kernel, Lower_left_kernel, Lower_kernel, Lower_right_kernel;
wire signed [19:0] cdata_compare;
wire [19:0] caddr_choose, caddr_add_1;
// ===============================================================
//       FSM
// ===============================================================
//      next_state
always @(*)
begin
    case(state)
        IDLE :
        begin
            if(busy)
                next_state = CONVOLUTIONAL_RELU_1;
            else
                next_state = IDLE;
        end

        CONVOLUTIONAL_RELU_1 :
        begin
            if(caddr_wr == 12'd4095 && step_counter == 4'd5)
                next_state = CONVOLUTIONAL_RELU_2;
            else
                next_state = CONVOLUTIONAL_RELU_1;
        end

        CONVOLUTIONAL_RELU_2 :
        begin
            if(caddr_wr == 12'd4095 && step_counter == 4'd6)
                next_state = MAX_POOLING_1;
            else
                next_state = CONVOLUTIONAL_RELU_2;
        end

        MAX_POOLING_1 :
        begin
            if(caddr_wr == 12'd1023 && step_counter == 4'd5)
                next_state = MAX_POOLING_2;
            else
                next_state = MAX_POOLING_1;
        end

        MAX_POOLING_2 :
        begin
            if(caddr_wr == 12'd1023 && step_counter == 4'd5)
                next_state = FLATTEN;
            else
                next_state = MAX_POOLING_2;
        end

        FLATTEN :
        begin
            if(caddr_rd== 12'd1023 && step_counter == 4'd3)
                next_state = DONE;
            else
                next_state = FLATTEN;
        end

        DONE :
            next_state = DONE;

        default :
            next_state = state;
    endcase
end

//      state
always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= IDLE;
    else
        state <= next_state;
end

// ===============================================================
//       Signal
// ===============================================================
//       busy
always @(posedge clk or posedge reset)
begin
    if(reset)
        busy <= 1'b0;
    else if(state == IDLE && ready)
        busy <= 1'b1;
    else if(state == DONE)
        busy <= 1'b0;
end

//       Data_buffer
always @(posedge clk or posedge reset)
begin
    if(reset)
        Data_buffer <= 20'd0;
    else if(state == CONVOLUTIONAL_RELU_1 || state == CONVOLUTIONAL_RELU_2)
        Data_buffer <= idata;
    else if(state == MAX_POOLING_1 || state == MAX_POOLING_2)
        Data_buffer <= cdata_rd;
end

//       buffer_signal
always @(posedge clk or posedge reset)
begin
    if(reset)
        buffer_signal <= 1'b0;
    else if(state == CONVOLUTIONAL_RELU_1)
        buffer_signal <= 1'b1;
    else if(state == CONVOLUTIONAL_RELU_2)
    begin
        if(caddr_wr == 12'd4095 && step_counter == 4'd6)
            buffer_signal <= 1'b0;
        else
            buffer_signal <= buffer_signal;
    end
end

//       next_detect
always @(*)
begin
    case(range_detect_flag)
        2'd0 :
            next_detect = (state == CONVOLUTIONAL_RELU_2 && caddr_wr == 12'd4095)?(step_counter == 4'd6)? 1'b1 : 1'b0 :(step_counter == 4'd5)? 1'b1 : 1'b0;
        2'd1 :
            next_detect = (step_counter == 4'd7)? 1'b1 : 1'b0;
        default :
            next_detect = (step_counter == 4'd10)? 1'b1 : 1'b0;
    endcase
end

//       step_counter
always @(posedge clk or posedge reset)
begin
    if(reset)
        step_counter <= 4'd0;
    else if(buffer_signal || (caddr_wr == 12'd4095 && step_counter == 4'd6))
    begin
        if(next_detect)
            step_counter <= 4'd0;
        else
            step_counter <= step_counter + 4'd1;
    end
    else if(state == MAX_POOLING_1 || state == MAX_POOLING_2)
    begin
        if(step_counter == 4'd5)
            step_counter <= 4'd0;
        else
            step_counter <= step_counter + 4'd1;
    end
    else if(state == FLATTEN)
    begin
        if(step_counter == 4'd3)
            step_counter <= 4'd0;
        else
            step_counter <= step_counter + 4'd1;
    end
end

//       range_detect_flag
always @(*)
begin
    case(range_detect_wire)
        4'd1, 4'd3, 4'd6, 4'd8 :
            range_detect_flag = 2'd0;
        4'd2, 4'd4, 4'd5, 4'd7 :
            range_detect_flag = 2'd1;
        default :
            range_detect_flag = 2'd2;
    endcase
end


//       Top_left_corner
assign Top_left_corner = !(iaddr)? 4'd1 : 4'd0;

//       Top_corner
assign Top_corner =  (!(|iaddr[11:6]) && (|iaddr[5:0]) && !(&iaddr[5:0]))? 4'd2 : 4'd0;

//       Top_right_corner
assign Top_right_corner =  (!(|iaddr[11:6]) && (&iaddr[5:0]))? 4'd3 : 4'd0;

//       Left_corner
assign Left_corner =  (!(&iaddr[11:6]) && (|iaddr[11:6]) && !(|iaddr[5:0]))? 4'd4 : 4'd0;

//       Right_corner
assign Right_corner =  (!(&iaddr[11:6]) && (|iaddr[11:6]) && (&iaddr[5:0]))? 4'd5 : 4'd0;

//       Lower_left_corner
assign Lower_left_corner =  ((&iaddr[11:6]) && !(|iaddr[5:0]))? 4'd6 : 4'd0;

//       Lower_corner
assign Lower_corner =  ((&iaddr[11:6]) && (|iaddr[5:0]) && !(&iaddr[5:0]))? 4'd7 : 4'd0;

//       Lower_right_corner
assign Lower_right_corner =  ((&iaddr[11:6]) && (&iaddr[5:0]))? 4'd8 : 4'd0;

//       range_detect
assign range_detect = Top_left_corner + Top_corner + Top_right_corner + Left_corner + Right_corner + Lower_left_corner + Lower_corner + Lower_right_corner;

//       range_detect_reg
always @(posedge clk or posedge reset)
begin
    if(reset)
        range_detect_reg <= 4'd0;
    else
        range_detect_reg <= range_detect_wire;
end

//       range_detect_wire
assign range_detect_wire = (!step_counter)? range_detect : range_detect_reg;

// ===============================================================
//       KERNEL_CONSTANT
// ===============================================================
//       Top_left_kernel
assign Top_left_kernel = (state == CONVOLUTIONAL_RELU_1)? 20'h0A89E : 20'hFDB55;

//       Top_kernel
assign Top_kernel = (state == CONVOLUTIONAL_RELU_1)? 20'h092D5 : 20'h02992;

//       Top_right_kernel
assign Top_right_kernel = (state == CONVOLUTIONAL_RELU_1)? 20'h06D43 : 20'hFC994;

//       Left_kernel
assign Left_kernel = (state == CONVOLUTIONAL_RELU_1)? 20'h01004 : 20'h050FD;

//       corner_kernel
assign corner_kernel = (state == CONVOLUTIONAL_RELU_1)? 20'hF8F71 : 20'h02F20;

//       Right_kernel
assign Right_kernel = (state == CONVOLUTIONAL_RELU_1)? 20'hF6E54 : 20'h0202D;

//       Lower_left_kernel
assign Lower_left_kernel = (state == CONVOLUTIONAL_RELU_1)? 20'hFA6D7 : 20'h03BD7;

//       Lower_kernel
assign Lower_kernel = (state == CONVOLUTIONAL_RELU_1)? 20'hFC834 : 20'hFD369;

//       Lower_right_kernel
assign Lower_right_kernel = (state == CONVOLUTIONAL_RELU_1)? 20'hFAC19 : 20'h05E68;

//       kernel_constant
always @(*)
begin
    case(range_detect_wire)
        4'd1 : //       Top_left_kernel
        begin
            case(step_counter)
                4'd1 :
                    kernel_constant = corner_kernel;
                4'd2 :
                    kernel_constant = Right_kernel;
                4'd3 :
                    kernel_constant = Lower_kernel;
                4'd4 :
                    kernel_constant = Lower_right_kernel;
                default :
                    kernel_constant = 20'd0;
            endcase
        end
        4'd2 : //       Top_corner
        begin
            case(step_counter)
                4'd1 :
                    kernel_constant = corner_kernel;
                4'd2 :
                    kernel_constant = Left_kernel;
                4'd3 :
                    kernel_constant = Right_kernel;
                4'd4 :
                    kernel_constant = Lower_left_kernel;
                4'd5 :
                    kernel_constant = Lower_kernel;
                4'd6 :
                    kernel_constant = Lower_right_kernel;
                default :
                    kernel_constant = 20'd0;
            endcase
        end
        4'd3 : //       Top_right_kernel
        begin
            case(step_counter)
                4'd1 :
                    kernel_constant = corner_kernel;
                4'd2 :
                    kernel_constant = Left_kernel;
                4'd3 :
                    kernel_constant = Lower_left_kernel;
                4'd4 :
                    kernel_constant = Lower_kernel;
                default :
                    kernel_constant = 20'd0;
            endcase
        end
        4'd4 : //       Left_corner
        begin
            case(step_counter)
                4'd1 :
                    kernel_constant = corner_kernel;
                4'd2 :
                    kernel_constant = Top_kernel;
                4'd3 :
                    kernel_constant = Top_right_kernel;
                4'd4 :
                    kernel_constant = Right_kernel;
                4'd5 :
                    kernel_constant = Lower_kernel;
                4'd6 :
                    kernel_constant = Lower_right_kernel;
                default :
                    kernel_constant = 20'd0;
            endcase
        end
        4'd5 : //       Right_corner
        begin
            case(step_counter)
                4'd1 :
                    kernel_constant = corner_kernel;
                4'd2 :
                    kernel_constant = Top_left_kernel;
                4'd3 :
                    kernel_constant = Top_kernel;
                4'd4 :
                    kernel_constant = Left_kernel;
                4'd5 :
                    kernel_constant = Lower_left_kernel;
                4'd6 :
                    kernel_constant = Lower_kernel;
                default :
                    kernel_constant = 20'd0;
            endcase
        end
        4'd6 : //       Lower_left_corner
        begin
            case(step_counter)
                4'd1 :
                    kernel_constant = corner_kernel;
                4'd2 :
                    kernel_constant = Top_kernel;
                4'd3 :
                    kernel_constant = Top_right_kernel;
                4'd4 :
                    kernel_constant = Right_kernel;
                default :
                    kernel_constant = 20'd0;
            endcase
        end
        4'd7 : //       Lower_corner
        begin
            case(step_counter)
                4'd1 :
                    kernel_constant = corner_kernel;
                4'd2 :
                    kernel_constant = Top_left_kernel;
                4'd3 :
                    kernel_constant = Top_kernel;
                4'd4 :
                    kernel_constant = Top_right_kernel;
                4'd5 :
                    kernel_constant = Left_kernel;
                4'd6 :
                    kernel_constant = Right_kernel;
                default :
                    kernel_constant = 20'd0;
            endcase
        end
        4'd8 : //       Lower_right_corner
        begin
            case(step_counter)
                4'd1 :
                    kernel_constant = corner_kernel;
                4'd2 :
                    kernel_constant = Top_left_kernel;
                4'd3 :
                    kernel_constant = Top_kernel;
                4'd4 :
                    kernel_constant = Left_kernel;
                default :
                    kernel_constant = 20'd0;
            endcase
        end
        default : //       corner
        begin
            case(step_counter)
                4'd1 :
                    kernel_constant = corner_kernel;
                4'd2 :
                    kernel_constant = Top_left_kernel;
                4'd3 :
                    kernel_constant = Top_kernel;
                4'd4 :
                    kernel_constant = Top_right_kernel;
                4'd5 :
                    kernel_constant = Left_kernel;
                4'd6 :
                    kernel_constant = Right_kernel;
                4'd7 :
                    kernel_constant = Lower_left_kernel;
                4'd8 :
                    kernel_constant = Lower_kernel;
                4'd9 :
                    kernel_constant = Lower_right_kernel;
                default :
                    kernel_constant = 20'd0;
            endcase
        end
    endcase
end
// ===============================================================
//       CONVOLUTIONAL_RELU_1 & CONVOLUTIONAL_RELU_2
// ===============================================================
//       convolution
assign convolution = Data_buffer * kernel_constant;

//       convolution_add
assign convolution_add = convolution + convolution_result;

//       bias
assign bias = (state == CONVOLUTIONAL_RELU_1)? bias_0 : bias_1;

//       convolution_bias
assign convolution_bias = convolution_add + bias;

//       convolution_result
always @(posedge clk or posedge reset)
begin
    if(reset)
        convolution_result <= 40'd0;
    else if(buffer_signal)
    begin
        if(!step_counter)
            convolution_result <= convolution;
        else
        begin
            case(range_detect_flag)
                2'd0 :
                begin
                    if(step_counter == 4'd4)
                        convolution_result <= convolution_bias;
                    else
                        convolution_result <= convolution_add;
                end
                2'd1 :
                begin
                    if(step_counter == 4'd6)
                        convolution_result <= convolution_bias;
                    else
                        convolution_result <= convolution_add;
                end
                default :
                begin
                    if(step_counter == 4'd9)
                        convolution_result <= convolution_bias;
                    else
                        convolution_result <= convolution_add;
                end
            endcase
        end
    end
end

//       convolution_relu
assign convolution_relu = (convolution_result[39])? 20'd0 : convolution_result[35:16] + convolution_result[15];

// ===============================================================
//       MEMORY_SIGNAL
// ===============================================================
//       iaddr_add_sub
assign iaddr_add_1 = iaddr + 12'd1;

assign iaddr_add_2 = iaddr + 12'd2;

assign iaddr_add_62 = iaddr + 12'd62;

assign iaddr_add_63 = iaddr + 12'd63;

assign iaddr_add_64 = iaddr + 12'd64;

assign iaddr_sub_1 = iaddr - 12'd1;

assign iaddr_sub_63 = iaddr - 12'd63;

assign iaddr_sub_64 = iaddr - 12'd64;

assign iaddr_sub_65 = iaddr - 12'd65;

//       iaddr
always @(posedge clk or posedge reset)
begin
    if(reset)
        iaddr <= 12'd0;
    else if(buffer_signal)
    begin
        case(range_detect_wire)
            4'd1 : //       Top_left_kernel
            begin
                case(step_counter)
                    4'd0 :
                        iaddr <= iaddr_add_1;
                    4'd1 :
                        iaddr <= iaddr_add_63;
                    4'd2 :
                        iaddr <= iaddr_add_1;
                    4'd3 :
                        iaddr <= iaddr_sub_64;
                endcase
            end
            4'd2 : //       Top_corner
            begin
                case(step_counter)
                    4'd0 :
                        iaddr <= iaddr_sub_1;
                    4'd1 :
                        iaddr <= iaddr_add_2;
                    4'd2 :
                        iaddr <= iaddr_add_62;
                    4'd3 :
                        iaddr <= iaddr_add_1;
                    4'd4 :
                        iaddr <= iaddr_add_1;
                    4'd5 :
                        iaddr <= iaddr_sub_64;
                endcase
            end
            4'd3 : //       Top_right_kernel
            begin
                case(step_counter)
                    4'd0 :
                        iaddr <= iaddr_sub_1;
                    4'd1 :
                        iaddr <= iaddr_add_64;
                    4'd2 :
                        iaddr <= iaddr_add_1;
                    4'd3 :
                        iaddr <= iaddr_sub_63;
                endcase
            end
            4'd4 : //       Left_corner
            begin
                case(step_counter)
                    4'd0 :
                        iaddr <= iaddr_sub_64;
                    4'd1 :
                        iaddr <= iaddr_add_1;
                    4'd2 :
                        iaddr <= iaddr_add_64;
                    4'd3 :
                        iaddr <= iaddr_add_63;
                    4'd4 :
                        iaddr <= iaddr_add_1;
                    4'd5 :
                        iaddr <= iaddr_sub_64;
                endcase
            end
            4'd5 : //       Right_corner
            begin
                case(step_counter)
                    4'd0 :
                        iaddr <= iaddr_sub_65;
                    4'd1 :
                        iaddr <= iaddr_add_1;
                    4'd2 :
                        iaddr <= iaddr_add_63;
                    4'd3 :
                        iaddr <= iaddr_add_64;
                    4'd4 :
                        iaddr <= iaddr_add_1;
                    4'd5 :
                        iaddr <= iaddr_sub_63;
                endcase
            end
            4'd6 : //       Lower_left_corner
            begin
                case(step_counter)
                    4'd0 :
                        iaddr <= iaddr_sub_64;
                    4'd1 :
                        iaddr <= iaddr_add_1;
                    4'd2 :
                        iaddr <= iaddr_add_64;
                    4'd3 :
                        iaddr <= iaddr;
                endcase
            end
            4'd7 : //       Lower_corner
            begin
                case(step_counter)
                    4'd0 :
                        iaddr <= iaddr_sub_65;
                    4'd1 :
                        iaddr <= iaddr_add_1;
                    4'd2 :
                        iaddr <= iaddr_add_1;
                    4'd3 :
                        iaddr <= iaddr_add_62;
                    4'd4 :
                        iaddr <= iaddr_add_2;
                    4'd5 :
                        iaddr <= iaddr;
                endcase
            end
            4'd8 : //       Lower_right_corner
            begin
                case(step_counter)
                    4'd0 :
                        iaddr <= iaddr_sub_65;
                    4'd1 :
                        iaddr <= iaddr_add_1;
                    4'd2 :
                        iaddr <= iaddr_add_63;
                    4'd3 :
                        iaddr <= iaddr_add_1;
                    4'd4 :
                        iaddr <= 12'd0;
                endcase
            end
            default :
            begin
                case(step_counter)
                    4'd0 :
                        iaddr <= iaddr_sub_65;
                    4'd1 :
                        iaddr <= iaddr_add_1;
                    4'd2 :
                        iaddr <= iaddr_add_1;
                    4'd3 :
                        iaddr <= iaddr_add_62;
                    4'd4 :
                        iaddr <= iaddr_add_2;
                    4'd5 :
                        iaddr <= iaddr_add_62;
                    4'd6 :
                        iaddr <= iaddr_add_1;
                    4'd7 :
                        iaddr <= iaddr_add_1;
                    4'd8 :
                        iaddr <= iaddr_sub_64;
                endcase
            end
        endcase
    end
end

//       cdata_compare
assign cdata_compare = (!step_counter)? cdata_rd : (Data_buffer > cdata_wr) ? Data_buffer : cdata_wr;

//       cdata_wr
always @(posedge clk or posedge reset)
begin
    if(reset)
        cdata_wr <= 20'd0;
    else if(state == CONVOLUTIONAL_RELU_1 || state == CONVOLUTIONAL_RELU_2)
        cdata_wr <= convolution_relu;
    else if(state == MAX_POOLING_1 || state == MAX_POOLING_2)
        cdata_wr <= cdata_compare;
    else if(state == FLATTEN)
    begin
        if(!step_counter[0])
            cdata_wr <= cdata_rd;
        else
            cdata_wr <= cdata_wr;
    end
end

//       caddr_wr
always @(posedge clk or posedge reset)
begin
    if(reset)
        caddr_wr <= 12'd0;
    else if(state == CONVOLUTIONAL_RELU_1 && (!step_counter && iaddr))
        caddr_wr <= caddr_wr + 12'd1;
    else if(state == CONVOLUTIONAL_RELU_2)
    begin
        if(!iaddr && !step_counter)
            caddr_wr <= 12'd0;
        else if(caddr_wr == 12'd4095 && step_counter == 4'd6)
            caddr_wr <= 12'd0;
        else if(!step_counter && iaddr)
            caddr_wr <= caddr_wr + 12'd1;
    end
    else if(state == MAX_POOLING_1 || state == MAX_POOLING_2)
    begin
        if(caddr_wr == 12'd1023 && step_counter == 4'd5)
            caddr_wr <= 12'd0;
        else
            caddr_wr <= caddr_wr + (step_counter == 4'd5);
    end
    else if(state == FLATTEN)
        caddr_wr <= caddr_wr + step_counter[0];
end

//       cwr
always @(posedge clk or posedge reset)
begin
    if(reset)
        cwr <= 1'b0;
    else if(state == CONVOLUTIONAL_RELU_1)
        cwr <= 1'b1;
    else if(state == CONVOLUTIONAL_RELU_2)
        cwr <= !(caddr_wr == 12'd4095 && step_counter == 4'd6);
    else if(state == MAX_POOLING_1 || state == MAX_POOLING_2)
        cwr <= (step_counter == 4'd4);
    else if(state == FLATTEN)
        cwr <= !step_counter[0];
end

//       csel
always @(posedge clk or posedge reset)
begin
    if(reset)
        csel <= 3'd0;
    else
    begin
        case(state)
            CONVOLUTIONAL_RELU_1 :
                csel <= KERNEL_0_CONV;
            CONVOLUTIONAL_RELU_2 :
                csel <= KERNEL_1_CONV;
            MAX_POOLING_1 :
                csel <= (step_counter == 4'd4)? KERNEL_0_MAX : KERNEL_0_CONV;
            MAX_POOLING_2 :
            begin
                if(step_counter == 4'd4)
                    csel <= KERNEL_1_MAX;
                else if(caddr_wr == 12'd1023 && step_counter == 4'd4)
                    csel <= KERNEL_0_MAX;
                else
                    csel <= KERNEL_1_CONV;
            end
            FLATTEN :
            begin
                case(step_counter)
                    4'd0 :
                        csel <= FLATTEN_LAYER_2;
                    4'd1 :
                        csel <= KERNEL_1_MAX;
                    4'd2 :
                        csel <= FLATTEN_LAYER_2;
                    4'd3 :
                        csel <= KERNEL_0_MAX;
                endcase
            end
        endcase
    end
end

//                    crd 訊號線                 //
always @(posedge clk or posedge reset)
begin
    if(reset)
        crd <= 1'b0;
    else if(state == CONVOLUTIONAL_RELU_2)
        crd <= (caddr_wr == 12'd4095 && step_counter == 4'd6);
    else if(state == MAX_POOLING_1 || state == MAX_POOLING_2)
        crd <= !step_counter[2];
    else if(state == FLATTEN)
        crd <= step_counter[0];
end

//       caddr_add_1
assign caddr_add_1 = caddr_rd + 12'd1;

//       caddr_choose
assign caddr_choose = ( &caddr_rd[5:0] )? caddr_add_1 : caddr_rd - 12'd63;

//       caddr_rd
always @(posedge clk or posedge reset)
begin
    if(reset)
        caddr_rd <= 12'd0;
    else if(state == MAX_POOLING_1 || state == MAX_POOLING_2)
    begin
        if(caddr_wr == 12'd1023 && step_counter == 4'd5)
            caddr_rd <= 12'd0;
        else
        begin
            case(step_counter)
                4'd0 :
                    caddr_rd <= caddr_add_1;
                4'd1 :
                    caddr_rd <= caddr_rd + 12'd63;
                4'd2 :
                    caddr_rd <= caddr_add_1;
                4'd3 :
                    caddr_rd <= caddr_choose;
            endcase
        end
    end
    else if(state == FLATTEN)
    begin
        if(caddr_rd== 12'd1023 && step_counter == 4'd3)
            caddr_rd <= 12'd0;
        else
        begin
            if(step_counter == 4'd3)
                caddr_rd <= caddr_rd + 12'd1;
            else
                caddr_rd <= caddr_rd;
        end
    end
end
endmodule


