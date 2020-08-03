library verilog;
use verilog.vl_types.all;
entity qlab5_sys is
    port(
        clk_0           : in     vl_logic;
        reset_n         : in     vl_logic;
        out_port_from_the_pio_0: out    vl_logic
    );
end qlab5_sys;
