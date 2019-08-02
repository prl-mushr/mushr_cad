include <../misc/racecar_global_utils.scad>

if ($include_rcl==undef) {
    RacecarChassisLink();
}

rclh_length = 8.0;
rclh_width = 21.0;
rclh_height = 5.6;

module RacecarChassisLink(rcl_width = 58.72, rcl_head_pitch = 0.0) {
    
    rcl_body_cylinder_height = rcl_width - 2*rclh_width;
    rcl_body_cylinder_radius = 3.0/2.0;
    rcl_body_hex_height = 7.0;
    rcl_body_hex_diameter = 4.0;
    rcl_body_x_offset = 0.0;
    rcl_body_y_offset = 0.0;
    rcl_body_z_offset = 0.0;
    
    translate([rcl_body_x_offset, rcl_body_y_offset, rcl_body_z_offset]) {
        rotate([90,0,0]) {
            cylinder(rcl_body_cylinder_height, rcl_body_cylinder_radius, rcl_body_cylinder_radius, true, $fn=_fn_val);
            _hexagon(rcl_body_hex_height, rcl_body_hex_diameter);
        }
    }
    
    translate([0.0,rcl_width/2.0 - rclh_width/2.0, 0.0]) {
        rotate([0,rcl_head_pitch,0]) {
            RacecarChassisLinkHead();    
        }
    }
    
    translate([0.0,-rcl_width/2.0 + rclh_width/2.0, 0.0]) {
        rotate([0,0,180]) {
            RacecarChassisLinkHead();    
        }
    }    
        
}

module RacecarChassisLinkHead() {
    
    rclh_head_outer_radius = rclh_length/2.0;
    rclh_head_inner_radius = 5.25/2.0;
    rclh_head_height = 3.75;
    rclh_head_x_offset = 0.0;
    rclh_head_y_offset = -rclh_head_outer_radius+rclh_width/2.0;
    rclh_head_z_offset = 0.0;
    
    rclh_base_diameter = rclh_height;
    rclh_base_height = 9.5;
    rclh_base_x_offset = rclh_head_x_offset;
    rclh_base_y_offset = rclh_base_height/2.0 - rclh_width/2.0;
    rclh_base_z_offset = rclh_head_z_offset;
    
    rclh_connect_insert_depth = 1.0;
    rclh_connect_length = rclh_width - rclh_base_height - 2*rclh_head_outer_radius+rclh_connect_insert_depth;
    rclh_connect_back_width = rclh_base_diameter;
    rclh_connect_front_width = rclh_head_height;
    rclh_connect_height = rclh_base_diameter*tan(30);
    rclh_connect_x_offset = rclh_base_x_offset;
    rclh_connect_y_offset = rclh_base_y_offset + rclh_base_height/2.0 + rclh_connect_length/2.0;
    rclh_connect_z_offset = rclh_base_z_offset;
    hull(){
        translate([rclh_base_x_offset, rclh_base_y_offset, rclh_base_z_offset]) {
            rotate([90,30,0]) {
                _hexagon(rclh_base_height, rclh_base_diameter);
            }
        }
        translate([rclh_connect_x_offset,rclh_connect_y_offset,rclh_connect_z_offset]) {
            rotate([0,0,90]) {
                _trapezoid(rclh_connect_front_width,rclh_connect_back_width, rclh_connect_length,rclh_connect_height);
            }
        }
    }
    translate([rclh_head_x_offset, rclh_head_y_offset, rclh_head_z_offset]) {
        difference() {
            cylinder(rclh_head_height, rclh_head_outer_radius, rclh_head_outer_radius, true, $fn=_fn_val);
            cylinder(rclh_head_height, rclh_head_inner_radius, rclh_head_inner_radius, true, $fn=_fn_val);
        }
    }
    
}