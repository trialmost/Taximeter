module Taximeter(
	clk,
	motor_cycle,
	rst,
	tube_11bit
	);
	input clk,motor_cycle,rst;
	wire [3:0] distan_count_thous,
				distan_count_hundr,
				distan_count_tens,
				distan_count_units,
				price_count_hundr,
				price_count_tens,
				price_count_units;
	wire [13:0] distan_count;
	output [10:0] tube_11bit;
	//计程模块
	DistanCounter dcnt(
		.motor_cycle(motor_cycle),
		.rst(rst),
		.count(distan_count)
		);
	//计费模块
	PriceCounter pcnt(
		.rst(rst),
		.distan_count(distan_count),
		.distan_count_thous(distan_count_thous),
		.distan_count_hundr(distan_count_hundr),
		.distan_count_tens(distan_count_tens),
		.distan_count_units(distan_count_units),

		.price_count_hundr(price_count_hundr),
		.price_count_tens(price_count_tens),
		.price_count_units(price_count_units)
		);
	//数码管显示模块
	TubeControl tbctrl(
		.clk(clk),
		.distan_count_thous(distan_count_thous),
		.distan_count_hundr(distan_count_hundr),
		.distan_count_tens(distan_count_tens),
		.distan_count_units(distan_count_units),
		.price_count_hundr(price_count_hundr),
		.price_count_tens(price_count_tens),
		.price_count_units(price_count_units),
		.tube_11bit(tube_11bit)
		);
endmodule