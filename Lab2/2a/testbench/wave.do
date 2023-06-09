onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -label display0  /Lab2a_tb/H0
add wave -noupdate -label display1  /Lab2a_tb/H1
add wave -noupdate -label display2  /Lab2a_tb/H2
add wave -noupdate -label display3  /Lab2a_tb/H3
add wave -noupdate -label display4  /Lab2a_tb/H4
add wave -noupdate -label display5  /Lab2a_tb/H5
add wave -noupdate -label SWInput -radix unsigned  /Lab2a_tb/Test1_tb/select

add wave -noupdate -divider Internals
add wave -noupdate -label disp0 -radix unsigned 	/Lab2a_tb/Test1_tb/code0
add wave -noupdate -label disp1 -radix unsigned  	/Lab2a_tb/Test1_tb/code1
add wave -noupdate -label disp2 -radix unsigned	/Lab2a_tb/Test1_tb/code2
add wave -noupdate -label disp3 -radix unsigned	/Lab2a_tb/Test1_tb/code3
add wave -noupdate -label disp4 -radix unsigned	/Lab2a_tb/Test1_tb/code4
add wave -noupdate -label disp5 -radix unsigned	/Lab2a_tb/Test1_tb/code5



#add wave -noupdate -label Cin /testbench/Cin
#add wave -noupdate -label X -radix hexadecimal /testbench/X
#add wave -noupdate -label Y -radix hexadecimal /testbench/Y
#add wave -noupdate -label Cout /testbench/Cout
#add wave -noupdate -divider Adder
#add wave -noupdate -label Cin /testbench/U1/Cin
#add wave -noupdate -label X -radix hexadecimal /testbench/U1/X
#add wave -noupdate -label Y -radix hexadecimal /testbench/U1/Y
#add wave -noupdate -label Sum -radix hexadecimal /testbench/U1/Sum
#add wave -noupdate -label Cout /testbench/U1/Cout
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
