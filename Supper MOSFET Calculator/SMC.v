module SMC(mode, W_0, V_GS_0, V_DS_0, W_1, V_GS_1, V_DS_1, W_2, V_GS_2, V_DS_2, W_3, V_GS_3, V_DS_3, W_4, V_GS_4, V_DS_4, W_5, V_GS_5, V_DS_5, out_n);
input [2:0] W_0, V_GS_0, V_DS_0;
input [2:0] W_1, V_GS_1, V_DS_1;
input [2:0] W_2, V_GS_2, V_DS_2;
input [2:0] W_3, V_GS_3, V_DS_3;
input [2:0] W_4, V_GS_4, V_DS_4;
input [2:0] W_5, V_GS_5, V_DS_5;
input [1:0] mode;
output[9:0] out_n;
//============================================================================
wire [7:0] Id_n_gm_n [0:5];
wire [7:0] Itotal_0, Ia_0, Ib_0, Ic_0, Id_0, Ie_0, Ih_0, Iu_0;
wire [7:0] Itotal_1, Ia_1, Ib_1, Ic_1, Id_1, Ie_1, Ih_1, Iu_1;
wire [7:0] Itotal_2, Ia_2, Ib_2, Ic_2, Id_2, Ie_2, Ih_2, Iu_2;
wire [7:0] Itotal_3, Ia_3, Ib_3, Ic_3, Id_3, Ie_3, Ih_3, Iu_3;
wire [7:0] Itotal_4, Ia_4, Ib_4, Ic_4, Id_4, Ie_4, Ih_4, Iu_4;
wire [7:0] Itotal_5, Ia_5, Ib_5, Ic_5, Id_5, Ie_5, Ih_5, Iu_5;
wire [7:0] S_0, S_1, S_2, S_3, S_4, S_5;
wire [7:0] H_0, H_1, H_2, H_3;
wire [7:0] M_0, M_1, M_2, M_3, M_4, M_5;
wire [7:0] K_0, K_1, K_2, K_3;
wire [7:0] I_0, I_1, I_2, I_3, I_4, I_5;
wire [7:0] J_0, J_1, J_2, J_3;
wire [9:0] n_0, n_1, n_2;
wire [9:0] i_0, i_1, i_2, i_3, i_4;
wire [9:0] a, b, c;
parameter[2:0] Vth = 3'd1;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//CACULATE_0
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
assign Id_n_gm_n[0] = Iu_0/2'd3;
assign Ia_0 = Id_0*Ie_0;
assign Ib_0 = V_GS_0 - Vth;
assign Ic_0 = (Ib_0 << 1) - V_DS_0;
assign Id_0 = (Ib_0 > V_DS_0)? V_DS_0 : Ib_0;
assign Ie_0 = (Ib_0 > V_DS_0)? Ic_0 : Ib_0;
assign Itotal_0 = W_0*Ih_0;
assign Ih_0 = (mode[0])? Ia_0 : Id_0;
assign Iu_0 = (mode[0])? Itotal_0 : Itotal_0 << 1;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//CACULATE_1
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
assign Id_n_gm_n[1] = Iu_1/2'd3;
assign Ia_1 = Id_1*Ie_1;
assign Ib_1 = V_GS_1 - Vth;
assign Ic_1 = (Ib_1 << 1) - V_DS_1;
assign Id_1 = (Ib_1 > V_DS_1)? V_DS_1 : Ib_1;
assign Ie_1 = (Ib_1 > V_DS_1)? Ic_1 : Ib_1;
assign Itotal_1 = W_1*Ih_1;
assign Ih_1 = (mode[0])? Ia_1 : Id_1;
assign Iu_1 = (mode[0])? Itotal_1 : Itotal_1 << 1;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//CACULATE_2
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
assign Id_n_gm_n[2] = Iu_2/2'd3;
assign Ia_2 = Id_2*Ie_2;
assign Ib_2 = V_GS_2 - Vth;
assign Ic_2 = (Ib_2 << 1) - V_DS_2;
assign Id_2 = (Ib_2 > V_DS_2)? V_DS_2 : Ib_2;
assign Ie_2 = (Ib_2 > V_DS_2)? Ic_2 : Ib_2;
assign Itotal_2 = W_2*Ih_2;
assign Ih_2 = (mode[0])? Ia_2 : Id_2;
assign Iu_2 = (mode[0])? Itotal_2 : Itotal_2 << 1;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//CACULATE_3
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
assign Id_n_gm_n[3] = Iu_3/2'd3;
assign Ia_3 = Id_3*Ie_3;
assign Ib_3 = V_GS_3 - Vth;
assign Ic_3 = (Ib_3 << 1) - V_DS_3;
assign Id_3 = (Ib_3 > V_DS_3)? V_DS_3 : Ib_3;
assign Ie_3 = (Ib_3 > V_DS_3)? Ic_3 : Ib_3;
assign Itotal_3 = W_3*Ih_3;
assign Ih_3 = (mode[0])? Ia_3 : Id_3;
assign Iu_3 = (mode[0])? Itotal_3 : Itotal_3 << 1;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//CACULATE_4
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
assign Id_n_gm_n[4] = Iu_4/2'd3;
assign Ia_4 = Id_4*Ie_4;
assign Ib_4 = V_GS_4 - Vth;
assign Ic_4 = (Ib_4 << 1) - V_DS_4;
assign Id_4 = (Ib_4 > V_DS_4)? V_DS_4 : Ib_4;
assign Ie_4 = (Ib_4 > V_DS_4)? Ic_4 : Ib_4;
assign Itotal_4 = W_4*Ih_4;
assign Ih_4 = (mode[0])? Ia_4 : Id_4;
assign Iu_4 = (mode[0])? Itotal_4 : Itotal_4 << 1;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//CACULATE_5
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
assign Id_n_gm_n[5] = Iu_5/2'd3;
assign Ia_5 = Id_5*Ie_5;
assign Ib_5 = V_GS_5 - Vth;
assign Ic_5 = (Ib_5 << 1) - V_DS_5;
assign Id_5 = (Ib_5 > V_DS_5)? V_DS_5 : Ib_5;
assign Ie_5 = (Ib_5 > V_DS_5)? Ic_5 : Ib_5;
assign Itotal_5 = W_5*Ih_5;
assign Ih_5 = (mode[0])? Ia_5 : Id_5;
assign Iu_5 = (mode[0])? Itotal_5 : Itotal_5 << 1;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//I_SORT
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
assign {S_0, S_1} = (Id_n_gm_n[0] > Id_n_gm_n[1])? {Id_n_gm_n[0], Id_n_gm_n[1]} : {Id_n_gm_n[1], Id_n_gm_n[0]};
assign {S_2, S_3} = (Id_n_gm_n[2] > Id_n_gm_n[3])? {Id_n_gm_n[2], Id_n_gm_n[3]} : {Id_n_gm_n[3], Id_n_gm_n[2]};
assign {S_4, S_5} = (Id_n_gm_n[4] > Id_n_gm_n[5])? {Id_n_gm_n[4], Id_n_gm_n[5]} : {Id_n_gm_n[5], Id_n_gm_n[4]};
assign {H_0, H_1} = (S_1 > S_2)? {S_1, S_2} : {S_2, S_1};
assign {H_2, H_3} = (S_3 > S_4)? {S_3, S_4} : {S_4, S_3};
assign {M_0, M_1} = (S_0 > H_0)? {S_0, H_0} : {H_0, S_0};
assign {M_2, M_3} = (H_1 > H_2)? {H_1, H_2} : {H_2, H_1};
assign {M_4, M_5} = (H_3 > S_5)? {H_3, S_5} : {S_5, H_3};
assign {K_0, K_1} = (M_1 > M_2)? {M_1, M_2} : {M_2, M_1};
assign {K_2, K_3} = (M_3 > M_4)? {M_3, M_4} : {M_4, M_3};
assign {I_0, I_1} = (M_0 > K_0)? {M_0, K_0} : {K_0, M_0};
assign {I_2, I_3} = (K_1 > K_2)? {K_1, K_2} : {K_2, K_1};
assign {I_4, I_5} = (K_3 > M_5)? {K_3, M_5} : {M_5, K_3};
assign {J_0, J_1} = (I_1 > I_2)? {I_1, I_2} : {I_2, I_1};
assign {J_2, J_3} = (I_3 > I_4)? {I_3, I_4} : {I_4, I_3};

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//caculate result
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
assign n_0 = (mode[1])? I_0 : J_2;
assign n_1 = (mode[1])? J_0 : J_3;
assign n_2 = (mode[1])? J_1 : I_5;
assign i_3 = n_0 << 1;
assign i_4 = n_2 << 2;
assign i_0 = i_3 + n_0;
assign i_1 = n_1 << 2;
assign i_2 = i_4 + n_2;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//out_n
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
assign a = (mode[0]) ? i_0 : n_0;
assign b = (mode[0]) ? i_1 : n_1;
assign c = (mode[0]) ? i_2 : n_2;
assign out_n = a + b + c;

endmodule
