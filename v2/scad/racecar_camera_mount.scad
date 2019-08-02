$include_rff = true;
include <racecar_front_foundation.scad>

rcm_length = 32.0;
rcm_width = 32.0;
rcm_height = _wall_thickness;
rcm_x_offset = 0.0;
rcm_y_offset = 0.0;
rcm_z_offset = 0.0;

rcm_wrt_rcb_x_offset = rff_wrt_rcb_x_offset + rff_imu_x_offset;
rcm_wrt_rcb_y_offset = rff_wrt_rcb_y_offset + rff_imu_y_offset;
rcm_wrt_rcb_z_offset = rff_wrt_rcb_z_offset + rff_imu_z_offset + rimu_height/2.0 + rcm_height/2.0;

if($include_rcm == undef) {
    RacecarCameraMount();
}

module RacecarCameraMount() {
    
    rcm_support_height = rcm_height;
    rcm_support_radius = _m3_screw_shaft_radius;
    rcm_support_front_x_offset = rimu_support_front_x_offset;
    rcm_support_back_x_offset = rimu_support_back_x_offset;
    rcm_support_left_y_offset = rimu_support_left_y_offset;
    rcm_support_right_y_offset = rimu_support_right_y_offset;
    rcm_support_z_offset = rcm_z_offset;
    
    rcm_screw_x_offset = rcm_x_offset;
    rcm_screw_y_offset = rcm_y_offset;
    rcm_screw_z_offset = rcm_z_offset;    
    
    difference() {
        translate([rcm_x_offset, rcm_y_offset, rcm_z_offset]) {
            cube([rcm_length, rcm_width, rcm_height], true);
        }
        translate([rcm_support_front_x_offset, rcm_support_left_y_offset, rcm_support_z_offset]) {
            cylinder(rcm_support_height, rcm_support_radius, rcm_support_radius, true, $fn=_fn_val);
        }
        translate([rcm_support_front_x_offset, rcm_support_right_y_offset, rcm_support_z_offset]) {
            cylinder(rcm_support_height, rcm_support_radius, rcm_support_radius, true, $fn=_fn_val);
        }        
        translate([rcm_support_back_x_offset, rcm_support_left_y_offset, rcm_support_z_offset]) {
            cylinder(rcm_support_height, rcm_support_radius, rcm_support_radius, true, $fn=_fn_val);
        }
        translate([rcm_support_back_x_offset, rcm_support_right_y_offset, rcm_support_z_offset]) {
            cylinder(rcm_support_height, rcm_support_radius, rcm_support_radius, true, $fn=_fn_val);
        }

        translate([rcm_screw_x_offset, rcm_screw_y_offset, rcm_screw_z_offset]) {
            rotate([180,0,0]) {
                _m4_flathead_screw(rcm_height+0.01);
            }
        }

    }
    
    
    
}