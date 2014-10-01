
module grid(gridX=100,gridY=100,borderX=10,borderY=10,meshSolid=.5,meshSpace=2,thickness=1.5)
{
//-------------------------------------------------
	meshX=gridX-(borderX*2);
	meshY=gridY-(borderY*2);
	nX=meshX/(meshSolid+meshSpace);
	nY=meshY/(meshSolid+meshSpace);

	difference() {
		cube (size=[gridX,gridY,thickness],center=true);
		cube (size=[meshX,meshY,thickness],center=true);
		}

	for (i=[0:nX]) {
	 	 translate([-(meshX/2)+i*(meshSolid+meshSpace),-meshY/2,-thickness/2]) cube(size=[meshSolid,meshY,thickness],center=false);
		 }

	for (i=[0:nY]) {
	 	translate([-meshX/2,-(meshY/2)+i*(meshSolid+meshSpace),-thickness/2]) cube(size=[meshX,meshSolid,thickness],center=false);

         }

}   

grid();