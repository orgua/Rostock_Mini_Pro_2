
for(i=[0:2]) translate([0,36*i]) nema14_gasket();

module nema14_gasket() difference() {
	intersection() {
		square([35,35],center=true);
		rotate(45) square([46,46],center=true);
	}
	circle(r=22/2,$fn=48);
	for(x=[-13,13]) for(y=[-13,13])
		translate([x,y]) circle(r=1.5,$fn=16);
}