module test_st_m ;
reg [1:0] in_data; 
reg reset, clock;
reg [2:0] takt;
wire [1:0] out_data;

st_m v1(.in_data(in_data),.out_data(out_data),.reset(reset), .clock(clock));
initial 
begin 
 clock='b0;
 reset='b0;
 #5 reset='b1;
 #10 reset='b0;
for (takt=0; takt<2; takt=takt+1)
  begin
    #5 in_data=2'b00;
    #5 clock='b1;
    #10 clock='b0;
    #5 in_data=2'b01;
    #5 clock='b1;
    #10 clock='b0;
    #20;
  end
#10;
for (takt=0; takt<2; takt=takt+1)
  begin
    #5 in_data=2'b10;
    #5 clock='b1;
    #10 clock='b0;
    #5 in_data=2'b00;
    #5 clock='b1;
    #10 clock='b0;
    #5 in_data=2'b01;
    #5 clock='b1;
    #10 clock='b0;
    #20;
  end
#10;
#5 in_data=2'b11;
for (takt=0; takt<3; takt=takt+1)
  begin
    #5 clock='b1;
    #10 clock='b0;
    #20;
  end
#10;
#5 in_data=2'b10;
#5 clock='b1;
#10 clock='b0;
end  
endmodule

