#======================================================
#  Global Parameters
#======================================================
set DESIGN "TMIP"
set CYCLE 20.0

#set IN_DLY [expr 0.5*$CLK_period]
#set OUT_DLY [expr 0.5*$CLK_period]
#Read All Files
read_file -format verilog  TMIP.v
current_design TMIP
link

#======================================================
#  Set Design Constraints
#======================================================

create_clock -name "clk" -period $CYCLE clk
set_input_delay  [ expr $CYCLE*0.5 ] -clock clk [all_inputs]
set_output_delay [ expr $CYCLE*0.5 ] -clock clk [all_outputs]
set_input_delay 0 -clock clk clk
set_input_delay 0 -clock clk rst_n

set_load 0.05 [all_outputs]
set_dont_use slow/JKFF*

set_fix_multiple_port_nets -all -buffer_constants
#Synthesis all design
#compile -map_effort high -area_effort high
#compile -map_effort high -area_effort high -inc
compile

write -format ddc     -hierarchy -output "TMIP_syn.ddc"
write_sdf -version 1.0  TMIP_syn.sdf
write -format verilog -hierarchy -output TMIP_syn.v
report_area > area.log
report_timing > timing.log
report_qor   >  TMIP_syn.qor
