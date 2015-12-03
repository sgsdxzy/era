include <../globals.scad>
include <../lib/nutsnbolts/cyl_head_bolt.scad>;

module z_support()
{
    difference(){
        translate([-70,0,0])cube([140,130,6]);        
        translate([-70,90,0])cube([40,40,6]);
        translate([-70,50,0])rotate([0,0,45])cube([40*sqrt(2),40,6]);
        translate([30,90,0])cube([40,130,6]);
        translate([30,90,0])rotate([0,0,-45])cube([40*sqrt(2),40,6]);
        translate([8,50,0])minkowski(){
            translate([1,1,0])cube([10,10,5]);
            cylinder(r=1,h=1);
        }
        translate([8,30,0])minkowski(){
            translate([1,1,0])cube([10,10,5]);
            cylinder(r=1,h=1);
        }
        translate([8,10,0])minkowski(){
            translate([1,1,0])cube([10,10,5]);
            cylinder(r=1,h=1);
        }
        translate([-20,50,0])minkowski(){
            translate([1,1,0])cube([10,10,5]);
            cylinder(r=1,h=1);
        }
        translate([-20,30,0])minkowski(){
            translate([1,1,0])cube([10,10,5]);
            cylinder(r=1,h=1);
        }
        translate([-20,10,0])minkowski(){
            translate([1,1,0])cube([10,10,5]);
            cylinder(r=1,h=1);
        }
        
        translate([40,21,30])hole_through("M3",l=40, cld=clearance);
        translate([40,49,30])hole_through("M3",l=40, cld=clearance);
        
        translate([-40,21,30])hole_through("M3",l=40, cld=clearance);
        translate([-40,49,30])hole_through("M3",l=40, cld=clearance);
        
        translate([18,101,30])hole_through("M3",l=40, cld=clearance);
        translate([-18,101,30])hole_through("M3",l=40, cld=clearance);
        
        translate([18,119,30])hole_through("M3",l=40, cld=clearance);
        translate([-18,119,30])hole_through("M3",l=40, cld=clearance);
    }
    difference(){
        translate([-70,-40,0])cube([140,40,8]);
        
        translate([-51,-20,-51])cylinder(d=21,h=80);        
        translate([-51-8*sqrt(2),-20-8*sqrt(2),10])hole_through("M4",l=20, cld=clearance);
        translate([-51+8*sqrt(2),-20-8*sqrt(2),10])hole_through("M4",l=20, cld=clearance);
        translate([-51-8*sqrt(2),-20+8*sqrt(2),10])hole_through("M4",l=20, cld=clearance);
        translate([-51+8*sqrt(2),-20+8*sqrt(2),10])hole_through("M4",l=20, cld=clearance);

        translate([51,-20,-51])cylinder(d=21,h=80);         
        translate([51-8*sqrt(2),-20-8*sqrt(2),10])hole_through("M4",l=20, cld=clearance);
        translate([51+8*sqrt(2),-20-8*sqrt(2),10])hole_through("M4",l=20, cld=clearance);
        translate([51-8*sqrt(2),-20+8*sqrt(2),10])hole_through("M4",l=20, cld=clearance);
        translate([51+8*sqrt(2),-20+8*sqrt(2),10])hole_through("M4",l=20, cld=clearance);
        
        translate([0,-21.85,-51])cylinder(d=10.2,h=80);         
        translate([-4*sqrt(2),-21.85-4*sqrt(2),10])hole_through("M3",l=20, cld=clearance);
        translate([+4*sqrt(2),-21.85-4*sqrt(2),10])hole_through("M3",l=20, cld=clearance);
        translate([-4*sqrt(2),-21.85+4*sqrt(2),10])hole_through("M3",l=20, cld=clearance);
        translate([+4*sqrt(2),-21.85+4*sqrt(2),10])hole_through("M3",l=20, cld=clearance);
    }
}

z_support();