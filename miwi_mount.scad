use <MCAD/nuts_and_bolts.scad>;
use <grid.scad>;

module miwi_mount_body()
{
	cube([90,8,60]);
    %translate([78,4,50]) rotate([90,0,0]) boltHole(5,"MM", 12);
    %translate([45,4,50]) rotate([90,0,0]) boltHole(5,"MM", 12);
    %translate([12,4,50]) rotate([90,0,0]) boltHole(5,"MM", 12);
    %translate([78,4,10]) rotate([90,0,0]) boltHole(5,"MM", 12);
    %translate([45,4,10]) rotate([90,0,0]) boltHole(5,"MM", 12);
    %translate([12,4,10]) rotate([90,0,0]) boltHole(5,"MM", 12);
   // %translate([10,8,26.31+6])  rotate([90,0,0]) cube([40,6,8]);
   translate([0,0,15]) cube([90,8,60]);
  // %translate([0,8,75]) rotate([90,0,0]) cube([40,40,40]);
   // Bottom Shelf
   translate([0,8,74]) rotate([90,0,0]) cube([90,8,8]);
   translate([0,-10,75]) rotate([0,90,0]) cube([10,10,90]);
   translate([0,-15,75]) rotate([0,90,0]) cube([5,5,90]);
   //BSU Back Wall
   translate([0,0,80]) cube([90,8,60]);
   translate([25,-6,145]) rotate([0,90,0]) import("din.stl", convexity=3);
   // Top Shelf
   //translate([0,8,180]) rotate([90,0,0]) cube([90,8,120]);
   //translate([0,-52,131]) rotate([90,0,90]) grid(120,111);
   //translate([90,-52,131]) rotate([90,0,90]) grid(120,111);
}   


module miwi_mount_cuts()
{
 translate([78,4,50]) rotate([90,0,0]) boltHole(5,"MM", 12);
 translate([45,4,50]) rotate([90,0,0]) boltHole(5,"MM", 12);
 translate([12,4,50]) rotate([90,0,0]) boltHole(5,"MM", 12);
 translate([78,4,10]) rotate([90,0,0]) boltHole(5,"MM", 12);
 translate([45,4,10]) rotate([90,0,0]) boltHole(5,"MM", 12);
 translate([12,4,10]) rotate([90,0,0]) boltHole(5,"MM", 12);
 translate([25,8.1,26.31+6])  rotate([90,0,0]) cube([40,8,10]);
}

module miwi_mount()
{
	difference(){
          miwi_mount_body();
	      miwi_mount_cuts();
          }


}

miwi_mount();