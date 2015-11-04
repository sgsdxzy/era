include <../lib/nutsnbolts/cyl_head_bolt.scad>;
include <../lib/knurledFinishLib/knurledFinishLib_v2.scad>;


$fn = 50;
clearance = 0.4; // Nozzle width

module carriage_connector() {
    base_len = 34;
    base_height = 8;
    hole_dist = 23;
    ofst = (base_len - hole_dist) / 2;
    nut_width=3.2;
    translate([3,3,0])difference(){
        minkowski(){
            cube([base_len, base_len, base_height-1]);
            cylinder(r=3,h=1);
        }
        translate([ofst, ofst, base_height])
        hole_through("M4", l = base_height, cld=clearance);
        translate([ofst + hole_dist, ofst, base_height])
        hole_through("M4", l = base_height, cld=clearance);
        translate([ofst, ofst + hole_dist, base_height])
        hole_through("M4", l = base_height, cld=clearance);
        translate([ofst + hole_dist, ofst + hole_dist, base_height ])
        hole_through("M4", l = base_height, cld=clearance);
        translate([ofst, ofst, base_height ])
        nutcatch_parallel("M4", l=nut_width + clearance, clk=clearance);
        translate([ofst + hole_dist, ofst, base_height ])
        nutcatch_parallel("M4", l=nut_width + clearance, clk=clearance);
        translate([ofst, ofst + hole_dist, base_height ])
        nutcatch_parallel("M4", l=nut_width + clearance, clk=clearance);
        translate([ofst + hole_dist, ofst + hole_dist, base_height ])
        nutcatch_parallel("M4", l=nut_width + clearance, clk=clearance);
    }
}

module nozzle_mount_base() {
    union(){
        translate([0,-6,29])rotate([-45,0,0])difference(){
            cube([40,6*sqrt(2),6*sqrt(2)]);
            translate([8,0,0])cube([24,6*sqrt(2),6*sqrt(2)]);
            translate([4,3*sqrt(2),6*sqrt(2)])hole_through("M3",l=6*sqrt(2), cld=clearance);
            translate([4,3*sqrt(2),2.4])nutcatch_parallel("M3", l=2.4,clk=clearance);
            translate([36,3*sqrt(2),6*sqrt(2)])hole_through("M3",l=6*sqrt(2), cld=clearance);
            translate([36,3*sqrt(2),2.4])nutcatch_parallel("M3", l=2.4,clk=clearance);           
        }
        translate([0,0,8])difference(){
            cube([40,6,21]);
            translate([0,-6,21])rotate([-45,0,0])cube([40,6*sqrt(2),6*sqrt(2)]);
            
        }
        difference(){
            translate([3+clearance/2,clearance/2,0])cube([17-clearance,6-clearance,8]);
            translate([0,3,4])rotate([0,-90,0])hole_through("M3", l=40, cld=0);
            translate([3,3,4])rotate([0,-90,0])nutcatch_parallel("M3", l=2.4,clk=0.2);
        }
    }
}