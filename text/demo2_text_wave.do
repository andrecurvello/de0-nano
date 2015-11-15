onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /demo2_text_tb/clk
add wave -noupdate -radix decimal /demo2_text_tb/PIXEL_H
add wave -noupdate -radix decimal /demo2_text_tb/PIXEL_V
add wave -noupdate -radix hexadecimal -childformat {{{/demo2_text_tb/DUT/rom_addr[10]} -radix hexadecimal} {{/demo2_text_tb/DUT/rom_addr[9]} -radix hexadecimal} {{/demo2_text_tb/DUT/rom_addr[8]} -radix hexadecimal} {{/demo2_text_tb/DUT/rom_addr[7]} -radix hexadecimal} {{/demo2_text_tb/DUT/rom_addr[6]} -radix hexadecimal} {{/demo2_text_tb/DUT/rom_addr[5]} -radix hexadecimal} {{/demo2_text_tb/DUT/rom_addr[4]} -radix hexadecimal} {{/demo2_text_tb/DUT/rom_addr[3]} -radix hexadecimal} {{/demo2_text_tb/DUT/rom_addr[2]} -radix hexadecimal} {{/demo2_text_tb/DUT/rom_addr[1]} -radix hexadecimal} {{/demo2_text_tb/DUT/rom_addr[0]} -radix hexadecimal}} -subitemconfig {{/demo2_text_tb/DUT/rom_addr[10]} {-height 17 -radix hexadecimal} {/demo2_text_tb/DUT/rom_addr[9]} {-height 17 -radix hexadecimal} {/demo2_text_tb/DUT/rom_addr[8]} {-height 17 -radix hexadecimal} {/demo2_text_tb/DUT/rom_addr[7]} {-height 17 -radix hexadecimal} {/demo2_text_tb/DUT/rom_addr[6]} {-height 17 -radix hexadecimal} {/demo2_text_tb/DUT/rom_addr[5]} {-height 17 -radix hexadecimal} {/demo2_text_tb/DUT/rom_addr[4]} {-height 17 -radix hexadecimal} {/demo2_text_tb/DUT/rom_addr[3]} {-height 17 -radix hexadecimal} {/demo2_text_tb/DUT/rom_addr[2]} {-height 17 -radix hexadecimal} {/demo2_text_tb/DUT/rom_addr[1]} {-height 17 -radix hexadecimal} {/demo2_text_tb/DUT/rom_addr[0]} {-height 17 -radix hexadecimal}} /demo2_text_tb/DUT/rom_addr
add wave -noupdate -radix hexadecimal /demo2_text_tb/DUT/char_addr
add wave -noupdate -radix decimal /demo2_text_tb/DUT/row_addr
add wave -noupdate -radix decimal /demo2_text_tb/DUT/tile_v_start
add wave -noupdate -radix decimal /demo2_text_tb/DUT/tile_v_end
add wave -noupdate -radix decimal /demo2_text_tb/DUT/tile_h_start
add wave -noupdate -radix decimal /demo2_text_tb/DUT/tile_h_end
add wave -noupdate -radix unsigned /demo2_text_tb/DUT/bit_addr
add wave -noupdate /demo2_text_tb/DUT/PIXEL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {210 ns} 0}
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
WaveRestoreZoom {40 ns} {300 ns}
