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
    
    reg [10:0] ball_h;
    reg [10:0] ball_v;
    wire [10:0] ball_h_wire;
    wire [10:0] ball_v_wire;


    wire border = (PIXEL_V <= 4 || PIXEL_V >= 474 || PIXEL_H <= 4 || PIXEL_H >= 774);
    wire net = (PIXEL_V[4] == 1 && (PIXEL_H == 389 || PIXEL_H == 390));
    wire paddle = (PIXEL_H >= 10 && PIXEL_H <= 20 && PIXEL_V >= paddle_pos && PIXEL_V <= (paddle_pos + 75));
    wire ball = PIXEL_H >= ball_h && PIXEL_H <= (ball_h + 16) && PIXEL_V >= ball_v && PIXEL_V <= (ball_v + 16);


    // Paddle position
    always @ (posedge VGA_CLOCK) begin
        paddle_pos <= PADDLE_POSITION << 4;
    end
    

    // Ball 
    reg [16:0] ball_timer;
    reg [27:0] ball_timer_delay;
    reg ball_h_direction;
    reg ball_v_direction;
    always @ (posedge VGA_CLOCK or posedge RESET) begin
        if (RESET) begin 
            ball_h <= 390;
            ball_v <= 5; // low for test bench
            ball_h_direction <= 0;
            ball_v_direction <= 0;
            ball_timer <= 0;
            ball_timer_delay <= 0;
        end else begin
        
            if (ball_timer_delay > 0) begin
                ball_timer_delay <= ball_timer_delay -1;
            end
            else begin
                ball_timer <= ball_timer + 1;
            end
            
            // Only move the ball when timer says so.
            if (ball_timer == 17'd91071) begin 
                ball_timer <= 0;
                
                 // Move the ball
                if (ball_h_direction) begin
                    ball_h <= ball_h + 1;
                    // Right border collision
                    if (ball_h > 770) ball_h_direction <= 0;
                end
                else begin
                    ball_h <= ball_h - 1;
                    // Paddle detection
                    if (ball_h < 20) begin
                        if (ball_v >= paddle_pos && ball_v < (paddle_pos + 75)) begin
                            // Hit the paddle (todo score)
                            ball_h_direction <= 1;
                        end
                        else begin 
                            // Missed the paddle - new serve
                            ball_h <= 382;
                            //ball_v <= 240; 
                            ball_h_direction <= 0;
                            ball_timer_delay <= 28'd67108863;
                        end
                    end
                end
                
                if (ball_v_direction) begin
                    ball_v <= ball_v + 1;
                    // Bottom border collision
                    if (ball_v > 470) ball_v_direction <= 0;
                end
                else begin
                    ball_v <= ball_v - 1;
                    // Top border collision
                    if (ball_v < 4) ball_v_direction <= 1;
                end
                
                
            end
        end
    end
    
    
    // Draw the pixel for the requested vga location.
    always @ (posedge VGA_CLOCK) begin
        if (paddle) begin
            pixel <= 3'b111; // white paddle
        end
        else if (border) begin
            pixel <= 3'b100; // red border
        end
        else if (ball && ball_timer_delay == 0) begin
            pixel <= 3'b001; // blue ball
        end
        else if (net) begin
            pixel <= 3'b110; // yellow net
        end
        
        else begin
            pixel <= 3'b000; // black
        end
        
    end

    assign PIXEL = pixel;
endmodule
