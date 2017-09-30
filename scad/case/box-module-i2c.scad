/* 
Original http://www.thingiverse.com/thing:1680291
Customizable everything box (waterproof)
by mcseven
Licensed under the Creative Commons - Attribution - Share Alike license
*/

/* [Box Options] */
// Dimension: Box outer X-Size [mm]
box_Size_X          = 90;
// Dimension: Box outer Y-Size [mm]
box_Size_Y          = 80;
// Dimension: Box Inner6 height [mm]
box_Inner_Height    = 36;
// Box bottom/top thickness
box_BottomTop_Thickness =  1.6; // [0.6:0.2:3]
// Edge corner radius 
box_Screw_Corner_Radius   =  6; // [2:1:10]
// four outer screw hole diameters
box_Screw_Diameter     =  3.2; // [2:0.2:4]
// Box wall thickness
box_Wall_Thickness     =  3; // [0.4:0.2:3.2]
/* [Top Barrier Options] */
// Box barrier thickness
barrier_Thickness  =  1.2; // [0.4:0.2:3.2]
// Box barrier height
barrier_Height     =  2;   // [1.0:0.2:8]
// Additional width on the lid to correct for badly calibrated printers
barrier_Tolerance  =  0.2; // [0.0:0.1:1]
/* [Mouting Screw Nose Options] */
// Number of screw noses
screwnose_Number        = 4; // [0:No noses, 2: one top/one bottom, 4: two top/two bottom]
// Diameter of the noses' screw holes
screwnose_Diameter      = 4; // [2:0.2:8]
// Height of the noses
screwnose_Height        = 5; // [2:0.2:10]
// Wall thickness
screwnose_Wall_Thickness = 2.8; // [2:0.2:5]

cRadius = 6.0;
bncOffset = 20;
dpsOffset = 15;
dpsHeight = 15;
dpsStep = 2.54;
dpsBorderWidth = 2.54;
dpsBorderHeight = 4 - box_Wall_Thickness;

keystoneOffset = 20;
keystoneHeight = 12;


// **************************
// ** Calculated globals
// **************************
boxHeight = box_Inner_Height+box_BottomTop_Thickness;

module box() {
	barrier_Thickness = box_Wall_Thickness-barrier_Thickness;
	difference() {
		union() {
			// solid round box, corners
			translate([box_Screw_Corner_Radius, box_Screw_Corner_Radius, 0]) cylinder(r=box_Screw_Corner_Radius, h=boxHeight, $fn=50); // bottom left
			translate([box_Size_X-box_Screw_Corner_Radius, box_Screw_Corner_Radius, 0]) cylinder(r=box_Screw_Corner_Radius, h=boxHeight, $fn=50); // bottom right
			translate([box_Screw_Corner_Radius, box_Size_Y-box_Screw_Corner_Radius, 0]) cylinder(r=box_Screw_Corner_Radius, h=boxHeight, $fn=50); // top left
			translate([box_Size_X-box_Screw_Corner_Radius, box_Size_Y-box_Screw_Corner_Radius, 0]) cylinder(r=box_Screw_Corner_Radius, h=boxHeight, $fn=50); // bottom right
			// solid round box, inner filling
			translate([0, box_Screw_Corner_Radius, 0]) cube([box_Size_X, box_Size_Y-2*box_Screw_Corner_Radius, boxHeight]);
			translate([box_Screw_Corner_Radius, 0, 0]) cube([box_Size_X-2*box_Screw_Corner_Radius, box_Size_Y, boxHeight]);
			// solid round box, top border
			translate([barrier_Thickness, box_Screw_Corner_Radius+barrier_Thickness, 0]) cube([box_Size_X-2*barrier_Thickness, box_Size_Y-2*box_Screw_Corner_Radius-2*barrier_Thickness, boxHeight+barrier_Height]);
			translate([box_Screw_Corner_Radius+barrier_Thickness, barrier_Thickness, 0]) cube([box_Size_X-2*box_Screw_Corner_Radius-2*barrier_Thickness, box_Size_Y-2*barrier_Thickness, boxHeight+barrier_Height]);

        translate([dpsOffset+8*dpsStep-dpsBorderWidth,(box_Wall_Thickness+0.1), box_BottomTop_Thickness+dpsHeight-dpsBorderWidth]) rotate([90,00,0]) cube([6+dpsBorderWidth*2, 10.5+dpsBorderWidth*2, box_Wall_Thickness+dpsBorderHeight]);
        translate([dpsOffset+4*dpsStep-dpsBorderWidth,(box_Wall_Thickness+0.1), box_BottomTop_Thickness+dpsHeight-dpsBorderWidth]) rotate([90,00,0]) cube([6+dpsBorderWidth*2, 10.5+dpsBorderWidth*2, box_Wall_Thickness+dpsBorderHeight]);
        translate([dpsOffset+0*dpsStep-dpsBorderWidth,(box_Wall_Thickness+0.1), box_BottomTop_Thickness+dpsHeight-dpsBorderWidth]) rotate([90,00,0]) cube([6+dpsBorderWidth*2, 8+dpsBorderWidth*2, box_Wall_Thickness+dpsBorderHeight]);


		}
		// inner cut-out
		translate([box_Wall_Thickness, box_Screw_Corner_Radius+box_Wall_Thickness, box_BottomTop_Thickness]) cube([box_Size_X-2*box_Wall_Thickness, box_Size_Y-2*box_Screw_Corner_Radius-2*box_Wall_Thickness, boxHeight+barrier_Height]);
		translate([box_Screw_Corner_Radius+box_Wall_Thickness, box_Wall_Thickness, box_BottomTop_Thickness]) cube([box_Size_X-2*box_Screw_Corner_Radius-2*box_Wall_Thickness, box_Size_Y-2*box_Wall_Thickness, boxHeight+barrier_Height]);
		// Screw holes
		translate([(box_Screw_Corner_Radius+box_Wall_Thickness)/2,(box_Screw_Corner_Radius+box_Wall_Thickness)/2,0]) cylinder(r=box_Screw_Diameter/2, h=boxHeight, $fn=20);
		translate([(box_Screw_Corner_Radius+box_Wall_Thickness)/2,box_Size_Y-(box_Screw_Corner_Radius+box_Wall_Thickness)/2,0]) cylinder(r=box_Screw_Diameter/2, h=boxHeight, $fn=20);
		translate([box_Size_X-(box_Screw_Corner_Radius+box_Wall_Thickness)/2,(box_Screw_Corner_Radius+box_Wall_Thickness)/2,0]) cylinder(r=box_Screw_Diameter/2, h=boxHeight, $fn=20);
		translate([box_Size_X-(box_Screw_Corner_Radius+box_Wall_Thickness)/2,box_Size_Y-(box_Screw_Corner_Radius+box_Wall_Thickness)/2,0]) cylinder(r=box_Screw_Diameter/2, h=boxHeight, $fn=20);
		// **************************
		// ** YOUR OWN CUTOUTS HERE!
		// **************************


		translate([box_Size_X-bncOffset,(box_Wall_Thickness+0.1), box_BottomTop_Thickness+20]) rotate([90,00,0]) cylinder(r=cRadius, h=box_Wall_Thickness+0.2,$fn=50);
		translate([box_Size_X-bncOffset-15.3,(box_Wall_Thickness+0.1), box_BottomTop_Thickness+20]) rotate([90,00,0]) cylinder(r=cRadius, h=box_Wall_Thickness+0.2,$fn=50);


        translate([dpsOffset+8*dpsStep,(box_Wall_Thickness+0.1), box_BottomTop_Thickness+dpsHeight]) rotate([90,00,0]) cube([6, 10.5, box_Wall_Thickness+1.2]);
        translate([dpsOffset+4*dpsStep,(box_Wall_Thickness+0.1), box_BottomTop_Thickness+dpsHeight]) rotate([90,00,0]) cube([6, 10.5, box_Wall_Thickness+1.2]);
        translate([dpsOffset+0*dpsStep,(box_Wall_Thickness+0.1), box_BottomTop_Thickness+dpsHeight]) rotate([90,00,0]) cube([6, 8, box_Wall_Thickness+1.2]);
        
        translate([keystoneOffset,(0.1+box_Size_Y), box_BottomTop_Thickness+keystoneHeight]) rotate([90,00,0]) cube([19.4, 15.95, box_Wall_Thickness+0.2]);

//        translate([-0.1+box_Size_X-box_Wall_Thickness,(box_Size_Y-15), box_BottomTop_Thickness+keystoneHeight+2]) rotate([90,0,0]) cube([box_Wall_Thickness+0.2, 4*dpsStep+0.2, 2.9+0.2]);

  translate([-0.1,35, box_BottomTop_Thickness+keystoneHeight+2]) rotate([90,0,0]) cube([box_Wall_Thickness+0.2, 4*dpsStep+0.2, 2.9+0.2]);

		// **************************
		// ** / CUTOUTS
		// **************************
	}
	// Lower nose(s)
	if (screwnose_Number==2) translate([box_Size_X/2, 0.001, 0]) mirror([0,1,0]) screwNose(screwnose_Diameter, screwnose_Height);
	if (screwnose_Number==4) {
		translate([box_Size_X*0.25, 0.001, 0]) mirror([0,1,0]) screwNose(screwnose_Diameter, screwnose_Height);
		translate([box_Size_X*0.75, 0.001, 0]) mirror([0,1,0]) screwNose(screwnose_Diameter, screwnose_Height);
	}
	// Upper nose(s)
	if (screwnose_Number==2) translate([box_Size_X/2, box_Size_Y-0.001, 0]) screwNose(screwnose_Diameter, screwnose_Height);
	if (screwnose_Number==4) {
		translate([box_Size_X*0.25, box_Size_Y-0.001, 0]) screwNose(screwnose_Diameter, screwnose_Height);
		translate([box_Size_X*0.75, box_Size_Y-0.001, 0]) screwNose(screwnose_Diameter, screwnose_Height);
	}
}

module lid() {
	boxHeight = box_BottomTop_Thickness+barrier_Height;
	difference() {
		union() {
			// solid round box, corners
			translate([box_Screw_Corner_Radius, box_Screw_Corner_Radius, 0]) cylinder(r=box_Screw_Corner_Radius, h=boxHeight, $fn=50); // bottom left
			translate([box_Size_X-box_Screw_Corner_Radius, box_Screw_Corner_Radius, 0]) cylinder(r=box_Screw_Corner_Radius, h=boxHeight, $fn=50); // bottom right
			translate([box_Screw_Corner_Radius, box_Size_Y-box_Screw_Corner_Radius, 0]) cylinder(r=box_Screw_Corner_Radius, h=boxHeight, $fn=50); // top left
			translate([box_Size_X-box_Screw_Corner_Radius, box_Size_Y-box_Screw_Corner_Radius, 0]) cylinder(r=box_Screw_Corner_Radius, h=boxHeight, $fn=50); // bottom right
			// solid round box, inner filling
			translate([0, box_Screw_Corner_Radius, 0]) cube([box_Size_X, box_Size_Y-2*box_Screw_Corner_Radius, boxHeight]);
			translate([box_Screw_Corner_Radius, 0, 0]) cube([box_Size_X-2*box_Screw_Corner_Radius, box_Size_Y, boxHeight]);
			// solid round box, top border
		}
		// inner cut-out X direction
		translate([
			box_Wall_Thickness-(barrier_Thickness+barrier_Tolerance),
			box_Screw_Corner_Radius+box_Wall_Thickness-(barrier_Thickness+barrier_Tolerance),
			box_BottomTop_Thickness
		]) cube([
			box_Size_X-2*(box_Wall_Thickness)+2*(barrier_Thickness+barrier_Tolerance),
			box_Size_Y-2*box_Screw_Corner_Radius-2*(box_Wall_Thickness)+2*(barrier_Thickness+barrier_Tolerance),
			box_BottomTop_Thickness+barrier_Height
		]);
		// inner cut-out Y direction
		translate([
			box_Screw_Corner_Radius+box_Wall_Thickness-(barrier_Thickness+barrier_Tolerance),
			box_Wall_Thickness-(barrier_Thickness+barrier_Tolerance),
			box_BottomTop_Thickness
		]) cube([
			box_Size_X-2*box_Screw_Corner_Radius-2*(box_Wall_Thickness)+2*(barrier_Thickness+barrier_Tolerance),
			box_Size_Y-2*(box_Wall_Thickness)+2*(barrier_Thickness+barrier_Tolerance),
			box_BottomTop_Thickness+barrier_Height
		]);
		
		// Screw holes
		translate([(box_Screw_Corner_Radius+box_Wall_Thickness)/2,(box_Screw_Corner_Radius+box_Wall_Thickness)/2,0]) cylinder(r=box_Screw_Diameter/2, h=boxHeight, $fn=20);
		translate([(box_Screw_Corner_Radius+box_Wall_Thickness)/2,box_Size_Y-(box_Screw_Corner_Radius+box_Wall_Thickness)/2,0]) cylinder(r=box_Screw_Diameter/2, h=boxHeight, $fn=20);
		translate([box_Size_X-(box_Screw_Corner_Radius+box_Wall_Thickness)/2,(box_Screw_Corner_Radius+box_Wall_Thickness)/2,0]) cylinder(r=box_Screw_Diameter/2, h=boxHeight, $fn=20);
		translate([box_Size_X-(box_Screw_Corner_Radius+box_Wall_Thickness)/2,box_Size_Y-(box_Screw_Corner_Radius+box_Wall_Thickness)/2,0]) cylinder(r=box_Screw_Diameter/2, h=boxHeight, $fn=20);
	}

	// inner add X direction
	translate([box_Wall_Thickness+barrier_Tolerance, box_Screw_Corner_Radius+box_Wall_Thickness+barrier_Tolerance, box_BottomTop_Thickness])
		cube([box_Size_X-2*(box_Wall_Thickness+barrier_Tolerance), box_Size_Y-2*(box_Screw_Corner_Radius+box_Wall_Thickness+barrier_Tolerance), barrier_Height]);
	// inner add Y direction
	translate([box_Screw_Corner_Radius+box_Wall_Thickness+barrier_Tolerance, box_Wall_Thickness+barrier_Tolerance, box_BottomTop_Thickness])
		cube([box_Size_X-2*(box_Screw_Corner_Radius+box_Wall_Thickness+barrier_Tolerance), box_Size_Y-2*(box_Wall_Thickness+barrier_Tolerance), barrier_Height]);
}

module screwNose(screwholeDiameter=4, noseHeight=5) {
	additionalDistanceFromWall = 1;
	translate([0,screwholeDiameter/2+screwnose_Wall_Thickness+additionalDistanceFromWall, 0]) difference() {
		union() {
			translate([-(screwholeDiameter/2+screwnose_Wall_Thickness), -(screwholeDiameter/2+screwnose_Wall_Thickness+additionalDistanceFromWall),0]) cube([(screwholeDiameter/2+screwnose_Wall_Thickness)*2, screwholeDiameter/2+screwnose_Wall_Thickness+additionalDistanceFromWall, noseHeight]);
			cylinder(r=(screwholeDiameter/2)+screwnose_Wall_Thickness, h=noseHeight, $fn=60);
		}
		cylinder(r=screwholeDiameter/2, h=noseHeight, $fn=60);
	}
}
box();
if (box_Size_X>box_Size_Y) {
	translate([0, box_Size_Y+5+screwnose_Diameter+screwnose_Wall_Thickness, 0]) lid();	
} else {
	translate([box_Size_X+5, 0, 0]) lid();	
}
