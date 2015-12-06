# Makefile to generate all stls at once and put them in stl folder

TARGETS = \
    printhead\
    slider\
    spacer_10x3\
    spacer_2_5x2\
    spacer_28_5\
    spacer_2\
    x_back_left\
    x_back_right\
    x_end_stop\
    x_front_left_right\
    x_motor_mount\
    y_back_left_front_right\
    y_back_right_front_left\
    y_endstop_spacer\
    y_motor_mount\
    z_motor_mount\
    z_support

all: $(patsubst %,%.stl,${TARGETS})

%.stl: ../src/%.scad
	openscad -m make -o $@ $<
