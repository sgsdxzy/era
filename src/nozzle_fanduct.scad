include <../globals.scad>;
include <../lib/nutsnbolts/cyl_head_bolt.scad>;

module nozzle_fanduct_single()
{
    difference(){
        translate([20,0,0])cube([16*sqrt(2),30,16*sqrt(2)]);
        
        translate([20,0,16*sqrt(2)])rotate([0,45,0])cube([32,32,16]);
        hull(){
            translate([20+8*sqrt(2),15,8*sqrt(2)])rotate([0,45,0])cylinder(d=28,h=1);
            intersection(){
                translate([10,20,1])cylinder(d=28,h=0.2);
                translate([21,0,0])cube([16*sqrt(2),30,16*sqrt(2)]);
            }
        }
        intersection(){
                translate([10,20,0])cylinder(d=28,h=1);
                union(){
                    translate([21,0,0])cube([16*sqrt(2),30,1]);
                    translate([20,0,-4])rotate([0,-45,0])cube([16*sqrt(2),30,2*sqrt(2)]);
                    //translate([20,0,0])cube([16*sqrt(2),30,1]);
                }
            }
        
        translate([20+(8+6)*sqrt(2),15-12,(8-6)*sqrt(2)])rotate([0,45,0])hole_threaded("M3",l=8,cltd=2.5*clearance);
        translate([20+(8+6)*sqrt(2),15+12,(8-6)*sqrt(2)])rotate([0,45,0])hole_threaded("M3",l=8,cltd=2.5*clearance);
        translate([20+(8-6)*sqrt(2),15-12,(8+6)*sqrt(2)])rotate([0,45,0])hole_threaded("M3",l=8,cltd=2.5*clearance);
        translate([20+(8-6)*sqrt(2),15+12,(8+6)*sqrt(2)])rotate([0,45,0])hole_threaded("M3",l=8,cltd=2.5*clearance);
    }
    translate([19,0,20.2])cube([1,30,12.8]);
}
    
module nozzle_fanduct()
{
    nozzle_fanduct_single();    
    mirror([1,0,0]){
        nozzle_fanduct_single();
    }
    
}

//nozzle_fanduct();