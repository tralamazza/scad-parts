use <util.scad>

thickness = 0.062; // pcb thickness in inches. ref: DH77DF_TechProdSpec02.pdf

module heightConstraints() {
	// ref: mini ITX spec V1.1
	// units in mm
	areaA = [113, 155, 57];
	areaB = [170, 15, 16];
	areaC = [30, 155, 38];
	areaD = [27, 155, 39];
	alpha = 0.75;

	union() {
		color("Green", alpha) translate([27, 15, 0]) cube(areaA);
		color("Blue", alpha) cube(areaB);
		color("Red", alpha) translate([140, 15, 0]) cube(areaC);
		color("Magenta", alpha) translate([0, 15, 0]) cube(areaD);
	}
}

module mountingDiagram() {
	// ref: DH77DF_TechProdSpec02.pdf
	// units in inches
	mhole_r = 0.08; // radius, ref says 0.16 diameter

	module mhole(x, y) {
		translate([x, y, -thickness / 2]) cylinder(h=2 * thickness, r=mhole_r);
	}

	scale_in2mm() {
		difference() {
			color("Gold") cube([6.7, 6.7, thickness]);
			mhole(0.4, 0.275);
			mhole(1.3, 6.425);
			mhole(6.5, 0.275);
			mhole(6.5, 6.425);
		}
	}
}

module miniITX(withHeights=true) {
	mountingDiagram();
	if (withHeights) {
		translate([0, 0, in2mm(thickness)]) heightConstraints();
	}
}

miniITX();
