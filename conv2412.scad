// Converter Holder

xspacing = 58;
yspacing = 37;

module conv_body()
{
	cube([68,50,2]);
	translate([27.5+1.5,0,-20]) cube([10,50,20]);
	rotate([0,0,0]) translate([0,0,-20]) cube([68,5,20]);
	
}


module conv_cuts()
{
	x1 = 5.5;
	x2 = x1 + xspacing;
	y1 = 9;
	y2 = y1 + yspacing;
	
	translate([x1,y1,-.1]) cylinder(r=1.5,h=6);
	translate([x1,y2,-.1]) cylinder(r=1.5,h=6);
	translate([x2,y1,-.1]) cylinder(r=1.5,h=6);
	translate([x2,y2,-.1]) cylinder(r=1.5,h=6);
	
        translate([53,-1,-10]) rotate([270,0,0]) cylinder(r=2.5,h=7);
	translate([15,-1,-10]) rotate([270,0,0]) cylinder(r=2.5,h=7);
}

module conv()
{
	difference()
	{
		conv_body();
		conv_cuts();
	}
	
	
}

conv()
{
	
	
}