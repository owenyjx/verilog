vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/dist_mem_gen_v8_0_10

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap dist_mem_gen_v8_0_10 riviera/dist_mem_gen_v8_0_10

vlog -work xil_defaultlib -v2k5 -sv \
"E:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"E:/Xilinx/Vivado/2016.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work dist_mem_gen_v8_0_10 -v2k5 \
"../../../ipstatic/dist_mem_gen_v8_0_10/simulation/dist_mem_gen_v8_0.v" \

vlog -work xil_defaultlib -v2k5 \
"../../../../lab4.srcs/sources_1/ip/dist_mem_gen_1/sim/dist_mem_gen_1.v" \


vlog -work xil_defaultlib "glbl.v"
