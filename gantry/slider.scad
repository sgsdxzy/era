include <../globals.scad>
include <../lib/nutsnbolts/cyl_head_bolt.scad>;
include <../lib/parametric_timingbelts/timing_belts.scad>;

module slider()
{
    difference(){
        translate([2.2,1,2.2])minkowski(){
            cube([34-4.4,6,32-4.4]);
            rotate([90,0,0])cylinder(d=4.4,h=1);
        }
        translate([17,0,12])rotate([0,90,0])cylinder(d=11,h=30,center=true);
        translate([1,0,12])rotate([0,90,0])cylinder(d=8.5,h=2,center=true);
        translate([33,0,12])rotate([0,90,0])cylinder(d=8.5,h=2,center=true);
        translate([17,10,30])rotate([90,0,0])cylinder(d=6,h=10);
        translate([0,0,24])rotate([90,0,0])belt_len(profile = tGT2_2, belt_width = 6.4, len=34);     
        
        translate([3.6,0,3.6])rotate([90,0,0])hole_through("M3",l=8, cld=clearance);
        translate([30.4,0,3.6])rotate([90,0,0])hole_through("M3",l=8, cld=clearance);
        translate([3.6,0,28.4])rotate([90,0,0])hole_through("M3",l=8, cld=clearance);
        translate([30.4,0,28.4])rotate([90,0,0])hole_through("M3",l=8, cld=clearance);
    }
}

slider();