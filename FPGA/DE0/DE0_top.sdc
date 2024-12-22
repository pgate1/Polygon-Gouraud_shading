create_clock -name CLK -period 20 [get_ports CLOCK_50]
derive_pll_clocks
derive_clock_uncertainty
set_input_delay -clock CLK 1 [all_inputs]
set_output_delay -clock CLK 1 [all_outputs]
