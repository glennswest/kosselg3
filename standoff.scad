module standoff(ht)
{
        difference(){
                cylinder(r=2.2,h=ht);
        cylinder(r=1.55,h=ht+.2);
        }

}


translate([45,0,0]) standoff(2);
translate([45,10,0]) standoff(2);
translate([45,20,0]) standoff(2);
translate([45,30,0]) standoff(2);
translate([35,0,0]) standoff(2);
translate([35,10,0]) standoff(2);
translate([35,20,0]) standoff(2);
translate([35,30,0]) standoff(2);
translate([25,0,0]) standoff(2);
translate([25,10,0]) standoff(2);
translate([25,20,0]) standoff(2);
translate([25,30,0]) standoff(2);
translate([15,0,0]) standoff(2);
translate([15,10,0]) standoff(2);
translate([15,20,0]) standoff(2);
translate([15,30,0]) standoff(2);
