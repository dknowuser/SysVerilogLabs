module qlab5(input wire clk, input wire reset_n,
	output wire data_out);

qlab5_sys qlab5_cpu(.clk_0(clk), .reset_n(reset_n),
	.out_port_from_the_pio_0(data_out));

endmodule