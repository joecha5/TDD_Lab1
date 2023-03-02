`timescale 1ns / 1ps


module display_selector
  #(parameter DISP_WIDTH = 7)
  (input clk, // reloj
   input [1:0] btn, // botones de selección (00, 01, 10, 11)
   input [15:0] sw, // valores de entrada (sw1-4, sw5-8, sw9-12, sw13-16)
   output reg [DISP_WIDTH-1:0] out_disp); // valor hex en display
  
  // señales internas
  logic [3:0] in_bin;
  logic [1:0] sel;
  
  // instancia el decodificador
  decoder_7seg decoder(.in_bin(in_bin), .out_disp(out_disp));
  
  // asigna la entrada según el botón de selección
  always_comb begin
    case(btn)
      2'b00: in_bin = sw[3:0];
      2'b01: in_bin = sw[7:4];
      2'b10: in_bin = sw[11:8];
      2'b11: in_bin = sw[15:12];
    endcase
  end
  
  // asigna el selector según el botón de selección
  always_comb begin
    case(btn)
      2'b00: sel = 2'b00;
      2'b01: sel = 2'b01;
      2'b10: sel = 2'b10;
      2'b11: sel = 2'b11;
    endcase
  end
  
  // muestra el valor seleccionado en el display
  always @(posedge clk) begin
    case(sel)
      2'b00: out_disp <= decoder.out_disp;
      2'b01: out_disp <= decoder.out_disp;
      2'b10: out_disp <= decoder.out_disp;
      2'b11: out_disp <= decoder.out_disp;
    endcase
  end

endmodule
