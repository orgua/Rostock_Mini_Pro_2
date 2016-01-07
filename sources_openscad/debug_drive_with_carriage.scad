use <motor_end.scad>
use <carriage_for_traxxas.scad>
use <idler_end.scad>

$fn=48;

r=180; // rotate this part one half turn
translate([0,0,-30]) rotate([0,r,0]) motor_end();
translate([0,0,+12]) rotate([0,r,r]) carriage();
translate([0,0,+60]) rotate([0,r,0]) idler_end();

translate([+30,0,0]) cylinder(d=8, h=200, center=true);
translate([-30,0,0]) cylinder(d=8, h=200, center=true);

translate([+30,0,12]) cylinder(d=15, h=24, center=true);
translate([-30,0,12]) cylinder(d=15, h=24, center=true);