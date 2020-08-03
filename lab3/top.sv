module test (clock,reset,start,ready,x,q);//(sys_bus.monit);
parameter n=8;
input ready;
output x,clock,start,reset;  
logic clock,reset,start,ready;
logic [n-1:0]x;
reg [n-1:0] temp;
input [n-1:0] q; 
 class Packet;
    rand bit [n-1:0] x;
        constraint data_valid {x > 0; x < 2 ** n; }
 endclass;
 
  Packet p;
     
  initial 
  begin
   // uuu.
    clock=0;
    p=new();
    //assert(p.randomize());
        
  repeat (100) 
      
   begin 
    assert(p.randomize());
	 //  uuu.
     x=p.x;
	 temp = 0;
	 while((((x >> temp) & 1)==0) && (temp < n))
		temp=temp+1;
	
	reset=1;
      #5;
    reset=0;
	start = 1;
	
   //  uuu.
  repeat(20)
    begin     
       // uuu.
        clock=!clock;
         #1;
  if (ready!=0) 
     begin assert (temp==q)
         else $display ("error");
      end;     
     #10; 
   end;// repeat 20
  end; // initial   
  end; // reptat100
 endmodule  //program 
     
   
module top();
parameter n=8;
  logic clock,reset,start,ready;
   logic [n-1:0]x;
    logic[n-1:0] q; 
  //  sys_bus
  //  uuu();
      shifter #8
     v2 (.clock(clock), .reset(reset),.start(start),.ready(ready),.d(x),.k(q));
    test 
    v3 ( .clock(clock), .reset(reset),.start(start),.ready(ready),.x(x),.q(q));  
     endmodule
