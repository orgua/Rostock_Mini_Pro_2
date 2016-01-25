/*

This file is just for debug and shows the platform of the printer compiled in one view.

*/

use <platform.scad>
use <hotend_mount_spacer.scad>
use <hotend_mount.scad>


module platform_with_hotend_mount()
{
    translate([0,0,-8]) platform();
    
    translate([0,+25,15]) mount_spacer();
    translate([0,-25,15]) mount_spacer();

    translate([0,0,30+6]) rotate([ 0, 0,+90]) bowden_clamp();
    translate([0,0,30+6]) rotate([ 0, 0,-90]) bowden_clamp();
}

platform_with_hotend_mount();