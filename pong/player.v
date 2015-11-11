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
    

    reg [15:0] total;
    always @(posedge CLOCK or posedge RESET) begin
        if (RESET) begin 
            total <= 0;
        end 
        // Change the total only if a valid change has happened on the rotary encoder.
        else if (count_enable) begin
            // Max 200 (x4 for the clicks)
            if (direction && total < 16'd800) begin 
                total <= total + 16'd1; 
            end
            else if (total > 0) begin 
                total <= total - 16'd1;
            end
        end
    end
    
    wire [15:0] clicks;
    assign clicks = (total >> 2) << 3; // divide by 4 as the encoder has 4 edges per "click", then multiply by 8 to move faster
    
    reg [7:0] position;
    always @(posedge CLOCK) begin
        if (clicks > 8'd200) begin
            position <= 8'd200;
        end else begin
            position <= clicks[7:0];
        end
    end
    
    
    assign POSITION = position;

endmodule
