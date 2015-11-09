onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pong_export_tb/CLOCK_50
add wave -noupdate /pong_export_tb/RESET
add wave -noupdate /pong_export_tb/QUAD_A
add wave -noupdate /pong_export_tb/QUAD_B
add wave -noupdate /pong_export_tb/VGA_HSYNC
add wave -noupdate /pong_export_tb/VGA_VSYNC
add wave -noupdate -radix decimal /pong_export_tb/DUT/b2v_game/PADDLE_POSITION
add wave -noupdate /pong_export_tb/DUT/b2v_game/VGA_CLOCK
add wave -noupdate /pong_export_tb/DUT/b2v_game/PIXEL
add wave -noupdate -radix decimal /pong_export_tb/DUT/b2v_game/PIXEL_H
add wave -noupdate -radix decimal /pong_export_tb/DUT/b2v_game/PIXEL_V
add wave -noupdate -radix decimal /pong_export_tb/DUT/b2v_game/ball_h
add wave -noupdate /pong_export_tb/DUT/b2v_game/ball_h_direction
add wave -noupdate -radix decimal /pong_export_tb/DUT/b2v_game/ball_timer
add wave -noupdate -radix decimal /pong_export_tb/DUT/b2v_game/ball_v
add wave -noupdate /pong_export_tb/DUT/b2v_game/ball_v_direction
add wave -noupdate /pong_export_tb/DUT/b2v_game/ball
add wave -noupdate /pong_export_tb/DUT/b2v_game/border
add wave -noupdate /pong_export_tb/DUT/b2v_game/net
add wave -noupdate /pong_export_tb/DUT/b2v_game/paddle
add wave -noupdate -radix decimal /pong_export_tb/DUT/b2v_game/paddle_pos
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {42877140 ns} 0}
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
WaveRestoreZoom {10250 us} {115250 us}
