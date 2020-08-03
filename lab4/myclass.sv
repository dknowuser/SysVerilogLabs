class buff_trans #(parameter int n = 8, parameter int size = 1024);
logic [n-1:0] data_block [0:size-1];
logic [n-1:0] crc = 0;
int head = 0, tail = 0;
int transacts = 0;
 
task get (input logic  start, stop,// this function only accepts data and translates       
			input logic [n-1:0] datain,
			output int terms,// holds number of transactions
			output logic buff_full,
			output logic buff_empty);                     
	if (start) 
	begin
		buff_full = 0;
		buff_empty = 1;
		crc = 0;
		transacts = 0;
	end
	if (!stop) begin
		crc = crc + datain; //in this case stopd is argument 
		data_block[tail] = datain;
		buff_empty = 0;
		if (tail < size-1)
		begin
			tail = tail + 1;
			buff_full = 0;
		end
		else
		begin
			tail = 0;
			crc = 0;
			buff_full = 1;
			transacts = 0;
		end
		transacts++;
		terms = transacts;
	end
endtask
  
task send (output logic start,stop,
    output logic[n-1:0] data,
	output logic buff_full,
	output logic buff_empty);
		buff_full = 0;
		buff_empty = (head == tail) ? 1:0;
        stop = (head == tail) ? 1:0; // stop issued after crc transmitted
        start = (head == tail) ? 0:1;
        data = (head < tail)? data_block[head]:crc;
        if (head == 0) crc = data_block[0]; 
        else if (head < tail && head != 0) crc = crc + data_block[head];
		if(head < tail)
			head = head + 1;
endtask
endclass