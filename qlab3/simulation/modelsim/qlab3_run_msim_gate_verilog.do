transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/cycloneii_ver
vmap cycloneii_ver ./verilog_libs/cycloneii_ver
vlog -vlog01compat -work cycloneii_ver {c:/altera/12.1sp1/quartus/eda/sim_lib/cycloneii_atoms.v}

if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {qlab3_fast.vo}

vlog -sv -work work +incdir+E:/study/Labs/Verify/qlab3/simulation/modelsim {E:/study/Labs/Verify/qlab3/simulation/modelsim/qlab3.vt}

vsim -t 1ps +transport_int_delays +transport_path_delays -L cycloneii_ver -L gate_work -L work -voptargs="+acc"  qlab3_vlg_tst

add wave *
view structure
view signals
run 1024 us
