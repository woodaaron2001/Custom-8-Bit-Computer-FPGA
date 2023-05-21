transcript on
if ![file isdirectory customComputer_iputf_libs] {
	file mkdir customComputer_iputf_libs
}

if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cyclonev_ver
vmap cyclonev_ver ./verilog_libs/cyclonev_ver
vlog -vlog01compat -work cyclonev_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_hmi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/cyclonev_atoms.v}

vlib verilog_libs/cyclonev_hssi_ver
vmap cyclonev_hssi_ver ./verilog_libs/cyclonev_hssi_ver
vlog -vlog01compat -work cyclonev_hssi_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_hssi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_hssi_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/cyclonev_hssi_atoms.v}

vlib verilog_libs/cyclonev_pcie_hip_ver
vmap cyclonev_pcie_hip_ver ./verilog_libs/cyclonev_pcie_hip_ver
vlog -vlog01compat -work cyclonev_pcie_hip_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_pcie_hip_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_pcie_hip_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/cyclonev_pcie_hip_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

###### Libraries for IPUTF cores 
###### End libraries for IPUTF cores 
###### MIF file copy and HDL compilation commands for IPUTF cores 


vlog "C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/vga_pll_sim/vga_pll.vo"

vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/sequencer.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/resets.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/reg_latch.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/reg_file.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/reg_control.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/ram.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/pla_decode.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/pin_control.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/memory_ifc.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/ir.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/interrupts.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/inc_dec_2bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/inc_dec.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/decode_state.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/data_switch_mask.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/data_switch.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/data_pins.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/control_pins_n.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/clk_delay.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/bus_switch.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/bus_control.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/alu_slice.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/alu_shifter_core.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/alu_select.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/alu_prep_daa.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/alu_mux_8.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/alu_mux_4.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/alu_mux_3z.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/alu_mux_2z.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/alu_mux_2.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/alu_flags.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/alu_core.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/alu_control.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/alu_bit_select.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/address_pins.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/address_mux.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/address_latch.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/customComputer.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/rom.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/vgaController.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/vram.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/spriteRom.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/cram.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/cramController.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/charRom.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/z80_top_direct_n.v}
vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/execute.v}

vlog -vlog01compat -work work +incdir+C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer {C:/Users/redbr/Desktop/fpga-files/QuartusFiles/customComputer/test.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  test

add wave *
view structure
view signals
run -all
