module TubeControl(
	clk,
	distan_count_thous,
	distan_count_hundr,
	distan_count_tens,
	distan_count_units,

	price_count_hundr,
	price_count_tens,
	price_count_units,
	tube_11bit
	);
	input clk;
	input [3:0] distan_count_thous,
				distan_count_hundr,
				distan_count_tens,
				distan_count_units,
				price_count_hundr,
				price_count_tens,
				price_count_units;
	wire [7:0] distan_count_thous_tube,
				distan_count_hundr_tube,
				distan_count_tens_tube,
				distan_count_units_tube,
				price_count_hundr_tube,
				price_count_tens_tube,
				price_count_units_tube;
	output [10:0] tube_11bit;
	reg [10:0] tube_11bit;
	TubeDecoderDecimal tdd_distan_thous(
		.decimal_value(distan_count_thous),
		.tube_value(distan_count_thous_tube)
		);
	TubeDecoder td_distan_hundr(
		.decimal_value(distan_count_hundr),
		.tube_value(distan_count_hundr_tube)
		);
	TubeDecoder td_distan_tens(
		.decimal_value(distan_count_tens),
		.tube_value(distan_count_tens_tube)
		);
	TubeDecoder td_distan_units(
		.decimal_value(distan_count_units),
		.tube_value(distan_count_units_tube)
		);
	TubeDecoder td_price_hundr(
		.decimal_value(price_count_hundr),
		.tube_value(price_count_hundr_tube)
		);
	TubeDecoderDecimal tdd_price_tens(
		.decimal_value(price_count_tens),
		.tube_value(price_count_tens_tube)
		);
	TubeDecoder td_price_units(
		.decimal_value(price_count_units),
		.tube_value(price_count_units_tube)
		);

	always @(posedge clk)
		begin
			if(tube_11bit[10:8]<8) begin
				tube_11bit[10:8]<=tube_11bit[10:8]+1;
			end
			else
				tube_11bit[10:8]<=0;
		end
	always @(tube_11bit[10:8])
		case (tube_11bit[10:8])
			0:tube_11bit[7:0]<=distan_count_thous_tube;
			1:tube_11bit[7:0]<=distan_count_hundr_tube;
			2:tube_11bit[7:0]<=distan_count_tens_tube;
			3:tube_11bit[7:0]<=distan_count_units_tube;
			4:tube_11bit[7:0]<=8'H73;
			5:tube_11bit[7:0]<=price_count_hundr_tube;
			6:tube_11bit[7:0]<=price_count_tens_tube;
			7:tube_11bit[7:0]<=price_count_units_tube;
			default:tube_11bit[7:0]<=8'H3F;
		endcase
endmodule