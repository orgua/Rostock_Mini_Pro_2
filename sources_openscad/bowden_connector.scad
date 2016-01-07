$fn = 0;
$fa = 0.01;
// use $fs to control the number of facets globally
// fine ~ 0.1 coarse ~ 1.0
$fs = 0.3;
diameter = 9.5; // diameter for cutting thread
height =8; // hight of thread

module groovemount() {
	translate([-25/2,-10/2,0]) cube ([25, 10, 3]);
	translate([-25/2,0,0]) cylinder(h=3, r=10/2);
	translate([25/2,0,0]) cylinder(h=3, r=10/2);
	cylinder (h=4.8+5.3+3, r=12/2);
	translate([0,0,3+5.3]) cylinder (h=4.8, r=15.8/2);
	cylinder (h=4.8+5.3+3, r=12/2);
	cylinder (h=3, r=15.8/2);
}
difference() {
	groovemount();
	translate([-12.1,0]) cylinder(h=3, r=3.2/2);
	translate([12.1,0]) cylinder(h=3, r=3.2/2);
	cylinder (h=height, r=diameter/2);
	cylinder (h=4.8+5.3+3, r1=1);
}
