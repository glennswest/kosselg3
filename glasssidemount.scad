include <MCAD/units.scad>;
include <MCAD/materials.scad>
include <MCAD/boxes.scad>;
use <MCAD/shapes.scad>;
use <MCAD/nuts_and_bolts.scad>;


module gb_body()
{
    cube([40,20,6]);
    rotate([90,0,0]) cube([40,20,5]);
    %translate([10,-3,12.5]) rotate([90,0,0]) boltHole(5, length=12);
    %translate([30,-3,12.5]) rotate([90,0,0]) boltHole(5, length=12);
    %translate([20,10,2]) rotate([0,0,0]) boltHole(3, length=12);
    %translate([20,10,4]) rotate([0,0,0]) nutHole(3);
}

module gb_cuts()
{
    translate([10,-3,12.5]) rotate([90,0,0]) boltHole(5, length=12);
    translate([30,-3,12.5]) rotate([90,0,0]) boltHole(5, length=12);
    translate([20,10,2]) rotate([0,0,0]) boltHole(3, length=12);
    translate([20,10,4]) rotate([0,0,0]) nutHole(3);
}



module gb()
{
    difference(){
        gb_body();
        gb_cuts();
    }
    
}

rotate([270,0,0]) gb();