include <lib/T-Slot/TSlot_Fractional.scad>;

// Frame
translate([0,10,10])color("Gray",1){
    translate([0,0,0])rotate([0,90,0])2020Profile(308);
    translate([0,354,0])rotate([0,90,0])2020Profile(308);
    translate([0,0,30])rotate([0,90,0])2020Profile(308);
    translate([0,354,30])rotate([0,90,0])2020Profile(308);
    translate([0,0,380])rotate([0,90,0])2020Profile(308);
    translate([0,354,380])rotate([0,90,0])2020Profile(308);
    
    translate([164,177,0])rotate([90,0,0])2020Profile(334);
    translate([-164,177,0])rotate([90,0,0])2020Profile(334);
    translate([164,177,30])rotate([90,0,0])2020Profile(334);
    translate([-164,177,30])rotate([90,0,0])2020Profile(334);
    translate([164,177,380])rotate([90,0,0])2020Profile(334);
    translate([-164,177,380])rotate([90,0,0])2020Profile(334);

    translate([164,0,190])rotate([0,0,0])2020Profile(400);
    translate([-164,0,190])rotate([0,0,0])2020Profile(400);
    translate([164,354,190])rotate([0,0,0])2020Profile(400);
    translate([-164,354,190])rotate([0,0,0])2020Profile(400);
}

// Z axis
translate([-21.1,354-42.2,3])color("Black",1)cube([42.2,42.2,47]);
translate([0,354-21.1,50])color("White",1)cylinder(d=8,h=300);
// SK12 and shafts
translate([72,354,37])rotate([0,0,180]){
    difference(){
        cube([42,37.5,14]);
        translate([31,6,0])cube([11,31.5,14]);
        translate([0,6,0])cube([11,31.5,14]);
    }
    translate([21,23,-17])color("White",1)cylinder(d=12,h=380);
}
translate([72,354,383])rotate([0,0,180]){
    difference(){
        cube([42,37.5,14]);
        translate([31,6,0])cube([11,31.5,14]);
        translate([0,6,0])cube([11,31.5,14]);
    }
}
translate([-30,354,37])rotate([0,0,180]){
    difference(){
        cube([42,37.5,14]);
        translate([31,6,0])cube([11,31.5,14]);
        translate([0,6,0])cube([11,31.5,14]);
    }
    translate([21,23,-17])color("White",1)cylinder(d=12,h=380);
}
translate([-30,354,383])rotate([0,0,180]){
    difference(){
        cube([42,37.5,14]);
        translate([31,6,0])cube([11,31.5,14]);
        translate([0,6,0])cube([11,31.5,14]);
    }
}
// TODO:Z support
translate([-70,220,315])cube([140,130,20]);
// Z base plate
translate([-110,20+27.5+16,335])color("Grey",1)cube([220,220,2]);

// XY system, ultimaker style
translate([-150+12,10,380-30])rotate([-90,0,0])color("White",1)cylinder(d=8,h=348);
translate([150-12,10,380-30])rotate([-90,0,0])color("White",1)cylinder(d=8,h=348);
translate([0,20+12,380-12])rotate([0,90,0])color("White",1)cylinder(d=8,h=337,center=true);
translate([0,354-38,380-12])rotate([0,90,0])color("White",1)cylinder(d=8,h=337,center=true);
translate([-150+5,50,343])cube([14,34,31.5]);
translate([-150+40,50,350-40])cube([40,40,60]);