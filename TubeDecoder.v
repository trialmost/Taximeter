module TubeDecoder(
	decimal_value,
	tube_value
);
	input [3:0] decimal_value;
	output [7:0] tube_value;
	reg [7:0] tube_value;
	always @(decimal_value)
		begin
		    case(decimal_value)
			     0:tube_value<=8'b00111111;
				 1:tube_value<=8'b00000110;
				 2:tube_value<=8'b01011011;
				 3:tube_value<=8'b01001111;
				 4:tube_value<=8'b01100110;
				 5:tube_value<=8'b01101101;
				 6:tube_value<=8'b01111101;
				 7:tube_value<=8'b00000111;
				 8:tube_value<=8'b01111111;
				 9:tube_value<=8'b01101111;
				 default:tube_value<=8'b00000000;
			endcase
		end
endmodule