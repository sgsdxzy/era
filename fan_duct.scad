include <globals.scad>
include <lib/nutsnbolts/cyl_head_bolt.scad>;

module fan_duct() {
    difference(){
        cube([40,40,2.4]);
        cube([40,9+clearance,2.4]);
        translate([20,20,0])cylinder(d=38,h=2.4);
        translate([4,36,0])rotate([0,180,0])hole_threaded("M3",l=5,cltd=2.5*clearance);
        translate([36,36,0])rotate([0,180,0])hole_threaded("M3",l=5,cltd=2.5*clearance);
    }
    translate([0,16,2.4])cube([40,2,10-clearance]);
    difference(){
        hull(){
            translate([0,16,2.4])cube([40,24,0.4]);
            translate([1,34,16])cube([38,4,0.4]);
        }
        hull(){
            translate([1,17,2.4])cube([38,22,0.4]);
            translate([2,34.8,16])cube([36,2.4,0.4]);
        }
        translate([2,32,30])rotate([-75,0,0])cube([36,21,4]);
    }
}

fan_duct();