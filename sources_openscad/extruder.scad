
bearing=[3,10,4];
filament_dia=1.75;
pitch_radius=5;
triangle_radius=2*pitch_radius*sin(4.5)/cos(30);
tooth_radius=pitch_radius-triangle_radius+pitch_radius*sin(4.5)*tan(60);

printing_plate=false;

if(printing_plate) {
	translate([-20,0,0]) extruder();
	translate([10,-7,0]) rotate(-40) idler();
	translate([30,0,0]) rotate(180) bracket();
}else{
	extruder();
	translate([0,0,13.1]) bracket();
	translate([14*cos(45),14*cos(45),2.5]) idler();
	%hardware();
	motor();
}

module extruder() difference() {
	union() {
		cylinder(r=36/2,h=2,$fn=72);
		rotate(45) for(i=[1:3]) rotate([0,0,90*i]) translate([14,0,0]) rotate(7.5) cylinder(r=2.8,h=13,$fn=24);

		translate([-(14*cos(45))-12,(14*cos(45))-2.5,0]) cube([13,5,13]);
		translate([-(14*cos(45))-12,-(14*cos(45))-2.5,0]) cube([13,5,13]);

		translate([-(14*cos(45))-12,(14*cos(45))-2.5,0]) cube([5,13,13]);
		translate([-(14*cos(45))-12,-(14*cos(45))-13+2.5,0]) cube([5,13,13]);

		translate([-0.5,-16.5-3.5,0]) cube([(pitch_radius+filament_dia/2)*2+1,8.75,13]);

		intersection() {
			difference() {
				cylinder(r=36/2,h=5,$fn=72);
				translate([0,0,-0.5]) cylinder(r=22.5/2,h=6,$fn=48);
			}
			translate([-18,-18,0]) cube([18,28,5]);
		}
		difference() {
			translate([pitch_radius+filament_dia/2-2.5,-16.5-4.5+8.75,1]) rotate([35,0,0]) cube([5,12,7]);
			translate([2,-6.5,0]) cube([14,14,14]);
			translate([2,-12,10]) cube([14,14,14]);
			translate([pitch_radius+filament_dia/2,-7,7.5]) rotate([270,0,0])
				cylinder(r1=2.5/2,r2=2.2,h=2,$fn=12,center=true);
		}
		difference() {
			translate([-4.7,11.1,0]) rotate(69) translate([-4,-1,0]) cube([5,7.75,13]);
			cylinder(r=22.5/2,h=14,$fn=48);
		}
	}
	motor();

	translate([pitch_radius+filament_dia/2,-16,7.5]) rotate([90,0,0]) rotate(30) 
		cylinder(r=10.5/sqrt(3),h=5.5,$fn=6,center=true);
	translate([pitch_radius+filament_dia/2,-16,12.25]) rotate([90,0,0]) cube([10.5,10.5+2,5.5],center=true);
	translate([pitch_radius+filament_dia/2,-16-2.5,7.5]) rotate([90,0,0]) cylinder(r=6.25/2,h=6,$fn=32,center=true);
	translate([pitch_radius+filament_dia/2,0,7.5]) rotate([90,0,0]) cylinder(r=2.5/2,h=50,$fn=12,center=true);

	translate([-4.7,11.1,0]) rotate(69) translate([-0.5,2.9,7.5]) rotate([0,90,0])
		cylinder(r=6.5/sqrt(3),h=2,$fn=6);

	for(i=[-1,1]) {
		translate([-24,16*i,6.5]) rotate([90,0,90]) rotate(15) cylinder(r=2.2,h=8,$fn=12);
	}

}

module idler() union() {
	difference() {
		union() {
			cylinder(r=3.5,h=10,$fn=24);
			rotate(10.75) {
				translate([-3.5,-(14*cos(45)),0]) cube([7,14*cos(45),10]);
				translate([0,-(14*cos(45)),0]) cylinder(r=3.5,h=10,$fn=24);
			}
			translate([-0.3,-0.4,0]) rotate(60) {
				cube([4,22,10]);
				translate([2,22,0]) cylinder(r=2,h=10,$fn=24);
				translate([2,22,0]) cube([2,2,10]);
				translate([4,22,0]) cylinder(r=2,h=10,$fn=24);
			}
			rotate(25) translate([-4.7,-5,2.75]) cube([4,11,4.5]);
		}
		translate([0,0,-0.5]) cylinder(r=1.625,h=10+1,$fn=16);
		translate([(pitch_radius+filament_dia+bearing[1]/2)-(14*cos(45)),-(14*cos(45)),5]) 
			cylinder(r=1+bearing[1]/2,h=bearing[2]+1.5,$fn=24,center=true);
		translate([(pitch_radius+filament_dia+bearing[1]/2)-(14*cos(45)),-(14*cos(45)),-0.5]) 
			cylinder(r=1.5,h=10+1,$fn=16);
		translate([-filament_dia*2.25,0,5]) rotate([90,0,0]) cylinder(r=2.5/sqrt(3),h=50,$fn=6,center=true);
		translate([-filament_dia*2.25-1.25,-4,5]) rotate(-15) rotate([90,0,0]) 
			cylinder(r=2.5/sqrt(3),h=50,$fn=6,center=true);

		translate([-0.3,-0.4,0]) rotate(60)translate([-0.5,16.25,5]) rotate([0,90,0])
			cylinder(r=6.5/sqrt(3),h=2,$fn=6);
	}
	translate([(pitch_radius+filament_dia+bearing[1]/2)-(14*cos(45)),-(14*cos(45)),0]) difference() {
		cylinder(r=2,h=10,$fn=24);
		translate([0,0,-0.5]) cylinder(r=1.5,h=10+1,$fn=16);
	}
	rotate(10.75) difference() {
		translate([0,-(14*cos(45)),0]) cylinder(r=3.5,h=10,$fn=24);
		translate([0,-(14*cos(45)),-0.5]) cylinder(r=3,h=11,$fn=24);
		translate([-4,-(14*cos(45)),-0.5]) cube([8,14*cos(45),11]);
	}
}

module bracket() difference() {
	union() {
		rotate(45) for(i=[0:3]) rotate([0,0,90*i]) translate([14,0,0]) rotate(7.5) cylinder(r=2.8,h=3,$fn=24);
		translate([-(14*cos(45)),0,1.5]) cube([4,16,3],center=true);
		translate([0,-(14*cos(45)),1.5]) cube([16,4,3],center=true);
		translate([0,14*cos(45),1.5]) cube([16,4,3],center=true);
	}
	rotate(45) for(i=[0:3]) rotate([0,0,90*i]) translate([14,0,-0.5]) cylinder(r=1.625,h=4,$fn=16);
}

module motor() {
	// 42BYGH40(M)-160-4A NEMA 17 Bipolar 5.18:1 Planetary Gearbox Stepper
	// http://www.phidgets.com/products.php?category=23&product_id=3317_0
	color([0.4, 0.4, 0.4]) translate([0,0,-32.2-20]) intersection() {
		cube([42,42,40],center=true);
		rotate(45) cube([54,54,42],center=true);
	}
	%translate([0,0,-32.2]) cylinder(r=36/2,h=32.2,$fn=72);
	%translate([0,0,-0.5]) cylinder(r=22.5/2,h=2.55,$fn=48);
	%rotate(45) for(i=[0:3]) rotate([0,0,90*i]) translate([14,0,0]) cylinder(r=1.625,h=20,$fn=16);
	%translate([0,0,2]) cylinder(r=4,h=18,$fn=32);
}

module spur_gear() difference() {
	// S10T05M020S0508 20 tooth 8mm bore 10mm pitch dia 12mm dia stainless pur gear
	// https://sdp-si.com/eStore/PartDetail.asp?Opener=Group&PartID=41432&GroupID=591
	intersection() {
		union() {
			for(i=[0:19]) rotate([0,0,18*i]) translate([tooth_radius,0,0])
			 cylinder(r=triangle_radius,h=12,$fn=3);
			rotate([0,0,0]) cylinder(r=4.75,h=12,$fn=20);
		}
		rotate([0,0,9]) cylinder(r=5.5,h=12,$fn=20);
	}
	translate([0,0,-0.5]) cylinder(r=4,h=13,$fn=120);
}

module hardware() {
	translate([0,0,4]) spur_gear();
	translate([pitch_radius+filament_dia/2,0,7.5]) rotate([90,0,0]) cylinder(r=1.75/2,h=50,$fn=12,center=true);
	translate([pitch_radius+filament_dia+bearing[1]/2,0,7.5-bearing[2]/2]) bearing();
	translate([pitch_radius+filament_dia/2,-16,7.5]) rotate([90,0,0]) rotate(30) 
		cylinder(r=10/sqrt(3),h=5,$fn=6,center=true);
	translate([pitch_radius+filament_dia/2,-16-2.5,7.5]) rotate([90,0,0]) cylinder(r=6/2,h=6,$fn=32,center=true);
	for(i=[-1,1]) translate([-17,16*i,6.5]) rotate([90,0,90]) rotate(90) cylinder(r=7/sqrt(3),h=4,$fn=6);
	translate([-4.7,11.1,0]) rotate(69)
	translate([0,5.75/2,7.5]) rotate([6,90,0]) rotate(22.5) cylinder(r=3,h=8,$fn=32);
}

module bearing() difference() {
	cylinder(r=bearing[1]/2,h=bearing[2],$fn=24);
	translate([0,0,-0.5]) cylinder(r=bearing[0]/2,h=bearing[2]+1,$fn=24);
}
