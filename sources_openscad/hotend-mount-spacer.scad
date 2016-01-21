/*
Two of these spacers are placed between platform and hotend-mount.

Improvement: 
- offers an offset for the hotend-mount
- the fan of the E3D-Hotend fits between mount and platform 

TODO:
-
*/

$fn=48;
include<misc_parts.scad>

module mount_spacer()
{
difference() 
{
    round_cuboid(19,10,30,3);
    cylinder(d=3,h=33,center=true);
    scale([1,1,1.4]) rotate([90,0,0]) cylinder(d=12,h=20,center=true);
}
}

mount_spacer();