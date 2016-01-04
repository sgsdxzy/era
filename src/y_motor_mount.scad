include <nema17_mount.scad>

module y_motor_mount()
{  
    difference(){
        union(){
            translate([0,20+38,0])nema17_mount(h=23);
            translate([-42.3/2,20,0])cube([42.3,16.85,30]);
            translate([42.3/2,20,0])cube([10,6,20]);
            translate([-42.3/2-10,20,0])cube([10,6,20]);
            difference(){
                translate([-42.3/2,0,20])cube([42.3,20,10]);
                translate([30,20+42.3/2,3])cube([42.3,42.3,6],center=true);
                 translate([-13,10,30])hole_through("M4",l=10, cld=clearance,h=4,hcld=2*clearance);
                translate([13,10,30])hole_through("M4",l=10, cld=clearance,h=4,hcld=2*clearance);
            }              
        }
        //translate([-30,40.15,-1])cube([60,70,4]);
        translate([-15.5,42.5,-1])rotate([180,0,0])hole_through("M3",l=0, cld=clearance,h=6,hcld=2*clearance);
        translate([15.5,42.5,-1])rotate([180,0,0])hole_through("M3",l=0, cld=clearance,h=6,hcld=2*clearance);
        translate([-15.5,73.5,-1])rotate([180,0,0])hole_through("M3",l=0, cld=clearance,h=6,hcld=2*clearance);
        translate([15.5,73.5,-1])rotate([180,0,0])hole_through("M3",l=0, cld=clearance,h=6,hcld=2*clearance);
        translate([0,47,8])cube([30,22,16]);
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
}

y_motor_mount();