$include_rbf = true;
include <racecar_back_foundation.scad>

rbct_length = rbf_length;
rbct_width = 100.0;
rbct_height = 10.0;
rbct_wrt_rbf_x_offset = 0.0;
rbct_wrt_rbf_y_offset = 0.0;
rbct_wrt_rbf_z_offset = rbf_height/2.0 + rbct_height/2.0+65.0;

rbctcl_length = rbct_length;
rbctcl_width = 15.0;
rbctcl_height = 3.0;
rbctcl_wrt_rbct_x_offset = 0.0;
rbctcl_wrt_rbct_y_offset = rbct_width/2.0 - rbctcl_width/2.0;
rbctcl_wrt_rbct_z_offset = -rbct_height/2.0 + rbctcl_height/2.0;

rbctcr_length = rbct_length;
rbctcr_width = rbctcl_width;
rbctcr_height = rbctcl_height;
rbctcr_wrt_rbct_x_offset = 0.0;
rbctcr_wrt_rbct_y_offset = -rbct_width/2.0 + rbctcr_width/2.0;
rbctcr_wrt_rbct_z_offset = -rbct_height/2.0 + rbctcr_height/2.0;

rbct_jetson_screw_access_length = _m2_5_nut_diameter/2.0;
rbct_jetson_screw_height = 8.0;
rbct_jetson_screw_front_x_offset = -rbct_length/2.0+80-4.125;
rbct_jetson_screw_back_x_offset = rbct_jetson_screw_front_x_offset - 57.75;
rbct_jetson_screw_left_y_offset = 85.75/2.0 -3.0;
rbct_jetson_screw_right_y_offset = rbct_jetson_screw_left_y_offset - 85.75;
rbct_jetson_screw_z_offset = -rbct_height/2.0 + rbct_jetson_screw_height/2.0;

rbct_connector_screw_height = rbct_height  - rbctcl_height - 0.75;

rbct_connector_screw_front_left_x_offset = rbct_length/2.0 - _m2_5_nut_diameter/2.0 - _wall_thickness;
rbct_connector_screw_front_right_x_offset = rbct_connector_screw_front_left_x_offset;
rbct_connector_screw_back_left_x_offset = -rbct_length/2.0 + _m2_5_nut_diameter/2.0 + _wall_thickness; 
rbct_connector_screw_back_right_x_offset = -rbct_length/2.0 + 30.0;
rbct_connector_screw_left_y_offset = rbct_width/2.0 - _m2_5_screw_shaft_radius - _wall_thickness;
rbct_connector_screw_right_y_offset = -rbct_width/2.0 + _m2_5_screw_shaft_radius + _wall_thickness;
rbct_connector_screw_z_offset = -rbct_height/2.0 + rbctcl_height + rbct_connector_screw_height/2.0;

rbct_laser_leg_radius = 5.75/2;
rbct_laser_leg_height = 5.0;
rbct_laser_leg_front_x_offset = rbct_length/2.0 - 10.0;
rbct_laser_leg_back_x_offset = rbct_laser_leg_front_x_offset - 57.0;
rbct_laser_leg_front_left_y_offset = 31.0;
rbct_laser_leg_front_right_y_offset = -31.0;
rbct_laser_leg_back_left_y_offset = 25.0;
rbct_laser_leg_back_right_y_offset = -25.0;
rbct_laser_leg_z_offset = rbct_height/2.0 - rbct_laser_leg_height/2.0;

if ($include_rbct==undef) {
    RacecarBackCoverTop();
    
    /*
    translate([rbctcl_wrt_rbct_x_offset, rbctcl_wrt_rbct_y_offset, rbctcl_wrt_rbct_z_offset]) {
        RacecarBackCoverTopConnectorLeft(true);
    }
    translate([rbctcr_wrt_rbct_x_offset, rbctcr_wrt_rbct_y_offset, rbctcr_wrt_rbct_z_offset]) {
        RacecarBackCoverTopConnectorRight(true);
    } */
    
}

module RacecarBackCoverTop() {
    
    rbct_laser_screw_head_radius = 4.0/2.0;
    rbct_laser_screw_head_height = 7.64 - 6.5;
    rbct_laser_screw_shaft_radius = 2.35/2;
    rbct_laser_screw_height = 3.0; 
    rbct_laser_screw_front_x_offset = rbct_laser_leg_front_x_offset;
    rbct_laser_screw_back_x_offset = rbct_laser_leg_back_x_offset;
    rbct_laser_screw_front_left_y_offset = rbct_laser_leg_front_left_y_offset;
    rbct_laser_screw_front_right_y_offset = rbct_laser_leg_front_right_y_offset;
    rbct_laser_screw_back_left_y_offset = rbct_laser_leg_back_left_y_offset;
    rbct_laser_screw_back_right_y_offset = rbct_laser_leg_back_right_y_offset;
    rbct_laser_screw_z_offset = rbct_laser_leg_z_offset - rbct_laser_leg_height/2.0 - rbct_laser_screw_height/2.0;
    
    rbct_laser_screw_extra_height = rbct_height - rbct_laser_leg_height - rbct_laser_screw_height;
    rbct_laser_screw_extra_radius = rbct_laser_screw_head_radius;
    rbct_laser_screw_extra_front_x_offset = rbct_laser_screw_front_x_offset;
    rbct_laser_screw_extra_back_x_offset = rbct_laser_screw_back_x_offset;
    rbct_laser_screw_extra_front_left_y_offset = rbct_laser_screw_front_left_y_offset;
    rbct_laser_screw_extra_front_right_y_offset = rbct_laser_screw_front_right_y_offset;
    rbct_laser_screw_extra_back_left_y_offset = rbct_laser_screw_back_left_y_offset;
    rbct_laser_screw_extra_back_right_y_offset = rbct_laser_screw_back_right_y_offset;
    rbct_laser_screw_extra_z_offset = rbct_laser_screw_z_offset-rbct_laser_screw_height/2.0-rbct_laser_screw_extra_height/2.0;
    
    rbct_laser_board_screw_height = 3.0;
    rbct_laser_board_screw_radius = _m2_5_screw_shaft_radius;
    rbct_laser_board_screw_front_x_offset = (rbct_laser_screw_front_x_offset + rbct_laser_screw_back_x_offset)/2.0+26.0/2.0;
    rbct_laser_board_screw_back_x_offset = (rbct_laser_board_screw_front_x_offset - 26.0);
    rbct_laser_board_screw_right_y_offset = rbct_laser_screw_front_right_y_offset + 5.0;
    rbct_laser_board_screw_left_y_offset = rbct_laser_board_screw_right_y_offset + 17.0;
    rbct_laser_board_screw_z_offset = rbct_height/2.0 - rbct_laser_board_screw_height/2.0;
    
    rbct_laser_cable_length = 20;
    rbct_laser_cable_width = 12;
    rbct_laser_cable_height = rbct_height;
    rbct_laser_cable_x_offset = rbct_laser_screw_front_x_offset -  rbct_laser_screw_head_radius - rbct_laser_cable_length/2.0 - _wall_thickness;
    rbct_laser_cable_y_offset = rbct_laser_screw_front_left_y_offset - rbct_laser_cable_width/2.0;
    rbct_laser_cable_z_offset = 0.0;
    
    rbct_imu_screw_height = rbct_height - _wall_thickness;
    rbct_imu_access_length = _m2_5_nut_diameter/2.0;    
    rbct_imu_screw_front_x_offset = rbct_length/2.0 - _wall_thickness;
    rbct_imu_screw_back_x_offset = rbct_imu_screw_front_x_offset - 26.67;
    rbct_imu_screw_left_y_offset = 26.67/2.0;
    rbct_imu_screw_right_y_offset = -26.67/2.0;
    rbct_imu_screw_z_offset = -rbct_height/2.0+rbct_imu_screw_height/2.0;
    
    difference() {
        union() {
            translate([0.0, 0.0, 0.0]) {
                cube([rbct_length, rbct_width, rbct_height], true);
            }            
        }
        translate([rbct_laser_leg_front_x_offset, rbct_laser_leg_front_left_y_offset, rbct_laser_leg_z_offset]) {
            scale([1,1,1.001]) {
                cylinder(rbct_laser_leg_height, rbct_laser_leg_radius, rbct_laser_leg_radius, true, $fn=_fn_val);
            }
        }
        translate([rbct_laser_leg_front_x_offset, rbct_laser_leg_front_right_y_offset, rbct_laser_leg_z_offset]) {
            scale([1,1,1.001]) {
                cylinder(rbct_laser_leg_height, rbct_laser_leg_radius, rbct_laser_leg_radius, true, $fn=_fn_val);
            }
        }
        translate([rbct_laser_leg_back_x_offset, rbct_laser_leg_back_left_y_offset, rbct_laser_leg_z_offset]) {
            scale([1,1,1.001]) {
                cylinder(rbct_laser_leg_height, rbct_laser_leg_radius, rbct_laser_leg_radius, true, $fn=_fn_val);
            }
        }
        translate([rbct_laser_leg_back_x_offset, rbct_laser_leg_back_right_y_offset, rbct_laser_leg_z_offset]) {
            scale([1,1,1.001]) {
                cylinder(rbct_laser_leg_height, rbct_laser_leg_radius, rbct_laser_leg_radius, true, $fn=_fn_val);
            }
        }
        translate([rbct_laser_screw_front_x_offset, rbct_laser_screw_front_left_y_offset, rbct_laser_screw_z_offset]) {
            rotate([0,180,0]) {
                _flathead_screw(rbct_laser_screw_height, rbct_laser_screw_head_height, rbct_laser_screw_head_radius, rbct_laser_screw_shaft_radius);
            }
        }
        translate([rbct_laser_screw_extra_front_x_offset, rbct_laser_screw_extra_front_left_y_offset, rbct_laser_screw_extra_z_offset]) {
            scale([1,1,1.001]) {
                cylinder(rbct_laser_screw_extra_height, rbct_laser_screw_extra_radius, rbct_laser_screw_extra_radius, true, $fn=_fn_val);
            }
        }
        translate([rbct_laser_screw_front_x_offset, rbct_laser_screw_front_right_y_offset, rbct_laser_screw_z_offset]) {
            rotate([0,180,0]) {
                _flathead_screw(rbct_laser_screw_height, rbct_laser_screw_head_height, rbct_laser_screw_head_radius, rbct_laser_screw_shaft_radius);
            }
        }        
         translate([rbct_laser_screw_extra_front_x_offset, rbct_laser_screw_extra_front_right_y_offset, rbct_laser_screw_extra_z_offset]) {
            scale([1,1,1.001]) {
                cylinder(rbct_laser_screw_extra_height, rbct_laser_screw_extra_radius, rbct_laser_screw_extra_radius, true, $fn=_fn_val);
            }
        }
        translate([rbct_laser_screw_back_x_offset, rbct_laser_screw_back_left_y_offset, rbct_laser_screw_z_offset]) {
            rotate([0,180,0]) {
                _flathead_screw(rbct_laser_screw_height, rbct_laser_screw_head_height, rbct_laser_screw_head_radius, rbct_laser_screw_shaft_radius);
            }
        }        
         translate([rbct_laser_screw_extra_back_x_offset, rbct_laser_screw_extra_back_left_y_offset, rbct_laser_screw_extra_z_offset]) {
            scale([1,1,1.001]) {
                cylinder(rbct_laser_screw_extra_height, rbct_laser_screw_extra_radius, rbct_laser_screw_extra_radius, true, $fn=_fn_val);
            }
        }
        translate([rbct_laser_screw_back_x_offset, rbct_laser_screw_back_right_y_offset, rbct_laser_screw_z_offset]) {
            rotate([0,180,0]) {
                _flathead_screw(rbct_laser_screw_height, rbct_laser_screw_head_height, rbct_laser_screw_head_radius, rbct_laser_screw_shaft_radius);
            }
        }        
         translate([rbct_laser_screw_extra_back_x_offset, rbct_laser_screw_extra_back_right_y_offset, rbct_laser_screw_extra_z_offset]) {
            scale([1,1,1.001]) {
                cylinder(rbct_laser_screw_extra_height, rbct_laser_screw_extra_radius, rbct_laser_screw_extra_radius, true, $fn=_fn_val);
            }
        }
        translate([rbct_laser_board_screw_front_x_offset, rbct_laser_board_screw_left_y_offset, rbct_laser_board_screw_z_offset]) {
            cylinder(rbct_laser_board_screw_height, rbct_laser_board_screw_radius, rbct_laser_board_screw_radius, true, $fn=_fn_val);
            
            translate([0,0, -rbct_laser_board_screw_height/2.0 - (rbct_height-rbct_laser_board_screw_height)/2.0]) {
                _hexagon(rbct_height-rbct_laser_board_screw_height, _m2_5_nut_diameter);
            }
        }
        translate([rbct_laser_board_screw_front_x_offset, rbct_laser_board_screw_right_y_offset, rbct_laser_board_screw_z_offset]) {
            cylinder(rbct_laser_board_screw_height, rbct_laser_board_screw_radius, rbct_laser_board_screw_radius, true, $fn=_fn_val);
            translate([0,0, -rbct_laser_board_screw_height/2.0 - (rbct_height-rbct_laser_board_screw_height)/2.0]) {
                _hexagon(rbct_height-rbct_laser_board_screw_height, _m2_5_nut_diameter);
            }            
        }
        translate([rbct_laser_board_screw_back_x_offset, rbct_laser_board_screw_left_y_offset, rbct_laser_board_screw_z_offset]) {
            cylinder(rbct_laser_board_screw_height, rbct_laser_board_screw_radius, rbct_laser_board_screw_radius, true, $fn=_fn_val);
            translate([0,0, -rbct_laser_board_screw_height/2.0 - (rbct_height-rbct_laser_board_screw_height)/2.0]) {
                _hexagon(rbct_height-rbct_laser_board_screw_height, _m2_5_nut_diameter);
            }            
        }
        translate([rbct_laser_board_screw_back_x_offset, rbct_laser_board_screw_right_y_offset, rbct_laser_board_screw_z_offset]) {
            cylinder(rbct_laser_board_screw_height, rbct_laser_board_screw_radius, rbct_laser_board_screw_radius, true, $fn=_fn_val);
            translate([0,0, -rbct_laser_board_screw_height/2.0 - (rbct_height-rbct_laser_board_screw_height)/2.0]) {
                _hexagon(rbct_height-rbct_laser_board_screw_height, _m2_5_nut_diameter);
            }            
        }
        translate([rbct_laser_cable_x_offset, rbct_laser_cable_y_offset, rbct_laser_cable_z_offset]) {
            cube([rbct_laser_cable_length, rbct_laser_cable_width, rbct_laser_cable_height], true);
        }
        translate([rbct_imu_screw_front_x_offset, rbct_imu_screw_left_y_offset, rbct_imu_screw_z_offset]) {
            _m2_5_nut_insert_with_access(rbct_imu_access_length,rbct_imu_screw_height);
        }
        translate([rbct_imu_screw_front_x_offset, rbct_imu_screw_right_y_offset, rbct_imu_screw_z_offset]) {
            _m2_5_nut_insert_with_access(rbct_imu_access_length,rbct_imu_screw_height);
        }        
        translate([rbct_imu_screw_back_x_offset, rbct_imu_screw_left_y_offset, rbct_imu_screw_z_offset]) {
            _m2_5_nut_insert_with_access(rbct_imu_access_length,rbct_imu_screw_height);
        }   
        translate([rbct_imu_screw_back_x_offset, rbct_imu_screw_right_y_offset, rbct_imu_screw_z_offset]) {
            _m2_5_nut_insert_with_access(rbct_imu_access_length,rbct_imu_screw_height);
        }
        
        translate([rbctcl_wrt_rbct_x_offset,rbctcl_wrt_rbct_y_offset,rbctcl_wrt_rbct_z_offset]) {
            RacecarBackCoverTopConnectorLeft();
        }
        translate([rbctcr_wrt_rbct_x_offset,rbctcr_wrt_rbct_y_offset,rbctcr_wrt_rbct_z_offset]) {
            RacecarBackCoverTopConnectorRight();
        }
        translate([rbct_jetson_screw_front_x_offset, rbct_jetson_screw_left_y_offset, rbct_jetson_screw_z_offset]) {
            _m2_5_nut_insert_with_access(rbct_jetson_screw_access_length, rbct_jetson_screw_height);
        }
        translate([rbct_jetson_screw_front_x_offset, rbct_jetson_screw_right_y_offset, rbct_jetson_screw_z_offset]) {
            _m2_5_nut_insert_with_access(rbct_jetson_screw_access_length, rbct_jetson_screw_height);
        }
        translate([rbct_jetson_screw_back_x_offset, rbct_jetson_screw_left_y_offset, rbct_jetson_screw_z_offset]) {
            _m2_5_nut_insert_with_access(rbct_jetson_screw_access_length, rbct_jetson_screw_height);
        }
        translate([rbct_jetson_screw_back_x_offset, rbct_jetson_screw_right_y_offset, rbct_jetson_screw_z_offset]) {
            rotate([0,0,0]) {
                _m2_5_nut_insert_with_access(rbct_jetson_screw_access_length, rbct_jetson_screw_height);
            }
        }        
        translate([rbct_connector_screw_front_left_x_offset, rbct_connector_screw_left_y_offset, rbct_connector_screw_z_offset]) {
            rotate([0,0,30]) {
                _m2_5_nut_insert(rbct_connector_screw_height);
            }
            translate([0.0,(rbct_width/2.0 - rbct_connector_screw_left_y_offset)/2.0, -rbct_connector_screw_height/2.0 + _wall_thickness + _m2_5_nut_height/2.0]) {
                cube([_m2_5_nut_diameter, rbct_width/2.0 - rbct_connector_screw_left_y_offset, _m2_5_nut_height], true);
            }
        }
        translate([rbct_connector_screw_front_right_x_offset, rbct_connector_screw_right_y_offset, rbct_connector_screw_z_offset]) {
            rotate([0,0,30]) {
                _m2_5_nut_insert(rbct_connector_screw_height);
            }
            translate([0.0, -(rbct_connector_screw_right_y_offset - -rbct_width/2.0)/2.0, -rbct_connector_screw_height/2.0 + _wall_thickness + _m2_5_nut_height/2.0]) {
                cube([_m2_5_nut_diameter, rbct_connector_screw_right_y_offset - -rbct_width/2.0, _m2_5_nut_height], true);
            }            
        }
        translate([rbct_connector_screw_back_left_x_offset, rbct_connector_screw_left_y_offset, rbct_connector_screw_z_offset]) {
            rotate([0,0,30]) {            
                _m2_5_nut_insert(rbct_connector_screw_height);
            }
            translate([0.0,(rbct_width/2.0 - rbct_connector_screw_left_y_offset)/2.0, -rbct_connector_screw_height/2.0 + _wall_thickness + _m2_5_nut_height/2.0]) {
                cube([_m2_5_nut_diameter, rbct_width/2.0 - rbct_connector_screw_left_y_offset, _m2_5_nut_height], true);
            }            
            
        }
        translate([rbct_connector_screw_back_right_x_offset, rbct_connector_screw_right_y_offset, rbct_connector_screw_z_offset]) {
            rotate([0,0,30]) {
                _m2_5_nut_insert(rbct_connector_screw_height);
            }
            translate([0.0, -(rbct_connector_screw_right_y_offset - -rbct_width/2.0)/2.0, -rbct_connector_screw_height/2.0 + _wall_thickness + _m2_5_nut_height/2.0]) {
                cube([_m2_5_nut_diameter, rbct_connector_screw_right_y_offset - -rbct_width/2.0, _m2_5_nut_height], true);
            }            
        }        
        
    }
}

module RacecarBackCoverTopConnectorLeft(draw_nuts_and_bolts = false) {
    difference() {
        cube([rbctcl_length, rbctcl_width, rbctcl_height], true);
        if(draw_nuts_and_bolts) {
            translate([-rbctcl_wrt_rbct_x_offset+rbct_jetson_screw_front_x_offset, -rbctcl_wrt_rbct_y_offset + rbct_jetson_screw_left_y_offset, -rbctcl_wrt_rbct_z_offset + rbct_jetson_screw_z_offset]) {
                rotate([0,0,0]) {
                    _m2_5_nut_insert_with_access(rbct_jetson_screw_access_length, rbct_jetson_screw_height);
                }            
            }
            translate([-rbctcl_wrt_rbct_x_offset+rbct_jetson_screw_back_x_offset, -rbctcl_wrt_rbct_y_offset + rbct_jetson_screw_left_y_offset, -rbctcl_wrt_rbct_z_offset + rbct_jetson_screw_z_offset]) {
                rotate([0,0,0]) {
                    _m2_5_nut_insert_with_access(rbct_jetson_screw_access_length, rbct_jetson_screw_height);
                }            
            }
            translate([-rbctcl_wrt_rbct_x_offset+rbct_connector_screw_front_left_x_offset,-rbctcl_wrt_rbct_y_offset+rbct_connector_screw_left_y_offset, 0.0]) {
                cylinder(rbctcl_height, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
            }
            translate([-rbctcl_wrt_rbct_x_offset+rbct_connector_screw_back_left_x_offset,-rbctcl_wrt_rbct_y_offset+rbct_connector_screw_left_y_offset, 0.0]) {
                cylinder(rbctcl_height, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
            }            
        }
    }
}

module RacecarBackCoverTopConnectorRight(draw_nuts_and_bolts = false) {
    difference() {
        cube([rbctcr_length, rbctcr_width, rbctcr_height], true);
        if(draw_nuts_and_bolts) {
            translate([-rbctcr_wrt_rbct_x_offset+rbct_jetson_screw_front_x_offset, -rbctcr_wrt_rbct_y_offset + rbct_jetson_screw_right_y_offset, -rbctcr_wrt_rbct_z_offset + rbct_jetson_screw_z_offset]) {
                rotate([0,0,0]) {
                    _m2_5_nut_insert_with_access(rbct_jetson_screw_access_length, rbct_jetson_screw_height);
                }            
            }
            translate([-rbctcr_wrt_rbct_x_offset+rbct_jetson_screw_back_x_offset, -rbctcr_wrt_rbct_y_offset + rbct_jetson_screw_right_y_offset, -rbctcr_wrt_rbct_z_offset + rbct_jetson_screw_z_offset]) {
                rotate([0,0,0]) {
                    _m2_5_nut_insert_with_access(rbct_jetson_screw_access_length, rbct_jetson_screw_height);
                }            
            }
            translate([-rbctcr_wrt_rbct_x_offset+rbct_connector_screw_front_right_x_offset,-rbctcr_wrt_rbct_y_offset+rbct_connector_screw_right_y_offset, 0.0]) {
                cylinder(rbctcr_height, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
            }
            translate([-rbctcr_wrt_rbct_x_offset+rbct_connector_screw_back_right_x_offset,-rbctcr_wrt_rbct_y_offset+rbct_connector_screw_right_y_offset, 0.0]) {
                cylinder(rbctcr_height, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
            }            
        }
    }
}
