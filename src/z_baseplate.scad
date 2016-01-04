include <../globals.scad>
include <../lib/nutsnbolts/cyl_head_bolt.scad>;

module z_baseplate()
{
    union(){
        difference(){
            translate([-80,-40])square([160,67.85]);
            
            translate([-60,-20])circle(d=14);   
            translate([60,-20])circle(d=14);   
            translate([-60-8*sqrt(2),-20-8*sqrt(2)])circle(d=4.5);
            translate([-60-8*sqrt(2),-20+8*sqrt(2),0])circle(d=4.5);
            translate([-60+8*sqrt(2),-20-8*sqrt(2),0])circle(d=4.5);
            translate([-60+8*sqrt(2),-20+8*sqrt(2),0])circle(d=4.5);
            translate([60-8*sqrt(2),-20-8*sqrt(2),0])circle(d=4.5);
            translate([60-8*sqrt(2),-20+8*sqrt(2),0])circle(d=4.5);
            translate([60+8*sqrt(2),-20-8*sqrt(2),0])circle(d=4.5);
            translate([60+8*sqrt(2),-20+8*sqrt(2),0])circle(d=4.5);
                  
            translate([0,-21.85])circle(d=9);                
            translate([-4*sqrt(2),-21.85-4*sqrt(2)])circle(d=3.3);
            translate([-4*sqrt(2),-21.85+4*sqrt(2)])circle(d=3.3);
            translate([4*sqrt(2),-21.85-4*sqrt(2)])circle(d=3.3);
            translate([4*sqrt(2),-21.85+4*sqrt(2)])circle(d=3.3);
            
            translate([-26,-20])circle(d=3.3);
        }        
              
        difference(){
            translate([-111,27.85])square([222,222]);
            
            translate([-104.5,28.85+5.5])circle(d=3.3);
            translate([104.5,28.85+5.5])circle(d=3.3);
            translate([-104.5,28.85+214.5])circle(d=3.3);
            translate([104.5,28.85+214.5])circle(d=3.3);
            
            translate([0,28.85+5.5])circle(d=3.3);
        }
        
        polygon(points=[[80,7],[80,27.85],[111,27.85]]);
        polygon(points=[[-80,7],[-80,27.85],[-111,27.85]]);
    }  
}
    
z_baseplate();