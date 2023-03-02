`timescale 1ns / 1ps


module tb_switchleds;

  // Inputs
  reg [15:0] sw;
  reg [3:0] btn;
  
  // Outputs
  wire [15:0] led;
  
  // Instantiate the DUT
  switchleds dut (
    .sw(sw),
    .btn(btn),
    .led(led)
  );
  
  // Clock generation
  reg clk = 0;
  always #5 clk = ~clk;
  
  // Simulate button presses and switch changes
  initial begin
    
    // Wait a few clock cycles
    #50;
    
    // Test group 1
    btn <= 4'b1110; // Press button 1 (group 1)
    sw <= 16'hFFFF; // All switches on
    #20;
    assert(led === 16'h0); // All group 1 LEDs off
    sw <= 16'h0000; // All switches off
    #20;
    assert(led === 16'hFFFF); // All group 1 LEDs on
    
    // Test group 2
    btn <= 4'b1101; // Press button 2 (group 2)
    sw <= 16'h00FF; // First 8 switches on
    #20;
    assert(led[15:8] === 8'h00); // Group 2 LEDs off
    assert(led[7:0] === 8'hFF); // Group 3 LEDs on
    sw <= 16'hFF00; // Last 8 switches on
    #20;
    assert(led[15:8] === 8'hFF); // Group 2 LEDs on
    assert(led[7:0] === 8'h00); // Group 3 LEDs off
    
    // Test group 3
    btn <= 4'b1011; // Press button 3 (group 3)
    sw <= 16'h5555; // Every other switch on
    #20;
    assert(led[15:12] === 4'h0); // Group 1 LEDs off
    assert(led[11:8] === 4'hF); // Group 2 LEDs on
    assert(led[7:4] === 4'h0); // Group 3 LEDs off
    assert(led[3:0] === 4'hF); // Group 4 LEDs on
    sw <= 16'hAAAA; // Every other switch off
    #20;
    assert(led[15:12] === 4'hF); // Group 1 LEDs on
    assert(led[11:8] === 4'h0); // Group 2 LEDs off
    assert(led[7:4] === 4'hF); // Group 3 LEDs on
    assert(led[3:0] === 4'h0); // Group 4 LEDs off
    
    // Test group 4
    btn <= 4'b0111; // Press button 4 (group 4)
    sw <= 16'hAAAA; // Every other switch off
    #20;
    assert(led === 16'hFFFF); // All group 4 LEDs on
    sw <= 16'h5555; // Every other switch on
    #20;
    assert(led === 16'h0); // All group 4 LEDs off
    
    $finish; // End the simulation
  end
  
endmodule
