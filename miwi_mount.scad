use <MCAD/nuts_and_bolts.scad>;
use <grid.scad>;

module extension_mount(wi=90)
{
    difference(){
       extension_mount_body(wi);
       extension_mount_cuts();
       }
}

module extension_mount_body(wi)
{
	translate([0,4,0]) cube([wi,4,20]);
    %translate([78,6,10]) rotate([90,0,0]) boltHole(5,"MM", 12);
    %translate([45,6,10]) rotate([90,0,0]) boltHole(5,"MM", 12);
    %translate([12,6,10]) rotate([90,0,0]) boltHole(5,"MM", 12);
}

module extension_mount_cuts()
{
    translate([78,6,10]) rotate([90,0,0]) boltHole(5,"MM", 12);
    translate([45,6,10]) rotate([90,0,0]) boltHole(5,"MM", 12);
    translate([12,6,10]) rotate([90,0,0]) boltHole(5,"MM", 12);	
}




module din_mount_cuts()
{
	translate([12.5,7,0]) rotate([90,0,0]) boltHole(3,"MM", 12);
	translate([32.5,7,0]) rotate([90,0,0]) boltHole(3,"MM",12);
    translate([52.5,7,0]) rotate([90,0,0]) boltHole(3,"MM",12);
    translate([72.5,7,0]) rotate([90,0,0]) boltHole(3,"MM",12);
}


module din_mount_body()
{
    translate([-3,0,-5]) cube([90,8,10]);
	%translate([12.5,7,0]) rotate([90,0,0]) boltHole(3,"MM", 12);
	%translate([32.5,7,0]) rotate([90,0,0]) boltHole(3,"MM",12);
    %translate([52.5,7,0]) rotate([90,0,0]) boltHole(3,"MM",12);
    %translate([72.5,7,0]) rotate([90,0,0]) boltHole(3,"MM",12);
}

module din_mount()
{
	difference(){
           din_mount_body();
           din_mount_cuts();
           }
}

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
 //  translate([0,-10,75]) rotate([0,90,0]) cube([10,10,90]);
 //  translate([0,-15,75]) rotate([0,90,0]) cube([5,5,90]);
   //BSU Back Wall
   translate([0,0,80]) cube([90,8,44]);
  
   translate([3,0,145-18]) rotate([0,0,0]) din_mount();
   translate([0,0,132]) cube([90,8,8]);
   translate([0,0,140]) rotate([0,0,0]) extension_mount();
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
 translate([25,8.1,24.31+6])  rotate([90,0,0]) cube([40,8,10]);
}

module miwi_mount()
{
	difference(){
          miwi_mount_body();
	      miwi_mount_cuts();
          }

   
}

miwi_mount();