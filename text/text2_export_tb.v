

`timescale 10ns/10ns

module text2_export_tb();

    // Declare inputs as regs and outputs as wires
    reg RESET;
    reg CLOCK_50;
    wire	VGA_RED;
    wire	VGA_GREEN;
    wire	VGA_BLUE;
    wire	VGA_HSYNC;
    wire	VGA_VSYNC;
 
    text2_export DUT (
	RESET,
	CLOCK_50,
	VGA_RED,
	VGA_GREEN,
	VGA_BLUE,
	VGA_HSYNC,
	VGA_VSYNC
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
