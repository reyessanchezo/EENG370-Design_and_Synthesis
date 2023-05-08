quit -sim
vlib work;
vlog +acc ../part3.v
vlog +acc *.v
vsim -voptargs=+acc work.t_mux4x1
do wave.do
run 200 ns