library verilog;
use verilog.vl_types.all;
entity stimul is
    generic(
        delay           : integer := 6
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of delay : constant is 1;
end stimul;
