// Global resolution
$fs = 0.1;  // Don't generate smaller facets than 0.1 mm
$fa = 5;    // Don't generate larger angles than 5 degrees

// Main geometry
union() {
    translate([0,0,-2]) front();
    baffle();
}

// Core geometric primitives
// These can be modified to create variations of the final object

module baffle() {
    difference() {
        speakerRadius();
        speakerInset();
    }
}

module front() {
    difference() {
        cylinder(h=2, r=28  , center=true);
        cylinder(h=2, r=50/2, center=true);
    }
    
}

module edge() {
    cube(55);
}

module speakerInset() {
    cylinder(h=2, r=45/2, center=true);
}

module speakerRadius() {
    cylinder(h=2, r=28, center=true);
}

