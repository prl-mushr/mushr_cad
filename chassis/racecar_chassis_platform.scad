include <../misc/racecar_global_utils.scad>

rcp_length = 374.0;
rcp_width = 127.0;
rcp_height = 2.54;

rcp_back_length = 86.0;
rcp_back_width = 53.18;
rcp_back_height = rcp_height;
rcp_back_x_offset = -rcp_length/2.0+rcp_back_length/2.0;
rcp_back_y_offset = 0.0;
rcp_back_z_offset = 0.0;

rcp_middle_length = 329.0 - rcp_back_length;
rcp_middle_width = rcp_width;
rcp_middle_height = rcp_height;
rcp_middle_x_offset = rcp_back_x_offset + rcp_back_length/2.0 + rcp_middle_length/2.0;
rcp_middle_y_offset = 0.0;
rcp_middle_z_offset = 0.0;

rcp_front_length = rcp_length - (rcp_middle_length+rcp_back_length);
rcp_front_width = 52.54;
rcp_front_height = rcp_height;
rcp_front_x_offset = rcp_middle_x_offset + rcp_middle_length/2.0 + rcp_front_length/2.0;
rcp_front_y_offset = 0.0;
rcp_front_z_offset = 0.0;

rcp_back_bumper_hole_back_x_offset = -rcp_length/2.0 + 5.2;
rcp_back_bumper_hole_front_x_offset = -rcp_length/2.0 + 8.1;
rcp_back_bumper_hole_left_y_offset = 42.0/2.0;
rcp_back_bumper_hole_right_y_offset = -42.0/2.0;
rcp_back_bumper_hole_z_offset = 0.0;

rcp_back_suspension_hole_back_x_offset = -rcp_length/2.0+25.5;
rcp_back_suspension_hole_front_x_offset = -rcp_length/2.0+ 52.0;
rcp_back_suspension_hole_left_y_offset = 32.5/2.0;
rcp_back_suspension_hole_right_y_offset = -32.5/2.0;
rcp_back_suspension_hole_z_offset = 0.0;

rcp_motor_cover_hole_x_offset = -rcp_length/2.0+ 66.0;
rcp_motor_cover_hole_left_y_offset = 44.0/2.0;
rcp_motor_cover_hole_right_y_offset = -44.0/2.0;
rcp_motor_cover_hole_z_offset = 0.0;

rcp_motor_mount_hole_back_x_offset = -rcp_length/2.0 + 93.0;
rcp_motor_mount_hole_front_x_offset = -rcp_length/2.0 + 100.0;
rcp_motor_mount_hole_left_y_offset = -8.0 + 72.5/2.0;
rcp_motor_mount_hole_middle_y_offset = -8.0;
rcp_motor_mount_hole_right_y_offset = -8.0 - 72.5/2.0;
rcp_motor_mount_hole_z_offset = 0.0;

rcp_crossbar_hole_front_x_offset = -rcp_length/2.0 + 200.5;
rcp_crossbar_hole_back_x_offset = -rcp_length/2.0 + 184.5;
rcp_crossbar_hole_y_offset = -8.2;
rcp_crossbar_hole_z_offset = 0.0;

rcp_servo_hole_front_x_offset = -rcp_length/2.0+ 271.0;
rcp_servo_hole_back_x_offset = -rcp_length/2.0 + 223.0;
rcp_servo_hole_y_offset = -21.5;
rcp_servo_hole_z_offset = 0.0;

rcp_front_suspension_hole_front_x_offset = rcp_length/2.0 - 27.0;
rcp_front_suspension_hole_back_x_offset = rcp_length/2.0-52.0;
rcp_front_suspension_hole_left_y_offset = 32.0/2.0;
rcp_front_suspension_hole_right_y_offset = -32.0/2.0;
rcp_front_suspension_hole_z_offset = 0.0;

rcp_front_bumper_hole_back_x_offset = rcp_length/2.0 - 8.0;
rcp_front_bumper_hole_front_x_offset = rcp_length/2.0 - 5.0;
rcp_front_bumper_hole_left_y_offset = 43.0/2.0;
rcp_front_bumper_hole_right_y_offset = -43.0/2.0;
rcp_front_bumper_hole_z_offset = 0.0;

rcp_wall_height = 15.33 - rcp_height;

rcp_back_suspension_connector_radius = 5.0;
rcp_back_suspension_connector_height = 47.0;
rcp_back_suspension_connector_x_offset = rcp_back_x_offset - rcp_back_length/2.0 + rcp_back_suspension_connector_height/2.0 + 15.0;
rcp_back_suspension_connector_left_y_offset = rcp_back_y_offset + rcp_back_width/2.0 - 2.0;
rcp_back_suspension_connector_right_y_offset = rcp_back_y_offset - rcp_back_width/2.0 + 2.0;
rcp_back_suspension_connector_z_offset = rcp_height/2.0 + rcp_back_suspension_connector_radius - 1.5;

rcp_front_suspension_connector_radius = rcp_back_suspension_connector_radius;
rcp_front_suspension_connector_height = rcp_back_suspension_connector_height;
rcp_front_suspension_connector_x_offset = rcp_front_x_offset + rcp_front_length/2.0 - rcp_front_suspension_connector_height/2.0 - 13.25;
rcp_front_suspension_connector_left_y_offset = rcp_front_y_offset + rcp_front_width/2.0 - 2.0;
rcp_front_suspension_connector_right_y_offset = rcp_front_y_offset - rcp_front_width/2.0 + 2.0;
rcp_front_suspension_connector_z_offset = rcp_back_suspension_connector_z_offset;

rcp_front_bumper_x_offset = rcp_front_bumper_hole_back_x_offset - _m3_screw_head_radius;
rcp_front_bumper_y_offset = rcp_front_y_offset;
rcp_front_bumper_z_offset = rcp_front_z_offset - rcp_front_height/2.0 + 2;

rcpfb_base_back_bottom_x = 0.0;
rcpfb_base_front_bottom_x = 10.0;
rcpfb_base_back_top_x = rcpfb_base_back_bottom_x;
rcpfb_base_front_top_x = 17.0;
rcpfb_base_left_y = 56.0/2.0;
rcpfb_base_right_y =-56.0/2.0;
rcpfb_base_top_z = 6.25;
rcpfb_base_bottom_z = 0.0;

rcpfb_ramp_back_bottom_x = rcpfb_base_front_top_x - 3.0;
rcpfb_ramp_front_bottom_x = rcpfb_base_front_top_x;
rcpfb_ramp_back_top_x = rcpfb_ramp_back_bottom_x + 10.0;
rcpfb_ramp_front_top_x = rcpfb_ramp_back_top_x + 3.0;
rcpfb_ramp_left_bottom_y = rcpfb_base_left_y;
rcpfb_ramp_right_bottom_y = rcpfb_base_right_y;
rcpfb_ramp_left_top_y = rcpfb_ramp_left_bottom_y+1.0;
rcpfb_ramp_right_top_y = rcpfb_ramp_right_bottom_y-1.0;    
rcpfb_ramp_bottom_z = rcpfb_base_top_z;
rcpfb_ramp_top_z = rcpfb_ramp_bottom_z+ 6.67;

rcpfb_grill_back_bottom_x = rcpfb_ramp_back_top_x;
rcpfb_grill_front_bottom_x = rcpfb_ramp_front_top_x;
rcpfb_grill_back_top_x = rcpfb_grill_back_bottom_x + 9.5;
rcpfb_grill_front_top_x = rcpfb_grill_back_top_x + 3.0;
rcpfb_grill_left_bottom_y = rcpfb_ramp_left_top_y;
rcpfb_grill_right_bottom_y = rcpfb_ramp_right_top_y;
rcpfb_grill_left_top_y = rcpfb_ramp_left_top_y+1.5;
rcpfb_grill_right_top_y = rcpfb_ramp_right_top_y-1.5;
rcpfb_grill_bottom_z = rcpfb_ramp_top_z;
rcpfb_grill_top_z = rcpfb_grill_bottom_z + 22.0;

rcpfb_tri_base = 4.5;
rcpfb_tri_height = 4;
rcpfb_tri_length = 109.5;
rcpfb_tri_x_offset = rcpfb_grill_back_top_x + rcpfb_tri_height/2.0;
rcpfb_tri_y_offset = 0.0;
rcpfb_tri_z_offset = rcpfb_grill_top_z;

if ($include_rcp==undef) {
    RacecarChassisPlatform();

}

module RacecarChassisPlatform() {
    difference() {
        union() {
            RacecarChassisPlatformRounded();
            
            difference() {
                translate([0,0, rcp_height/2.0 + rcp_wall_height/2.0]) {
                    scale([1.0,1.0,rcp_wall_height/rcp_height]) {
                        difference() {
                            RacecarChassisPlatformRounded();
                            scale([0.99,0.95,1.0]) {
                                RacecarChassisPlatformRounded();
                            }
                        }
                        
                    }                   
                }
                translate([rcp_front_x_offset, rcp_front_y_offset, rcp_height/2.0+rcp_wall_height/2.0]) {
                    cube([rcp_front_length, rcp_front_width+0.01, rcp_wall_height], true);
                }
                translate([rcp_back_x_offset, rcp_back_y_offset, rcp_height/2.0+rcp_wall_height/2.0]) {
                    cube([rcp_back_length, rcp_back_width+0.01, rcp_wall_height], true);
                }                 
            }
            translate([rcp_back_suspension_connector_x_offset, rcp_back_suspension_connector_left_y_offset, rcp_back_suspension_connector_z_offset]) {
                rotate([0,90,0]) {
                    cylinder(rcp_back_suspension_connector_height, rcp_back_suspension_connector_radius, rcp_back_suspension_connector_radius, true, $fn=_fn_val);
                }
            }
            translate([rcp_back_suspension_connector_x_offset, rcp_back_suspension_connector_right_y_offset, rcp_back_suspension_connector_z_offset]) {
                rotate([0,90,0]) {
                    cylinder(rcp_back_suspension_connector_height, rcp_back_suspension_connector_radius, rcp_back_suspension_connector_radius, true, $fn=_fn_val);
                }
            }
            translate([rcp_front_suspension_connector_x_offset, rcp_front_suspension_connector_left_y_offset, rcp_front_suspension_connector_z_offset]) {
                rotate([0,90,0]) {
                    cylinder(rcp_front_suspension_connector_height, rcp_front_suspension_connector_radius, rcp_front_suspension_connector_radius, true, $fn=_fn_val);
                }
            }
            translate([rcp_front_suspension_connector_x_offset, rcp_front_suspension_connector_right_y_offset, rcp_front_suspension_connector_z_offset]) {
                rotate([0,90,0]) {
                    cylinder(rcp_front_suspension_connector_height, rcp_front_suspension_connector_radius, rcp_front_suspension_connector_radius, true, $fn=_fn_val);
                }
            }
            translate([rcp_front_bumper_x_offset, rcp_front_bumper_y_offset, rcp_front_bumper_z_offset]) {
                RacecarChassisPlatformFrontBumper();
            }
        }
                
        translate([rcp_back_bumper_hole_back_x_offset, 0.0, rcp_back_bumper_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }
        }
        translate([rcp_back_bumper_hole_front_x_offset, rcp_back_bumper_hole_left_y_offset, rcp_back_bumper_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }
        }
        translate([rcp_back_bumper_hole_front_x_offset, rcp_back_bumper_hole_right_y_offset, rcp_back_bumper_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }
        }

        translate([rcp_back_suspension_hole_front_x_offset, rcp_back_suspension_hole_left_y_offset, rcp_back_suspension_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }
        }
        translate([rcp_back_suspension_hole_front_x_offset, rcp_back_suspension_hole_right_y_offset, rcp_back_suspension_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }
        }
        translate([rcp_back_suspension_hole_back_x_offset, rcp_back_suspension_hole_left_y_offset, rcp_back_suspension_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }
        }
        translate([rcp_back_suspension_hole_back_x_offset, rcp_back_suspension_hole_right_y_offset, rcp_back_suspension_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }
        }

        translate([rcp_motor_cover_hole_x_offset, rcp_motor_cover_hole_left_y_offset, rcp_motor_cover_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }
        }        
        translate([rcp_motor_cover_hole_x_offset, rcp_motor_cover_hole_right_y_offset, rcp_motor_cover_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }
        }        
        
        translate([rcp_motor_mount_hole_front_x_offset, rcp_motor_mount_hole_middle_y_offset, rcp_motor_mount_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }
        }
        translate([rcp_motor_mount_hole_back_x_offset, rcp_motor_mount_hole_left_y_offset, rcp_motor_mount_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }
        } 
        translate([rcp_motor_mount_hole_back_x_offset, rcp_motor_mount_hole_right_y_offset, rcp_motor_mount_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }
        }

        translate([rcp_crossbar_hole_front_x_offset, rcp_crossbar_hole_y_offset, rcp_crossbar_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }
        }        
        translate([rcp_crossbar_hole_back_x_offset, rcp_crossbar_hole_y_offset, rcp_crossbar_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }
        }

        translate([rcp_servo_hole_front_x_offset, rcp_servo_hole_y_offset, rcp_servo_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }
        }        
        translate([rcp_servo_hole_back_x_offset, rcp_servo_hole_y_offset, rcp_servo_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }
        }        
        translate([rcp_front_suspension_hole_front_x_offset, rcp_front_suspension_hole_left_y_offset, rcp_front_suspension_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }
        }
        translate([rcp_front_suspension_hole_front_x_offset, rcp_front_suspension_hole_right_y_offset, rcp_front_suspension_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }
        }
        translate([rcp_front_suspension_hole_back_x_offset, rcp_front_suspension_hole_left_y_offset, rcp_front_suspension_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }
        }
        translate([rcp_front_suspension_hole_back_x_offset, rcp_front_suspension_hole_right_y_offset, rcp_front_suspension_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }
        }

        translate([rcp_front_bumper_hole_front_x_offset, 0.0, rcp_front_bumper_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }            
        }
        translate([rcp_front_bumper_hole_back_x_offset, rcp_front_bumper_hole_left_y_offset, rcp_front_bumper_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }            
        }
        translate([rcp_front_bumper_hole_back_x_offset, rcp_front_bumper_hole_right_y_offset, rcp_front_bumper_hole_z_offset]) {
            rotate([180,0,0]) {
                scale([1.0,1.0,1.001]) {
                    _m3_flathead_screw(rcp_height);
                }
            }            
        }        
    }
}

module RacecarChassisPlatformRounded() {
    
    cutout_length = 2*(rcp_length);
    cutout_width = 2*(rcp_width);
    cutout_height = rcp_height-0.01;

    rounder_height = rcp_height;
    rounder_radius = 2.0;
    
    scale([1.0,1.0,0.5]) {
        minkowski() {
            difference() {
                RacecarChassisPlatformBase();
                minkowski() {
                    difference() {
                        cube([cutout_length, cutout_width, cutout_height], true);
                        RacecarChassisPlatformBase();
                    }
                    cube([2*rounder_radius, 2*rounder_radius, rounder_height], true);
                }
                
            }
            cylinder(rounder_height, rounder_radius, rounder_radius, true, $fn=100);
        }
     
    }    
    
}

module RacecarChassisPlatformBase() {
    translate([rcp_back_x_offset, rcp_back_y_offset, rcp_back_z_offset]) {
        RacecarChassisPlatformBack();
    }
    
    translate([rcp_middle_x_offset, rcp_middle_y_offset, rcp_middle_z_offset]) {
        RacecarChassisPlatformMiddle();
    }
    translate([rcp_front_x_offset, rcp_front_y_offset, rcp_front_z_offset]) {
        RacecarChassisPlatformFront();
    }
}

module RacecarChassisPlatformBack() {
    rcpb_pointed_length = 5.0;
    rcpb_pointed_width = rcp_back_width;
    rcpb_pointed_height = rcp_back_height;
    rcpb_pointed_x_offset = -rcp_back_length/2.0 + rcpb_pointed_length/2.0;
    rcpb_pointed_y_offset = 0.0;
    rcpb_pointed_z_offset = 0.0;
    
    rcpb_base_length = rcp_back_length - rcpb_pointed_length;
    rcpb_base_width = rcp_back_width;
    rcpb_base_height = rcp_back_height;
    rcpb_base_x_offset = rcpb_pointed_x_offset + rcpb_pointed_length/2.0 + rcpb_base_length/2.0;
    rcpb_base_y_offset = 0.0;
    rcpb_base_z_offset = 0.0;
    
    rcpb_rounded_length = 43.18;
    rcpb_rounded_back_width = rcp_middle_width;
    rcpb_rounded_front_width = rcpb_base_width;
    rcpb_rounded_height = rcp_middle_height;
    rcpb_rounded_x_offset = rcpb_base_x_offset + rcpb_base_length/2.0 - rcpb_rounded_length/2.0+0.01;
    rcpb_rounded_y_offset = rcpb_base_y_offset;
    rcpb_rounded_z_offset = rcpb_base_z_offset;
    
    difference() {
        union() {
            translate([rcpb_pointed_x_offset+rcpb_pointed_length/2.0, rcpb_pointed_y_offset, rcpb_pointed_z_offset-rcpb_pointed_height/2.0]) {
                rotate([90,0,180]) {
                    _triangle(rcpb_pointed_length, rcpb_pointed_height, rcpb_pointed_width/2.0);
                }
            }  
            
            translate([rcpb_pointed_x_offset+rcpb_pointed_length/2.0, rcpb_pointed_y_offset, rcpb_pointed_z_offset+rcpb_pointed_height/2.0]) {
                rotate([-90,0,180]) {
                    _triangle(rcpb_pointed_length, rcpb_pointed_height, rcpb_pointed_width/2.0);
                }
            }
            
            translate([rcpb_base_x_offset, rcpb_base_y_offset, rcpb_base_z_offset]) {
                cube([rcpb_base_length, rcpb_base_width, rcpb_base_height], true);
            }
            translate([rcpb_rounded_x_offset, rcpb_rounded_y_offset, rcpb_rounded_z_offset]) {
                rotate([0,0,180]) {
                    _trapezoid(rcpb_rounded_front_width, rcpb_rounded_back_width, rcpb_rounded_length, rcpb_rounded_height);
                }
            }
            /*
            translate([rcpb_rounded_x_offset+0.001, rcpb_rounded_left_y_offset-0.001, rcpb_rounded_z_offset]) {
                rotate([180,0,0]) {
                    _rounded_edge(rcpb_rounded_length, rcpb_rounded_width, rcpb_rounded_height);
                }
            }
            translate([rcpb_rounded_x_offset+0.001, rcpb_rounded_right_y_offset+0.001, rcpb_rounded_z_offset]) {
                rotate([0,0,0]) {
                    _rounded_edge(rcpb_rounded_length, rcpb_rounded_width, rcpb_rounded_height);
                }
            } 
 */           
        }
    }  
}

module RacecarChassisPlatformMiddle() {
    rcpm_back_trap_length = 194.0;
    rcpm_back_trap_width = rcp_middle_width;
    rcpm_back_trap_height = rcp_middle_height;
    rcpm_back_trap_x_offset = -rcp_middle_length/2.0 + rcpm_back_trap_length/2.0;
    rcpm_back_trap_y_offset = 0.0;
    rcpm_back_trap_z_offset = 0.0;
    
    rcpm_front_trap_length = rcp_middle_length - rcpm_back_trap_length;
    rcpm_front_trap_width = 108.62;
    rcpm_front_trap_height = rcp_middle_height;
    rcpm_front_trap_x_offset = rcpm_back_trap_x_offset + rcpm_back_trap_length/2.0 + rcpm_front_trap_length/2.0;
    rcpm_front_trap_y_offset = 0.0;
    rcpm_front_trap_z_offset = 0.0;
    
    difference() {
        union() {

                translate([rcpm_back_trap_x_offset, rcpm_back_trap_y_offset, rcpm_back_trap_z_offset]) {
                    _trapezoid(rcpm_front_trap_width, rcpm_back_trap_width, rcpm_back_trap_length, rcpm_back_trap_height); 
                }
                translate([rcpm_front_trap_x_offset, rcpm_front_trap_y_offset, rcpm_front_trap_z_offset]) {
                    scale([1.001,1.0,1.0]) {
                        _trapezoid(rcp_front_width, rcpm_front_trap_width, rcpm_front_trap_length, rcpm_front_trap_height);
                    }
                }
            
        }
    }
    
}

module RacecarChassisPlatformFront() {
    rcpf_pointed_length = 5.0;
    rcpf_pointed_width = rcp_front_width;
    rcpf_pointed_height = rcp_front_height;
    rcpf_pointed_x_offset = rcp_front_length/2.0 - rcpf_pointed_length/2.0;
    rcpf_pointed_y_offset = 0.0;
    rcpf_pointed_z_offset = 0.0;    
    
    rcpf_base_length = rcp_front_length - rcpf_pointed_length;
    rcpf_base_width = rcp_front_width;
    rcpf_base_height = rcp_front_height;
    rcpf_base_x_offset = rcpf_pointed_x_offset - rcpf_pointed_length/2.0 - rcpf_base_length/2.0;
    rcpf_base_y_offset = 0.0;
    rcpf_base_z_offset = 0.0;    
    
    difference() {
        union() {
            translate([rcpf_pointed_x_offset-rcpf_pointed_length/2.0, rcpf_pointed_y_offset, rcpf_pointed_z_offset-rcpf_pointed_height/2.0]) {
                rotate([90,0,0]) {
                    _triangle(rcpf_pointed_length, rcpf_pointed_height, rcpf_pointed_width/2.0);
                }
            }  
            
            translate([rcpf_pointed_x_offset-rcpf_pointed_length/2.0, rcpf_pointed_y_offset, rcpf_pointed_z_offset+rcpf_pointed_height/2.0]) {
                rotate([-90,0,0]) {
                    _triangle(rcpf_pointed_length, rcpf_pointed_height, rcpf_pointed_width/2.0);
                }
            }
            translate([rcpf_base_x_offset, rcpf_base_y_offset, rcpf_base_z_offset]) {
                cube([rcpf_base_length, rcpf_base_width, rcpf_base_height], true);
            }
            
        }
    }    
}

module RacecarChassisPlatformFrontBumper() {
    
    rcpfb_top_outer_trap_length = 14.25;
    rcpfb_top_outer_trap_front_width = 40.0;
    rcpfb_top_outer_trap_back_width = 55.0;
    rcpfb_top_outer_trap_height = rcpfb_tri_height;
    rcpfb_top_outer_trap_x_offset = rcpfb_tri_x_offset;
    rcpfb_top_outer_trap_y_offset = rcpfb_tri_y_offset;
    rcpfb_top_outer_trap_z_offset = rcpfb_tri_z_offset + rcpfb_top_outer_trap_length/2.0;
    
    rcpfb_top_inner_trap_length = rcpfb_top_outer_trap_length-2.75;
    rcpfb_top_inner_trap_front_width = 35.0;
    rcpfb_top_inner_trap_back_width = 48.5;
    rcpfb_top_inner_trap_height = rcpfb_top_outer_trap_height;
    rcpfb_top_inner_trap_x_offset = rcpfb_top_outer_trap_x_offset;
    rcpfb_top_inner_trap_y_offset = rcpfb_top_outer_trap_y_offset;
    rcpfb_top_inner_trap_z_offset = rcpfb_top_outer_trap_z_offset - rcpfb_top_outer_trap_length/2.0 + rcpfb_top_inner_trap_length/2.0;
    
    rcpfb_dot_x_scale = 3.5;
    rcpfb_dot_y_scale = 5.5;
    rcpfb_dot_z_scale = rcpfb_dot_y_scale;
    rcpfb_dot_x_offset = rcpfb_tri_x_offset - rcpfb_tri_height+2.0;
    rcpfb_dot_left_y_offset = 22.0/2.0;
    rcpfb_dot_right_y_offset = -22.0/2.0;
    rcpfb_dot_z_offset = rcpfb_tri_z_offset + rcpfb_tri_base/2.0 + rcpfb_dot_z_scale;
    
    rcpfb_diamond_length = 14.5;
    rcpfb_diamond_width = 5.0;
    rcpfb_diamond_height = rcpfb_grill_front_top_x-rcpfb_base_back_bottom_x;
    rcpfb_diamond_x_offset = 0.5*(rcpfb_grill_front_top_x+rcpfb_base_back_bottom_x);
    rcpfb_diamond_left_y_offset = 37.0/2.0;
    rcpfb_diamond_right_y_offset = -37.0/2.0;
    rcpfb_diamond_z_offset = 0.5*(rcpfb_grill_top_z+rcpfb_grill_bottom_z) - rcpfb_diamond_length/3;
    
    rcpfb_bottom_outer_trap_length = 15.0;
    rcpfb_bottom_outer_trap_back_width = 20.0;
    rcpfb_bottom_outer_trap_front_width = 9.0;
    rcpfb_bottom_outer_trap_height = rcpfb_grill_front_top_x-rcpfb_base_back_bottom_x;
    rcpfb_bottom_outer_trap_x_offset = 0.5*(rcpfb_grill_front_top_x+rcpfb_base_back_bottom_x);
    rcpfb_bottom_outer_trap_y_offset = 0.0;
    rcpfb_bottom_outer_trap_z_offset = rcpfb_grill_bottom_z + rcpfb_bottom_outer_trap_length/2.0+2.0;
    
    rcpfb_bottom_inner_trap_length = 4.0;
    rcpfb_bottom_inner_trap_back_width = 6.0;
    rcpfb_bottom_inner_trap_front_width = 3.0;
    rcpfb_bottom_inner_trap_height = rcpfb_bottom_outer_trap_height;
    rcpfb_bottom_inner_trap_x_offset = rcpfb_bottom_outer_trap_x_offset;
    rcpfb_bottom_inner_trap_y_offset = rcpfb_bottom_outer_trap_y_offset;
    rcpfb_bottom_inner_trap_z_offset = rcpfb_bottom_outer_trap_z_offset + rcpfb_bottom_outer_trap_length/2.0 - rcpfb_bottom_inner_trap_length/2.0+0.5;
    
    difference() {
        union() {
            polyhedron(points=[[rcpfb_base_back_bottom_x,rcpfb_base_left_y,rcpfb_base_bottom_z], // 0
                               [rcpfb_base_front_bottom_x,rcpfb_base_left_y,rcpfb_base_bottom_z], // 1 
                               [rcpfb_base_back_bottom_x,rcpfb_base_right_y,rcpfb_base_bottom_z], // 2
                               [rcpfb_base_front_bottom_x,rcpfb_base_right_y,rcpfb_base_bottom_z], // 3
                               [rcpfb_base_back_top_x,rcpfb_base_left_y,rcpfb_base_top_z], // 4 
                               [rcpfb_base_front_top_x,rcpfb_base_left_y,rcpfb_base_top_z], // 5
                               [rcpfb_base_back_top_x,rcpfb_base_right_y,rcpfb_base_top_z], // 6
                               [rcpfb_base_front_top_x,rcpfb_base_right_y,rcpfb_base_top_z] // 7       
            ], faces=[[1,0,2,3],[2,0,4,6],[4,5,7,6],[1,3,7,5],[3,2,6,7],[0,1,5,4]]);
            polyhedron(points=[[rcpfb_ramp_back_bottom_x, rcpfb_ramp_left_bottom_y, rcpfb_ramp_bottom_z], // 0
                               [rcpfb_ramp_front_bottom_x, rcpfb_ramp_left_bottom_y, rcpfb_ramp_bottom_z], // 1
                               [rcpfb_ramp_back_bottom_x, rcpfb_ramp_right_bottom_y, rcpfb_ramp_bottom_z], // 2
                               [rcpfb_ramp_front_bottom_x, rcpfb_ramp_right_bottom_y, rcpfb_ramp_bottom_z], // 3
                               [rcpfb_ramp_back_top_x, rcpfb_ramp_left_top_y, rcpfb_ramp_top_z], // 4
                               [rcpfb_ramp_front_top_x, rcpfb_ramp_left_top_y, rcpfb_ramp_top_z], // 5
                               [rcpfb_ramp_back_top_x, rcpfb_ramp_right_top_y, rcpfb_ramp_top_z], // 6
                               [rcpfb_ramp_front_top_x, rcpfb_ramp_right_top_y, rcpfb_ramp_top_z]], // 7
                faces=[[1,0,2,3], [2,0,4,6], [1,3,7,5], [3,2,6,7], [0,1,5,4], [4,5,7,6]]);
            polyhedron(points=[[rcpfb_grill_back_bottom_x, rcpfb_grill_left_bottom_y, rcpfb_grill_bottom_z], // 0
                               [rcpfb_grill_front_bottom_x, rcpfb_grill_left_bottom_y, rcpfb_grill_bottom_z], // 1
                               [rcpfb_grill_back_bottom_x, rcpfb_grill_right_bottom_y, rcpfb_grill_bottom_z], // 2
                               [rcpfb_grill_front_bottom_x, rcpfb_grill_right_bottom_y, rcpfb_grill_bottom_z], // 3
                               [rcpfb_grill_back_top_x, rcpfb_grill_left_top_y, rcpfb_grill_top_z], // 4
                               [rcpfb_grill_front_top_x, rcpfb_grill_left_top_y, rcpfb_grill_top_z], // 5
                               [rcpfb_grill_back_top_x, rcpfb_grill_right_top_y, rcpfb_grill_top_z], // 6
                               [rcpfb_grill_front_top_x, rcpfb_grill_right_top_y, rcpfb_grill_top_z]], // 7
                faces=[[1,0,2,3], [2,0,4,6], [1,3,7,5], [3,2,6,7], [0,1,5,4], [4,5,7,6]]);
            translate([rcpfb_tri_x_offset, rcpfb_tri_y_offset, rcpfb_tri_z_offset]) {
                rotate([0,90,0]) {
                    
                    _rounded_bh_triangle(rcpfb_tri_base, rcpfb_tri_height, rcpfb_tri_length);
                }
            }
            difference() {
                translate([rcpfb_top_outer_trap_x_offset, rcpfb_top_outer_trap_y_offset, rcpfb_top_outer_trap_z_offset]) {
                    rotate([0,-90,0]) {
                        _rounded_trapezoid(rcpfb_top_outer_trap_front_width, rcpfb_top_outer_trap_back_width, rcpfb_top_outer_trap_length, rcpfb_top_outer_trap_height);
                    }
                }
                translate([rcpfb_top_inner_trap_x_offset, rcpfb_top_inner_trap_y_offset, rcpfb_top_inner_trap_z_offset]) {
                    rotate([0,-90,0]) {
                        _rounded_trapezoid(rcpfb_top_inner_trap_front_width, rcpfb_top_inner_trap_back_width, rcpfb_top_inner_trap_length, rcpfb_top_inner_trap_height);
                    }
                }                
            }
            translate([rcpfb_dot_x_offset, rcpfb_dot_left_y_offset, rcpfb_dot_z_offset]) {
                scale([rcpfb_dot_x_scale, rcpfb_dot_y_scale, rcpfb_dot_z_scale]) {
                    difference() {
                        sphere(r=1.0, $fn=_fn_val);
                        translate([-0.5,0.0,0.0]) {
                            cube([1.0,2.0,2.0], true);
                        }
                    }
                }
            }
            translate([rcpfb_dot_x_offset, rcpfb_dot_right_y_offset, rcpfb_dot_z_offset]) {
                scale([rcpfb_dot_x_scale, rcpfb_dot_y_scale, rcpfb_dot_z_scale]) {
                    difference() {
                        sphere(r=1.0, $fn=_fn_val);
                        translate([-0.5,0.0,0.0]) {
                            cube([1.0,2.0,2.0], true);
                        }
                    }
                }
            }            
        }
        
        translate([rcpfb_diamond_x_offset, rcpfb_diamond_left_y_offset, rcpfb_diamond_z_offset]) {
            rotate([0,90,0]) {
                _rounded_diamond(rcpfb_diamond_length, rcpfb_diamond_width, rcpfb_diamond_height);
            }
        }
        translate([rcpfb_diamond_x_offset, rcpfb_diamond_right_y_offset, rcpfb_diamond_z_offset]) {
            rotate([0,90,0]) {
                _rounded_diamond(rcpfb_diamond_length, rcpfb_diamond_width, rcpfb_diamond_height);
            }
        }
        difference() {
            translate([rcpfb_bottom_outer_trap_x_offset, rcpfb_bottom_outer_trap_y_offset, rcpfb_bottom_outer_trap_z_offset]) {
                rotate([0,90,0]) {
                    _rounded_trapezoid(rcpfb_bottom_outer_trap_front_width, rcpfb_bottom_outer_trap_back_width, rcpfb_bottom_outer_trap_length
, rcpfb_bottom_outer_trap_height);                
                }
            }
            translate([rcpfb_bottom_inner_trap_x_offset, rcpfb_bottom_inner_trap_y_offset, rcpfb_bottom_inner_trap_z_offset]) {
                rotate([0,90,0]) {
                    _rounded_trapezoid(rcpfb_bottom_inner_trap_front_width, rcpfb_bottom_inner_trap_back_width, rcpfb_bottom_inner_trap_length
, rcpfb_bottom_inner_trap_height);                
                }
            }            
        }
        
    }
    
}
