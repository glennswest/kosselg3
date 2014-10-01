/* basic box for smoothie board V1,only the bottom, the top is open and the sides are available */
use <myLibs.scad>

// width and length of board
w= 50.8;
l= 96.0;
board_thickness= 1.65;

// hole postions relative to edges and hole diameter and standoff height and diameter
standoff_ht= 3;
standoff_id= 3-0.5;
standoff_od= standoff_id+(2.1*2);
hole_dia= 3;

holesepl= 88.88;
holesepw= 42.96;
// [ [x1, y1], [x2, y2],..., ] offsets from edges
holes= [ [-holesepw/2, -holesepl/2], [holesepw/2, holesepl/2], [-holesepw/2, holesepl/2], [holesepw/2, -holesepl/2] ];

rounded= 10; // radius of rounded corners
base_thickness= 2; // base thickness
wall_thickness= 2.1; // wall thickness

ht= standoff_ht+base_thickness;

module base() {
	union() {
		difference() {
			rounded_base(w+rounded, l+rounded, rounded, ht);
			//translate([0, 0, base_thickness]) rounded_base(w+rounded-wall_thickness, l+rounded-wall_thickness, rounded, ht);
		}

		for(p= holes) {
			//translate([p[0],p[1],base_thickness]) cylinder(r=standoff_od/2, h=standoff_ht);
		}
	}
}

module tab() {
	w= 40;
	l= 20;
	h= 5;
	difference() {
		translate([0, 0, h/2])  cube([w, l, h], center=true);
		translate([-10, 0, -1])  hole(4, 20);
		translate([10, 0, -1])  hole(4, 20);
	}
}

module case_body() {
	// difference() { // for screw holes
	// 	base();
	// 	for(p= holes) #translate([p[0], p[1], -20/2]) hole(standoff_id, 20);
	// }
	// for pins
	union() {
		base();
		
		// tabs
		rotate([90,0,0]) translate([0, -10, -33]) tab();
		//translate([0, -l/2-11, 0]) tab();
	}
}

module case_cuts()
{
    for(p= holes) translate([p[0], p[1], 0-.1]) cylinder(r= hole_dia/2+0.1, h=ht+.2, $fn=64);
    for(p= holes) translate([p[0], p[1], 0-.2]) cylinder(r= 5/2+0.5, h=ht-3, $fn=64);
}

module case() {
	difference()
    {
           case_body();
           case_cuts();
    }
}

module standoff()
{
	difference(){
		cylinder(r=2.5,h=ht);
        cylinder(r=1.5,h=ht);
        }

}

case();
translate([45,0,0]) standoff();
translate([45,10,0]) standoff();
translate([45,20,0]) standoff();
translate([45,30,0]) standoff();
//% translate([-w/2, -l/2, standoff_ht+base_thickness]) cube(size=[w, l, board_thickness], center=false);
