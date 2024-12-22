create_clock -name CLK -period 20 [get_ports CLOCK_50]

#set clk504 {pll_504_inst|altpll_component|auto_generated|pll1|clk[0]}

derive_pll_clocks
derive_clock_uncertainty

set_input_delay -clock CLK 1 [all_inputs]
set_output_delay -clock CLK 1 [all_outputs]

set_false_path -from [get_ports {SW[*]}]
set_false_path -from [get_ports {HEX*}]

