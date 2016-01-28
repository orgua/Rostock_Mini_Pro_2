/*

This file is just for debug and shows the parts of printer compiled in one view.

TODO: 
- add both plates (svg, dxf)
- add motors, carriage-rods? --> unprintable_parts.scad 
*/

rp = 188; // radius of top/bottom plate
hp = 5;   // height of plates

use <debug_drive_with_carriage.scad>
use <debug_platform_with_hotend_mount.scad>

$fn = 24;

for (a=[0:120:359])
    rotate(a) translate([0,-rp,0]) drive_with_carriage($fn = 24);

translate([0,0,200]) platform_with_hotend_mount($fn = 24);

// top and bottom plate
rotate(180) translate([-180,-127, 0])
{
    translate([0,0, 42 + hp/2]) linear_extrude(height = 5, center = true, convexity = 10)
            import (file = "plate_bottom.dxf");
    translate([0,0,500 + hp/2]) linear_extrude(height = 5, center = true, convexity = 10)
            import (file = "plate_top.dxf");
}