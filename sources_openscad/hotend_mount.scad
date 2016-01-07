// you need two of these, 180° rotated (see last line)
// suitable for E3D-Hotends

$fn=64;

function signum(x) = (x < 0)?-1:(x > 0)?1:0; 

module bowden_clamp() { 
    difference() {
	translate([0,0,-0]) linear_extrude(height=12,convexity=30,center=true) 
        difference() {
		// basic shape
		minkowski() {
			intersection() {
				square([60-2,22-4],center=true);
				circle(r=30-2);
			}
			circle(r=2); // rounded corners
		}
	}
	
	for(x=[-25,25]) {
        // M4 socket heads and mounting holes
        translate([x,0,+4.5]) rotate([0,0,30]) cylinder(d=6.5,h=3.01,center=true, $fn=6); // d_M3 = 5.5 (see below)
        translate([x,0,-4.5]) rotate([0,0,30]) cylinder(d=6.5,h=3.01,center=true, $fn=6);
       translate([x,0,0]) cylinder(d=3.5,h=15,center=true);
    }

    for (x=[-10,+10]) {
        translate([x,signum(x)*10.5,0]) rotate([90,0,0]) cylinder(d=6.5,h=3.01,center=true, $fn=6); // d_M3 = 5.5 (see below)
        translate([x,0,0]) rotate([90,0,0]) cylinder(d=3.6,h=25,center=true); 
    }

	// groove mount for E3D 
    oW = 16.4; // E3D outer width
    iW = 12.4; // E3D inner width
	translate([0,0,+4.6]) cylinder(d=oW,h=3.01,center=true);
    translate([0,0,-4.6]) cylinder(d=oW,h=3.01,center=true);
    translate([0,0,+3.0]) cylinder(d1=iW,d2=oW,h=0.7,center=true);
    translate([0,0,-3.0]) cylinder(d1=oW,d2=iW,h=0.7,center=true);
    translate([0,0,+0.0]) cylinder(d=iW,h=15,center=true);
    
	// unnecessary vents
	for(x=[-15,15]) translate([x,0,-1]) minkowski() {
		cube([4.2,8.2,13],center=true);
		cylinder(r=2.2,h=13);
	}
    
    rotate([0,0,18]) translate([-50,-0.5,-20]) cube([100,50,55]);
}
}

// Test-Preview
//rotate([ 0, 0,  0]) bowden_clamp();
//rotate([ 0, 0,180]) bowden_clamp();

// Printable:
rotate([90,0,0]) bowden_clamp();