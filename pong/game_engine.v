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


    wire border = (PIXEL_V <= 4 || PIXEL_V >= 474 || PIXEL_H <= 4 || PIXEL_H >= 774);
    wire net = (PIXEL_V[4] == 1 && (PIXEL_H == 389 || PIXEL_H == 390));
    wire paddle = (PIXEL_H >= 10 && PIXEL_H <= 20 && PIXEL_V >= paddle_pos && PIXEL_V <= (paddle_pos + 75));
    wire ball = PIXEL_H >= ball_h && PIXEL_H <= (ball_h + 16) && PIXEL_V >= ball_v && PIXEL_V <= (ball_v + 16);


    // Paddle position
    always @ (posedge VGA_CLOCK) begin
        paddle_pos <= PADDLE_POSITION << 4;
    end
    

    // Ball position
    reg [16:0] ball_timer;
    /*
    always @ (posedge VGA_CLOCK or posedge RESET) begin
        if (RESET) begin 
            ball_timer <= 0;
        end 
        else begin
            ball_timer <= ball_timer + 1;
        end
    end
    */
    
    reg ball_h_direction;
    reg ball_v_direction;
    
    /*
    always @ (ball or paddle or border) begin
        if (ball & border) begin
            ball_v_direction = ~ball_v_direction;
            ball_h_direction = ~ball_h_direction;
        end
    end
    */
    /*
    always @ (ball_h or ball_v or ball_v_direction or ball_h_direction or paddle or border) begin
        if (ball_v == 474 || ball_v == 1) begin
            ball_v_direction = ~ball_v_direction;
        end
        if (ball_h == 774 || ball_h == 1) begin
            ball_h_direction = ~ball_h_direction;
        end
    end
    */
    /*
    always @ (posedge VGA_CLOCK or posedge RESET) begin
        if (RESET) begin 
            ball_h_direction <= 0;
            ball_v_direction <= 0;
        end else begin
            if (ball_v == 474 || ball_v == 1) begin
                ball_v_direction <= ~ball_v_direction;
            end 
            else if (ball_h == 774 || ball_h == 1) begin
                ball_h_direction <= ~ball_h_direction;
            end
        end
    end
    */
    always @ (posedge VGA_CLOCK or posedge RESET) begin
        if (RESET) begin 
            ball_h <= 390;
            ball_v <= 5; // low for test bench
            ball_h_direction <= 0;
            ball_v_direction <= 0;
            ball_timer <= 0;
        end else begin
            ball_timer <= ball_timer + 1;
        
            // Only move the ball when timer says so.
            if (ball_timer == 17'd91071) begin 
                ball_timer <= 0;
            
                if (ball_v >= 470 || ball_v <= 4) begin
                    ball_v_direction = ~ball_v_direction; //  blocking
                end
                if (ball_h >= 770 ) begin
                    ball_h_direction = ~ball_h_direction; //  blocking
                end
                if (ball_h <= 20 && ball_v >= paddle_pos && ball_v <= (paddle_pos + 75)) begin
                    ball_h_direction = ~ball_h_direction; //  blocking
                end
                if (ball_h < 15) begin
                    // Missed the ball; serve a new one. 
                    ball_h <= 390;
                    ball_v <= 240;
                    ball_h_direction = 1;
                    ball_v_direction = 1;
                end
                
                
                 // Move the ball
                else if (ball_h_direction) begin
                    ball_h <= ball_h + 1;
                end
                else begin
                    ball_h <= ball_h - 1;
                end
                
                if (ball_v_direction) begin
                    ball_v <= ball_v + 1;
                end
                else begin
                    ball_v <= ball_v - 1;
                end
                
                
            end
        end
    end
    
    
    // Draw the pixel for the requested vga location.
    always @ (posedge VGA_CLOCK) begin
        if (border) begin
            pixel <= 3'b100; // red border
        end
        else if (ball) begin
            pixel <= 3'b001; // blue ball
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
