include <globals.scad>
include <lib/nutsnbolts/cyl_head_bolt.scad>;
include <lib/knurledFinishLib/knurledFinishLib_v2.scad>;


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
            cube([40,8,15]);
            translate([0,1/sqrt(3),13])rotate([60,0,0])cube([40,6*sqrt(2),6*sqrt(2)]);
            intersection(){
                cube([40,8,30]);
                translate([0,1/sqrt(3),13])rotate([-30,0,0])cube([40,20,6*sqrt(2)]);
            }
        }
        translate([8,0,12])rotate([60,0,0])cube([24,12,12]);
        translate([0,1/sqrt(3),13])rotate([60,0,0]){
                translate([4,0,3*sqrt(2)])rotate([90,0,0])hole_through("M3",l=6*sqrt(2), cld=clearance);
                translate([4,-0.2,3*sqrt(2)])rotate([90,0,0])nutcatch_parallel("M3", l=2.6,clk=clearance);
                translate([36,0,3*sqrt(2)])rotate([90,0,0])hole_through("M3",l=6*sqrt(2), cld=clearance);
                translate([36,-0.2,3*sqrt(2)])rotate([90,0,0])nutcatch_parallel("M3", l=2.6,clk=clearance);  
        }
        
        //Mounting mechanism
        translate([10,-5,8])rotate([-90,0,0])scale((8+clearance)/8)knurled_cyl_str(15,8,0.942,0.198*2,0);;
        translate([30,-5,8])rotate([-90,0,0])scale((8+clearance)/8)knurled_cyl_str(15,8,0.942,0.198*2,0);;
        translate([0,4,8])rotate([0,-90,0])hole_threaded("M3",l=9,cltd=2.5*clearance);
        translate([31,4,8])rotate([0,-90,0])hole_threaded("M3",l=9,cltd=2.5*clearance);
    }
}

module nozzle_mount() {
    difference(){
        carriage_connector();
        translate([8.5-7.4/sqrt(3),0,4.8])cube([23+2*7.4/sqrt(3),8.5,3.2]);
        translate([0,25,4])rotate([0,-90,0])hole_threaded("M3",l=9,cltd=2.5*clearance);
    }
    
    translate([0,10,8])nozzle_mount_base();
}

nozzle_mount();