transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/rom21/OneDrive/Desktop/VHDL_git/VHDL/Fast_Memory_method1/fast_mul.vhd}
vcom -93 -work work {C:/Users/rom21/OneDrive/Desktop/VHDL_git/VHDL/Fast_Memory_method1/ROM_256_8.vhd}
vcom -93 -work work {C:/Users/rom21/OneDrive/Desktop/VHDL_git/VHDL/Fast_Memory_method1/first_mul_tb.vhd}

vcom -93 -work work {C:/Users/rom21/OneDrive/Desktop/VHDL_git/VHDL/Fast_Memory_method1/first_mul_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run -all
