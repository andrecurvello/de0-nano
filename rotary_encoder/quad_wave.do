onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /quadrature_tb/clk
add wave -noupdate /quadrature_tb/reset
add wave -noupdate /quadrature_tb/DUT/count_enable
add wave -noupdate /quadrature_tb/DUT/count_direction
add wave -noupdate -radix decimal /quadrature_tb/count
add wave -noupdate /quadrature_tb/quadA
add wave -noupdate /quadrature_tb/quadB
add wave -noupdate /quadrature_tb/DUT/quadA_delayed
add wave -noupdate /quadrature_tb/DUT/quadB_delayed
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {88 ns} 0}
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
WaveRestoreZoom {0 ns} {105 ns}
