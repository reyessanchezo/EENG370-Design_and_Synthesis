onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider SixBitToTwoDigit
add wave -noupdate -label SixBitBinary -radix unsigned	/t_lab3b/lab3b_tb/BinaryIn
add wave -noupdate -label OnesDigit -radix unsigned	/t_lab3b/lab3b_tb/Ones
add wave -noupdate -label TensDigit -radix unsigned	/t_lab3b/lab3b_tb/Tens

add wave -noupdate -divider displays
add wave -noupdate -label Display0 	/t_lab3b/lab3b_tb/HEX0
add wave -noupdate -label Display1		/t_lab3b/lab3b_tb/HEX1


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
