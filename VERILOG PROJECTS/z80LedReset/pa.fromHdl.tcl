
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name z80LedReset -dir "C:/Users/redbr/Desktop/fpga-files/VERILOG PROJECTS/z80LedReset/planAhead_run_1" -part xc3s250ecp132-5
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "top.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/inc_dec_2bit.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/alu_slice.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/reg_latch.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/inc_dec.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/alu_shifter_core.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/alu_prep_daa.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/alu_mux_8.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/alu_mux_4.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/alu_mux_3z.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/alu_mux_2z.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/alu_mux_2.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/alu_core.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/alu_bit_select.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/address_mux.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/sequencer.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/resets.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/reg_file.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/reg_control.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/pla_decode.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/pin_control.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/memory_ifc.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/ir.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/interrupts.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/execute.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/decode_state.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/data_switch_mask.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/data_switch.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/data_pins.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/control_pins_n.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/clk_delay.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/bus_switch.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/bus_control.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/alu_select.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/alu_flags.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/alu_control.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/alu.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/address_pins.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/address_latch.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../CPU FILES/Aaron a-z80 - Py Export/z80_top_direct_n.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {top.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top top $srcset
add_files [list {top.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s250ecp132-5
