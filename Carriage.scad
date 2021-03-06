use <CarriageSupport.scad>;
use <MCAD/nuts_and_bolts.scad>;

hori = 39;
verti = 50;
fn_cercles=50;
armspace = 50;

module arm_mount()
{
    difference(){
       cylinder(r=6.5,h=4+12.5); // Mag stack is 12.5 + 4 for base height
       translate([0,0,12.4]) rotate([0,180,0]) cylinder(r=5.1,h=12.5);
       translate([0,7,11]) rotate([90,90,0]) boltHole(3,length=15);
       translate([0,7,3]) rotate([90,90,0]) boltHole(3,length=15); 
       
       } 
    
}



    
    
 translate([-10,32,0]) cube([20,10,8]);
 difference(){
    translate([-25,32,3]) cube([50,10,5]);
    translate([-52/2,38,1.5]) rotate([90,0,90]) cylinder(r=6.5,h=18);
    translate([ 52/2,38,1.5]) rotate([90,0,-90]) cylinder(r=6.5,h=18); 
    }
  difference(){    
    translate([-9,42,-2]) cube([18,3,10]);
    translate([0,45,4]) rotate([270,0,180]) boltHole(3,length=8);   
    }
 translate([-armspace/2,38,1.5]) rotate([90,0,90]) arm_mount();
 translate([ armspace/2,38,1.5]) rotate([90,0,-90]) arm_mount();
 //difference(){
 //    translate([-3.5,35,-14]) cube([7,7,14]);
     // Elastic Mount
 //    translate([-3.5+3.5,34.5+4,-13]) boltHole(3,length=23,$fn=128); 
 //}

difference(){
	translate([0,14,3])
		rotate([0,180,0])
			carriage();
	translate([-58,0,-5])
		rotate([0,-7,0])
			cube([100,100,2], center=true);
	translate([0,0,-30])
		cube([100,100,5], center=true);
}

// Mag Mount
//        difference(){
//            translate([0,-verti/2-7,4]) rotate([270,90,0]) cylinder(r=4,h=10);
//            translate([0,-verti/2-5.1,4]) rotate([270,90,0]) boltHole(3,length=20);
//              }
difference(){
	difference(){
		roundedRect(size = [hori+10,verti+10,8], radius = 5);
        linear_extrude(height = 0.5){ 
           translate([27,0,0.4]) rotate([0,180,0]) 
            text("V3", size="4", font ="Lobster Two");
           }
		translate([-11,2,0])
			cube([2,24,30], center=true);
		translate([-20,14,0])
			cube([20,2,30], center=true);

		translate([-5,8,0])
			rotate([0,0,90])
				cube([5.5,3,30], center=true);
               
	}
 
//hueco rodes
	union(){
		translate([(hori/2)-1,-(verti/2),0])
			cylinder(h=20,d=6,$fn=fn_cercles,center=true);
		translate([(hori/2)-1,(verti/2),0])
			cylinder(h=20,d=6,$fn=fn_cercles,center=true);
		translate([-(hori/2)+.3,0,0])
			cylinder(h=20,d=6,$fn=fn_cercles,center=true);
	}
//hueco cap rodes tornillo
	union(){
		translate([(hori/2)-1,-(verti/2),-2])
			cylinder(h=12,d=10,$fn=fn_cercles,center=true);
		translate([(hori/2)-1,(verti/2),-2])
			cylinder(h=12,d=10,$fn=fn_cercles,center=true);
		translate([-(hori/2)+.3,0,-2])
			cylinder(h=12,d=10,$fn=fn_cercles,center=true);
	}
//hueco tornillo
	rotate([0,90,0])
		translate([-4,8,-7])
			cylinder(h=55,d=3.2,$fn=fn_cercles,center=true);
//ranura cap tornillo
	rotate([0,90,0])
		translate([-4,8,-25])
			cylinder(h=4,d=5.2,$fn=fn_cercles,center=true);
}






module roundedRect(size, radius) {

	x = size[0];
	y = size[1];
	z = size[2];

	linear_extrude(height=z)
	hull()
	{
    	// place 4 circles in the corners, with the given radius
    	translate([(-x/2)+(radius/2), (-y/2)+20, 0])
    	circle(r=radius);

    	translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
    	circle(r=radius);

    	translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
    	circle(r=radius);

    	translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
    	circle(r=radius);
	}
}
