module vga
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
            if (hor_reg == 856)
                hor_sync <= 1;
            else if (hor_reg == 976)
                hor_sync <= 0;

            /* Generating the vertical sync signal */
            if (ver_reg == 637)
                ver_sync <= 1;
            else if (ver_reg == 643)
                ver_sync <= 0;

        end
    end

    assign VGA_HS = ~hor_sync;
    assign VGA_VS = ~ver_sync;
    
    assign VGA_RED = (!hor_reg[0] && !ver_reg[0] && ver_reg < 600 && hor_reg < 800);
    assign VGA_GREEN = (!hor_reg[1] && !ver_reg[1] && ver_reg < 600 && hor_reg < 800);
    assign VGA_BLUE = (!hor_reg[2] && !ver_reg[2] && ver_reg < 600 && hor_reg < 800);
    
    // http://gerfficient.com/2013/02/11/fpga-to-vga-using-de0-nano/
    
endmodule
