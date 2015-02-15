include <configuration.scad>;
use <keystone_mount.scad>;
use <mount_cap_e3d.scad>;
use <../endstop.scad>;

use <../MCAD/nuts_and_bolts.scad>;

separation = 50;  // Distance between ball joint mounting faces.
offset = 22;  // Same as DELTA_EFFECTOR_OFFSET in Marlin.
mount_radius = 18.5;  // Hotend mounting screws, standard would be 25mm.
hotend_radius = 14;  // Hole for the hotend (J-Head diameter is 16mm).
height = 10;
cone_r1 = 2.5;
cone_r2 = 14;

$fn=1000;

module vholes(mp)
{
    rotate([0, 0, mp - 12]) translate([0, mount_radius - 1, 0]) 
             cylinder(r=m3_radius, h=2*height, center=true, $fn=12);
    rotate([0, 0, mp + 12]) translate([0, mount_radius - 1, 0]) 
             cylinder(r=m3_radius, h=2*height, center=true, $fn=12);
}

module enhancement_cuts()
{
    vholes(180);
    vholes(60);
    vholes(300);
  
}



module ear_body(xf)
{    
   translate([xf * -22,offset-2, -5]) rotate([0,0,0]) cylinder(r=6.5,h=7);
}

module ear_cuts(xf)
{
      
      translate([xf * -22,20,-3]) rotate([0,180,0]) nutHole(3);
      translate([xf * -22,20,2.1]) rotate([0,180,0]) cylinder(r=5.1,h=2);
      translate([xf * -22,20,10]) rotate([0,180,0]) cylinder(r=1.6,h=20); 
}

module new_ears(xf){
      
     difference(){ 
          ear_body(xf);
          ear_cuts(xf);
          } 
         
      
}

module halfcylinder(rs,hs)
{
    difference(){
       cylinder(r=rs,h=hs);
       translate([0-rs,-.1,-.1]) cube([rs*2,rs+.2,hs+.2]);
       }
}
module pipe(rs,hs)
{
    difference(){
        cylinder(r=rs,h=hs);
        cylinder(r=rs-1,h=hs);
        }

}
module earlets(p1,p2)
{
         rotate([0,0,p1])   { new_ears(-1);}
         rotate([0,0,p2])   { new_ears(1); }
         rotate([0, 0, 0]) translate([-13+.3, mount_radius-2, -5]) cube([25,9,2]);
         

}

module mountears(p1,p2)
{
   
	earlets(p1,p2);
 
}

module effector() {
  union(){
   translate([0, 6, 2.5])  endstop();
   translate([-15, 3, -5]) cube([7,6,10]); 
   translate([9, 3, -5]) cube([6,6,10]); 
   difference() {
    union() {
      translate([22,23,0]) rotate([90,0,32.5]) translate([0,-4.8,0]) keystone_mount_bottom();
      
      cylinder(r=offset-2+1, h=height, center=true, $fn=36);
      mountears(60,300);
      rotate([0,0,120]) mountears(60,300);
      rotate([0,0,240]) mountears(60,300);
      
    }
    translate([0, 0, -height/2])
	cylinder(r1=hotend_radius, r2=hotend_radius+1, h=height+1, $fn=36);
    for (a = [0:120:359]) rotate([0, 0, a]) {
      translate([0, mount_radius, 0])
	    cylinder(r=m3_wide_radius, h=2*height, center=true, $fn=12);
      }
    enhancement_cuts();
    
  }
 
  }
 }

  

translate([0, 0, height/2]) effector();
