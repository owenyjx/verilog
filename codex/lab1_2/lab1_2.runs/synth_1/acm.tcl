# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir F:/2019spring/codex/lab1_2/lab1_2.cache/wt [current_project]
set_property parent.project_path F:/2019spring/codex/lab1_2/lab1_2.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib F:/2019spring/codex/lab1_2/lab1_2.srcs/sources_1/new/add.v
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc F:/2019spring/codex/lab1_2/lab1_2.srcs/constrs_1/imports/tutorial/Nexys4DDR_Master.xdc
set_property used_in_implementation false [get_files F:/2019spring/codex/lab1_2/lab1_2.srcs/constrs_1/imports/tutorial/Nexys4DDR_Master.xdc]


synth_design -top acm -part xc7a100tcsg324-1


write_checkpoint -force -noxdef acm.dcp

catch { report_utilization -file acm_utilization_synth.rpt -pb acm_utilization_synth.pb }