include <configuration.scad>;

sticky_width = 25.4;
sticky_length = 25.4;
sticky_offset = 10;  // Distance from screw center to glass edge.
m5_wide_radius = 2.5;

// Make the round edge line up with the outside of OpenBeam.
screw_offset = sticky_width/2 - 10;
cube_length = sticky_length + sticky_offset - screw_offset;

module glass_tab() {
  difference() {
    translate([0, screw_offset, 0]) union() {
      cylinder(r=sticky_width/2, h=thickness, center=true);
      translate([0, cube_length/2, 0])
        cube([sticky_width, cube_length, thickness], center=true);
    }
    cylinder(r=m5_wide_radius, h=20, center=true, $fn=12);
  }
  // Scotch restickable tab for mounting.
  translate([0, sticky_length/2+sticky_offset, thickness/2]) %
    cube([sticky_width, sticky_length, 0.7], center=true);
  // Horizontal OpenBeam.
  translate([0, 0, (20+thickness)/-2]) %
    cube([100, 20, 20], center=true);
}

translate([0, 0, thickness/2]) glass_tab();
