include <globals.scad>;
include <lib/nutsnbolts/cyl_head_bolt.scad>;
//include <lib/knurledFinishLib/knurledFinishLib_v2.scad>;
include <lib/T-Slot/TSlot_Fractional.scad>;

// Frame, total 4m
translate([0,10,10])color("Gray",1){
    translate([0,0,0])rotate([0,90,0])2020Profile(300);
    translate([0,320,0])rotate([0,90,0])2020Profile(300);
    translate([160,160,0])rotate([90,0,0])2020Profile(300);
    translate([-160,160,0])rotate([90,0,0])2020Profile(300);
    translate([0,0,334])rotate([0,90,0])2020Profile(300);
    translate([0,320,334])rotate([0,90,0])2020Profile(300);
    translate([160,160,380])rotate([90,0,0])2020Profile(300);
    translate([-160,160,380])rotate([90,0,0])2020Profile(300);
    translate([160,0,190])rotate([0,0,0])2020Profile(400);
    translate([-160,0,190])rotate([0,0,0])2020Profile(400);
    translate([160,320,190])rotate([0,0,0])2020Profile(400);
    translate([-160,320,190])rotate([0,0,0])2020Profile(400);
}

// Bottom steppers
translate([170-62.3,62.3,20])rotate([0,0,-90]){
    bottom_stepper_mount();
    translate([0,0,-47])color("Black",1)cube([42.3,42.3,47]);
    translate([21.15,21.15,5])color("White",1)cylinder(d=8,h=320);
}
translate([-170+62.3,340-62.3,20])rotate([0,0,90]){
    bottom_stepper_mount();
    translate([0,0,-47])color("Black",1)cube([42.3,42.3,47]);
    translate([21.15,21.15,5])color("White",1)cylinder(d=8,h=320);
}


// Shafts
// SK8
translate([-150,20,3]){
    difference(){
        cube([42,32.8,14]);
        translate([30,6,0])cube([12,26.8,14]);
        translate([-1,6,0])cube([12,26.8,14]);
    }
    translate([21,20,-3])color("White",1)cylinder(d=8,h=360);
}
translate([-150,20,337]){
    difference(){
        cube([42,32.8,14]);
        translate([30,6,0])cube([12,26.8,14]);
        translate([-1,6,0])cube([12,26.8,14]);
    }
}
translate([150,320,3])rotate([0,0,180]){
    difference(){
        cube([42,32.8,14]);
        translate([30,6,0])cube([12,26.8,14]);
        translate([-1,6,0])cube([12,26.8,14]);
    }
    translate([21,20,-5])color("White",1)cylinder(d=8,h=360);
}
translate([150,320,337])rotate([0,0,180]){
    difference(){
        cube([42,32.8,14]);
        translate([30,6,0])cube([12,26.8,14]);
        translate([-1,6,0])cube([12,26.8,14]);
    }
}

// Extrusion head
translate([-110,34,360])cube([40,12,40]);
translate([-136,60,360])cube([12,40,40]);
translate([-110,60,310])cube([40,40,90]);

// Z base plate
translate([-110,50,200])color("Grey",1)cube([220,220,2.5]);

// XY system
translate([0,40,390])rotate([0,90,0])color("White",1)cylinder(d=8,h=300,center=true);
translate([0,290,390])rotate([0,90,0])color("White",1)cylinder(d=8,h=300,center=true);
translate([130,10,370])rotate([-90,0,0])color("White",1)cylinder(d=8,h=320);
translate([-130,10,370])rotate([-90,0,0])color("White",1)cylinder(d=8,h=320);
translate([-150,300,354])color("Black",1)cube([42.3,47,42.3]);

module bottom_stepper_mount()
{
    difference(){
        cube([62.3,62.3,5]);
        translate([42.3,42.3,0])cube([20,20,5]);
    }
}
