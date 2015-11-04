include <mount_base.scad>

module socket_connector(){
    difference(){
        union(){
            carriage_connector();
            translate([20,0,0])cube([17,20,8]);
        }
        translate([40+clearance,15.2,4])rotate([0,90,0])hole_through("M3", l=31, cld=0,h=8);
        translate([1,15.2,4])rotate([0,-90,0])hole_through("M3", l=1, cld=2*clearance);      
        translate([3,12.2,0])cube([17,6,8]);
        translate([25,6.1,4])rotate([0,-90,0])nutcatch_sidecut("M3", l=6, clk=clearance+0.1, clh=clearance/2, clsl=clearance/2);
        translate([40,6.1,4])rotate([0,90,0])hole_through("M3", l=15, cld=clearance);
        
        translate([36,0,1])cube([4,40,6]);
        translate([37-clearance/2,36-clearance/2,1])cube([5,20,8]);
    }
}

socket_connector();