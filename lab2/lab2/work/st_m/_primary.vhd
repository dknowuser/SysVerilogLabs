library verilog;
use verilog.vl_types.all;
entity st_m is
    generic(
        state_len       : integer := 2;
        inp_len         : integer := 2;
        out_len         : integer := 2;
        s0              : vl_logic_vector;
        s1              : vl_logic_vector;
        s2              : vl_logic_vector;
        y0              : vl_logic_vector;
        y1              : vl_logic_vector;
        y2              : vl_logic_vector
    );
    port(
        in_data         : in     vl_logic_vector;
        out_data        : out    vl_logic_vector;
        reset           : in     vl_logic;
        clock           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of state_len : constant is 1;
    attribute mti_svvh_generic_type of inp_len : constant is 1;
    attribute mti_svvh_generic_type of out_len : constant is 1;
    attribute mti_svvh_generic_type of s0 : constant is 4;
    attribute mti_svvh_generic_type of s1 : constant is 4;
    attribute mti_svvh_generic_type of s2 : constant is 4;
    attribute mti_svvh_generic_type of y0 : constant is 4;
    attribute mti_svvh_generic_type of y1 : constant is 4;
    attribute mti_svvh_generic_type of y2 : constant is 4;
end st_m;
