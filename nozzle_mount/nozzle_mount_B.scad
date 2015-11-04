include <mount_base.scad>

module nozzle_mount_B(){
    difference(){
        union(){
            nozzle_mount_base();
            translate([9,-2,16])rotate([-90,0,0])cylinder(d=12,h=8);
            translate([0,-2,10])cube([9,8,12]);
            translate([31,-2,16])rotate([-90,0,0])cylinder(d=12,h=8);
            translate([31,-2,10])cube([9,8,12]);
        }
        translate([9,-5,16])rotate([90,0,0])hole_through("M6",l=9,cld=clearance);
        translate([31,-5,16])rotate([90,0,0])hole_through("M6",l=9,cld=clearance);
        translate([9,0,16])rotate([-90,0,0])knurled_cyl_str(15,8,0.628,0.132,0);
        translate([31,0,16])rotate([-90,0,0])knurled_cyl_str(15,8,0.628,0.132,0);
    }
}

nozzle_mount_B();