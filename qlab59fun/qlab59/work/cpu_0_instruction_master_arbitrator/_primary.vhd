library verilog;
use verilog.vl_types.all;
entity cpu_0_instruction_master_arbitrator is
    port(
        clk             : in     vl_logic;
        cpu_0_instruction_master_address: in     vl_logic_vector(13 downto 0);
        cpu_0_instruction_master_granted_onchip_memory2_0_s1: in     vl_logic;
        cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1: in     vl_logic;
        cpu_0_instruction_master_read: in     vl_logic;
        cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1: in     vl_logic;
        cpu_0_instruction_master_requests_onchip_memory2_0_s1: in     vl_logic;
        d1_onchip_memory2_0_s1_end_xfer: in     vl_logic;
        onchip_memory2_0_s1_readdata_from_sa: in     vl_logic_vector(31 downto 0);
        reset_n         : in     vl_logic;
        cpu_0_instruction_master_address_to_slave: out    vl_logic_vector(13 downto 0);
        cpu_0_instruction_master_readdata: out    vl_logic_vector(31 downto 0);
        cpu_0_instruction_master_waitrequest: out    vl_logic
    );
end cpu_0_instruction_master_arbitrator;
