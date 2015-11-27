include <f688zz.scad>
include <../lib/nutsnbolts/cyl_head_bolt.scad>;

module gantry_x_back_left()
{
    difference(){
        union(){
            cube([60,6,20]);
            translate([26,0,0])cube([24,12,20]);
            translate([38,12,0])cylinder(d=24,h=20);
        }
        translate([38,12,0])cylinder(d=18+clearance/2,h=12);
        translate([38,12,12])cylinder(d1=18+clearance/2,d2=18+clearance,h=8);
        translate([54,0,10])rotate([90,0,0])hole_through("M4",l=8, cld=clearance);
        translate([22,0,10])rotate([90,0,0])hole_through("M4",l=8, cld=clearance);
    }
    translate([38,12,0])f688zz_mount();
    
    intersection(){
        difference(){
            union(){
                cube([6,30,20]);
                cube([18,18,20]);
                translate([6,-18,0])rotate([0,0,45])cube([24*sqrt(2),24*sqrt(2),6]);
                translate([6,-18,14])rotate([0,0,45])cube([24*sqrt(2),24*sqrt(2),6]);
            }
            translate([0,24,10])rotate([0,-90,0])hole_through("M4",l=8, cld=clearance);
        }
        cube([26,30,20]);
    }
    
    difference(){
        union(){
            translate([50,0,0])cube([10,30,6]);
            translate([38,0,0])cube([22,24,6]);
            //translate([50,14,0])cube([10,15.7,11]);
        }
        translate([38,12,0])cylinder(d=24,h=20);
        translate([55.5,17,15])hole_through("M2",l=20, cld=clearance);
        translate([55.5,17+9.7,15])hole_through("M2",l=20, cld=clearance);
    }
    
    translate([15,-5,7.1])rotate([0,-90,0])translate([0.6,0.6,0])minkowski(){
        cube([4.6,4.4,9]);
        cylinder(d=1.2,h=1);
    }
    translate([47,-5,7.1])rotate([0,-90,0])translate([0.6,0.6,0])minkowski(){
        cube([4.6,4.4,9]);
        cylinder(d=1.2,h=1);
    }
    translate([0.6,17,7.1])rotate([0,-90,90])translate([0.6,0.6,0])minkowski(){
        cube([4.6,4.4,9]);
        cylinder(d=1.2,h=1);
    }
}

gantry_x_back_left();