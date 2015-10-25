

//`include "vga.v"

`timescale 10ns/10ns
module vga_export_tb();
   
	// Declare inputs as regs and outputs as wires
	reg clk;
    reg[0:0]  rst;

	wire red;
	wire green;
    wire blue;
    wire hsync;
    wire vsync;
    
    vga_export DUT(
        .CLOCK_50(clk) ,	// input  CLOCK_50_sig
        .KEY(rst) ,	// input [0]:EY[0]] KEY_sig
        .VGA_RED(red) ,	// output  VGA_RED_sig
        .VGA_GREEN(green) ,	// output  VGA_GREEN_sig
        .VGA_BLUE(blue) ,	// output  VGA_BLUE_sig
        .VGA_HSYNC(hsync) ,	// output  VGA_HSYNC_sig
        .VGA_VSYNC(vsync) 	// output  VGA_VSYNC_sig
    );

/*
	CLOCK_50,
	KEY,
	VGA_RED,
	VGA_GREEN,
	VGA_BLUE,
	VGA_HSYNC,
	VGA_VSYNC
    
    input wire	CLOCK_50;
input wire	[0:0] KEY;
output wire	VGA_RED;
output wire	VGA_GREEN;
output wire	VGA_BLUE;
output wire	VGA_HSYNC;
output wire	VGA_VSYNC;

*/
	// Initialize all variables
	initial begin        


        clk = 1;
        rst = 0;

        #2
        rst = 1;

	//#2
        //rst = 0;
        
        //#110
        //$stop;      // Terminate simulation

	end

    always begin
        #1 clk = !clk;
    end
	
endmodule
