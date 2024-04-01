set DESIGN "CC"
set CYCLE 20
set INPUT_DLY [expr 0.5*$CYCLE]
set OUTPUT_DLY [expr 0.5*$CYCLE]
#======================================================
# (B) Read RTL Code
#======================================================
# (B-1) analyze + elaborate
set hdlin_auto_save_templates TRUE
analyze -f sverilog $DESIGN\.v 
elaborate $DESIGN  
# (B-2) read_sverilog
#read_sverilog $DESIGN\.v
# (B-3) set current design
current_design $DESIGN
link

#======================================================
#  (C) Global Setting
#======================================================
set_wire_load_mode top
set_wire_load_model -name tsmc13_wl10 -library slow   
set_operating_conditions -min fast -max slow

#======================================================
#  (D) Set Design Constraints
#======================================================
set_max_delay $CYCLE -from [all_inputs] -to [all_outputs]
set_load 0.05 [all_outputs]

#======================================================
#  (E) Optimization
#======================================================
set_fix_multiple_port_nets -all -buffer_constants [get_designs *]
# set_fix_hold [all_clocks]
compile_ultra
#uniquify
#compile
#Synthesis all design
#compile -map_effort high -area_effort high
#compile -map_effort high -area_effort high -inc
compile

write -format ddc     -hierarchy -output "CC_syn.ddc"
write_sdf -version 1.0  CC_syn.sdf
write -format verilog -hierarchy -output CC_syn.v
report_area > area.log
report_timing > timing.log
report_qor   >  CC_syn.qor
