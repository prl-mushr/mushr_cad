$include_rbct = false;
include <racecar_back_cover_top.scad>

$include_rc = false;
include <../../chassis/racecar_chassis.scad>

rbc_length = (rc_wrt_rcb_x_offset+rcp_front_bumper_x_offset+rcpfb_tri_x_offset+rcpfb_tri_height/2.0)-(rc_wrt_rcb_x_offset+rc_back_gearbox_x_offset+rcbb_back_bar_x_offset-rcbb_back_bar_height/2.0);
rbc_width = (rc_wrt_rcb_y_offset+rc_wheel_left_y_offset+rcw_outer_height/2.0)-(rc_wrt_rcb_y_offset+rc_wheel_right_y_offset-rcw_outer_height/2.0);
rbc_height = (rbf_wrt_rcb_z_offset+rbct_wrt_rbf_z_offset+rbct_height/2.0)-(rc_wrt_rcb_z_offset+rc_wheel_z_offset-rcw_outer_radius);
rbc_x_offset = (rc_wrt_rcb_x_offset+rc_back_gearbox_x_offset+rcbb_back_bar_x_offset-rcbb_back_bar_height/2.0) + rbc_length/2.0;
rbc_y_offset = (rc_wrt_rcb_y_offset+rc_wheel_right_y_offset-rcw_outer_height/2.0) + rbc_width/2.0;
rbc_z_offset = (rc_wrt_rcb_z_offset+rc_wheel_z_offset-rcw_outer_radius) + rbc_height/2.0;

if($include_rbc==undef) {

    RacecarBaseCollision();
}

module RacecarBaseCollision() {

    translate([rbc_x_offset, rbc_y_offset, rbc_z_offset]) {
        cube([rbc_length, rbc_width, rbc_height], true);
    }
    
}

