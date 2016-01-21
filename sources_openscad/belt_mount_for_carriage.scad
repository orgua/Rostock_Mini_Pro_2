/*
Info:
You can mount the open ends of the belt directly to see cariage. look at carriage_for_traxxas for more information. You need these 6 pieces.

Improvement:
- mounting the belt was a mess before

TODO: 
-
*/

$fn=48;

// small version of this part
module anti_belt_mount() 
{
    translate([0,0,4.5]) difference() 
    {
        cube([4, 17, 9], center=true);
        // belt-grooves
        for (x = [-2,+2]) for (z = [-3:2:+3])
            translate([x,0,z]) rotate([90,0,0]) cylinder(d=1.0, h=10,center=true);
        // mounting-holes for zip-ties
        for (y = [-5,+5]) 
            translate([0,y,0]) rotate([0,90,0]) cylinder(d=3.3, h= 6,center=true);
   }
}

for (x = [0:8:(5*8)])
    translate([x,00,0]) anti_belt_mount();