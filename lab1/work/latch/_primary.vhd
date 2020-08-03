library verilog;
use verilog.vl_types.all;
entity latch is
    generic(
        n               : integer := 8
    );
    port(
        clock           : in     vl_logic;
        d               : in     vl_logic_vector;
        y               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end latch;
