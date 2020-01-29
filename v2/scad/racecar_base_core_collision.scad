$include_rc = false;
include <../../chassis/racecar_chassis.scad>

$include_rusbh = false;
include <racecar_usb_hub.scad>

rbccol_length = (rc_wrt_rcb_x_offset+rcp_front_bumper_x_offset+rcpfb_tri_x_offset+rcpfb_tri_height/2.0)-(rc_wrt_rcb_x_offset+rc_back_gearbox_x_offset+rcbb_back_bar_x_offset-rcbb_back_bar_height/2.0); 
rbccol_width = rcbb_back_bar_length;
rbccol_height = (rusbh_wrt_rcb_z_offset  + rusbh_z_offset + rusbh_height/2.0)-(rc_wrt_rcb_z_offset + rc_back_gearbox_z_offset +rcbb_flap_z_offset - rcbb_flap_height/2.0);
rbccol_x_offset = (rc_wrt_rcb_x_offset+rc_back_gearbox_x_offset+rcbb_back_bar_x_offset-rcbb_back_bar_height/2.0) + rbccol_length/2.0;
rbccol_y_offset = rc_wrt_rcb_y_offset+rcbb_back_bar_y_offset;
rbccol_z_offset = (rusbh_wrt_rcb_z_offset  + rusbh_z_offset + rusbh_height/2.0) - rbccol_height/2.0;

if($include_rbccol==undef) {

    RacecarBaseCollisionCore();
}

module RacecarBaseCollisionCore() {

    translate([rbccol_x_offset, rbccol_y_offset, rbccol_z_offset]) {
        cube([rbccol_length, rbccol_width, rbccol_height], true);
    }
    
}