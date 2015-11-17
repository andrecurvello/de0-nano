onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /text2_export_tb/RESET
add wave -noupdate /text2_export_tb/CLOCK_50
add wave -noupdate /text2_export_tb/VGA_RED
add wave -noupdate /text2_export_tb/VGA_GREEN
add wave -noupdate /text2_export_tb/VGA_BLUE
add wave -noupdate /text2_export_tb/VGA_HSYNC
add wave -noupdate /text2_export_tb/VGA_VSYNC
add wave -noupdate -radix decimal /text2_export_tb/DUT/b2v_text/PIXEL_H
add wave -noupdate -radix decimal /text2_export_tb/DUT/b2v_text/PIXEL_V
add wave -noupdate /text2_export_tb/DUT/b2v_text/PIXEL
add wave -noupdate -radix hexadecimal /text2_export_tb/DUT/b2v_text/rom_addr
add wave -noupdate -radix unsigned /text2_export_tb/DUT/b2v_text/char_addr
add wave -noupdate -radix unsigned /text2_export_tb/DUT/b2v_text/row_addr
add wave -noupdate -radix decimal /text2_export_tb/DUT/b2v_text/bit_addr
add wave -noupdate /text2_export_tb/DUT/b2v_text/text_on
add wave -noupdate -radix decimal /text2_export_tb/DUT/b2v_text/tile_v_start
add wave -noupdate -radix decimal /text2_export_tb/DUT/b2v_text/tile_h_start
add wave -noupdate -radix decimal /text2_export_tb/DUT/b2v_text/tile_v_end
add wave -noupdate -radix decimal /text2_export_tb/DUT/b2v_text/tile_h_end
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {422490 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {381470 ns} {463510 ns}
