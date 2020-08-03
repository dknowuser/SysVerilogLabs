library verilog;
use verilog.vl_types.all;
entity complex is
    port(
        x_in            : in     vl_logic_vector(2 downto 0);
        z_0             : out    vl_logic;
        z_1             : out    vl_logic;
        z_2             : out    vl_logic
    );
end complex;
