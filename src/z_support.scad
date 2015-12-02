include <../globals.scad>
include <../lib/nutsnbolts/cyl_head_bolt.scad>;

module z_support()
{
    difference(){
        translate([-70,0,0])cube([140,130,20]);
        
        translate([40,21,30])hole_through("M3",l=40, cld=clearance);
        translate([40,49,30])hole_through("M3",l=40, cld=clearance);
        
        translate([-40,21,30])hole_through("M3",l=40, cld=clearance);
        translate([-40,49,30])hole_through("M3",l=40, cld=clearance);
        
        translate([18,101,30])hole_through("M3",l=40, cld=clearance);
        translate([-18,101,30])hole_through("M3",l=40, cld=clearance);
        
        translate([18,119,30])hole_through("M3",l=40, cld=clearance);
        translate([-18,119,30])hole_through("M3",l=40, cld=clearance);
    }   
}

z_support();