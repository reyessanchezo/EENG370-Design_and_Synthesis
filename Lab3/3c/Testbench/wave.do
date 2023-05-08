onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider lab3partc
add wave -noupdate -label 8bitBinary 	-radix binary	/t_lab3c/lab3c_tb/BinaryIn
add wave -noupdate -label Reset 		-radix binary	/t_lab3c/lab3c_tb/rst
add wave -noupdate -label Clock 		-radix binary	/t_lab3c/lab3c_tb/clk
add wave -noupdate -label LEDs 		-radix binary	/t_lab3c/lab3c_tb/LEDR

add wave -noupdate -divider displays
add wave -noupdate -label A 		-radix unsigned	/t_lab3c/lab3c_tb/ABinary
add wave -noupdate -label B		-radix unsigned	/t_lab3c/lab3c_tb/BinaryIn
add wave -noupdate -label Sum 	-radix unsigned	/t_lab3c/lab3c_tb/S
add wave -noupdate -label Cout	-radix binary		/t_lab3c/lab3c_tb/Cout


TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 250
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
