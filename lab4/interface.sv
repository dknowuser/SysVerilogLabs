interface bus #(parameter n = 8) ();

logic start,stop,start_read;
logic [n-1:0] datain; 
logic [n-1:0] dataout;
logic buff_full, buff_empty;

modport stim//mode for stim
(
  output start,stop,start_read,
  output datain, dataout, buff_full, buff_empty
);
   
modport monit
	(input start,stop,start_read, datain, dataout, output buff_full, buff_empty);

modport syst //mode of DUT
	(input start,stop,start_read, input datain, output dataout, buff_full, buff_empty);
endinterface

program clocks(clock);
 output logic clock;
 initial 
    forever 
      begin 
        #5;
          clock=1'b0;
        #5;
          clock=1'b1;
      end
endprogram
