/*
Info:
This design fits a nema17. You should print this with support, so that you get a clean motor-hole. Otherwise you could comment-out code below - look for "printable_without_support". You need 3 of these parts.

Improvement:
- better fin-design
- included space / cutout for nuts 

TODO: 
- resize part, for some air above and below the motor

*/

motor_front_dimension         = 42;
motor_front_hole_radius       = 11.3;
motor_mounting_screw_distance = 31;

printable_without_support     = false;

part_extraheight = 0;

$fn=36;

include <bracket.scad>
include <misc_parts.scad>

// negative parts that get substracted
module motor_holes() 
{
    sh = 10;
    sd = motor_mounting_screw_distance/2;
    sr = M3_screw_hole_dia/2; 
    fr = motor_front_hole_radius;
    
    cylinder(r=fr, h=sh, center=true); 
    // make it printable without support!
    if (printable_without_support) 
    {
        translate([0,8,+(fr+1)/2]) rotate([0,0,45]) cube(fr, center=true);
        translate([0,8,-(fr+1)/2]) rotate([0,0,45]) cube(fr, center=true);
    }
    translate([+sd,+sd,0]) cylinder(r=sr, h=sh, center=true);
    translate([+sd,-sd,0]) cylinder(r=sr, h=sh, center=true);
    translate([-sd,+sd,0]) cylinder(r=sr, h=sh, center=true);
    translate([-sd,-sd,0]) cylinder(r=sr, h=sh, center=true);
}

//rotate([90,0,0]) motor_holes();


module motor_end() 
{
    hf = motor_front_dimension;
    hm = motor_front_dimension + part_extraheight;
    wr = rod_distance;

    difference() 
    {
        union() 
        {
            translate([0,0,hm/2]) bracket(hm);
            translate([+wr/2,10,0]) diagonal_fin2(35, 7, 40, 30, 5);
            translate([-wr/2,10,0]) diagonal_fin2(35, 7, 40, 30, 5);
        }
        translate([0,8,hf/2]) rotate([90,0,0]) motor_holes();
        for (z=[8,21,34]) for (i=[-1,1])
            translate([i*(wr/2-6),-6, z]) rotate([0,i*90,0]) rotate([0,0,30]) screw_M3(25);
    }
}

motor_end();