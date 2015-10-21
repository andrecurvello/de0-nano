
/*
VGA Demo 800x600 at 72Hz

http://www-mtl.mit.edu/Courses/6.111/labkit/vga.shtml

800x600, 72Hz	50.000	800	56	120	64	600	37	6	23

Pixel Clock (MHz): 50.000 
Horizontal (in Pixels)
    Active Video: 800 (16us)
    Front Porch:   56 (1.12us)
    Sync Pulse:   120 (2.4us)
    Back Porch:    64 (1.28us)
        Total pixel clock ticks: 1040 (20.8us)
Vertical (in Lines, so x20.8us)
    Active Video: 600 (12480us)
    Front Porch:   37 (769.6us)
    Sync Pulse:     6 (124.8us)
    Back Porch:    23 (478.4us)
        Total pixel clock ticks: 666 (13.32us)

Total pixel clock ticks: 692,640
50,000,000 / 692,640 = 72.187572188 = 72Hz

1 pixel clock = 1/50Mhz = 20ns = 0.02us

*/

module vga_demo
    (
        CLOCK_50,
        RESET,
        VGA_RED,
        VGA_GREEN,
        VGA_BLUE,
        VGA_HS,
        VGA_VS
    );
    input CLOCK_50;
    input RESET;
    output VGA_RED;
    output VGA_GREEN;
    output VGA_BLUE;
    output VGA_HS;
    output VGA_VS;

    /* Internal registers for horizontal signal timing */
    reg [10:0] hor_reg; // to count 1040 different values up to 1039
    reg hor_sync;
    wire hor_max = (hor_reg == 1039); // to tell when a line is full

    /* Internal registers for vertical signal timing */
    reg [9:0] ver_reg; // to count 666 different values up to 665
    reg ver_sync;
    wire ver_max = (ver_reg == 665); // to tell when a line is full

    // Code

    
    /* Running through line */
    always @ (posedge CLOCK_50 or posedge RESET) begin

        if (RESET) begin 
            hor_reg <= 0;
            ver_reg <= 0;
        end
        else if (hor_max) begin
            hor_reg <= 0;

            /* Running through frame */
            if (ver_max)
                ver_reg <= 0;
            else
            ver_reg <= ver_reg + 1;

        end else
            hor_reg <= hor_reg + 1;

    end
    
    always @ (posedge CLOCK_50 or posedge RESET) begin
    
        if (RESET) begin 
            hor_sync <= 0;
            ver_sync <= 0;
        end
        else begin

            /* Generating the horizontal sync signal */
            if (hor_reg == 856)      // video (800) + front porch (56)
                hor_sync <= 1;       // turn on horizontal sync pulse
            else if (hor_reg == 976) // video (800) + front porch (56) + Sync Pulse (120)
                hor_sync <= 0;       // turn off horizontal sync pulse

            /* Generating the vertical sync signal */
            if (ver_reg == 637)      // LINES: video (600) +  front porch (37)
                ver_sync <= 1;       // turn on vertical sync pulse
            else if (ver_reg == 643) // LINES: video (600) + front porch (37) + Sync Pulse (6)
                ver_sync <= 0;       // turn off vertical sync pulse

        end
    end

    // Send the sync signals to the output, inverted as the sync pulse is low.
    // Maybe wrong as this doc says pulse id positive http://tinyvga.com/vga-timing/800x600@72Hz
    assign VGA_HS = ~hor_sync;
    assign VGA_VS = ~ver_sync;
    
    // Send a pattern of colours (based on the registry bits) but do not output anything during the synchronization periods
    assign VGA_RED = (!hor_reg[0] && !ver_reg[0] && ver_reg < 600 && hor_reg < 800);
    assign VGA_GREEN = (!hor_reg[1] && !ver_reg[1] && ver_reg < 600 && hor_reg < 800);
    assign VGA_BLUE = (!hor_reg[2] && !ver_reg[2] && ver_reg < 600 && hor_reg < 800);
    
    // http://gerfficient.com/2013/02/11/fpga-to-vga-using-de0-nano/
    
endmodule

