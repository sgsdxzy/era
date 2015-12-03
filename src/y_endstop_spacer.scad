include <f688zz.scad>
include <../lib/nutsnbolts/cyl_head_bolt.scad>;

module y_endstop_spacer()
{     
    difference(){  
        cube([10,15.7,5]);
        translate([5.5,3,15])hole_through("M2",l=20, cld=clearance);
        translate([5.5,3+9.7,15])hole_through("M2",l=20, cld=clearance);
    }
}

y_endstop_spacer();