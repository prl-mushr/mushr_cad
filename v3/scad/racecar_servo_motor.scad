$include_rcl = true;
$include_rsc = true;

include <../../chassis/racecar_chassis_link.scad>
include <racecar_servo_cage.scad>

rsmb_body_length = 40.12;
rsmb_body_width = 40.5;
rsmb_body_height = 20.2;
rsmb_body_x_offset = 0.0;
rsmb_body_y_offset = 0.0;
rsmb_body_z_offset = 0.0;

rsmb_faceplate_round_radius = 3.38;
rsmb_faceplate_length = 54.5 - 2*rsmb_faceplate_round_radius;
rsmb_faceplate_width = 3.2;
rsmb_faceplate_height = 18.8 - 2*rsmb_faceplate_round_radius;
rsmb_faceplate_x_offset = rsmb_body_x_offset;
rsmb_faceplate_y_offset = rsmb_body_y_offset-rsmb_body_width/2.0+ rsmb_faceplate_width/2.0+9.85;
rsmb_faceplate_z_offset = rsmb_body_z_offset;

rsma_length = 14.8;
rsma_width = 5.95;
rsma_height = 35.5;

rsma_gear_connector_radius = rsma_length/2.0;
rsma_gear_connector_height = rsma_width;
rsma_gear_connector_x_offset = rsmb_body_x_offset-rsmb_body_length/2.0+8.5;
rsma_gear_connector_y_offset = rsmb_body_y_offset-rsmb_body_width/2.0-rsma_gear_connector_height/2.0;
rsma_gear_connector_z_offset = rsmb_body_z_offset+rsmb_body_z_offset;

rsma_shaft_length = 8.0;
rsma_shaft_width = rsma_width;
rsma_shaft_height = 14.87;
rsma_shaft_x_offset = rsma_gear_connector_x_offset;
rsma_shaft_y_offset = rsma_gear_connector_y_offset;
rsma_shaft_z_offset =  rsma_gear_connector_z_offset+24.0-rsma_shaft_height/2.0;

rsma_shaft_transition_length = rsma_shaft_length;
rsma_shaft_transition_width = rsma_shaft_width;
rsma_shaft_transition_height = 1.0;
rsma_shaft_transition_x_offset = rsma_shaft_x_offset;
rsma_shaft_transition_y_offset = rsma_shaft_y_offset;
rsma_shaft_transition_z_offset = rsma_shaft_z_offset-rsma_shaft_height/2.0-rsma_shaft_transition_height/2.0;

rsma_tip_height = rsma_shaft_width;
rsma_tip_radius = rsma_shaft_length/2.0;
rsma_tip_x_offset = rsma_shaft_x_offset;
rsma_tip_y_offset = rsma_shaft_y_offset;
rsma_tip_z_offset = rsma_shaft_z_offset+rsma_shaft_height/2.0;

rsma_screw_hole_height = rsma_tip_height;
rsma_screw_hole_radius = 3.25/2.0;
rsma_screw_hole_x_offset = rsma_tip_x_offset;
rsma_screw_hole_y_offset = rsma_tip_y_offset;
rsma_screw_hole_upper_z_offset = rsma_tip_z_offset;
rsma_screw_hole_lower_z_offset = rsma_tip_z_offset - 4.0;

rsma_ball_head_x_offset = rsma_screw_hole_x_offset;
rsma_ball_head_y_offset = rsma_screw_hole_y_offset - rsma_screw_hole_height/2.0 - _ball_head_height/2.0;
rsma_ball_head_z_offset = rsma_screw_hole_lower_z_offset;

rsm_wrt_rcb_x_offset = rsc_wrt_rcb_x_offset;
rsm_wrt_rcb_y_offset = rsc_wrt_rcb_y_offset - rsc_width/2.0 - rsmb_faceplate_y_offset - rsmb_faceplate_width/2.0;
rsm_wrt_rcb_z_offset = rsc_wrt_rcb_z_offset - rsc_height/2.0 + rsmb_body_height/2.0;

if($include_rsm==undef) {
    RacecarServoMotorBody();
    RacecarServoMotorArm();
    RacecarServoMotorArmLink();
}

module RacecarServoMotorBody() {
    
    rsmb_faceplate_hole_height = rsmb_faceplate_width;
    rsmb_faceplate_hole_radius = 5/2.0;
    rsmb_faceplate_hole_front_x_offset = rsmb_faceplate_x_offset + 50/2.0;
    rsmb_faceplate_hole_back_x_offset = rsmb_faceplate_x_offset - 50/2.0;
    rsmb_faceplate_hole_y_offset = rsmb_faceplate_y_offset;
    rsmb_faceplate_hole_upper_z_offset = rsmb_faceplate_z_offset + 10.0/2.0;
    rsmb_faceplate_hole_lower_z_offset = rsmb_faceplate_z_offset - 10.0/2.0;    
    
    translate([rsmb_body_x_offset, rsmb_body_y_offset, rsmb_body_z_offset]) {
        cube([rsmb_body_length, rsmb_body_width, rsmb_body_height], true);
    }    
    
    difference() {
        hull() {
            translate([rsmb_faceplate_x_offset, rsmb_faceplate_y_offset, rsmb_faceplate_z_offset]) {
                cube([rsmb_faceplate_length, rsmb_faceplate_width, rsmb_faceplate_height], true);
            }
            translate([rsmb_faceplate_x_offset+rsmb_faceplate_length/2.0, rsmb_faceplate_y_offset, rsmb_faceplate_z_offset+rsmb_faceplate_height/2.0]) {
                rotate([90,0,0]) {
                    cylinder(rsmb_faceplate_width, rsmb_faceplate_round_radius, rsmb_faceplate_round_radius, true, $fn=_fn_val);
                }
            }
            translate([rsmb_faceplate_x_offset+rsmb_faceplate_length/2.0, rsmb_faceplate_y_offset, rsmb_faceplate_z_offset-rsmb_faceplate_height/2.0]) {
                rotate([90,0,0]) {
                    cylinder(rsmb_faceplate_width, rsmb_faceplate_round_radius, rsmb_faceplate_round_radius, true, $fn=_fn_val);
                }
            }
            translate([rsmb_faceplate_x_offset-rsmb_faceplate_length/2.0, rsmb_faceplate_y_offset, rsmb_faceplate_z_offset+rsmb_faceplate_height/2.0]) {
                rotate([90,0,0]) {
                    cylinder(rsmb_faceplate_width, rsmb_faceplate_round_radius, rsmb_faceplate_round_radius, true, $fn=_fn_val);
                }
            }
            translate([rsmb_faceplate_x_offset-rsmb_faceplate_length/2.0, rsmb_faceplate_y_offset, rsmb_faceplate_z_offset-rsmb_faceplate_height/2.0]) {
                rotate([90,0,0]) {
                    cylinder(rsmb_faceplate_width, rsmb_faceplate_round_radius, rsmb_faceplate_round_radius, true, $fn=_fn_val);
                }
            }        
        }
        translate([rsmb_faceplate_hole_front_x_offset, rsmb_faceplate_hole_y_offset, rsmb_faceplate_hole_upper_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rsmb_faceplate_hole_height, rsmb_faceplate_hole_radius, rsmb_faceplate_hole_radius, true, $fn=_fn_val);
            }
        }
        translate([rsmb_faceplate_hole_front_x_offset, rsmb_faceplate_hole_y_offset, rsmb_faceplate_hole_lower_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rsmb_faceplate_hole_height, rsmb_faceplate_hole_radius, rsmb_faceplate_hole_radius, true, $fn=_fn_val);
            }
        }        
        translate([rsmb_faceplate_hole_back_x_offset, rsmb_faceplate_hole_y_offset, rsmb_faceplate_hole_upper_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rsmb_faceplate_hole_height, rsmb_faceplate_hole_radius, rsmb_faceplate_hole_radius, true, $fn=_fn_val);
            }
        }
        translate([rsmb_faceplate_hole_back_x_offset, rsmb_faceplate_hole_y_offset, rsmb_faceplate_hole_lower_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rsmb_faceplate_hole_height, rsmb_faceplate_hole_radius, rsmb_faceplate_hole_radius, true, $fn=_fn_val);
            }
        }                
    }
    
}

module RacecarServoMotorArm() {
    
    hull() {
        translate([rsma_gear_connector_x_offset, rsma_gear_connector_y_offset, rsma_gear_connector_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rsma_gear_connector_height, rsma_gear_connector_radius, rsma_gear_connector_radius, true, $fn=_fn_val);
            }
        }
        translate([rsma_shaft_transition_x_offset, rsma_shaft_transition_y_offset, rsma_shaft_transition_z_offset]) {
            cube([rsma_shaft_transition_length, rsma_shaft_transition_width, rsma_shaft_transition_height], true);
        }
    }
    
    difference() {
        union() {
            translate([rsma_shaft_x_offset, rsma_shaft_y_offset, rsma_shaft_z_offset]) {
                cube([rsma_shaft_length, rsma_shaft_width, rsma_shaft_height], true);
            }
            
            translate([rsma_tip_x_offset, rsma_tip_y_offset, rsma_tip_z_offset]) {
                rotate([90,0,0]) {
                    cylinder(rsma_tip_height, rsma_tip_radius, rsma_tip_radius, true, $fn=_fn_val);
                }
            }
        }
        translate([rsma_screw_hole_x_offset, rsma_screw_hole_y_offset, rsma_screw_hole_upper_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rsma_screw_hole_height, rsma_screw_hole_radius, rsma_screw_hole_radius, true, $fn=_fn_val);
            }
        }
        translate([rsma_screw_hole_x_offset, rsma_screw_hole_y_offset, rsma_screw_hole_lower_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rsma_screw_hole_height, rsma_screw_hole_radius, rsma_screw_hole_radius, true, $fn=_fn_val);
            }
        }        
    }
    translate([rsma_ball_head_x_offset, rsma_ball_head_y_offset, rsma_ball_head_z_offset]) {
        rotate([90,0,0]) {
            _ball_head();
        }
    }
    
}

module RacecarServoMotorArmLink() {

    rsmal_link_width = 67.75;
    rsmal_link_x_offset = rsma_ball_head_x_offset+rsmal_link_width/2.0-_ball_head_length/2.0-2;
    rsmal_link_y_offset = rsma_ball_head_y_offset+3;
    rsmal_link_z_offset = rsma_ball_head_z_offset - 6;

    
    translate([rsmal_link_x_offset, rsmal_link_y_offset, rsmal_link_z_offset]) {
        rotate([0,12,0]) {
            rotate([0,0,8]) {
                rotate([0,0,90]) {
                    RacecarChassisLink(rsmal_link_width,90);
                }
            }
        }
    }    
    
}