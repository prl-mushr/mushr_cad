include <../misc/racecar_global_utils.scad>

rcg_base_length = 32.38;
rcg_base_width = 30.5;
rcg_base_height = 25.75;
rcg_base_x_offset = 0.0;
rcg_base_y_offset = 0.0;
rcg_base_z_offset = rcg_base_height/2.0;

rcg_box_radius = 42.0/2.0;
rcg_box_height = 24.5;
rcg_box_x_offset = rcg_base_x_offset;
rcg_box_y_offset = rcg_base_y_offset;
rcg_box_z_offset = rcg_base_z_offset - rcg_base_height/2.0 + rcg_box_radius + 2.0;

rcg_column_height = rcg_base_height;
rcg_column_radius = 6.37/2.0;
rcg_column_front_x_offset = rcg_base_x_offset + rcg_base_length/2.0 - rcg_column_radius;
rcg_column_back_x_offset = rcg_base_x_offset - rcg_base_length/2.0 + rcg_column_radius;
rcg_column_left_y_offset = rcg_base_y_offset + rcg_base_width/2.0;
rcg_column_right_y_offset = rcg_base_y_offset - rcg_base_width/2.0;
rcg_column_z_offset = rcg_base_z_offset;

rcg_front_connect_height = 10;
rcg_front_connect_back_radius = 22/2.0;
rcg_front_connect_front_radius = 16.0/2.0;
rcg_front_connect_x_offset = rcg_box_x_offset + rcg_box_radius+2.0;
rcg_front_connect_y_offset = rcg_box_y_offset;
rcg_front_connect_z_offset = rcg_box_z_offset;

rcg_wheel_slot_outer_radius = 11.17/2.0;
rcg_wheel_slot_inner_radius = 6.51/2.0;
rcg_wheel_slot_cutout_height = 3.0;
rcg_wheel_slot_cutout_width = 8.5;
rcg_wheel_slot_height = 13.0;
rcg_wheel_slot_x_offset = rcg_base_x_offset;
rcg_wheel_slot_left_y_offset = rcg_base_y_offset + rcg_base_width/2.0 + rcg_wheel_slot_height/2.0;
rcg_wheel_slot_right_y_offset = rcg_base_y_offset - rcg_base_width/2.0 - rcg_wheel_slot_height/2.0;    
rcg_wheel_slot_z_offset = rcg_base_z_offset+2.0;

rcg_upper_suspension_radius = 10.0/2.0;
rcg_upper_suspension_height = 8.55;
rcg_upper_suspension_x_offset = rcg_base_x_offset + rcg_upper_suspension_height/2.0;
rcg_upper_suspension_left_y_offset = rcg_column_left_y_offset + rcg_column_radius/2.0;
rcg_upper_suspension_right_y_offset = rcg_column_right_y_offset - rcg_column_radius/2.0;
rcg_upper_suspension_z_offset = rcg_base_z_offset + rcg_base_height/2.0 + 10.0;

rcg_spring_support_length = 9.25;
rcg_spring_support_back_width = 25;
rcg_spring_support_front_width = rcg_upper_suspension_left_y_offset - rcg_upper_suspension_right_y_offset;
rcg_spring_support_height = 11.59;
rcg_spring_support_radius = 7.5/2.0;
rcg_spring_support_x_offset = rcg_upper_suspension_x_offset - rcg_upper_suspension_height/2.0 + 3.5 - rcg_spring_support_height/2;
rcg_spring_support_y_offset = rcg_box_y_offset;
rcg_spring_support_z_offset = rcg_upper_suspension_z_offset + rcg_upper_suspension_radius + rcg_spring_support_length/2.0;

rcg_spring_support_cutout_length = 7.7;
rcg_spring_support_cutout_back_width = 16.5;
rcg_spring_support_cutout_front_width = 8.0;
rcg_spring_support_cutout_height = rcg_spring_support_height - 3.0;
rcg_spring_support_cutout_x_offset = rcg_spring_support_x_offset + rcg_spring_support_height/2.0 - rcg_spring_support_cutout_height/2.0;
rcg_spring_support_cutout_y_offset = rcg_spring_support_y_offset;
rcg_spring_support_cutout_z_offset = rcg_spring_support_z_offset + rcg_spring_support_length/2.0 - rcg_spring_support_cutout_length/2.0 + rcg_spring_support_radius;

rcgsa_length = 24.67;
rcgsa_width = 11.9;
rcgsa_height = 4.85;

rcgsp_base_length = 10.0;
rcgsp_base_width = rcg_spring_support_back_width;
rcgsp_base_height = rcg_spring_support_height-rcg_spring_support_cutout_height;
rcgsp_base_x_offset = 0.0;
rcgsp_base_y_offset = 0.0;
rcgsp_base_z_offset = 0.0;    

rcgsp_lower_trap_length = 6.0;
rcgsp_lower_trap_back_width = 59.5;
rcgsp_lower_trap_front_width = rcgsp_base_width;
rcgsp_lower_trap_height = rcgsp_base_height;
rcgsp_lower_trap_x_offset = rcgsp_base_x_offset+rcgsp_base_length/2.0+rcgsp_lower_trap_length/2.0;
rcgsp_lower_trap_y_offset = rcgsp_base_y_offset;
rcgsp_lower_trap_z_offset = rcgsp_base_z_offset;

rcgsp_upper_trap_length = 11.0;
rcgsp_upper_trap_back_width = rcgsp_lower_trap_back_width;
rcgsp_upper_trap_front_width = 38.0;
rcgsp_upper_trap_height = rcgsp_lower_trap_height;
rcgsp_upper_trap_x_offset = rcgsp_lower_trap_x_offset + rcgsp_lower_trap_length/2.0 + rcgsp_upper_trap_length/2.0;
rcgsp_upper_trap_y_offset = rcgsp_lower_trap_y_offset;
rcgsp_upper_trap_z_offset = rcgsp_lower_trap_z_offset;

rcgsp_upper_cutout_trap_length = 10.0;
rcgsp_upper_cutout_trap_back_width = 32.0;
rcgsp_upper_cutout_trap_front_width = 16.0;
rcgsp_upper_cutout_trap_height = rcgsp_upper_trap_height;
rcgsp_upper_cutout_trap_x_offset = rcgsp_upper_trap_x_offset+rcgsp_upper_trap_length/2.0-rcgsp_upper_cutout_trap_length/2.0;
rcgsp_upper_cutout_trap_y_offset = rcgsp_upper_trap_y_offset;
rcgsp_upper_cutout_trap_z_offset = rcgsp_upper_trap_z_offset;

if ($include_rcg==undef) {
    RacecarChassisGearbox();
    //RacecarChassisGearboxMotorCover();
    RacecarChassisFrontSteering();
}

module RacecarChassisGearbox() {
    
    translate([rcg_base_x_offset, rcg_base_y_offset, rcg_base_z_offset]) {
        cube([rcg_base_length, rcg_base_width, rcg_base_height], true, $fn=_fn_val);
    }
    translate([rcg_box_x_offset, rcg_box_y_offset, rcg_box_z_offset]) {
        rotate([90,0,0]) {
            cylinder(rcg_box_height, rcg_box_radius, rcg_box_radius, true, $fn=_fn_val);
        }
    }
    translate([rcg_column_front_x_offset, rcg_column_left_y_offset, rcg_column_z_offset]) {
        cylinder(rcg_column_height, rcg_column_radius, rcg_column_radius, true, $fn=_fn_val);
    }
    translate([rcg_column_front_x_offset, rcg_column_right_y_offset, rcg_column_z_offset]) {
        cylinder(rcg_column_height, rcg_column_radius, rcg_column_radius, true, $fn=_fn_val);
    }    
    translate([rcg_column_back_x_offset, rcg_column_left_y_offset, rcg_column_z_offset]) {
        cylinder(rcg_column_height, rcg_column_radius, rcg_column_radius, true, $fn=_fn_val);
    }
    translate([rcg_column_back_x_offset, rcg_column_right_y_offset, rcg_column_z_offset]) {
        cylinder(rcg_column_height, rcg_column_radius, rcg_column_radius, true, $fn=_fn_val);
    }  
    translate([rcg_front_connect_x_offset, rcg_front_connect_y_offset, rcg_front_connect_z_offset]) {
        rotate([0,90,0]) {
            cylinder(rcg_front_connect_height, rcg_front_connect_back_radius, rcg_front_connect_front_radius, true, $fn=_fn_val);
        }
    }
    
    translate([rcg_wheel_slot_x_offset, rcg_wheel_slot_left_y_offset, rcg_wheel_slot_z_offset]) {
        difference() {
            rotate([90,0,0]) {
                cylinder(rcg_wheel_slot_height, rcg_wheel_slot_outer_radius, rcg_wheel_slot_outer_radius, true, $fn=_fn_val);
            }
            rotate([90,0,0]) {
                cylinder(rcg_wheel_slot_height, rcg_wheel_slot_inner_radius, rcg_wheel_slot_inner_radius, true, $fn=_fn_val);
            }  
            rotate([0,45,0]) {
                translate([0.0, rcg_wheel_slot_height/2.0 - rcg_wheel_slot_cutout_width/2.0, 0.0]) {
                    cube([2*rcg_wheel_slot_outer_radius, rcg_wheel_slot_cutout_width, rcg_wheel_slot_cutout_height], true);
                }
            }
        }
    }
    
    translate([rcg_wheel_slot_x_offset, rcg_wheel_slot_right_y_offset, rcg_wheel_slot_z_offset]) {
        difference() {
            rotate([90,0,0]) {
                cylinder(rcg_wheel_slot_height, rcg_wheel_slot_outer_radius, rcg_wheel_slot_outer_radius, true, $fn=_fn_val);
            }
            rotate([90,0,0]) {
                cylinder(rcg_wheel_slot_height, rcg_wheel_slot_inner_radius, rcg_wheel_slot_inner_radius, true, $fn=_fn_val);
            }  
            rotate([0,45,0]) {
                translate([0.0, -rcg_wheel_slot_height/2.0 + rcg_wheel_slot_cutout_width/2.0, 0.0]) {
                    cube([2*rcg_wheel_slot_outer_radius, rcg_wheel_slot_cutout_width, rcg_wheel_slot_cutout_height], true);
                }
            }
        }
    } 
 
    translate([rcg_upper_suspension_x_offset, rcg_upper_suspension_left_y_offset, rcg_upper_suspension_z_offset]) {
        rotate([0,90,0]) {
            cylinder(rcg_upper_suspension_height, rcg_upper_suspension_radius, rcg_upper_suspension_radius, true, $fn=_fn_val);
        }
    }   
    translate([rcg_upper_suspension_x_offset, rcg_upper_suspension_right_y_offset, rcg_upper_suspension_z_offset]) {
        rotate([0,90,0]) {
            cylinder(rcg_upper_suspension_height, rcg_upper_suspension_radius, rcg_upper_suspension_radius, true, $fn=_fn_val);
        }
    } 
    translate([rcg_upper_suspension_x_offset, 0.0, rcg_upper_suspension_z_offset]) {
        cube([rcg_upper_suspension_height,rcg_upper_suspension_left_y_offset-rcg_upper_suspension_right_y_offset,2*rcg_upper_suspension_radius], true);
        
    }   
    
    difference() {
        translate([rcg_spring_support_x_offset, rcg_spring_support_y_offset, rcg_spring_support_z_offset]) {
            rotate([0,-90,0]) {
                _rounded_trapezoid(rcg_spring_support_back_width, rcg_spring_support_front_width, rcg_spring_support_length, rcg_spring_support_height);
                translate([rcg_spring_support_length/2.0, rcg_spring_support_back_width/2.0, 0.0]) {
                    cylinder(rcg_spring_support_height, rcg_spring_support_radius, rcg_spring_support_radius, true, $fn=_fn_val);
                }
                translate([rcg_spring_support_length/2.0, -rcg_spring_support_back_width/2.0, 0.0]) {
                    cylinder(rcg_spring_support_height, rcg_spring_support_radius, rcg_spring_support_radius, true, $fn=_fn_val);
                }            
            }
        }
        translate([rcg_spring_support_cutout_x_offset, rcg_spring_support_cutout_y_offset, rcg_spring_support_cutout_z_offset]) {
            rotate([0,-90,0]) {
                _rounded_trapezoid(rcg_spring_support_cutout_back_width, rcg_spring_support_cutout_front_width, rcg_spring_support_cutout_length, rcg_spring_support_cutout_height);
            }
        }
    }
    
    //RacecarChassisGearboxSpringPlate();
       
}

module RacecarChassisGearboxSpringPlate() {

    rcgsp_lower_cutout_trap_length = 8.0;
    rcgsp_lower_cutout_trap_back_width = 15.0;
    rcgsp_lower_cutout_trap_front_width = 10.0;
    rcgsp_lower_cutout_trap_height = rcgsp_upper_trap_height;
    rcgsp_lower_cutout_trap_x_offset = rcgsp_upper_cutout_trap_x_offset-rcgsp_upper_cutout_trap_length/2.0-rcgsp_lower_cutout_trap_length/2.0 - 3.5;
    rcgsp_lower_cutout_trap_y_offset = rcgsp_upper_trap_y_offset;
    rcgsp_lower_cutout_trap_z_offset = rcgsp_upper_trap_z_offset;    
    
    translate([rcg_spring_support_x_offset-rcg_spring_support_height/2.0+rcgsp_base_height/2.0, rcg_spring_support_y_offset, rcg_spring_support_z_offset+rcg_spring_support_length/2.0]) {
    
        rotate([0,-90,0]) {
            translate([rcgsp_base_length/2.0, 0.0, 0.0]) {
                minkowski() {
                    difference() {
                        union() {
                            translate([rcgsp_base_x_offset,rcgsp_base_y_offset,rcgsp_base_z_offset]) {
                                cube([rcgsp_base_length,rcgsp_base_width,rcgsp_base_height], true, $fn=_fn_val);
                            }
                            translate([rcgsp_lower_trap_x_offset,rcgsp_lower_trap_y_offset,rcgsp_lower_trap_z_offset]) {
                                rotate([0,180,0]) {
                                    _trapezoid(rcgsp_lower_trap_front_width, rcgsp_lower_trap_back_width, rcgsp_lower_trap_length, rcgsp_lower_trap_height);
                                }
                            }
                            translate([rcgsp_upper_trap_x_offset,rcgsp_upper_trap_y_offset,rcgsp_upper_trap_z_offset]) {
                  
                                    _trapezoid(rcgsp_upper_trap_front_width, rcgsp_upper_trap_back_width, rcgsp_upper_trap_length, rcgsp_upper_trap_height);
                                }
                                
                        }
                        translate([rcgsp_upper_cutout_trap_x_offset, rcgsp_upper_cutout_trap_y_offset, rcgsp_upper_cutout_trap_z_offset]) {
                            rotate([0,180,0]) {
                                scale([1.0,1.0,1.0001]) {
                                    _rounded_trapezoid(rcgsp_upper_cutout_trap_front_width, rcgsp_upper_cutout_trap_back_width, rcgsp_upper_cutout_trap_length, rcgsp_upper_cutout_trap_height);
                                }
                            }
                        }
                        translate([rcgsp_lower_cutout_trap_x_offset, rcgsp_lower_cutout_trap_y_offset, rcgsp_lower_cutout_trap_z_offset]) {
                            rotate([0,180,0]) {
                                scale([1.0,1.0,1.0001]) {
                                    _rounded_trapezoid(rcgsp_lower_cutout_trap_front_width, rcgsp_lower_cutout_trap_back_width, rcgsp_lower_cutout_trap_length, rcgsp_lower_cutout_trap_height);
                                }
                            }
                        }                        
                    }
                    translate([0,0,0]) {
                     
                            cylinder(0.001, 2.0, 2.0, true, $fn=_fn_val);
                        
                    }                    
                }
            }
        }
    }    
}

module RacecarChassisGearboxMotorCover() {
    rcgmc_gearbox_overlap_length = 16.0;
    rcgmc_gearbox_overlap_back_width = 43.5;
    rcgmc_gearbox_overlap_front_width = 34.3;
    rcgmc_gearbox_overlap_height = 30;
    rcgmc_gearbox_overlap_x_offset = rcg_column_front_x_offset+rcgmc_gearbox_overlap_length/2.0;
    rcgmc_gearbox_overlap_y_offset = rcg_box_y_offset;
    rcgmc_gearbox_overlap_z_offset = rcg_column_z_offset + rcg_column_height/2.0 + 5.32 - rcgmc_gearbox_overlap_height/2.0;
    
    rcgmc_suspension_length = 18.0;
    rcgmc_suspension_back_width = 58.3;
    rcgmc_suspension_front_width = 42.5;
    rcgmc_suspension_height = 5.0;
    rcgmc_suspension_x_offset = rcgmc_gearbox_overlap_x_offset - rcgmc_gearbox_overlap_length/2.0 + rcgmc_suspension_length/2.0 + 3.5;
    rcgmc_suspension_y_offset = rcgmc_gearbox_overlap_y_offset;
    rcgmc_suspension_z_offset = rcgmc_gearbox_overlap_z_offset + rcgmc_gearbox_overlap_height/2.0 - rcgmc_suspension_height/2.0 - 16.0;
    
    rcgmc_supension_ball_x_offset = rcgmc_suspension_x_offset - rcgmc_suspension_length/2.0 + _ball_head_length/2.0;
    rcgmc_suspension_ball_left_y_offset = rcgmc_suspension_y_offset + rcgmc_suspension_back_width/2.0 - _ball_head_width/2.0-1.5;
    rcgmc_suspension_ball_right_y_offset = rcgmc_suspension_y_offset - rcgmc_suspension_back_width/2.0 + _ball_head_width/2.0+1.5;
    rcgmc_suspension_ball_z_offset = rcgmc_suspension_z_offset + rcgmc_suspension_height/2.0 + _ball_head_height/2.0;
    
    rcgmc_cover_trap_insert_length = 1.0;
    rcgmc_cover_trap_length = 8.0+rcgmc_cover_trap_insert_length;
    rcgmc_cover_trap_back_width = 2*45.5;
    rcgmc_cover_trap_front_width = rcgmc_gearbox_overlap_front_width + 3.0;
    rcgmc_cover_trap_height = rcgmc_gearbox_overlap_height;
    rcgmc_cover_trap_x_offset = rcgmc_gearbox_overlap_x_offset + rcgmc_gearbox_overlap_length/2.0 + rcgmc_cover_trap_length/2.0 - rcgmc_cover_trap_insert_length;
    rcgmc_cover_trap_y_offset = rcgmc_gearbox_overlap_y_offset;
    rcgmc_cover_trap_z_offset = rcgmc_gearbox_overlap_z_offset;
    
    rcgmc_cover_base_insert_length = 0.0;
    rcgmc_cover_base_length = 13.3+rcgmc_cover_base_insert_length;
    rcgmc_cover_base_width = rcgmc_cover_trap_back_width+2.0;
    rcgmc_cover_base_height = rcgmc_cover_trap_height;
    rcgmc_cover_base_x_offset = rcgmc_cover_trap_x_offset + rcgmc_cover_trap_length/2.0 + rcgmc_cover_base_length/2.0 - rcgmc_cover_base_insert_length;
    rcgmc_cover_base_y_offset = rcgmc_cover_trap_y_offset;
    rcgmc_cover_base_z_offset = rcgmc_cover_trap_z_offset;
    
    rcgmc_cover_cylinder_radius = 50.0/2.0;
    rcgmc_cover_cylinder_height = 9.6;
    rcgmc_cover_cylinder_x_offset = rcgmc_cover_base_x_offset;
    rcgmc_cover_cylinder_y_offset = rcgmc_cover_base_y_offset;
    rcgmc_cover_cylinder_z_offset = rcgmc_cover_base_z_offset + rcgmc_cover_base_height/2.0- rcgmc_cover_cylinder_radius+14.5;
    
    rcgmc_motor_mount_length = 8.0;
    rcgmc_motor_mount_width = rcgmc_cover_base_width;
    rcgmc_motor_mount_height = 24.0;
    rcgmc_motor_mount_x_offset = rcgmc_cover_base_x_offset + rcgmc_cover_base_length/2.0 + rcgmc_motor_mount_length/2.0;
    rcgmc_motor_mount_y_offset = rcgmc_cover_base_y_offset;
    rcgmc_motor_mount_z_offset = rcgmc_cover_base_z_offset - rcgmc_cover_base_height/2.0 + rcgmc_motor_mount_height/2.0;
    
    rcgmc_motor_top_height = rcgmc_motor_mount_length;
    rcgmc_motor_top_y_scale = rcgmc_motor_mount_width/2.0;
    rcgmc_motor_top_z_scale = rcgmc_cover_base_height - rcgmc_motor_mount_height;
    rcgmc_motor_top_x_offset = rcgmc_motor_mount_x_offset;
    rcgmc_motor_top_y_offset = rcgmc_motor_mount_y_offset;
    rcgmc_motor_top_z_offset = rcgmc_motor_mount_z_offset + rcgmc_motor_mount_height/2.0;
    
    rcgmc_motor_radius = 36.0/2.0;
    rcgmc_motor_height = 50.0;
    rcgmc_motor_x_offset = rcgmc_motor_mount_x_offset + rcgmc_motor_mount_length/2.0 + rcgmc_motor_height/2.0;
    rcgmc_motor_y_offset = rcgmc_motor_mount_y_offset - rcgmc_motor_mount_width/4.0;
    rcgmc_motor_z_offset = rcgmc_motor_mount_z_offset+5.0;
    
    translate([rcgmc_gearbox_overlap_x_offset, rcgmc_gearbox_overlap_y_offset, rcgmc_gearbox_overlap_z_offset]) {
        _rounded_trapezoid(rcgmc_gearbox_overlap_front_width, rcgmc_gearbox_overlap_back_width, rcgmc_gearbox_overlap_length, rcgmc_gearbox_overlap_height);
    }
    
    translate([rcgmc_suspension_x_offset, rcgmc_suspension_y_offset, rcgmc_suspension_z_offset]) {
        _rounded_trapezoid(rcgmc_suspension_front_width, rcgmc_suspension_back_width, rcgmc_suspension_length, rcgmc_suspension_height);
    }

    
    translate([rcgmc_supension_ball_x_offset,rcgmc_suspension_ball_left_y_offset, rcgmc_suspension_ball_z_offset]) {
        _ball_head();
    }
    translate([rcgmc_supension_ball_x_offset,rcgmc_suspension_ball_right_y_offset, rcgmc_suspension_ball_z_offset]) {
        _ball_head();
    }    
    
    
    translate([rcgmc_cover_trap_x_offset, rcgmc_cover_trap_y_offset, rcgmc_cover_trap_z_offset]) {
        rotate([0,0,180]) {
            _rounded_trapezoid(rcgmc_cover_trap_front_width, rcgmc_cover_trap_back_width, rcgmc_cover_trap_length, rcgmc_cover_trap_height);
        }
    }
    
    translate([rcgmc_cover_base_x_offset, rcgmc_cover_base_y_offset, rcgmc_cover_base_z_offset]) {
        cube([rcgmc_cover_base_length, rcgmc_cover_base_width, rcgmc_cover_base_height], true);
    }
    
    difference() {
        translate([rcgmc_cover_cylinder_x_offset, rcgmc_cover_cylinder_y_offset, rcgmc_cover_cylinder_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rcgmc_cover_cylinder_height, rcgmc_cover_cylinder_radius, rcgmc_cover_cylinder_radius, true, $fn=_fn_val);
            }
        }
        translate([rcgmc_cover_cylinder_x_offset, rcgmc_cover_cylinder_y_offset, rcgmc_cover_cylinder_z_offset-rcgmc_cover_cylinder_radius]) {
            cube([rcgmc_cover_cylinder_height, 2*rcgmc_cover_cylinder_radius, rcgmc_cover_cylinder_radius], true);
        }           
    }
    
    translate([rcgmc_motor_mount_x_offset,rcgmc_motor_mount_y_offset,rcgmc_motor_mount_z_offset]) {
        cube([rcgmc_motor_mount_length, rcgmc_motor_mount_width, rcgmc_motor_mount_height], true);
    }
    translate([rcgmc_motor_top_x_offset,rcgmc_motor_top_y_offset,rcgmc_motor_top_z_offset]) {
        scale([1.0,rcgmc_motor_top_y_scale, rcgmc_motor_top_z_scale]) {
            rotate([0,90,0]) {
                cylinder(rcgmc_motor_top_height, 1.0, 1.0, true, $fn=_fn_val);
            }
        }
    }
    
    translate([rcgmc_motor_x_offset, rcgmc_motor_y_offset, rcgmc_motor_z_offset]) {
        rotate([0,90,0]) {
            cylinder(rcgmc_motor_height, rcgmc_motor_radius, rcgmc_motor_radius, true, $fn=_fn_val);
        }
    }
    
}

module RacecarChassisFrontSteering() {
    rcfc_trap_length = 15.0;
    rcfc_trap_front_width = 23.0;
    rcfc_trap_back_width = 51.0;
    rcfc_trap_height = 11.22;
    rcfc_trap_x_offset = rcg_box_x_offset + rcg_box_radius + rcfc_trap_length/2.0;
    rcfc_trap_y_offset = rcg_box_y_offset;
    rcfc_trap_z_offset = rcg_box_z_offset + rcfc_trap_height/2.00;
    
    rcfc_base_length = 11.24;
    rcfc_base_width = 57.65;
    rcfc_base_height = rcfc_trap_height;
    rcfc_base_x_offset = rcfc_trap_x_offset + rcfc_trap_length/2.0 + rcfc_base_length/2.0;
    rcfc_base_y_offset = rcfc_trap_y_offset;
    rcfc_base_z_offset = rcfc_trap_z_offset;
    
    rcfc_column_height = (rcfc_base_z_offset+rcfc_base_height/2.0) - (rcg_base_z_offset - rcg_base_height/2.0);
    rcfc_column_radius = rcfc_base_length/2.0;
    rcfc_column_x_offset = rcfc_base_x_offset;
    rcfc_column_left_y_offset = rcfc_base_y_offset + rcfc_base_width/2.0;
    rcfc_column_right_y_offset = rcfc_base_y_offset - rcfc_base_width/2.0;
    rcfc_column_z_offset = rcfc_base_z_offset + rcfc_base_height/2.0 - rcfc_column_height/2.0;
    
    rcfc_suspension_arm_x_offset = rcfc_column_x_offset - rcgsa_length/2.0;
    rcfc_suspension_arm_left_y_offset = rcfc_column_left_y_offset;
    rcfc_suspension_arm_right_y_offset = rcfc_column_right_y_offset;
    rcfc_suspension_arm_z_offset = rcfc_column_z_offset+rcfc_column_height/2.0-20.0;
    
    translate([rcfc_trap_x_offset, rcfc_trap_y_offset, rcfc_trap_z_offset]) {
        rotate([0,0,180]) {
            _rounded_trapezoid(rcfc_trap_front_width, rcfc_trap_back_width, rcfc_trap_length, rcfc_trap_height);
        }
    }
    translate([rcfc_base_x_offset, rcfc_base_y_offset, rcfc_base_z_offset]) {
        cube([rcfc_base_length, rcfc_base_width, rcfc_base_height], true);
    }
    
    translate([rcfc_column_x_offset, rcfc_column_left_y_offset, rcfc_column_z_offset]) {
        cylinder(rcfc_column_height, rcfc_column_radius, rcfc_column_radius, true, $fn=_fn_val);
    }
    translate([rcfc_column_x_offset, rcfc_column_right_y_offset, rcfc_column_z_offset]) {
        cylinder(rcfc_column_height, rcfc_column_radius, rcfc_column_radius, true, $fn=_fn_val);
    }    
    translate([rcfc_suspension_arm_x_offset, rcfc_suspension_arm_left_y_offset, rcfc_suspension_arm_z_offset]) {
        rotate([0,0,180]) {
            RacecarChassisGearboxSuspensionArm();
        }
    }
    translate([rcfc_suspension_arm_x_offset, rcfc_suspension_arm_right_y_offset, rcfc_suspension_arm_z_offset]) {
        rotate([0,0,180]) {
            RacecarChassisGearboxSuspensionArm();
        }
    } 
    translate([rcfc_suspension_arm_x_offset+rcgsa_length/2.0, rcfc_suspension_arm_left_y_offset+rcgsa_length/2.0, rcfc_suspension_arm_z_offset]) {
        rotate([0,0,90]) {
            RacecarChassisGearboxSuspensionArm();
        }
    }    
}

module RacecarChassisGearboxSuspensionArm() {
    rcgsa_base_height = rcgsa_height;
    rcgsa_base_radius = rcgsa_width/2.0;
    rcgsa_base_x_offset = rcgsa_base_radius - rcgsa_length/2.0;
    rcgsa_base_y_offset = 0.0;
    rcgsa_base_z_offset = 0.0;
    
    rcgsa_end_height = rcgsa_height;
    rcgsa_end_radius = 8.2/2.0;
    rcgsa_end_x_offset = -rcgsa_end_radius + rcgsa_length/2.0;
    rcgsa_end_y_offset = rcgsa_base_y_offset;
    rcgsa_end_z_offset = rcgsa_base_z_offset;
    
    rcgsa_link_length = rcgsa_end_x_offset - rcgsa_base_x_offset;
    rcgsa_link_back_width = 2*rcgsa_base_radius;
    rcgsa_link_front_width = 2*rcgsa_end_radius;
    rcgsa_link_height = rcgsa_end_height;
    rcgsa_link_x_offset = rcgsa_end_x_offset - rcgsa_link_length/2.0;
    rcgsa_link_y_offset = rcgsa_end_y_offset;
    rcgsa_link_z_offset = rcgsa_end_z_offset;
    
    rcgsa_ball_head_x_offset = rcgsa_end_x_offset;
    rcgsa_ball_head_y_offset = rcgsa_end_y_offset;
    rcgsa_ball_head_z_offset = rcgsa_end_z_offset + rcgsa_end_height/2.0+_ball_head_height/2.0;
    
    translate([rcgsa_base_x_offset,rcgsa_base_y_offset,rcgsa_base_z_offset]) {
        cylinder(rcgsa_base_height, rcgsa_base_radius, rcgsa_base_radius, true, $fn=_fn_val);
    }
    
    translate([rcgsa_link_x_offset, rcgsa_link_y_offset, rcgsa_link_z_offset]) {
        _trapezoid(rcgsa_link_front_width,rcgsa_link_back_width,rcgsa_link_length,rcgsa_link_height);
    }
    
    translate([rcgsa_end_x_offset,rcgsa_end_y_offset,rcgsa_end_z_offset]) {
        cylinder(rcgsa_end_height, rcgsa_end_radius, rcgsa_end_radius, true, $fn=_fn_val);
    }
    
    translate([rcgsa_ball_head_x_offset, rcgsa_ball_head_y_offset, rcgsa_ball_head_z_offset]) {
        _ball_head();
    }
    
}
