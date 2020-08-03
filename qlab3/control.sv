module control_unit(clock, reset, start, k, q, c_sh, c_acc, ready, cont);
input clock, reset, start, q;
output c_sh, c_acc, ready, cont;
parameter n=8;
input [n-1:0] k;
enum {init,cycle} state;
wire clock, reset, start,
      q;
reg      ready, cont;
reg  [1:0]c_sh, c_acc; 

always @ (posedge clock, posedge reset)
      if (reset)
          begin state=init; ready=0; c_acc=1; cont=1; c_sh=0; end
    else if (clock && !ready)
        case (state) 
             init: if (start) begin state=cycle; ready=0;
                          c_sh=2; c_acc=1; cont=1; 
                         end 
              cycle: if ((k>=n) || (q==1)) 
                          begin ready=1; 
                            cont=0;
							c_sh=0;
							state=init;
                          end
                         else begin cont=1; 
						   c_acc=0;
                          end

       endcase
endmodule