include <f688zz.scad>
include <../lib/nutsnbolts/cyl_head_bolt.scad>;

module gantry_x_front_left_right()
{
    difference(){
        union(){
            cube([32,6,20]);
            cube([6,32,20]);
            cube([24,12,20]);
            cube([12,24,20]);
            translate([12,12,0])cylinder(d=24,h=20);
        }
        translate([12,12,0])cylinder(d=18+clearance/2,h=12);
        translate([12,12,12])cylinder(d1=18+clearance/2,d2=18+clearance,h=8);
        translate([28,0,10])rotate([90,0,0])hole_through("M4",l=8, cld=clearance);
        translate([0,28,10])rotate([0,-90,0])hole_through("M4",l=8, cld=clearance);
    }
    translate([12,12,0])f688zz_mount();
    
    intersection(){
        difference(){
            union(){
                translate([6,-20,0])rotate([0,0,45])cube([26*sqrt(2),26*sqrt(2),6]);
                translate([6,-20,14])rotate([0,0,45])cube([26*sqrt(2),26*sqrt(2),6]);
            }
            translate([12,12,0])cylinder(d=24,h=20);
        }
        cube([32,32,20]);
    }
    
    translate([18,-5,7.1])rotate([0,-90,0])translate([0.6,0.6,0])minkowski(){
        cube([4.6,4.4,9]);
        cylinder(d=1.2,h=1);
    }
    translate([0.6,18,7.1])rotate([0,-90,90])translate([0.6,0.6,0])minkowski(){
        cube([4.6,4.4,9]);
        cylinder(d=1.2,h=1);
    }
}

gantry_x_front_left_right();