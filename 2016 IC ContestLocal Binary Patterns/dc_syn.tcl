# Read all Files
# read_verilog LBP.v
read_file -format verilog  LBP.v
current_design LBP
link

# Setting Clock Constraits
source -echo -verbose LBP.sdc

# Synthesis all design
#compile -map_effort high -area_effort high
#compile -map_effort high -area_effort high -inc
compile_ultra
write -format ddc  -hierarchy -output "LBP_syn.ddc"
write_sdf LBP_syn.sdf
write_file -format verilog -hierarchy -output LBP_syn.v
report_area > area.log
report_timing > timing.log
report_qor > LBP_syn.qor

