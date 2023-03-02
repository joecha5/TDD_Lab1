module switchleds (
    input wire [15:0] sw, // Entradas de los interruptores
    output reg [15:0] led,    // Salidas de los LEDs
    input wire [3:0] btn      // Entradas de los botones
);

    // Subdividir los interruptores en 4 grupos de 4
    wire [3:0] switch_group_0 = sw[3:0];
    wire [3:0] switch_group_1 = sw[7:4];
    wire [3:0] switch_group_2 = sw[11:8];
    wire [3:0] switch_group_3 = sw[15:12];
    
    // Determinar qué grupo de LEDs está apagado
    reg [3:0] led_group_disable;
    always @ (posedge btn) begin
        case(btn)
            4'h1: led_group_disable <= 4'b1110;  // Botón 0 presionado, LED group 0 apagado
            4'h2: led_group_disable <= 4'b1101;  // Botón 1 presionado, LED group 1 apagado
            4'h4: led_group_disable <= 4'b1011;  // Botón 2 presionado, LED group 2 apagado
            4'h8: led_group_disable <= 4'b0111;  // Botón 3 presionado, LED group 3 apagado
            default: led_group_disable <= 4'b0000;
        endcase
    end
    
    // Conectar cada grupo de interruptores a su correspondiente grupo de LEDs
    assign led[3:0]     = (switch_group_0 & ~led_group_disable[0]) | (~switch_group_0 & led_group_disable[0]);
    assign led[7:4]     = (switch_group_1 & ~led_group_disable[1]) | (~switch_group_1 & led_group_disable[1]);
    assign led[11:8]    = (switch_group_2 & ~led_group_disable[2]) | (~switch_group_2 & led_group_disable[2]);
    assign led[15:12]   = (switch_group_3 & ~led_group_disable[3]) | (~switch_group_3 & led_group_disable[3]);

endmodule
