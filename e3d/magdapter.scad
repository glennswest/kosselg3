use <../MCAD/nuts_and_bolts.scad>;


module mount_tab()
{
      difference(){
        cylinder(r=7,h=3);
        translate([0,0,-.1]) cylinder(r=3.5,h=3.2);
        //translate([-7,0,-0.1]) cube([14,14,14]);
        }

}

module magdapter_cuts()
{

		 rotate([-45,0,0]) translate([0,0,-.1]) cylinder(r=5,h=3);
         rotate([-45,0,0]) translate([0,0,2])  boltHole(3, length=8);
         rotate([-45,0,0]) translate([0,0,5])  nutHole(3);

         rotate([-45,0,0]) translate([0,0,-9.5]) cylinder(r=5,h=3);

}

module magdapter_body()
{
	   rotate([-45,0,0]) cylinder(r=7,h=7);
       rotate([-135,0,0]) translate([0,-6,-5]) mount_tab();
       %rotate([-45,0,0]) translate([0,0,4])  boltHole(3, length=5);
       %rotate([-45,0,0]) translate([0,0,5])  nutHole(3);
       %rotate([-135,0,0]) translate([0,-11,-2])  boltHole(3, length=8);

}

module magdapter()
{

	difference(){
         magdapter_body();
         magdapter_cuts();
         }

}


magdapter();