`timescale 1ns / 1ps

  module tb_mux4_1;

  // Parámetros
  parameter WIDTH_IN = 16;  // Ancho de bus de entrada
  parameter WIDTH_OUT = 16; // Ancho de bus de salida

  // Señales de entrada y salida
  logic [WIDTH_IN-1:0] in0, in1, in2, in3;
  logic [1:0] sel;
  logic [WIDTH_OUT-1:0] out;

  // Instancia del multiplexor
  mux4_1 #(WIDTH_IN, WIDTH_OUT) mux_inst (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .sel(sel),
    .out(out)
  );

  // Generación de señales de prueba
  initial begin
    // Anchura de bus de entrada y salida de 4 bits
    $display("Prueba de ancho de bus de entrada y salida de 4 bits:");
    for (int i = 0; i < 50; i++) begin
      in0 = $urandom_range(16'h00, 16'h0F);
      in1 = $urandom_range(16'h00, 16'h0F);
      in2 = $urandom_range(16'h00, 16'h0F);
      in3 = $urandom_range(16'h00, 16'h0F);
      for (int j = 0; j < 4; j++) begin
        sel = j;
        #1 $display("in0 = %0h, in1 = %0h, in2 = %0h, in3 = %0h, sel = %0d, out = %0h", 
                   in0, in1, in2, in3, sel, out);
      end
    end

    // Anchura de bus de entrada y salida de 8 bits
    $display("Prueba de ancho de bus de entrada y salida de 8 bits:");
    for (int i = 0; i < 50; i++) begin
      in0 = $urandom_range(16'h00, 16'hFF);
      in1 = $urandom_range(16'h00, 16'hFF);
      in2 = $urandom_range(16'h00, 16'hFF);
      in3 = $urandom_range(16'h00, 16'hFF);
      for (int j = 0; j < 4; j++) begin
        sel = j;
        #1 $display("in0 = %0h, in1 = %0h, in2 = %0h, in3 = %0h, sel = %0d, out = %0h", 
                   in0, in1, in2, in3, sel, out);
      end
    end

    // Anchura de bus de entrada y salida de 16 bits
    $display("Prueba de ancho de bus de entrada y salida de 16 bits:");
    for (int i = 0; i < 50; i++) begin
in0 = $urandom_range(16'h0000, 16'hFFFF);
in1 = $urandom_range(16'h0000, 16'hFFFF);
in2 = $urandom_range(16'h0000, 16'hFFFF);
in3 = $urandom_range(16'h0000, 16'hFFFF);
for (int j = 0; j < 4; j++) begin
sel = j;
#1 $display("in0 = %0h, in1 = %0h, in2 = %0h, in3 = %0h, sel = %0d, out = %0h",
in0, in1, in2, in3, sel, out);
end
end
end

endmodule
