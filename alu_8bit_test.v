`timescale 1ns / 1ps
`include "alu_8bit"
`include "adder_8bit"
`include "multi_8bit"
`include "and_8bit"
`include "or_8bit"
`include "mux_4bit"
module alu_8bit_test;

    // Inputs
    reg [7:0] a;
    reg [7:0] b;
    reg [1:0] op_code;

    // Outputs
    wire [15:0] out;
    wire c_out;

    // Instantiate the Unit Under Test (UUT)
    alu_8bit uut (
        .a(a), 
        .b(b), 
        .op_code(op_code), 
        .out(out), 
        .c_out(c_out)
    );

    initial begin
        // Initialize Inputs
        a = 0;
        b = 0;
        op_code = 0;

        // Dump file for waveform viewing
        $dumpfile("dump.vcd");
        $dumpvars(0);

        // Test cases
        #100 a = 8'b00000001; b = 8'b00000001; op_code = 2'b00; // Test AND addition
        #200 a = 8'b00001111; b = 8'b00001111; op_code = 2'b01; // Test OR multiplication
        #300 a = 8'b00000001; b = 8'b00000001; op_code = 2'b10; // Test ADD
        #400 a = 8'b00001111; b = 8'b00000001; op_code = 2'b11; // Test MUL

        #100 $finish; // End simulation
    end

   

endmodule
