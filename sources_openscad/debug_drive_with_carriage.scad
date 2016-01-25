/*

This file is just for debug and shows the parts of the linear drive compiled in one view.

*/

length_rod      = 500; // mm
height_carriage = 350; //mm

use <motor_end_standoff.scad>
use <motor_end.scad>
use <carriage_for_traxxas.scad>
use <idler_end.scad>

$fn=24;

module drive_with_carriage(lr=length_rod,hc=height_carriage)
{
    r=180; // rotate affected parts one half turn
    
    // printed parts
    translate([0,0,42]) rotate([0,r,0]) motor_end();
    translate([0,0,hc]) rotate([0,r,r]) carriage();
    translate([0,0,lr]) rotate([0,r,0]) idler_end();

    for (x = [-30,+30])
    {
        // motor end standoff
        translate([x,0,0]) motor_end_standoff();
        // rod
        translate([x,0,lr/2]) cylinder(d=8, h=lr, center=true);
        // linear bearing
        translate([x,0,hc+12]) cylinder(d=15, h=24, center=true);
    }
}

drive_with_carriage();