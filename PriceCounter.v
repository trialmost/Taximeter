module PriceCounter(
	rst,
	distan_count,
	distan_count_thous,
	distan_count_hundr,
	distan_count_tens,
	distan_count_units,

	price_count_hundr,
	price_count_tens,
	price_count_units
	);
	input rst;
	input [13:0] distan_count;
	
	//路程的十进制位数的最高位和次高位
	wire [6:0] distan_count_thous_hundr;
	//路程的十进制位数的最低位和次低位
	wire [6:0] distan_count_tens_units;

	wire [6:0] price_count_hundr_tens;

	//路程的十进制位数的最高位
	output [3:0] distan_count_thous;
	wire [3:0] distan_count_thous;
	//路程的十进制位数的次高位
	output [3:0] distan_count_hundr;
	wire [3:0] distan_count_hundr;
	output [3:0] distan_count_tens;
	wire [3:0] distan_count_tens;
	output [3:0] distan_count_units;
	wire [3:0] distan_count_units;
	
	wire [6:0] price_count;
	output [3:0] price_count_hundr;
	wire [3:0] price_count_hundr;
	output [3:0] price_count_tens;
	wire [3:0] price_count_tens;
	output [3:0] price_count_units;
	wire [3:0] price_count_units;

	assign distan_count_thous_hundr=distan_count/100;
	assign distan_count_tens_units=distan_count%100;
	assign distan_count_thous=distan_count_thous_hundr/10;
	assign distan_count_hundr=distan_count_thous_hundr%10;
	assign distan_count_tens=distan_count_tens_units/10;
	assign distan_count_units=distan_count_tens_units%10;
	assign price_count=rst?(distan_count_thous>0?((distan_count_thous+2)*10+distan_count_hundr):30):0;
	assign price_count_hundr_tens=price_count/10;
	assign price_count_units=price_count%10;
	assign price_count_hundr=price_count_hundr_tens/10;
	assign price_count_tens=price_count_hundr_tens%10;

endmodule