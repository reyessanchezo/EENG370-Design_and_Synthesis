onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider Test2Pt2
add wave -noupdate -label SwitchInput 	-radix binary	/t_mux4x1/SW
add wave -noupdate -label LEDOutput		-radix binary	/t_mux4x1/LED


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
WaveRestoreZoom {0 ps} {2060 ns}
