transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/19csg4/Documents/GitHub/mini-src/busmux.vhd}

vcom -93 -work work {C:/Users/19csg4/Documents/GitHub/mini-src/mdmux_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiii -L rtl_work -L work -voptargs="+acc"  mdmux_tb

add wave *
view structure
view signals
run 500 ns
