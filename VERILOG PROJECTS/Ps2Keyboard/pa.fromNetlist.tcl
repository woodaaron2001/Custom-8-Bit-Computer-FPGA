
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Ps2Keyboard -dir "C:/Users/redbr/Desktop/fpga-files/VERILOG PROJECTS/Ps2Keyboard/planAhead_run_3" -part xc3s250ecp132-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/redbr/Desktop/fpga-files/VERILOG PROJECTS/Ps2Keyboard/ps2Keyboard.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/redbr/Desktop/fpga-files/VERILOG PROJECTS/Ps2Keyboard} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "ps2Keyboard.ucf" [current_fileset -constrset]
add_files [list {ps2Keyboard.ucf}] -fileset [get_property constrset [current_run]]
link_design
