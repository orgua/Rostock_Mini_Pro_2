# RepRap Delta Rostock Mini Pro 2

This project offers an improved, redesigned and cleaned fork of the original sources:
- Rostock Mini Pro (CZAR) [thingiverse](http://www.thingiverse.com/thing:318971)
- Rostock Mini (bwevans) [thingiverse](http://www.thingiverse.com/thing:32850/) 
- Rostock (Johann) [thingiverse](http://www.thingiverse.com/thing:17175) [github](https://github.com/jcrocholl/rostock)

Used Software: 
- [OpenSCAD](http://www.openscad.org) 2015.10.17 
- [Inkscape](https://inkscape.org) 0.91 

Improvements in comparison to the Mini Pro:
- openSCAD-code base reworked
   - more modular design and more parametric
   - better documentation
   - cleaner code, no missing dependencies, less dead code
   - it's easier to make own mods
- included bill of material and links (for orientation) [here](sources_bom/readme.md)
- included marlin-config (for orientation) 
- included redesign of bottom and top plate (Inkscape svg) [here](sources_inkscape/readme.md)
- more space under the printer (there is just USB and power coming out of mine)
   - this design allows shorter wires to the motors and results in better EMC
   - shock absorbing standoffs (if printed with soft PLA)
   - better cooling for motors
   - allows active cooling for motor-drivers
- better stability, less wiggle, stiffer frame, better print-quality
   - better fin-design for all plate-connecting parts
   - design of hotend-mount is much more sturdy 
   - allow two lm8uu per rod (4 per carriage)
- the fan of the E3D-Hotend fits between hotend-mount and platform
   - hotend is lifted and print-space in z-direction is bigger 
- included space / cutout for nuts on more places
- hal-sensor-end-stops with better repeatability 
- better cable-management
- includes a filament-holder on top of the printer
- direct mounting at carriage of open belt-ends with zip-ties (with belt_mount_for_carriage.scad) 
   - groves secure belt-mount 
- built in power-switch next to the heat-bed

Still to do: 
- include cooling into platform
- add more pictures
- further optimize the code 
- document hal-sensor-board
- motor-mount: add more space above the motor for better cooling

Pictures (in progress):

![Front](/assembly_pictures/DSC08004.jpg)

![TOP](/assembly_pictures/DSC07994.jpg)

![DETAIL](/assembly_pictures/DSC07998.jpg)
