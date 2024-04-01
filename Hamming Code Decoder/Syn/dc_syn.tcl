#Read All Files
read_file -format verilog  HD.v
#read_file -format sverilog  JAM.v
current_design HD
link

#Setting Clock Constraints
#source -echo -verbose HD.sdc
check_design
set high_fanout_net_threshold 0
uniquify
set_fix_multiple_port_nets -all -buffer_constants [get_designs *]
compile_ultra
#Synthesis all design
compile -map_effort high -area_effort high
#compile -map_effort high -area_effort high -inc
#compile_ultra

write -format ddc     -hierarchy -output "HD_syn.ddc"
write_sdf -version 1.0  HD_syn.sdf
write -format verilog -hierarchy -output HD_syn.v
report_area > area.log
report_timing > timing.log
report_power > power.log
report_qor   >  HD_syn.qor
