include <mount_base.scad>

module autoleveler(){
    difference(){
        union(){
            intersection(){
                carriage_connector();
                translate([36,0,1+clearance/2])cube([4,40,6-clearance]);
            }
            translate([40,15.2,4])rotate([0,90,0])hole_through("M3", l=0,h=4, hcld=1-clearance);
            translate([37,36,23+clearance/2])rotate([0,90,0])translate([2,2,0])minkowski(){
                cube([18,8,6]);
                cylinder(r=2,h=1);
            };
        }
        translate([41,6.1,4])rotate([0,90,0])hole_through("M3", l=6, cld=clearance);   
        translate([39,38,2+clearance/2])cube([5,10,20]);
        translate([36,44,7+clearance])rotate([0,-90,0])hole_through("M2", l=6, cld=clearance);
        translate([36,44,17])rotate([0,-90,0])hole_through("M2", l=6, cld=clearance); 
    }
}

autoleveler();