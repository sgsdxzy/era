include <globals.scad>
include <lib/nutsnbolts/cyl_head_bolt.scad>;
include <lib/knurledFinishLib/knurledFinishLib_v2.scad>;

use <fan_duct.scad>


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
    difference(){
        union(){
            cube([40,8,19]);
            translate([0,0,17])rotate([75,0,0])difference(){
                cube([40,8,10]);
                translate([20,0,21])rotate([-90,0,0])cylinder(d=38,h=8);
                translate([4,0,5])rotate([90,0,0])hole_through("M3",l=8, cld=clearance);
                translate([4,0,5])rotate([90,0,0])nutcatch_parallel("M3", l=2.6,clk=clearance);
                translate([36,0,5])rotate([90,0,0])hole_through("M3",l=8, cld=clearance);
                translate([36,0,5])rotate([90,0,0])nutcatch_parallel("M3", l=2.6,clk=clearance);  
            }
            intersection(){
                cube([40,8,30]);
                translate([0,0,17])rotate([-15,0,0])cube([40,20,8]);
            }
        }

        //Mounting mechanism
        translate([10,-5,9])rotate([-90,0,0])scale((8+clearance)/8)knurled_cyl_str(15,8,0.942,0.198*2,0);;
        translate([30,-5,9])rotate([-90,0,0])scale((8+clearance)/8)knurled_cyl_str(15,8,0.942,0.198*2,0);;
        translate([0,4,9])rotate([0,-90,0])hole_threaded("M3",l=9,cltd=2.5*clearance);
        translate([31,4,9])rotate([0,-90,0])hole_threaded("M3",l=9,cltd=2.5*clearance);
    }
}

module nozzle_mount() {
    difference(){
        carriage_connector();
        translate([9,0,4.8])cube([22,8.5,3.2]);
        translate([10,8.5,17])rotate([90,0,0])cylinder(r=12.2,h=12);
        translate([30,8.5,17])rotate([90,0,0])cylinder(r=12.2,h=12);
    }
    
    translate([0,10,8])nozzle_mount_base();
    
    /* Fan duct 
    translate([0,10,8])translate([0,0,17])rotate([75,0,0])translate([0,8,1])rotate([90,0,0])fan_duct();
    */
    
    /* Nozzle  
    color("Gray",1){
        translate([10,5,17])rotate([90,0,0])cylinder(d=18,h=12);
        translate([10,-7,17])rotate([90,0,0])cylinder(d=16,h=18);
        translate([10,-25,17])rotate([90,0,0])cylinder(d=5,h=5);
        translate([10,10,17])rotate([90,0,0])cylinder(d=12,h=5);
    }*/
}


nozzle_mount();
