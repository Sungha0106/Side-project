#======================================================
#  Global Parameters
#======================================================
set DESIGN "NN"
set CLK_period 11.9
#Read All Files
read_file -format verilog NN.v
#read_file -format sverilog  JAM.v
current_design NN
link


#======================================================
#  Global Setting
#======================================================
#set_wire_load_mode top

#======================================================
#  Set Design Constraints
#======================================================
create_clock -name "clk" -period $CLK_period clk 
set_input_delay  [ expr $CLK_period*0.5 ] -clock clk [all_inputs]
set_output_delay [ expr $CLK_period*0.5 ] -clock clk [all_outputs]
set_input_delay 0 -clock clk clk
set_input_delay 0 -clock clk rst_n
set_load 0.05 [all_outputs]

#======================================================
#  Optimization
#======================================================
uniquify
set_fix_multiple_port_nets -all -buffer_constants
#set_fix_hold [all_clocks]
compile_ultra


write -format ddc     -hierarchy -output "NN_syn.ddc"
write_sdf -version 1.0  NN_syn.sdf
write -format verilog -hierarchy -output NN_syn.v
report_area > area.log
report_timing > timing.log
report_power > power.log
report_qor   >  NN_syn.qor

