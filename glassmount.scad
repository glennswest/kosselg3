use <MCAD/nuts_and_bolts.scad>;

module arc( height, depth, radius, degrees ) {
    // This dies a horible death if it's not rendered here 
    // -- sucks up all memory and spins out of control 
    render() {
        difference() {
            // Outer ring
            rotate_extrude($fn = 100)
                translate([radius - height, 0, 0])
                    square([height,depth]);
         
            // Cut half off
            translate([0,-(radius+1),-.5]) 
                cube ([radius+1,(radius+1)*2,depth+1]);
         
            // Cover the other half as necessary
            rotate([0,0,180-degrees])
            translate([0,-(radius+1),-.5]) 
                cube ([radius+1,(radius+1)*2,depth+1]);
         
        }
    }
}

module glass_tab_cuts()
{

 translate([-50,-110,3]) rotate([180,0,0]) boltHole(5,"MM", 50);
 translate([-12,-120,3]) rotate([180,0,0]) boltHole(5,"MM", 50);
 translate([-38,-135,45]) rotate([180,0,0]) boltHole(3,"MM", 50);
 translate([-38,-135,2]) rotate([180,0,0]) nutHole(3,"MM");
}



module glass_tab_body()
{
	
    arc(20, 6, 130, 30);
    rotate([0,0,-8]) arc(21, 6, 150, 15);
    %translate([-50,-110,4]) rotate([180,0,0]) boltHole(5,"MM", 50);
    %translate([-12,-120,4]) rotate([180,0,0]) boltHole(5,"MM", 50);
    %translate([-38,-135,45]) rotate([180,0,0]) boltHole(3,"MM", 50);
    %translate([-38,-135,3.9]) rotate([180,0,0]) nutHole(3,"MM");
}

module glass_tab()
{
	
        difference(){
             glass_tab_body();
             glass_tab_cuts();
             }

}

module glass_mount_cuts()
{

    translate([-48,-130,45]) rotate([180,0,0]) boltHole(3,"MM", 50);
    translate([-48,-130,3.9]) rotate([180,0,0]) nutHole(3,"MM");

}

module glass_mount_body()
{
	
    arc(20, 6, 130, 40);
    rotate([0,0,-13]) arc(21, 8, 150, 15);
    %translate([-48,-130,45]) rotate([180,0,0]) boltHole(3,"MM", 50);
    %translate([-48,-130,3.9]) rotate([180,0,0]) nutHole(3,"MM");

}

module glass_mount()
{
	difference(){
	   glass_mount_body();
	   glass_mount_cuts();
       }

}

glass_mount();
rotate([0,0,-50]) glass_tab();