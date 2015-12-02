include <../globals.scad>;
include <../lib/nutsnbolts/cyl_head_bolt.scad>;
include <../lib/knurledFinishLib/knurledFinishLib_v2.scad>;

include <nozzle_throat_fanduct.scad>;
include <nozzle_fanduct.scad>;


module LMK6LUU_carriage() 
{
    translate([0,5,0])difference(){
        union(){
            translate([-11,0,0])cube([22,17,22]);
            translate([-7,17,4])cube([14,18,18]);
            translate([-3,17,-18])cube([6,18,22]);
            translate([3,9,4])rotate([0,0,45])cube([8*sqrt(2),8*sqrt(2),18]);
            translate([-3,9,4])rotate([0,0,45])cube([8*sqrt(2),8*sqrt(2),18]);
            translate([-1,17,4])rotate([0,45,0])cube([4*sqrt(2),18,4*sqrt(2)]);
            translate([-7,17,4])rotate([0,45,0])cube([4*sqrt(2),18,4*sqrt(2)]);
        }
        translate([0,0,11])rotate([-90,0,0])cylinder(d=12+clearance/2,h=30);
        translate([0,0,11])rotate([-90,0,0])cylinder(d=8,h=35);
        
        translate([5*sqrt(2),0,11+5*sqrt(2)])rotate([90,0,0])hole_through("M3",l=19, cld=clearance);
        translate([5*sqrt(2),14,11+5*sqrt(2)])rotate([90,-90,0])nutcatch_sidecut("M3",l=50,clk=clearance,clsh=clearance,clh=1);
        translate([-5*sqrt(2),0,11+5*sqrt(2)])rotate([90,0,0])hole_through("M3",l=19, cld=clearance);
        translate([-5*sqrt(2),14,11+5*sqrt(2)])rotate([90,-90,0])nutcatch_sidecut("M3",l=50,clk=clearance,clsh=clearance,clh=1);
        translate([5*sqrt(2),0,11-5*sqrt(2)])rotate([90,0,0])hole_threaded("M3",l=10, cltd=2.5*clearance);      
        translate([-5*sqrt(2),0,11-5*sqrt(2)])rotate([90,0,0])hole_threaded("M3",l=10, cltd=2.5*clearance);
        
        translate([-11,10,0])cube([22,6,4]);
    }
    
    
    translate([15,11,-18])rotate([0,0,90])difference(){
        union(){
            translate([-11,0,-6])cube([22,35,28]);
        }
        translate([0,0,11])rotate([-90,0,0])cylinder(d=12+clearance/2,h=30);
        translate([0,0,11])rotate([-90,0,0])cylinder(d=8,h=35);
        
        translate([-5*sqrt(2),0,11+5*sqrt(2)])rotate([90,0,0])hole_threaded("M3",l=4, cltd=2.5*clearance);       
        translate([5*sqrt(2),0,11+5*sqrt(2)])rotate([90,0,0])hole_threaded("M3",l=10, cltd=2.5*clearance);       
        translate([5*sqrt(2),0,11-5*sqrt(2)])rotate([90,0,0])hole_through("M3",l=35, cld=clearance);       
        translate([5*sqrt(2),35,11-5*sqrt(2)])rotate([-90,90,0])nutcatch_parallel("M3", l=4, clk=clearance);
        translate([-5*sqrt(2),0,11-5*sqrt(2)])rotate([90,0,0])hole_through("M3",l=35, cld=clearance);       
        translate([-5*sqrt(2),35,11-5*sqrt(2)])rotate([-90,90,0])nutcatch_parallel("M3", l=4, clk=clearance);
        
        translate([-11,4,18])cube([16,22,4]);
    }
    
    translate([-20,22,-24])cube([40,18,8]);
    translate([15,0,-24])cube([5,22,6]);
}

module nozzle_mount()
{
    difference(){
        LMK6LUU_carriage();
     
        // Cooling fan for nozzle throat
        intersection(){
            translate([0,0,-32])rotate([-90,0,0])cylinder(d=28,h=20);
            translate([0,0,-18])rotate([60,0,0])translate([-15,-20,-30])cube([30,20,30]);
        }
        translate([12,0,-20])rotate([90,0,0])hole_threaded("M3",l=6,cltd=2.5*clearance);
        translate([-12,0,-20])rotate([90,0,0])hole_threaded("M3",l=6,cltd=2.5*clearance);
        
        // Nozzle mount
        translate([-10,30,-24])scale((8+clearance)/8)knurled_cyl_str(15,8,0.942,0.198*2,0);
        translate([10,30,-24])scale((8+clearance)/8)knurled_cyl_str(15,8,0.942,0.198*2,0);

        translate([10,32,-20])rotate([90,0,0])hole_threaded("M3",l=9,cltd=2.5*clearance);
        translate([-10,32,-20])rotate([90,0,0])hole_threaded("M3",l=9,cltd=2.5*clearance);
    }
 
    
    color("Gray",1){
        // Fan ducts
        translate([0,0,-47])nozzle_throat_fanduct();
        translate([0,10,-57])nozzle_fanduct();
    
        /*   
        // Nozzles
        translate([10,30,-24])rotate([180,0,0])cylinder(d=18,h=18);
        translate([10,30,-24])rotate([180,0,0])cylinder(d=12,h=22);
        translate([2,25,-57])cube([16,20,11]);       
        translate([10,30,-57])rotate([180,0,0])cylinder(d=8,h=5);
        translate([-10,30,-24])rotate([180,0,0])cylinder(d=18,h=18);
        translate([-10,30,-24])rotate([180,0,0])cylinder(d=12,h=22);
        translate([-18,25,-57])cube([16,20,11]);
        translate([-10,30,-57])rotate([180,0,0])cylinder(d=8,h=5); 
        */
    }
    
}


nozzle_mount();
