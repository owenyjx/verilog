@echo off
set xv_path=E:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 54e08808b26e4d898aab2f425a95cdef -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L xpm -L dist_mem_gen_v8_0_10 -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_behav xil_defaultlib.tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
