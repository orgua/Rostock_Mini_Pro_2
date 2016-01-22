/*

This file is just for debug and shows the parts of the linear drive compiled in one view.

*/

r=180; // rotate affected parts one half turn

$fn=48;

use <motor_end.scad>
use <carriage_for_traxxas.scad>
use <idler_end.scad>

// printed parts
translate([0,0,-30]) rotate([0,r,0]) motor_end();
translate([0,0,+12]) rotate([0,r,r]) carriage();
translate([0,0,+60]) rotate([0,r,0]) idler_end();

// rod
translate([+30,0,0]) cylinder(d=8, h=200, center=true);
translate([-30,0,0]) cylinder(d=8, h=200, center=true);

// linear bearing
translate([+30,0,12]) cylinder(d=15, h=24, center=true);
translate([-30,0,12]) cylinder(d=15, h=24, center=true);