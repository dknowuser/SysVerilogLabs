 //-------
module counter (clk,reset,s,carry_in, carry_out,dat_in,result);       
/*  s=> 
   00 - no oper
--  10 -increm for 'bidir'
--  01 - decrement  for 'bidir'
--  10 or 01 - inc for 'up' and decrement  'dowm'
--  11 -load */
     
 parameter  num_bits=8;
 parameter max=2**(num_bits)-1;
 parameter  dir= "up" ; // dir  := 'up','down','bidir'
 
 input clk,reset, carry_in, dat_in;
 input [1:0] s;
 output carry_out,result;
 reg [num_bits-1:0] par_out; 
  wire [num_bits-1:0] result;
   reg carry_out;
    
 assign result=par_out;      
 always @(posedge result, posedge dir)
   if ((dir=="up") && (s!=2'b00) )     
             carry_out=(par_out==max) ? 1:0;               
   else if  ((dir=="down") && (s!=2'b00))
         carry_out=(par_out==0) ? 1:0;               
        else if  (dir=="bidir")
               if  (s==2'b10)  //up
                  carry_out= (par_out== max) ? 1:0;                                       
               else if (s==2'b01)  //down
                       carry_out= (par_out== 0) ? 1:0;
                      
always @(posedge clk  or posedge reset)
if (reset) par_out=0;
else if (dir=="up" )   
           if (s==2'b11)  par_out<=dat_in;
            else if (s==2'b10 || s==2'b01) 
                  par_out<=par_out+carry_in;
                        
   else  if (dir=="down" ) 
          if (s==2'b11)  par_out<=dat_in;
          else if (s==2'b10 || s==2'b01) 
                 par_out<=par_out-carry_in;
           
    else  if (dir=="bidir" )             
               if (s==2'b11)par_out<=dat_in ;
                else if (s==2'b01)                                  
                                   par_out<=par_out+carry_in;
                     else   //(oper="10") 
                                  par_out<=par_out-carry_in;                                                                                                                                                                                                          
       
endmodule
 //----------------
  module shift_register (clk,s,dl,dr,par_inp,result);       
/*  00 - no oper
--  10 -shift letf for 'bidir'
--  01 -shift right for 'bidir'
--  10 or 01 - shift left for 'left' anf shift right for 'right'
--  11 -load */
      
  parameter  num_bits=8; 
  parameter  shift_len=1;
  parameter  dir= "left" ; // dir  := 'left','right','bidir'
  
  input clk,s,dr,dl, par_inp;
  output result;
  wire [num_bits-1:0] result;// avoid inoit
  wire clk,dr,dl;
  wire [1:0] s;
  wire[num_bits-1:0] par_inp;
  reg [num_bits-1:0]  par_out,par_outpr;     
     
  assign // fix ntw state
         result=par_out;      
 
 always @(posedge clk) // prepare new state
if (dir=="left" )
   begin
            if (s==2'b11)  par_out<=par_inp;
             else if (s==2'b10 || s==2'b01) begin
                   par_outpr=par_out<<shift_len;                         
                   par_outpr[0]=(shift_len==1)?  dl:0 ;
                   par_out<=par_outpr;
                                               end   
   end       
 
else  if (dir=="right" )       
          begin
           if (s==2'b11)  par_out=par_inp;
          
            else if (s==2'b10 || s==2'b01) begin
                  par_outpr=par_out>>shift_len;                        
                    par_outpr[num_bits-1]= (shift_len==1)?  dr:0 ;
                     par_out<=par_outpr;
                                                 end   
          end  
  
     else  if (dir=="bidir" )    
            begin               
                if (s==2'b11)par_out=par_inp ;
                 else if (s==2'b01)
                                  begin
                                    par_outpr=par_out<<shift_len;                                         
                                    par_outpr[0]=(shift_len==1)?  dl:0 ;
                                    par_out<=par_outpr;
                                   end   
                   
                         else   //(oper="10") 
                                   begin
                                           par_outpr=par_out>>shift_len;                                                 
                                          par_outpr[num_bits-1]= (shift_len==1)?  dr:0 ;
                                          par_out<=par_outpr;
                                                                         
                                     end     
            end  // bidir;
endmodule

//---------------------------------
module acc_sm (clk, d,q,s);    
/*        
s->
   00 - no oper
   01 - clear
   10 - accum
*/    
 parameter  num_bits=8; 
  
 input clk,d,s;
 output q;
 wire [num_bits-1:0]d;
 wire clk; 
 wire [1:0] s;
 wire [num_bits-1:0] q;     
  reg [num_bits-1:0]sum; 
assign q=sum; 
always @ (posedge clk) 
     if (s[0]) sum<=0;
     else  if (s[1]) sum<=sum+d;       
endmodule


//----------------------------------
module latch( clock,d,y);
parameter n=8;// number of inputs
input d,clock;
output y;
wire [n-1:0] d;
 wire clock;
reg [n-1:0] y;

always @ (d,clock)
  if (clock=='b1) y=d;    
endmodule 

//----------------------------------------
module decod(x_in,y_out);
parameter delay=3;
parameter n=4;// number of inputs
parameter u=8;//nimber of outputs (u<2**n)
input x_in;
output y_out;
wire [n-1:0] x_in;
reg [u-1:0] y_out;
reg [n:0]  i;

always @ (x_in)
 begin  
   # delay;
     for (i=0; i<u; i=i+1)     
     y_out[i] =  x_in==i  ? 1:0;        
  end
endmodule 
//-------------------------------------

module mux(d_in,addr,y);
parameter delay=3;
parameter n=4;// address length
parameter u=8;//nimber of inputs (u<2**n)
input d_in,addr;
output y;
wire [u-1:0] d_in;
wire [n-1:0] addr;

assign #delay
       y= d_in[addr]  ;            
endmodule 


