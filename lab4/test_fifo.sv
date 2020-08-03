include "myclass.sv";

module generator #(parameter n = 8, parameter int size = 1024) (input logic clock,
	bus.stim t);
int i = 0;

initial
begin
	t.stop = 0; 
	t.start = 1; 
	t.start_read = 0;
	t.datain = 0;
	t.buff_full = 0;
	t.buff_empty = 1;
	
	@(posedge clock);
	t.start = 0;
	t.start_read = 1;
	@(posedge clock);
	t.start_read = 0;
	for(i = 0; i < size >> 7; i++)
	begin
		t.datain++;
		@(posedge clock);
	end
	
	/*@(posedge clock)
	t.start = 0;
	for(i = 0; i < size >> 7; i++)
	begin
		t.datain++;
		@(posedge clock);
	end
	t.stop = 1;
	t.start_read = 1;
	@(posedge clock);
	t.start_read = 0;
	for(i = 0; i < size >> 7; i++)
		@(posedge clock);*/
end
endmodule

module my_checker #(parameter n = 8, parameter int size = 1024)
	(input logic clock, bus.monit sy);
integer crc_gen = 0, crc_dut = 0;
logic v = 0, stopd = 0, w = 0; // v=1 enables reception from generator,w=1 emables reception from dut
int i = 0, j = 0;

always @(negedge clock) // accepting from generator
begin
	stopd = sy.stop; //half clock delay to get crc
	if (sy.start)
	begin
		v = 1; crc_gen = 0; i = 0;
	end
	else if (stopd) 
		v = 0;
		
	if (v) 
	begin
		i++;
		crc_gen += sy.datain;
	end
end

always @ (negedge clock) //accepting from dut
begin
	if (sy.start_read)
	begin
		w = 1; j = 0; crc_dut = 0;
	end
	else if (i == j && i != 0)
	begin
		w = 0;
		i = 0;
		j = 0;
		assert(crc_gen == crc_dut) $display("OK");
			else $error("calculation error");
	end
	
	if (w)
	begin
		crc_dut += sy.dataout;
		j++;
	end	
end
endmodule
 
module top #(parameter n = 8, parameter int size = 1024);
logic clock;
bus #(n) bbus();
clocks cl(clock);
generator #(n, size) g1(.clock(clock), .t(bbus));
device #(n, size) d1(.clock(clock), .sy(bbus));
my_checker #(n, size) e1(.clock(clock),.sy(bbus));

endmodule