#======================================================
#  Global Parameters
#======================================================
set DESIGN "TT"
set hdlin_ff_always_sync_set_reset true
set CYCLE 7.0
#Read All Files
read_file -format verilog  TT.v
current_design TT
link

#======================================================
#  Global Setting
#======================================================
set_wire_load_mode top

#======================================================
#  Set Design Constraints
#======================================================
create_clock -name "clk" -period $CYCLE clk 
set_input_delay  [ expr $CYCLE*0.5 ] -clock clk [all_inputs]
set_output_delay [ expr $CYCLE*0.5 ] -clock clk [all_outputs]
set_input_delay 0 -clock clk clk
set_load 0.05 [all_outputs]

#======================================================
#  Optimization
#======================================================
uniquify
set_fix_multiple_port_nets -all -buffer_constants
compile_ultra
# compile -map_effort high -area_effort high

write -format ddc     -hierarchy -output "TT_syn.ddc"
write_sdf -version 1.0  TT_syn.sdf
write -format verilog -hierarchy -output TT_syn.v
check_design > TT.check
report_area > area.log
report_timing > timing.log
report_power > power.log
report_qor   >  TT_syn.qor
