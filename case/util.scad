module rounded_cube(size, radius, center=false) {
	minkowski() {
		cylinder(r=radius, center=center);
		cube(size, center=center);
	}
}

function in2mm(v) = v * 25.4;

module scale_in2mm() {
	for (i = [0 : $children-1])
		scale([25.4, 25.4, 25.4])
			child(i);
}


$fn=30;

scale_in2mm() {
	difference() {
		rounded_cube([7, 7, 2], 0.5, center=true);
		translate([0, 0, 0.1]) {
			rounded_cube([6.7, 6.7, 2], 0.5, center=true);
		}
	}
	rounded_cube([2, 2, 1], 0.5, center=true);
}