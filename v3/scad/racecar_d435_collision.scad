$include_rd435 = true;
include <racecar_d435.scad>

rd435c_length = rd435_length;
rd435c_width = rd435_back_width;
rd435c_height = rd435_back_length;
rd435c_x_offset = 0.0;
rd435c_y_offset = 0.0;
rd435c_z_offset = 0.0;

if($include_rd435c==undef) {
    RacecarD435Collision();
}

module RacecarD435Collision() {
    translate([rd435c_x_offset, rd435c_y_offset, rd435c_z_offset]) {
        cube([rd435c_length, rd435c_width, rd435c_height], true);
    }
}