`timescale 1ns / 1ps


module decoder_7seg
  #(parameter DISP_WIDTH = 7)
  (input [3:0] in_bin,  // valor binario de entrada
   output reg [DISP_WIDTH-1:0] out_disp); // valor hex en display
  
  always_comb begin
    case(in_bin)
      4'b0000: out_disp = 7'b111_1110; // 0
      4'b0001: out_disp = 7'b011_0000; // 1
      4'b0010: out_disp = 7'b110_1101; // 2
      4'b0011: out_disp = 7'b111_1001; // 3
      4'b0100: out_disp = 7'b011_0011; // 4
      4'b0101: out_disp = 7'b101_1011; // 5
      4'b0110: out_disp = 7'b101_1111; // 6
      4'b0111: out_disp = 7'b111_0000; // 7
      4'b1000: out_disp = 7'b111_1111; // 8
      4'b1001: out_disp = 7'b111_1011; // 9
      4'b1010: out_disp = 7'b111_0111; // A
      4'b1011: out_disp = 7'b001_1111; // b
      4'b1100: out_disp = 7'b100_1110; // C
      4'b1101: out_disp = 7'b011_1101; // d
      4'b1110: out_disp = 7'b100_1111; // E
      4'b1111: out_disp = 7'b100_0111; // F
      default: out_disp = 7'b111_1111; // error, muestra un 8 en el display
    endcase
  end

endmodule
