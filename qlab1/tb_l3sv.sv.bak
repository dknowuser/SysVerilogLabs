module Test_sv;
bus myBus();
complex m2(.x_in(myBus.dut.data_in), .z_0(myBus.dut.data_out[0]),
  .z_1(myBus.dut.data_out[1]), .z_2(myBus.dut.data_out[2]));
stimul myStimul(myBus.stim);
endmodule