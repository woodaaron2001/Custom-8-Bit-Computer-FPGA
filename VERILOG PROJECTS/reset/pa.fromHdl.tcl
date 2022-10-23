
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name reset -dir "C:/Users/redbr/Desktop/fpga-files/VERILOG PROJECTS/reset/planAhead_run_1" -part xc3s250ecp132-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "testReset.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {testReset.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top testReset $srcset
add_files [list {testReset.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s250ecp132-5
