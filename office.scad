room_width = 81;
room_depth = 117;
room_height = 91.25;
wall_thickness = 4.5;

module room() {
  difference() {
    cube([
      room_width + (2 * wall_thickness),
      room_depth + (2 * wall_thickness),
      room_height + wall_thickness
    ]);
    translate([
      wall_thickness,
      wall_thickness,
      wall_thickness
    ])
      cube([
        room_width,
        room_depth,
        room_height + wall_thickness
      ]);
  }
}

module door() {
  cube([
    35.5,
    wall_thickness + 1,
    79,
  ]);
}

module ledge(length) {
  union() {
    translate([0, 0, 34])
      cube([
        length,
        5,
        1.5
      ]);
    cube([
      length,
      4.75,
      34
    ]);
  }
}

module soffit() {
  cube([
    15,
    room_depth,
    8
  ]);
}

module office() {
  difference() {
    room();
    translate([
      wall_thickness + 11,
      -0.5,
      wall_thickness + 1.5
    ])
      door();
  }

  union() {
    rotate([0, 0, 180])
      translate([
        -(room_width + wall_thickness),
        -(room_depth + wall_thickness),
        wall_thickness
      ])
      ledge(room_width);
    rotate([0, 0, 90])
      translate([
        wall_thickness,
        -(room_width + wall_thickness),
        wall_thickness
      ])
      ledge(room_depth);
  }

  translate([0, wall_thickness, room_height - 8 + wall_thickness])
  soffit();
}

office();
