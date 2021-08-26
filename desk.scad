desk_height = 24.5;
top_width = 59;
top_depth = 29.5;

module top() {
  cube([top_depth, top_width, 1.5]);
}

module leg(length) {
  translate([0, 0, length / 2])
    cube([3, 2, length], center = true);
  cube([27.5, 2.75, 1], center = true);
}

module legs(length) {
  leg(length);
  translate([0, 42, 0])
    leg(length);
}

module desk() {
  translate([0, 0, desk_height])
    top();

  translate([top_depth / 2, (top_width - 42) / 2, 0])
  legs(desk_height);
}
