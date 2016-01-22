/* 
Info: 
This part is just a template for the other parts of the linear drive.

Improvement: 
- diagonal fin is parametrised and reusable
- remove screw-models --> put in misc-parts

TODO: 
- 
*/

rod_distance    = 60; // Smooth rod distance (center to center)
rod_hole_radius = 8.4/2;


$fn = 36;
$fa = 12;
$fs = 0.5;

include <misc_parts.scad>


//// fin-module
// height1: front of fin
// height2: back of fin
// length1: length all together
// length2: length of the fin-part that gets merged in the adjacent part
// width:   ....
module diagonal_fin2(height1, height2, length1, length2, width) 
{
    ds = 3; // =y0, distance from the endpoints
    y1 = (length1-length2)/2;
    y2 = (length1+length2)/2;
    y3 = length1 - ds;
    surface = [ [0,ds], [height1,ds], [height1,y1], [height2,y2], [height2,y3], [0,y3] ];
    union() 
    {
        rotate([0,-90,0]) linear_extrude(width,center=true) polygon(points=surface);  
        // mounting screw hole.
        translate([0, length1, height2/2]) difference() 
        {
            cylinder(r=5, h=height2, center=true);
            translate([0,0,height2/2-1]) rotate([0,180,0]) screw_M3(10); 
        }
   }
}
//diagonal_fin2(40, 6, 50, 40, 5);


module bracket(height) 
{
    w = rod_distance;
    difference() 
    {
        union() 
        {
            translate([0, -1, 0]) cube([w+12, 22, height], center=true);
            // Sandwich mount hull
            translate([-w/2, 10, 0]) cylinder(r=6, h=height, center=true);
            translate([+w/2, 10, 0]) cylinder(r=6, h=height, center=true);
        }
        // Sandwich mount screw holes
        translate([-w/2, 10, height/2-1]) rotate([0,180,0]) screw_M4(height);
        translate([+w/2, 10, height/2-1]) rotate([0,180,0]) screw_M4(height);

        // Smooth rod mounting slots.
        for (x = [-w/2, w/2])
        {
            translate([x, 0, 0]) 
            {
                cylinder(r=rod_hole_radius, h=height+1, center=true);
                translate([0, -10, 0]) cube([2, 20, height+1], center=true);
            }
        }
        // Belt path.
        translate([0, -5, 0]) cube([w-20, 20, height+1], center=true);
        translate([0, -9, 0]) cube([w-12, 20, height+1], center=true);
        translate([-w/2+10, 1, 0]) cylinder(r=4, h=height+1, center=true);
        translate([+w/2-10, 1, 0]) cylinder(r=4, h=height+1, center=true);
    }
}

//translate([0, 0, 10]) bracket(20);
