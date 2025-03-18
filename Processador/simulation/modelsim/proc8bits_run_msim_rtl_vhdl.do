transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Macuxi digital/Documents/AOC_KaylonGutierre_CleillysonOsmar_UFRR_ProjetoFinal/Processador/ULA.vhd}
vcom -93 -work work {C:/Users/Macuxi digital/Documents/AOC_KaylonGutierre_CleillysonOsmar_UFRR_ProjetoFinal/Processador/proc8bits.vhd}

vcom -93 -work work {C:/Users/Macuxi digital/Documents/AOC_KaylonGutierre_CleillysonOsmar_UFRR_ProjetoFinal/Processador/proc8bits.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  proc8bits

add wave *
view structure
view signals
run 1000 ns
