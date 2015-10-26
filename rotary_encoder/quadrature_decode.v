/*
 * Read rotary/quadrature encoder using no clock
 *
 * Implementation of https://github.com/theapi/hdd_rotary_encoder/blob/master/HDDRotaryEncoder/HDDRotaryEncoder.ino
 *
 */

module quadrature_decode(
    reset,
    quadA, 
    quadB, 
    count
);
    input reset, quadA, quadB;
    output [15:0] count;

    reg [3:0] combined; // previous & current readings
    reg [1:0] num;

    always @ (reset)
    begin
        combined = 4'b0000;
        num = 0;
    end

    always @ (quadA or quadB)
    begin
        // combine current with previous
        // left shift 
        combined << 2;
        combined = combined | {quadA, quadB};
        num = 0;
        case (combined)
            4'b0000 : num = 0;
            4'b0001 : num = -1;
            4'b0010 : num = 1;
            4'b0011 : num = 0;

            4'b0100 : num = 1;
            4'b0101 : num = 0;
            4'b0110 : num = 0;
            4'b0111 : num = -1;

            4'b1000 : num = -1;
            4'b1001 : num = 0;
            4'b1010 : num = 0;
            4'b1011 : num = 1;

            4'b1100 : num = 0;
            4'b1101 : num = 1;
            4'b1110 : num = -1;
            4'b1111 : num = 0;
        endcase

        count = count + num;
    end


endmodule
