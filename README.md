# Era

Era is a fast, cheap, simple, robust 3d printer design.

This project is greatly inspired by [Ultimaker 2 Aluminum Extrusion 3D printer](http://www.thingiverse.com/thing:811271).

## The Era Principle

Era is designed with the principle: minimal efforts to achieve professional grade.：

First, it is designed to be easily printable from any present printer. As most printers print in PLA or ABS, which are not as strong as metal or polycarbonate (the most common casing and part material on mid-to-hign end commercial printers), Era parts are designed to be very thick and stiff. They may not look fancy, but have a unified clean look, easy to print with minimal support, and is strong enough (sometimes over-strong that you may think it is wasting material, but the structural strength will pay in time) ,making it viberation-resilent and durable. Calibrate once and run everywhere!

The second is the massive use of standard metal parts. Standard metals parts are stronger than plastic, robust, easy to get and cheap. Era features a fully printable compact dual Bowden printhead with adjustable height and cooling duct. It consists of only 1-peice printed part and mostly standard metal parts. Era also uses standard NEMA17 stepper instead of threaded rod NEMA17. All M3 T-nuts on  [Ultimaker 2 Aluminum Extrusion 3D printer](http://www.thingiverse.com/thing:811271) are changed to M4 T-nuts, as they are generally more common.

The third is room for calibration. As low-priced materials often comes with low quality, there might be a lot of issues. Consider you ordered 2 pieces of aluminum extrusion in 308mm, but got one in 307mm and one in 309mm, and they cannot fit on the opposite sides of a square!  You ordered two "exactly same hotends", only to find they are different in height and cannot be installed together! Era takes full consider of these problems and leaves room for calibration. With careful adjustments on some screws, you can get a perfectly calibrated printer even with low-quality materials.

And "minimal efforts" is not only for users, but also developers. All Era parts are drawn from scratch in OpenSCAD, so a lot of code can be reused and easily modified. It's also very easy to read and understand. Join the development of Era at https://github.com/sgsdxzy/era and make Era better! Or you can even use the established Era code base to build your own 3D printer!

## Design Objectives

### How fast

We desgin for a minimum of 200mm/s. 400mm/s is possible.

### How cheap

It should cost around 1200-1400 CNY (around 200 USD) If you live in China and buy all parts online.

### How simple

We use a minimum number of printed/non-standard parts in favor of standard parts.

### How robust

It should run 7/24 if you give a good supply of filament and power.
