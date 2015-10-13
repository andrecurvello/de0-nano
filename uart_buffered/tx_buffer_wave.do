onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /uart_tx_buffer_tb/clk
add wave -noupdate /uart_tx_buffer_tb/rst
add wave -noupdate -radix ascii /uart_tx_buffer_tb/data
add wave -noupdate /uart_tx_buffer_tb/dataReady
add wave -noupdate /uart_tx_buffer_tb/txBusy
add wave -noupdate /uart_tx_buffer_tb/txStart
add wave -noupdate -radix ascii /uart_tx_buffer_tb/txData
add wave -noupdate /uart_tx_buffer_tb/U0/wr_en
add wave -noupdate -divider ff
add wave -noupdate -radix ascii /uart_tx_buffer_tb/U0/ff/buf_in
add wave -noupdate -radix ascii /uart_tx_buffer_tb/U0/ff/buf_out
add wave -noupdate /uart_tx_buffer_tb/U0/ff/buf_empty
add wave -noupdate /uart_tx_buffer_tb/U0/ff/buf_full
add wave -noupdate -radix decimal /uart_tx_buffer_tb/U0/ff/fifo_counter
add wave -noupdate -radix ascii -childformat {{{/uart_tx_buffer_tb/U0/ff/buf_mem[3]} -radix ascii} {{/uart_tx_buffer_tb/U0/ff/buf_mem[2]} -radix ascii} {{/uart_tx_buffer_tb/U0/ff/buf_mem[1]} -radix ascii} {{/uart_tx_buffer_tb/U0/ff/buf_mem[0]} -radix ascii}} -expand -subitemconfig {{/uart_tx_buffer_tb/U0/ff/buf_mem[3]} {-height 17 -radix ascii} {/uart_tx_buffer_tb/U0/ff/buf_mem[2]} {-height 17 -radix ascii} {/uart_tx_buffer_tb/U0/ff/buf_mem[1]} {-height 17 -radix ascii} {/uart_tx_buffer_tb/U0/ff/buf_mem[0]} {-height 17 -radix ascii}} /uart_tx_buffer_tb/U0/ff/buf_mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {56 ns} 0}
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
WaveRestoreZoom {0 ns} {92 ns}
