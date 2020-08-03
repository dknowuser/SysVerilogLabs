library verilog;
use verilog.vl_types.all;
entity onchip_memory2_0 is
    port(
        address         : in     vl_logic_vector(10 downto 0);
        byteenable      : in     vl_logic_vector(3 downto 0);
        chipselect      : in     vl_logic;
        clk             : in     vl_logic;
        clken           : in     vl_logic;
        write           : in     vl_logic;
        writedata       : in     vl_logic_vector(31 downto 0);
        readdata        : out    vl_logic_vector(31 downto 0)
    );
end onchip_memory2_0;
