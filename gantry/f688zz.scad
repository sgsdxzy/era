include <../globals.scad>;

module f688zz_mount()
{
    difference(){
        cylinder(d=24,h=12);
        cylinder(d=10,h=12);
        translate([0,0,7-clearance])cylinder(d=16+clearance/2,h=12);
        translate([0,0,10.3-clearance/2])cylinder(d1=16+clearance/2,d2=16.4+clearance/2,h=0.5);
        translate([0,0,10.8-clearance/2])cylinder(d=18+clearance/2,h=12);
    }
} 