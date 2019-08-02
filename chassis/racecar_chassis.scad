$include_rcp = true;
$include_rcba = true;
$include_rcbb = true;
$include_rcw = true;
$include_rcusl = true;
$include_rcws = true;
$include_rclsl = true;
$include_rcl = true;
$include_rcst = true;

include <racecar_chassis_platform.scad>
include <racecar_chassis_bumper_absorber.scad>
include <racecar_chassis_back_bumper.scad>
include <racecar_chassis_wheel.scad>
include <racecar_chassis_upper_suspension_link.scad>
include <racecar_chassis_wheel_shaft.scad>
include <racecar_chassis_lower_suspension_link.scad>
include <racecar_chassis_link.scad>
include <racecar_chassis_shock_tower.scad>

rc_wrt_rcb_x_offset = -9.0;
rc_wrt_rcb_y_offset = 0.0;
rc_wrt_rcb_z_offset = -60.0;

rc_back_gearbox_x_offset = rcp_back_x_offset-5.0;
rc_back_gearbox_y_offset = rcp_back_y_offset;
rc_back_gearbox_z_offset = rcp_back_z_offset+rcp_back_height/2.0;

rc_front_gearbox_x_offset = rcp_front_x_offset-17.0;
rc_front_gearbox_y_offset = rcp_front_y_offset;
rc_front_gearbox_z_offset = rcp_front_z_offset+rcp_front_height/2.0;

rc_bumper_absorber_x_offset = rc_front_gearbox_x_offset + rcg_base_length/2.0 + rcba_length/2.0-3.0 ;
rc_bumper_absorber_y_offset = rc_front_gearbox_y_offset;
rc_bumper_absorber_z_offset = rc_front_gearbox_z_offset+rcg_base_height+rcba_height/2.0;
rc_bumper_absorber_x_scale = 1.2;
rc_bumper_absorber_pitch = 0.0;

rc_wheel_front_x_offset = rc_front_gearbox_x_offset;
rc_wheel_back_x_offset = rc_back_gearbox_x_offset;
rc_wheel_left_y_offset = 115.0;
rc_wheel_right_y_offset = -115.0;
rc_wheel_z_offset = rc_back_gearbox_z_offset + rcg_base_height/2.0;

rc_upper_suspension_link_front_x_offset = rc_front_gearbox_x_offset;
rc_upper_suspension_link_back_x_offset = rc_back_gearbox_x_offset;
rc_upper_suspension_link_left_y_offset = rc_front_gearbox_y_offset + rcg_upper_suspension_left_y_offset+71.33/2.0;
rc_upper_suspension_link_right_y_offset = rc_front_gearbox_y_offset + rcg_upper_suspension_right_y_offset-71.33/2.0;
rc_upper_suspension_link_z_offset = rc_front_gearbox_z_offset+rcg_upper_suspension_z_offset;

rc_wheel_shaft_width = 58.35;
rc_wheel_shaft_front_x_offset = rc_front_gearbox_x_offset;
rc_wheel_shaft_back_x_offset = rc_back_gearbox_x_offset;
rc_wheel_shaft_left_y_offset = rc_front_gearbox_y_offset + rcg_wheel_slot_left_y_offset + rc_wheel_shaft_width/2.0 + 3.0;
rc_wheel_shaft_right_y_offset = rc_front_gearbox_y_offset + rcg_wheel_slot_right_y_offset- rc_wheel_shaft_width/2.0 - 3.0;
rc_wheel_shaft_z_offset = rc_front_gearbox_z_offset+rcg_wheel_slot_z_offset-3;

rc_lower_suspension_width = 68.67;
rc_lower_suspension_front_x_offset = rcp_front_suspension_connector_x_offset;
rc_lower_suspension_back_x_offset = rcp_back_suspension_connector_x_offset;
rc_lower_suspension_left_y_offset = rcp_back_suspension_connector_left_y_offset + rc_lower_suspension_width/2.0-rcp_back_suspension_connector_radius;
rc_lower_suspension_right_y_offset = rcp_back_suspension_connector_right_y_offset - rc_lower_suspension_width/2.0+rcp_back_suspension_connector_radius;
rc_lower_suspension_z_offset = rcp_back_suspension_connector_z_offset-2;

rc_link_width = 67.72;
rc_link_front_x_offset = rc_wheel_front_x_offset + rcw_suspension_link_x_offset -rcw_outer_suspension_link_back_width/2.0+_ball_head_length/2.0+2.25;
rc_link_back_x_offset = rc_wheel_back_x_offset + rcw_suspension_link_x_offset + rcw_outer_suspension_link_back_width/2.0-_ball_head_length/2.0-2.25;
rc_link_left_y_offset = rc_wheel_left_y_offset - rcw_suspension_link_y_offset -rcw_outer_suspension_link_length/2.0+_ball_head_width/2.0+1 -rc_link_width/2.0+rclh_length/2.0-1.0;
rc_link_right_y_offset = rc_wheel_right_y_offset + rcw_suspension_link_y_offset + rcw_outer_suspension_link_length/2.0 -_ball_head_width/2.0-1 +rc_link_width/2.0-rclh_length/2.0+1.0;
rc_link_z_offset = rc_wheel_z_offset + rcw_suspension_link_z_offset+rcw_outer_suspension_link_height/2.0+_ball_head_height - rclh_height/2.0;

rc_shock_tower_height = 102.3;
rc_shock_tower_front_x_offset = rc_front_gearbox_x_offset+rcgsp_upper_trap_x_offset + rcgsp_upper_trap_height/2.0+rcstc_length/2.0-6;
rc_shock_tower_back_x_offset = rc_back_gearbox_x_offset-rcgsp_upper_trap_x_offset - rcgsp_upper_trap_height/2.0-rcstc_length/2.0+6;
rc_shock_tower_left_y_offset = rc_front_gearbox_y_offset + rcgsp_upper_trap_y_offset + 0.5*(rcgsp_upper_trap_front_width/2.0 + rcgsp_upper_cutout_trap_back_width/2.0)-3;
rc_shock_tower_right_y_offset = rc_front_gearbox_y_offset + rcgsp_upper_trap_y_offset - 0.5*(rcgsp_upper_trap_front_width/2.0 + rcgsp_upper_cutout_trap_back_width/2.0)+3;
rc_shock_tower_z_offset = rc_front_gearbox_z_offset + rcgsp_upper_trap_x_offset + rcg_spring_support_z_offset+rcg_spring_support_length/2.0+rcgsp_base_length/2.0+rcgsp_upper_trap_length/2.0+0.5;

if ($include_rc==undef) {
    RacecarChassis();
}

module RacecarChassis() {
    
    RacecarChassisPlatform();
    
    translate([rc_back_gearbox_x_offset,rc_back_gearbox_y_offset,rc_back_gearbox_z_offset]) {
        RacecarChassisGearbox();
    }
    /*
    translate([rc_back_gearbox_x_offset,rc_back_gearbox_y_offset,rc_back_gearbox_z_offset]) {
        RacecarChassisGearboxSpringPlate();
    }    
    */
    
    translate([rc_back_gearbox_x_offset,rc_back_gearbox_y_offset,rc_back_gearbox_z_offset]) {
        RacecarChassisGearboxMotorCover();
    }

    
    translate([rc_back_gearbox_x_offset,rc_back_gearbox_y_offset,rc_back_gearbox_z_offset]) {
        RacecarChassisBackBumper();
    }    
    
    translate([rc_front_gearbox_x_offset,rc_front_gearbox_y_offset,rc_front_gearbox_z_offset]) {
        rotate([0,0,180]) {
            RacecarChassisGearbox();
            RacecarChassisFrontSteering();
        }
    } 
    /*    
    translate([rc_front_gearbox_x_offset,rc_front_gearbox_y_offset,rc_front_gearbox_z_offset]) {
        rotate([0,0,180]) {
            RacecarChassisGearboxSpringPlate();
        }
    }
    */
    
    translate([rc_bumper_absorber_x_offset, rc_bumper_absorber_y_offset, rc_bumper_absorber_z_offset]) {
        scale([rc_bumper_absorber_x_scale,1.0,1.0]) {
            rotate([0.0,rc_bumper_absorber_pitch,0.0]) {
                RacecarChassisBumperAbsorber();
            }
        }
    }
    
    /*
    translate([rc_wheel_front_x_offset, rc_wheel_right_y_offset, rc_wheel_z_offset]) {
        RacecarChassisWheel();
    }
    
    */
    translate([rc_wheel_front_x_offset, rc_wheel_right_y_offset, rc_wheel_z_offset]) {
        RacecarChassisWheelAxle();
    }    
    /*
    translate([rc_wheel_front_x_offset, rc_wheel_left_y_offset, rc_wheel_z_offset]) {
        rotate([0,0,180]) {
            RacecarChassisWheel(false);
        }
    } 
    */
    
    translate([rc_wheel_front_x_offset, rc_wheel_left_y_offset, rc_wheel_z_offset]) {
        rotate([0,0,180]) {
            RacecarChassisWheelAxle(false);
        }
    }     
    
    /*
    translate([rc_wheel_back_x_offset, rc_wheel_left_y_offset, rc_wheel_z_offset]) {
        rotate([0,0,180]) {
            RacecarChassisWheel();
        }
    } 
    */
    
    translate([rc_wheel_back_x_offset, rc_wheel_left_y_offset, rc_wheel_z_offset]) {
        rotate([0,0,180]) {
            RacecarChassisWheelAxle();
        }
    }     
    
    /*
    translate([rc_wheel_back_x_offset, rc_wheel_right_y_offset, rc_wheel_z_offset]) {
        RacecarChassisWheel(false);
    } 
    */
    
    translate([rc_wheel_back_x_offset, rc_wheel_right_y_offset, rc_wheel_z_offset]) {
        RacecarChassisWheelAxle(false);
    }     
    
    
    translate([rc_upper_suspension_link_front_x_offset, rc_upper_suspension_link_left_y_offset, rc_upper_suspension_link_z_offset]) {
        RacecarChassisUpperSuspensionLink();
    }
    
    translate([rc_upper_suspension_link_front_x_offset, rc_upper_suspension_link_right_y_offset, rc_upper_suspension_link_z_offset]) {
        RacecarChassisUpperSuspensionLink();
    }    

    translate([rc_upper_suspension_link_back_x_offset, rc_upper_suspension_link_left_y_offset, rc_upper_suspension_link_z_offset]) {
        RacecarChassisUpperSuspensionLink();
    }
    
    translate([rc_upper_suspension_link_back_x_offset, rc_upper_suspension_link_right_y_offset, rc_upper_suspension_link_z_offset]) {
        RacecarChassisUpperSuspensionLink();
    }    
    
    translate([rc_wheel_shaft_front_x_offset, rc_wheel_shaft_left_y_offset, rc_wheel_shaft_z_offset]) {
        rotate([-7.5,0,0]) {
            rotate([0,-34,0]) {
                RacecarChassisWheelShaft();
            }
        }
    }
    
    translate([rc_wheel_shaft_back_x_offset, rc_wheel_shaft_left_y_offset, rc_wheel_shaft_z_offset]) {
        rotate([-7.5,0,0]) {
            rotate([0,34,0]) {
                RacecarChassisWheelShaft();
            }
        }
    }
    
    translate([rc_wheel_shaft_front_x_offset, rc_wheel_shaft_right_y_offset, rc_wheel_shaft_z_offset]) {
        rotate([7.5,0,0]) {
            rotate([0,-34,0]) {
                RacecarChassisWheelShaft();
            }
        }
    }
    
    translate([rc_wheel_shaft_back_x_offset, rc_wheel_shaft_right_y_offset, rc_wheel_shaft_z_offset]) {
        rotate([7.5,0,0]) {
            rotate([0,34,0]) {
                RacecarChassisWheelShaft();
            }
        }
    }    
   
    translate([rc_lower_suspension_front_x_offset, rc_lower_suspension_left_y_offset, rc_lower_suspension_z_offset]) {
        rotate([-4,0,0]) {
            RacecarChassisLowerSuspensionLink(rc_lower_suspension_width);
        }
    }
    
    translate([rc_lower_suspension_back_x_offset, rc_lower_suspension_left_y_offset, rc_lower_suspension_z_offset]) {
        rotate([-4,0,0]) {
            RacecarChassisLowerSuspensionLink(rc_lower_suspension_width);
        }
    }    
    
    translate([rc_lower_suspension_front_x_offset, rc_lower_suspension_right_y_offset, rc_lower_suspension_z_offset]) {
        rotate([184,0,0]) {
            RacecarChassisLowerSuspensionLink(rc_lower_suspension_width);
        }
    }
    
    translate([rc_lower_suspension_back_x_offset, rc_lower_suspension_right_y_offset, rc_lower_suspension_z_offset]) {
        rotate([184,0,0]) {
            RacecarChassisLowerSuspensionLink(rc_lower_suspension_width);
        }
    }        
    
    
    translate([rc_link_front_x_offset, rc_link_left_y_offset, rc_link_z_offset]) {
        rotate([0,0,1.75]) {
            RacecarChassisLink(rc_link_width);
        }
    }
    
    translate([rc_link_front_x_offset, rc_link_right_y_offset, rc_link_z_offset]) {
        rotate([0,0,-1.75]) {
            RacecarChassisLink(rc_link_width);
        }
    }

    translate([rc_link_back_x_offset, rc_link_left_y_offset, rc_link_z_offset]) {
        rotate([0,0,1.75]) {
            RacecarChassisLink(rc_link_width);
        }
    }
    
    translate([rc_link_back_x_offset, rc_link_right_y_offset, rc_link_z_offset]) {
        rotate([0,0,-1.75]) {
            RacecarChassisLink(rc_link_width);
        }
    }
    
    translate([rc_shock_tower_front_x_offset, rc_shock_tower_left_y_offset, rc_shock_tower_z_offset]) {
        rotate([38,-5,0]) {
            translate([0,0,-rc_shock_tower_height/2.0]) {
                render() {
                    RacecarChassisShockTower(rc_shock_tower_height);
                }
            }
        }
    }
    
    translate([rc_shock_tower_back_x_offset, rc_shock_tower_left_y_offset, rc_shock_tower_z_offset]) {
        rotate([-38,-3,180]) {
            translate([0,0,-rc_shock_tower_height/2.0]) {
                render() {
                    RacecarChassisShockTower(rc_shock_tower_height);
                }
            }
        }
    }    
    
    translate([rc_shock_tower_front_x_offset, rc_shock_tower_right_y_offset, rc_shock_tower_z_offset]) {
        rotate([-38,-5,0]) {
            translate([0,0,-rc_shock_tower_height/2.0]) {
                render() {
                    RacecarChassisShockTower(rc_shock_tower_height);
                }
            }
        }
    }    
    
    translate([rc_shock_tower_back_x_offset, rc_shock_tower_right_y_offset, rc_shock_tower_z_offset]) {
        rotate([38,-3,180]) {
            translate([0,0,-rc_shock_tower_height/2.0]) {
                render() {
                    RacecarChassisShockTower(rc_shock_tower_height);
                }
            }
        }
    }        
    
    
    
}


