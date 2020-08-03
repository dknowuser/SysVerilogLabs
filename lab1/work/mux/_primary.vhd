library verilog;
use verilog.vl_types.all;
entity mux is
    generic(
        delay           : integer := 3;
        n               : integer := 4;
        u               : integer := 8
    );
    port(
        d_in            : in     vl_logic_vector;
        addr            : in     vl_logic_vector;
        y               : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of delay : constant is 1;
    attribute mti_svvh_generic_type of n : constant is 1;
    attribute mti_svvh_generic_type of u : constant is 1;
end mux;
