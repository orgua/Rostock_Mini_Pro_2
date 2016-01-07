include <configuration.scad>;
include <frame.scad>;
use <belt.scad>;
use <bearing.scad>;
use <nema.scad>;
use <motor_end.scad>;
use <idler_end.scad>;
use <carriage-slim_holder.scad>
use <platform.scad>;
use <rod.scad>;
use <extruder.scad>;

aluminum = [0.9, 0.9, 0.9];
steel = [0.8, 0.8, 0.9];
use_stls=false;

//build radius for animation.
br=50;

platformxyz=[cos($t*360)*br,sin($t*360)*br,30];

belt_length=smooth_rod_length-5-motor_end_height/2-idler_end_height/2;

vertical_height=smooth_rod_length-motor_end_height-idler_end_height-frame_thickness
				-pcb_thickness-rod_length-platform_thickness-30; //30mm for the nozzle

echo(str("Smooth rod length: ",smooth_rod_length," mm"));
echo(str("Belt length: ",(belt_length*2)+(22*3.14)," mm"));
echo(str("Build volume: ",round(printbed[0]/25.4),"in x ",
		round(printbed[1]/25.4),"in x ",vertical_height/25.4,"in"));
echo(str("Build volume: ",printbed[0],"mm x ",
		printbed[1],"mm x ",vertical_height,"mm"));
echo(str("Diagonal rod length: ",rod_length," mm"));
echo(str("Smooth rod offset or tower radius: ",tower_radius," mm"));

module smooth_rod() 
{
	color(steel) cylinder(r=4, h=smooth_rod_length);
}

module tower(height) 
{
	translate([0, tower_radius, 0]) 
	{
		translate([0, 0, motor_end_height]) 
		rotate([180,0,0])
		if (use_stls) import ("motor_end.stl"); else render() motor_end();

		translate([0, 0, smooth_rod_length-idler_end_height]) 
		rotate(180)
		if (use_stls) import ("idler_end.stl"); else idler_end();

		translate([30, 0, 0]) smooth_rod();
		translate([-30, 0, 0]) smooth_rod();

		translate([0, 0, motor_end_height+frame_thickness+pcb_thickness+8+platformxyz[2]+height]) 
		rotate([0, 180, 0]) 
		{
			if (use_stls) import ("carriage.stl"); else render() carriage();
			for(j=[-30,30])
			translate([j,0,0])
			lm8uu();
		}

		translate([0, 17-10, motor_end_height/2]) nema17(47);

		// Ball bearings for timing belt
		translate([0,-4, smooth_rod_length-28/2]) 
		bearing(8, 22, 7);

		// Timing belt
		translate([-22/2,-4+7/2, belt_length/2+motor_end_height/2]) 
		rotate([0, 90, 0]) 
		timing_belt(belt_length);

		translate([22/2,-4+7/2, belt_length/2+motor_end_height/2]) 
		rotate([0, 90, 0]) 
		timing_belt(belt_length);
	}
}

module rod_pair(lean_y,lean_x)
{
	for(i=[-1,1])
	translate([25*i,platform_hinge_offset,0])
	rotate([lean_x,0,0])
	rotate([0,lean_y,0])
	rotate([0, -90, 0]) 
	if (use_stls) import ("rod.stl"); else 
	rod(rod_length);
}

module rostock() 
{
	for(i=[0:2])
	assign(angle=120*i)
	assign(carriage_xy=[0,tower_radius-carriage_hinge_offset],
		platform_xy=[platformxyz[0]*cos(angle)+platformxyz[1]*sin(angle),
		platformxyz[1]*cos(angle)-platformxyz[0]*sin(angle)+
		platform_hinge_offset])
	assign(rod_dist=carriage_xy-platform_xy)
	assign(dist=sqrt(rod_dist[0]*rod_dist[0]+rod_dist[1]*rod_dist[1]))
	assign (height=sqrt(rod_length*rod_length-dist*dist))
	assign(lean_y=90-acos(rod_dist[0]/rod_length),
		 lean_x=-atan2(rod_dist[1],height))
	{
		rotate(angle)
		tower(height);

		translate(platformxyz)
		rotate(angle)
		translate([0,0,motor_end_height+frame_thickness+pcb_thickness+
			platform_thickness/2])
		rod_pair(lean_y,lean_x);
	}
	// platform
	translate(platformxyz) 
	translate([0, 0, motor_end_height+frame_thickness+pcb_thickness]) 
	rotate([0, 0, 60]) 
	if (use_stls) import ("platform.stl"); else platform();


	// upper and lower frames
	% translate([0, 0, motor_end_height])
	linear_extrude(height=frame_thickness) lower_frame();

	% translate([0,0,smooth_rod_length]) 
	linear_extrude(height=frame_thickness) upper_frame();


	if(sanguinololu)
	rotate(30) translate([(frame_radius*1.3*sin(30))+corner_radius-1,0,motor_end_height-6]) 
	rotate(90) translate([-(97.79+3.82)/2,0,0]) difference() {
		 translate([3,3,0]) color([0.9, 0, 0]) minkowski() {
			cube([101.6-6,50.8-6,pcb_thickness/2]);
			cylinder(r=3,h=pcb_thickness/2,$fn=12);
		}
		// mounting holes sanguinololu
		translate([3.81,3.81,-1]) cylinder(r=1.625,h=pcb_thickness*2,$fn = 12);
		translate([3.81,46.99,-1]) cylinder(r=1.625,h=pcb_thickness*2,$fn = 12);
		translate([97.79,46.99,-1]) cylinder(r=1.625,h=pcb_thickness*2,$fn = 12);
		translate([97.79,3.81,-1]) cylinder(r=1.625,h=pcb_thickness*2,$fn = 12);
	}
	// extruder
	rotate(0) translate([-printbed[0]/2+10+2+16,printbed[1]/2-10+6-6.5,motor_end_height-22]) rotate([-90,90,0]) {
		extruder();
		translate([0,0,13.1]) bracket();
		translate([14*cos(45),14*cos(45),2.5]) idler();
		%hardware();
		motor();
	}
	// heated printbed PCB
	difference() {
	color([0.9, 0, 0]) 
	translate([0, -10, motor_end_height+frame_thickness+pcb_thickness/2])
	cube([printbed[0], printbed[1], pcb_thickness], center=true);

	// mounting holes PCB
	translate([0,-10,0])
	for(x = [-1, 1]) for(y = [-1, 1]) 
		translate([printbed_screw_spacing[0] / 2 * x, 
		printbed_screw_spacing[1] / 2 * y, motor_end_height+frame_thickness+pcb_thickness/2]) 
		cylinder(r=1.625,h=pcb_thickness*2, $fn = 12, center=true);

	}
}

rostock();

