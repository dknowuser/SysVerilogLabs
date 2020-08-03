library verilog;
use verilog.vl_types.all;
entity cpu_0_rf_module is
    generic(
        lpm_file        : string  := "UNUSED"
    );
    port(
        address_a       : in     vl_logic_vector(4 downto 0);
        address_b       : in     vl_logic_vector(4 downto 0);
        clock0          : in     vl_logic;
        clock1          : in     vl_logic;
        clocken0        : in     vl_logic;
        clocken1        : in     vl_logic;
        data_a          : in     vl_logic_vector(31 downto 0);
        data_b          : in     vl_logic_vector(31 downto 0);
        wren_a          : in     vl_logic;
        wren_b          : in     vl_logic;
        q_a             : out    vl_logic_vector(31 downto 0);
        q_b             : out    vl_logic_vector(31 downto 0)
    );
end cpu_0_rf_module;
