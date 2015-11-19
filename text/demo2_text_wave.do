onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /demo2_text_tb/DUT/clk
add wave -noupdate -expand /demo2_text_tb/DUT/PIXEL
add wave -noupdate -radix decimal /demo2_text_tb/DUT/PIXEL_H
add wave -noupdate -radix decimal /demo2_text_tb/DUT/PIXEL_V
add wave -noupdate -radix hexadecimal /demo2_text_tb/DUT/bit_addr
add wave -noupdate -radix hexadecimal /demo2_text_tb/DUT/char_addr
add wave -noupdate /demo2_text_tb/DUT/font_bit
add wave -noupdate /demo2_text_tb/DUT/font_word
add wave -noupdate -radix hexadecimal /demo2_text_tb/DUT/rom_addr
add wave -noupdate -radix decimal /demo2_text_tb/DUT/row_addr
add wave -noupdate /demo2_text_tb/DUT/text_on
add wave -noupdate -radix decimal /demo2_text_tb/DUT/tile_h_end
add wave -noupdate -radix decimal /demo2_text_tb/DUT/tile_h_start
add wave -noupdate -radix decimal /demo2_text_tb/DUT/tile_v_end
add wave -noupdate -radix decimal /demo2_text_tb/DUT/tile_v_start
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9950 ns} 0}
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
WaveRestoreZoom {5790 ns} {14110 ns}
