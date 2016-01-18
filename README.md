# Rostock_Mini_Pro_2

This project offers an improved, redesigned and cleaned fork of the original sources:
- Rostock Mini Pro (CZAR) http://www.thingiverse.com/thing:318971
- Rostock Mini http://www.thingiverse.com/thing:32850/ 

Improvements in comparison to the Mini Pro:
- openSCAD-code base reworked
   - more modular design and parametrized
   - better documentation
   - cleaner code, no missing dependencies, less dead code
- included bill of material
- included marlin-config (for orientation)
- more space under the printer (there is just usb and power coming out of mine)
   - this design allows shorter wires to the motores and results in better EMC
   - shock absorbing standoffs (if printed with soft PLA)
   - better cooling for motors
- better stability, less wiggle, stiffer frame
   - better fin-design for plate-connectors
   - hotend-mount is much more sturdy 
   - allow two lm8uu per rod (4 per carriage)
- the fan of the E3D-Hotend fits between hotend-mount and platform 
- included space / cutout for nuts on more places
- hal-sensor-endstops with better repeatability 
- better cable-management
- includes a filament-holder on top of the printer
- direct mounting at carriage of open belt-ends with zip-ties (with belt_mount_for_carriage.scad) 
   - groves secure belt-mount 


Still to do: 
- include cooling into platform
- add more pictures
- further optimize the code 
- document hal-sensor-board
- motormount: more space above the motor for better cooling

Pictures (in progress):

![Front](/assembly_pictures/DSC08004.jpg)

![TOP](/assembly_pictures/DSC07994.jpg)

![DETAIL](/assembly_pictures/DSC07998.jpg)