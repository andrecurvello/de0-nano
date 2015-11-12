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
    
    reg [8:0] paddle;
    
    // Just follow the ball.
    always @ (posedge CLOCK) begin
        // after it passes the net 
        if (BALL_H > 11'd391) begin
            paddle <= BALL_V;
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
*/
    
    /*
    // WIDTH (from net) = 390
    // HEIGHT = 470
    always @ (posedge CLOCK) begin
        if (BALL_H == 11'd392) begin
            // Calculate where the ball will be, now we have ball direction.
            if (ball_direction) begin
                // paddle <= HEIGHT - (WIDTH - BALL_V) - 1;
                // paddle <= 8'd470 - (8'd390 - BALL_V) - 8'd1;
                paddle <= 8'd469 - (8'd390 - BALL_V);
            end else begin
                // paddle <= WIDTH - BALL_V - 1;
                // paddle <= 8'd390 - BALL_V - 1;
                paddle <= 8'd389 - BALL_V;
            end
        end
    end
    */
    
    /*
    // Just move up & down for now.
    reg direction;
    always @ (posedge CLOCK or posedge RESET) begin
        if (RESET) begin
            direction <= 1;
        end else begin
            if (direction == 1 && paddle == 9'd395) begin
                direction <= 0;
            end else if (direction == 0 && paddle == 9'd0) begin
                direction <= 1;
            end
        end
    end
    
    always @ (posedge CLOCK or posedge RESET) begin
        if (RESET) begin
            paddle <= 9'd240;
        end else begin
            if (timer == 0) begin
                if (direction == 1) begin
                    paddle <= paddle + 9'd1;
                end else begin
                    paddle <= paddle - 9'd1;
                end
            end
        end
    end
    */
    
    wire [8:0] final_paddle_pos = paddle >> 1; // divide by two to fit in the byte of the POSITION (2px resolution)
    assign POSITION = final_paddle_pos[7:0]; 
    
endmodule
