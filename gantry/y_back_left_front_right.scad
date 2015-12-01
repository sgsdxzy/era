include <f688zz.scad>
include <../lib/nutsnbolts/cyl_head_bolt.scad>;

module gantry_y_back_left_front_right()
{
    difference(){
        union(){
            cube([53,6,20]);
            translate([18,0,0])cube([24,12,20]);
            translate([30,12,0])cylinder(d=24,h=20);
        }
        translate([30,12,0])cylinder(d=10,h=7.5);
        translate([30,12,7.5])cylinder(d=18+clearance/2,h=12);
        translate([30,12,19.5])cylinder(d1=18+clearance/2,d2=18+clearance,h=0.5);
        translate([47,0,10])rotate([90,0,0])hole_through("M4",l=8, cld=clearance);
        translate([14,0,10])rotate([90,0,0])hole_through("M4",l=8, cld=clearance);
    }
    translate([30,12,7.5])f688zz_mount();
    
    intersection(){
        difference(){
            union(){
                cube([6,30,20]);
                cube([10,18,20]);
                translate([6,-18,0])rotate([0,0,45])cube([24*sqrt(2),24*sqrt(2),6]);
                translate([6,-18,14])rotate([0,0,45])cube([24*sqrt(2),24*sqrt(2),6]);
            }
            translate([0,24,10])rotate([0,-90,0])hole_through("M4",l=8, cld=clearance);
        }
        cube([20,30,20]);
    }
    
    translate([40,-5,7.1])rotate([0,-90,0])translate([0.6,0.6,0])minkowski(){
        cube([4.6,4.4,18]);
        cylinder(d=1.2,h=1);
    }
    translate([0.6,17,7.1])rotate([0,-90,90])translate([0.6,0.6,0])minkowski(){
        cube([4.6,4.4,9]);
        cylinder(d=1.2,h=1);
    }
}

gantry_y_back_left_front_right();