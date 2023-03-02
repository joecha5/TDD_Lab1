`timescale 1ns / 1ps


module alu #(parameter n = 8)(input [n-1:0] A, input [n-1:0] B, input [3:0] ALUControl, input ALUFlagIn,
output reg [n-1:0] ALUResult, output reg [3:0] ALUFlags, output reg C);

reg [n:0] A_extended;
reg [n:0] B_extended;
reg [n+1:0] result;

// Extend the input operands to handle overflow in operations
assign A_extended = {A[n-1], A};
assign B_extended = {B[n-1], B};

// Select the operation to perform based on the ALUControl
always @(*) begin
case (ALUControl)
4'h0: result = A & B;
4'h1: result = A | B;
4'h2: result = A_extended + B_extended;
4'h3: result = A + 1;
4'h4: result = A - 1;
4'h5: result = ~A;
4'h6: result = A_extended - B_extended;
4'h7: result = A ^ B;
4'h8: result = {ALUFlagIn, A} << 1;
4'h9: result = {A, ALUFlagIn} >> 1;
default: result = 0;
endcase
end

// Extract the flags from the result
always @(*) begin
ALUResult = result[n-1:0];
C = result[n+1];
if (ALUResult == 0) begin
ALUFlags[0] = 1; // set the Zero flag if the result is zero
end else begin
ALUFlags[0] = 0;
end
ALUFlags[1] = C; // set the Carry flag
ALUFlags[2] = 0; // clear the Negative flag
ALUFlags[3] = 0; // clear the Overflow flag
end
endmodule