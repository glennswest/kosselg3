include <triangle.scad>
include <configuration.scad>

plate_radius=170/2;
plate_height=3;
clip_lip=2;
offset_multiplier=1.33;
clip_thickness=clip_lip+plate_height*2;
triangle_side=20;
triangle_hypotenuse=triangle_side*sqrt(2);
corner_radius=triangle_side/3;

rotate([0,-90,0]){
translate([corner_radius,corner_radius,0]){
difference(){
union(){
sssTriangle(triangle_hypotenuse, triangle_side, triangle_side, clip_thickness, center=true);

translate([triangle_side*2/3, 0, -clip_thickness/2])
	cylinder(h=clip_thickness, r=corner_radius, $fn=60);

translate([0, triangle_side*2/3, -clip_thickness/2])
	cylinder(h=clip_thickness, r=corner_radius, $fn=60);

translate([0, 0, -clip_thickness/2])
	cylinder(h=clip_thickness, r=corner_radius, $fn=60);

translate([0, -corner_radius, -clip_thickness/2])
	cube([corner_radius*2, corner_radius, clip_thickness]);

translate([-corner_radius, 0, -clip_thickness/2])
	cube([corner_radius, corner_radius*2, clip_thickness]);

translate([triangle_side*2/3, 0, -clip_thickness])
	cylinder(h=clip_thickness, r2=m3_wide_radius*2, r1=m3_wide_radius+m3_wide_radius/3, $fn=60);

translate([0, triangle_side*2/3, -clip_thickness])
	cylinder(h=clip_thickness, r2=m3_wide_radius*2, r1=m3_wide_radius+m3_wide_radius/3, $fn=60);
}

translate([triangle_side*2/3, 0, -clip_thickness])
	cylinder(h=clip_thickness, r=m3_wide_radius, $fn=60);

translate([0, triangle_side*2/3, -clip_thickness])
	cylinder(h=clip_thickness, r=m3_wide_radius, $fn=60);

translate([0, 0, -clip_thickness/2])
	cylinder(h=clip_thickness, r=m3_wide_radius+.5, $fn=60);

translate([plate_radius/offset_multiplier, plate_radius/offset_multiplier, -plate_height/2])
	cylinder(h=plate_height, r=plate_radius, $fn=60);
}
}
}


