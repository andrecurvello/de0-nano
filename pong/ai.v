/**
 * The computer player - AI :)
 */

module ai (
    CLOCK, 
    RESET,
    POSITION,
    BALL_H,
    BALL_V
);
    input CLOCK, RESET;
    input [10:0] BALL_H;
    input [10:0] BALL_V;
    output [7:0] POSITION;
    
    reg [10:0] paddle;
    
    
    // Just follow the ball.
    always @ (posedge CLOCK or posedge RESET) begin
        if (RESET) begin
            paddle <= 0;
        end else begin
            if (BALL_V < 11'd32) begin
                // top of the screen
                paddle <= 0;
            end else if (BALL_V > 11'd432) begin
                // bottom of the screen
                paddle <= 11'd400;
            end else begin
                // Center on the ball
                paddle <= BALL_V - 11'd32;
            end
        end
    end
    
/*
    reg [27:0] timer;
    always @ (posedge CLOCK or posedge RESET) begin
        if (RESET) begin
            timer <= 0;
        end else begin
            if (timer == 28'd500000) begin
                timer <= 0;
            end else begin
                timer <= timer + 1;
            end
        end 
    end
*/  
    
    wire [10:0] final_paddle_pos = paddle >> 1; // divide by two to fit in the byte of the POSITION (2px resolution)
    assign POSITION = final_paddle_pos[7:0]; 
    
endmodule
