include <../globals.scad>;
include <../lib/nutsnbolts/cyl_head_bolt.scad>;
include <../lib/knurledFinishLib/knurledFinishLib_v2.scad>;

module trapezoid(width_base, width_top,height,thickness) {

  linear_extrude(height = thickness) polygon(points=[[0,0],[width_base,0],[width_base-(width_base-width_top)/2,height],[(width_base-width_top)/2,height]], paths=[[0,1,2,3]]); 
  
}

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
        
        translate([5*sqrt(2),0,11+5*sqrt(2)])rotate([90,0,0])hole_through("M3",l=21, cld=clearance);
        translate([5*sqrt(2),14,11+5*sqrt(2)])rotate([90,-90,0])nutcatch_sidecut("M3",l=50,clk=clearance,clsh=clearance,clh=1);
        translate([-5*sqrt(2),0,11+5*sqrt(2)])rotate([90,0,0])hole_through("M3",l=21, cld=clearance);
        translate([-5*sqrt(2),14,11+5*sqrt(2)])rotate([90,-90,0])nutcatch_sidecut("M3",l=50,clk=clearance,clsh=clearance,clh=1);
        translate([5*sqrt(2),0,11-5*sqrt(2)])rotate([90,0,0])hole_threaded("M3",l=10, cltd=2.5*clearance);      
        translate([-5*sqrt(2),0,11-5*sqrt(2)])rotate([90,0,0])hole_threaded("M3",l=10, cltd=2.5*clearance);
        
        //translate([-11,10,0])cube([22,6,4]);
    }
    
    
    translate([15,11,-18])rotate([0,0,90])difference(){
        union(){
            translate([-11,0,-6])cube([22,35,28]);
        }
        translate([0,0,11])rotate([-90,0,0])cylinder(d=12+clearance/2,h=30);
        translate([0,0,11])rotate([-90,0,0])cylinder(d=8,h=35);
        
        translate([-5*sqrt(2),0,11+5*sqrt(2)])rotate([90,0,0])hole_threaded("M3",l=4, cltd=2*clearance);       
        translate([5*sqrt(2),0,11+5*sqrt(2)])rotate([90,0,0])hole_threaded("M3",l=10, cltd=2*clearance);       
        translate([5*sqrt(2),0,11-5*sqrt(2)])rotate([90,0,0])hole_through("M3",l=35, cld=clearance);       
        translate([5*sqrt(2),35,11-5*sqrt(2)])rotate([-90,90,0])nutcatch_parallel("M3", l=4, clk=clearance);
        translate([-5*sqrt(2),0,11-5*sqrt(2)])rotate([90,0,0])hole_through("M3",l=35, cld=clearance);       
        translate([-5*sqrt(2),35,11-5*sqrt(2)])rotate([-90,90,0])nutcatch_parallel("M3", l=4, clk=clearance);
        
        translate([-11,4,18])cube([16,22,4]);
    }
    
    translate([-20,22,-24])cube([40,18,8]);
    translate([15,0,-24])cube([5,22,6]);
}

module nozzle_fanduct_single()
{
    
    difference(){
        union(){
            hull(){
                translate([20,0,16*sqrt(2)])rotate([0,45,0])cube([32,30,1e-9]);
                translate([19,0,0])rotate([0,70,0])cube([5,30,1]);

                translate([19,0,12])cube([1,30,16*sqrt(2)-12]);
                
            }
            translate([19,0,20.2])cube([1,30,19.8]);
            translate([19,12,20.2])cube([1,18,21.8]);
        }      
        
        hull(){
            translate([20+8*sqrt(2),15,8*sqrt(2)])rotate([0,45,0])cylinder(d=28,h=1);
            translate([20,12,0])rotate([0,70,0])translate([1.5,0,0])cube([2.5,16,1]);
        }
        translate([20,12,0])rotate([0,70,0])translate([1.5,0,-1])cube([2.5,16,1.2]);
        
        
        translate([20+(8+6)*sqrt(2),15-12,(8-6)*sqrt(2)])rotate([0,45,0])hole_threaded("M3",l=8,cltd=2.5*clearance);
        translate([20+(8+6)*sqrt(2),15+12,(8-6)*sqrt(2)])rotate([0,45,0])hole_threaded("M3",l=8,cltd=2.5*clearance);
        translate([20+(8-6)*sqrt(2),15-12,(8+6)*sqrt(2)])rotate([0,45,0])hole_threaded("M3",l=8,cltd=2.5*clearance);
        translate([20+(8-6)*sqrt(2),15+12,(8+6)*sqrt(2)])rotate([0,45,0])hole_threaded("M3",l=8,cltd=2.5*clearance);
    }
}
    
module nozzle_fanduct()
{
    translate([1,0,0])nozzle_fanduct_single();    
    mirror([1,0,0]){
        translate([1,0,0])nozzle_fanduct_single();    
    }
    
}

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
        translate([-10.5,30,0])cylinder(d=16,h=40);
        translate([10.5,30,0])cylinder(d=16,h=40);
        translate([-10,26,4])cube([20,10,20]);
        
        translate([-12,0,3])rotate([90,0,0])hole_threaded("M3",l=5,cltd=2.5*clearance);
        translate([12,0,3])rotate([90,0,0])hole_threaded("M3",l=5,cltd=2.5*clearance);
    }
}

module printhead()
{
    difference(){
        LMK6LUU_carriage();
     
        // Cooling fan for nozzle throat
        intersection(){
            translate([0,0,-47])hull(){
                translate([0,0,15])rotate([-90,0,0])cylinder(d=28,h=4);
                translate([-18,26,9])cube([36,4,14]);
            }
            translate([0,0,-18])rotate([74,0,0])translate([-20,-20,-30])cube([40,20,30]);
        }
        translate([12,0,-20])rotate([90,0,0])hole_threaded("M3",l=6,cltd=2.5*clearance);
        translate([-12,0,-20])rotate([90,0,0])hole_threaded("M3",l=6,cltd=2.5*clearance);
       
        // Nozzle mount
        translate([-10.5,30,-24])scale((8+clearance)/8)knurled_cyl_str(15,8,0.942,0.198*2,0);
        translate([10.5,30,-24])scale((8+clearance)/8)knurled_cyl_str(15,8,0.942,0.198*2,0);

        translate([10.5,32,-20])rotate([90,0,0])hole_threaded("M3",l=9,cltd=2.5*clearance);
        translate([-10.5,32,-20])rotate([90,0,0])hole_threaded("M3",l=9,cltd=2.5*clearance);
    }
    
    color("Gray",1){
        // Fan ducts
        translate([0,0,-47])nozzle_throat_fanduct();
        translate([0,10,-58])nozzle_fanduct();
    
        /*
        // Nozzles
        translate([10.5,30,-24])rotate([180,0,0])cylinder(d=18,h=18);
        translate([10.5,30,-24])rotate([180,0,0])cylinder(d=12,h=22);
        translate([2.5,15,-58])cube([16,20,11]);       
        translate([10.5,30,-58])rotate([180,0,0])cylinder(d1=8,d2=2,h=5);
        translate([-10.5,30,-24])rotate([180,0,0])cylinder(d=18,h=18);
        translate([-10.5,30,-24])rotate([180,0,0])cylinder(d=12,h=22);
        translate([-18.5,25,-58])cube([16,20,11]);
        translate([-10.5,30,-58])rotate([180,0,0])cylinder(d1=8,d2=2,h=5);      
        */
    }    
}

printhead();
