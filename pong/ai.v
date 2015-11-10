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
    POSITION
);
    input CLOCK, RESET;
    output [7:0] POSITION;
    
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
    
    reg [7:0] paddle;
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
