first_layer = 0.3;

difference() {
	
	union() {
		//main cylinder
		translate([16,20,21]) rotate([90,0,0]) cylinder(h=20, r=18);//cube([44, 20, 42]);
		
		//bearing mount
		translate([31,20,21]) rotate([90,0,0]) cylinder (h=20, r=8);
		
		//V3 Mount
		translate([9,0,-7]) cube([24, 20, 22]);
		translate([21,first_layer/2,-11]) rotate([90,0,0]) cube([24, 22, first_layer], center=true);
		//translate([27,first_layer/2,45]) rotate([90,0,0]) cube([12, 22, first_layer], center=true);
		
		//filament support
		translate([21.75,6.5,34]) rotate([0,0,0]) cylinder (h=8, r=3, $fn=12);
		
		//groovemount supports
//		translate([33,6.5,-7]) rotate([0,0,0]) cylinder (h=16, r=5, $fn=12);
//		translate([9,6.5,-7]) rotate([0,0,0]) cylinder (h=16, r=5, $fn=12);
		
		//clamp
		translate([21,0,28]) cube([12, 20, 14]);
	}
	
	//pulley opening
	translate([16,21,21]) rotate([90,0,0]){
		cylinder (h=22, r=6.6);
		
		rotate([0,0,45]) {
		//translate([14,0,0]) cylinder(h=22, r=1.6, $fn=12);
		translate([0,14,0]) cylinder(h=22, r=1.6, $fn=12);
		translate([-14,0,0]) cylinder(h=22, r=1.6, $fn=12);
		translate([0,-14,0]) cylinder(h=22, r=1.6, $fn=12);
		}
	}
	
	//gearhead indentation
	translate([16,20.01,21]) rotate([90,0,0]) cylinder (h=3.35, r=11.25);

	//pulley hub indentation
	translate([16,20-2,21]) rotate([90,0,0]) cylinder (h=5.6, r=7);
	
	//bearing screws
	translate([31,21,21]) rotate([90,0,0]) cylinder (h=22, r=2.725, $fn=12); //precision m5

	//translate([31,21,21]) rotate([90,0,0]) cylinder (h=22, r=2.6, $fn=12); //regular M5 screw
	//translate([31,22,21]) rotate([90,30,0]) cylinder (h=8.01, r=8.1/2, $fn=6); //M4
	translate([31,22,21]) rotate([90,30,0]) cylinder (h=8.01, r=4.8, $fn=6); //M5
	
	//bearing
	translate([31,9.5,21]) rotate([90,0,0]) cylinder (h=5.55, r=8.5);
	translate([31,9.5-5.25,21-8.25-2]) cube([20, 5.25, 18.5]);
	
	//opening between bearing and pulley
	translate([20,9.5-5.25,21-8.25+3.25+1]) cube([10, 5.25, 8]);

	//filament path chamfer
	translate([21.75,6.5,15]) rotate([0,0,0]) cylinder (h=2, r1=1, r2=1.5, $fn=12);		
	
	//filament path
	translate([21.75,6.5,-10]) rotate([0,0,0]) cylinder (h=60, r=1.3, $fn=12); 
	translate([21.75,6.5,-51.5]) rotate([0,0,0]) cylinder (h=60, r=2.5, $fn=12); 
	
	//V3 Mount
//	translate([21.75,6.5,-2]) rotate([0,0,0]) cylinder (h=5, r=8.25);
	translate([21.75,6.5,-7]) rotate([0,0,0]) cylinder (h=8, r=4.5);
//	translate([21.75-8,6.5-8,-2]) cube([16, 8, 5]);
//	translate([21.75-6,6.5-7,-7]) cube([12, 7, 5]);
	translate([21.75,6.5,3.5]) rotate([90,0,0]) cylinder (h=10, r=1,  $fn=12);
	
	//groovemount supports
//	translate([33,6.5,-8]) rotate([0,0,0]) cylinder (h=20, r=1.6, $fn=12);
//	translate([33,6.5,7]) rotate([0,0,0]) cylinder (h=3, r=3.5, $fn=6);

//	translate([9,6.5,-8]) rotate([0,0,0]) cylinder (h=20, r=1.6, $fn=12);
//	translate([9,6.5,7]) rotate([0,0,0]) cylinder (h=3, r=3.5, $fn=6);
//	translate([3,3,7]) cube([8, 7, 3]);
	
	//clamp slit
	translate([25,-1,10]) cube([2, 22, 35]);
	//clamp nut
	translate([6.5,14,37]) rotate([0,90,0]) cylinder (h=16, r=4.2, $fn=6);
	//clamp screw hole
	translate([15,14,37]) rotate([0,90,0]) cylinder (h=20, r=2.3, $fn=12);
	
	translate([9,-2,-25.5])cube(30,20,10);
    translate([9,-2,43.5])cube(30,20,10);
}