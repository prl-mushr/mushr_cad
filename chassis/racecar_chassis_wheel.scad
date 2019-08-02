include <../misc/racecar_global_utils.scad>

rcw_fn_val = 100;

rcw_outer_radius = 97.6/2.0;
rcw_outer_height = 35.0;
rcw_outer_x_offset = 0.0;
rcw_outer_y_offset = 0.0;
rcw_outer_z_offset = 0.0;

rcw_cap_radius = 88.11/2.0;
rcw_cap_height = 3.0;
rcw_cap_x_offset = rcw_outer_x_offset;
rcw_cap_left_y_offset = rcw_outer_y_offset + rcw_outer_height/2.0 + rcw_cap_height/2.0;
rcw_cap_right_y_offset = rcw_outer_y_offset - rcw_outer_height/2.0 - rcw_cap_height/2.0;
rcw_cap_z_offset = rcw_outer_z_offset;

rcw_inner_height = 30.0;
rcw_inner_radius = 71/2.0;
rcw_inner_x_offset = rcw_outer_x_offset;
rcw_inner_y_offset = rcw_outer_y_offset + rcw_outer_height/2.0 + rcw_cap_height - rcw_inner_height/2.0+0.001;
rcw_inner_z_offset = rcw_outer_z_offset;

rcw_face_cutout_length = 20.0;
rcw_face_cutout_back_width = 17.5;
rcw_face_cutout_front_width = 5.0;
rcw_face_cutout_height = rcw_outer_height + 2*rcw_cap_height - rcw_inner_height+0.001;
rcw_face_cutout_x_offset =  rcw_cap_x_offset;
rcw_face_cutout_y_offset = rcw_cap_right_y_offset - rcw_cap_height/2.0 +  rcw_face_cutout_height/2.0;
rcw_face_cutout_z_offset = rcw_outer_z_offset + rcw_face_cutout_length/2.0 + 11.8;

rcw_spoke_cutout_height = rcw_face_cutout_height/2.0;
rcw_spoke_cutout_radius = 15.0/2.0;
rcw_spoke_cutout_x_offset = rcw_face_cutout_x_offset;
rcw_spoke_cutout_y_offset = rcw_face_cutout_y_offset - rcw_face_cutout_height/2.0 + rcw_spoke_cutout_height/2.0-0.01;
rcw_spoke_cutout_z_offset = rcw_cap_z_offset;

/*
rcw_grip_length = 3.0;
rcw_grip_width = 1.0;
rcw_grip_height = 2*rcw_outer_radius + 3.0;
rcw_grip_x_offset = rcw_outer_x_offset;
rcw_grip_left_y_offset = rcw_outer_y_offset + rcw_outer_height/1.75;
rcw_grip_middle_y_offset = rcw_outer_y_offset;
rcw_grip_right_y_offset = rcw_outer_y_offset - rcw_outer_height/1.75;
rcw_grip_z_offset = rcw_outer_z_offset;
*/

rcw_axle_height = rcw_outer_height + 2*rcw_cap_height - rcw_face_cutout_height + 3.75;
rcw_axle_radius = 14.5/2.0;
rcw_axle_x_offset = rcw_outer_x_offset;
rcw_axle_y_offset = rcw_face_cutout_y_offset + rcw_face_cutout_height/2.0+rcw_axle_height/2.0;
rcw_axle_z_offset = rcw_outer_z_offset;

rcw_drive_outer_height = 10.5;
rcw_drive_outer_radius = 19.6/2.0;
rcw_drive_inner_height = rcw_drive_outer_height/2.0;
rcw_drive_inner_radius = 15.5/2.0;
rcw_drive_x_offset = rcw_axle_x_offset;
rcw_drive_y_offset = rcw_axle_y_offset + rcw_axle_height/2.0 + rcw_drive_outer_height/2.0;
rcw_drive_z_offset = rcw_axle_z_offset;

rcw_upper_suspension_length = 29.0;
rcw_upper_suspension_back_width = 17.5;
rcw_upper_suspension_front_width = 12.5;
rcw_upper_suspension_height = 8.0;
rcw_upper_suspension_x_offset = rcw_drive_x_offset;
rcw_upper_suspension_y_offset = rcw_drive_y_offset;
rcw_upper_suspension_z_offset = rcw_drive_z_offset + rcw_upper_suspension_length/2.0 +2.5;

rcw_lower_suspension_cube_length = 8.45;
rcw_lower_suspension_cube_width = rcw_drive_outer_height;
rcw_lower_suspension_cube_height = 7.0;
rcw_lower_suspension_cube_x_offset = rcw_drive_x_offset;
rcw_lower_suspension_cube_y_offset = rcw_drive_y_offset;
rcw_lower_suspension_cube_z_offset = rcw_drive_z_offset - rcw_lower_suspension_cube_height/2.0 - 6.0;

rcw_lower_suspension_cylinder_height = 15.0;
rcw_lower_suspension_cylinder_radius = 7.0/2.0;
rcw_lower_suspension_cylinder_x_offset = rcw_lower_suspension_cube_x_offset;
rcw_lower_suspension_cylinder_y_offset = rcw_lower_suspension_cube_y_offset;
rcw_lower_suspension_cylinder_z_offset = rcw_lower_suspension_cube_z_offset - rcw_lower_suspension_cube_height/2.0-1.0;

rcw_outer_suspension_link_length = 18.5;
rcw_outer_suspension_link_front_width = 38.5;
rcw_outer_suspension_link_back_width = 54.0;
rcw_outer_suspension_link_height = 4.1;
rcw_inner_suspension_link_length = 11.67;
rcw_inner_suspension_link_front_width = 24.45;
rcw_inner_suspension_link_back_width = 42.0;
rcw_inner_suspension_link_height = rcw_outer_suspension_link_height;
rcw_suspension_link_x_offset = rcw_drive_x_offset;
rcw_suspension_link_y_offset = rcw_cap_left_y_offset+rcw_cap_height/2.0+ rcw_outer_suspension_link_length/2.0 - 9.5;
rcw_suspension_link_z_offset = rcw_drive_z_offset;

rcwt_cutout_radius = rcw_cap_radius - 5.0;
rcwt_cutout_height = rcw_outer_height+2*rcw_cap_height+0.001;
rcwt_cutout_x_offset = rcw_outer_x_offset;
rcwt_cutout_y_offset = rcw_outer_y_offset;
rcwt_cutout_z_offset = rcw_outer_z_offset;

if ($include_rcw==undef) {
    RacecarChassisWheel();
    //RacecarChassisWheelTire();
    //RacecarChassisWheelHub();
    //RacecarChassisWheelAxle();
}

module RacecarChassisWheelTire() {
    difference() {
        RacecarChassisWheel();
        translate([rcwt_cutout_x_offset, rcwt_cutout_y_offset, rcwt_cutout_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rcwt_cutout_height, rcwt_cutout_radius, rcwt_cutout_radius,true,$fn=rcw_fn_val);
            }
        }
    }
}

module RacecarChassisWheelHub() {
    difference() {
        RacecarChassisWheel();
        RacecarChassisWheelTire();
    }
}

module RacecarChassisWheel() {
    
    difference() {
        
        union(){
            translate([rcw_outer_x_offset, rcw_outer_y_offset, rcw_outer_z_offset]) {
                rotate([90,0,0]) {
                    cylinder(rcw_outer_height, rcw_outer_radius, rcw_outer_radius, true, $fn=rcw_fn_val);
                }
            }
            translate([rcw_cap_x_offset, rcw_cap_left_y_offset, rcw_cap_z_offset]) {
                rotate([-90,0,0]) {
                    cylinder(rcw_cap_height, rcw_outer_radius, rcw_cap_radius, true, $fn=rcw_fn_val);
                }
            }
            translate([rcw_cap_x_offset, rcw_cap_right_y_offset, rcw_cap_z_offset]) {
                rotate([90,0,0]) {
                    cylinder(rcw_cap_height, rcw_outer_radius, rcw_cap_radius, true, $fn=rcw_fn_val);
                }
            }
            /*
            for(i=[0:119]) {
                rotate([0,i*3,0]) {
                    translate([rcw_grip_x_offset, rcw_grip_middle_y_offset, rcw_grip_z_offset]) {
                        _diamond(rcw_grip_length, rcw_grip_width, rcw_grip_height);
                    }
                }
            }
            */
            
        }
        translate([rcw_inner_x_offset, rcw_inner_y_offset, rcw_inner_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rcw_inner_height, rcw_inner_radius, rcw_inner_radius, true, $fn=rcw_fn_val);
            }
        }
        
        for(i =[0:5]) {
            rotate([0,i*60,0]) {
                translate([rcw_face_cutout_x_offset, rcw_face_cutout_y_offset, rcw_face_cutout_z_offset]) {
                    rotate([0,90,90]) {
                        _rounded_trapezoid(rcw_face_cutout_front_width, rcw_face_cutout_back_width, rcw_face_cutout_length, rcw_face_cutout_height);
                    }
                }            
            }
        }
        translate([rcw_spoke_cutout_x_offset, rcw_spoke_cutout_y_offset, rcw_spoke_cutout_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rcw_spoke_cutout_height, rcw_spoke_cutout_radius, rcw_spoke_cutout_radius, true, $fn=rcw_fn_val);
            }
        }
    }
 
}

module RacecarChassisWheelAxle(right_ball_head=true) {
    
    translate([rcw_axle_x_offset, rcw_axle_y_offset, rcw_axle_z_offset]) {
        rotate([90,0,0]) {
            cylinder(rcw_axle_height, rcw_axle_radius, rcw_axle_radius, true, $fn=rcw_fn_val);
        }
    }
    
    difference() {
        union() {
            translate([rcw_drive_x_offset, rcw_drive_y_offset, rcw_drive_z_offset]) {
                rotate([90,0,0]) {
                        cylinder(rcw_drive_outer_height, rcw_drive_outer_radius, rcw_drive_outer_radius, true, $fn=rcw_fn_val);                     
                }
            }
            translate([rcw_upper_suspension_x_offset, rcw_upper_suspension_y_offset, rcw_upper_suspension_z_offset]) {
                rotate([0,-90,90]) {
                    _rounded_trapezoid(rcw_upper_suspension_front_width, rcw_upper_suspension_back_width, rcw_upper_suspension_length, rcw_upper_suspension_height);
                }
            }
            translate([rcw_lower_suspension_cube_x_offset,rcw_lower_suspension_cube_y_offset,rcw_lower_suspension_cube_z_offset]) {
                cube([rcw_lower_suspension_cube_length, rcw_lower_suspension_cube_width, rcw_lower_suspension_cube_height], true);
            }
            translate([rcw_lower_suspension_cylinder_x_offset,rcw_lower_suspension_cylinder_y_offset,rcw_lower_suspension_cylinder_z_offset]) {
                rotate([0,90,0]) {   
                    cylinder(rcw_lower_suspension_cylinder_height, rcw_lower_suspension_cylinder_radius, rcw_lower_suspension_cylinder_radius, true, $fn=rcw_fn_val);
                }
            } 
            translate([rcw_suspension_link_x_offset, rcw_suspension_link_y_offset, rcw_suspension_link_z_offset]) {
                rotate([0,0,-90]) {
                    difference() {
                        _rounded_trapezoid(rcw_outer_suspension_link_front_width, rcw_outer_suspension_link_back_width, rcw_outer_suspension_link_length, rcw_outer_suspension_link_height);
                       translate([ -rcw_outer_suspension_link_length/2.0 + rcw_inner_suspension_link_length/2.0-2,0,0]) {
                        _rounded_trapezoid(rcw_inner_suspension_link_front_width, rcw_inner_suspension_link_back_width, rcw_inner_suspension_link_length, rcw_inner_suspension_link_height);    
                       }
                    }
                    if(right_ball_head) {
                        translate([-rcw_outer_suspension_link_length/2.0+_ball_head_length/2.0,-rcw_outer_suspension_link_back_width/2.0+_ball_head_width/2.0+1,rcw_outer_suspension_link_height/2.0+_ball_head_height/2.0]) {
                            _ball_head();
                        }                    
                    } else {
                        translate([-rcw_outer_suspension_link_length/2.0+_ball_head_length/2.0,+rcw_outer_suspension_link_back_width/2.0-_ball_head_width/2.0-1,rcw_outer_suspension_link_height/2.0+_ball_head_height/2.0]) {
                            _ball_head();
                        }
                    }
                }
            } 
            
        }
        translate([rcw_drive_x_offset, rcw_drive_y_offset, rcw_drive_z_offset]) {
            rotate([90,0,0]) {
                translate([0,0,-rcw_drive_outer_height/2.0+rcw_drive_inner_height/2.0]) {
                    cylinder(rcw_drive_inner_height, rcw_drive_inner_radius, rcw_drive_inner_radius, true, $fn=rcw_fn_val);
                }
           
            }                
        }
    }
        
}