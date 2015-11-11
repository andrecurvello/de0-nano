onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pong_export_tb/CLOCK_50
add wave -noupdate /pong_export_tb/RESET
add wave -noupdate /pong_export_tb/VGA_HSYNC
add wave -noupdate /pong_export_tb/VGA_VSYNC
add wave -noupdate /pong_export_tb/DUT/b2v_inst/PIXEL
add wave -noupdate -radix decimal /pong_export_tb/DUT/b2v_inst/PIXEL_H
add wave -noupdate -radix decimal /pong_export_tb/DUT/b2v_inst/PIXEL_V
add wave -noupdate -radix decimal /pong_export_tb/DUT/b2v_inst/BALL_H
add wave -noupdate -radix decimal /pong_export_tb/DUT/b2v_inst/BALL_V
add wave -noupdate -radix decimal /pong_export_tb/DUT/b2v_inst/PADDLE_A_POSITION
add wave -noupdate -radix decimal /pong_export_tb/DUT/b2v_inst/PADDLE_B_POSITION
add wave -noupdate /pong_export_tb/DUT/b2v_inst/ball
add wave -noupdate -radix decimal /pong_export_tb/DUT/b2v_inst/ball_h
add wave -noupdate /pong_export_tb/DUT/b2v_inst/ball_h_direction
add wave -noupdate -radix decimal /pong_export_tb/DUT/b2v_inst/ball_v
add wave -noupdate /pong_export_tb/DUT/b2v_inst/ball_v_direction
add wave -noupdate -radix decimal /pong_export_tb/DUT/b2v_inst/paddle_a_pos
add wave -noupdate -radix decimal /pong_export_tb/DUT/b2v_inst/paddle_b_pos
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {20050 us} {41050 us}
