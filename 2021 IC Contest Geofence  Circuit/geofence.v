//synopsys translate_off
`include "DW_sqrt.v"
//synopsys translate_on
module geofence( clk,reset,X,Y,R,valid,is_inside);
input clk;
input reset;
input [9:0] X;
input [9:0] Y;
input [10:0] R;
output  valid;
output  is_inside;
//============================================================================
reg [2:0] state, next_state;
parameter [2:0] DATA_STORE = 3'b000, BUILD_GEOFENCE = 3'b001, AREA3_CACULATE = 3'b010, AREA6_CACULATE = 3'b011, DETERMINE = 3'b100;
reg [9:0] geofence_X [1:6];
reg [9:0] geofence_Y [1:6];
reg [10:0] geofence_R [1:6];
reg [2:0] store_counter, store_counter2;
reg [2:0] build_counter;
reg [2:0] caculate_counter;
reg [12:0] S;
wire [22:0] side_length_before;
wire [11:0] side_length_after;
wire [22:0] area_sqrt1_before, area_sqrt2_before;
wire [11:0] area_sqrt1_after, area_sqrt2_after;
wire [22:0] area_reg;
reg signed [22:0] area;
wire signed [21:0] area_6_reg;
reg [9:0] X_REG, Y_REG;
reg [9:0] geofence_X_reg[0:1];
reg [9:0] geofence_Y_reg[0:1];
reg [10:0] geofence_R_reg[0:1];
reg signed [22:0] COMPUTE_RESULT;
reg [12:0] A, B, C, D;
reg [11:0] E;
reg [11:0] F, G, H, I;
integer  i;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//FSM
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(*)
begin
    case (state)
        DATA_STORE :
        begin
            if(store_counter == 3'd6)
                next_state = BUILD_GEOFENCE;
            else
                next_state = DATA_STORE;
        end

        BUILD_GEOFENCE :
        begin
            if(build_counter == 3'd3 && store_counter2 == 3'd3)
                next_state = AREA3_CACULATE;
            else
                next_state = BUILD_GEOFENCE;
        end

        AREA3_CACULATE :
        begin
            if(caculate_counter == 3'd5)
                next_state = AREA6_CACULATE;
            else
                next_state = AREA3_CACULATE;
        end

        AREA6_CACULATE :
        begin
            if(caculate_counter == 3'd5)
                next_state = DETERMINE;
            else
                next_state = AREA6_CACULATE;
        end
        DETERMINE :
            next_state = DATA_STORE;


        default:
            next_state = state;
    endcase
end

always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= DATA_STORE;
    else
        state <= next_state;
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//store_counter
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(posedge clk or posedge reset)
begin
    if(reset)
        store_counter <= 3'd1; //重點
    else if(state == DATA_STORE)
    begin
        if(store_counter == 3'd6)
            store_counter <= 3'd0;
        else
            store_counter <= store_counter + 3'd1;//重點
    end
    else if(state == DETERMINE)
        store_counter <= 3'd1;
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//store_counter2
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(posedge clk or posedge reset)
begin
    if(reset)
        store_counter2 <= 3'd0; //重點
    else if(state == BUILD_GEOFENCE)
    begin
        if(store_counter2 == 3'd3)
            store_counter2 <= 3'd0;
        else
            store_counter2 <= store_counter2 + 3'd1;
    end
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//build_counter
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(posedge clk or posedge reset)
begin
    if(reset)
        build_counter <= 3'd0;
    else if(state == BUILD_GEOFENCE)
    begin
        if(store_counter2 == 3'd3)
        begin
            if(build_counter == 3'd3)
                build_counter <= 3'd0;
            else
                build_counter <= build_counter + 3'd1;
        end
        else
            build_counter <= build_counter;
    end
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//caculate_counter
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(posedge clk or posedge reset)
begin
    if(reset)
        caculate_counter <= 3'd0;
    else if(state == AREA3_CACULATE || state == AREA6_CACULATE)
    begin
        if(caculate_counter == 3'd5)
            caculate_counter <= 3'd0;
        else
            caculate_counter <= caculate_counter + 3'd1;
    end
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//DATA_STORE
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        for(i=1;i<7;i=i+1)
        begin
            geofence_X[i] <= 10'd0;
            geofence_Y[i] <= 10'd0;
            geofence_R[i] <= 11'd0;
        end
    end
    else if(state == DATA_STORE)
    begin
        geofence_X[store_counter] <= X;
        geofence_Y[store_counter] <= Y;
        geofence_R[store_counter] <= R;
    end
    else if(state == BUILD_GEOFENCE)
    begin
        case(build_counter)
            3'd0 :
            begin
                case(store_counter2)
                    3'd0 :
                    begin
                        if(COMPUTE_RESULT[20])
                        begin
                            geofence_X[2] <= geofence_X[2];
                            geofence_Y[2] <= geofence_Y[2];
                            geofence_R[2] <= geofence_R[2];
                            geofence_X[3] <= geofence_X[3];
                            geofence_Y[3] <= geofence_Y[3];
                            geofence_R[3] <= geofence_R[3];
                        end
                        else
                        begin
                            geofence_X[2] <= geofence_X[3];
                            geofence_Y[2] <= geofence_Y[3];
                            geofence_R[2] <= geofence_R[3];
                            geofence_X[3] <= geofence_X[2];
                            geofence_Y[3] <= geofence_Y[2];
                            geofence_R[3] <= geofence_R[2];
                        end
                    end

                    3'd1 :
                    begin
                        if(COMPUTE_RESULT[20])
                        begin
                            geofence_X[3] <= geofence_X[3];
                            geofence_Y[3] <= geofence_Y[3];
                            geofence_R[3] <= geofence_R[3];
                            geofence_X[4] <= geofence_X[4];
                            geofence_Y[4] <= geofence_Y[4];
                            geofence_R[4] <= geofence_R[4];
                        end
                        else
                        begin
                            geofence_X[3] <= geofence_X[4];
                            geofence_Y[3] <= geofence_Y[4];
                            geofence_R[3] <= geofence_R[4];
                            geofence_X[4] <= geofence_X[3];
                            geofence_Y[4] <= geofence_Y[3];
                            geofence_R[4] <= geofence_R[3];
                        end
                    end

                    3'd2 :
                    begin
                        if(COMPUTE_RESULT[20])
                        begin
                            geofence_X[4] <= geofence_X[4];
                            geofence_Y[4] <= geofence_Y[4];
                            geofence_R[4] <= geofence_R[4];
                            geofence_X[5] <= geofence_X[5];
                            geofence_Y[5] <= geofence_Y[5];
                            geofence_R[5] <= geofence_R[5];
                        end
                        else
                        begin
                            geofence_X[4] <= geofence_X[5];
                            geofence_Y[4] <= geofence_Y[5];
                            geofence_R[4] <= geofence_R[5];
                            geofence_X[5] <= geofence_X[4];
                            geofence_Y[5] <= geofence_Y[4];
                            geofence_R[5] <= geofence_R[4];
                        end
                    end

                    3'd3 :
                    begin
                        if(COMPUTE_RESULT[20])
                        begin
                            geofence_X[5] <= geofence_X[5];
                            geofence_Y[5] <= geofence_Y[5];
                            geofence_R[5] <= geofence_R[5];
                            geofence_X[6] <= geofence_X[6];
                            geofence_Y[6] <= geofence_Y[6];
                            geofence_R[6] <= geofence_R[6];
                        end
                        else
                        begin
                            geofence_X[5] <= geofence_X[6];
                            geofence_Y[5] <= geofence_Y[6];
                            geofence_R[5] <= geofence_R[6];
                            geofence_X[6] <= geofence_X[5];
                            geofence_Y[6] <= geofence_Y[5];
                            geofence_R[6] <= geofence_R[5];
                        end
                    end
                    default :
                    begin
                        for(i=1;i<7;i=i+1)
                        begin
                            geofence_X[i] <= geofence_X[i];
                            geofence_Y[i] <= geofence_Y[i];
                            geofence_R[i] <= geofence_R[i];
                        end
                    end

                endcase
            end
            3'd1 :
            begin
                case(store_counter2)
                    3'd0 :
                    begin
                        if(COMPUTE_RESULT[20])
                        begin
                            geofence_X[2] <= geofence_X[2];
                            geofence_Y[2] <= geofence_Y[2];
                            geofence_R[2] <= geofence_R[2];
                            geofence_X[3] <= geofence_X[3];
                            geofence_Y[3] <= geofence_Y[3];
                            geofence_R[3] <= geofence_R[3];
                        end
                        else
                        begin
                            geofence_X[2] <= geofence_X[3];
                            geofence_Y[2] <= geofence_Y[3];
                            geofence_R[2] <= geofence_R[3];
                            geofence_X[3] <= geofence_X[2];
                            geofence_Y[3] <= geofence_Y[2];
                            geofence_R[3] <= geofence_R[2];
                        end
                    end

                    3'd1 :
                    begin
                        if(COMPUTE_RESULT[20])
                        begin
                            geofence_X[3] <= geofence_X[3];
                            geofence_Y[3] <= geofence_Y[3];
                            geofence_R[3] <= geofence_R[3];
                            geofence_X[4] <= geofence_X[4];
                            geofence_Y[4] <= geofence_Y[4];
                            geofence_R[4] <= geofence_R[4];
                        end
                        else
                        begin
                            geofence_X[3] <= geofence_X[4];
                            geofence_Y[3] <= geofence_Y[4];
                            geofence_R[3] <= geofence_R[4];
                            geofence_X[4] <= geofence_X[3];
                            geofence_Y[4] <= geofence_Y[3];
                            geofence_R[4] <= geofence_R[3];
                        end
                    end

                    3'd2 :
                    begin
                        if(COMPUTE_RESULT[20])
                        begin
                            geofence_X[4] <= geofence_X[4];
                            geofence_Y[4] <= geofence_Y[4];
                            geofence_R[4] <= geofence_R[4];
                            geofence_X[5] <= geofence_X[5];
                            geofence_Y[5] <= geofence_Y[5];
                            geofence_R[5] <= geofence_R[5];
                        end
                        else
                        begin
                            geofence_X[4] <= geofence_X[5];
                            geofence_Y[4] <= geofence_Y[5];
                            geofence_R[4] <= geofence_R[5];
                            geofence_X[5] <= geofence_X[4];
                            geofence_Y[5] <= geofence_Y[4];
                            geofence_R[5] <= geofence_R[4];
                        end
                    end

                    default :
                    begin
                        for(i=1;i<7;i=i+1)
                        begin
                            geofence_X[i] <= geofence_X[i];
                            geofence_Y[i] <= geofence_Y[i];
                            geofence_R[i] <= geofence_R[i];
                        end
                    end

                endcase
            end

            3'd2 :
            begin
                case(store_counter2)
                    3'd0 :
                    begin
                        if(COMPUTE_RESULT[20])
                        begin
                            geofence_X[2] <= geofence_X[2];
                            geofence_Y[2] <= geofence_Y[2];
                            geofence_R[2] <= geofence_R[2];
                            geofence_X[3] <= geofence_X[3];
                            geofence_Y[3] <= geofence_Y[3];
                            geofence_R[3] <= geofence_R[3];
                        end
                        else
                        begin
                            geofence_X[2] <= geofence_X[3];
                            geofence_Y[2] <= geofence_Y[3];
                            geofence_R[2] <= geofence_R[3];
                            geofence_X[3] <= geofence_X[2];
                            geofence_Y[3] <= geofence_Y[2];
                            geofence_R[3] <= geofence_R[2];
                        end
                    end

                    3'd1 :
                    begin
                        if(COMPUTE_RESULT[20])
                        begin
                            geofence_X[3] <= geofence_X[3];
                            geofence_Y[3] <= geofence_Y[3];
                            geofence_R[3] <= geofence_R[3];
                            geofence_X[4] <= geofence_X[4];
                            geofence_Y[4] <= geofence_Y[4];
                            geofence_R[4] <= geofence_R[4];
                        end
                        else
                        begin
                            geofence_X[3] <= geofence_X[4];
                            geofence_Y[3] <= geofence_Y[4];
                            geofence_R[3] <= geofence_R[4];
                            geofence_X[4] <= geofence_X[3];
                            geofence_Y[4] <= geofence_Y[3];
                            geofence_R[4] <= geofence_R[3];
                        end
                    end

                    default :
                    begin
                        for(i=1;i<7;i=i+1)
                        begin
                            geofence_X[i] <= geofence_X[i];
                            geofence_Y[i] <= geofence_Y[i];
                            geofence_R[i] <= geofence_R[i];
                        end
                    end

                endcase
            end

            3'd3 :
            begin
                case(store_counter2)
                    3'd0 :
                    begin
                        if(COMPUTE_RESULT[20])
                        begin
                            geofence_X[2] <= geofence_X[2];
                            geofence_Y[2] <= geofence_Y[2];
                            geofence_R[2] <= geofence_R[2];
                            geofence_X[3] <= geofence_X[3];
                            geofence_Y[3] <= geofence_Y[3];
                            geofence_R[3] <= geofence_R[3];
                        end
                        else
                        begin
                            geofence_X[2] <= geofence_X[3];
                            geofence_Y[2] <= geofence_Y[3];
                            geofence_R[2] <= geofence_R[3];
                            geofence_X[3] <= geofence_X[2];
                            geofence_Y[3] <= geofence_Y[2];
                            geofence_R[3] <= geofence_R[2];
                        end
                    end

                    default :
                    begin
                        for(i=1;i<7;i=i+1)
                        begin
                            geofence_X[i] <= geofence_X[i];
                            geofence_Y[i] <= geofence_Y[i];
                            geofence_R[i] <= geofence_R[i];
                        end
                    end
                endcase
            end
        endcase
    end
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//COMPUTE_RESULT
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
always @(*)
begin
    if(state == BUILD_GEOFENCE || state == AREA6_CACULATE)
        COMPUTE_RESULT = $signed(F)*$signed(G) - $signed(H)*$signed(I);
    else
        COMPUTE_RESULT = 22'd0;
end

always @(*)
begin
    if(state == BUILD_GEOFENCE)
    begin
        F = geofence_X[store_counter2 + 3'd2] - geofence_X[1];
        G = geofence_Y[store_counter2 + 3'd3] - geofence_Y[1];
        H = geofence_X[store_counter2 + 3'd3] - geofence_X[1];
        I = geofence_Y[store_counter2 + 3'd2] - geofence_Y[1];
    end
    else if(state == AREA6_CACULATE)
    begin
        F = geofence_X_reg[0];
        G = geofence_Y_reg[1];
        H = geofence_X_reg[1];
        I = geofence_Y_reg[0];
    end
    else
    begin
        F = 22'd0;
        G = 22'd0;
        H = 22'd0;
        I = 22'd0;
    end
end


//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//AREA3_CACULATE
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//  geofence_X_reg && geofence_Y_reg
always @(*)
begin
    if(state == AREA3_CACULATE)
    begin
        case(caculate_counter)
            3'd0 :
            begin
                geofence_X_reg[0] = geofence_X[1];
                geofence_X_reg[1] = geofence_X[2];
                geofence_Y_reg[0] = geofence_Y[1];
                geofence_Y_reg[1] = geofence_Y[2];
                geofence_R_reg[0] = geofence_R[1];
                geofence_R_reg[1] = geofence_R[2];
            end
            3'd1 :
            begin
                geofence_X_reg[0] = geofence_X[2];
                geofence_X_reg[1] = geofence_X[3];
                geofence_Y_reg[0] = geofence_Y[2];
                geofence_Y_reg[1] = geofence_Y[3];
                geofence_R_reg[0] = geofence_R[2];
                geofence_R_reg[1] = geofence_R[3];
            end
            3'd2 :
            begin
                geofence_X_reg[0] = geofence_X[3];
                geofence_X_reg[1] = geofence_X[4];
                geofence_Y_reg[0] = geofence_Y[3];
                geofence_Y_reg[1] = geofence_Y[4];
                geofence_R_reg[0] = geofence_R[3];
                geofence_R_reg[1] = geofence_R[4];
            end
            3'd3 :
            begin
                geofence_X_reg[0] = geofence_X[4];
                geofence_X_reg[1] = geofence_X[5];
                geofence_Y_reg[0] = geofence_Y[4];
                geofence_Y_reg[1] = geofence_Y[5];
                geofence_R_reg[0] = geofence_R[4];
                geofence_R_reg[1] = geofence_R[5];
            end
            3'd4 :
            begin
                geofence_X_reg[0] = geofence_X[5];
                geofence_X_reg[1] = geofence_X[6];
                geofence_Y_reg[0] = geofence_Y[5];
                geofence_Y_reg[1] = geofence_Y[6];
                geofence_R_reg[0] = geofence_R[5];
                geofence_R_reg[1] = geofence_R[6];
            end
            3'd5 :
            begin
                geofence_X_reg[0] = geofence_X[1];
                geofence_X_reg[1] = geofence_X[6];
                geofence_Y_reg[0] = geofence_Y[1];
                geofence_Y_reg[1] = geofence_Y[6];
                geofence_R_reg[0] = geofence_R[1];
                geofence_R_reg[1] = geofence_R[6];
            end
            default :
            begin
                geofence_X_reg[0] = 10'd0;
                geofence_X_reg[1] = 10'd0;
                geofence_Y_reg[0] = 10'd0;
                geofence_Y_reg[1] = 10'd0;
                geofence_R_reg[0] = 11'd0;
                geofence_R_reg[1] = 11'd0;
            end
        endcase
    end
    else if(state == AREA6_CACULATE)
    begin
        case(caculate_counter)
            3'd0 :
            begin
                geofence_X_reg[0] = geofence_X[1];
                geofence_X_reg[1] = geofence_X[6];
                geofence_Y_reg[0] = geofence_Y[1];
                geofence_Y_reg[1] = geofence_Y[6];
            end
            3'd1 :
            begin

                geofence_X_reg[0] = geofence_X[6];
                geofence_X_reg[1] = geofence_X[5];
                geofence_Y_reg[0] = geofence_Y[6];
                geofence_Y_reg[1] = geofence_Y[5];
            end
            3'd2 :
            begin
                geofence_X_reg[0] = geofence_X[5];
                geofence_X_reg[1] = geofence_X[4];
                geofence_Y_reg[0] = geofence_Y[5];
                geofence_Y_reg[1] = geofence_Y[4];
            end
            3'd3 :
            begin
                geofence_X_reg[0] = geofence_X[4];
                geofence_X_reg[1] = geofence_X[3];
                geofence_Y_reg[0] = geofence_Y[4];
                geofence_Y_reg[1] = geofence_Y[3];
            end
            3'd4 :
            begin
                geofence_X_reg[0] = geofence_X[3];
                geofence_X_reg[1] = geofence_X[2];
                geofence_Y_reg[0] = geofence_Y[3];
                geofence_Y_reg[1] = geofence_Y[2];
            end
            3'd5 :
            begin
                geofence_X_reg[0] = geofence_X[2];
                geofence_X_reg[1] = geofence_X[1];
                geofence_Y_reg[0] = geofence_Y[2];
                geofence_Y_reg[1] = geofence_Y[1];
            end
            default :
            begin
                geofence_X_reg[0] = 10'd0;
                geofence_X_reg[1] = 10'd0;
                geofence_Y_reg[0] = 10'd0;
                geofence_Y_reg[1] = 10'd0;
            end
        endcase
    end
    else
    begin
        geofence_X_reg[0] = 10'd0;
        geofence_X_reg[1] = 10'd0;
        geofence_Y_reg[0] = 10'd0;
        geofence_Y_reg[1] = 10'd0;
        geofence_R_reg[0] = 11'd0;
        geofence_R_reg[1] = 11'd0;
    end
end

//  X_REG && Y_REG
always @(*)
begin
    if(state == AREA3_CACULATE)
    begin
        begin
            if(geofence_X_reg[0] > geofence_X_reg[1])
                X_REG = geofence_X_reg[0] - geofence_X_reg[1];
            else
                X_REG = geofence_X_reg[1] - geofence_X_reg[0];
        end
        begin
            if(geofence_Y_reg[0] > geofence_Y_reg[1])
                Y_REG = geofence_Y_reg[0] - geofence_Y_reg[1];
            else
                Y_REG = geofence_Y_reg[1] - geofence_Y_reg[0];
        end
    end
    else
    begin
        X_REG = 10'd0;
        Y_REG = 10'd0;
    end
end

//  side_length_before
assign side_length_before = (state == AREA3_CACULATE)? (X_REG*X_REG) + (Y_REG*Y_REG) : 25'd0;

// DW_sqrt
DW_sqrt #(23,0)
        sqrt1(.a(side_length_before), .root(side_length_after));
DW_sqrt #(23,0)
        sqrt2(.a(area_sqrt1_before), .root(area_sqrt1_after));
DW_sqrt #(23,0)
        sqrt3(.a(area_sqrt2_before), .root(area_sqrt2_after));

//  S
always @(*)
begin
    if(state == AREA3_CACULATE)
        S = (geofence_R_reg[0] + geofence_R_reg[1] + side_length_after) >> 1;
    else
        S = 12'd0;
end

//      area_sqrt1_before
assign area_sqrt1_before = (state == AREA3_CACULATE)? S*E :23'd0;

always @(*)
begin
    if(state == AREA3_CACULATE)
    begin
        if(S > side_length_after)
            E = S-side_length_after;
        else
            E = side_length_after-S;
    end
    else
        E = 12'd0;
end

//      area_sqrt2_before
assign area_sqrt2_before = (state == AREA3_CACULATE)?(A-B)*(C-D) :23'd0;
always @(*)
begin
    if(state == AREA3_CACULATE)
    begin
        if(S > geofence_R_reg[0] && S > geofence_R_reg[1])
        begin
            A = S;
            B = geofence_R_reg[0];
            C = S;
            D = geofence_R_reg[1];
        end
        else if(S > geofence_R_reg[0] && S < geofence_R_reg[1])
        begin
            A = S;
            B = geofence_R_reg[0];
            C = geofence_R_reg[1];
            D = S;
        end
        else if(S < geofence_R_reg[0] && S > geofence_R_reg[1])
        begin
            A = geofence_R_reg[0];
            B = S;
            C = S;
            D = geofence_R_reg[1];
        end
        else
        begin
            A = geofence_R_reg[0];
            B = S;
            C = geofence_R_reg[1];
            D = S;
        end
    end
    else
    begin
        A = 13'd0;
        B = 13'd0;
        C = 13'd0;
        D = 13'd0;
    end
end

assign area_reg  = (state == AREA3_CACULATE)? area_sqrt1_after*area_sqrt2_after : 23'd0;

always @(posedge clk or posedge reset)
begin
    if(reset)
        area <= 23'd0;
    else if(state == AREA3_CACULATE)
        area <= area + area_reg;
    else if(state == AREA6_CACULATE)
        area <= area - area_6_reg;
    else if(state == DATA_STORE)
        area <= 23'd0;
end

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//AREA6_CACULATE
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
assign area_6_reg = (state == AREA6_CACULATE)? COMPUTE_RESULT >>> 1: 23'd0;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// valid
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
assign valid = (state == DETERMINE)? 1'b1 : 1'b0;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//is_inside
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
assign is_inside = (state == DETERMINE)?  (area[22])? 1'b1 : 1'b0 : 1'b0;

endmodule

