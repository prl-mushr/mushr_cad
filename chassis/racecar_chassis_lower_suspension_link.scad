include <../misc/racecar_global_utils.scad>

if ($include_rclsl==undef) {
    RacecarChassisLowerSuspensionLink();
}

module RacecarChassisLowerSuspensionLink(rclsl_width = 65.67) {
    rclsl_length = 31.86;
    rclsl_height = 10.0;
    
    rclsl_platform_end_height = rclsl_length;
    rclsl_platform_end_radius = rclsl_height/2.0;
    rclsl_platform_end_x_offset = 0.0;
    rclsl_platform_end_y_offset = -rclsl_width/2.0 + rclsl_platform_end_radius;
    rclsl_platform_end_z_offset = 0.0;
    
    rclsl_wheel_end_height = rclsl_length;
    rclsl_wheel_end_radius = 3.5;
    rclsl_wheel_end_x_offset = rclsl_platform_end_x_offset;
    rclsl_wheel_end_y_offset = rclsl_width/2.0 - rclsl_wheel_end_radius;
    rclsl_wheel_end_z_offset = rclsl_platform_end_z_offset;
    
    rclsl_insert_depth = 8.0;
    rclsl_body_length = rclsl_width -2*rclsl_platform_end_radius - 2*rclsl_wheel_end_radius + rclsl_insert_depth;
    rclsl_body_back_width = rclsl_platform_end_height;
    rclsl_body_front_width = 24.0;
    rclsl_body_height = 6.75;
    rclsl_body_x_offset = rclsl_wheel_end_x_offset;
    rclsl_body_y_offset = 0.5*(rclsl_platform_end_y_offset + rclsl_wheel_end_y_offset);
    rclsl_body_z_offset = rclsl_wheel_end_z_offset;
    
    translate([rclsl_platform_end_x_offset, rclsl_platform_end_y_offset, rclsl_platform_end_z_offset]) {
        rotate([0,90,0]) {
            cylinder(rclsl_platform_end_height, rclsl_platform_end_radius, rclsl_platform_end_radius, true, $fn=_fn_val);
        }
    }
    
    translate([rclsl_wheel_end_x_offset, rclsl_wheel_end_y_offset, rclsl_wheel_end_z_offset]) {
        rotate([0,90,0]) {
            cylinder(rclsl_wheel_end_height, rclsl_wheel_end_radius, rclsl_wheel_end_radius, true, $fn=_fn_val);
        }
    }   
   
    translate([rclsl_body_x_offset, rclsl_body_y_offset, rclsl_body_z_offset]) {
        rotate([0,0,90]) {
            difference() {
                _trapezoid(rclsl_body_front_width, rclsl_body_back_width, rclsl_body_length, rclsl_body_height);
            
                difference() {
                    rclsl_body_margin = 5;
                    rclsl_body_cutout_length = rclsl_body_length-rclsl_body_margin-rclsl_insert_depth;
                    rclsl_body_cutout_width = rclsl_body_front_width-rclsl_body_margin;
                    rclsl_body_cutout_height = rclsl_body_height;
                    rclsl_body_cutout_angle = atan(rclsl_body_cutout_width/rclsl_body_cutout_length);
                    cube([rclsl_body_cutout_length,rclsl_body_cutout_width,rclsl_body_cutout_height], true);
                    rotate([0,0,rclsl_body_cutout_angle]) {
                        cube([2*rclsl_body_cutout_length, rclsl_body_margin, rclsl_body_cutout_height], true);
                    }
                    rotate([0,0,-rclsl_body_cutout_angle]) {
                        cube([2*rclsl_body_cutout_length, rclsl_body_margin, rclsl_body_cutout_height], true);
                    }                    
                    
                }
            }
        }
    } 
    
}