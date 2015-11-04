include <mount_base.scad>

module nozzle_mount_A(){
    difference(){
        union(){
            nozzle_mount_base();
            translate([9,-2,16])rotate([-90,0,0])cylinder(d=12,h=8);
            translate([0,-2,10])cube([9,8,12]);
            translate([31,-2,16])rotate([-90,0,0])cylinder(d=12,h=8);
            translate([31,-2,10])cube([9,8,12]);
        }
        translate([9,-5,16])rotate([-90,0,0])knurled_cyl_str(15,8,0.628,0.132,0);
        translate([31,-5,16])rotate([-90,0,0])knurled_cyl_str(15,8,0.628,0.132,0);
        translate([0,2,16])rotate([0,-90,0])hole_threaded("M3",l=9,cltd=clearance);
        translate([31,2,16])rotate([0,-90,0])hole_threaded("M3",l=9,cltd=clearance);
    }
}

nozzle_mount_A();