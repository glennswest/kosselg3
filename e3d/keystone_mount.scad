include <configuration.scad>;
include <nutsnbolts/cyl_head_bolt.scad>;
include <nutsnbolts/materials.scad>;
include <keystone.scad>

module keystone_mount_body()
{

    translate([-24.9,4.8,-7.5])  rotate([90,0,0]) cube([20,30.5,5]);
    
     
}

module keystone_mount_cuts()
{
   

    rotate([90,0,0]) translate([-15, 15, 8]) hole_through("M5",14);    
    rotate([90,0,0]) translate([-15,  1, 8]) hole_through("M5",14);    

}

module keystone_mount()
{
   difference(){
       keystone_mount_body();
       keystone_mount_cuts();
       }
    translate([-5,-9.9+4.8,23]) rotate([270,270,0]) keystone();
}


module keystone_mount_bottom()
{
   difference(){
       keystone_mount_body();
       keystone_mount_cuts();
       }
    translate([-5,-0.3,23]) rotate([270,270,0]) keystone();
}


keystone_mount();

translate([0,0,50]) keystone_mount_bottom();