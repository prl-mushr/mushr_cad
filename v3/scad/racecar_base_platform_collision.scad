$include_rbct = false;
include <racecar_back_cover_top.scad>

$include_rff = false;
include <racecar_front_foundation.scad>

$include_rsc = false;
include <racecar_servo_cage.scad>

rbpc_length = (rff_wrt_rcb_x_offset+rff_length/2.0) - (rbf_wrt_rcb_x_offset - rbf_length/2.0);
rbpc_width = rbf_width;
rbpc_height = (rbf_wrt_rcb_z_offset+rbct_wrt_rbf_z_offset+rbct_height/2.0) - (rsc_wrt_rcb_z_offset-rsc_height/2.0-rsc_knub_height);
rbpc_x_offset = (rbf_wrt_rcb_x_offset - rbf_length/2.0)+rbpc_length/2.0;
rbpc_y_offset = rbf_wrt_rcb_y_offset;
rbpc_z_offset = rbf_wrt_rcb_z_offset+rbct_wrt_rbf_z_offset+rbct_height/2.0 - rbpc_height/2.0;

if($include_rbpc==undef) {

    RacecarBasePlatformCollision();
}

module RacecarBasePlatformCollision() {

    translate([rbpc_x_offset, rbpc_y_offset, rbpc_z_offset]) {
        cube([rbpc_length, rbpc_width, rbpc_height], true);
    }
    
}