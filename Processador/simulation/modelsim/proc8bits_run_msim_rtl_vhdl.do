transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Macuxi digital/Documents/AOC_KaylonGutierre_CleillysonOsmar_UFRR_ProjetoFinal/Processador/RAM.vhd}
vcom -93 -work work {C:/Users/Macuxi digital/Documents/AOC_KaylonGutierre_CleillysonOsmar_UFRR_ProjetoFinal/Processador/Tb_Ram.vhd}

vcom -93 -work work {C:/Users/Macuxi digital/Documents/AOC_KaylonGutierre_CleillysonOsmar_UFRR_ProjetoFinal/Processador/Tb_Ram.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  Tb_Ram

add wave *
view structure
view signals
run 1000 ns
