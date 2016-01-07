
for(x=[-10,10]) for(y=[-10,10]) translate([x,y,0]) 
bed_clip();

module bed_clip() difference() {
	union() {
		translate([0,0,10.5/4]) minkowski() {
			cube([5,5,10.5/2],center=true);
			cylinder(r=1.5,h=10.5/2,$fn=32);
		}
		translate([-2,0,1/2]) difference() {
			translate([1.15-0.25,0,0]) cylinder(r=5.5,h=1,$fn=64,center=true);
			translate([2.125,0,-0.25]) cube([10.5,12,5],center=true);
		}
		//%translate([-4.9,-7.75/2-0.125,0]) cube([7.75,7.75,10]);
		translate([-1.75,0,1/4]) minkowski() {
			cube([5,5,1/2],center=true);
			cylinder(r=1.5,h=1/2,$fn=32);
		}

	} 


	translate([0,0,-0.25]) cylinder(r=6/2,h=4.25,$fn=32);
	translate([0,0,4.25]) cylinder(r=3.5/2,h=6.5,$fn=32);
}






module old_bed_clip() difference() {
	union() {
		difference() {
			translate([-7,-5,0]) minkowski() {
				cube([10,10,3.5/2]);
				cylinder(r=1,h=3.5/2,$fn=24);
			}
			translate([-5,3,-0.25]) cylinder(r=1,h=4,$fn=24);
			translate([-6,-6.25,-0.25]) cube([3,9.25,4]);
		}
		translate([0,0,1.75]) minkowski() {
			cube([6,10,7/2],center=true);
			cylinder(r=1,h=7/2,$fn=24);
		}
	} 
	translate([0,0,-0.25]) cylinder(r=6/2,h=3.25,$fn=32);
	translate([0,0,3.25]) cylinder(r=3.5/2,h=5,$fn=32);

	translate([-7,-5,-0.25]) difference() {
		translate([0,-2,0]) cube([2,2,4]);
		translate([0,0,-0.25]) cylinder(r=1,h=4.5,$fn=24);
	}
}