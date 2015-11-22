onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /memory_tb/reset
add wave -noupdate /memory_tb/clk
add wave -noupdate /memory_tb/out
add wave -noupdate -divider memory_inst
add wave -noupdate -radix unsigned -childformat {{{/memory_tb/memory_inst/address[12]} -radix decimal} {{/memory_tb/memory_inst/address[11]} -radix decimal} {{/memory_tb/memory_inst/address[10]} -radix decimal} {{/memory_tb/memory_inst/address[9]} -radix decimal} {{/memory_tb/memory_inst/address[8]} -radix decimal} {{/memory_tb/memory_inst/address[7]} -radix decimal} {{/memory_tb/memory_inst/address[6]} -radix decimal} {{/memory_tb/memory_inst/address[5]} -radix decimal} {{/memory_tb/memory_inst/address[4]} -radix decimal} {{/memory_tb/memory_inst/address[3]} -radix decimal} {{/memory_tb/memory_inst/address[2]} -radix decimal} {{/memory_tb/memory_inst/address[1]} -radix decimal} {{/memory_tb/memory_inst/address[0]} -radix decimal}} -expand -subitemconfig {{/memory_tb/memory_inst/address[12]} {-height 17 -radix decimal} {/memory_tb/memory_inst/address[11]} {-height 17 -radix decimal} {/memory_tb/memory_inst/address[10]} {-height 17 -radix decimal} {/memory_tb/memory_inst/address[9]} {-height 17 -radix decimal} {/memory_tb/memory_inst/address[8]} {-height 17 -radix decimal} {/memory_tb/memory_inst/address[7]} {-height 17 -radix decimal} {/memory_tb/memory_inst/address[6]} {-height 17 -radix decimal} {/memory_tb/memory_inst/address[5]} {-height 17 -radix decimal} {/memory_tb/memory_inst/address[4]} {-height 17 -radix decimal} {/memory_tb/memory_inst/address[3]} {-height 17 -radix decimal} {/memory_tb/memory_inst/address[2]} {-height 17 -radix decimal} {/memory_tb/memory_inst/address[1]} {-height 17 -radix decimal} {/memory_tb/memory_inst/address[0]} {-height 17 -radix decimal}} /memory_tb/memory_inst/address
add wave -noupdate /memory_tb/memory_inst/m1_we
add wave -noupdate /memory_tb/memory_inst/m2_we
add wave -noupdate /memory_tb/memory_inst/m3_we
add wave -noupdate /memory_tb/memory_inst/q1
add wave -noupdate /memory_tb/memory_inst/q2
add wave -noupdate /memory_tb/memory_inst/q3
add wave -noupdate /memory_tb/memory_inst/d
add wave -noupdate /memory_tb/memory_inst/out_buf
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {399990 ns} 0}
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
WaveRestoreZoom {275310 ns} {406570 ns}
