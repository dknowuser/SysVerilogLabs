library verilog;
use verilog.vl_types.all;
entity sld_virtual_jtag_basic is
    generic(
        lpm_hint        : string  := "UNUSED";
        sld_sim_action  : string  := "UNUSED";
        sld_instance_index: integer := 0;
        sld_ir_width    : integer := 1;
        sld_sim_n_scan  : integer := 0;
        sld_mfg_id      : integer := 0;
        sld_version     : integer := 0;
        sld_type_id     : integer := 0;
        lpm_type        : string  := "sld_virtual_jtag_basic";
        sld_auto_instance_index: string  := "NO";
        sld_sim_total_length: integer := 0
    );
    port(
        jtag_state_sdr  : out    vl_logic;
        jtag_state_sirs : out    vl_logic;
        ir_out          : in     vl_logic_vector;
        jtag_state_sir  : out    vl_logic;
        jtag_state_cdr  : out    vl_logic;
        jtag_state_e2dr : out    vl_logic;
        tms             : out    vl_logic;
        jtag_state_sdrs : out    vl_logic;
        jtag_state_tlr  : out    vl_logic;
        ir_in           : out    vl_logic_vector;
        virtual_state_sdr: out    vl_logic;
        tdi             : out    vl_logic;
        jtag_state_uir  : out    vl_logic;
        jtag_state_cir  : out    vl_logic;
        virtual_state_cdr: out    vl_logic;
        virtual_state_uir: out    vl_logic;
        virtual_state_e2dr: out    vl_logic;
        jtag_state_e2ir : out    vl_logic;
        virtual_state_cir: out    vl_logic;
        jtag_state_pir  : out    vl_logic;
        jtag_state_udr  : out    vl_logic;
        virtual_state_udr: out    vl_logic;
        tdo             : in     vl_logic;
        jtag_state_e1dr : out    vl_logic;
        jtag_state_rti  : out    vl_logic;
        virtual_state_pdr: out    vl_logic;
        virtual_state_e1dr: out    vl_logic;
        jtag_state_e1ir : out    vl_logic;
        jtag_state_pdr  : out    vl_logic;
        tck             : out    vl_logic
    );
end sld_virtual_jtag_basic;
