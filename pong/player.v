/**
 * Reads the input and passes it to the game engine.
 *
 */
 
module player(
    CLOCK, 
    RESET,
    COUNT_ENABLE,
    DIRECTION, 
    SPEED, 
    POSITION
);
    input CLOCK, RESET, COUNT_ENABLE, DIRECTION;
    input [3:0] SPEED;
    output [7:0] POSITION;
    

    reg [31:0] total;
    always @(posedge CLOCK or posedge RESET) begin
        if (RESET) begin 
            total <= 0;
        end 
        else if (COUNT_ENABLE) begin
            // only want a final count between 0 & 27 (x4 for the clicks)
            if (DIRECTION && total < 109) begin 
                total <= total+1; 
            end
            else if (total > 0) begin 
                total <= total-1;
            end
        end
    end
    
    
    wire [31:0] clicks;
    assign clicks = total >> 2; // divide by 4 as the encoder has 4 edges per "click"
    assign POSITION = clicks[7:0];

endmodule
