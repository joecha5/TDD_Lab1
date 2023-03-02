`timescale 1ns / 1ps


module testbench;

reg a, b, carry_in;
wire sum, carry_out;

full_adder uut(
    .a(a),
    .b(b),
    .carry_in(carry_in),
    .sum(sum),
    .carry_out(carry_out)
);

initial begin
    $monitor("a=%b, b=%b, carry_in=%b, sum=%b, carry_out=%b",
        a, b, carry_in, sum, carry_out);
        
    // Test case 1: a=0, b=0, carry_in=0
    a = 0; b = 0; carry_in = 0;
    #10;
    
    // Test case 2: a=0, b=1, carry_in=0
    a = 0; b = 1; carry_in = 0;
    #10;
    
    // Test case 3: a=1, b=0, carry_in=0
    a = 1; b = 0; carry_in = 0;
    #10;
    
    // Test case 4: a=1, b=1, carry_in=0
    a = 1; b = 1; carry_in = 0;
    #10;
    
    // Test case 5: a=0, b=0, carry_in=1
    a = 0; b = 0; carry_in = 1;
    #10;
    
    // Test case 6: a=0, b=1, carry_in=1
    a = 0; b = 1; carry_in = 1;
    #10;
    
    // Test case 7: a=1, b=0, carry_in=1
    a = 1; b = 0; carry_in = 1;
    #10;
    
    // Test case 8: a=1, b=1, carry_in=1
    a = 1; b = 1; carry_in = 1;
    #10;
    
    $finish;
end

endmodule