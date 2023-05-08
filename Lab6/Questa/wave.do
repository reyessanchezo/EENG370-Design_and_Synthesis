onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /proc/Resetn
add wave -noupdate /proc/Clock
add wave -noupdate /proc/Run
add wave -noupdate -radix binary /proc/DIN
add wave -noupdate /proc/done
add wave -noupdate /proc/BusWires
add wave -noupdate /proc/AddSub
add wave -noupdate /proc/Ain
add wave -noupdate /proc/DINout
add wave -noupdate /proc/Gin
add wave -noupdate /proc/Gout
add wave -noupdate /proc/IRin
add wave -noupdate -radix binary /proc/Rin
add wave -noupdate /proc/Rout
add wave -noupdate -radix binary /proc/IR
add wave -noupdate /proc/R0
add wave -noupdate /proc/R1
add wave -noupdate /proc/R2
add wave -noupdate /proc/R3
add wave -noupdate /proc/R4
add wave -noupdate /proc/R5
add wave -noupdate /proc/R6
add wave -noupdate /proc/R7
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {119 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ns} {150 ns}
