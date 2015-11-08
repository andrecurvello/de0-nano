/**
 * Reads the input and passes it to the game engine.
 *
 */
 
module player(
    CLOCK, 
    RESET,
    A, 
    B,
    POSITION
);
    input CLOCK, RESET, A, B;
    output [7:0] POSITION;
    
    wire [3:0] speed;
    wire direction;
    wire count_enable;
    
    // Read the rotary encoder.
    quadrature_decoder quad_1(
        CLOCK, 
        RESET,
        A, 
        B, 
        count_enable,
        direction, 
        speed
    );
    

    reg [7:0] total;
    always @(posedge CLOCK or posedge RESET) begin
        if (RESET) begin 
            total <= 0;
        end 
        // Change the total only if a valid change has happened on the rotary encoder.
        else if (count_enable) begin
            // only want a final count between 0 & 27 (x4 for the clicks)
            if (direction && total < 8'd109) begin 
                total <= total + 8'd1; 
            end
            else if (total > 0) begin 
                total <= total - 8'd1;
            end
        end
    end
    
    
    wire [7:0] clicks;
    assign clicks = total >> 2; // divide by 4 as the encoder has 4 edges per "click"
    assign POSITION = clicks[7:0];

endmodule
