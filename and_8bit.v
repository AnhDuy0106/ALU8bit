`timescale 1ns / 1ps
module and_8bit(
	input [7:0] a,
	input [7:0] b,
	output reg [7:0] op
);

	integer i;
	
	always @(*) begin
		for(i=0; i<8; i=i+1) begin
			op[i] = a[i] & b[i];
		end
	end

endmodule
