`timescale 1ns / 1ps
module alu_8bit(
	input [7:0] a,
	input [7:0] b,
	input [1:0] op_code,
	output [15:0] out,
	output c_out
);
	wire [7:0] add_result;
	wire [7:0] and_result;
	wire [15:0] mult_result;
	wire [7:0] or_result;
adder_8bit ADDER(
	.a(a),
	.b(b),
	.sum(add_result),
	.c_out(c_out)
	);
and_8bit And(
	.a(a),
	.b(b),
	.op(and_result)
	);
multi_8bit MUL(
	.a(a),
	.b(b),
	.p(mult_result)
	);
or_8bit OR(
	.a(a),
	.b(b),
	.op(or_result)
	);
mux_4bit MUX(
	.opcode(op_code),
	.add_answer(add_result),
	.mul_answer(mult_result),
	.or_answer(or_result),
	.and_answer(and_result),
	.final_answer(out)
	);

endmodule
