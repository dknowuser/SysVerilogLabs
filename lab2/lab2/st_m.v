module st_m (in_data, out_data, reset, clock);
parameter state_len = 2;
parameter inp_len=2;
parameter out_len=2;

input in_data ;
output out_data;
input reset,clock;
wire [inp_len-1:0]in_data;
wire reset, clock;
reg [state_len-1:0] state;
reg [out_len-1:0] out_data;
reg [out_len-1:0] data_out;

always @ (posedge clock or posedge reset)
  begin 
   data_out = 2'b00;
       if (reset==1)  begin state <= 2'b00; data_out = 2'b00; end
   else  case(state)
     2'b00: if (in_data == 2'b00) state <= 2'b00 ;    
	          else if (in_data == 2'b01) begin state <= 2'b01;  data_out = 2'b01; end
                 else begin state <= 2'b10; 
                            if (in_data == 2'b11) data_out = 2'b10; end
     2'b01: if (in_data == 2'b00 ) begin state <= 2'b01; data_out = 2'b01; end
            else if (in_data == 2'b11) begin state <= 2'b10; data_out = 2'b10; end
	             else state <= 2'b00;  
     2'b10: if (in_data==2'b00 ) begin state <= 2'b10; data_out = 2'b01; end
            else if (in_data == 2'b01) begin state <= 2'b01; data_out = 2'b10; end
	             else state <= 2'b00;
     endcase
          out_data<=data_out; 
  end
endmodule
