`timescale 1ns / 1ps


module RCA #(parameter WORD_SIZE=8) (input [WORD_SIZE-1:0] a, input [WORD_SIZE-1:0] b, input cin, output [WORD_SIZE-1:0] sum, output cout);

    wire [WORD_SIZE:0] carry; // Una línea extra para almacenar los acarreos entre los sumadores

    // Instanciamos los sumadores completos de 1 bit
    genvar i;
    generate
        for(i=0; i<WORD_SIZE; i=i+1) begin : adder
            full_adder fa(.a(a[i]), .b(b[i]), .cin(carry[i]), .sum(sum[i]), .cout(carry[i+1]));
        end
    endgenerate
    
    assign cout = carry[WORD_SIZE];

endmodule

