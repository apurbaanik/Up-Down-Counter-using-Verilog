module binary(input clk, input dir, output reg [2:0] count);
parameter S0 = 0, S1 = 1, 
	  S2 = 2, S3 = 3, 
	  S4 = 4, S5 = 5, 
	  S6 = 6, S7 = 7;

reg [2:0] state = 0;

always @(posedge clk)
begin
	case(state)
	S0:begin
	if(dir==1'b1)
		state <=  S1;
	else
		state <= S7;
	end
	S1:begin
	if(dir==1'b1)
		state <=  S2;
	else
		state <= S0;
	end
	S2:begin
	if(dir==1'b1)
		state <=  S3;
	else
		state <= S1;
	end
	S3:begin
	if(dir==1'b1)
		state <=  S4;
	else
		state <= S2;
	end
	S4:begin
	if(dir==1'b1)
		state <=  S5;
	else
		state <= S3;
	end
	S5:begin
	if(dir==1'b1)
		state <=  S6;
	else
		state <= S4;
	end
	S6:begin
	if(dir==1'b1)
		state <=  S7;
	else
		state <= S5;
	end
	S7:begin
	if(dir==1'b1)
		state <=  S0;
	else
		state <= S6;
	end
	default:begin
		state <= 0;
	end
	endcase
end

always@(state)
begin
	if (state == S0)
		count <= 3'b000;
	else if (state == S1)
		count <= 3'b001;
	else if (state == S2)
		count <= 3'b010;
	else if(state == S3)
		count <= 3'b011;
	else if (state == S4)
		count <= 3'b100;
	else if (state == S5)
		count <= 3'b101;
	else if (state == S6)
		count <= 3'b110;
	else if (state == S7)
		count <= 3'b111;
end
endmodule
