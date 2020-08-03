interface bus ();
// состав цепей интерфейса
 logic check_point;
 logic [2:0] data_in; 
 logic [2:0] data_out;
// режимы интерфейса для тестирующих блоков

modport stim
(output data_in, data_out, check_point); 

modport monit
(input data_in, data_out, check_point);

// так может выглядеть задание режима 
// интерфейса для испытуемого устройства
modport dut
(input data_in, 
output data_out);
endinterface
program stimul (bus.stim u2);
  parameter delay = 6;
  integer j;
  initial 
     begin
       u2.check_point=0;
       for (j=0; j<=7;j=j+1)
         begin
         #10; 
         u2.data_in=j;
         u2.check_point=#delay 1;
         #3;
         u2.check_point=0; 
         end 
     end
endprogram

module mot (bus.monit u1);
  parameter truth_table1 = 8'b01000011;
  parameter truth_table2 = 8'b10001001;
  parameter truth_table3 = 8'b10101011;
  logic vt1, vt2, vt3;
  time c_time; 
  assign vt1 = truth_table1[u1.data_in];
  assign vt2 = truth_table2[u1.data_in];
  assign vt3 = truth_table3[u1.data_in];
  always @(posedge u1.check_point)
  begin
     c_time=$time;//фиксация модельного времени ассерции
     assert(u1.data_out[0]==vt1)
        $warning("bus1: correct at %0t",c_time);
        else $error("bus1: error at %0t",c_time);
     assert(u1.data_out[1]==vt2)
        $warning("bus2: correct at %0t",c_time);
        else $error("bus2: error at %0t",c_time);
     assert(u1.data_out[2]==vt3)
        $warning("bus2: correct at %0t",c_time);
        else $error("bus2: error at %0t",c_time);
  end	
endmodule