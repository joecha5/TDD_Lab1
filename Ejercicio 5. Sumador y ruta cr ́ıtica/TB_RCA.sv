`timescale 1ns / 1ps


module testbench;

  // Parámetros del módulo RCA
  parameter WIDTH = 8;

  // Señales de entrada del testbench
  logic [WIDTH-1:0] A, B;
  logic Cin;

  // Señales de salida del testbench
  logic [WIDTH:0] Sum;
  logic Cout;

  // Instanciamos el módulo RCA
  RCA #(.WIDTH(WIDTH)) dut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
  );

  initial begin
    // Generamos todas las posibles combinaciones de entrada
    for(int i=0; i<(1<<WIDTH); i++) begin
      A = i;
      for(int j=0; j<(1<<WIDTH); j++) begin
        B = j;
        for(int k=0; k<2; k++) begin
          Cin = k;

          // Esperamos un ciclo de reloj para que se actualicen las salidas
          #1;

          // Comprobamos que la suma es correcta
          assert(Sum == A + B + Cin);

          // Comprobamos que el acarreo de salida es correcto
          if (A + B + Cin >= (1<<WIDTH)) begin
            assert(Cout == 1);
          end else begin
            assert(Cout == 0);
          end
        end
      end
    end
    $display("Testbench completado");
    $finish;
  end
endmodule
