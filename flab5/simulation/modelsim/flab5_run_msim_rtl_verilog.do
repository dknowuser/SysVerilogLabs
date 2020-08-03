transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {c:/altera/12.1sp1/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {c:/altera/12.1sp1/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {c:/altera/12.1sp1/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {c:/altera/12.1sp1/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {c:/altera/12.1sp1/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cycloneii_ver
vmap cycloneii_ver ./verilog_libs/cycloneii_ver
vlog -vlog01compat -work cycloneii_ver {c:/altera/12.1sp1/quartus/eda/sim_lib/cycloneii_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/study/Labs/Verify/flab5 {E:/study/Labs/Verify/flab5/flab5.v}
vlib altera_reserved_qsys_flab5
vmap altera_reserved_qsys_flab5 altera_reserved_qsys_flab5
vlog -vlog01compat -work altera_reserved_qsys_flab5 +incdir+E:/study/Labs/Verify/flab5/db/ip/flab5 {E:/study/Labs/Verify/flab5/db/ip/flab5/flab5.v}
vlog -vlog01compat -work altera_reserved_qsys_flab5 +incdir+E:/study/Labs/Verify/flab5/db/ip/flab5/submodules {E:/study/Labs/Verify/flab5/db/ip/flab5/submodules/altera_avalon_sc_fifo.v}
vlog -vlog01compat -work altera_reserved_qsys_flab5 +incdir+E:/study/Labs/Verify/flab5/db/ip/flab5/submodules {E:/study/Labs/Verify/flab5/db/ip/flab5/submodules/altera_reset_controller.v}
vlog -vlog01compat -work altera_reserved_qsys_flab5 +incdir+E:/study/Labs/Verify/flab5/db/ip/flab5/submodules {E:/study/Labs/Verify/flab5/db/ip/flab5/submodules/altera_reset_synchronizer.v}
vlog -vlog01compat -work altera_reserved_qsys_flab5 +incdir+E:/study/Labs/Verify/flab5/db/ip/flab5/submodules {E:/study/Labs/Verify/flab5/db/ip/flab5/submodules/flab5_nios2_qsys_0.v}
vlog -vlog01compat -work altera_reserved_qsys_flab5 +incdir+E:/study/Labs/Verify/flab5/db/ip/flab5/submodules {E:/study/Labs/Verify/flab5/db/ip/flab5/submodules/flab5_nios2_qsys_0_test_bench.v}
vlog -vlog01compat -work altera_reserved_qsys_flab5 +incdir+E:/study/Labs/Verify/flab5/db/ip/flab5/submodules {E:/study/Labs/Verify/flab5/db/ip/flab5/submodules/flab5_onchip_memory2_0.v}
vlog -vlog01compat -work altera_reserved_qsys_flab5 +incdir+E:/study/Labs/Verify/flab5/db/ip/flab5/submodules {E:/study/Labs/Verify/flab5/db/ip/flab5/submodules/flab5_pio_0.v}
vlog -sv -work altera_reserved_qsys_flab5 +incdir+E:/study/Labs/Verify/flab5/db/ip/flab5/submodules {E:/study/Labs/Verify/flab5/db/ip/flab5/submodules/altera_merlin_arbitrator.sv}
vlog -sv -work altera_reserved_qsys_flab5 +incdir+E:/study/Labs/Verify/flab5/db/ip/flab5/submodules {E:/study/Labs/Verify/flab5/db/ip/flab5/submodules/altera_merlin_burst_uncompressor.sv}
vlog -sv -work altera_reserved_qsys_flab5 +incdir+E:/study/Labs/Verify/flab5/db/ip/flab5/submodules {E:/study/Labs/Verify/flab5/db/ip/flab5/submodules/altera_merlin_master_agent.sv}
vlog -sv -work altera_reserved_qsys_flab5 +incdir+E:/study/Labs/Verify/flab5/db/ip/flab5/submodules {E:/study/Labs/Verify/flab5/db/ip/flab5/submodules/altera_merlin_master_translator.sv}
vlog -sv -work altera_reserved_qsys_flab5 +incdir+E:/study/Labs/Verify/flab5/db/ip/flab5/submodules {E:/study/Labs/Verify/flab5/db/ip/flab5/submodules/altera_merlin_slave_agent.sv}
vlog -sv -work altera_reserved_qsys_flab5 +incdir+E:/study/Labs/Verify/flab5/db/ip/flab5/submodules {E:/study/Labs/Verify/flab5/db/ip/flab5/submodules/altera_merlin_slave_translator.sv}
vlog -sv -work altera_reserved_qsys_flab5 +incdir+E:/study/Labs/Verify/flab5/db/ip/flab5/submodules {E:/study/Labs/Verify/flab5/db/ip/flab5/submodules/flab5_addr_router.sv}
vlog -sv -work altera_reserved_qsys_flab5 +incdir+E:/study/Labs/Verify/flab5/db/ip/flab5/submodules {E:/study/Labs/Verify/flab5/db/ip/flab5/submodules/flab5_cmd_xbar_demux.sv}
vlog -sv -work altera_reserved_qsys_flab5 +incdir+E:/study/Labs/Verify/flab5/db/ip/flab5/submodules {E:/study/Labs/Verify/flab5/db/ip/flab5/submodules/flab5_cmd_xbar_mux.sv}
vlog -sv -work altera_reserved_qsys_flab5 +incdir+E:/study/Labs/Verify/flab5/db/ip/flab5/submodules {E:/study/Labs/Verify/flab5/db/ip/flab5/submodules/flab5_id_router.sv}
vlog -sv -work altera_reserved_qsys_flab5 +incdir+E:/study/Labs/Verify/flab5/db/ip/flab5/submodules {E:/study/Labs/Verify/flab5/db/ip/flab5/submodules/flab5_irq_mapper.sv}
vlog -sv -work altera_reserved_qsys_flab5 +incdir+E:/study/Labs/Verify/flab5/db/ip/flab5/submodules {E:/study/Labs/Verify/flab5/db/ip/flab5/submodules/flab5_rsp_xbar_demux.sv}

