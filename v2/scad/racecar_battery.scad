$include_rc = true;
$include_rff = true;

include <../../chassis/racecar_chassis.scad>
//include <racecar_front_foundation.scad>

rb_length = 135.0;
rb_width = 46.8;
rb_height = 24.0;

rb_chassis_wrt_rcb_x_offset = rc_wrt_rcb_x_offset;
rb_chassis_wrt_rcb_y_offset = rc_wrt_rcb_y_offset + rb_width/2.0 + 5.0;
rb_chassis_wrt_rcb_z_offset = rc_wrt_rcb_z_offset + 2.54/2.0 + rb_height/2.0;

rb_foundation_left_wrt_rcb_x_offset = rbf_wrt_rcb_x_offset+rbf_battery_wall_back_x_offset+rbf_battery_wall_back_length/2.0+rb_length/2.0;
rb_foundation_left_wrt_rcb_y_offset = rbf_wrt_rcb_y_offset+0.5*(rbf_battery_wall_side_left_y_offset+rbf_battery_wall_back_y_offset);
rb_foundation_left_wrt_rcb_z_offset = rbf_wrt_rcb_z_offset + rbf_height/2.0+rb_height/2.0;

rb_foundation_right_wrt_rcb_x_offset = rbf_wrt_rcb_x_offset+rbf_battery_wall_back_x_offset+rbf_battery_wall_back_length/2.0+rb_length/2.0;
rb_foundation_right_wrt_rcb_y_offset = rbf_wrt_rcb_y_offset+0.5*(rbf_battery_wall_side_right_y_offset+rbf_battery_wall_back_y_offset);
rb_foundation_right_wrt_rcb_z_offset = rbf_wrt_rcb_z_offset + rbf_height/2.0+rb_height/2.0;


if($include_rb==undef) {
    RacecarBattery();
}

module RacecarBattery() {
    rb_front_length = 10.75;
    rb_front_width = rb_width;
    rb_front_height = rb_height;
    rb_front_x_offset = rb_length/2.0 - rb_front_length/2.0;
    rb_front_y_offset = 0.0;
    rb_front_z_offset = 0.0;
    
    rb_back_length = rb_front_length;
    rb_back_width = rb_width;
    rb_back_height = rb_height;
    rb_back_x_offset = -rb_length/2.0 + rb_front_length/2.0;
    rb_back_y_offset = 0.0;
    rb_back_z_offset = 0.0;    
    
    rb_body_length = rb_length - rb_front_length - rb_back_length;
    rb_body_width = 42.75;
    rb_body_height = rb_front_height;
    rb_body_x_offset = 0.0;
    rb_body_y_offset = 0.0;
    rb_body_z_offset = 0.0;
    
    translate([rb_front_x_offset, rb_front_y_offset, rb_front_z_offset]) {
        rotate([0,90,0]) {
            rotate([0,0,90]) {
                _rounded_square(rb_front_width, rb_front_height, rb_front_length);
            }
        }
    }
    
    translate([rb_back_x_offset, rb_back_y_offset, rb_back_z_offset]) {
        rotate([0,90,0]) {
            rotate([0,0,90]) {
                _rounded_square(rb_back_width, rb_back_height, rb_back_length);
            }
        }
    }    

    translate([rb_body_x_offset, rb_body_y_offset, rb_body_z_offset]) {
        rotate([0,90,0]) {
            rotate([0,0,90]) {
                _rounded_square(rb_body_width, rb_body_height, rb_body_length);
            }
        }
    }
    
}