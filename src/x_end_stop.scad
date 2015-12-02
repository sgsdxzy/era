include <../globals.scad>
include <../lib/nutsnbolts/cyl_head_bolt.scad>;

module x_end_stop()
{
    difference(){
        union(){
            cube([28,6,20]);
            cube([28,20,3]);
        }
        translate([5,0,10])rotate([90,0,0])hole_through("M4",l=8, cld=clearance);
        translate([23,0,10])rotate([90,0,0])hole_through("M4",l=8, cld=clearance);
        translate([13.7,14.5,10])hole_through("M2",l=12, cld=clearance);
        translate([13.7+9.5,14.5,10])hole_through("M2",l=12, cld=clearance);
    }
    
    translate([16,-5,7.1])rotate([0,-90,0])translate([0.6,0.6,0])minkowski(){
        cube([4.6,4.4,3]);
        cylinder(d=1.2,h=1);
    }
}

x_end_stop();