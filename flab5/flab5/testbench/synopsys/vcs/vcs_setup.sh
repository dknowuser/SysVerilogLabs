
# (C) 2001-2020 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 12.1sp1 243 win32 2020.03.08.21:25:44

# ----------------------------------------
# vcs - auto-generated simulation script

# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="flab5_tb"
SKIP_FILE_COPY=0
QSYS_SIMDIR="./../../"
SKIP_ELAB=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="+vcs+finish+100"
# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_ELAB=1 SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# copy RAM/ROM files to simulation directory
if [ $SKIP_FILE_COPY -eq 0 ]; then
  cp -f $QSYS_SIMDIR/flab5_tb/simulation/submodules/flab5_nios2_qsys_0_rf_ram_a.dat ./
  cp -f $QSYS_SIMDIR/flab5_tb/simulation/submodules/flab5_nios2_qsys_0_rf_ram_a.hex ./
  cp -f $QSYS_SIMDIR/flab5_tb/simulation/submodules/flab5_nios2_qsys_0_rf_ram_a.mif ./
  cp -f $QSYS_SIMDIR/flab5_tb/simulation/submodules/flab5_nios2_qsys_0_rf_ram_b.dat ./
  cp -f $QSYS_SIMDIR/flab5_tb/simulation/submodules/flab5_nios2_qsys_0_rf_ram_b.hex ./
  cp -f $QSYS_SIMDIR/flab5_tb/simulation/submodules/flab5_nios2_qsys_0_rf_ram_b.mif ./
  cp -f $QSYS_SIMDIR/flab5_tb/simulation/submodules/flab5_onchip_memory2_0.hex ./
fi

vcs -lca -timescale=1ps/1ps -sverilog +verilog2001ext+.v -ntb_opts dtm $USER_DEFINED_ELAB_OPTIONS \
  -v c:/altera/12.1sp1/quartus/eda/sim_lib/altera_primitives.v \
  -v c:/altera/12.1sp1/quartus/eda/sim_lib/220model.v \
  -v c:/altera/12.1sp1/quartus/eda/sim_lib/sgate.v \
  -v c:/altera/12.1sp1/quartus/eda/sim_lib/altera_mf.v \
  c:/altera/12.1sp1/quartus/eda/sim_lib/altera_lnsim.sv \
  -v c:/altera/12.1sp1/quartus/eda/sim_lib/cycloneii_atoms.v \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/flab5_irq_mapper.sv \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/flab5_rsp_xbar_demux.sv \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/altera_merlin_arbitrator.sv \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/flab5_cmd_xbar_mux.sv \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/flab5_cmd_xbar_demux.sv \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/altera_reset_controller.v \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/altera_reset_synchronizer.v \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/flab5_id_router.sv \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/flab5_addr_router.sv \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/altera_avalon_sc_fifo.v \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/altera_merlin_slave_agent.sv \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/altera_merlin_burst_uncompressor.sv \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/altera_merlin_master_agent.sv \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/altera_merlin_slave_translator.sv \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/altera_merlin_master_translator.sv \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/flab5_pio_0.v \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/flab5_nios2_qsys_0.v \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/flab5_nios2_qsys_0_test_bench.v \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/flab5_onchip_memory2_0.v \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/verbosity_pkg.sv \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/altera_conduit_bfm.sv \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/altera_avalon_reset_source.sv \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/altera_avalon_clock_source.sv \
  $QSYS_SIMDIR/flab5_tb/simulation/submodules/flab5.v \
  $QSYS_SIMDIR/flab5_tb/simulation/flab5_tb.v \
  -top $TOP_LEVEL_NAME
# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  ./simv $USER_DEFINED_SIM_OPTIONS
fi
