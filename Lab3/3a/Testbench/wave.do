onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -position end  sim:/t_lab3a/lab3a_tb/Cin
add wave -position end  sim:/t_lab3a/lab3a_tb/Cout
add wave -position end  sim:/t_lab3a/lab3a_tb/error
add wave -position end  sim:/t_lab3a/lab3a_tb/S0
add wave -position end  sim:/t_lab3a/lab3a_tb/S1
add wave -position end  sim:/t_lab3a/lab3a_tb/X
add wave -position end  sim:/t_lab3a/lab3a_tb/Y
add wave -position end  sim:/t_lab3a/lab3a_tb/S




TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 120
configure wave -valuecolwidth 64
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {120 ns}
