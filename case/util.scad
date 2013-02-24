
module rounded_cube(size, radius, center=false) {
	minkowski() {
		cylinder(r=radius, center=center);
		cube(size, center=center);
	}
}

function in2mm(v) = v * 25.4;

module scale_in2mm() {
	scale([25.4, 25.4, 25.4])
		child(0);
}


$fn=20;
scale_in2mm() {
	rounded_cube([7, 7, 2], 1);
}