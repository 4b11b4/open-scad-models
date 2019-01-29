// Global resolution
$fs = 0.1;  // Don't generate smaller facets than 0.1 mm
$fa = 5;    // Don't generate larger angles than 5 degrees

$bot=1;
$magr = 18/2;

// Main geometry
difference() {
  rectangle();
  translate([0,$magr+1,$bot]) magnet();
  translate([0,-($magr+1),$bot]) magnet();
  translate([8,0,$bot]) drill();
  translate([-8,-20,$bot]) drill();
  translate([-8,20,$bot]) drill();
}

// Core geometric primitives
// These can be modified to create variations of the final object

module magnet() {
    h=10;
    r=$magr;
    cylinder(h=h, r=r, center=[0,0,h/2]);
}

module rectangle() {
    w=24;
    l=w*2;
    h=4;
    translate([0,0,h/2]) cube([w,l,h], center=true);
}

module drill() {
    h=10;
    r=2;
    cylinder(h=h, r=r, center=[0,0,h/2]);
}