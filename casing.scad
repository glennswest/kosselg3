



module corner_body()
{
	rotate([90,0,60]) translate([-10,0,-6]) cube([20,20,100]);
        rotate([90,0,-60]) translate([-10,0,-6]) cube([20,20,100]);
        rotate([0,0,180]) translate([-10,0,0]) cube([20,50,20]);	
}

module corner_cuts()
{
	rotate([0,0,60]) translate([0,-53,-.1])    cylinder(r=6,h=20.2);
	rotate([0,0,60]) translate([0,-53+15,-.1]) cylinder(r=6,h=20.2);
	rotate([0,0,-60]) translate([0,-53,-.1])    cylinder(r=6,h=20.2);
	rotate([0,0,-60]) translate([0,-53+15,-.1]) cylinder(r=6,h=20.2);
	
	rotate([0,0,-60]) translate([0,-53+15,-.1]) cylinder(r=6,h=20.2);
	
	
}


module corner()
{
		difference(){
			corner_body();
			corner_cuts();
		}
	
}

corner();