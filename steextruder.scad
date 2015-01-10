/**************
SteExtruder by SteDf

Based on Johann's Kossel extruder from the repo files at
https://github.com/jcrocholl/kossel

which is Based on "Makergear Filament drive goes Bowden" by Luke321
http://www.thingiverse.com/thing:63674
**************/

include <configuration.scad>;

/**************
	ori_rad 	is the original radius of the pulley / spur gear
				it's the base for all the calculations, 
				so do not modify it !!!

	new_rad 	is the radius of the pulley / spur gear

	pn_rad 	is the radius of the pneumatic fit screw

	pi_rad 		is the extra radius for the pulley / spur gear indent

	pi_h 		is the height of the pulley / spur gear indent

	hmount	is to enable (1) or disable (0) the mounting bracket

	to obtain the same dimensions as per the original Johann's design just modify:
	new_rad = 6.6;
	pi_rad = 0.4;
	pi_h = 5.6;
	pn_rad = 2.3;
	hmount = 0;
**************/

ori_rad = 6.6;		// do not modify everything is based on this


// ************ Parameters
new_rad = 5.7;

pi_h=5.6; 			// original was 5.6
pi_rad = 0.8; 		// original was 0.4

pn_rad = 2.9;		// original was 2.3

hmount = 1;
// ************ End Parameters


filament_offset = 22.5 + (new_rad - ori_rad);

module extruder() {
  rotate([90, 0, 0]) difference() {
    union() {
      // ----- main cylinder
      translate([16,20,21]) rotate([90,0,0]) cylinder(h=20, r=17.5);

      // ----- bearing mount
	translate([31 + (new_rad - ori_rad),20,21]) rotate([90,0,0]) cylinder (h=20, r=8);

      // ----- pushfit/pneufit mount
      translate([filament_offset, 6.5, 13])
        cylinder(r=7.5, h=20, center=true, $fn=6);

      // ----- filament support
      translate([21.75,6.5,34]) rotate([0,0,0]) cylinder (h=8, r=3, $fn=12);

      // ----- clamp
      translate([20, 0, 28]) cube([13, 20, 14]);
    }

    // ----- pulley opening
    translate([16,21,21]) rotate([90,0,0]){
      cylinder (h=22, r=new_rad);

      rotate([0,0,45]) {
        //translate([14,0,0]) cylinder(h=22, r=1.6, $fn=12);
        translate([0,14,0]) cylinder(h=22, r=1.6, $fn=12);
        translate([-14,0,0]) cylinder(h=22, r=1.6, $fn=12);
        translate([0,-14,0]) cylinder(h=22, r=1.6, $fn=12);
      }
    }

    // ----- gearhead indentation
    translate([16,21,21]) rotate([90,0,0]) cylinder (h=3.35, r=11.25);

    // ----- pulley hub indentation
    translate([16,20-2,21]) rotate([90,0,0]) cylinder (h=pi_h, r=new_rad+pi_rad);

    // ----- bearing screws
    translate([31 + (new_rad - ori_rad),21,21]) rotate([90,0,0]) cylinder (h=22, r=2.6, $fn=12);
    #translate([31 + (new_rad - ori_rad),22,21]) rotate([90,30,0]) cylinder (h=8.01, r=4.7, $fn=6);

    // ----- bearing
    difference() {
      union() {
        translate([31,9.5,21]) rotate([90,0,0]) cylinder (h=5.25, r=8.5);
        translate([31,9.5-5.25,21-8.25-2]) cube([20, 5.25, 18.5]);
        // ----- opening between bearing and pulley
        translate([20,9.5-5.25,21-8.25+3.25+1]) cube([10, 5.25, 8]);
      }
      // ----- removable supports
     // for (z = [15:3:27]) {
      //  translate([36, 10, z]) # cube([20, 20, 0.5], center=true);
    //  }
    }

    // ----- filament path chamfer
    translate([filament_offset,6.5,15]) rotate([0,0,0]) #
      cylinder(h=3, r1=0.5, r2=3, $fn=12);

    // ----- filament path
    translate([filament_offset,6.5,-10]) rotate([0,0,0]) #
      cylinder(h=60, r=1.1, $fn=12);

    // ----- pushfit/pneufit mount
    translate([filament_offset, 6.5, 0]) # cylinder(r=pn_rad, h=8, $fn=12);

    // ----- clamp slit
    translate([25 + (new_rad - ori_rad),-1,10]) cube([2, 22, 35]);
    // ----- clamp nut
    translate([10.5,12,38]) rotate([0,90,0])
      cylinder(h=11, r=m3_nut_radius, $fn=6);
    // ----- clamp screw hole
    translate([15,12,38]) rotate([0,90,0])
      cylinder(h=20, r=m3_wide_radius, $fn=12);
  }

  // ----- with mounting bracket	
  if (hmount) {
	translate([2,-42.5,0]) rotate([0,0,90]) cube([42,4,10]);
	difference() {
  	  difference() {
	    translate([-1,-51.5,0]) rotate([0,0,90]) cube([60,3,10]);
          translate([-5,-51.5+5,0+5]) rotate([0,90,0]) cylinder(h=10, r=m3_wide_radius, $fn=12);
        }
          translate([-5,0+4,0+5]) rotate([0,90,0]) cylinder(h=10, r=m3_wide_radius, $fn=12 );
    }
 }
}

extruder();
