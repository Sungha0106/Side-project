#======================================================
#  Global Parameters
#======================================================
set DESIGN "GF_IA"
set CYCLE 10.0

#======================================================
#  Read RTL Code
#======================================================
analyze -f verilog GF_IA.v
analyze -f verilog GF2k.v
elaborate GF_IA
current_design GF_IA

link > GF_IA.log

#======================================================
#  (C) Global Setting
#======================================================
set_wire_load_mode top
set_operating_conditions -max_library slow -max slow
set_wire_load_model -name tsmc13_wl10 -library slow                        
#set_max_fanout 20 [all_inputs]


#======================================================
#  Set Design Constraints
#======================================================
create_clock -name "clk" -period $CYCLE clk 
set_input_delay  [ expr $CYCLE*0.5 ] -clock clk [all_inputs]
set_output_delay [ expr $CYCLE*0.5 ] -clock clk [all_outputs]
set_input_delay 0 -clock clk clk
set_input_delay 0 -clock clk rst_n
set_load 0.05 [all_outputs]
set_wire_load_mode top

#======================================================
#  Optimization
#======================================================
uniquify
check_design > GF_IA.log
set_fix_multiple_port_nets -all -buffer_constants
compile_ultra

#======================================================
#  Output Reports
#======================================================
write -format ddc     -hierarchy -output "GF_IA_syn.ddc"
write_sdf -version 1.0  GF_IA_syn.sdf
write -format verilog -hierarchy -output GF_IA_syn.v
report_area > area.log
report_timing > timing.log
report_power > power.log
report_qor   >  GF_IA_syn.qor

#======================================================
#  Finish and Quit
#======================================================
report_area
report_timing

exit