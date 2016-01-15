/*
Info: 
This part sits at the upper end of the rods, below the top-plate. You need 3 of these.

Improvement:
- fins offers extra stability during the print (4 mounting screws instead of 2)
- direct mounting-platform for small hal-sensor-pcb

TODO: 
- give information on the hal-sensor-project

*/

idler_end_height = 30;

include <bracket.scad>


tilt = -2; // Tilt bearings upward (the timing belt is pulling pretty hard).
          // 2 degree tilt caused belts to slide off the bearings

module bearing_mount() {
  rotate([90 - tilt, 0, 0]) union() {  
  translate([0, 0, 2.3]) cylinder(r1=12, r2=9, h=1.1, center=true);
  translate([0, 0, -2.3]) cylinder(r1=9, r2=12, h=1.1, center=true);
}
}

module bearing_mount_hole() {
  rotate([90 - tilt, 0, 0]) cylinder(r=4, h=40, center=true);
}

x = 17.7; // Micro switch center.
y = 16; // Micro switch center.


module switch_mount() {
 difference() {
    translate([2.3,-4.12,-1]) rotate([0,0,-15]) cube([18, 8, 10],    center=true);
    translate([0, 0, -2])    rotate([0,0,0])    cube([30, 6.34, 20], center=true);
    translate([12.3, -4, -1]) rotate([0,0,-15]) cylinder(r=3, h=20,  center=true);
}
}
 
module switch_mount_holes() 
{
    union() { 
translate([-9.5/2, 0, 0]) rotate([90, 0, 0]) cylinder(r=1.1, h=26, center=true);
translate([+9.5/2, 0, 0]) rotate([90, 0, 0]) cylinder(r=1.1, h=26, center=true);
}
}

module switch_mount_mag() 
{
    width = 14;
    translate([0,0,2.5]) difference() {
        translate([0,-(width/2-2),0]) cylinder(d=22, h=5, center=true);
        translate([0,-width-2,0]) cube([25,width/2,6], center=true);
        translate([+7.5,-8,0]) cylinder(d=3.2, h=10, center=true);
        translate([-7.5,-8,0]) cylinder(d=3.2, h=10, center=true);
    }
}
//switch_mount_mag();


module M_cutout(length, height, width, inner_width, offset) {
    // make it printable
    margin = 5;
    x1=0;
    x2=height;
    x3=height+margin;
    y1=+width/2+margin;
    y2=+width/2;
    y3=offset+inner_width/2;
    y4=offset-inner_width/2;
    y5=-y2;
    y6=-y1;
    surface = [ [x3,y1],[x1,y1],[x1,y2],[x2,y3],[x2,y4], [x1,y5],[x1,y6], [x3,y6] ];
    rotate([0,-90,0]) linear_extrude(length,center=true) polygon(points=surface);     
}
//M_cutout(30,8,16,5);

module switch_mount_mag2() 
{
    h1 = 1;
    h2 = 10;
    translate([0,0,h2/2])
    difference() {
        union() {
            translate([ 0,6,0]) cube([16,12,h2], center=true);
            translate([+8,8,0]) cylinder(d=8,h=h2, center=true);
            translate([-8,8,0]) cylinder(d=8,h=h2, center=true);
            translate([ 0,0,0]) cylinder(d=8,h=h2, center=true);
            translate([ 0,0,0]) cylinder(d=3.0,h=h2+1.5, center=true);
        }
       translate([+8,0,0]) cylinder(d=8,h=h2+1, center=true);
       translate([-8,0,0]) cylinder(d=8,h=h2+1, center=true);
       translate([+8,8,0]) cylinder(d=3.4,h=h2+1, center=true);
       translate([-8,8,0]) cylinder(d=3.4,h=h2+1, center=true);
    
    // make it printable
    translate([0,4,h1-h2/2]) rotate([0,0,0])  M_cutout(30,h2-h1,16,1,3);
    translate([0,4,h1-h2/2]) rotate([0,0,90]) M_cutout(30,h2-h1,24,10,0);
    }
}
//switch_mount_mag2();

module switch_mount_mag2_hole() 
{
    h = 8;
    translate([0,0,h/2])
    union() {
       translate([+8,8,0]) cylinder(d=3.4,h=h+1, center=true);
       translate([-8,8,0]) cylinder(d=3.4,h=h+1, center=true);
    }
}
//switch_mount_mag2();


module idler_end() {
  hi = idler_end_height; // Total height.
  wr = rod_distance;
  translate([0, 0, hi/2]) 
  difference() {
    union() {
      bracket(hi);
      translate([+wr/2,10,-hi/2]) diagonal_fin2(hi,7, 40,30, 5);
      translate([-wr/2,10,-hi/2]) diagonal_fin2(hi,7, 40,30, 5);
      translate([0, 7.5, 0]) bearing_mount();
      // Micro switch placeholder.
      //translate([x, y, -hi/2+6]) rotate([0, 0, 15]) switch_mount();
      translate([15,16,hi/2+2]) rotate([0,180,0]) rotate([0,0,180]) switch_mount_mag2();
    }
    //translate([x, y, -hi/2+6]) rotate([0, 0, 15]) switch_mount_holes();
    translate([15,16,hi/2+2]) rotate([0,180,0]) rotate([0,0,180]) switch_mount_mag2_hole();
 
    translate([0, 8, 0]) bearing_mount_hole();
    
    for (i = [-1, 1]) for (z = [-8,8])
      translate([i*(+wr/2-6),-6, z]) rotate([0,i*90,0]) screw_M3(25);
  }
}

idler_end();
