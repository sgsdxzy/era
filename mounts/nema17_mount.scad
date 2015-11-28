include <../globals.scad>
include <../lib/nutsnbolts/cyl_head_bolt.scad>;

module nema17_mount(h=6)
{
    motor_width = 42.3;
    hole_distance = 31;
    difference(){
        translate([0,0,h/2])cube([motor_width,motor_width,h],center=true);
        cylinder(d=22,h=h);
        translate([-hole_distance/2,-hole_distance/2,h])hole_through("M3",l=h, cld=clearance);
        translate([hole_distance/2,-hole_distance/2,h])hole_through("M3",l=h, cld=clearance);
        translate([-hole_distance/2,hole_distance/2,h])hole_through("M3",l=h, cld=clearance);
        translate([hole_distance/2,hole_distance/2,h])hole_through("M3",l=h, cld=clearance);
    }
}