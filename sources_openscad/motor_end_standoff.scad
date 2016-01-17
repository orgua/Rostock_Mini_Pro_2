/*
Info: 
You can put six of these under/in the motor_mounts in the rod-holes. I printed these with a soft PLA and put a 40mm M3-Screw inside. You need 6 of these.

Improvement: 
- shock absorbing standoffs (if printed with soft PLA)
- more space under the printer (there is just usb and power coming out of mine)
- better cooling for motors

TODO:

*/

h_rod   = 10; // height 
d_rod   = 8.0; // diameter
h_stand = 40; // standoff height
d_stand = 14; // dia standoff

$fn=60;

difference() {
    union() {
        
        translate([0,0,h_rod/2]) cylinder(d=d_rod, h=h_rod+2,center=true);
        translate([0,0,-h_stand/2]) cylinder(d=d_stand,h=h_stand,center=true);
    }
    w_cube = (d_stand - d_rod);
    translate([0,+(d_stand/2+1),-h_stand/2]) cube([d_stand,w_cube,h_stand+2], center=true);
    translate([0,-(d_stand/2+2.5),-h_stand/2]) cube([d_stand,w_cube,h_stand+2], center=true);
    translate([+(d_stand/2+2.5),0,-h_stand/2]) cube([w_cube,d_stand,h_stand+2], center=true);
    translate([-(d_stand/2+2.5),0,-h_stand/2]) cube([w_cube,d_stand,h_stand+2], center=true);
    translate([0,0,-h_stand]) cylinder(d=6,h=8,center=true);
    translate([0,0,-h_stand+5.9]) cylinder(d1=6,d2=3.3,h=4,center=true);
    translate([0,0,-h_stand/2+h_rod/2]) cylinder(d=3.3,h=h_stand+h_rod+4, center=true);
}