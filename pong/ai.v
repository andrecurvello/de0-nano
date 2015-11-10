/**
 * The computer player - AI :)
 */

/*

800 x 480 screen with net at 390

distance from net to ai paddle = 380
height = 474

There can be only one bounce as the height is more then the width.
For ball_h moving to the top of the screen ( ball_h <= ball_h -1):
    If ball_h - ball_v > 0 then there'll be a bounce 
    If bounce, the paddle position should be ball_h - ball_v
_________
     *  |
    * * |
   *   *|
  *     |
 *
*

For ball_h moving to the bottom of the screen ( ball_h <= ball_h +1):
    If ball_h + ball_v > 474 then there'll be a bounce 
    If bounce, the paddle position should be ball_v - ball_h

*       |
 *      |
  *     |
   *   *|
    * * |
     *  |
_________

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
    
    reg [7:0] paddle;
    
    reg [27:0] timer;
    always @ (posedge CLOCK or posedge RESET) begin
        if (RESET) begin
            timer <= 0;
        end else begin
            if (timer == 28'd12421770) begin
                timer <= 0;
            end else begin
                timer <= timer + 1;
            end
        end 
    end
    
    reg ball_direction;
    reg [10:0] ball_v_net;
    always @ (posedge CLOCK or posedge RESET) begin
        if (RESET) begin
            ball_direction <= 0;
        end else begin
            if (BALL_H == 11'd390) begin
                // Remember the ball's vertical location 
                // so we can determin the direction on the next ball move.
                ball_v_net <= BALL_V;
            end else if (BALL_H == 11'd391) begin
                if (BALL_V > ball_v_net) begin
                    ball_direction <= 1;
                end else begin
                    ball_direction <= 0;
                end
            end
        end 
    end
    
    /*
    always @ (posedge CLOCK) begin
        if (BALL_H == 11'd392) begin
            paddle <= BALL_V;
            // Calculate where the ball will be now we have ball direction.
            if (ball_direction && BALL_H - BALL_V > 0) begin
                //paddle <= BALL_H - BALL_V;
            //end else if (!ball_direction && BALL_H + BALL_V > 474 ) begin
            //    paddle <= BALL_V - BALL_H;
            end else begin
                //paddle <= BALL_V;
            end
        end
    end
    */
    
    
    // Just move up & down for now.
    reg direction;
    always @ (posedge CLOCK or posedge RESET) begin
        if (RESET) begin
            direction <= 1;
        end else begin
            // 0 to 25
            if (direction == 1 && paddle == 8'd25) begin
                direction <= 0;
            end else if (direction == 0 && paddle == 8'd0) begin
                direction <= 1;
            end
        end
    end
    
    always @ (posedge CLOCK or posedge RESET) begin
        if (RESET) begin
            paddle <= 8'd13;
        end else begin
            if (timer == 0) begin
                if (direction == 1) begin
                    paddle <= paddle + 8'd1;
                end else begin
                    paddle <= paddle - 8'd1;
                end
            end
        end
    end
    
    
    assign POSITION = paddle; 
    
endmodule
