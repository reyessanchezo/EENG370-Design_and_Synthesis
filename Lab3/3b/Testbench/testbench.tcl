quit -sim
vlib work;
vlog +acc ../*.v
vlog +acc *.v
vsim +acc work.t_lab3b -Lf 220model_ver -Lf altera_mf_ver -Lf verilog
do wave.do
run 120 ns