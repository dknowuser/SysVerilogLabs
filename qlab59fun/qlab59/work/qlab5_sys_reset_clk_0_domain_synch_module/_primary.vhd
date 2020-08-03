library verilog;
use verilog.vl_types.all;
entity qlab5_sys_reset_clk_0_domain_synch_module is
    port(
        clk             : in     vl_logic;
        data_in         : in     vl_logic;
        reset_n         : in     vl_logic;
        data_out        : out    vl_logic
    );
end qlab5_sys_reset_clk_0_domain_synch_module;
