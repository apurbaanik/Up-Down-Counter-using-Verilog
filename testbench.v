`timescale 1ns/1ps
module testbench();
reg clk = 0;
reg dir = 0;
wire [2:0] count_bin;
wire [2:0] count_grey;
wire [7:0] count_1hot;

binary U1(.clk(clk),.dir(dir),.count(count_bin));
graycode U2(.clk(clk),.dir(dir),.count(count_grey));
onehot U3(.clk(clk),.dir(dir),.count(count_1hot));

always
begin
	clk = ~clk;
	#5;
end

always
begin
	dir = ~dir;
	#100;
end
endmodule
