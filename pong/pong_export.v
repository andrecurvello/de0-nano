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
// CREATED		"Fri Nov 20 13:09:52 2015"

module pong_export(
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


input wire	RESET;
input wire	CLOCK_50;
input wire	QUAD_A;
input wire	QUAD_B;
output wire	VGA_GREEN;
output wire	VGA_RED;
output wire	VGA_BLUE;
output wire	VGA_HSYNC;
output wire	VGA_VSYNC;
output wire	[7:0] LED;

wire	[7:0] SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;
wire	[7:0] SYNTHESIZED_WIRE_3;
wire	[10:0] SYNTHESIZED_WIRE_5;
wire	[10:0] SYNTHESIZED_WIRE_6;
wire	[10:0] SYNTHESIZED_WIRE_8;
wire	[10:0] SYNTHESIZED_WIRE_9;
wire	[2:0] SYNTHESIZED_WIRE_13;





count_leds	b2v_count_display(
	.count(SYNTHESIZED_WIRE_14),
	.led_0(LED[0]),
	.led_1(LED[1]),
	.led_2(LED[2]),
	.led_3(LED[3]),
	.led_4(LED[4]),
	.led_5(LED[5]),
	.led_6(LED[6]),
	.led_7(LED[7]));


game_engine	b2v_inst(
	.RESET(SYNTHESIZED_WIRE_15),
	.SYSTEM_CLOCK(CLOCK_50),
	.VGA_CLOCK(SYNTHESIZED_WIRE_16),
	.PADDLE_A_POSITION(SYNTHESIZED_WIRE_3),
	.PADDLE_B_POSITION(SYNTHESIZED_WIRE_14),
	.PIXEL_H(SYNTHESIZED_WIRE_5),
	.PIXEL_V(SYNTHESIZED_WIRE_6),
	.BALL_H(SYNTHESIZED_WIRE_8),
	.BALL_V(SYNTHESIZED_WIRE_9),
	.PIXEL(SYNTHESIZED_WIRE_13));


ai	b2v_inst1(
	.CLOCK(CLOCK_50),
	.RESET(SYNTHESIZED_WIRE_15),
	.BALL_H(SYNTHESIZED_WIRE_8),
	.BALL_V(SYNTHESIZED_WIRE_9),
	.POSITION(SYNTHESIZED_WIRE_14));


vga_clock	b2v_pixel_clock(
	.CLOCK_50(CLOCK_50),
	.CLOCK_25(SYNTHESIZED_WIRE_16));


player	b2v_player_1(
	.CLOCK(CLOCK_50),
	.RESET(SYNTHESIZED_WIRE_15),
	.A(QUAD_A),
	.B(QUAD_B),
	.POSITION(SYNTHESIZED_WIRE_3));

assign	SYNTHESIZED_WIRE_15 =  ~RESET;


vga_driver	b2v_vga(
	.RESET(SYNTHESIZED_WIRE_15),
	.VGA_CLOCK(SYNTHESIZED_WIRE_16),
	.PIXEL(SYNTHESIZED_WIRE_13),
	.VGA_RED(VGA_RED),
	.VGA_GREEN(VGA_GREEN),
	.VGA_BLUE(VGA_BLUE),
	.VGA_HS(VGA_HSYNC),
	.VGA_VS(VGA_VSYNC),
	.PIXEL_H(SYNTHESIZED_WIRE_5),
	.PIXEL_V(SYNTHESIZED_WIRE_6));


endmodule
