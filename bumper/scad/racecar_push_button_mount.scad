include <../../misc/racecar_global_utils.scad>

rpbm_base_height = 30;
rpbm_base_length = rpbm_base_height * (9.75/18.25);
rpbm_base_x_offset = 0.0;
rpbm_base_y_offset = 0.0;
rpbm_base_z_offset = 0.0;

rpbm_base_angle = atan2(rpbm_base_length, rpbm_base_height);

rpbm_bumper_screw_x_offset = rpbm_base_x_offset;
rpbm_bumper_screw_left_y_offset = 37.85/2.0+rpbm_base_y_offset;
rpbm_bumper_screw_right_y_offset = -(rpbm_bumper_screw_left_y_offset-rpbm_base_y_offset) + rpbm_base_y_offset;
rpbm_bumper_screw_z_offset = rpbm_base_z_offset - rpbm_base_height/2.0 + _wall_thickness + _m2_5_screw_head_radius;

rpbm_base_width = rpbm_bumper_screw_left_y_offset - rpbm_bumper_screw_right_y_offset + 2*_wall_thickness + _m2_5_nut_diameter;

rpbm_button_screw_x_offset = rpbm_bumper_screw_x_offset;
rpbm_button_screw_left_y_offset = rpbm_base_y_offset + 38.5/2.0;
rpbm_button_screw_right_y_offset = rpbm_base_y_offset - 38.5/2.0;
rpbm_button_screw_bottom_z_offset = rpbm_bumper_screw_z_offset + 2*_m2_5_screw_shaft_radius + 12;
rpbm_button_screw_top_z_offset = rpbm_button_screw_bottom_z_offset + 10;

rpbm_top_extend_length = _wall_thickness+_m2_5_nut_height;
rpbm_top_extend_width = rpbm_base_width;
rpbm_top_extend_height = 2*_m2_5_screw_shaft_radius + 2*_wall_thickness +(rpbm_button_screw_top_z_offset-rpbm_button_screw_bottom_z_offset);
rpbm_top_extend_x_offset = rpbm_base_x_offset-rpbm_base_length/2.0+rpbm_top_extend_length/2.0;
rpbm_top_extend_y_offset = rpbm_base_y_offset;
rpbm_top_extend_z_offset = rpbm_button_screw_bottom_z_offset + rpbm_top_extend_height/2.0-_m2_5_screw_shaft_radius-1.0*_wall_thickness;

rpbm_bumper_plate_length = 10.0;
rpbm_bumper_plate_width = 220;
rpbm_bumper_plate_height = 100;
rpbm_bumper_plate_x_offset = rpbm_base_x_offset - rpbm_base_length/2.0 - rpbm_bumper_plate_length/2.0;
rpbm_bumper_plate_y_offset = rpbm_base_y_offset;
rpbm_bumper_plate_z_offset = rpbm_base_z_offset;

rpbm_cap_radius = _m2_5_screw_head_radius+1.0;
rpbm_cap_height = (rpbm_base_z_offset + rpbm_base_height/2.0 - rpbm_bumper_screw_z_offset)*tan(rpbm_base_angle) - _wall_thickness + rpbm_bumper_plate_length;
rpbm_cap_x_offset = rpbm_base_x_offset - rpbm_base_length/2.0 - rpbm_bumper_plate_length + rpbm_cap_height/2.0;
rpbm_cap_left_y_offset = rpbm_bumper_screw_left_y_offset;
rpbm_cap_right_y_offset = rpbm_bumper_screw_right_y_offset;
rpbm_cap_z_offset = rpbm_bumper_screw_z_offset;

rpbm_bumper_cutoff_length = rpbm_bumper_plate_length;
rpbm_bumper_cutoff_width = rpbm_bumper_plate_width;
rpbm_bumper_cutoff_height = rpbm_bumper_plate_z_offset + rpbm_bumper_plate_height/2.0 - (rpbm_top_extend_z_offset + rpbm_top_extend_height/2.0);
rpbm_bumper_cutoff_x_offset = rpbm_bumper_plate_x_offset;
rpbm_bumper_cutoff_y_offset = rpbm_bumper_plate_y_offset;
rpbm_bumper_cutoff_z_offset = rpbm_bumper_plate_z_offset + rpbm_bumper_plate_height/2.0 - rpbm_bumper_cutoff_height/2.0;

if ($include_rpbm==undef) {
    RacecarPushButtonMount();
}

module RacecarPushButtonMount() {    
    
    difference() {
        union() {
            translate([rpbm_base_x_offset, rpbm_base_y_offset, rpbm_base_z_offset]) {
                rotate([0,0,0]) {
                    RPBMTriangle(rpbm_base_length, rpbm_base_width, rpbm_base_height);
                }
            }
            translate([rpbm_top_extend_x_offset, rpbm_top_extend_y_offset, rpbm_top_extend_z_offset]) {
                cube([rpbm_top_extend_length, rpbm_top_extend_width, rpbm_top_extend_height], true);
            }
            translate([rpbm_bumper_plate_x_offset, rpbm_bumper_plate_y_offset, rpbm_bumper_plate_z_offset]) {
                cube([rpbm_bumper_plate_length, rpbm_bumper_plate_width, rpbm_bumper_plate_height], true);
            }
        }

        translate([rpbm_bumper_screw_x_offset, rpbm_bumper_screw_left_y_offset, rpbm_bumper_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rpbm_base_length+0.001, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
            }
        }
        translate([rpbm_cap_x_offset, rpbm_cap_left_y_offset, rpbm_cap_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rpbm_cap_height, rpbm_cap_radius, rpbm_cap_radius, true, $fn=_fn_val);
            }
        }        
        
        translate([rpbm_bumper_screw_x_offset, rpbm_bumper_screw_right_y_offset, rpbm_bumper_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rpbm_base_length+0.001, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);                
            }
        }

        translate([rpbm_cap_x_offset, rpbm_cap_right_y_offset, rpbm_cap_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rpbm_cap_height, rpbm_cap_radius, rpbm_cap_radius, true, $fn=_fn_val);
            }
        }   
   
        translate([rpbm_bumper_cutoff_x_offset, rpbm_bumper_cutoff_y_offset, rpbm_bumper_cutoff_z_offset]) {
            cube([rpbm_bumper_cutoff_length, rpbm_bumper_cutoff_width, rpbm_bumper_cutoff_height], true);
        }

/*
        translate([rpbm_button_screw_x_offset, rpbm_button_screw_left_y_offset, rpbm_button_screw_bottom_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rpbm_base_length+0.001, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
                translate([0,0,(rpbm_base_length+0.001)/2.0 - ((rpbm_base_length+0.001)-_wall_thickness)/2.0]) {
                    _hexagon((rpbm_base_length+0.001)-_wall_thickness, _m2_5_nut_diameter);
                }
            }
        }
        translate([rpbm_button_screw_x_offset, rpbm_button_screw_right_y_offset, rpbm_button_screw_bottom_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rpbm_base_length+0.001, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);       
                translate([0,0,(rpbm_base_length+0.001)/2.0 - ((rpbm_base_length+0.001)-_wall_thickness)/2.0]) {
                    _hexagon((rpbm_base_length+0.001)-_wall_thickness, _m2_5_nut_diameter);
                }
            }
        }
        
        translate([rpbm_button_screw_x_offset, rpbm_button_screw_left_y_offset, rpbm_button_screw_top_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rpbm_base_length+0.001, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
                translate([0,0,(rpbm_base_length+0.001)/2.0 - ((rpbm_base_length+0.001)-_wall_thickness)/2.0]) {
                    _hexagon((rpbm_base_length+0.001)-_wall_thickness, _m2_5_nut_diameter);
                }
            }
        }
        translate([rpbm_button_screw_x_offset, rpbm_button_screw_right_y_offset, rpbm_button_screw_top_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rpbm_base_length+0.001, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);                
                translate([0,0,(rpbm_base_length+0.001)/2.0 - ((rpbm_base_length+0.001)-_wall_thickness)/2.0]) {
                    _hexagon((rpbm_base_length+0.001)-_wall_thickness, _m2_5_nut_diameter);
                }            
            }
        }        
*/
    }
}

module RPBMTriangle(l, w, h) {

    translate([-l/2,-w/2,-h/2]) {
        _triangle(l,w,h);
    }
       
}