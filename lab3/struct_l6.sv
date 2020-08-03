module sh_reg(clock, m, d, enable, q);
parameter n=8;
parameter load = 2'b00;
parameter shift = 2'b10;
input clock, enable;
input [1:0] m;
input [n-1:0] d;
output q;
reg [n-1:0] content;
assign q = content[0];

always@(posedge clock)
begin
	if(enable)
		if(m == load)
			content = d;
		else
		if(m == shift)
			content = content >> 1;
end

endmodule

module shifter(d,clock,start,ready,k,reset);
parameter m=8;
input clock, start, reset;
input [m-1:0] d;
output ready;
wire carry_out;
output[m-1:0] k;
logic c_acc, cont;
logic [1:0]c_sh;
logic q;

counter mycounter(.clk(clock), .reset(c_acc),
  .s(c_sh), .carry_in(1), .carry_out(carry_out),
  .dat_in(0), .result(k));
  
sh_reg myshiftreg(.clock(clock), .m(c_sh),
  .d(d), .enable(cont), .q(q));
  
control_unit ctrl(.clock(clock), .reset(reset),
  .start(start), .k(k), .q(q), .c_sh(c_sh),
  .c_acc(c_acc), .ready(ready), .cont(cont));

endmodule