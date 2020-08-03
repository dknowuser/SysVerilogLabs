library verilog;
use verilog.vl_types.all;
entity common_28nm_mlab_cell_core is
    generic(
        first_address   : integer := 0;
        last_address    : integer := 0;
        data_width      : integer := 20;
        address_width   : integer := 6;
        byte_enable_mask_width: integer := 1;
        mem_init0       : string  := "";
        MEM_INIT_STRING_LENGTH: integer := 160;
        num_cols        : integer := 1
    );
    port(
        datain_a_reg    : in     vl_logic_vector;
        addr_a_reg      : in     vl_logic_vector;
        byteena_a_reg   : in     vl_logic_vector;
        portbaddr       : in     vl_logic_vector;
        clk_a_in        : in     vl_logic;
        ena0            : in     vl_logic;
        dataout_b       : out    vl_logic_vector
    );
end common_28nm_mlab_cell_core;
