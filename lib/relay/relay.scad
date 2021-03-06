
width = 38;
height = 50;

module relay(count=2) {

    difference() {
        color("green") cube([width,height,2]);
        translate([3,3,0]) cylinder(r=2, h=5);
        translate([35,3,0]) cylinder(r=2, h=5);
        translate([35,47,0]) cylinder(r=2, h=5);
        translate([3,47,0]) cylinder(r=2, h=5);
    }

    color("blue") translate([3.5,5,0]) cube([15,27,16+2]);
    color("blue") translate([19.5,5,0]) cube([15,27,16+2]);

}

module relay_mount(count=2) {

    translate([width - 3,height-3,-5]) { cylinder(r=4, h=5); translate([0,0,5]) cylinder(r=1.9, h=5);}
    translate([3,height-3,-5]) { cylinder(r=4, h=5); translate([0,0,5]) cylinder(r=1.9, h=5);}  
    translate([3,3,-5]) { cylinder(r=4, h=5); translate([0,0,5]) cylinder(r=1.9, h=5);}  
    translate([width-3,3,-5]) { cylinder(r=4, h=5); translate([0,0,5]) cylinder(r=1.9, h=5);}  
}
