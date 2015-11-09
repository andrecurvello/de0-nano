`timescale 10ns/10ns

module game_engine_tb();

    // Declare inputs as regs and outputs as wires
    reg RESET, SYSTEM_CLOCK, VGA_CLOCK;
    reg [7:0] PADDLE_POSITION;
    reg [10:0] PIXEL_H;
    reg [10:0] PIXEL_V;

    wire [2:0] PIXEL;
 
    game_engine game (
        RESET,
        SYSTEM_CLOCK,
        VGA_CLOCK,
        PADDLE_POSITION,
        PIXEL_H,
        PIXEL_V,
        PIXEL
     );
    
    initial begin
        RESET = 1;
        VGA_CLOCK = 0;
        
        #2
        RESET = 0;
        
        #2 // border
        PADDLE_POSITION = 10;
        PIXEL_H = 4;
        PIXEL_V = 4;
        
        #2
        PADDLE_POSITION = 10;
        PIXEL_H = 5;
        
        #2
        PADDLE_POSITION = 10;
        PIXEL_H = 6;
        
        
    
    end
    

    always begin
        #1 VGA_CLOCK = !VGA_CLOCK;
    end
 
endmodule
