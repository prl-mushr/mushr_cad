$include_rcus=true; 
include <racecar_crossbar_upper_support.scad>

rcbs_length = 7.25;
rcbs_width = rcus_width;
rcbs_height = rcus_height;

rcbs_screw_x_from_bottom = rcbs_length/2.0;
rcbs_screw_y_separation = 17.0;
rcbs_screw_radius = rcus_screw_radius;
rcbs_screw_x_offset = - rcbs_length/2.0+rcbs_screw_x_from_bottom;
rcbs_screw_left_y_offset = rcbs_screw_y_separation/2.0;
rcbs_screw_right_y_offset = -rcbs_screw_y_separation/2.0;   
rcbs_screw_z_offset = 0.0; 

 if ($include_rcbs==undef) {
    RacecarCrossbarBottomSupport();
 }

module RacecarCrossbarBottomSupport(height=rcbs_height) {
    
    rcbs_screw_height = height;
    
    difference() {
        translate([0.0, 0.0, 0.0]) {
            cube([rcbs_length, rcbs_width, height], true);
        }
            
        translate([rcbs_screw_x_offset, rcbs_screw_left_y_offset, rcbs_screw_z_offset]) {
            cylinder(rcbs_screw_height, rcbs_screw_radius, rcbs_screw_radius, true, $fn=_fn_val);
        }

        translate([rcbs_screw_x_offset, rcbs_screw_right_y_offset, rcbs_screw_z_offset]) {
            cylinder(rcbs_screw_height, rcbs_screw_radius, rcbs_screw_radius, true, $fn=_fn_val);
        }
    }

}