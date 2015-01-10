
use <../MCAD/nuts_and_bolts.scad>;
include <nutsnbolts/cyl_head_bolt.scad>;
include <nutsnbolts/materials.scad>;

sblen = 54;

module senbracket()
{
    difference(){
        translate([35,0,0]) cube([15,4,30]);
        translate([12.5+30, 3, 22.5]) rotate([90,180,0])  boltHole(3,length=8);
        translate([10+30, 2, 5]) rotate([90,180,0])  boltHole(3,length=8);
        translate([15+30, 2, 5]) rotate([90,180,0])  boltHole(3,length=8);
    }
}

module senmount_body()
{

	translate([5,0,0]) cube([15,15,2]);
        translate([5,0,0]) cube([15,3,sblen]);
        translate([5,0,0]) cube([3,15,sblen]);
	
        translate([5,0,sblen]) cube([15,15,5]);
	
    
        
}

module senmount_cuts()
{
	
    translate([12.5,7.5,-0.1]) cylinder(r=2.45,h=3);
    translate([12.5,7.5,sblen]) nutHole(3);
    translate([12.5,7.5,sblen-1]) boltHole(3,length=9);
	
    
    
    	


	
}


module senmount()
{
	difference(){
		senmount_body();
		senmount_cuts();
	        }
	
}


rotate([0,-90,0]) senmount();
%senbracket();