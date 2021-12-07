transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {VHDL_RADIX16.vho}

vcom -93 -work work {C:/VHDL_RADIX16/mul1_TB.vhd}

vsim -t 1ps -L altera -L cycloneive -L gate_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run -all
