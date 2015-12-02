include <../globals.scad>;
include <../lib/nutsnbolts/cyl_head_bolt.scad>;

module nozzle_throat_fanduct()
{
    difference(){
        translate([-20,0,0])hull(){
            cube([40,4,23]);
            translate([0,26,7])cube([40,4,16]);
        }
        hull(){
            translate([0,0,15])rotate([-90,0,0])cylinder(d=28,h=4);
            translate([-18,26,9])cube([36,4,14]);
        }
        translate([-10,30,0])cylinder(d=22,h=40);
        translate([10,30,0])cylinder(d=22,h=40);
        translate([-10,21,4])cube([20,10,4]);
        
        translate([-12,0,3])rotate([90,0,0])hole_threaded("M3",l=5,cltd=2.5*clearance);
        translate([12,0,3])rotate([90,0,0])hole_threaded("M3",l=5,cltd=2.5*clearance);
    }
}