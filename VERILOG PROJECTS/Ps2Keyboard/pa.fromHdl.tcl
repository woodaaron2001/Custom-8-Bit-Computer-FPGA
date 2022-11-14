
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Ps2Keyboard -dir "C:/Users/redbr/Desktop/fpga-files/VERILOG PROJECTS/Ps2Keyboard/planAhead_run_5" -part xc3s250ecp132-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "C:/Users/redbr/Desktop/fpga-files/VERILOG PROJECTS/Ps2Keyboard/ps2Keyboard.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {top.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top ps2Keyboard $srcset
add_files [list {ps2Keyboard.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {const.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s250ecp132-5
