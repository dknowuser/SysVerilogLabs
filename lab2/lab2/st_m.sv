module st_m (in_data, out_data, reset, clock);
parameter state_len = 2;
parameter inp_len=2;
parameter out_len=2;
parameter [state_len-1:0]
   s0=0,
   s1=1,
   s2=2;
parameter [out_len-1:0] 
   y0=2'b00,
   y1=2'b01,
   y2=2'b10;

input in_data ;
output out_data;
input reset,clock;
wire [inp_len-1:0]in_data;
wire reset, clock;
reg [state_len-1:0] state;
reg [out_len-1:0] out_data;
reg [out_len-1:0] data_out;

covergroup state_cov;
  t1:coverpoint state {bins idle ={s0};
                       bins rest = {s1,s2};}
  t2: coverpoint state
     {bins  s_0 = (s0=>s0), (s0=>s1), (s0=>s2);
      bins  s_1 = (s1=>s1), (s1=>s2), (s1=>s0);
      bins  s_2 = (s2=>s2), (s2=>s1), (s2=>s0);}
endgroup;

covergroup in_cov;
  t1:coverpoint in_data;
endgroup;

state_cov st;
initial st = new;

in_cov it;
initial it = new;

always @ (posedge clock or posedge reset)
  begin 
   st.sample(); 
   it.sample();
   data_out = y0;
       if (reset==1)  begin state <= s0; data_out = y0; end
   else  case(state)
     s0: if (in_data == 2'b00) state <= s0 ;    
	          else if (in_data == 2'b01) begin state <= s1;  data_out = y1; end
                 else begin state <= s2; 
                            if (in_data == 2'b11) data_out = y2; end
     s1: if (in_data == 2'b00 ) begin state <= s1; data_out = y1; end
            else if (in_data == 2'b11) begin state <= s2; data_out = y2; end
	             else state <= s0;  
     s2: if (in_data==2'b00 ) begin state <= s2; data_out = y1; end
            else if (in_data == 2'b01) begin state <= s1; data_out = y2; end
	             else state <= s0;
     endcase
          out_data<=data_out; 
  end
endmodule


