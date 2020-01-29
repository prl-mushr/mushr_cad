$include_rc = false;
include <../../chassis/racecar_chassis.scad>

$include_rjn = false;
include <racecar_jetson_nano.scad>

rbcc_length = (rc_wrt_rcb_x_offset+rcp_front_bumper_x_offset+rcpfb_tri_x_offset+rcpfb_tri_height/2.0)-(rc_wrt_rcb_x_offset+rc_back_gearbox_x_offset+rcbb_back_bar_x_offset-rcbb_back_bar_height/2.0); 
rbcc_width = rcbb_back_bar_length;
rbcc_height = (rjn_wrt_rcb_z_offset + rjn_height/2.0 + rjn_support_height)-(rc_wrt_rcb_z_offset + rc_back_gearbox_z_offset +rcbb_flap_z_offset - rcbb_flap_height/2.0);
rbcc_x_offset = (rc_wrt_rcb_x_offset+rc_back_gearbox_x_offset+rcbb_back_bar_x_offset-rcbb_back_bar_height/2.0) + rbcc_length/2.0;
rbcc_y_offset = rc_wrt_rcb_y_offset+rcbb_back_bar_y_offset;
rbcc_z_offset = (rjn_wrt_rcb_z_offset + rjn_height/2.0 + rjn_support_height) - rbcc_height/2.0;

if($include_rbcc==undef) {

    RacecarBaseCollisionCore();
}

module RacecarBaseCollisionCore() {

    translate([rbcc_x_offset, rbcc_y_offset, rbcc_z_offset]) {
        cube([rbcc_length, rbcc_width, rbcc_height], true);
    }
    
}