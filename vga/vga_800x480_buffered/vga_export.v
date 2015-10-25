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
// CREATED		"Sun Oct 25 12:01:05 2015"

module vga_export(
	CLOCK_50,
	KEY,
	VGA_RED,
	VGA_GREEN,
	VGA_BLUE,
	VGA_HSYNC,
	VGA_VSYNC
);


input wire	CLOCK_50;
input wire	[0:0] KEY;
output wire	VGA_RED;
output wire	VGA_GREEN;
output wire	VGA_BLUE;
output wire	VGA_HSYNC;
output wire	VGA_VSYNC;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	[15:0] SYNTHESIZED_WIRE_4;
wire	[10:0] SYNTHESIZED_WIRE_5;
wire	[10:0] SYNTHESIZED_WIRE_6;
wire	[15:0] SYNTHESIZED_WIRE_7;





vga_bw	b2v_inst(
	.CLOCK_PIXEL(SYNTHESIZED_WIRE_0),
	.RESET(SYNTHESIZED_WIRE_9),
	.PIXEL(SYNTHESIZED_WIRE_2),
	.VGA_RED(VGA_RED),
	.VGA_GREEN(VGA_GREEN),
	.VGA_BLUE(VGA_BLUE),
	.VGA_HS(VGA_HSYNC),
	.VGA_VS(VGA_VSYNC),
	.PIXEL_H(SYNTHESIZED_WIRE_5),
	.PIXEL_V(SYNTHESIZED_WIRE_6));


frame_buffer	b2v_inst1(
	.clk(CLOCK_50),
	.load(SYNTHESIZED_WIRE_3),
	.data_in(SYNTHESIZED_WIRE_4),
	.vga_h(SYNTHESIZED_WIRE_5),
	.vga_v(SYNTHESIZED_WIRE_6),
	.write_address(SYNTHESIZED_WIRE_7),
	.pixel_out(SYNTHESIZED_WIRE_2));


image_generator	b2v_inst5(
	.clk(CLOCK_50),
	.reset(SYNTHESIZED_WIRE_9),
	.load(SYNTHESIZED_WIRE_3),
	.address(SYNTHESIZED_WIRE_7),
	.out(SYNTHESIZED_WIRE_4));


clock_25	b2v_pixel_clock_25(
	.CLOCK_50(CLOCK_50),
	.CLOCK_25(SYNTHESIZED_WIRE_0));

assign	SYNTHESIZED_WIRE_9 =  ~KEY;


endmodule