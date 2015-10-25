onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /frame_buffer_tb/clk
add wave -noupdate /frame_buffer_tb/write_address
add wave -noupdate /frame_buffer_tb/data_in
add wave -noupdate /frame_buffer_tb/load
add wave -noupdate -radix decimal /frame_buffer_tb/vga_h
add wave -noupdate -radix decimal /frame_buffer_tb/vga_v
add wave -noupdate /frame_buffer_tb/pixel_out
add wave -noupdate /frame_buffer_tb/U0/read_address
add wave -noupdate /frame_buffer_tb/U0/read_value
add wave -noupdate -radix decimal /frame_buffer_tb/U0/pixel_bit
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {30 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 161
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
WaveRestoreZoom {0 ns} {530 ns}
