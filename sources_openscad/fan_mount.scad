
fan_mount();

module fan_mount() difference() {
	union() {
	linear_extrude(height=2,convexity=30) difference() {
		translate([0,0]) minkowski() {
			square([8-6,40-6],center=true);
			circle(r=3,$fn=24);
		}
		translate([-38/2+1,0,0]) circle(r=42/2,$fn=64);
		for(y=[-16,16])
			translate([0,y]) circle(r=3.5/2,$fn=24);

	}
	translate([8,0,3.75]) rotate([0,210,0]) union() {
	linear_extrude(height=2,convexity=30) difference() {
		translate([3,0]) minkowski() {
			square([14-6,32-6],center=true);
			circle(r=3,$fn=24);
		} 
		translate([-8,-16]) square([8,34]);
		for(y=[-12,12])
			translate([6.5,y]) circle(r=3.5/2,$fn=24);

	}
	translate([0,-32/2,0]) cube([2,32,5]);
	}
	translate([4,0]) linear_extrude(height=2) square([2,32],center=true);
	}
	for(y=[-16,16]) translate([0,y,0.4]) cylinder(r1=3.5/2,r2=6.5/2,h=1.8,$fn=24);
	translate([4,-36/2,-4]) cube([8,36,4]);
}