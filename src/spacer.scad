include <../globals.scad>

module spacer(h=10)
{
    difference(){
        cylinder(d=10.5, h=h);
        cylinder(d=8+clearance, h=h);
    }
}