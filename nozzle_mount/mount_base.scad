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

module nozzle_mount_base(){
    union(){
        translate([0,-6,28])rotate([-45,0,0])difference(){
            cube([40,6*sqrt(2),6*sqrt(2)]);
            translate([8,0,0])cube([24,6*sqrt(2),6*sqrt(2)]);
            translate([4,3*sqrt(2),6*sqrt(2)])hole_through("M3",l=6*sqrt(2), cld=clearance);
            translate([4,3*sqrt(2),2.4])nutcatch_parallel("M3", l=2.4,clk=clearance);
            translate([36,3*sqrt(2),6*sqrt(2)])hole_through("M3",l=6*sqrt(2), cld=clearance);
            translate([36,3*sqrt(2),2.4])nutcatch_parallel("M3", l=2.4,clk=clearance);           
        }
        translate([0,0,8])difference(){
            cube([40,8,20]);
            translate([0,-6,20])rotate([-45,0,0])cube([40,6*sqrt(2),6*sqrt(2)]);
            translate([0,6,20])rotate([-45,0,0])cube([40,2*sqrt(2),2*sqrt(2)]);
            
        }
    }
}

module nozzle_mount() {
    difference(){
        carriage_connector();
        translate([0,0,4.8])cube([40,8.5,3.2]);
    }
    
    translate([0,10,0])difference(){
        nozzle_mount_base();
        translate([9,-5,16])rotate([-90,0,0])knurled_cyl_str(15,8,0.628,0.132,0);
        translate([31,-5,16])rotate([-90,0,0])knurled_cyl_str(15,8,0.628,0.132,0);
        translate([0,4,16])rotate([0,-90,0])hole_threaded("M3",l=9,cltd=1.5*clearance);
        translate([31,4,16])rotate([0,-90,0])hole_threaded("M3",l=9,cltd=1.5*clearance);
    }
}

nozzle_mount();