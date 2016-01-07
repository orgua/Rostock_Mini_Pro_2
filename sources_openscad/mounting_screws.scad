include <configuration.scad>
use <bracket.scad>
      
h = motor_end_height; // Total height.
m = 30; // Motor mounting screws distance (center to center)
w = 60; // Smooth rod distance (center to center)

module mounting_screws(screws) {
    translate([-w/2, 12, 0]) circle(r=2, center=true, $fn=12);
    translate([w/2, 12, 0]) circle(r=2, center=true, $fn=12);
	if (screws>2) for (x = [-30, 30]) translate([x, 47, 0]) {
		translate([0, 1, 0]) circle(r=2, center=true, $fn=12);
	}
}

mounting_screws(4);