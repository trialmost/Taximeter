module TubeDecoderDecimal(
	decimal_value,
	tube_value
);
	input [3:0] decimal_value;
	output [7:0] tube_value;
	reg [7:0] tube_value;
	always @(decimal_value)
		begin
		    case(decimal_value)
			     0:tube_value<=8'b10111111;
				 1:tube_value<=8'b10000110;
				 2:tube_value<=8'b11011011;
				 3:tube_value<=8'b11001111;
				 4:tube_value<=8'b11100110;
				 5:tube_value<=8'b11101101;
				 6:tube_value<=8'b11111101;
				 7:tube_value<=8'b10000111;
				 8:tube_value<=8'b11111111;
				 9:tube_value<=8'b11101111;
				 default:tube_value<=8'b10000000;
			endcase
		end
endmodule