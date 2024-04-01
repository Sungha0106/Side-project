#======================================================
#  Global Parameters
#======================================================
set DESIGN "SD"
set hdlin_ff_always_sync_set_reset true
set CLK_period 7.0
#Read All Files
read_file -format verilog  SD.v
current_design SD
link
#======================================================
#  Global Setting
#======================================================
set_wire_load_mode top

#======================================================
#  Set Design Constraints
#======================================================
create_clock -name "clk" -period $CLK_period clk 
set_input_delay  [ expr $CLK_period*0.5 ] -clock clk [all_inputs]
set_output_delay [ expr $CLK_period*0.5 ] -clock clk [all_outputs]
set_input_delay 0 -clock clk clk
set_load 0.05 [all_outputs]

#======================================================
#  Optimization
#======================================================
uniquify
set_fix_multiple_port_nets -all -buffer_constants
compile_ultra

write -format ddc     -hierarchy -output "SD_syn.ddc"
write_sdf -version 1.0  SD_syn.sdf
write -format verilog -hierarchy -output SD_syn.v
report_area > area.log
report_timing > timing.log
report_qor   >  SD_syn.qor
