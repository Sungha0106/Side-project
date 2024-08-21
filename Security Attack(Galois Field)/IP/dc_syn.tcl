# ======================================================
#  Global Parameters
# ======================================================
set DESIGN "GF2k_demo"
set MAX_Delay 50.0

# ======================================================
#  Read RTL Code
# ======================================================
analyze -f verilog GF2k_demo.v
analyze -f verilog GF2k.v
elaborate GF2k_demo
current_design GF2k_demo

link

#======================================================
#  (C) Global Setting
#======================================================

# ======================================================
#  Set Design Constraints
# ======================================================
set_load 0.05 [all_outputs]
set_wire_load_mode top

#======================================================
#  Set Design Constraints
#======================================================
set_max_delay $MAX_Delay -from [all_inputs] -to [all_outputs]

# ======================================================
#  Optimization
# ======================================================
uniquify
check_design > GF2k_demo.check
set_fix_multiple_port_nets -all -buffer_constants
compile_ultra

#======================================================
#  Output Reports
#======================================================
write -format ddc     -hierarchy -output "GF2k_demo_syn.ddc"
write_sdf -version 1.0  GF2k_demo_syn.sdf
write -format verilog -hierarchy -output GF2k_demo_syn.v
report_area > area.log
report_timing > timing.log
report_power > power.log
report_qor   >  GF2k_demo_syn.qor

# ======================================================
#  Finish and Quit
# ======================================================
report_area
report_timing

exit

