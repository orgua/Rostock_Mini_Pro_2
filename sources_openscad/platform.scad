/*
Info:
This part mounts the hotend, z-Probe, ring-light and other stuff you need. You need just 1 of this. 

Improvement:
- none so far

TODO: 
- include cooling
- include z-probe
- include mount for led-ring

*/

platform_hinge_offset = 32;
platform_thickness    = 8;

cutout = 12.5;
inset  = 6;

$fn = 48;

use <carriage_for_traxxas.scad>

h=platform_thickness;

// nonprintable
module led_ring() 
{
    difference() 
    {
        cylinder(d=80, h=4.5, center=true);
        cylinder(d=64, h=5, center=true);
    }
}
//translate([0,0,12]) led_ring();


module platform() 
{
    translate([0, 0, h/2]) difference() 
    {
    
        // the organic triangular shape
        union() 
        {
            for (a = [0:2]) rotate(a*120)        
            {
                translate([0, -platform_hinge_offset, 0]) parallel_joints();
                // Close little triangle holes.
                translate([0, 31, 0]) cylinder(r=5, h=h, center=true);
            }
    
            // the big cylinder in the middle  
            cylinder(r=30, h=h, center=true);
        }
        
        cylinder(r=20, h=h+12, center=true);
        // set of mounting-holes
        for (a = [0:5]) 
            rotate(a*60) translate([0, -25, 0]) cylinder(r=2.2, h=h+1, center=true);
    }
}

platform();