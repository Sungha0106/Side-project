set DESIGN "SMC"
set MAX_Delay 20
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
#  Global Setting
#======================================================
#set_operating_conditions -max slow -min fast
#======================================================
#  Set Design Constraints
#======================================================
set_max_delay $MAX_Delay -from [all_inputs] -to [all_outputs]

#======================================================
#  Optimization
#======================================================

uniquify
set_fix_multiple_port_nets -all -buffer_constants
compile_ultra

#======================================================
#  Output Reports 
#======================================================
report_timing >  Report/$DESIGN\.timing
report_area >  Report/$DESIGN\.area
report_resource >  Report/$DESIGN\.resource

#======================================================

set verilogout_higher_designs_first true
write -format ddc     -hierarchy -output "SMC_syn.ddc"
write_sdf -version 3.0  SMC_syn.sdf -significant_digits 6
write -format verilog -hierarchy -output SMC_syn.v 
report_area > area.log
report_timing > timing.log
report_power > power.log
report_qor   >  SMC_syn.qor
