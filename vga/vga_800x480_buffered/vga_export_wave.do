onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /vga_export_tb/clk
add wave -noupdate /vga_export_tb/rst
add wave -noupdate /vga_export_tb/red
add wave -noupdate /vga_export_tb/green
add wave -noupdate /vga_export_tb/blue
add wave -noupdate /vga_export_tb/hsync
add wave -noupdate /vga_export_tb/vsync
add wave -noupdate -divider generator
add wave -noupdate /vga_export_tb/DUT/b2v_inst5/clk
add wave -noupdate -radix hexadecimal /vga_export_tb/DUT/b2v_inst5/address
add wave -noupdate -radix hexadecimal /vga_export_tb/DUT/b2v_inst5/out
add wave -noupdate -radix decimal /vga_export_tb/DUT/b2v_inst5/hor_reg
add wave -noupdate -radix decimal /vga_export_tb/DUT/b2v_inst5/ver_reg
add wave -noupdate /vga_export_tb/DUT/b2v_inst5/data
add wave -noupdate -radix hexadecimal /vga_export_tb/DUT/b2v_inst5/buffer_addr
add wave -noupdate -radix decimal /vga_export_tb/DUT/b2v_inst5/pixel_bit
add wave -noupdate -divider vga
add wave -noupdate /vga_export_tb/DUT/b2v_inst/CLOCK_PIXEL
add wave -noupdate /vga_export_tb/DUT/b2v_inst/PIXEL
add wave -noupdate -radix decimal /vga_export_tb/DUT/b2v_inst/PIXEL_H
add wave -noupdate -radix decimal /vga_export_tb/DUT/b2v_inst/PIXEL_V
add wave -noupdate /vga_export_tb/DUT/b2v_inst/VGA_RED
add wave -noupdate /vga_export_tb/DUT/b2v_inst/VGA_GREEN
add wave -noupdate /vga_export_tb/DUT/b2v_inst/VGA_BLUE
add wave -noupdate /vga_export_tb/DUT/b2v_inst/VGA_HS
add wave -noupdate /vga_export_tb/DUT/b2v_inst/VGA_VS
add wave -noupdate /vga_export_tb/DUT/b2v_inst/red
add wave -noupdate /vga_export_tb/DUT/b2v_inst/green
add wave -noupdate /vga_export_tb/DUT/b2v_inst/blue
add wave -noupdate -radix decimal /vga_export_tb/DUT/b2v_inst/hor_reg
add wave -noupdate -radix decimal /vga_export_tb/DUT/b2v_inst/ver_reg
add wave -noupdate -radix decimal /vga_export_tb/DUT/b2v_inst/hor_pixel
add wave -noupdate -radix decimal /vga_export_tb/DUT/b2v_inst/ver_pixel
add wave -noupdate -divider buffer
add wave -noupdate /vga_export_tb/DUT/b2v_inst1/pixel_out
add wave -noupdate -radix decimal /vga_export_tb/DUT/b2v_inst1/vga_h
add wave -noupdate -radix decimal /vga_export_tb/DUT/b2v_inst1/vga_v
add wave -noupdate -radix decimal /vga_export_tb/DUT/b2v_inst1/pixel_bit
add wave -noupdate /vga_export_tb/DUT/b2v_inst1/read_address
add wave -noupdate /vga_export_tb/DUT/b2v_inst1/read_value
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {690 ns} 0}
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
WaveRestoreZoom {680 ns} {720 ns}
