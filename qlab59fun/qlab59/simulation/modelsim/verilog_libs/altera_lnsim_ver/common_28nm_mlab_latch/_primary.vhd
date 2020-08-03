library verilog;
use verilog.vl_types.all;
entity common_28nm_mlab_latch is
    generic(
        width           : integer := 1;
        init_value      : integer := 0
    );
    port(
        d               : in     vl_logic_vector;
        ena             : in     vl_logic;
        q               : out    vl_logic_vector
    );
end common_28nm_mlab_latch;
