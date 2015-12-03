include <../globals.scad>
include <../lib/nutsnbolts/cyl_head_bolt.scad>;
include <../lib/parametric_timingbelts/timing_belts.scad>;

module slider()
{
    difference(){
        translate([2.2,1,2.2])minkowski(){
            cube([34-4.4,6,32-4.4]);
            rotate([90,0,0])cylinder(d=4.4,h=6);
        }
        translate([0,-5,0])cube([34,5,23.6]);
        translate([17,-5,0])cube([17,5,32]);
        translate([0,0,20])cube([16,5,3.6]);
        translate([17,0,23.6])cube([17,5,32]);
        
        translate([17,0,12])rotate([0,90,0])cylinder(d=11,h=30,center=true);
        translate([1,0,12])rotate([0,90,0])cylinder(d=8.5,h=2,center=true);
        translate([33,0,12])rotate([0,90,0])cylinder(d=8.5,h=2,center=true);
        translate([17,7,30])rotate([90,0,0])cylinder(d=6,h=2);
        translate([17,10,30])rotate([90,0,0])cylinder(d=6-clearance/2,h=20);
        translate([0,0,24])rotate([90,0,0])belt_len(profile = tGT2_2, belt_width = 7, len=16);     
        
        translate([3.6,0,3.6])rotate([90,0,0])hole_through("M3",l=20, cld=clearance);
        translate([30.4,0,3.6])rotate([90,0,0])hole_through("M3",l=20, cld=clearance);
        translate([3.6,-6,28.4])rotate([90,0,0])hole_through("M3",l=20, cld=clearance);
        translate([30.4,0,28.4])rotate([90,0,0])hole_through("M3",l=20, cld=clearance);
    }
    translate([18,-5,20.2])cube([16,5,3.2]);
}

slider();