//triangle.scad
/*         C
           .
          / \
       b /   \ a
        /     \
      A.-------.B
           c
   Triangle referenced in these modules:
   side c is the base opposite angle C
   b is the upper left side opposite angle B
   a is the upper right side opposite angle A
   angle A will be at the origin
	center moves the triangle down half its height
*/
// usage: rTriangle(center=true);
module rTriangle(c=8, b=4, h=1, center=false){
  rightTriangle(c, b, h, center);
}
module rightTriangle(c=3, b=4, h=1, center=false)
{// b is y, c is x 
  q = center==true ? 1 : 0;
  translate([0, 0, -q*h/2])
  linear_extrude(height=h)
  polygon(points=[[0,0],[0,b],[c,0]],paths=[[0,1,2]]);
}

// usage: hlTriangle(center=true);
module hlTriangle(hyp=8, leg=4, h=1, center=false){
  hypotenuseLegTriangle(hyp, leg, h, center);
}//leg is the y, s the x
module hypotenuseLegTriangle(hyp=5, leg=4, h=1, center=false){
  s=sqrt(hyp*hyp-leg*leg);
  rightTriangle(s, leg, h, center);
}

// usage: iTriangle(5,30,1,true);
module iTriangle(side=5, angle=30, h=1, center=false){
  isoscelesTriangle(side, angle, h, center);
}
module isoscelesTriangle(side=5, angle=30, h=1, center=false){// side is the length of the egual sides of the included angle
  q = center==true ? 1 : 0;
  baseAngle=(180-angle)/2;
  y=side*sin(baseAngle);
  x=2*side*sin(angle/2);

  translate([0, 0, -q*h/2])
  linear_extrude(height=h)
  polygon(points=[[0,0],[x/2,y],[x,0]],paths=[ [0,1,2] ]);
}

// usage: eTriangle(5,1,true);
module eTriangle(side=5, h=1, center=false){
  equilateralTriangle(side, h, center);
}//Equilateral triangle is special case isosceles triangle.
module equilateralTriangle(side=5, h=1, center=false){
  isoscelesTriangle(side, 60, h, center);
}

// usage: sasTriangle(center=true);
module sasTriangle(b=6, A=120, c=5, h=1, center=false){
  // c is the base of the triangle
  // b is the upper left side
  // A is the included A
  q = center==true ? 1 : 0;
  
  translate([0,0,-h/2*q])
  linear_extrude(height=h)
  if (A <= 90){
    polygon(points=[[0,0],[b*cos(A),b*sin(A)],[c,0]],paths=[ [0,1,2] ]);
  }else{ // > 90
    polygon(points=[[0,0],[-b*cos(180-A),b*sin(180-A)],[c,0]],paths=[[0,1,2]]);
  }
}

// usage: asaTriangle(center=true);
module asaTriangle(A=120, c=4, B=30, h=1, center=false){// arbitrarly the first angle is the left one upper of the 4 possible positions.
  C = 180 - A - B;//third angle opposite side c.
  // Law of sines: b/sin(B) = c/sin(C) so:
  b = c*sin(B)/sin(C);

  sasTriangle(b,A,c,h,center);  
}

// usage: sssTriangle(center=true);
module sssTriangle(a=6,b=3,c=8,h=1,center=false){
  // sum of a and b must be larger than c
  // law of cosines: 
  A = acos((b*b + c*c - a*a)/(2*b*c));

  sasTriangle(b,A,c,h,center);
}

//usage: trapezoid(center=true);
module trapezoid(th=6, tw=15, eh=10, alpha=60, center=false){
	/* regular trapezoid
	th=trapezoid height
   tw=trapezoid major side width
	eh=extrusion height
   alpha=degree measure of acute angles
   */
	// Included with triangles since a trapezoid is a truncated triangle...  ;)
	x=th/tan(alpha);

	if(center==true){
		translate([-tw/2,0,-eh/2])
		linear_extrude(height=eh) 
		polygon(points=[ [0,0],[x,th],[tw-x,th],[tw,0] ],
				  paths=[ [0,1,2,3] ]);
	} else {
		linear_extrude(height=eh) 
		polygon(points=[ [0,0],[x,th],[tw-x,th],[tw,0] ],
				  paths=[ [0,1,2,3] ]);
	}
}
