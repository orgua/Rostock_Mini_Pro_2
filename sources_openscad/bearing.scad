steel = [0.8, 0.8, 0.9];

module bearing(id, od, w) {
    translate([0,w/2,0])
    color(steel) 
    render()
    rotate([90, 0, 0]) difference() {
		cylinder(h=w, r=od/2, center=true);
		cylinder(h=w*2, r=id/2, center=true);
    }
}

bearing(8, 22, 7); // 608 skateboard ball bearing.

module lm8uu() {
    translate([0,0,25/2])
    color(steel) render() difference() {
        cylinder(h=25, r=7.5, center=true);
        cylinder(h=30, r=4, center=true);
    }
}

translate([30, 0, 0]) lm8uu(); // Linear bearing for 8mm smooth rod.

module lm6uu() {
    translate([0,0,19/2])
    color(steel) render() difference() {
        cylinder(h=19, r=6, center=true);
        cylinder(h=30, r=3, center=true);
    }
}


translate([-30, 0, 0]) lm6uu();