$include_rcbs = true;
include <racecar_crossbar_bottom_support.scad>

rcb_length = 179+rcus_length+rcbs_length;
rcb_width = rcus_width;
rcb_height = 2.5;

rcb_body_screw_y_from_edge = 4.0;
rcb_body_screw_radius = rcus_screw_radius;
rcb_body_screw_front_x_offset = -rcb_length/2.0 + 102.0;
rcb_body_screw_back_x_offset = -rcb_length/2.0 +87.0;
rcb_body_screw_y_offset = -rcb_width/2.0+rcb_body_screw_y_from_edge;
rcb_body_screw_z_offset = 0.0;

rcbs_wrt_rcb_x_offset = -rcb_length/2.0+rcbs_length/2.0;
rcbs_wrt_rcb_y_offset = 0.0;
rcbs_wrt_rcb_z_offset = -rcb_height/2.0-rcbs_height/2.0;

rcus_wrt_rcb_x_offset = rcb_length/2.0-rcus_length/2.0;
rcus_wrt_rcb_y_offset = 0.0;
rcus_wrt_rcb_z_offset = -rcb_height/2.0-rcus_height/2.0;

if ($include_rcb==undef) {
    RacecarCrossbarBody();
}

module RacecarCrossbarBody() {
    front_x_offset = rcb_length/2.0 - rcus_length/2.0;
    front_y_offset = 0.0;
    front_z_offset = 0.0;
     
    body_length = rcb_length-rcus_length-rcbs_length;
    body_width = rcb_width;
    body_height = rcb_height;
    body_x_offset = front_x_offset - rcus_length/2.0 - body_length/2.0;
    body_y_offset = front_y_offset;
    body_z_offset = front_z_offset;
     
    back_x_offset = body_x_offset - body_length/2.0 - rcbs_length/2.0;
    back_y_offset = body_y_offset;
    back_z_offset = body_z_offset;
     
    rcb_body_screw_height = rcb_height;
    
    difference() {
        union() {
            translate([front_x_offset, front_y_offset, front_z_offset]) {
                RacecarCrossbarUpperSupport(rcb_height, false);
            }
            translate([body_x_offset, body_y_offset, body_z_offset]) {
                cube([body_length, body_width, body_height], true);
            }
            translate([back_x_offset, back_y_offset, back_z_offset]) {
                RacecarCrossbarBottomSupport(rcb_height);
            }
        }
        translate([rcb_body_screw_front_x_offset, rcb_body_screw_y_offset, rcb_body_screw_z_offset]) {
            cylinder(rcb_body_screw_height, rcb_body_screw_radius, rcb_body_screw_radius, true, $fn=_fn_val);
        }
        translate([rcb_body_screw_back_x_offset, rcb_body_screw_y_offset, rcb_body_screw_z_offset]) {
            cylinder(rcb_body_screw_height, rcb_body_screw_radius, rcb_body_screw_radius, true, $fn=_fn_val);
        }                 
     }
        
     
}
