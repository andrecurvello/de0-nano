/**
 * Generates the current game screen contents.
 */
 
 module game_engine (
    RESET,
    SYSTEM_CLOCK,
    VGA_CLOCK,
    PADDLE_POSITION,
    PIXEL_H,
    PIXEL_V,
    PIXEL
 );
    input RESET;
    input SYSTEM_CLOCK;
    input VGA_CLOCK;
    input [7:0] PADDLE_POSITION;
    input [10:0] PIXEL_H;
    input [10:0] PIXEL_V;
    output [2:0] PIXEL; // 1 red, 1 green, 1 blue

    reg [2:0] pixel;
    reg [10:0] paddle_pos;


    // Border logic
    reg border;
    always @ (posedge VGA_CLOCK) begin
        if (PIXEL_V == 0 || PIXEL_V == 478 || PIXEL_H == 0 || PIXEL_H == 778) begin
            border <= 1;
        end
        else begin
            border <= 0;
        end
    end
    
    // Net logic
    reg net;
    always @ (posedge VGA_CLOCK) begin
        if (PIXEL_V[4] == 1 && (PIXEL_H == 389 || PIXEL_H == 390)) begin
            net <= 1;
        end
        else begin
            net <= 0;
        end
    end
    
    // Paddle position
    always @ (posedge SYSTEM_CLOCK) begin
        paddle_pos <= PADDLE_POSITION << 4;
    end
    
    // Paddle logic
    reg paddle;
    always @ (posedge VGA_CLOCK) begin
        // The paddle lives at row 10 and is 20 x 50 pixels.
        // The paddle is referenced from its top left corner 0,0
        // to its bottom right corner 20,50
        if (PIXEL_H >= 10 && PIXEL_H <= 20) begin
            // Now within the paddle's region.
            if (PIXEL_V >= paddle_pos && PIXEL_V <= (paddle_pos + 50)) begin
                // Within the paddle.
                paddle <= 1;
            end
        end
        // No paddle at this pixel.
        else begin
            paddle <= 0;
        end
    end
    
    // Draw the pixel for the requested vga location.
    always @ (posedge VGA_CLOCK) begin
        if (border) begin
            pixel <= 3'b100; // red border
        end
        else if (net) begin
            pixel <= 3'b110; // yellow net
        end
        else if (paddle) begin
            pixel <= 3'b111; // white paddle
        end
        else begin
            pixel <= 3'b000; // black
        end
        
    end

    assign PIXEL = pixel;
endmodule
