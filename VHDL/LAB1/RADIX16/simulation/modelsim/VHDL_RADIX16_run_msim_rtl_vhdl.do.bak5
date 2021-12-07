transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/VHDL_RADIX16/mul1.vhd}

vcom -93 -work work {C:/VHDL_RADIX16/mul1_TB.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run -all
