include <nema17_mount.scad>

module z_motor_mount()
{
    difference(){
        cube([60,65,6]);
        translate([30,20+42.3/2,3])cube([42.3,42.3,6],center=true);
        translate([15,10,6])hole_through("M4",l=8, cld=clearance);
        translate([45,10,6])hole_through("M4",l=8, cld=clearance);
    }
    
    translate([22,7.1,11])rotate([0,90,0])translate([0.6,0.6,0])minkowski(){
        cube([4.6,4.4,15]);
        cylinder(d=1.2,h=1);
    }
    translate([0,7.1,11])rotate([0,90,0])translate([0.6,0.6,0])minkowski(){
        cube([4.6,4.4,7]);
        cylinder(d=1.2,h=1);
    }
    translate([52,7.1,11])rotate([0,90,0])translate([0.6,0.6,0])minkowski(){
        cube([4.6,4.4,7]);
        cylinder(d=1.2,h=1);
    }
    
    translate([30,20+42.3/2,0])nema17_mount(h=6);
    difference(){
        translate([0,20,6])cube([8.85,45,20]);
        translate([0,30,30])rotate([-30,0,0])cube([8.85,60,20]);
    }
    translate([60-8.85,0,0])difference(){
        translate([0,20,6])cube([8.85,45,20]);
        translate([0,30,30])rotate([-30,0,0])cube([8.85,60,20]);
    }
    
    translate([0,15,18.9])rotate([0,90,0])translate([0.6,0.6,0])minkowski(){
        cube([4.6,4.4,7.85]);
        cylinder(d=1.2,h=1);
    }
    translate([60-8.85,15,18.9])rotate([0,90,0])translate([0.6,0.6,0])minkowski(){
        cube([4.6,4.4,7.85]);
        cylinder(d=1.2,h=1);
    }
    /*
    translate([0,0,26])cube([60,20,6]);
    translate([0,7.1,26.6])rotate([0,90,0])translate([0.6,0.6,0])minkowski(){
        cube([4.6,4.4,59]);
        cylinder(d=1.2,h=1);
    }
    */
}

z_motor_mount();