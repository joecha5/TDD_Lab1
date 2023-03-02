`timescale 1ns / 1ps

module testbench_decoder_7seg;

  // parámetros
  parameter DISP_WIDTH = 7;
  
  // señales
  logic [3:0] in_bin;
  logic [DISP_WIDTH-1:0] out_disp;
  
  // instancia el DUT
  decoder_7seg dut(.in_bin(in_bin), .out_disp(out_disp));
  
  // prueba exhaustiva
  initial begin
    for(int i = 0; i < 16; i++) begin
      in_bin <= i;
      #1;
      case(i)
        4'h0: assert(out_disp === 7'b111_1110);
        4'h1: assert(out_disp === 7'b011_0000);
        4'h2: assert(out_disp === 7'b110_1101);
4'hE: assert(out_disp === 7'b100_1111);
4'hF: assert(out_disp === 7'b100_0111);
default: assert(out_disp === 7'b111_1111);
endcase
end
$display("Testbench completo!");
$finish;
end

endmodule
