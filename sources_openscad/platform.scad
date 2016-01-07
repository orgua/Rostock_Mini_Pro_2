platform_hinge_offset = 32;
platform_thickness = 8;

use <carriage_for_traxxas.scad>

h=platform_thickness;

cutout = 12.5;
inset = 6;

$fn = 48;


module led_ring() {
    difference() {
        cylinder(d=80, h=4.5, center=true);
        cylinder(d=64, h=5, center=true);
    }
}
//translate([0,0,12]) led_ring();

module platform() {
  translate([0, 0, h/2]) 
  difference() {
    
    // the organic triangular shape
	union() {
      for (a = [0:2]) {
        rotate([0, 0, a*120]) {
          translate([0, -platform_hinge_offset, 0]) parallel_joints();
          // Close little triangle holes.
          translate([0, 31, 0]) cylinder(r=5, h=h, center=true);
        }
      }
    
    // the big cylinder in the middle  
    cylinder(r=30, h=h, center=true);
    }
    cylinder(r=20, h=h+12, center=true);
    for (a = [0:2]) {
      rotate(a*120) {
        translate([0, -25, 0]) cylinder(r=2.2, h=h+1, center=true);
      }
    }
	// Added extra set of holes 
    rotate([0,0,180]) for (a = [0:2]) {
      rotate(a*120) {
        translate([0, -25, 0])
          cylinder(r=2.2, h=h+1, center=true);
      }
    }
  }
}

platform();