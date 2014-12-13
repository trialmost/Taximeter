module DistanCounter(
	//电机每圈脉冲
	motor_cycle,
	rst,

	//路程计数
	count

	);
	input motor_cycle,rst;
	output [13:0] count;
	reg [13:0] count;
	always @(posedge motor_cycle or negedge rst)
	begin
		if(!rst) 
			begin
				count<=0;
			end
		else
			begin
				if(count!=9999) 
					begin
						count<=count+1;
					end
				else
					begin
						count<=0;
					end
			end
	end
endmodule