set projDir "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/planAhead"
set projName "Coincide_No_Stamps"
set topName top
set device xc6slx9-2tqg144
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/mojo_top_0.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/reset_conditioner_1.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/avr_interface_2.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/reg_interface_3.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/counter_4.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/duplicator_5.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/duplicator_5.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/duplicator_5.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/duplicator_5.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/comparator_9.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/comparator_9.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/comparator_9.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/comparator_9.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/comparator_9.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/comparator_9.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/comparator_9.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/comparator_9.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/comparator_9.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/comparator_9.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/comparator_9.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/comparator_9.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/comparator_9.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/comparator_9.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/comparator_9.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/cclk_detector_24.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/spi_slave_25.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/uart_rx_26.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/uart_tx_27.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/edge_detector_28.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/pipeline_29.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/edge_detector_28.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/pipeline_29.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/edge_detector_28.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/pipeline_29.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/edge_detector_28.v" "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/work/verilog/pipeline_29.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set ucfSources [list "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/constraint/pins.ucf" "D:/Mojo\ IDE/library/components/mojo.ucf"]
import_files -fileset [get_filesets constrs_1] -force -norecurse $ucfSources
set coreSources [list "C:/Users/Hesh/Documents/mojo/Coincide_No_Stamps/coreGen/fastclk.v"]
import_files -fileset [get_filesets sources_1] -force -norecurse $coreSources
set_property -name {steps.bitgen.args.More Options} -value {-g Binary:Yes -g Compress} -objects [get_runs impl_1]
set_property steps.map.args.mt on [get_runs impl_1]
set_property steps.map.args.pr b [get_runs impl_1]
set_property steps.par.args.mt on [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1
wait_on_run synth_1
launch_runs -runs impl_1
wait_on_run impl_1
launch_runs impl_1 -to_step Bitgen
wait_on_run impl_1
