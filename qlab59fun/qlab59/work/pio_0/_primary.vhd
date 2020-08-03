library verilog;
use verilog.vl_types.all;
entity pio_0 is
    port(
        address         : in     vl_logic_vector(2 downto 0);
        chipselect      : in     vl_logic;
        clk             : in     vl_logic;
        reset_n         : in     vl_logic;
        write_n         : in     vl_logic;
        writedata       : in     vl_logic;
        out_port        : out    vl_logic;
        readdata        : out    vl_logic
    );
end pio_0;
