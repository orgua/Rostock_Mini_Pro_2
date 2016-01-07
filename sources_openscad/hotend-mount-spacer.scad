$fn=48;

module round_cube(x,y,z,r) 
{
    cube([x,y-2*r,z],center=true);
    cube([x-2*r,y,z],center=true);
    cube([x-2*r,y-2*r,z],center=true);
    
    translate([+x/2-r,+y/2-r,0]) cylinder(r=r,h=z,center=true);
    translate([+x/2-r,-y/2+r,0]) cylinder(r=r,h=z,center=true);
    translate([-x/2+r,+y/2-r,0]) cylinder(r=r,h=z,center=true);
    translate([-x/2+r,-y/2+r,0]) cylinder(r=r,h=z,center=true);
}   

difference() 
{
    round_cube(19,10,30,3);
    cylinder(d=3,h=33,center=true);
    scale([1,1,1.4]) rotate([90,0,0]) cylinder(d=12,h=20,center=true);
}