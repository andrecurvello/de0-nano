vlog -reportprogress 300 -work work ../../testbench/neopixels_tb.v
vlog -reportprogress 300 -work work ../../neopixels.v
vsim work.neopixels_tb
do ../../testbench/neopixels_wave.do
run 120000