include "myclass.sv";

module device #(parameter n = 8, parameter int size = 1024)
	(input logic clock,	bus.syst sy);
	
buff_trans #(n, size) device_buff;
initial device_buff=new();

logic [n-1:0] dataout;//used for control only
int terms;// holds number of transactions  
logic start, stop;
logic  v=0, stopd=0, w=0; // v=1 enables reception,w=1 enables transmission 
int i, j;

always@ (negedge clock)
begin
	if (sy.start)
	begin
		v = 1; stopd = 0; w = 0; i = 0;
	end
	else if (sy.stop)
		v = 0;
end

always@ (negedge clock)
begin
	if (v)
	begin
		device_buff.get(sy.start, sy.stop, sy.datain, terms, sy.buff_full, sy.buff_empty);
		i++;
	end
end

always@ (posedge clock)
begin
	if(sy.start_read)
	begin
		w = 1;
		j = 0;
	end
	if (w && j < terms)
	begin
		device_buff.send(start, stop, sy.dataout, sy.buff_full, sy.buff_empty);
		j++;
		
		/*if (j == terms)
			w = 0;*/
	end
end
endmodule