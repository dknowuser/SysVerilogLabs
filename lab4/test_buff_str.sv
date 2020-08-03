include "myclass.sv";

 
module generator  (input logic clock,
bus.stim t);
  parameter block_number= 4;// number of bytes in block
  integer k,w;
  buff_trans  p; 
  initial
     begin
       t.stop=0; 
       t.start=0; 
       t.start_read =0;                                   
  p = new();
     
 @ (posedge clock) ; //at least one clock must be executed
                    // before real start
  repeat (block_number) //repeat for all proposed blocks
     begin 
     assert(p.randomize()); // number of bytes in block
        for (k=0; k<=p.length+1;k++) 
           begin   @(posedge clock)
              // sent a unit from block to dut
               w=p.length;
               p.send(t.start,t.stop,t.datain,k);
            end;
          repeat (5)  @ (posedge clock);// pause
            t.start_read=1; // initiate transnission from dut
            @ (posedge clock);
            t.start_read=0;
            repeat(10) @ (posedge clock);//interval to realise reading from DUT
                                  
      end;//repeate     
  end  ; //initial 
 endmodule; 
 
 module checker(input logic clock,bus.monit sy,
              input logic startoutput,input logic stopoutput);
                           buff_trans mon_buff,result_buff;  
              logic  v=0,stopd=0, stopoutputd=0,w=0; // v=1 enables reception from generator,w=1 emables 
              logic[7:0]dd;                         // reception from dut
              integer terms,i,j;
              initial begin mon_buff=new();
                      result_buff=new();
                       end
                      
     always @ (negedge clock) // accepting from generator
             begin stopd<=sy.stop; //half clock delay to get crc
                  if  (sy.start )               
                         begin  v=1;i=0;                          end
                   else if (stopd) begin v=0;
                             mon_buff.length=terms-1; // assign field in object
                                    end;
                  if (v)  begin          
                      mon_buff.get(sy.start,sy.stop, sy.datain,dd,terms,i) ;                
                         i++      ; 
                        //??? - prepare predicted propper results 
                        end; 
              end;// always
          
             always @ (negedge clock) //accepting fron dut
                     begin   stopoutputd<=stopoutput; 
                           if(startoutput) begin w=1;j=0;
                                              end
                          else if (stopoutputd) begin w=0;                  
                                            result_buff.length=terms-1; // assign field in object
                               //        if (addinional condition???) assert ( predicted==real ??) 
                             //                                        $error("calculation error")                                                                  
                                                end ;
                          if (w) begin  
                                    result_buff.get( startoutput, stopoutputd,sy.dataout,dd,terms,j);        
                                    j++      ; 
                                    end;                     
                 end;// always                                                  
                                    
                endmodule ;       
 module top;   
   logic clock, start,stop, startoutput,stopoutput;
   logic [7:0] datain,dataout;
   bus bbus();
  clocks cl(clock);
  generator g1(.clock(clock),.t(bbus));
   checker e1(.clock(clock),.sy(bbus),.startoutput(startoutput),.stopoutput(stopoutput));
  device d1(.clock(clock),.startoutput(startoutput),.stopoutput(stopoutput), .sy(bbus));
  endmodule;
  