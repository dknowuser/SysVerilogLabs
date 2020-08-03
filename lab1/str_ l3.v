module complex( x_in, z_0,z_1,z_2);
input x_in;
output z_0,z_1,z_2 ;
wire [2:0] x_in;
wire  z_0,z_1,z_2;
wire [7:0] y;   // внутренние связи модуля
  
decod decoder(.x_in(x_in), .y_out(y));
or mod1(z_0, y[0], y[1], y[6]);
or mod2(z_1, y[0], y[3], y[7]);
or mod3(z_2, y[1], y[3], y[5], y[7]);
endmodule