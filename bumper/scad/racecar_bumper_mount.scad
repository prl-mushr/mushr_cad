include <../../misc/racecar_global_utils.scad>

rbm_length = _m2_5_nut_diameter+2*_wall_thickness;
rbm_x_offset = 0.0;
rbm_y_offset = 0.0;
rbm_z_offset = 0.0;

rbm_neck_radius = 4.0;
rbm_neck_height = rbm_length;
rbm_neck_x_offset = rbm_x_offset;
rbm_neck_y_offset = rbm_y_offset;
rbm_neck_z_offset = rbm_z_offset;

rbm_button_radius = 20.0/2.0;
rbm_button_length = rbm_length - _wall_thickness;
rbm_button_width = 2*rbm_button_radius;
rbm_button_height = 2*rbm_button_radius;
rbm_button_x_offset = rbm_x_offset + rbm_length/2.0 - rbm_button_length/2.0;
rbm_button_y_offset = rbm_y_offset;
rbm_button_z_offset = rbm_z_offset;

rbm_width = 2*rbm_button_radius+4*_wall_thickness+4*_m2_5_screw_shaft_radius;
rbm_height = 2*rbm_button_radius + 4*_wall_thickness + 2*_m2_5_nut_diameter;

rbm_bumper_screw_radius = _m2_5_screw_shaft_radius;
rbm_bumper_screw_height = rbm_length;
rbm_bumper_screw_x_offset = rbm_x_offset;
rbm_bumper_screw_left_y_offset = rbm_y_offset + rbm_width/2.0 - _wall_thickness - rbm_bumper_screw_radius;
rbm_bumper_screw_right_y_offset = rbm_y_offset - rbm_width/2.0 + _wall_thickness + rbm_bumper_screw_radius;
rbm_bumper_screw_z_offset = rbm_z_offset;

rbm_hold_radius = _m2_5_screw_shaft_radius;
rbm_hold_height = rbm_width - 2*_wall_thickness;
rbm_hold_x_offset = rbm_x_offset;
rbm_hold_y_offset = rbm_y_offset;
rbm_hold_top_z_offset = rbm_z_offset + rbm_height/2.0 - _wall_thickness - _m2_5_screw_shaft_radius;
rbm_hold_bottom_z_offset = rbm_z_offset - rbm_height/2.0 + _wall_thickness + _m2_5_screw_shaft_radius;

rbm_hold_cap_radius = _m2_5_screw_head_radius;
rbm_hold_cap_height = _wall_thickness;
rbm_hold_cap_x_offset = rbm_hold_x_offset;
rbm_hold_cap_y_offset = rbm_hold_y_offset + rbm_hold_height/2.0 + rbm_hold_cap_height/2.0;
rbm_hold_cap_top_z_offset = rbm_hold_top_z_offset;
rbm_hold_cap_bottom_z_offset = rbm_hold_bottom_z_offset;

rbm_hold_nut_height = _m2_5_nut_height;
rbm_hold_nut_diameter = _m2_5_nut_diameter;
rbm_hold_nut_x_offset = rbm_hold_x_offset;
rbm_hold_nut_y_offset = rbm_hold_y_offset - _wall_thickness - rbm_hold_nut_height/2.0;
rbm_hold_nut_top_z_offset = rbm_hold_top_z_offset;
rbm_hold_nut_bottom_z_offset = rbm_hold_bottom_z_offset;

rbm_hold_access_length = rbm_hold_nut_diameter;
rbm_hold_access_width = rbm_hold_nut_height;
rbm_hold_access_height = rbm_y_offset + rbm_height/2.0 - rbm_hold_nut_top_z_offset;
rbm_hold_access_x_offset = rbm_hold_nut_x_offset;
rbm_hold_access_y_offset = rbm_hold_nut_y_offset;
rbm_hold_access_top_z_offset = rbm_hold_nut_top_z_offset + rbm_hold_access_height/2.0;
rbm_hold_access_bottom_z_offset = rbm_hold_nut_bottom_z_offset - rbm_hold_access_height/2.0;

if ($include_rbm==undef) {
    //LeftRacecarButtonMount();
    RightRacecarButtonMount();
}

module LeftRacecarButtonMount() {
    lrbm_length = rbm_length;
    lrbm_width = rbm_width/2.0;
    lrbm_height = rbm_height;
    lrbm_x_offset = rbm_x_offset;
    lrbm_y_offset = rbm_y_offset + rbm_width/2.0 - lrbm_width/2.0;
    lrbm_z_offset = rbm_z_offset;
    
    difference() {
        RacecarButtonMount();
        translate([lrbm_x_offset, lrbm_y_offset, lrbm_z_offset]) {
            cube([lrbm_length, lrbm_width, lrbm_height], true);
        }
    }
}

module RightRacecarButtonMount() {
    rrbm_length = rbm_length;
    rrbm_width = rbm_width/2.0;
    rrbm_height = rbm_height;
    rrbm_x_offset = rbm_x_offset;
    rrbm_y_offset = rbm_y_offset - rbm_width/2.0 + rrbm_width/2.0;
    rrbm_z_offset = rbm_z_offset;
    
    difference() {
        RacecarButtonMount();
        translate([rrbm_x_offset, rrbm_y_offset, rrbm_z_offset]) {
            cube([rrbm_length, rrbm_width, rrbm_height], true);
        }
    }    
}

module RacecarButtonMount() {
    
    difference() {
        translate([rbm_x_offset, rbm_y_offset, rbm_z_offset]) {
            cube([rbm_length, rbm_width, rbm_height], true);
        }
        
        translate([rbm_neck_x_offset, rbm_neck_y_offset, rbm_neck_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rbm_neck_height+0.001, rbm_neck_radius, rbm_neck_radius, true, $fn=_fn_val);
            }
        }
        
        translate([rbm_button_x_offset, rbm_button_y_offset, rbm_button_z_offset]) {
            cube([rbm_button_length, rbm_button_width, rbm_button_height], true);
        }
        
        translate([rbm_bumper_screw_x_offset+0.001, rbm_bumper_screw_left_y_offset, rbm_bumper_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rbm_bumper_screw_height, rbm_bumper_screw_radius, rbm_bumper_screw_radius, true, $fn=_fn_val);
                translate([0,0,-rbm_bumper_screw_height/2.0+(rbm_bumper_screw_height-_wall_thickness)/2.0-0.002]) {
                    _hexagon(rbm_bumper_screw_height-_wall_thickness, _m2_5_nut_diameter);
                }
            }
        }

        translate([rbm_bumper_screw_x_offset+0.001, rbm_bumper_screw_right_y_offset, rbm_bumper_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rbm_bumper_screw_height, rbm_bumper_screw_radius, rbm_bumper_screw_radius, true, $fn=_fn_val);
                translate([0,0,-rbm_bumper_screw_height/2.0+(rbm_bumper_screw_height-_wall_thickness)/2.0-0.002]) {
                    _hexagon(rbm_bumper_screw_height-_wall_thickness, _m2_5_nut_diameter);
                }
            }
        }
        
        translate([rbm_hold_x_offset, rbm_hold_y_offset, rbm_hold_top_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rbm_hold_height, rbm_hold_radius, rbm_hold_radius, true, $fn=_fn_val);
            }
        }

        translate([rbm_hold_cap_x_offset, rbm_hold_cap_y_offset, rbm_hold_cap_top_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rbm_hold_cap_height, rbm_hold_cap_radius, rbm_hold_cap_radius, true, $fn=_fn_val);
            }
        }

        translate([rbm_hold_x_offset, rbm_hold_y_offset, rbm_hold_bottom_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rbm_hold_height, rbm_hold_radius, rbm_hold_radius, true, $fn=_fn_val);
            }
        }

        translate([rbm_hold_cap_x_offset, rbm_hold_cap_y_offset, rbm_hold_cap_bottom_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rbm_hold_cap_height, rbm_hold_cap_radius, rbm_hold_cap_radius, true, $fn=_fn_val);
            }
        }
        
        translate([rbm_hold_nut_x_offset, rbm_hold_nut_y_offset, rbm_hold_nut_top_z_offset]) {
            rotate([90,0,0]) {
                rotate([0,0,30]) {
                    _hexagon(rbm_hold_nut_height, rbm_hold_nut_diameter);
                }
            }
        }
        
        translate([rbm_hold_access_x_offset, rbm_hold_access_y_offset, rbm_hold_access_top_z_offset]) {

            cube([rbm_hold_access_length, rbm_hold_access_width, rbm_hold_access_height], true);
        }        

        translate([rbm_hold_nut_x_offset, rbm_hold_nut_y_offset, rbm_hold_nut_bottom_z_offset]) {
            rotate([90,0,0]) {
                rotate([0,0,30]) {
                    _hexagon(rbm_hold_nut_height, rbm_hold_nut_diameter);
                }
            }
        }
        
        translate([rbm_hold_access_x_offset, rbm_hold_access_y_offset, rbm_hold_access_bottom_z_offset]) {

            cube([rbm_hold_access_length, rbm_hold_access_width, rbm_hold_access_height], true);
        }
        
    }
        
}