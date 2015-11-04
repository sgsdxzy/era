include <mount_base.scad>
include <autoleveler.scad>

module socket_connector(){
    difference(){
        carriage_connector();
        translate([40+clearance,15.2,4])rotate([0,90,0])hole_through("M3", l=36, cld=0,h=3);
        translate([1,15.2,4])rotate([0,-90,0])hole_through("M3", l=1, cld=2*clearance);      
        translate([3,12.2,0])cube([17,6,8]);
    }
}

socket_connector();