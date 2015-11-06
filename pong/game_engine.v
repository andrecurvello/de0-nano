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

    always @ (posedge VGA_CLOCK) begin
        // Draw a border 
        if (PIXEL_V == 0 || PIXEL_V == 478 || PIXEL_H == 0 || PIXEL_H == 780) begin
            pixel <= 3'b100; // red 1 pixel border
        end

        else begin
        
            // The paddle lives at row 700 and is 50 x 20 pixels.
            // The paddle is referenced from its top left corner 0,0
            // to its bottom right corner 50,20
            if (PIXEL_H >= 700 && PIXEL_H <= 750) begin
                // Now within the paddle's region.
                if (PIXEL_V >= PADDLE_POSITION && PIXEL_V <= (PADDLE_POSITION + 50)) begin
                    // Within the paddle.
                    pixel <= 3'b111; // white paddle
                end
                else begin
                    //pixel <= 3'b100; // background
                end
            end
            
            else begin
                pixel <= 3'b000; // background (black)
            end
            
        end
    end

    assign PIXEL = pixel;
endmodule
