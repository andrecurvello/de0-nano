
create_clock -name {CLOCK_50} -period 20.000 -waveform { 0.000 0.500 } [get_ports {CLOCK_50}]
derive_clock_uncertainty