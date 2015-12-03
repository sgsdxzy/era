# Makefile to generate all stls at once and put them in stl folder

TARGETS = slider x_end_stop y_back_left_front_right y_endstop_spacer z_support x_back_left \
	  x_front_left_right y_back_right_front_left printhead x_back_right \
	  x_y_motor_mount z_motor_mount

all: $(patsubst %,%.stl,${TARGETS})

%.stl: ../src/%.scad
	openscad -m make -o $@ $<
