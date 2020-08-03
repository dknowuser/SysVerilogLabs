module qlab3(d,clock,start,ready,reset,ind_out);
parameter m=8;
input clock, start, reset;
input [m-1:0] d;
output ready;
output [m-1:0] ind_out;
wire [m-1:0] k;

shifter my_shifter(.d(d), .clock(clock),
	.start(start), .ready(ready),
	.reset(reset), .k(k));
	
Ind indicator(.clock(clock),
	.Din(k), .ind_out(ind_out));

endmodule