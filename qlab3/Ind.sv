module Ind(clock, Din, ind_out);
parameter n = 8;
input clock;
input [n-1:0] Din;
output [n-1:0] ind_out;
logic [n-1:0] ind_out;

always@(posedge clock)
begin
	case(Din)
	0: ind_out = 8'b00111111;
	1: ind_out = 8'b00000110;
	2: ind_out = 8'b01011011;
	3: ind_out = 8'b01001111;
	4: ind_out = 8'b01100110;
	5: ind_out = 8'b01101101;
	6: ind_out = 8'b01111101;
	7: ind_out = 8'b00000111;
	default: ind_out = 8'b11111111;
	endcase
end
endmodule