/*
Info: 
This lib contains things like screws, nuts and bearings.

Improvement:
- wasn't there before

TODO: 
- differentiate between parts that get substracted and normal parts (different diameters)

*/

M3_screw_hole_dia = 3.4;
M3_nut_hole_dia = 6.2+0.2;

M4_screw_hole_dia = 4.4;
M4_nut_hole_dia = 7.7+0.2;

module screw_M3(length) {
    cylinder(d=M3_screw_hole_dia, h=length);
	cylinder(d=M3_nut_hole_dia, h=2.3, center=true, $fn=6);
}

module screw_M4(length) {
    cylinder(d=M4_screw_hole_dia, h=length);
	cylinder(d=M4_nut_hole_dia, h=3.3, center=true, $fn=6);
}


// Bearing - inner Diameter, outer diameter, width
module bearing(ID,OD,W) {
    
    translate([0,0,W/2]) difference() {
    cylinder(d=OD, h=W, center=true);
    cylinder(d=ID, h=W+1, center=true);
    }
}

// unregular cube
// 4 of the 12 edges are rounded
module round_cuboid(x,y,z,r) 
{
    cube([x,y-2*r,z],center=true);
    cube([x-2*r,y,z],center=true);
    cube([x-2*r,y-2*r,z],center=true);
    
    translate([+x/2-r,+y/2-r,0]) cylinder(r=r,h=z,center=true);
    translate([+x/2-r,-y/2+r,0]) cylinder(r=r,h=z,center=true);
    translate([-x/2+r,+y/2-r,0]) cylinder(r=r,h=z,center=true);
    translate([-x/2+r,-y/2+r,0]) cylinder(r=r,h=z,center=true);
}   
