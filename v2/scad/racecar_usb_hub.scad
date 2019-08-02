$include_rs = true;
include <racecar_scaffold.scad>

rusbh_length = 40.7;
rusbh_width = 91.05;
rusbh_height = 32.5;
rusbh_x_offset = 0.0;
rusbh_y_offset = 0.0;
rusbh_z_offset = 0.0;

rusbh_wrt_rcb_x_offset = rbf_wrt_rcb_x_offset+rs_wrt_rbf_x_offset;
rusbh_wrt_rcb_y_offset = rbf_wrt_rcb_y_offset+rs_wrt_rbf_y_offset;
rusbh_wrt_rcb_z_offset = rbf_wrt_rcb_z_offset+rs_wrt_rbf_z_offset+rs_height/2.0+rusbh_height/2.0;

if($include_rusbh==undef) {
    RacecarUSBHub();
}

module RacecarUSBHub() {
    rusbh_round_radius = 4.0;
    rusbh_round_height = rusbh_height;
    rusbh_round_front_x_offset = rusbh_length/2.0 - rusbh_round_radius;
    rusbh_round_back_x_offset = -rusbh_length/2.0 + rusbh_round_radius;
    rusbh_round_left_y_offset = rusbh_width/2.0 - rusbh_round_radius;
    rusbh_round_right_y_offset = -rusbh_width/2.0 + rusbh_round_radius;rusbh_round_z_offset = rusbh_z_offset;

    rusbh_base_length = rusbh_length - 2*rusbh_round_radius;
    rusbh_base_width = rusbh_width - 2*rusbh_round_radius;
    rusbh_base_height = rusbh_height;
    rusbh_base_x_offset = rusbh_x_offset;
    rusbh_base_y_offset = rusbh_y_offset; 
    rusbh_base_z_offset = rusbh_z_offset;

    hull() {
        translate([rusbh_base_x_offset, rusbh_base_y_offset, rusbh_base_z_offset]) {
            cube([rusbh_base_length, rusbh_base_width, rusbh_base_height], true);
        }
        translate([rusbh_round_front_x_offset, rusbh_round_left_y_offset, rusbh_round_z_offset]) {
            cylinder(rusbh_round_height, rusbh_round_radius, rusbh_round_radius, true, $fn=_fn_val);
        }
        translate([rusbh_round_front_x_offset, rusbh_round_right_y_offset, rusbh_round_z_offset]) {
            cylinder(rusbh_round_height, rusbh_round_radius, rusbh_round_radius, true, $fn=_fn_val);
        }
        translate([rusbh_round_back_x_offset, rusbh_round_left_y_offset, rusbh_round_z_offset]) {
            cylinder(rusbh_round_height, rusbh_round_radius, rusbh_round_radius, true, $fn=_fn_val);
        }
        translate([rusbh_round_back_x_offset, rusbh_round_right_y_offset, rusbh_round_z_offset]) {
            cylinder(rusbh_round_height, rusbh_round_radius, rusbh_round_radius, true, $fn=_fn_val);
        }        
    }
}