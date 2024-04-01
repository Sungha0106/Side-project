set DESIGN "KT"
set clk_period 5.0
set IN_DLY  [expr 0.5*$clk_period]
set OUT_DLY [expr 0.5*$clk_period]


#Read All Files
read_file -format verilog  KT.v
current_design KT
link

#======================================================
#  Set Design Constraints
#======================================================
create_clock -name "clk" -period $clk_period clk
set_ideal_network -no_propagate clk
set_input_delay  $IN_DLY -clock clk [all_inputs]
set_output_delay $OUT_DLY  -clock clk [all_outputs]
set_input_delay 0 -clock clk clk
set_input_delay 0 -clock clk rst_n
set_load 0.05 [all_outputs]
#set_dont_use slow/JKFF*


#======================================================
#  Optimization
#======================================================
uniquify
set_fix_multiple_port_nets -all -buffer_constants
set_fix_hold [all_clocks]
compile_ultra

write -format ddc     -hierarchy -output "KT_syn.ddc"
write_sdf -version 1.0  KT_syn.sdf
write -format verilog -hierarchy -output KT_syn.v
report_area > area.log
report_timing > timing.log
report_qor   >  KT_syn.qor
