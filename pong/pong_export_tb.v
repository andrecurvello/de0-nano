//`include "pong_export.v"

`timescale 10ns/10ns

module pong_export_tb();

    // Declare inputs as regs and outputs as wires
    reg RESET, CLOCK_50, QUAD_A, QUAD_B;
    wire	VGA_GREEN;
    wire	VGA_RED;
    wire	VGA_BLUE;
    wire	VGA_HSYNC;
    wire	VGA_VSYNC;
    wire	[7:0] LED;
 
    pong_export DUT (
        RESET,
        CLOCK_50,
        QUAD_A,
        QUAD_B,
        VGA_GREEN,
        VGA_RED,
        VGA_BLUE,
        VGA_HSYNC,
        VGA_VSYNC,
        LED
    );
    
    initial begin
        RESET = 1;
        CLOCK_50 = 0;
        
        #2
        RESET = 0;
        
        #2
        RESET = 1;

    
    end
    

    always begin
        #1 CLOCK_50 = !CLOCK_50;
    end
 
endmodule
