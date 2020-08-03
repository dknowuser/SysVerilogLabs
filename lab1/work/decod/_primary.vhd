library verilog;
use verilog.vl_types.all;
entity decod is
    generic(
        delay           : integer := 3;
        n               : integer := 3;
        u               : integer := 8
    );
    port(
        x_in            : in     vl_logic_vector;
        y_out           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of delay : constant is 1;
    attribute mti_svvh_generic_type of n : constant is 1;
    attribute mti_svvh_generic_type of u : constant is 1;
end decod;
