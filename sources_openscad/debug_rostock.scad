/*

This file is just for debug and shows the parts of printer compiled in one view.

TODO: 
- add both plates (svg, dxf)
- add motors, carriage-rods? --> unprintable_parts.scad 
*/

rp = 150; // radius of top/bottom plate
hp = 5;   // height of plates

use <debug_drive_with_carriage.scad>
use <debug_platform_with_hotend_mount.scad>

$fn = 24;

for (a=[0:120:359])
    rotate(a) translate([0,-rp,0]) drive_with_carriage();

translate([0,0,200]) platform_with_hotend_mount();

// top and bottom plate
translate([0,0, 42 + hp/2]) cylinder(r=rp,h=5);
translate([0,0,500 + hp/2]) cylinder(r=rp,h=5);