include <../globals.scad>
include <../lib/nutsnbolts/cyl_head_bolt.scad>;

module autoleveler(){
    difference(){
        union(){
            cube([4,43,6-1.5*clearance]);
            translate([0,10+clearance,-2+clearance/2])cube([4,8-2*clearance,10-2.5*clearance]);
            translate([0,42+clearance*1.5,2])minkowski(){
                cube([6,8,18]);
                rotate([0,90,0])cylinder(r=2,h=1);
            };
        }
        translate([0,14,3-0.75*clearance])rotate([0,-90,0])hole_through("M3", l=6, cld=clearance*1.5);   
        translate([0,40+1.5*clearance,1]){
            translate([2,2,0])cube([5,10,20]);
            translate([0,6,5+0.4])rotate([0,-90,0])hole_through("M2", l=8, cld=clearance);
            translate([0,6,15-0.4])rotate([0,-90,0])hole_through("M2", l=8, cld=clearance); 
        }
    }
}

autoleveler();