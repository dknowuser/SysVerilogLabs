interface bus ();
 logic [2:0] data_in; 
 logic [2:0] data_out;

modport stim
(output data_in, data_out); 

modport monit
(input data_in, data_out);

modport dut
(input data_in, 
output data_out);
endinterface 