include <configuration.scad>
// From: http://www.thingiverse.com/thing:16158
include <lm8uu-holder-slim_v1-1.scad>

width = 76;
height = carriage_height;

offset = 25;
cutout = 13;
middle = 2*offset - width/2;

extrude_width = 0.35;
first_layer = 0.25;

module parallel_joints(reinforced) {
  difference() {
    union() {
      intersection() {
        cube([width, 20, 8], center=true);
        rotate([0, 90, 0]) cylinder(r=5, h=width, center=true);
      }
      intersection() {
        translate([0, 18, 4]) rotate([45, 0, 0])
          cube([width, reinforced, reinforced], center=true);
        translate([0, 0, 20]) cube([width, 35, 40], center=true);
      }
      translate([0, 8, 0]) cube([width, 16, 8], center=true);
    }
    rotate([0, 90, 0]) cylinder(r=1.55, h=80, center=true, $fn=12);

    for (x = [-offset, offset]) {
      translate([x, 5.5, 0])
        cylinder(r=cutout/2, h=100, center=true, $fn=24);
      translate([x, -4.5, 0])
        cube([cutout, 20, 100], center=true);
      //translate([x, 0, 0]) rotate([0, 90, 0]) rotate([0, 0, 30])
      //  cylinder(r=3.3, h=17, center=true, $fn=6);
    }
    translate([0, 0, 0]) rotate([0, 90, 0]) rotate([0, 0, 30])
      cylinder(r=3.3, h=28, center=true, $fn=6);
    translate([0, 2, 0]) cylinder(r=middle, h=100, center=true);
    translate([0, -8, 0]) cube([2*middle, 20, 100], center=true);
  }
}

module lm8uu_mount(d, h) {
  union() {
    difference() {
      intersection() {
        cylinder(r=11, h=h, center=true);
        translate([0, -8, 0]) cube([19, 13, h+1], center=true);
      }
      cylinder(r=d/2, h=h+1, center=true);
    }
  }
}

module belt_mount() {
  difference() {
    union() {
      difference() {
        translate([8, 2, 0]) cube([4, 13, height], center=true);
        for (z = [-3.5, 3.5])
          translate([8, 5, z])
            cube([5, 13, 3], center=true);
      }
      for (y = [1.5, 5, 8.5]) {
        translate([8, y, 0]) cube([4, 1.2, height], center=true);
      }
    }
  }
}

module lm8uu_holder_vert(flip) {
   union() {
      if (flip) {
         rotate([ 90, 0, 180] ) lm8uu_holder();
      }
      else {
         rotate([-90, 0,   0] ) lm8uu_holder();
      }
      translate([3, 10, -LM8UU_length / 2]) {
         cube([8, 15, first_layer]);
         translate([6, 4, 0]) cube([extrude_width, 8.5, LM8UU_length / 2 - 3]);
         translate([2.2, 10.5, 0]) cube([extrude_width, 2, LM8UU_length / 2 - 3]);
      }
      translate([-11.5, 10, -LM8UU_length / 2]) {
         cube([8, 15, first_layer]);
         translate([2.2, 4, 0]) cube([extrude_width, 8.5, LM8UU_length / 2 - 3]);
         translate([6, 10.5, 0]) cube([extrude_width, 2, LM8UU_length / 2 - 3]);
      }
   }
}

module carriage() {
  translate([0, 0, height/2]) 
  union() {
    translate([-30, -9.5, 0]) lm8uu_holder_vert(false);
    translate([ 30, -9.5, 0]) lm8uu_holder_vert(true);
    belt_mount();
    difference() {
      union() {
        translate([0, -5.6, 0])
          cube([50, 5, height], center=true);
        translate([0, -carriage_hinge_offset, -height/2+4])
          parallel_joints(16);
      }
      // Screw hole for adjustable top endstop.
      translate([15, -16, -height/2+4])
        cylinder(r=1.5, h=20, center=true, $fn=12);
      for (x = [-30, 30]) {
        translate([x, 0, 0])
          cylinder(r=8, h=height+1, center=true);
      }
    }
  }
}

module belt_clamp_channel()
{
  difference()
  {
    translate([0,0,belt_clamp_channel_height/2])
    union()
    {
      cube([belt_clamp_hole_separation,
        belt_clamp_width,belt_clamp_channel_height],center=true);
      for(i=[-1,1])
      translate([i*belt_clamp_hole_separation/2,0,0])
      cylinder(r=belt_clamp_width/2,h=belt_clamp_channel_height,center=true);

      translate([-belt_clamp_hole_separation/2,0,
        (belt_clamp_channel_height+key_d)/2-belt_clamp_channel_height/2])
      cube([key_w-0.5,key_l-0.5,belt_clamp_channel_height+key_d],true);
    }

    translate([belt_clamp_hole_separation/2,0,-1])
    rotate(360/16)
    cylinder(r=m3_diameter/2,h=belt_clamp_channel_height+2,$fn=8);


    translate([-belt_width/2,-belt_clamp_width/2-1,
      belt_clamp_channel_height-belt_thickness-tooth_height])
    cube([belt_width,belt_clamp_width+2,belt_thickness+tooth_height+1]);
  }
}

module belt_clamp_socket(version=0)
{
  difference() {
    translate([0,0,belt_clamp_height/2])
    union() {
      translate([-(2.5+carriage_belt_spacing+belt_width/2),-belt_clamp_width/2,-belt_clamp_height/2])
      cube([2.5+carriage_belt_spacing+belt_width/2+belt_clamp_hole_separation/2,belt_clamp_width,belt_clamp_height]);
      for(i=[-1,1]) 
        translate([belt_clamp_hole_separation/2,0,0])
        cylinder(r=belt_clamp_width/2,h=belt_clamp_height,center=true);
      if (version==1)
        translate([belt_clamp_hole_separation/2,0,0]) {
        difference() {
          translate([0,0,belt_thickness/2])
          cylinder(r=belt_clamp_width/2,h=belt_clamp_height+belt_thickness,center=true);
          translate([-belt_clamp_width/2,-belt_clamp_width/2-1,-belt_clamp_height/2-1])
          cube([belt_clamp_width/2+2,belt_clamp_width+2,belt_clamp_height+belt_thickness+2]);
        }
      }
    }
  }
}

carriage();

// Uncomment the following lines to check endstop alignment.
// use <idler_end.scad>;
// translate([0, 0, -20]) rotate([180, 0, 0]) idler_end();
