module decod(x_in,y_out);
parameter delay=3;
parameter n=3;// number of inputs
parameter u=8;//nimber of outputs (u<2**n)
input x_in;
output y_out;
wire [n-1:0] x_in;
reg [u-1:0] y_out;
reg [n:0]  i;

always @ (x_in)
 begin  
   #delay;
     for (i=0; i<u; i=i+1)     
     y_out[i] =  x_in==i  ? 1:0;        
  end
endmodule