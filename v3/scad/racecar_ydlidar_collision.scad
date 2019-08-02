$include_ry = true;
include <racecar_ydlidar.scad>

ryc_length = ry_length;
ryc_width = ry_width;
ryc_height = ry_height;
ryc_x_offset = ryb_back_cylinder_x_offset - ryb_back_cylinder_radius + ryc_length/2.0;
ryc_y_offset = 0.0;
ryc_z_offset = 0.0;

if($include_ryc==undef) {
    RacecarYDLidarCollision();
}

module RacecarYDLidarCollision() {
    translate([ryc_x_offset, ryc_y_offset, ryc_z_offset]) {
        cube([ryc_length, ryc_width, ryc_height], true);
    }
}