module test;
parameter delay = 6;
parameter truth_table1 = 8'b01000011;
parameter truth_table2 = 8'b10001001;
parameter truth_table3 = 8'b10101011;

wire  z_0,z_1,z_2;
reg [2:0] stim;
reg [3:0] j;
reg  chech_point, error1, error2, error3;
wire vt1, vt2, vt3;

complex  m1(.x_in(stim),.z_0(z_0),.z_1(z_1),.z_2(z_2));
initial 
begin //stimulator 
   chech_point=0;
   for (j=0; j<=7;j=j+1) 
     begin #10; 
        stim = j;
        chech_point = #delay 1;
        #3;
        chech_point=0;  
     end
end

assign vt1 = truth_table1[stim];
assign vt2 = truth_table2[stim];
assign vt3 = truth_table3[stim];

always @ (posedge chech_point) //tester
begin
       error1 = z_0== vt1 ?  0:1;
	   error2 = z_1== vt2 ?  0:1;
	   error3 = z_2== vt3 ?  0:1;
end
endmodule