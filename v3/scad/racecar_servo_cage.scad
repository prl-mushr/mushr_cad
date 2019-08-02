$include_rcb = true;
include <racecar_crossbar_body.scad>

rsc_length = 55.67;
rsc_width = 21.67;
rsc_height = 32.67+rcus_height;

rsc_knub_separation = 47.95;
rsc_knub_radius = 1.25;
rsc_knub_height = 2.25;
rsc_knub_edge_offset = 3.5+rsc_knub_radius;
rsc_knub_front_x_offset = rsc_knub_separation/2.0;
rsc_knub_back_x_offset = -rsc_knub_separation/2.0;
rsc_knub_y_offset = -rsc_width/2.0+ rsc_knub_edge_offset;
rsc_knub_z_offset = -rsc_height/2.0-rsc_knub_height/2.0;

rsc_bottom_screw_knub_offset = 8.0;    
rsc_bottom_screw_height = 15.0;
rsc_bottom_screw_front_x_offset = rsc_knub_front_x_offset;
rsc_bottom_screw_back_x_offset = rsc_knub_back_x_offset;
rsc_bottom_screw_y_offset = rsc_knub_y_offset + rsc_bottom_screw_knub_offset;
rsc_bottom_screw_z_offset = -rsc_height/2.0+rsc_bottom_screw_height/2.0;    

rsc_wrt_rcb_x_offset = rcb_body_screw_front_x_offset + rsc_knub_separation/2.0+22.0;
rsc_wrt_rcb_y_offset = rcb_body_screw_y_offset-13.15-rsc_bottom_screw_knub_offset-rsc_knub_edge_offset+rsc_width/2.0;
rsc_wrt_rcb_z_offset = rcb_height/2.0 - rsc_height/2.0;

/*
rsc_top_screw_from_edge = 5.5;
rsc_top_screw_height = 10.0;
rsc_top_screw_front_x_offset = rsc_length/2.0-rsc_top_screw_from_edge;
rsc_top_screw_back_x_offset = -rsc_length/2.0+rsc_top_screw_from_edge;
rsc_top_screw_y_offset = rsc_knub_y_offset;
rsc_top_screw_z_offset = rsc_height/2.0-rsc_top_screw_height/2.0;
*/

if ($include_rsc==undef) {
    RacecarServoCage();
}

module RacecarServoCage() {

    rsc_hole_length = 42.67;
    rsc_hole_width = rsc_width;
    rsc_hole_height = 21.5;
    rsc_hole_x_offset = 0.0;
    rsc_hole_y_offset = 0.0;
    rsc_hole_z_offset = -rsc_height/2.0+rsc_hole_height/2.0;    
    
    rsc_bottom_nut_access_length = rsc_bottom_screw_front_x_offset - rsc_bottom_screw_back_x_offset;
    rsc_bottom_nut_access_width = _m3_nut_diameter;
    rsc_bottom_nut_access_height = _m3_nut_height;
    rsc_bottom_nut_access_x_offset = (rsc_bottom_screw_front_x_offset + rsc_bottom_screw_back_x_offset)/2.0;
    rsc_bottom_nut_access_y_offset = rsc_bottom_screw_y_offset;
    rsc_bottom_nut_access_z_offset = rsc_bottom_screw_z_offset - rsc_bottom_screw_height/2.0 + _wall_thickness+rsc_bottom_nut_access_height/2.0;
    
    rsc_face_screw_x_separation = 48.75;
    rsc_face_screw_z_separation = 10.0;
    rsc_face_screw_from_bottom = 5.85;
    rsc_face_screw_height = 9;
    rsc_face_screw_front_x_offset = rsc_face_screw_x_separation/2.0;
    rsc_face_screw_back_x_offset = -rsc_face_screw_x_separation/2.0;
    rsc_face_screw_y_offset = -rsc_width/2.0+rsc_face_screw_height/2.0;
    rsc_face_screw_bottom_z_offset = -rsc_height/2.0+ rsc_face_screw_from_bottom;
    rsc_face_screw_top_z_offset = rsc_face_screw_bottom_z_offset + rsc_face_screw_z_separation;
    
    rsc_face_nut_access_length = rsc_face_screw_front_x_offset - rsc_face_screw_back_x_offset;
    rsc_face_nut_access_width = _m3_nut_height;
    rsc_face_nut_access_height = _m3_nut_diameter;
    rsc_face_nut_access_x_offset = (rsc_face_screw_front_x_offset + rsc_face_screw_back_x_offset)/2.0;
    rsc_face_nut_access_y_offset = -rsc_width/2.0+_wall_thickness+rsc_face_nut_access_width/2.0;
    rsc_face_nut_access_bottom_z_offset = rsc_face_screw_bottom_z_offset;
    rsc_face_nut_access_top_z_offset = rsc_face_screw_top_z_offset;

    rsc_cord_length = rsc_length;
    rsc_cord_width = rsc_width-17.5;
    rsc_cord_height = rsc_height;
    rsc_cord_x_offset = 0.0;
    rsc_cord_y_offset = rsc_width/2.0-rsc_cord_width/2.0;
    rsc_cord_z_offset = -rsc_height/2.0+rsc_cord_height/2.0;  
    
    /*
    rsc_top_nut_access_length = rsc_top_screw_from_edge;
    rsc_top_nut_access_width = _m2_5_nut_diameter;
    rsc_top_nut_access_height = _m2_5_nut_height;
    rsc_top_nut_access_front_x_offset = rsc_length/2.0-rsc_top_nut_access_length/2.0;
    rsc_top_nut_access_back_x_offset = -rsc_length/2.0+rsc_top_nut_access_length/2.0;
    rsc_top_nut_access_y_offset = rsc_top_screw_y_offset;
    rsc_top_nut_access_z_offset = rsc_top_screw_z_offset + rsc_top_screw_height/2.0 - _wall_thickness - rsc_top_nut_access_height/2.0;
    */
    difference() {
        union() {
            translate([0.0, 0.0, 0.0]) {
                cube([rsc_length, rsc_width, rsc_height], true);
            }
            translate([rsc_knub_front_x_offset, rsc_knub_y_offset, rsc_knub_z_offset]) {
                cylinder(rsc_knub_height, rsc_knub_radius, rsc_knub_radius, true, $fn=_fn_val);
            }
            translate([rsc_knub_back_x_offset, rsc_knub_y_offset, rsc_knub_z_offset]) {
                cylinder(rsc_knub_height, rsc_knub_radius, rsc_knub_radius, true, $fn=_fn_val);
            }            
        }
        translate([rsc_hole_x_offset, rsc_hole_y_offset, rsc_hole_z_offset]) {
            cube([rsc_hole_length, rsc_hole_width, rsc_hole_height], true);
        } 
        translate([rsc_bottom_screw_front_x_offset, rsc_bottom_screw_y_offset, rsc_bottom_screw_z_offset]) {
            _m3_nut_insert(rsc_bottom_screw_height);
        }
        translate([rsc_bottom_screw_back_x_offset, rsc_bottom_screw_y_offset, rsc_bottom_screw_z_offset]) {
            _m3_nut_insert(rsc_bottom_screw_height);
        }
        translate([rsc_bottom_nut_access_x_offset, rsc_bottom_nut_access_y_offset, rsc_bottom_nut_access_z_offset]) {
            cube([rsc_bottom_nut_access_length, rsc_bottom_nut_access_width, rsc_bottom_nut_access_height], true);
        }
        translate([rsc_face_screw_front_x_offset, rsc_face_screw_y_offset, rsc_face_screw_bottom_z_offset]) {
            rotate([0,0,0]) {
                rotate([-90,0,0]) {
                    _m3_nut_insert(rsc_face_screw_height);
                }
            }
        }
        translate([rsc_face_screw_back_x_offset, rsc_face_screw_y_offset, rsc_face_screw_bottom_z_offset]) {
            rotate([0,0,0]) {
                rotate([-90,0,0]) {
                    _m3_nut_insert(rsc_face_screw_height);
                }
            }
        }
        translate([rsc_face_screw_front_x_offset, rsc_face_screw_y_offset, rsc_face_screw_top_z_offset]) {
            rotate([0,0,0]) {
                rotate([-90,0,0]) {
                    _m3_nut_insert(rsc_face_screw_height);
                }
            }
        }
        translate([rsc_face_screw_back_x_offset, rsc_face_screw_y_offset, rsc_face_screw_top_z_offset]) {
            rotate([0,0,0]) {
                rotate([-90,0,0]) {
                    _m3_nut_insert(rsc_face_screw_height);
                }
            }
        }
        translate([rsc_face_nut_access_x_offset, rsc_face_nut_access_y_offset, rsc_face_nut_access_top_z_offset]) {
            cube([rsc_face_nut_access_length, rsc_face_nut_access_width, rsc_face_nut_access_height], true); 
        }
        translate([rsc_face_nut_access_x_offset, rsc_face_nut_access_y_offset, rsc_face_nut_access_bottom_z_offset]) {
            cube([rsc_face_nut_access_length, rsc_face_nut_access_width, rsc_face_nut_access_height], true); 
        }    
        translate([rsc_cord_x_offset, rsc_cord_y_offset, rsc_cord_z_offset]) {
            cube([rsc_cord_length, rsc_cord_width, rsc_cord_height], true);
        }
        /*
        translate([rsc_top_screw_front_x_offset, rsc_top_screw_y_offset, rsc_top_screw_z_offset]) {
            rotate([180,0,0]) {
                _m2_5_nut_insert(rsc_top_screw_height);
            }
        }
        translate([rsc_top_screw_back_x_offset, rsc_top_screw_y_offset, rsc_top_screw_z_offset]) {
            rotate([180,0,0]) {
                _m2_5_nut_insert(rsc_top_screw_height);
            }
        } 
        translate([rsc_top_nut_access_front_x_offset, rsc_top_nut_access_y_offset, rsc_top_nut_access_z_offset]) {
            cube([rsc_top_nut_access_length, rsc_top_nut_access_width, rsc_top_nut_access_height], true);
        }
        translate([rsc_top_nut_access_back_x_offset, rsc_top_nut_access_y_offset, rsc_top_nut_access_z_offset]) {
            cube([rsc_top_nut_access_length, rsc_top_nut_access_width, rsc_top_nut_access_height], true);
        }
        */
            
    }    
}