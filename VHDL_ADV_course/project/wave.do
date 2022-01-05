onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /image_tb/m1/RAM_R/data
add wave -noupdate /image_tb/m1/write_address
add wave -noupdate /image_tb/m1/test_mode
add wave -noupdate /image_tb/m1/state
add wave -noupdate /image_tb/m1/start
add wave -noupdate /image_tb/m1/rst
add wave -noupdate /image_tb/m1/read_enable_s
add wave -noupdate /image_tb/m1/read_address
add wave -noupdate /image_tb/m1/proc_row_r
add wave -noupdate /image_tb/m1/proc_row_g
add wave -noupdate /image_tb/m1/proc_row_b
add wave -noupdate /image_tb/m1/New_row_r
add wave -noupdate /image_tb/m1/New_row_g
add wave -noupdate /image_tb/m1/New_row_b
add wave -noupdate /image_tb/m1/filter_enable
add wave -noupdate /image_tb/m1/done_s
add wave -noupdate /image_tb/m1/done
add wave -noupdate /image_tb/m1/current_row_r
add wave -noupdate /image_tb/m1/current_row_g
add wave -noupdate /image_tb/m1/current_row_b
add wave -noupdate /image_tb/m1/count_fsm
add wave -noupdate /image_tb/m1/clk
add wave -noupdate /image_tb/m1/buffer_r
add wave -noupdate /image_tb/m1/buffer_g
add wave -noupdate /image_tb/m1/buffer_b
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {28042 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 315
configure wave -valuecolwidth 180
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {212486 ps}
