$fn=48;

module anti_belt_mount_L() {
    // large version
    translate([0,0,12])
    difference() {
        cube([4, 17, 24], center=true);
        for (x = [-2,+2]) for (z = [-11:2:+11])
            translate([x,0,z]) rotate([90,0,0]) cylinder(d=1.0, h=10, center=true);
        for (y = [-5,+5]) for (z = [-8,+8]) 
            translate([0,y,z]) rotate([0,90,0]) cylinder(d=3.3, h=06, center=true);
   }
}

module anti_belt_mount_S() {
    translate([0,0,4.5])
    difference() {
        cube([4, 17, 9], center=true);
        for (x = [-2,+2]) for (z = [-3:2:+3])
            translate([x,0,z]) rotate([90,0,0]) cylinder(d=1, h=10, center=true);
        for (y = [-5,+5]) 
            translate([0,y,0]) rotate([0,90,0]) cylinder(d=3.3, h=6, center=true);
   }
}

for (x = [0:8:(6*8)])
    translate([x,00,0]) anti_belt_mount_S();