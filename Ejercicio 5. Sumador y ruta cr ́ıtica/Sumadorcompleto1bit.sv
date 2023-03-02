`timescale 1ns / 1ps

module full_adder(
    input bit a,
    input bit b,
    input bit carry_in,
    output bit sum,
    output bit carry_out
);

assign sum = a ^ b ^ carry_in;
assign carry_out = (a & b) | (carry_in & (a ^ b));

endmodule


