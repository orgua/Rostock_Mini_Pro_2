/*
Info:
This design fits a nema17. You should print this with support, so that you get a clean motor-hole. Otherwise you could comment-out code below - look for "printable without support".

Improvement:
- better fin-design
- included space for nuts 

TODO: 
- resize part, for some air above and below the motor
*/

include <bracket.scad>

motor_front_dimension = 42;
motor_front_hole_radius = 11.3;
motor_mounting_screw_distance = 31;
motor_mounting_screw_radius = M3_screw_hole_dia/2;

part_extraheight = 0;

$fn=36;

module motor_holes() {
    sh = 10;
    sd = motor_mounting_screw_distance/2;
    sr = motor_mounting_screw_radius; 
    cylinder(r=motor_front_hole_radius, h=sh, center=true); 
    // make it printable without support!
    //translate([0,8,+(motor_front_hole_radius+1)/2]) rotate([0,0,45]) cube(motor_front_hole_radius, center=true);
    //translate([0,8,-(motor_front_hole_radius+1)/2]) rotate([0,0,45]) cube(motor_front_hole_radius, center=true);
    translate([+sd,+sd,0]) cylinder(r=sr, h=sh, center=true);
    translate([+sd,-sd,0]) cylinder(r=sr, h=sh, center=true);
    translate([-sd,+sd,0]) cylinder(r=sr, h=sh, center=true);
    translate([-sd,-sd,0]) cylinder(r=sr, h=sh, center=true);
}

//rotate([90,0,0]) motor_holes();


module motor_end() {
hf = motor_front_dimension;
hm = motor_front_dimension + part_extraheight;
wr = rod_distance;

difference() {
union() {
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