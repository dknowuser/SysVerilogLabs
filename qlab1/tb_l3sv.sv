module qlab1(input clock, output[2:0] data_out);
bus myBus();
complex m2(.x_in(myBus.dut.data_in), .z_0(myBus.dut.data_out[0]),
  .z_1(myBus.dut.data_out[1]), .z_2(myBus.dut.data_out[2]));
wire[22:0] counter_connect;
downcounter(.clock(clock), .q(counter_connect));
my_counter cnt(.clock(counter_connect[22]), .q(myBus.stim.data_in));
assign data_out = myBus.dut.data_out;
endmodule