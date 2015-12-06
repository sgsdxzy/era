include <nema17_mount.scad>

module x_motor_mount()
{
    difference(){
        union(){
            translate([0,20+42.3/2,0])nema17_mount(h=30);
            translate([42.3/2,20,0])cube([10,6,20]);
            translate([-42.3/2-10,20,0])cube([10,6,20]);
            difference(){
                translate([-42.3/2,0,20])cube([42.3,20,10]);
                translate([30,20+42.3/2,3])cube([42.3,42.3,6],center=true);
                translate([-13,10,30])hole_through("M4",l=10, cld=clearance,h=4,hcld=2*clearance);
                translate([13,10,30])hole_through("M4",l=10, cld=clearance,h=4,hcld=2*clearance);
            }              
        }
        translate([-30,30.15,-1])cube([60,40,11]);
        translate([-15.5,25.65,-1])rotate([180,0,0])hole_through("M3",l=0, cld=clearance,h=5,hcld=2*clearance);
        translate([15.5,25.65,-1])rotate([180,0,0])hole_through("M3",l=0, cld=clearance,h=5,hcld=2*clearance);
        translate([-15.5,56.65,9])rotate([180,0,0])hole_through("M3",l=0, cld=clearance,h=5,hcld=2*clearance);
        translate([15.5,56.65,9])rotate([180,0,0])hole_through("M3",l=0, cld=clearance,h=5,hcld=2*clearance);
        translate([0,20+10.15,20])cube([30,22,10]);
        translate([-42.3/2-4,20,10])rotate([90,0,0])hole_through("M4",l=10, cld=clearance);
        translate([42.3/2+4,20,10])rotate([90,0,0])hole_through("M4",l=10, cld=clearance);
    }
    
    translate([-6,7.1,20.6])rotate([0,90,0])translate([0.6,0.6,0])minkowski(){
        cube([4.6,4.4,11]);
        cylinder(d=1.2,h=1);
    }
    translate([-18,15,7.1+5.8])rotate([0,90,0])translate([0.6,0.6,0])minkowski(){
        cube([4.6,4.4,9]);
        cylinder(d=1.2,h=1);
    }
    translate([8,15,7.1+5.8])rotate([0,90,0])translate([0.6,0.6,0])minkowski(){
        cube([4.6,4.4,9]);
        cylinder(d=1.2,h=1);
    }
    
    /*
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

x_motor_mount();