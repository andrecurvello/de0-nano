// Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus II License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 15.0.2 Build 153 07/15/2015 SJ Web Edition"
// CREATED		"Tue Nov 17 20:37:33 2015"

module text2_export(
	RESET,
	CLOCK_50,
	VGA_RED,
	VGA_GREEN,
	VGA_BLUE,
	VGA_HSYNC,
	VGA_VSYNC
);


input wire	RESET;
input wire	CLOCK_50;
output wire	VGA_RED;
output wire	VGA_GREEN;
output wire	VGA_BLUE;
output wire	VGA_HSYNC;
output wire	VGA_VSYNC;

wire	[10:0] SYNTHESIZED_WIRE_0;
wire	[10:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	[2:0] SYNTHESIZED_WIRE_4;




assign	SYNTHESIZED_WIRE_2 =  ~RESET;


demo2_text	b2v_text(
	.clk(CLOCK_50),
	.PIXEL_H(SYNTHESIZED_WIRE_0),
	.PIXEL_V(SYNTHESIZED_WIRE_1),
	.PIXEL(SYNTHESIZED_WIRE_4));


vga_driver	b2v_vga(
	.RESET(SYNTHESIZED_WIRE_2),
	.VGA_CLOCK(SYNTHESIZED_WIRE_3),
	.PIXEL(SYNTHESIZED_WIRE_4),
	.VGA_RED(VGA_RED),
	.VGA_GREEN(VGA_GREEN),
	.VGA_BLUE(VGA_BLUE),
	.VGA_HS(VGA_HSYNC),
	.VGA_VS(VGA_VSYNC),
	.PIXEL_H(SYNTHESIZED_WIRE_0),
	.PIXEL_V(SYNTHESIZED_WIRE_1));


vga_clock	b2v_vga_clock(
	.CLOCK_50(CLOCK_50),
	.CLOCK_25(SYNTHESIZED_WIRE_3));


endmodule
