/*
Info: 
You need >=3 of these holders to mount a filament role on the top of the printer.
Designed for:
- two 625ZZ-Bearings 
- two ## mm M5 Screws and nuts (optional) for the bearings
- two ## mm M4 Screws for mounting

Improvement:
- wasn't there before

TODO: 
- better documentation
- strengthen role of hF
*/

hF = 18; // height of filament --> is not choosable, just as information

$fn=48;

include <misc_parts.scad>

module non_printable_parts() 
{
    translate([+5,8.5, hF-8]) rotate([-90,0,0]) bearing(5,16,5);
    translate([-5, 2,15+2]) rotate([00,0,0])   bearing(5,16,5);
    translate([0,110,hF+1]) cylinder(d=200,h=2,center=true); // filament role, bottom
}


module groundplate(height) 
{
    translate([  0,0,height/2]) cube([30,16,height], center=true);
    translate([+15,0,height/2]) cylinder(d=16,h=height,center=true);
    translate([-15,0,height/2]) cylinder(d=16,h=height,center=true); 
}

module filament_holder() 
{
    difference() 
    {
        union() 
        {
            difference() 
            {
                groundplate(6);
                translate([5,8.5,hF-8]) rotate([90,0,0]) cylinder(d=18,h=4,center=true);
            }

            translate([+5,7.5,hF-8]) rotate([90,0,0]) cylinder(d1=8.5,d2=12,h=2.01,center=true);
            translate([-5,2.0,15+1]) rotate([00,0,0]) cylinder(d2=8.5,d1=12,h=2.01,center=true);
    
            translate([+5,-0.75,hF-8]) rotate([90,0,0]) cylinder(d=12,h=14.5,center=true);
            translate([-5,+2.00,7.5])  rotate([00,0,0]) cylinder(d=12,h=15,center=true);
        }

        translate([+5, 10, hF-8]) rotate([90,0,0]) cylinder(d=4.8,h=50,center=true);
        translate([-5,  2,   15]) rotate([00,0,0]) cylinder(d=5.1,h=50,center=true);

        translate([+15, 0, 0]) rotate([00,0,0]) cylinder(d=4.3,h=40,center=true);
        translate([-15, 0, 0]) rotate([00,0,0]) cylinder(d=4.3,h=40,center=true);

        translate([+5, -5, hF-8]) rotate([90,0,0]) cylinder(d=9.5,h=6.1,center=true,$fn=6);
        translate([-5, +2, 3])    rotate([00,0,0]) cylinder(d=9.5,h=6.1,center=true,$fn=6);
    }
}

filament_holder();

// debug: 
//non_printable_parts();