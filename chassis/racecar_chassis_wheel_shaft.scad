include <../misc/racecar_global_utils.scad>

rcws_fn_val = 25;

if ($include_rcws==undef) {
    RacecarChassisWheelShaft();
}

module RacecarChassisWheelShaft(rcws_width = 73.35) {
    rcws_length = 10.0;
    rcws_height = 6.75;
    
    rcws_head_radius = rcws_height/2.0;
    rcws_head_x_offset = 0.0;
    rcws_head_left_y_offset = rcws_width/2.0 - rcws_head_radius;
    rcws_head_right_y_offset = -rcws_width/2.0 + rcws_head_radius;
    rcws_head_z_offset = 0.0;
    
    rcws_cylinder_height = rcws_length;
    rcws_cylinder_radius = 3/2.0;
    rcws_cylinder_x_offset = rcws_head_x_offset;
    rcws_cylinder_left_y_offset = rcws_head_left_y_offset;
    rcws_cylinder_right_y_offset = rcws_head_right_y_offset;
    rcws_cylinder_z_offset = rcws_head_z_offset;
    
    rcws_body_radius = 3.5/2.0;
    rcws_body_height = rcws_width - rcws_head_radius;
    rcws_body_x_offset = rcws_head_x_offset;
    rcws_body_y_offset = 0.0;
    rcws_body_z_offset = rcws_head_z_offset;
    
    translate([rcws_body_x_offset, rcws_body_y_offset, rcws_body_z_offset]) {
        rotate([90,0,0]) {
            cylinder(rcws_body_height, rcws_body_radius, rcws_body_radius, true, $fn=_fn_val);
        }
    }
    
    translate([rcws_head_x_offset, rcws_head_left_y_offset, rcws_head_z_offset]) {
        sphere(r=rcws_head_radius, $fn=rcws_fn_val);
    }
    
    translate([rcws_cylinder_x_offset, rcws_cylinder_left_y_offset, rcws_cylinder_z_offset]) {
        rotate([0,90,0]) {
            cylinder(rcws_cylinder_height, rcws_cylinder_radius, rcws_cylinder_radius, true, $fn=_fn_val);
        }
    }
    
    translate([rcws_head_x_offset, rcws_head_right_y_offset, rcws_head_z_offset]) {
        sphere(r=rcws_head_radius, $fn=rcws_fn_val);
    }  
  
    translate([rcws_cylinder_x_offset, rcws_cylinder_right_y_offset, rcws_cylinder_z_offset]) {
        rotate([0,90,0]) {
            cylinder(rcws_cylinder_height, rcws_cylinder_radius, rcws_cylinder_radius, true, $fn=_fn_val);
        }
    }    
    
}