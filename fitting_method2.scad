// Global resolution
$fs = 0.1;  // Don't generate smaller facets than 0.1 mm
$fa = 5;    // Don't generate larger angles than 5 degrees

// Main geometry
difference() {
    
    union() {
        
        difference()
        {
            s();
            
        }
        
        intersection()
        {
            difference() {
                union() {
                    sbaff();
                    mbaff();
                }
                bafcuttop();
                bafcutbot();    
                cutout();
            }
            cylinder(h=200,r=31, center=true);
        }
        
    }
    topcut();
    botcut();
    //check(); //view inside sphere
}

// Core geometric primitives
// These can be modified to create variations of the final object

module mbaff() {
    intersection()
    {
        translate([0,0,0])
        mirror([0,0,0])
        difference() {
        baffle();
        cutout();
        speakerInset();
        }
    }
}

module baffle() {
    height = 6;
    radius = 61.8/2;
    translate([0,0,0]) cylinder(h=height, r=radius, center=false, $fa=1, $fs=1, $fn=200);
}

module cutout() {
    height = 20;
    radius = 45/2;
    cylinder(h=height, r=radius, center=true);
}

module speakerInset() {
    height = 10;
    radius = 50/2;
    translate([0,0,2]) cylinder(h=height, r=radius, center=height/2);
}

module s()
{
    difference()
    {
        
        translate([0,0,-24.55])
            sphere(r=44, $fa=20, $fs=20, $fn=200);
        
        translate([0,0,-24.55]) sphere(r=39.5, $fa=0.1, $fs=0.1, $fn=200);
        
    }
}

module topcut() {
    face=100;
    z=56;
    translate([0,0,z])
        cube(face, center=true);
}

module botcut() {
    face=200;
    z=-135;
    translate([0,0,z])
        cube(face, center=true);
}

module check()
{
    translate([40, 0, 0])
        cube(100, center=true);
}

module sbaff()
{
    translate([0,0,59])
    difference()
    {
        
        translate([0,0,-24.55])
            sphere(r=44, $fa=20, $fs=20, $fn=200);
        
        translate([0,0,-24.55]) sphere(r=39.5, $fa=0.1, $fs=0.1, $fn=200);
        
    }
}

module bafcuttop()
{
    face=100;
    z=56;
    translate([0,0,z])
        cube(face, center=true);
}

module bafcutbot()
{
    face=100;
    z=-50;
    translate([0,0,z])
        cube(face, center=true);
}