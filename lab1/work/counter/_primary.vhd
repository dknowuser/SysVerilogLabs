library verilog;
use verilog.vl_types.all;
entity counter is
    generic(
        num_bits        : integer := 8;
        max             : vl_notype;
        dir             : string  := "up"
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        s               : in     vl_logic;
        carry_in        : in     vl_logic;
        carry_out       : out    vl_logic;
        dat_in          : in     vl_logic;
        result          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of num_bits : constant is 1;
    attribute mti_svvh_generic_type of max : constant is 3;
    attribute mti_svvh_generic_type of dir : constant is 1;
end counter;
