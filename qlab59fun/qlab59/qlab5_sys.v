//megafunction wizard: %Altera SOPC Builder%
//GENERATION: STANDARD
//VERSION: WM1.0


//Legal Notice: (C)2020 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_data_master_arbitrator (
                                      // inputs:
                                       clk,
                                       cpu_0_data_master_address,
                                       cpu_0_data_master_granted_onchip_memory2_0_s1,
                                       cpu_0_data_master_granted_pio_0_s1,
                                       cpu_0_data_master_qualified_request_onchip_memory2_0_s1,
                                       cpu_0_data_master_qualified_request_pio_0_s1,
                                       cpu_0_data_master_read,
                                       cpu_0_data_master_read_data_valid_onchip_memory2_0_s1,
                                       cpu_0_data_master_read_data_valid_pio_0_s1,
                                       cpu_0_data_master_requests_onchip_memory2_0_s1,
                                       cpu_0_data_master_requests_pio_0_s1,
                                       cpu_0_data_master_write,
                                       d1_onchip_memory2_0_s1_end_xfer,
                                       d1_pio_0_s1_end_xfer,
                                       onchip_memory2_0_s1_readdata_from_sa,
                                       pio_0_s1_readdata_from_sa,
                                       registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1,
                                       reset_n,

                                      // outputs:
                                       cpu_0_data_master_address_to_slave,
                                       cpu_0_data_master_readdata,
                                       cpu_0_data_master_reset_n,
                                       cpu_0_data_master_waitrequest
                                    )
;

  output  [ 14: 0] cpu_0_data_master_address_to_slave;
  output  [ 31: 0] cpu_0_data_master_readdata;
  output           cpu_0_data_master_reset_n;
  output           cpu_0_data_master_waitrequest;
  input            clk;
  input   [ 14: 0] cpu_0_data_master_address;
  input            cpu_0_data_master_granted_onchip_memory2_0_s1;
  input            cpu_0_data_master_granted_pio_0_s1;
  input            cpu_0_data_master_qualified_request_onchip_memory2_0_s1;
  input            cpu_0_data_master_qualified_request_pio_0_s1;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_read_data_valid_onchip_memory2_0_s1;
  input            cpu_0_data_master_read_data_valid_pio_0_s1;
  input            cpu_0_data_master_requests_onchip_memory2_0_s1;
  input            cpu_0_data_master_requests_pio_0_s1;
  input            cpu_0_data_master_write;
  input            d1_onchip_memory2_0_s1_end_xfer;
  input            d1_pio_0_s1_end_xfer;
  input   [ 31: 0] onchip_memory2_0_s1_readdata_from_sa;
  input            pio_0_s1_readdata_from_sa;
  input            registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1;
  input            reset_n;

  wire    [ 14: 0] cpu_0_data_master_address_to_slave;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_reset_n;
  wire             cpu_0_data_master_run;
  reg              cpu_0_data_master_waitrequest;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_0_data_master_qualified_request_onchip_memory2_0_s1 | registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 | ~cpu_0_data_master_requests_onchip_memory2_0_s1) & (cpu_0_data_master_granted_onchip_memory2_0_s1 | ~cpu_0_data_master_qualified_request_onchip_memory2_0_s1) & ((~cpu_0_data_master_qualified_request_onchip_memory2_0_s1 | ~cpu_0_data_master_read | (registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_onchip_memory2_0_s1 | ~(cpu_0_data_master_read | cpu_0_data_master_write) | (1 & (cpu_0_data_master_read | cpu_0_data_master_write)))) & 1 & (cpu_0_data_master_qualified_request_pio_0_s1 | ~cpu_0_data_master_requests_pio_0_s1) & ((~cpu_0_data_master_qualified_request_pio_0_s1 | ~cpu_0_data_master_read | (1 & 1 & cpu_0_data_master_read))) & ((~cpu_0_data_master_qualified_request_pio_0_s1 | ~cpu_0_data_master_write | (1 & cpu_0_data_master_write)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_data_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_data_master_address_to_slave = cpu_0_data_master_address[14 : 0];

  //cpu_0/data_master readdata mux, which is an e_mux
  assign cpu_0_data_master_readdata = ({32 {~cpu_0_data_master_requests_onchip_memory2_0_s1}} | onchip_memory2_0_s1_readdata_from_sa) &
    ({32 {~cpu_0_data_master_requests_pio_0_s1}} | pio_0_s1_readdata_from_sa);

  //actual waitrequest port, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_waitrequest <= ~0;
      else 
        cpu_0_data_master_waitrequest <= ~((~(cpu_0_data_master_read | cpu_0_data_master_write))? 0: (cpu_0_data_master_run & cpu_0_data_master_waitrequest));
    end


  //cpu_0_data_master_reset_n assignment, which is an e_assign
  assign cpu_0_data_master_reset_n = reset_n;


endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module cpu_0_instruction_master_arbitrator (
                                             // inputs:
                                              clk,
                                              cpu_0_instruction_master_address,
                                              cpu_0_instruction_master_granted_onchip_memory2_0_s1,
                                              cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1,
                                              cpu_0_instruction_master_read,
                                              cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1,
                                              cpu_0_instruction_master_requests_onchip_memory2_0_s1,
                                              d1_onchip_memory2_0_s1_end_xfer,
                                              onchip_memory2_0_s1_readdata_from_sa,
                                              reset_n,

                                             // outputs:
                                              cpu_0_instruction_master_address_to_slave,
                                              cpu_0_instruction_master_readdata,
                                              cpu_0_instruction_master_waitrequest
                                           )
;

  output  [ 13: 0] cpu_0_instruction_master_address_to_slave;
  output  [ 31: 0] cpu_0_instruction_master_readdata;
  output           cpu_0_instruction_master_waitrequest;
  input            clk;
  input   [ 13: 0] cpu_0_instruction_master_address;
  input            cpu_0_instruction_master_granted_onchip_memory2_0_s1;
  input            cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1;
  input            cpu_0_instruction_master_read;
  input            cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1;
  input            cpu_0_instruction_master_requests_onchip_memory2_0_s1;
  input            d1_onchip_memory2_0_s1_end_xfer;
  input   [ 31: 0] onchip_memory2_0_s1_readdata_from_sa;
  input            reset_n;

  reg              active_and_waiting_last_time;
  reg     [ 13: 0] cpu_0_instruction_master_address_last_time;
  wire    [ 13: 0] cpu_0_instruction_master_address_to_slave;
  reg              cpu_0_instruction_master_read_last_time;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_run;
  wire             cpu_0_instruction_master_waitrequest;
  wire             r_0;
  //r_0 master_run cascaded wait assignment, which is an e_assign
  assign r_0 = 1 & (cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 | cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1 | ~cpu_0_instruction_master_requests_onchip_memory2_0_s1) & (cpu_0_instruction_master_granted_onchip_memory2_0_s1 | ~cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1) & ((~cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 | ~cpu_0_instruction_master_read | (cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1 & cpu_0_instruction_master_read)));

  //cascaded wait assignment, which is an e_assign
  assign cpu_0_instruction_master_run = r_0;

  //optimize select-logic by passing only those address bits which matter.
  assign cpu_0_instruction_master_address_to_slave = {1'b1,
    cpu_0_instruction_master_address[12 : 0]};

  //cpu_0/instruction_master readdata mux, which is an e_mux
  assign cpu_0_instruction_master_readdata = onchip_memory2_0_s1_readdata_from_sa;

  //actual waitrequest port, which is an e_assign
  assign cpu_0_instruction_master_waitrequest = ~cpu_0_instruction_master_run;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //cpu_0_instruction_master_address check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_address_last_time <= 0;
      else 
        cpu_0_instruction_master_address_last_time <= cpu_0_instruction_master_address;
    end


  //cpu_0/instruction_master waited last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          active_and_waiting_last_time <= 0;
      else 
        active_and_waiting_last_time <= cpu_0_instruction_master_waitrequest & (cpu_0_instruction_master_read);
    end


  //cpu_0_instruction_master_address matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_address != cpu_0_instruction_master_address_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_address did not heed wait!!!", $time);
          $stop;
        end
    end


  //cpu_0_instruction_master_read check against wait, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_last_time <= 0;
      else 
        cpu_0_instruction_master_read_last_time <= cpu_0_instruction_master_read;
    end


  //cpu_0_instruction_master_read matches last port_name, which is an e_process
  always @(posedge clk)
    begin
      if (active_and_waiting_last_time & (cpu_0_instruction_master_read != cpu_0_instruction_master_read_last_time))
        begin
          $write("%0d ns: cpu_0_instruction_master_read did not heed wait!!!", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module onchip_memory2_0_s1_arbitrator (
                                        // inputs:
                                         clk,
                                         cpu_0_data_master_address_to_slave,
                                         cpu_0_data_master_byteenable,
                                         cpu_0_data_master_read,
                                         cpu_0_data_master_waitrequest,
                                         cpu_0_data_master_write,
                                         cpu_0_data_master_writedata,
                                         cpu_0_instruction_master_address_to_slave,
                                         cpu_0_instruction_master_read,
                                         onchip_memory2_0_s1_readdata,
                                         reset_n,

                                        // outputs:
                                         cpu_0_data_master_granted_onchip_memory2_0_s1,
                                         cpu_0_data_master_qualified_request_onchip_memory2_0_s1,
                                         cpu_0_data_master_read_data_valid_onchip_memory2_0_s1,
                                         cpu_0_data_master_requests_onchip_memory2_0_s1,
                                         cpu_0_instruction_master_granted_onchip_memory2_0_s1,
                                         cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1,
                                         cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1,
                                         cpu_0_instruction_master_requests_onchip_memory2_0_s1,
                                         d1_onchip_memory2_0_s1_end_xfer,
                                         onchip_memory2_0_s1_address,
                                         onchip_memory2_0_s1_byteenable,
                                         onchip_memory2_0_s1_chipselect,
                                         onchip_memory2_0_s1_clken,
                                         onchip_memory2_0_s1_readdata_from_sa,
                                         onchip_memory2_0_s1_write,
                                         onchip_memory2_0_s1_writedata,
                                         registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1
                                      )
;

  output           cpu_0_data_master_granted_onchip_memory2_0_s1;
  output           cpu_0_data_master_qualified_request_onchip_memory2_0_s1;
  output           cpu_0_data_master_read_data_valid_onchip_memory2_0_s1;
  output           cpu_0_data_master_requests_onchip_memory2_0_s1;
  output           cpu_0_instruction_master_granted_onchip_memory2_0_s1;
  output           cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1;
  output           cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1;
  output           cpu_0_instruction_master_requests_onchip_memory2_0_s1;
  output           d1_onchip_memory2_0_s1_end_xfer;
  output  [ 10: 0] onchip_memory2_0_s1_address;
  output  [  3: 0] onchip_memory2_0_s1_byteenable;
  output           onchip_memory2_0_s1_chipselect;
  output           onchip_memory2_0_s1_clken;
  output  [ 31: 0] onchip_memory2_0_s1_readdata_from_sa;
  output           onchip_memory2_0_s1_write;
  output  [ 31: 0] onchip_memory2_0_s1_writedata;
  output           registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1;
  input            clk;
  input   [ 14: 0] cpu_0_data_master_address_to_slave;
  input   [  3: 0] cpu_0_data_master_byteenable;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input   [ 13: 0] cpu_0_instruction_master_address_to_slave;
  input            cpu_0_instruction_master_read;
  input   [ 31: 0] onchip_memory2_0_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_onchip_memory2_0_s1;
  wire             cpu_0_data_master_qualified_request_onchip_memory2_0_s1;
  wire             cpu_0_data_master_read_data_valid_onchip_memory2_0_s1;
  reg              cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register;
  wire             cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register_in;
  wire             cpu_0_data_master_requests_onchip_memory2_0_s1;
  wire             cpu_0_data_master_saved_grant_onchip_memory2_0_s1;
  wire             cpu_0_instruction_master_arbiterlock;
  wire             cpu_0_instruction_master_arbiterlock2;
  wire             cpu_0_instruction_master_continuerequest;
  wire             cpu_0_instruction_master_granted_onchip_memory2_0_s1;
  wire             cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1;
  wire             cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1;
  reg              cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register;
  wire             cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register_in;
  wire             cpu_0_instruction_master_requests_onchip_memory2_0_s1;
  wire             cpu_0_instruction_master_saved_grant_onchip_memory2_0_s1;
  reg              d1_onchip_memory2_0_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_onchip_memory2_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  reg              last_cycle_cpu_0_data_master_granted_slave_onchip_memory2_0_s1;
  reg              last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory2_0_s1;
  wire    [ 10: 0] onchip_memory2_0_s1_address;
  wire             onchip_memory2_0_s1_allgrants;
  wire             onchip_memory2_0_s1_allow_new_arb_cycle;
  wire             onchip_memory2_0_s1_any_bursting_master_saved_grant;
  wire             onchip_memory2_0_s1_any_continuerequest;
  reg     [  1: 0] onchip_memory2_0_s1_arb_addend;
  wire             onchip_memory2_0_s1_arb_counter_enable;
  reg              onchip_memory2_0_s1_arb_share_counter;
  wire             onchip_memory2_0_s1_arb_share_counter_next_value;
  wire             onchip_memory2_0_s1_arb_share_set_values;
  wire    [  1: 0] onchip_memory2_0_s1_arb_winner;
  wire             onchip_memory2_0_s1_arbitration_holdoff_internal;
  wire             onchip_memory2_0_s1_beginbursttransfer_internal;
  wire             onchip_memory2_0_s1_begins_xfer;
  wire    [  3: 0] onchip_memory2_0_s1_byteenable;
  wire             onchip_memory2_0_s1_chipselect;
  wire    [  3: 0] onchip_memory2_0_s1_chosen_master_double_vector;
  wire    [  1: 0] onchip_memory2_0_s1_chosen_master_rot_left;
  wire             onchip_memory2_0_s1_clken;
  wire             onchip_memory2_0_s1_end_xfer;
  wire             onchip_memory2_0_s1_firsttransfer;
  wire    [  1: 0] onchip_memory2_0_s1_grant_vector;
  wire             onchip_memory2_0_s1_in_a_read_cycle;
  wire             onchip_memory2_0_s1_in_a_write_cycle;
  wire    [  1: 0] onchip_memory2_0_s1_master_qreq_vector;
  wire             onchip_memory2_0_s1_non_bursting_master_requests;
  wire    [ 31: 0] onchip_memory2_0_s1_readdata_from_sa;
  reg              onchip_memory2_0_s1_reg_firsttransfer;
  reg     [  1: 0] onchip_memory2_0_s1_saved_chosen_master_vector;
  reg              onchip_memory2_0_s1_slavearbiterlockenable;
  wire             onchip_memory2_0_s1_slavearbiterlockenable2;
  wire             onchip_memory2_0_s1_unreg_firsttransfer;
  wire             onchip_memory2_0_s1_waits_for_read;
  wire             onchip_memory2_0_s1_waits_for_write;
  wire             onchip_memory2_0_s1_write;
  wire    [ 31: 0] onchip_memory2_0_s1_writedata;
  wire             p1_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register;
  wire             p1_cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register;
  wire             registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1;
  wire    [ 14: 0] shifted_address_to_onchip_memory2_0_s1_from_cpu_0_data_master;
  wire    [ 13: 0] shifted_address_to_onchip_memory2_0_s1_from_cpu_0_instruction_master;
  wire             wait_for_onchip_memory2_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~onchip_memory2_0_s1_end_xfer;
    end


  assign onchip_memory2_0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_onchip_memory2_0_s1 | cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1));
  //assign onchip_memory2_0_s1_readdata_from_sa = onchip_memory2_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign onchip_memory2_0_s1_readdata_from_sa = onchip_memory2_0_s1_readdata;

  assign cpu_0_data_master_requests_onchip_memory2_0_s1 = ({cpu_0_data_master_address_to_slave[14 : 13] , 13'b0} == 15'h2000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //registered rdv signal_name registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 assignment, which is an e_assign
  assign registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 = cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register_in;

  //onchip_memory2_0_s1_arb_share_counter set values, which is an e_mux
  assign onchip_memory2_0_s1_arb_share_set_values = 1;

  //onchip_memory2_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign onchip_memory2_0_s1_non_bursting_master_requests = cpu_0_data_master_requests_onchip_memory2_0_s1 |
    cpu_0_instruction_master_requests_onchip_memory2_0_s1 |
    cpu_0_data_master_requests_onchip_memory2_0_s1 |
    cpu_0_instruction_master_requests_onchip_memory2_0_s1;

  //onchip_memory2_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign onchip_memory2_0_s1_any_bursting_master_saved_grant = 0;

  //onchip_memory2_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign onchip_memory2_0_s1_arb_share_counter_next_value = onchip_memory2_0_s1_firsttransfer ? (onchip_memory2_0_s1_arb_share_set_values - 1) : |onchip_memory2_0_s1_arb_share_counter ? (onchip_memory2_0_s1_arb_share_counter - 1) : 0;

  //onchip_memory2_0_s1_allgrants all slave grants, which is an e_mux
  assign onchip_memory2_0_s1_allgrants = (|onchip_memory2_0_s1_grant_vector) |
    (|onchip_memory2_0_s1_grant_vector) |
    (|onchip_memory2_0_s1_grant_vector) |
    (|onchip_memory2_0_s1_grant_vector);

  //onchip_memory2_0_s1_end_xfer assignment, which is an e_assign
  assign onchip_memory2_0_s1_end_xfer = ~(onchip_memory2_0_s1_waits_for_read | onchip_memory2_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_onchip_memory2_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_onchip_memory2_0_s1 = onchip_memory2_0_s1_end_xfer & (~onchip_memory2_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //onchip_memory2_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign onchip_memory2_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_onchip_memory2_0_s1 & onchip_memory2_0_s1_allgrants) | (end_xfer_arb_share_counter_term_onchip_memory2_0_s1 & ~onchip_memory2_0_s1_non_bursting_master_requests);

  //onchip_memory2_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory2_0_s1_arb_share_counter <= 0;
      else if (onchip_memory2_0_s1_arb_counter_enable)
          onchip_memory2_0_s1_arb_share_counter <= onchip_memory2_0_s1_arb_share_counter_next_value;
    end


  //onchip_memory2_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory2_0_s1_slavearbiterlockenable <= 0;
      else if ((|onchip_memory2_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_onchip_memory2_0_s1) | (end_xfer_arb_share_counter_term_onchip_memory2_0_s1 & ~onchip_memory2_0_s1_non_bursting_master_requests))
          onchip_memory2_0_s1_slavearbiterlockenable <= |onchip_memory2_0_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master onchip_memory2_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = onchip_memory2_0_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //onchip_memory2_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign onchip_memory2_0_s1_slavearbiterlockenable2 = |onchip_memory2_0_s1_arb_share_counter_next_value;

  //cpu_0/data_master onchip_memory2_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = onchip_memory2_0_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //cpu_0/instruction_master onchip_memory2_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock = onchip_memory2_0_s1_slavearbiterlockenable & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master onchip_memory2_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_instruction_master_arbiterlock2 = onchip_memory2_0_s1_slavearbiterlockenable2 & cpu_0_instruction_master_continuerequest;

  //cpu_0/instruction_master granted onchip_memory2_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory2_0_s1 <= 0;
      else 
        last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory2_0_s1 <= cpu_0_instruction_master_saved_grant_onchip_memory2_0_s1 ? 1 : (onchip_memory2_0_s1_arbitration_holdoff_internal | ~cpu_0_instruction_master_requests_onchip_memory2_0_s1) ? 0 : last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory2_0_s1;
    end


  //cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  assign cpu_0_instruction_master_continuerequest = last_cycle_cpu_0_instruction_master_granted_slave_onchip_memory2_0_s1 & cpu_0_instruction_master_requests_onchip_memory2_0_s1;

  //onchip_memory2_0_s1_any_continuerequest at least one master continues requesting, which is an e_mux
  assign onchip_memory2_0_s1_any_continuerequest = cpu_0_instruction_master_continuerequest |
    cpu_0_data_master_continuerequest;

  assign cpu_0_data_master_qualified_request_onchip_memory2_0_s1 = cpu_0_data_master_requests_onchip_memory2_0_s1 & ~((cpu_0_data_master_read & ((|cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register))) | ((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write) | cpu_0_instruction_master_arbiterlock);
  //cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register_in = cpu_0_data_master_granted_onchip_memory2_0_s1 & cpu_0_data_master_read & ~onchip_memory2_0_s1_waits_for_read & ~(|cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register);

  //shift register p1 cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register = {cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register, cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register_in};

  //cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register <= 0;
      else 
        cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register <= p1_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register;
    end


  //local readdatavalid cpu_0_data_master_read_data_valid_onchip_memory2_0_s1, which is an e_mux
  assign cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 = cpu_0_data_master_read_data_valid_onchip_memory2_0_s1_shift_register;

  //onchip_memory2_0_s1_writedata mux, which is an e_mux
  assign onchip_memory2_0_s1_writedata = cpu_0_data_master_writedata;

  //mux onchip_memory2_0_s1_clken, which is an e_mux
  assign onchip_memory2_0_s1_clken = 1'b1;

  assign cpu_0_instruction_master_requests_onchip_memory2_0_s1 = (({cpu_0_instruction_master_address_to_slave[13] , 13'b0} == 14'h2000) & (cpu_0_instruction_master_read)) & cpu_0_instruction_master_read;
  //cpu_0/data_master granted onchip_memory2_0/s1 last time, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          last_cycle_cpu_0_data_master_granted_slave_onchip_memory2_0_s1 <= 0;
      else 
        last_cycle_cpu_0_data_master_granted_slave_onchip_memory2_0_s1 <= cpu_0_data_master_saved_grant_onchip_memory2_0_s1 ? 1 : (onchip_memory2_0_s1_arbitration_holdoff_internal | ~cpu_0_data_master_requests_onchip_memory2_0_s1) ? 0 : last_cycle_cpu_0_data_master_granted_slave_onchip_memory2_0_s1;
    end


  //cpu_0_data_master_continuerequest continued request, which is an e_mux
  assign cpu_0_data_master_continuerequest = last_cycle_cpu_0_data_master_granted_slave_onchip_memory2_0_s1 & cpu_0_data_master_requests_onchip_memory2_0_s1;

  assign cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 = cpu_0_instruction_master_requests_onchip_memory2_0_s1 & ~((cpu_0_instruction_master_read & ((|cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register))) | cpu_0_data_master_arbiterlock);
  //cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register_in mux for readlatency shift register, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register_in = cpu_0_instruction_master_granted_onchip_memory2_0_s1 & cpu_0_instruction_master_read & ~onchip_memory2_0_s1_waits_for_read & ~(|cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register);

  //shift register p1 cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register in if flush, otherwise shift left, which is an e_mux
  assign p1_cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register = {cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register, cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register_in};

  //cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register <= 0;
      else 
        cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register <= p1_cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register;
    end


  //local readdatavalid cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1, which is an e_mux
  assign cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1 = cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1_shift_register;

  //allow new arb cycle for onchip_memory2_0/s1, which is an e_assign
  assign onchip_memory2_0_s1_allow_new_arb_cycle = ~cpu_0_data_master_arbiterlock & ~cpu_0_instruction_master_arbiterlock;

  //cpu_0/instruction_master assignment into master qualified-requests vector for onchip_memory2_0/s1, which is an e_assign
  assign onchip_memory2_0_s1_master_qreq_vector[0] = cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1;

  //cpu_0/instruction_master grant onchip_memory2_0/s1, which is an e_assign
  assign cpu_0_instruction_master_granted_onchip_memory2_0_s1 = onchip_memory2_0_s1_grant_vector[0];

  //cpu_0/instruction_master saved-grant onchip_memory2_0/s1, which is an e_assign
  assign cpu_0_instruction_master_saved_grant_onchip_memory2_0_s1 = onchip_memory2_0_s1_arb_winner[0] && cpu_0_instruction_master_requests_onchip_memory2_0_s1;

  //cpu_0/data_master assignment into master qualified-requests vector for onchip_memory2_0/s1, which is an e_assign
  assign onchip_memory2_0_s1_master_qreq_vector[1] = cpu_0_data_master_qualified_request_onchip_memory2_0_s1;

  //cpu_0/data_master grant onchip_memory2_0/s1, which is an e_assign
  assign cpu_0_data_master_granted_onchip_memory2_0_s1 = onchip_memory2_0_s1_grant_vector[1];

  //cpu_0/data_master saved-grant onchip_memory2_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_onchip_memory2_0_s1 = onchip_memory2_0_s1_arb_winner[1] && cpu_0_data_master_requests_onchip_memory2_0_s1;

  //onchip_memory2_0/s1 chosen-master double-vector, which is an e_assign
  assign onchip_memory2_0_s1_chosen_master_double_vector = {onchip_memory2_0_s1_master_qreq_vector, onchip_memory2_0_s1_master_qreq_vector} & ({~onchip_memory2_0_s1_master_qreq_vector, ~onchip_memory2_0_s1_master_qreq_vector} + onchip_memory2_0_s1_arb_addend);

  //stable onehot encoding of arb winner
  assign onchip_memory2_0_s1_arb_winner = (onchip_memory2_0_s1_allow_new_arb_cycle & | onchip_memory2_0_s1_grant_vector) ? onchip_memory2_0_s1_grant_vector : onchip_memory2_0_s1_saved_chosen_master_vector;

  //saved onchip_memory2_0_s1_grant_vector, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory2_0_s1_saved_chosen_master_vector <= 0;
      else if (onchip_memory2_0_s1_allow_new_arb_cycle)
          onchip_memory2_0_s1_saved_chosen_master_vector <= |onchip_memory2_0_s1_grant_vector ? onchip_memory2_0_s1_grant_vector : onchip_memory2_0_s1_saved_chosen_master_vector;
    end


  //onehot encoding of chosen master
  assign onchip_memory2_0_s1_grant_vector = {(onchip_memory2_0_s1_chosen_master_double_vector[1] | onchip_memory2_0_s1_chosen_master_double_vector[3]),
    (onchip_memory2_0_s1_chosen_master_double_vector[0] | onchip_memory2_0_s1_chosen_master_double_vector[2])};

  //onchip_memory2_0/s1 chosen master rotated left, which is an e_assign
  assign onchip_memory2_0_s1_chosen_master_rot_left = (onchip_memory2_0_s1_arb_winner << 1) ? (onchip_memory2_0_s1_arb_winner << 1) : 1;

  //onchip_memory2_0/s1's addend for next-master-grant
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory2_0_s1_arb_addend <= 1;
      else if (|onchip_memory2_0_s1_grant_vector)
          onchip_memory2_0_s1_arb_addend <= onchip_memory2_0_s1_end_xfer? onchip_memory2_0_s1_chosen_master_rot_left : onchip_memory2_0_s1_grant_vector;
    end


  assign onchip_memory2_0_s1_chipselect = cpu_0_data_master_granted_onchip_memory2_0_s1 | cpu_0_instruction_master_granted_onchip_memory2_0_s1;
  //onchip_memory2_0_s1_firsttransfer first transaction, which is an e_assign
  assign onchip_memory2_0_s1_firsttransfer = onchip_memory2_0_s1_begins_xfer ? onchip_memory2_0_s1_unreg_firsttransfer : onchip_memory2_0_s1_reg_firsttransfer;

  //onchip_memory2_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign onchip_memory2_0_s1_unreg_firsttransfer = ~(onchip_memory2_0_s1_slavearbiterlockenable & onchip_memory2_0_s1_any_continuerequest);

  //onchip_memory2_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          onchip_memory2_0_s1_reg_firsttransfer <= 1'b1;
      else if (onchip_memory2_0_s1_begins_xfer)
          onchip_memory2_0_s1_reg_firsttransfer <= onchip_memory2_0_s1_unreg_firsttransfer;
    end


  //onchip_memory2_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign onchip_memory2_0_s1_beginbursttransfer_internal = onchip_memory2_0_s1_begins_xfer;

  //onchip_memory2_0_s1_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  assign onchip_memory2_0_s1_arbitration_holdoff_internal = onchip_memory2_0_s1_begins_xfer & onchip_memory2_0_s1_firsttransfer;

  //onchip_memory2_0_s1_write assignment, which is an e_mux
  assign onchip_memory2_0_s1_write = cpu_0_data_master_granted_onchip_memory2_0_s1 & cpu_0_data_master_write;

  assign shifted_address_to_onchip_memory2_0_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //onchip_memory2_0_s1_address mux, which is an e_mux
  assign onchip_memory2_0_s1_address = (cpu_0_data_master_granted_onchip_memory2_0_s1)? (shifted_address_to_onchip_memory2_0_s1_from_cpu_0_data_master >> 2) :
    (shifted_address_to_onchip_memory2_0_s1_from_cpu_0_instruction_master >> 2);

  assign shifted_address_to_onchip_memory2_0_s1_from_cpu_0_instruction_master = cpu_0_instruction_master_address_to_slave;
  //d1_onchip_memory2_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_onchip_memory2_0_s1_end_xfer <= 1;
      else 
        d1_onchip_memory2_0_s1_end_xfer <= onchip_memory2_0_s1_end_xfer;
    end


  //onchip_memory2_0_s1_waits_for_read in a cycle, which is an e_mux
  assign onchip_memory2_0_s1_waits_for_read = onchip_memory2_0_s1_in_a_read_cycle & 0;

  //onchip_memory2_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign onchip_memory2_0_s1_in_a_read_cycle = (cpu_0_data_master_granted_onchip_memory2_0_s1 & cpu_0_data_master_read) | (cpu_0_instruction_master_granted_onchip_memory2_0_s1 & cpu_0_instruction_master_read);

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = onchip_memory2_0_s1_in_a_read_cycle;

  //onchip_memory2_0_s1_waits_for_write in a cycle, which is an e_mux
  assign onchip_memory2_0_s1_waits_for_write = onchip_memory2_0_s1_in_a_write_cycle & 0;

  //onchip_memory2_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign onchip_memory2_0_s1_in_a_write_cycle = cpu_0_data_master_granted_onchip_memory2_0_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = onchip_memory2_0_s1_in_a_write_cycle;

  assign wait_for_onchip_memory2_0_s1_counter = 0;
  //onchip_memory2_0_s1_byteenable byte enable port mux, which is an e_mux
  assign onchip_memory2_0_s1_byteenable = (cpu_0_data_master_granted_onchip_memory2_0_s1)? cpu_0_data_master_byteenable :
    -1;


//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //onchip_memory2_0/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end


  //grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_granted_onchip_memory2_0_s1 + cpu_0_instruction_master_granted_onchip_memory2_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of grant signals are active simultaneously", $time);
          $stop;
        end
    end


  //saved_grant signals are active simultaneously, which is an e_process
  always @(posedge clk)
    begin
      if (cpu_0_data_master_saved_grant_onchip_memory2_0_s1 + cpu_0_instruction_master_saved_grant_onchip_memory2_0_s1 > 1)
        begin
          $write("%0d ns: > 1 of saved_grant signals are active simultaneously", $time);
          $stop;
        end
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module pio_0_s1_arbitrator (
                             // inputs:
                              clk,
                              cpu_0_data_master_address_to_slave,
                              cpu_0_data_master_read,
                              cpu_0_data_master_waitrequest,
                              cpu_0_data_master_write,
                              cpu_0_data_master_writedata,
                              pio_0_s1_readdata,
                              reset_n,

                             // outputs:
                              cpu_0_data_master_granted_pio_0_s1,
                              cpu_0_data_master_qualified_request_pio_0_s1,
                              cpu_0_data_master_read_data_valid_pio_0_s1,
                              cpu_0_data_master_requests_pio_0_s1,
                              d1_pio_0_s1_end_xfer,
                              pio_0_s1_address,
                              pio_0_s1_chipselect,
                              pio_0_s1_readdata_from_sa,
                              pio_0_s1_reset_n,
                              pio_0_s1_write_n,
                              pio_0_s1_writedata
                           )
;

  output           cpu_0_data_master_granted_pio_0_s1;
  output           cpu_0_data_master_qualified_request_pio_0_s1;
  output           cpu_0_data_master_read_data_valid_pio_0_s1;
  output           cpu_0_data_master_requests_pio_0_s1;
  output           d1_pio_0_s1_end_xfer;
  output  [  2: 0] pio_0_s1_address;
  output           pio_0_s1_chipselect;
  output           pio_0_s1_readdata_from_sa;
  output           pio_0_s1_reset_n;
  output           pio_0_s1_write_n;
  output           pio_0_s1_writedata;
  input            clk;
  input   [ 14: 0] cpu_0_data_master_address_to_slave;
  input            cpu_0_data_master_read;
  input            cpu_0_data_master_waitrequest;
  input            cpu_0_data_master_write;
  input   [ 31: 0] cpu_0_data_master_writedata;
  input            pio_0_s1_readdata;
  input            reset_n;

  wire             cpu_0_data_master_arbiterlock;
  wire             cpu_0_data_master_arbiterlock2;
  wire             cpu_0_data_master_continuerequest;
  wire             cpu_0_data_master_granted_pio_0_s1;
  wire             cpu_0_data_master_qualified_request_pio_0_s1;
  wire             cpu_0_data_master_read_data_valid_pio_0_s1;
  wire             cpu_0_data_master_requests_pio_0_s1;
  wire             cpu_0_data_master_saved_grant_pio_0_s1;
  reg              d1_pio_0_s1_end_xfer;
  reg              d1_reasons_to_wait;
  reg              enable_nonzero_assertions;
  wire             end_xfer_arb_share_counter_term_pio_0_s1;
  wire             in_a_read_cycle;
  wire             in_a_write_cycle;
  wire    [  2: 0] pio_0_s1_address;
  wire             pio_0_s1_allgrants;
  wire             pio_0_s1_allow_new_arb_cycle;
  wire             pio_0_s1_any_bursting_master_saved_grant;
  wire             pio_0_s1_any_continuerequest;
  wire             pio_0_s1_arb_counter_enable;
  reg              pio_0_s1_arb_share_counter;
  wire             pio_0_s1_arb_share_counter_next_value;
  wire             pio_0_s1_arb_share_set_values;
  wire             pio_0_s1_beginbursttransfer_internal;
  wire             pio_0_s1_begins_xfer;
  wire             pio_0_s1_chipselect;
  wire             pio_0_s1_end_xfer;
  wire             pio_0_s1_firsttransfer;
  wire             pio_0_s1_grant_vector;
  wire             pio_0_s1_in_a_read_cycle;
  wire             pio_0_s1_in_a_write_cycle;
  wire             pio_0_s1_master_qreq_vector;
  wire             pio_0_s1_non_bursting_master_requests;
  wire             pio_0_s1_readdata_from_sa;
  reg              pio_0_s1_reg_firsttransfer;
  wire             pio_0_s1_reset_n;
  reg              pio_0_s1_slavearbiterlockenable;
  wire             pio_0_s1_slavearbiterlockenable2;
  wire             pio_0_s1_unreg_firsttransfer;
  wire             pio_0_s1_waits_for_read;
  wire             pio_0_s1_waits_for_write;
  wire             pio_0_s1_write_n;
  wire             pio_0_s1_writedata;
  wire    [ 14: 0] shifted_address_to_pio_0_s1_from_cpu_0_data_master;
  wire             wait_for_pio_0_s1_counter;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_reasons_to_wait <= 0;
      else 
        d1_reasons_to_wait <= ~pio_0_s1_end_xfer;
    end


  assign pio_0_s1_begins_xfer = ~d1_reasons_to_wait & ((cpu_0_data_master_qualified_request_pio_0_s1));
  //assign pio_0_s1_readdata_from_sa = pio_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  assign pio_0_s1_readdata_from_sa = pio_0_s1_readdata;

  assign cpu_0_data_master_requests_pio_0_s1 = ({cpu_0_data_master_address_to_slave[14 : 5] , 5'b0} == 15'h4000) & (cpu_0_data_master_read | cpu_0_data_master_write);
  //pio_0_s1_arb_share_counter set values, which is an e_mux
  assign pio_0_s1_arb_share_set_values = 1;

  //pio_0_s1_non_bursting_master_requests mux, which is an e_mux
  assign pio_0_s1_non_bursting_master_requests = cpu_0_data_master_requests_pio_0_s1;

  //pio_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  assign pio_0_s1_any_bursting_master_saved_grant = 0;

  //pio_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  assign pio_0_s1_arb_share_counter_next_value = pio_0_s1_firsttransfer ? (pio_0_s1_arb_share_set_values - 1) : |pio_0_s1_arb_share_counter ? (pio_0_s1_arb_share_counter - 1) : 0;

  //pio_0_s1_allgrants all slave grants, which is an e_mux
  assign pio_0_s1_allgrants = |pio_0_s1_grant_vector;

  //pio_0_s1_end_xfer assignment, which is an e_assign
  assign pio_0_s1_end_xfer = ~(pio_0_s1_waits_for_read | pio_0_s1_waits_for_write);

  //end_xfer_arb_share_counter_term_pio_0_s1 arb share counter enable term, which is an e_assign
  assign end_xfer_arb_share_counter_term_pio_0_s1 = pio_0_s1_end_xfer & (~pio_0_s1_any_bursting_master_saved_grant | in_a_read_cycle | in_a_write_cycle);

  //pio_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  assign pio_0_s1_arb_counter_enable = (end_xfer_arb_share_counter_term_pio_0_s1 & pio_0_s1_allgrants) | (end_xfer_arb_share_counter_term_pio_0_s1 & ~pio_0_s1_non_bursting_master_requests);

  //pio_0_s1_arb_share_counter counter, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_0_s1_arb_share_counter <= 0;
      else if (pio_0_s1_arb_counter_enable)
          pio_0_s1_arb_share_counter <= pio_0_s1_arb_share_counter_next_value;
    end


  //pio_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_0_s1_slavearbiterlockenable <= 0;
      else if ((|pio_0_s1_master_qreq_vector & end_xfer_arb_share_counter_term_pio_0_s1) | (end_xfer_arb_share_counter_term_pio_0_s1 & ~pio_0_s1_non_bursting_master_requests))
          pio_0_s1_slavearbiterlockenable <= |pio_0_s1_arb_share_counter_next_value;
    end


  //cpu_0/data_master pio_0/s1 arbiterlock, which is an e_assign
  assign cpu_0_data_master_arbiterlock = pio_0_s1_slavearbiterlockenable & cpu_0_data_master_continuerequest;

  //pio_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  assign pio_0_s1_slavearbiterlockenable2 = |pio_0_s1_arb_share_counter_next_value;

  //cpu_0/data_master pio_0/s1 arbiterlock2, which is an e_assign
  assign cpu_0_data_master_arbiterlock2 = pio_0_s1_slavearbiterlockenable2 & cpu_0_data_master_continuerequest;

  //pio_0_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  assign pio_0_s1_any_continuerequest = 1;

  //cpu_0_data_master_continuerequest continued request, which is an e_assign
  assign cpu_0_data_master_continuerequest = 1;

  assign cpu_0_data_master_qualified_request_pio_0_s1 = cpu_0_data_master_requests_pio_0_s1 & ~(((~cpu_0_data_master_waitrequest) & cpu_0_data_master_write));
  //pio_0_s1_writedata mux, which is an e_mux
  assign pio_0_s1_writedata = cpu_0_data_master_writedata;

  //master is always granted when requested
  assign cpu_0_data_master_granted_pio_0_s1 = cpu_0_data_master_qualified_request_pio_0_s1;

  //cpu_0/data_master saved-grant pio_0/s1, which is an e_assign
  assign cpu_0_data_master_saved_grant_pio_0_s1 = cpu_0_data_master_requests_pio_0_s1;

  //allow new arb cycle for pio_0/s1, which is an e_assign
  assign pio_0_s1_allow_new_arb_cycle = 1;

  //placeholder chosen master
  assign pio_0_s1_grant_vector = 1;

  //placeholder vector of master qualified-requests
  assign pio_0_s1_master_qreq_vector = 1;

  //pio_0_s1_reset_n assignment, which is an e_assign
  assign pio_0_s1_reset_n = reset_n;

  assign pio_0_s1_chipselect = cpu_0_data_master_granted_pio_0_s1;
  //pio_0_s1_firsttransfer first transaction, which is an e_assign
  assign pio_0_s1_firsttransfer = pio_0_s1_begins_xfer ? pio_0_s1_unreg_firsttransfer : pio_0_s1_reg_firsttransfer;

  //pio_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  assign pio_0_s1_unreg_firsttransfer = ~(pio_0_s1_slavearbiterlockenable & pio_0_s1_any_continuerequest);

  //pio_0_s1_reg_firsttransfer first transaction, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          pio_0_s1_reg_firsttransfer <= 1'b1;
      else if (pio_0_s1_begins_xfer)
          pio_0_s1_reg_firsttransfer <= pio_0_s1_unreg_firsttransfer;
    end


  //pio_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  assign pio_0_s1_beginbursttransfer_internal = pio_0_s1_begins_xfer;

  //~pio_0_s1_write_n assignment, which is an e_mux
  assign pio_0_s1_write_n = ~(cpu_0_data_master_granted_pio_0_s1 & cpu_0_data_master_write);

  assign shifted_address_to_pio_0_s1_from_cpu_0_data_master = cpu_0_data_master_address_to_slave;
  //pio_0_s1_address mux, which is an e_mux
  assign pio_0_s1_address = shifted_address_to_pio_0_s1_from_cpu_0_data_master >> 2;

  //d1_pio_0_s1_end_xfer register, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          d1_pio_0_s1_end_xfer <= 1;
      else 
        d1_pio_0_s1_end_xfer <= pio_0_s1_end_xfer;
    end


  //pio_0_s1_waits_for_read in a cycle, which is an e_mux
  assign pio_0_s1_waits_for_read = pio_0_s1_in_a_read_cycle & pio_0_s1_begins_xfer;

  //pio_0_s1_in_a_read_cycle assignment, which is an e_assign
  assign pio_0_s1_in_a_read_cycle = cpu_0_data_master_granted_pio_0_s1 & cpu_0_data_master_read;

  //in_a_read_cycle assignment, which is an e_mux
  assign in_a_read_cycle = pio_0_s1_in_a_read_cycle;

  //pio_0_s1_waits_for_write in a cycle, which is an e_mux
  assign pio_0_s1_waits_for_write = pio_0_s1_in_a_write_cycle & 0;

  //pio_0_s1_in_a_write_cycle assignment, which is an e_assign
  assign pio_0_s1_in_a_write_cycle = cpu_0_data_master_granted_pio_0_s1 & cpu_0_data_master_write;

  //in_a_write_cycle assignment, which is an e_mux
  assign in_a_write_cycle = pio_0_s1_in_a_write_cycle;

  assign wait_for_pio_0_s1_counter = 0;

//synthesis translate_off
//////////////// SIMULATION-ONLY CONTENTS
  //pio_0/s1 enable non-zero assertions, which is an e_register
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          enable_nonzero_assertions <= 0;
      else 
        enable_nonzero_assertions <= 1'b1;
    end



//////////////// END SIMULATION-ONLY CONTENTS

//synthesis translate_on

endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module qlab5_sys_reset_clk_0_domain_synch_module (
                                                   // inputs:
                                                    clk,
                                                    data_in,
                                                    reset_n,

                                                   // outputs:
                                                    data_out
                                                 )
;

  output           data_out;
  input            clk;
  input            data_in;
  input            reset_n;

  reg              data_in_d1 /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  reg              data_out /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101"  */;
  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_in_d1 <= 0;
      else 
        data_in_d1 <= data_in;
    end


  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          data_out <= 0;
      else 
        data_out <= data_in_d1;
    end



endmodule



// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module qlab5_sys (
                   // 1) global signals:
                    clk_0,
                    reset_n,

                   // the_pio_0
                    out_port_from_the_pio_0
                 )
;

  output           out_port_from_the_pio_0;
  input            clk_0;
  input            reset_n;

  wire             clk_0_reset_n;
  wire    [ 14: 0] cpu_0_data_master_address;
  wire    [ 14: 0] cpu_0_data_master_address_to_slave;
  wire    [  3: 0] cpu_0_data_master_byteenable;
  wire             cpu_0_data_master_granted_onchip_memory2_0_s1;
  wire             cpu_0_data_master_granted_pio_0_s1;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire             cpu_0_data_master_qualified_request_onchip_memory2_0_s1;
  wire             cpu_0_data_master_qualified_request_pio_0_s1;
  wire             cpu_0_data_master_read;
  wire             cpu_0_data_master_read_data_valid_onchip_memory2_0_s1;
  wire             cpu_0_data_master_read_data_valid_pio_0_s1;
  wire    [ 31: 0] cpu_0_data_master_readdata;
  wire             cpu_0_data_master_requests_onchip_memory2_0_s1;
  wire             cpu_0_data_master_requests_pio_0_s1;
  wire             cpu_0_data_master_reset_n;
  wire             cpu_0_data_master_waitrequest;
  wire             cpu_0_data_master_write;
  wire    [ 31: 0] cpu_0_data_master_writedata;
  wire    [ 13: 0] cpu_0_instruction_master_address;
  wire    [ 13: 0] cpu_0_instruction_master_address_to_slave;
  wire             cpu_0_instruction_master_granted_onchip_memory2_0_s1;
  wire             cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1;
  wire             cpu_0_instruction_master_read;
  wire             cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1;
  wire    [ 31: 0] cpu_0_instruction_master_readdata;
  wire             cpu_0_instruction_master_requests_onchip_memory2_0_s1;
  wire             cpu_0_instruction_master_waitrequest;
  wire             d1_onchip_memory2_0_s1_end_xfer;
  wire             d1_pio_0_s1_end_xfer;
  wire    [ 10: 0] onchip_memory2_0_s1_address;
  wire    [  3: 0] onchip_memory2_0_s1_byteenable;
  wire             onchip_memory2_0_s1_chipselect;
  wire             onchip_memory2_0_s1_clken;
  wire    [ 31: 0] onchip_memory2_0_s1_readdata;
  wire    [ 31: 0] onchip_memory2_0_s1_readdata_from_sa;
  wire             onchip_memory2_0_s1_write;
  wire    [ 31: 0] onchip_memory2_0_s1_writedata;
  wire             out_port_from_the_pio_0;
  wire    [  2: 0] pio_0_s1_address;
  wire             pio_0_s1_chipselect;
  wire             pio_0_s1_readdata;
  wire             pio_0_s1_readdata_from_sa;
  wire             pio_0_s1_reset_n;
  wire             pio_0_s1_write_n;
  wire             pio_0_s1_writedata;
  wire             registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1;
  wire             reset_n_sources;
  cpu_0_data_master_arbitrator the_cpu_0_data_master
    (
      .clk                                                              (clk_0),
      .cpu_0_data_master_address                                        (cpu_0_data_master_address),
      .cpu_0_data_master_address_to_slave                               (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_onchip_memory2_0_s1                    (cpu_0_data_master_granted_onchip_memory2_0_s1),
      .cpu_0_data_master_granted_pio_0_s1                               (cpu_0_data_master_granted_pio_0_s1),
      .cpu_0_data_master_qualified_request_onchip_memory2_0_s1          (cpu_0_data_master_qualified_request_onchip_memory2_0_s1),
      .cpu_0_data_master_qualified_request_pio_0_s1                     (cpu_0_data_master_qualified_request_pio_0_s1),
      .cpu_0_data_master_read                                           (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_onchip_memory2_0_s1            (cpu_0_data_master_read_data_valid_onchip_memory2_0_s1),
      .cpu_0_data_master_read_data_valid_pio_0_s1                       (cpu_0_data_master_read_data_valid_pio_0_s1),
      .cpu_0_data_master_readdata                                       (cpu_0_data_master_readdata),
      .cpu_0_data_master_requests_onchip_memory2_0_s1                   (cpu_0_data_master_requests_onchip_memory2_0_s1),
      .cpu_0_data_master_requests_pio_0_s1                              (cpu_0_data_master_requests_pio_0_s1),
      .cpu_0_data_master_reset_n                                        (cpu_0_data_master_reset_n),
      .cpu_0_data_master_waitrequest                                    (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                          (cpu_0_data_master_write),
      .d1_onchip_memory2_0_s1_end_xfer                                  (d1_onchip_memory2_0_s1_end_xfer),
      .d1_pio_0_s1_end_xfer                                             (d1_pio_0_s1_end_xfer),
      .onchip_memory2_0_s1_readdata_from_sa                             (onchip_memory2_0_s1_readdata_from_sa),
      .pio_0_s1_readdata_from_sa                                        (pio_0_s1_readdata_from_sa),
      .registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 (registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1),
      .reset_n                                                          (clk_0_reset_n)
    );

  cpu_0_instruction_master_arbitrator the_cpu_0_instruction_master
    (
      .clk                                                            (clk_0),
      .cpu_0_instruction_master_address                               (cpu_0_instruction_master_address),
      .cpu_0_instruction_master_address_to_slave                      (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_onchip_memory2_0_s1           (cpu_0_instruction_master_granted_onchip_memory2_0_s1),
      .cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1 (cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1),
      .cpu_0_instruction_master_read                                  (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1   (cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1),
      .cpu_0_instruction_master_readdata                              (cpu_0_instruction_master_readdata),
      .cpu_0_instruction_master_requests_onchip_memory2_0_s1          (cpu_0_instruction_master_requests_onchip_memory2_0_s1),
      .cpu_0_instruction_master_waitrequest                           (cpu_0_instruction_master_waitrequest),
      .d1_onchip_memory2_0_s1_end_xfer                                (d1_onchip_memory2_0_s1_end_xfer),
      .onchip_memory2_0_s1_readdata_from_sa                           (onchip_memory2_0_s1_readdata_from_sa),
      .reset_n                                                        (clk_0_reset_n)
    );

  cpu_0 the_cpu_0
    (
      .clk           (clk_0),
      .d_address     (cpu_0_data_master_address),
      .d_byteenable  (cpu_0_data_master_byteenable),
      .d_irq         (cpu_0_data_master_irq),
      .d_read        (cpu_0_data_master_read),
      .d_readdata    (cpu_0_data_master_readdata),
      .d_waitrequest (cpu_0_data_master_waitrequest),
      .d_write       (cpu_0_data_master_write),
      .d_writedata   (cpu_0_data_master_writedata),
      .i_address     (cpu_0_instruction_master_address),
      .i_read        (cpu_0_instruction_master_read),
      .i_readdata    (cpu_0_instruction_master_readdata),
      .i_waitrequest (cpu_0_instruction_master_waitrequest),
      .reset_n       (cpu_0_data_master_reset_n)
    );

  onchip_memory2_0_s1_arbitrator the_onchip_memory2_0_s1
    (
      .clk                                                              (clk_0),
      .cpu_0_data_master_address_to_slave                               (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_byteenable                                     (cpu_0_data_master_byteenable),
      .cpu_0_data_master_granted_onchip_memory2_0_s1                    (cpu_0_data_master_granted_onchip_memory2_0_s1),
      .cpu_0_data_master_qualified_request_onchip_memory2_0_s1          (cpu_0_data_master_qualified_request_onchip_memory2_0_s1),
      .cpu_0_data_master_read                                           (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_onchip_memory2_0_s1            (cpu_0_data_master_read_data_valid_onchip_memory2_0_s1),
      .cpu_0_data_master_requests_onchip_memory2_0_s1                   (cpu_0_data_master_requests_onchip_memory2_0_s1),
      .cpu_0_data_master_waitrequest                                    (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                                          (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                                      (cpu_0_data_master_writedata),
      .cpu_0_instruction_master_address_to_slave                        (cpu_0_instruction_master_address_to_slave),
      .cpu_0_instruction_master_granted_onchip_memory2_0_s1             (cpu_0_instruction_master_granted_onchip_memory2_0_s1),
      .cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1   (cpu_0_instruction_master_qualified_request_onchip_memory2_0_s1),
      .cpu_0_instruction_master_read                                    (cpu_0_instruction_master_read),
      .cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1     (cpu_0_instruction_master_read_data_valid_onchip_memory2_0_s1),
      .cpu_0_instruction_master_requests_onchip_memory2_0_s1            (cpu_0_instruction_master_requests_onchip_memory2_0_s1),
      .d1_onchip_memory2_0_s1_end_xfer                                  (d1_onchip_memory2_0_s1_end_xfer),
      .onchip_memory2_0_s1_address                                      (onchip_memory2_0_s1_address),
      .onchip_memory2_0_s1_byteenable                                   (onchip_memory2_0_s1_byteenable),
      .onchip_memory2_0_s1_chipselect                                   (onchip_memory2_0_s1_chipselect),
      .onchip_memory2_0_s1_clken                                        (onchip_memory2_0_s1_clken),
      .onchip_memory2_0_s1_readdata                                     (onchip_memory2_0_s1_readdata),
      .onchip_memory2_0_s1_readdata_from_sa                             (onchip_memory2_0_s1_readdata_from_sa),
      .onchip_memory2_0_s1_write                                        (onchip_memory2_0_s1_write),
      .onchip_memory2_0_s1_writedata                                    (onchip_memory2_0_s1_writedata),
      .registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1 (registered_cpu_0_data_master_read_data_valid_onchip_memory2_0_s1),
      .reset_n                                                          (clk_0_reset_n)
    );

  onchip_memory2_0 the_onchip_memory2_0
    (
      .address    (onchip_memory2_0_s1_address),
      .byteenable (onchip_memory2_0_s1_byteenable),
      .chipselect (onchip_memory2_0_s1_chipselect),
      .clk        (clk_0),
      .clken      (onchip_memory2_0_s1_clken),
      .readdata   (onchip_memory2_0_s1_readdata),
      .write      (onchip_memory2_0_s1_write),
      .writedata  (onchip_memory2_0_s1_writedata)
    );

  pio_0_s1_arbitrator the_pio_0_s1
    (
      .clk                                          (clk_0),
      .cpu_0_data_master_address_to_slave           (cpu_0_data_master_address_to_slave),
      .cpu_0_data_master_granted_pio_0_s1           (cpu_0_data_master_granted_pio_0_s1),
      .cpu_0_data_master_qualified_request_pio_0_s1 (cpu_0_data_master_qualified_request_pio_0_s1),
      .cpu_0_data_master_read                       (cpu_0_data_master_read),
      .cpu_0_data_master_read_data_valid_pio_0_s1   (cpu_0_data_master_read_data_valid_pio_0_s1),
      .cpu_0_data_master_requests_pio_0_s1          (cpu_0_data_master_requests_pio_0_s1),
      .cpu_0_data_master_waitrequest                (cpu_0_data_master_waitrequest),
      .cpu_0_data_master_write                      (cpu_0_data_master_write),
      .cpu_0_data_master_writedata                  (cpu_0_data_master_writedata),
      .d1_pio_0_s1_end_xfer                         (d1_pio_0_s1_end_xfer),
      .pio_0_s1_address                             (pio_0_s1_address),
      .pio_0_s1_chipselect                          (pio_0_s1_chipselect),
      .pio_0_s1_readdata                            (pio_0_s1_readdata),
      .pio_0_s1_readdata_from_sa                    (pio_0_s1_readdata_from_sa),
      .pio_0_s1_reset_n                             (pio_0_s1_reset_n),
      .pio_0_s1_write_n                             (pio_0_s1_write_n),
      .pio_0_s1_writedata                           (pio_0_s1_writedata),
      .reset_n                                      (clk_0_reset_n)
    );

  pio_0 the_pio_0
    (
      .address    (pio_0_s1_address),
      .chipselect (pio_0_s1_chipselect),
      .clk        (clk_0),
      .out_port   (out_port_from_the_pio_0),
      .readdata   (pio_0_s1_readdata),
      .reset_n    (pio_0_s1_reset_n),
      .write_n    (pio_0_s1_write_n),
      .writedata  (pio_0_s1_writedata)
    );

  //reset is asserted asynchronously and deasserted synchronously
  qlab5_sys_reset_clk_0_domain_synch_module qlab5_sys_reset_clk_0_domain_synch
    (
      .clk      (clk_0),
      .data_in  (1'b1),
      .data_out (clk_0_reset_n),
      .reset_n  (reset_n_sources)
    );

  //reset sources mux, which is an e_mux
  assign reset_n_sources = ~(~reset_n |
    0);

  //cpu_0_data_master_irq of type irq does not connect to anything so wire it to default (0)
  assign cpu_0_data_master_irq = 0;


endmodule


//synthesis translate_off



// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE

// AND HERE WILL BE PRESERVED </ALTERA_NOTE>


// If user logic components use Altsync_Ram with convert_hex2ver.dll,
// set USE_convert_hex2ver in the user comments section above

// `ifdef USE_convert_hex2ver
// `else
// `define NO_PLI 1
// `endif

`include "c:/altera/91/quartus/eda/sim_lib/altera_mf.v"
`include "c:/altera/91/quartus/eda/sim_lib/220model.v"
`include "c:/altera/91/quartus/eda/sim_lib/sgate.v"
`include "cpu_0_test_bench.v"
`include "cpu_0.v"
`include "onchip_memory2_0.v"
`include "pio_0.v"

`timescale 1ns / 1ps

module test_bench 
;


  wire             clk;
  reg              clk_0;
  wire    [ 31: 0] cpu_0_data_master_irq;
  wire             out_port_from_the_pio_0;
  reg              reset_n;


// <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
//  add your signals and additional architecture here
// AND HERE WILL BE PRESERVED </ALTERA_NOTE>

  //Set us up the Dut
  qlab5_sys DUT
    (
      .clk_0                   (clk_0),
      .out_port_from_the_pio_0 (out_port_from_the_pio_0),
      .reset_n                 (reset_n)
    );

  initial
    clk_0 = 1'b0;
  always
    #10 clk_0 <= ~clk_0;
  
  initial 
    begin
      reset_n <= 0;
      #200 reset_n <= 1;
    end

endmodule


//synthesis translate_on