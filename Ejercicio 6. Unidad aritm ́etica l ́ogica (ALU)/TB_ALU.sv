`timescale 1ns / 1ps


module alu_testbench;

  // Inputs
  logic [3:0] A, B;
  logic [3:0] ALUControl;
  logic ALUFlagIn;
  
  // Outputs
  logic [3:0] ALUResult;
  logic [2:0] ALUFlags;
  
  // Instantiate ALU module
  alu #(.N(4)) dut(
    .A(A),
    .B(B),
    .ALUControl(ALUControl),
    .ALUFlagIn(ALUFlagIn),
    .ALUResult(ALUResult),
    .ALUFlags(ALUFlags)
  );
  
  initial begin
    // Test addition
    A = 4'b0010;
    B = 4'b0110;
    ALUControl = 4'h2; // Sum operation
    ALUFlagIn = 1'b0;
    #1 $display("Result of %d + %d = %d", A, B, ALUResult);
    
    // Test subtraction
    A = 4'b1101;
    B = 4'b0110;
    ALUControl = 4'h6; // Subtraction operation
    ALUFlagIn = 1'b1;
    #1 $display("Result of %d - %d = %d", A, B, ALUResult);
    
    // Test AND
    A = 4'b1010;
    B = 4'b0110;
    ALUControl = 4'h0; // AND operation
    ALUFlagIn = 1'b0;
    #1 $display("Result of %d AND %d = %d", A, B, ALUResult);
    
    // Test OR
    A = 4'b1010;
    B = 4'b0110;
    ALUControl = 4'h1; // OR operation
    ALUFlagIn = 1'b0;
    #1 $display("Result of %d OR %d = %d", A, B, ALUResult);
    
    // Display ALU flags
    #1 $display("ALU flags: C=%d, V=%d, Z=%d", ALUFlags[2], ALUFlags[1], ALUFlags[0]);
    
    // End simulation
    #1 $finish;
  end
  
endmodule
