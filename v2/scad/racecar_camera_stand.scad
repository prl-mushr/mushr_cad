$include_rcm = true;
include <racecar_camera_mount.scad>

rcs_length = 25.0;
rcs_width = rcs_length;
rcs_height = 47.5;

rcs_wrt_rcb_x_offset = rcm_wrt_rcb_x_offset;
rcs_wrt_rcb_y_offset = rcm_wrt_rcb_y_offset;
rcs_wrt_rcb_z_offset = rcm_wrt_rcb_z_offset+rcm_height/2.0+rcs_height/2.0;

if($include_rcs == undef) {
    RacecarCameraStand();
}

module RacecarCameraStand() {
    
    rcs_base_height = 20.8;
    rcs_base_radius = rcs_length/2.0;
    rcs_base_x_offset = 0.0;
    rcs_base_y_offset = 0.0;
    rcs_base_z_offset = -rcs_height/2.0 + rcs_base_height/2.0;
    
    rcs_upper_height = 11.67;
    rcs_upper_radius = 18.55/2.0;
    rcs_upper_x_offset = rcs_base_x_offset;
    rcs_upper_y_offset = rcs_base_y_offset;
    rcs_upper_z_offset = rcs_base_z_offset + rcs_base_height/2.0 + rcs_upper_height/2.0;
    
    rcs_tighten_height = 6.3;
    rcs_tighten_radius = 25.0/2.0;
    rcs_tighten_x_offset = rcs_upper_x_offset;
    rcs_tighten_y_offset = rcs_upper_y_offset;
    rcs_tighten_z_offset = rcs_height/2.0 - rcs_tighten_height/2.0;
    
    rcs_neck_height = rcs_height - rcs_base_height - rcs_upper_height - rcs_tighten_height;
    rcs_neck_radius = 6.8/2.0;
    rcs_neck_x_offset = rcs_tighten_x_offset;
    rcs_neck_y_offset = rcs_tighten_y_offset;
    rcs_neck_z_offset = rcs_upper_z_offset+rcs_upper_height/2.0+rcs_neck_height/2.0;
    
    translate([rcs_base_x_offset, rcs_base_y_offset, rcs_base_z_offset]) {
        cylinder(rcs_base_height, rcs_base_radius, rcs_base_radius, true, $fn=_fn_val);
    }
    
    translate([rcs_upper_x_offset, rcs_upper_y_offset, rcs_upper_z_offset]) {
        cylinder(rcs_upper_height, rcs_upper_radius, rcs_upper_radius, true, $fn=_fn_val);
    }    
    
    translate([rcs_neck_x_offset, rcs_neck_y_offset, rcs_neck_z_offset]) {
        cylinder(rcs_neck_height, rcs_neck_radius, rcs_neck_radius, true, $fn=_fn_val);
    }    
    translate([rcs_tighten_x_offset, rcs_tighten_y_offset, rcs_tighten_z_offset]) {
        cylinder(rcs_tighten_height, rcs_tighten_radius, rcs_tighten_radius, true, $fn=_fn_val);
    }
}