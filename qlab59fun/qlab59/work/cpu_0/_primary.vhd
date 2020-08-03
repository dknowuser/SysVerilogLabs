library verilog;
use verilog.vl_types.all;
entity cpu_0 is
    port(
        clk             : in     vl_logic;
        d_irq           : in     vl_logic_vector(31 downto 0);
        d_readdata      : in     vl_logic_vector(31 downto 0);
        d_waitrequest   : in     vl_logic;
        i_readdata      : in     vl_logic_vector(31 downto 0);
        i_waitrequest   : in     vl_logic;
        reset_n         : in     vl_logic;
        d_address       : out    vl_logic_vector(14 downto 0);
        d_byteenable    : out    vl_logic_vector(3 downto 0);
        d_read          : out    vl_logic;
        d_write         : out    vl_logic;
        d_writedata     : out    vl_logic_vector(31 downto 0);
        i_address       : out    vl_logic_vector(13 downto 0);
        i_read          : out    vl_logic
    );
end cpu_0;
