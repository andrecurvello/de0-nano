
module leds (
    input i_ready,
    input [7:0] i_count,
    output led_0,
    output led_1,
    output led_2,
    output led_3,
    output led_4,
    output led_5,
    output led_6,
    output led_7
);

    reg [7:0] latch;
    wire [7:0] leds;
    
    assign leds = latch;
    
    always @ (posedge i_ready) begin
        latch <= i_count;
    end

    assign led_0 = leds[0];
    assign led_1 = leds[1];
    assign led_2 = leds[2];
    assign led_3 = leds[3];
    assign led_4 = leds[4];
    assign led_5 = leds[5];
    assign led_6 = leds[6];
    assign led_7 = leds[7];
    
endmodule
