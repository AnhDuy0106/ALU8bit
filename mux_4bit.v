`timescale 1ns / 1ps
module mux_4bit(
     input [1:0]opcode,
	 input [7:0]add_answer,
	 input [15:0]mul_answer,
	 input [7:0]and_answer,
	 input [7:0]or_answer,
	 output reg [15:0]final_answer
	 );
	 reg [1:0]x;

	 always@(*) begin
		assign x = opcode;
		case(x[1:0])
          	2'b00:	assign final_answer={ {8{and_answer[7]} } , and_answer };
          	2'b01:	assign final_answer={ {8{or_answer[7]} } , or_answer };
			2'b10:	assign final_answer={ {8{add_answer[7]} } , add_answer };
			2'b11:	assign final_answer= mul_answer;
	
		endcase
	end
		
endmodule
