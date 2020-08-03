library verilog;
use verilog.vl_types.all;
entity pio_0_s1_arbitrator is
    port(
        clk             : in     vl_logic;
        cpu_0_data_master_address_to_slave: in     vl_logic_vector(14 downto 0);
        cpu_0_data_master_read: in     vl_logic;
        cpu_0_data_master_waitrequest: in     vl_logic;
        cpu_0_data_master_write: in     vl_logic;
        cpu_0_data_master_writedata: in     vl_logic_vector(31 downto 0);
        pio_0_s1_readdata: in     vl_logic;
        reset_n         : in     vl_logic;
        cpu_0_data_master_granted_pio_0_s1: out    vl_logic;
        cpu_0_data_master_qualified_request_pio_0_s1: out    vl_logic;
        cpu_0_data_master_read_data_valid_pio_0_s1: out    vl_logic;
        cpu_0_data_master_requests_pio_0_s1: out    vl_logic;
        d1_pio_0_s1_end_xfer: out    vl_logic;
        pio_0_s1_address: out    vl_logic_vector(2 downto 0);
        pio_0_s1_chipselect: out    vl_logic;
        pio_0_s1_readdata_from_sa: out    vl_logic;
        pio_0_s1_reset_n: out    vl_logic;
        pio_0_s1_write_n: out    vl_logic;
        pio_0_s1_writedata: out    vl_logic
    );
end pio_0_s1_arbitrator;
