

//`include "vga.v"

`timescale 1ns/1ns
module vga_tb();
   
	// Declare inputs as regs and outputs as wires
	reg clk;
    reg rst;

	wire red;
	wire green;
    wire blue;
    wire hsync;
    wire vsync;
    
    vga U0(
        .CLOCK_50(clk),
        .RESET(rst),
        .VGA_RED(red),
        .VGA_GREEN(green),
        .VGA_BLUE(blue),
        .VGA_HS(hsync),
        .VGA_VS(vsync)
    );


	// Initialize all variables
	initial begin        


        clk = 1;
        rst = 1;

        #2
        rst = 0;
        
        #110
        $stop;      // Terminate simulation

	end

    always begin
        #1 clk = !clk;
    end
	
endmodule
