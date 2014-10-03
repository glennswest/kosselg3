include <configuration.scad>;
include <fan_mount.scad>;
include <keystone.scad>;
use <../MCAD/nuts_and_bolts.scad>;

separation = 50;  // Distance between ball joint mounting faces.
offset = 22;  // Same as DELTA_EFFECTOR_OFFSET in Marlin.
mount_radius = 18.5;  // Hotend mounting screws, standard would be 25mm.
hotend_radius = 14;  // Hole for the hotend (J-Head diameter is 16mm).
height = 10;
cone_r1 = 2.5;
cone_r2 = 14;

module vholes(mp)
{
    rotate([0, 0, mp - 10]) translate([0, mount_radius - 1, 0]) 
             cylinder(r=m3_radius, h=2*height, center=true, $fn=12);
    rotate([0, 0, mp + 10]) translate([0, mount_radius - 1, 0]) 
             cylinder(r=m3_radius, h=2*height, center=true, $fn=12);
}

module enhancement_cuts()
{
    vholes(180);
    vholes(60);
    vholes(300);
    // Sensor
    rotate([0, 0, 180]) translate([0, mount_radius+10, 0]) 
             cylinder(r=2.5, h=8*height, center=true, $fn=12);
}



module ear_body()
{
    %translate([-18,22,1]) rotate([45,180,0]) boltHole(3, length=8);
    %translate([-18,18,-3]) rotate([45,180,0]) nutHole(3);
    translate([0, offset, 0]) difference() {
	    intersection() {
	      cube([separation, 40, height], center=true);
	      translate([0, -4, 0]) rotate([0, 90, 0])
		cylinder(r=10, h=separation, center=true);
	      translate([separation/2-7, 0, 0]) rotate([0, 90, 0])
		     cylinder(r=cone_r2,  h=14, center=true, $fn=24);
	    }
	   }

}

module ear_cuts()
{
   
    translate([18, offset, 1]){ 
         rotate([-45,0,0]) cylinder(r=5.5,h=7);
         rotate([-45,0,0]) translate([0,0,-8]) boltHole(3, length=8);
         rotate([-45,0,0]) translate([0,0,-8]) nutHole(3);
         rotate([-45,0,0]) translate([0,0,-9.5]) cylinder(r=5,h=3);
         }
    
}

module new_ears(){
    for (s = [-1, 1]) scale([s, 1, 1]) {
	    difference(){
            ear_body();
            ear_cuts();
            }
     }
      
       

}

module effector() {
  difference() {
    union() {
      cylinder(r=offset-2, h=height, center=true, $fn=36);
      rotate([0, 0, 180]) translate([-13, mount_radius-2, -5]) cube([25,15,2]);
      
      for (a = [60:120:359]) rotate([0, 0, a]) {
      new_ears();
      }
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

  

translate([0, 0, height/2]) effector();
