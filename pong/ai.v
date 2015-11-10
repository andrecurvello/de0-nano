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
    
    // Pretty dumb so far.
    assign POSITION = 8'd15; 
    
endmodule
