library verilog;
use verilog.vl_types.all;
entity test is
    generic(
        delay           : integer := 6;
        truth_table1    : vl_logic_vector(0 to 7) := (Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi1, Hi1);
        truth_table2    : vl_logic_vector(0 to 7) := (Hi1, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi1);
        truth_table3    : vl_logic_vector(0 to 7) := (Hi1, Hi0, Hi1, Hi0, Hi1, Hi0, Hi1, Hi1)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of delay : constant is 1;
    attribute mti_svvh_generic_type of truth_table1 : constant is 1;
    attribute mti_svvh_generic_type of truth_table2 : constant is 1;
    attribute mti_svvh_generic_type of truth_table3 : constant is 1;
end test;
