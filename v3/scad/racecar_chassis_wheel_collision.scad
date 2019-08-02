$include_rcw = false;
include <../../chassis/racecar_chassis_wheel.scad>

rcwc_length = 2*rcw_outer_radius;
rcwc_width = rcw_outer_height+2*rcw_cap_height;
rcwc_height = 2*rcw_outer_radius;
rcwc_x_offset = 0.0;
rcwc_y_offset = 0.0;
rcwc_z_offset = 0.0;

if($include_rcwc==undef) {

    RacecarChassisWheelCollision();
}

module RacecarChassisWheelCollision() {

    translate([rcwc_x_offset, rcwc_y_offset, rcwc_z_offset]) {
        cube([rcwc_length, rcwc_width, rcwc_height], true);
    }
    
}