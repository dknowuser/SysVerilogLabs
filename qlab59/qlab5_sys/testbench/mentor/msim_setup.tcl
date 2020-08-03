
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

# ACDS 12.1sp1 243 win32 2020.03.08.17:33:47

# ----------------------------------------
# Auto-generated simulation script

# ----------------------------------------
# Initialize the variable
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
} 

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "qlab5_sys_tb"
} elseif { ![ string match "" $TOP_LEVEL_NAME ] } { 
  set TOP_LEVEL_NAME "$TOP_LEVEL_NAME"
} 

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
} elseif { ![ string match "" $QSYS_SIMDIR ] } { 
  set QSYS_SIMDIR "$QSYS_SIMDIR"
} 


# ----------------------------------------
# Copy ROM/RAM files to simulation directory
file copy -force $QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys_cpu_0_rf_ram_a.dat ./
file copy -force $QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys_cpu_0_rf_ram_a.hex ./
file copy -force $QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys_cpu_0_rf_ram_a.mif ./
file copy -force $QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys_cpu_0_rf_ram_b.dat ./
file copy -force $QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys_cpu_0_rf_ram_b.hex ./
file copy -force $QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys_cpu_0_rf_ram_b.mif ./
file copy -force $QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys_onchip_memory2_0.hex ./

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib          ./libraries/     
ensure_lib          ./libraries/work/
vmap       work     ./libraries/work/
vmap       work_lib ./libraries/work/
if { ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] } {
  ensure_lib                  ./libraries/altera_ver/      
  vmap       altera_ver       ./libraries/altera_ver/      
  ensure_lib                  ./libraries/lpm_ver/         
  vmap       lpm_ver          ./libraries/lpm_ver/         
  ensure_lib                  ./libraries/sgate_ver/       
  vmap       sgate_ver        ./libraries/sgate_ver/       
  ensure_lib                  ./libraries/altera_mf_ver/   
  vmap       altera_mf_ver    ./libraries/altera_mf_ver/   
  ensure_lib                  ./libraries/altera_lnsim_ver/
  vmap       altera_lnsim_ver ./libraries/altera_lnsim_ver/
  ensure_lib                  ./libraries/cycloneii_ver/   
  vmap       cycloneii_ver    ./libraries/cycloneii_ver/   
}
ensure_lib                                                                        ./libraries/irq_mapper/                                                            
vmap       irq_mapper                                                             ./libraries/irq_mapper/                                                            
ensure_lib                                                                        ./libraries/rsp_xbar_mux_001/                                                      
vmap       rsp_xbar_mux_001                                                       ./libraries/rsp_xbar_mux_001/                                                      
ensure_lib                                                                        ./libraries/cmd_xbar_mux/                                                          
vmap       cmd_xbar_mux                                                           ./libraries/cmd_xbar_mux/                                                          
ensure_lib                                                                        ./libraries/cmd_xbar_demux_001/                                                    
vmap       cmd_xbar_demux_001                                                     ./libraries/cmd_xbar_demux_001/                                                    
ensure_lib                                                                        ./libraries/cmd_xbar_demux/                                                        
vmap       cmd_xbar_demux                                                         ./libraries/cmd_xbar_demux/                                                        
ensure_lib                                                                        ./libraries/rst_controller/                                                        
vmap       rst_controller                                                         ./libraries/rst_controller/                                                        
ensure_lib                                                                        ./libraries/id_router_001/                                                         
vmap       id_router_001                                                          ./libraries/id_router_001/                                                         
ensure_lib                                                                        ./libraries/id_router/                                                             
vmap       id_router                                                              ./libraries/id_router/                                                             
ensure_lib                                                                        ./libraries/addr_router_001/                                                       
vmap       addr_router_001                                                        ./libraries/addr_router_001/                                                       
ensure_lib                                                                        ./libraries/addr_router/                                                           
vmap       addr_router                                                            ./libraries/addr_router/                                                           
ensure_lib                                                                        ./libraries/onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo/
vmap       onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo ./libraries/onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo/
ensure_lib                                                                        ./libraries/onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent/         
vmap       onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent          ./libraries/onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent/         
ensure_lib                                                                        ./libraries/cpu_0_instruction_master_translator_avalon_universal_master_0_agent/   
vmap       cpu_0_instruction_master_translator_avalon_universal_master_0_agent    ./libraries/cpu_0_instruction_master_translator_avalon_universal_master_0_agent/   
ensure_lib                                                                        ./libraries/onchip_memory2_0_s1_translator/                                        
vmap       onchip_memory2_0_s1_translator                                         ./libraries/onchip_memory2_0_s1_translator/                                        
ensure_lib                                                                        ./libraries/cpu_0_instruction_master_translator/                                   
vmap       cpu_0_instruction_master_translator                                    ./libraries/cpu_0_instruction_master_translator/                                   
ensure_lib                                                                        ./libraries/cpu_0/                                                                 
vmap       cpu_0                                                                  ./libraries/cpu_0/                                                                 
ensure_lib                                                                        ./libraries/pio_0/                                                                 
vmap       pio_0                                                                  ./libraries/pio_0/                                                                 
ensure_lib                                                                        ./libraries/onchip_memory2_0/                                                      
vmap       onchip_memory2_0                                                       ./libraries/onchip_memory2_0/                                                      
ensure_lib                                                                        ./libraries/qlab5_sys_inst_clk_0_clk_in_reset_bfm/                                 
vmap       qlab5_sys_inst_clk_0_clk_in_reset_bfm                                  ./libraries/qlab5_sys_inst_clk_0_clk_in_reset_bfm/                                 
ensure_lib                                                                        ./libraries/qlab5_sys_inst_clk_0_clk_in_bfm/                                       
vmap       qlab5_sys_inst_clk_0_clk_in_bfm                                        ./libraries/qlab5_sys_inst_clk_0_clk_in_bfm/                                       
ensure_lib                                                                        ./libraries/qlab5_sys_inst/                                                        
vmap       qlab5_sys_inst                                                         ./libraries/qlab5_sys_inst/                                                        

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  if { ![ string match "*ModelSim ALTERA*" [ vsim -version ] ] } {
    vlog     "c:/altera/12.1sp1/quartus/eda/sim_lib/altera_primitives.v" -work altera_ver      
    vlog     "c:/altera/12.1sp1/quartus/eda/sim_lib/220model.v"          -work lpm_ver         
    vlog     "c:/altera/12.1sp1/quartus/eda/sim_lib/sgate.v"             -work sgate_ver       
    vlog     "c:/altera/12.1sp1/quartus/eda/sim_lib/altera_mf.v"         -work altera_mf_ver   
    vlog -sv "c:/altera/12.1sp1/quartus/eda/sim_lib/altera_lnsim.sv"     -work altera_lnsim_ver
    vlog     "c:/altera/12.1sp1/quartus/eda/sim_lib/cycloneii_atoms.v"   -work cycloneii_ver   
  }
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  vlog -sv "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys_irq_mapper.sv"             -work irq_mapper                                                            
  vlog -sv "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/altera_merlin_arbitrator.sv"         -work rsp_xbar_mux_001                                                      
  vlog -sv "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys_rsp_xbar_mux_001.sv"       -work rsp_xbar_mux_001                                                      
  vlog -sv "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/altera_merlin_arbitrator.sv"         -work cmd_xbar_mux                                                          
  vlog -sv "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys_cmd_xbar_mux.sv"           -work cmd_xbar_mux                                                          
  vlog -sv "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys_cmd_xbar_demux_001.sv"     -work cmd_xbar_demux_001                                                    
  vlog -sv "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys_cmd_xbar_demux.sv"         -work cmd_xbar_demux                                                        
  vlog     "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/altera_reset_controller.v"           -work rst_controller                                                        
  vlog     "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/altera_reset_synchronizer.v"         -work rst_controller                                                        
  vlog -sv "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys_id_router_001.sv"          -work id_router_001                                                         
  vlog -sv "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys_id_router.sv"              -work id_router                                                             
  vlog -sv "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys_addr_router_001.sv"        -work addr_router_001                                                       
  vlog -sv "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys_addr_router.sv"            -work addr_router                                                           
  vlog     "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/altera_avalon_sc_fifo.v"             -work onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo
  vlog -sv "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/altera_merlin_slave_agent.sv"        -work onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent         
  vlog -sv "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/altera_merlin_burst_uncompressor.sv" -work onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent         
  vlog -sv "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/altera_merlin_master_agent.sv"       -work cpu_0_instruction_master_translator_avalon_universal_master_0_agent   
  vlog -sv "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/altera_merlin_slave_translator.sv"   -work onchip_memory2_0_s1_translator                                        
  vlog -sv "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/altera_merlin_master_translator.sv"  -work cpu_0_instruction_master_translator                                   
  vlog     "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys_cpu_0.v"                   -work cpu_0                                                                 
  vlog     "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys_cpu_0_test_bench.v"        -work cpu_0                                                                 
  vlog     "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys_pio_0.v"                   -work pio_0                                                                 
  vlog     "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys_onchip_memory2_0.v"        -work onchip_memory2_0                                                      
  vlog -sv "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/verbosity_pkg.sv"                    -work qlab5_sys_inst_clk_0_clk_in_reset_bfm                                 
  vlog -sv "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/altera_avalon_reset_source.sv"       -work qlab5_sys_inst_clk_0_clk_in_reset_bfm                                 
  vlog -sv "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/verbosity_pkg.sv"                    -work qlab5_sys_inst_clk_0_clk_in_bfm                                       
  vlog -sv "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/altera_avalon_clock_source.sv"       -work qlab5_sys_inst_clk_0_clk_in_bfm                                       
  vlog     "$QSYS_SIMDIR/qlab5_sys_tb/simulation/submodules/qlab5_sys.v"                         -work qlab5_sys_inst                                                        
  vlog     "$QSYS_SIMDIR/qlab5_sys_tb/simulation/qlab5_sys_tb.v"                                                                                                             
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  vsim -t ps -L work -L work_lib -L irq_mapper -L rsp_xbar_mux_001 -L cmd_xbar_mux -L cmd_xbar_demux_001 -L cmd_xbar_demux -L rst_controller -L id_router_001 -L id_router -L addr_router_001 -L addr_router -L onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo -L onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent -L cpu_0_instruction_master_translator_avalon_universal_master_0_agent -L onchip_memory2_0_s1_translator -L cpu_0_instruction_master_translator -L cpu_0 -L pio_0 -L onchip_memory2_0 -L qlab5_sys_inst_clk_0_clk_in_reset_bfm -L qlab5_sys_inst_clk_0_clk_in_bfm -L qlab5_sys_inst -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with novopt option
alias elab_debug {
  echo "\[exec\] elab_debug"
  vsim -novopt -t ps -L work -L work_lib -L irq_mapper -L rsp_xbar_mux_001 -L cmd_xbar_mux -L cmd_xbar_demux_001 -L cmd_xbar_demux -L rst_controller -L id_router_001 -L id_router -L addr_router_001 -L addr_router -L onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent_rsp_fifo -L onchip_memory2_0_s1_translator_avalon_universal_slave_0_agent -L cpu_0_instruction_master_translator_avalon_universal_master_0_agent -L onchip_memory2_0_s1_translator -L cpu_0_instruction_master_translator -L cpu_0 -L pio_0 -L onchip_memory2_0 -L qlab5_sys_inst_clk_0_clk_in_reset_bfm -L qlab5_sys_inst_clk_0_clk_in_bfm -L qlab5_sys_inst -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -novopt
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "dev_com                       -- Compile device library files"
  echo
  echo "com                           -- Compile the design files in correct order"
  echo
  echo "elab                          -- Elaborate top level design"
  echo
  echo "elab_debug                    -- Elaborate the top level design with novopt option"
  echo
  echo "ld                            -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                      -- Compile all the design files and elaborate the top level design with -novopt"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                -- Top level module name."
  echo
  echo "SYSTEM_INSTANCE_NAME          -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                   -- Qsys base simulation directory."
}
h
