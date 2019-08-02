include <../../misc/racecar_global_utils.scad>

$include_rcb = true;
include <racecar_crossbar_body.scad>

$include_rsc = true;
include <racecar_servo_cage.scad>

$include_rulfs = true;
include <racecar_upper_left_foundation_support.scad>

$include_rbf = true;
include <racecar_back_foundation.scad>

rff_length = 110.0;
rff_width = 130.0;
rff_height = 5.0;

rff_wrt_rcb_x_offset = rff_length/2.0 + rcb_body_screw_front_x_offset - (rcb_body_screw_front_x_offset - rcb_body_screw_back_x_offset) /2.0;
rff_wrt_rcb_y_offset = 0.0;
rff_wrt_rcb_z_offset = rff_height/2.0 + rcb_height/2.0;

rff_base_length = (rcus_screw_x_offset+rcus_wrt_rcb_x_offset)-(rcb_body_screw_front_x_offset+rcb_body_screw_back_x_offset)/2.0-10;
rff_base_width = rff_width;
rff_base_height = rff_height;
rff_base_x_offset = -rff_length/2.0+rff_base_length/2.0;
rff_base_y_offset = 0.0;
rff_base_z_offset = 0.0;

rff_head_length = rff_length - rff_base_length;
rff_head_width = 60.0;
rff_head_height = rff_height;
rff_head_x_offset = rff_length/2.0-rff_head_length/2.0;
rff_head_y_offset = 0.0;
rff_head_z_offset = 0.0;

rff_head_back_left_x = rff_length/2.0-rff_head_length;
rff_head_back_left_y = rff_base_width/2.0;
rff_head_back_left_z = rff_height/2.0;

rff_head_front_left_x = rff_length/2.0;
rff_head_front_left_y = rff_head_width/2.0;
rff_head_front_left_z = rff_head_back_left_z;

rff_head_front_right_x = rff_head_front_left_x;
rff_head_front_right_y = -rff_head_width/2.0;
rff_head_front_right_z = rff_head_front_left_z;

rff_head_back_right_x = rff_head_back_left_x;
rff_head_back_right_y = -rff_base_width/2.0;
rff_head_back_right_z = rff_head_front_right_z;

rff_front_wall_thickness = 5.0;
rff_front_wall_height = 6.0;

rff_front_wall_back_outer_left_x = rff_head_back_left_x;
rff_front_wall_back_outer_left_y = rff_head_back_left_y - _wall_thickness;

rff_front_wall_back_inner_left_x = rff_front_wall_back_outer_left_x;
rff_front_wall_back_inner_left_y = rff_front_wall_back_outer_left_y - rff_front_wall_thickness;

rff_front_wall_front_outer_left_x = rff_head_front_left_x - _wall_thickness;
rff_front_wall_front_outer_left_y = rff_front_wall_back_outer_left_y+(rff_front_wall_front_outer_left_x-rff_front_wall_back_outer_left_x)*(rff_head_front_left_y-rff_head_back_left_y)/(rff_head_front_left_x-rff_head_back_left_x);

rff_front_wall_front_inner_left_x = rff_front_wall_front_outer_left_x;
rff_front_wall_front_inner_left_y = rff_front_wall_front_outer_left_y-rff_front_wall_thickness;

rff_front_wall_back_outer_right_x = rff_front_wall_back_outer_left_x;
rff_front_wall_back_outer_right_y = rff_head_back_right_y + _wall_thickness;

rff_front_wall_back_inner_right_x = rff_front_wall_back_outer_right_x;
rff_front_wall_back_inner_right_y = rff_front_wall_back_outer_right_y + rff_front_wall_thickness;

rff_front_wall_front_outer_right_x = rff_front_wall_front_outer_left_x;
rff_front_wall_front_outer_right_y = rff_front_wall_back_outer_right_y + (rff_front_wall_front_outer_right_x-rff_front_wall_back_outer_right_x)*((rff_head_front_right_y-rff_head_back_right_y)/(rff_head_front_right_x-rff_head_back_right_x));

rff_front_wall_front_inner_right_x = rff_front_wall_front_outer_right_x;
rff_front_wall_front_inner_right_y = rff_front_wall_front_outer_right_y + rff_front_wall_thickness;

rff_front_wall_bottom_z = rff_height/2.0;
rff_front_wall_top_z = rff_front_wall_bottom_z + rff_front_wall_height;

rff_side_wall_length = rff_length - rff_head_length;
rff_side_wall_width = rff_front_wall_thickness;
rff_side_wall_height = rff_front_wall_height;
rff_side_wall_x_offset = rff_head_x_offset - rff_head_length/2.0-rff_side_wall_length/2.0;
rff_side_wall_left_y_offset = rff_base_y_offset + rff_base_width/2.0-_wall_thickness-rff_side_wall_width/2.0;
rff_side_wall_right_y_offset = rff_base_y_offset - rff_base_width/2.0+_wall_thickness+rff_side_wall_width/2.0;
rff_side_wall_z_offset = rff_base_z_offset + rff_base_height/2.0+rff_side_wall_height/2.0;    

rff_side_screw_height = rff_side_wall_width;
rff_side_screw_front_x_offset = rff_side_wall_x_offset + rff_side_wall_length/2.0 - _m2_5_screw_head_radius - _wall_thickness;
rff_side_screw_back_x_offset = rff_side_wall_x_offset - rff_side_wall_length/2.0 + _m2_5_screw_head_radius + _wall_thickness;    
rff_side_screw_left_y_offset = rff_side_wall_left_y_offset;
rff_side_screw_right_y_offset = rff_side_wall_right_y_offset;
rff_side_screw_z_offset = rff_side_wall_z_offset;

rff_front_wall_screw_height = rff_front_wall_thickness;
rff_front_wall_screw_x_offset = rff_head_x_offset +rff_head_length/2.0- _wall_thickness - rff_front_wall_screw_height/2.0;
rff_front_wall_screw_y_offset = rff_head_y_offset;
rff_front_wall_screw_z_offset = rff_head_z_offset + rff_head_height/2.0 + rff_front_wall_height/2.0;

rff_battery_wall_front_length = rbf_battery_wall_back_length;
rff_battery_wall_front_width = rbf_battery_wall_back_width;
rff_battery_wall_front_height = rbf_battery_wall_back_height;
rff_battery_wall_front_x_offset = -rff_wrt_rcb_x_offset+rbf_wrt_rcb_x_offset+rbf_battery_wall_back_x_offset+rbf_battery_wall_back_length/2.0+rff_battery_wall_front_length/2.0+137.5;
rff_battery_wall_front_y_offset = -rff_wrt_rcb_y_offset+rbf_wrt_rcb_y_offset+rbf_battery_wall_back_y_offset;
rff_battery_wall_front_z_offset = rff_height/2.0 + rff_battery_wall_front_height/2.0;

if ($include_rff==undef) {
    RacecarFrontFoundation();
}

module RacecarFrontFoundation() {
   
    rff_crossbar_body_screw_height = rff_height;
    rff_crossbar_body_screw_x_offset = -rff_wrt_rcb_x_offset+rcb_body_screw_front_x_offset;
    rff_crossbar_body_screw_y_offset = -rff_wrt_rcb_y_offset+rcb_body_screw_y_offset;
    rff_crossbar_body_screw_z_offset = 0.0;        
    
    rff_crossbar_top_screw_height = rff_height;
    rff_crossbar_top_screw_x_offset = -rff_wrt_rcb_x_offset+rcus_wrt_rcb_x_offset+rcus_screw_x_offset;
    rff_crossbar_top_screw_left_y_offset = -rff_wrt_rcb_y_offset+rcus_wrt_rcb_y_offset+rcus_screw_left_y_offset;
    rff_crossbar_top_screw_right_y_offset = -rff_wrt_rcb_y_offset+rcus_wrt_rcb_y_offset+rcus_screw_right_y_offset;
    rff_crossbar_top_screw_z_offset = 0.0;    
    
    /*
    rff_rsc_screw_height = rff_height;
    rff_rsc_screw_front_x_offset = -rff_wrt_rcb_x_offset+rsc_wrt_rcb_x_offset+rsc_top_screw_front_x_offset;
    rff_rsc_screw_back_x_offset = -rff_wrt_rcb_x_offset+rsc_wrt_rcb_x_offset+rsc_top_screw_back_x_offset;
    rff_rsc_screw_y_offset = -rff_wrt_rcb_y_offset+rsc_wrt_rcb_y_offset+rsc_top_screw_y_offset;
    rff_rsc_screw_z_offset = 0.0;
    */
    
    rff_rulfs_screw_height = rff_height;
    rff_rulfs_screw_x_offset = -rff_wrt_rcb_x_offset + rulfs_wrt_rcb_x_offset;
    rff_rulfs_screw_left_y_offset = -rff_wrt_rcb_y_offset + rulfs_wrt_rcb_y_offset + rulfs_width/2.0 - rfs_screw_from_edge;
    rff_rulfs_screw_right_y_offset = -rff_wrt_rcb_y_offset + rulfs_wrt_rcb_y_offset - rulfs_width/2.0 + rfs_screw_from_edge;    
    rff_rulfs_screw_z_offset = 0.0;
    
    rff_battery_wall_side_length = rbf_battery_wall_side_length;
    rff_battery_wall_side_width = rbf_battery_wall_side_width;
    rff_battery_wall_side_height = rbf_battery_wall_side_height;
    rff_battery_wall_side_x_offset = rff_battery_wall_front_x_offset - rff_battery_wall_front_length/2.0 - rff_battery_wall_side_length/2.0;
    rff_battery_wall_side_left_y_offset = rbf_battery_wall_side_left_y_offset;
    rff_battery_wall_side_right_y_offset = rbf_battery_wall_side_right_y_offset;
    rff_battery_wall_side_z_offset = rff_height/2.0 + rff_battery_wall_side_height/2.0;
    
    rff_battery_wall_round_length = (rff_battery_wall_side_length + rff_battery_wall_front_length);
    rff_battery_wall_round_width = rff_battery_wall_side_width;
    rff_battery_wall_round_height = 14.0 - rff_battery_wall_side_height;
    rff_battery_wall_round_x_offset = rff_battery_wall_side_x_offset - rff_battery_wall_side_length/2.0 +  rff_battery_wall_round_length/2.0;
    rff_battery_wall_round_left_y_offset = rff_battery_wall_side_left_y_offset;
    rff_battery_wall_round_right_y_offset = rff_battery_wall_side_right_y_offset;
    rff_battery_wall_round_z_offset = rff_battery_wall_side_z_offset + rff_battery_wall_side_height/2.0;    
    
    /*
    rff_rsc_screw_access_height = rff_battery_wall_side_height + rff_battery_wall_round_height;
    rff_rsc_screw_access_x_offset = rff_rsc_screw_back_x_offset;
    rff_rsc_screw_access_y_offset = rff_rsc_screw_y_offset;
    rff_rsc_screw_access_z_offset = rff_height/2.0 + rff_rsc_screw_access_height/2.0;
    */
    
    rff_dzs_screw_height = rff_height;
    rff_dzs_screw_back_x_offset = rff_battery_wall_front_x_offset + rff_battery_wall_front_length/2.0 + _m2_5_screw_head_radius+_wall_thickness+7.5;
    rff_dzs_screw_front_x_offset = rff_dzs_screw_back_x_offset+36.75;
    rff_dzs_screw_left_y_offset = rff_battery_wall_front_y_offset + 53.0/2.0;
    rff_dzs_screw_right_y_offset = rff_battery_wall_front_y_offset - 53.0/2.0;
    rff_dzs_screw_z_offset = rff_head_z_offset;
    
    rff_lm2596_screw_height = rff_height;
    rff_lm2596_screw_back_x_offset = rff_battery_wall_front_x_offset + rff_battery_wall_front_length/2.0 + _m2_5_screw_head_radius+_wall_thickness;
    rff_lm2596_screw_front_x_offset = rff_lm2596_screw_back_x_offset+31.0;
    rff_lm2596_screw_left_y_offset = rff_battery_wall_front_y_offset + 53.75/2.0;
    rff_lm2596_screw_right_y_offset = rff_battery_wall_front_y_offset - 53.75/2.0;
    rff_lm2596_screw_z_offset = rff_head_z_offset;
    
    rff_drok_screw_height = rff_height;
    rff_drok_screw_back_x_offset = rff_lm2596_screw_back_x_offset;
    rff_drok_screw_front_x_offset = rff_drok_screw_back_x_offset+38.0;
    rff_drok_screw_left_y_offset = rff_battery_wall_front_y_offset + 69.5/2.0;
    rff_drok_screw_right_y_offset = rff_battery_wall_front_y_offset - 69.5/2.0;
    rff_drok_screw_z_offset = rff_head_z_offset;
    
    rff_front_hole_length = 2*_m3_screw_head_radius;
    rff_front_hole_width = 10.0;
    rff_front_hole_height = rff_height;
    rff_front_hole_x_offset = rff_crossbar_top_screw_x_offset;
    rff_front_hole_left_y_offset = rff_crossbar_top_screw_left_y_offset + _m3_screw_head_radius + _wall_thickness + rff_front_hole_width/2.0;
    rff_front_hole_right_y_offset = rff_crossbar_top_screw_right_y_offset - _m3_screw_head_radius - _wall_thickness - rff_front_hole_width/2.0;
    rff_front_hole_z_offset = rff_head_z_offset;
    
    difference() {
        union() {
            translate([rff_base_x_offset, rff_base_y_offset, rff_base_z_offset]) {
                cube([rff_base_length, rff_base_width, rff_base_height], true);
            }            
            translate([rff_head_x_offset, rff_head_y_offset, rff_head_z_offset]) {
                _trapezoid(rff_head_width, rff_base_width, rff_head_length, rff_head_height);
            }
            polyhedron(points=[[rff_front_wall_back_outer_left_x,rff_front_wall_back_outer_left_y,rff_front_wall_bottom_z],[rff_front_wall_back_inner_left_x,rff_front_wall_back_inner_left_y,rff_front_wall_bottom_z],[rff_front_wall_front_outer_left_x,rff_front_wall_front_outer_left_y,rff_front_wall_bottom_z],[rff_front_wall_front_inner_left_x,rff_front_wall_front_inner_left_y,rff_front_wall_bottom_z],[rff_front_wall_back_outer_left_x,rff_front_wall_back_outer_left_y,rff_front_wall_top_z],[rff_front_wall_back_inner_left_x,rff_front_wall_back_inner_left_y,rff_front_wall_top_z],[rff_front_wall_front_outer_left_x,rff_front_wall_front_outer_left_y,rff_front_wall_top_z],[rff_front_wall_front_inner_left_x,rff_front_wall_front_inner_left_y,rff_front_wall_top_z]],
                faces=[[1,0,4,5],[4,0,2,6],[4,6,7,5],[5,7,3,1],[0,1,3,2],[7,6,2,3]]);
            polyhedron(points=[[rff_front_wall_back_outer_right_x,rff_front_wall_back_outer_right_y,rff_front_wall_bottom_z],[rff_front_wall_back_inner_right_x,rff_front_wall_back_inner_right_y,rff_front_wall_bottom_z],[rff_front_wall_front_outer_right_x,rff_front_wall_front_outer_right_y,rff_front_wall_bottom_z],[rff_front_wall_front_inner_right_x,rff_front_wall_front_inner_right_y,rff_front_wall_bottom_z],[rff_front_wall_back_outer_right_x,rff_front_wall_back_outer_right_y,rff_front_wall_top_z],[rff_front_wall_back_inner_right_x,rff_front_wall_back_inner_right_y,rff_front_wall_top_z],[rff_front_wall_front_outer_right_x,rff_front_wall_front_outer_right_y,rff_front_wall_top_z],[rff_front_wall_front_inner_right_x,rff_front_wall_front_inner_right_y,rff_front_wall_top_z]],
                faces=[[1,0,4,5],[4,0,2,6],[4,6,7,5],[5,7,3,1],[0,1,3,2],[7,6,2,3]]);
            translate([rff_head_x_offset+rff_head_length/2.0-_wall_thickness-rff_front_wall_thickness/2.0, rff_head_y_offset, rff_head_z_offset + rff_head_height/2.0 + rff_front_wall_height/2.0]) {
                cube([rff_front_wall_thickness,  rff_front_wall_front_outer_left_y-rff_front_wall_front_outer_right_y, rff_front_wall_height], true);
            }
            translate([rff_side_wall_x_offset, rff_side_wall_left_y_offset, rff_side_wall_z_offset]) {
                cube([rff_side_wall_length, rff_side_wall_width, rff_side_wall_height], true);
            }
            translate([rff_side_wall_x_offset, rff_side_wall_right_y_offset, rff_side_wall_z_offset]) {
                cube([rff_side_wall_length, rff_side_wall_width, rff_side_wall_height], true);
            }            
            translate([rff_battery_wall_front_x_offset, rff_battery_wall_front_y_offset, rff_battery_wall_front_z_offset]) {
                cube([rff_battery_wall_front_length, rff_battery_wall_front_width, rff_battery_wall_front_height], true);
            }
            translate([rff_battery_wall_side_x_offset, rff_battery_wall_side_left_y_offset, rff_battery_wall_side_z_offset]) {
                cube([rff_battery_wall_side_length, rff_battery_wall_side_width, rff_battery_wall_side_height], true);
            }
            translate([rff_battery_wall_side_x_offset, rff_battery_wall_side_right_y_offset, rff_battery_wall_side_z_offset]) {
                cube([rff_battery_wall_side_length, rff_battery_wall_side_width, rff_battery_wall_side_height], true);
            }
            translate([rff_battery_wall_side_x_offset, 0.0, rff_battery_wall_side_z_offset]) {
                cube([rff_battery_wall_side_length, rff_battery_wall_side_width, rff_battery_wall_side_height], true);
            }
            translate([rff_battery_wall_round_x_offset, rff_battery_wall_round_left_y_offset, rff_battery_wall_round_z_offset]){
                scale([rff_battery_wall_round_length, rff_battery_wall_round_width, 2*rff_battery_wall_round_height]) {
                    rotate([90,0,0]) {
                        difference() {
                            cylinder(1.0, 0.5, 0.5, true, $fn=_fn_val);
                            translate([0.0,-0.25,0.0]) {
                                cube([1.0,0.5,1.0], true);
                            }
                        }                
                    }
                }
            }
            translate([rff_battery_wall_round_x_offset, rff_battery_wall_round_right_y_offset, rff_battery_wall_round_z_offset]){
                scale([rff_battery_wall_round_length, rff_battery_wall_round_width, 2*rff_battery_wall_round_height]) {
                    rotate([90,0,0]) {
                        difference() {
                            cylinder(1.0, 0.5, 0.5, true, $fn=_fn_val);
                            translate([0.0,-0.25,0.0]) {
                                cube([1.0,0.5,1.0], true);
                            }
                        }                
                    }
                }
            }
            translate([rff_battery_wall_round_x_offset, 0.0, rff_battery_wall_round_z_offset]){
                scale([rff_battery_wall_round_length, rff_battery_wall_round_width, 2*rff_battery_wall_round_height]) {
                    rotate([90,0,0]) {
                        difference() {
                            cylinder(1.0, 0.5, 0.5, true, $fn=_fn_val);
                            translate([0.0,-0.25,0.0]) {
                                cube([1.0,0.5,1.0], true);
                            }
                        }                
                    }
                }
            }
            translate([rbf_wrt_rcb_x_offset-rff_wrt_rcb_x_offset, rbf_wrt_rcb_y_offset-rff_wrt_rcb_y_offset,rbf_wrt_rcb_z_offset-rff_wrt_rcb_z_offset]) {
                RacecarBackFoundationAttach();
            }
            
            
        }
        translate([rff_crossbar_body_screw_x_offset, rff_crossbar_body_screw_y_offset, rff_crossbar_body_screw_z_offset]) {
            _m2_5_flathead_screw(rff_crossbar_body_screw_height);            
        }
        translate([rff_crossbar_top_screw_x_offset, rff_crossbar_top_screw_left_y_offset, rff_crossbar_top_screw_z_offset]) {
            _m3_flathead_screw(rff_crossbar_top_screw_height);
        }
        translate([rff_crossbar_top_screw_x_offset, rff_crossbar_top_screw_left_y_offset, rff_head_z_offset+rff_head_height/2.0+rff_front_wall_height/2.0]) {
            cylinder(rff_front_wall_height, _m3_screw_head_radius, _m3_screw_head_radius, true, $fn=_fn_val);
        }
        translate([rff_crossbar_top_screw_x_offset, rff_crossbar_top_screw_right_y_offset, rff_crossbar_top_screw_z_offset]) {
            _m3_flathead_screw(rff_crossbar_top_screw_height);
        }  
          translate([rff_crossbar_top_screw_x_offset, rff_crossbar_top_screw_right_y_offset, rff_head_z_offset+rff_head_height/2.0+rff_front_wall_height/2.0]) {
            cylinder(rff_front_wall_height, _m3_screw_head_radius, _m3_screw_head_radius, true, $fn=_fn_val);
        }
        /*
        translate([rff_rsc_screw_front_x_offset, rff_rsc_screw_y_offset, rff_rsc_screw_z_offset]) {
            _m2_5_flathead_screw(rff_rsc_screw_height);
        }
        translate([rff_rsc_screw_back_x_offset, rff_rsc_screw_y_offset, rff_rsc_screw_z_offset]) {
            _m2_5_flathead_screw(rff_rsc_screw_height);
        } 
        */  
        translate([rff_rulfs_screw_x_offset, rff_rulfs_screw_left_y_offset, rff_rulfs_screw_z_offset]) {
            _m2_5_flathead_screw(rff_rulfs_screw_height);
        }
        translate([rff_rulfs_screw_x_offset, rff_rulfs_screw_right_y_offset, rff_rulfs_screw_z_offset]) {
            _m2_5_flathead_screw(rff_rulfs_screw_height);
        }
        translate([rff_side_screw_front_x_offset, rff_side_screw_left_y_offset, rff_side_screw_z_offset]) {
            scale([1,1.001,1]) {
                rotate([90,0,0]) {
                    _m2_5_nut_insert(rff_side_screw_height);
                }
            }
        }
        translate([rff_side_screw_back_x_offset, rff_side_screw_left_y_offset, rff_side_screw_z_offset]) {
            scale([1,1.001,1]) {
                rotate([90,0,0]) {
                    _m2_5_nut_insert(rff_side_screw_height);
                }
            }
        }   
        translate([rff_side_screw_front_x_offset, rff_side_screw_right_y_offset, rff_side_screw_z_offset]) {
            scale([1,1.001,1]) {
                rotate([-90,0,0]) {
                    _m2_5_nut_insert(rff_side_screw_height);
                }
            }
        }
        translate([rff_side_screw_back_x_offset, rff_side_screw_right_y_offset, rff_side_screw_z_offset]) {
            scale([1,1.001,1]) {
                rotate([-90,0,0]) {
                    _m2_5_nut_insert(rff_side_screw_height);
                }
            }
        }
        translate([rff_front_wall_screw_x_offset, rff_front_wall_screw_y_offset, rff_front_wall_screw_z_offset]) {
            scale([1.001,1,1]) {
                rotate([30,0,0]) {
                    rotate([0,-90,0]) {
                        _m2_5_nut_insert(rff_front_wall_screw_height);
                    }
                }
            }
        }
        /*
        translate([rff_rsc_screw_access_x_offset, rff_rsc_screw_access_y_offset, rff_rsc_screw_access_z_offset]) {
            cylinder(rff_rsc_screw_access_height, _m2_5_screw_head_radius, _m2_5_screw_head_radius, true, $fn=_fn_val);
        }
        */
        translate([rff_dzs_screw_front_x_offset, rff_dzs_screw_left_y_offset, rff_dzs_screw_z_offset]) {
            cylinder(rff_dzs_screw_height, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
            translate([0,0,-rff_dzs_screw_height/2.0+_m2_5_nut_height/2.0]) {
                _hexagon(_m2_5_nut_height, _m2_5_nut_diameter);
            }
        }
        translate([rff_dzs_screw_front_x_offset, rff_dzs_screw_right_y_offset, rff_dzs_screw_z_offset]) {
            cylinder(rff_dzs_screw_height, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
            translate([0,0,-rff_dzs_screw_height/2.0+_m2_5_nut_height/2.0]) {
                _hexagon(_m2_5_nut_height, _m2_5_nut_diameter);
            }
        }
        translate([rff_dzs_screw_back_x_offset, rff_dzs_screw_left_y_offset, rff_dzs_screw_z_offset]) {
            cylinder(rff_dzs_screw_height, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
            translate([0,0,-rff_dzs_screw_height/2.0+_m2_5_nut_height/2.0]) {
                _hexagon(_m2_5_nut_height, _m2_5_nut_diameter);
            }
        }
        translate([rff_dzs_screw_back_x_offset, rff_dzs_screw_right_y_offset, rff_dzs_screw_z_offset]) {
            cylinder(rff_dzs_screw_height, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
            translate([0,0,-rff_dzs_screw_height/2.0+_m2_5_nut_height/2.0]) {
                _hexagon(_m2_5_nut_height, _m2_5_nut_diameter);
            }
        }

        translate([rff_lm2596_screw_front_x_offset, rff_lm2596_screw_left_y_offset, rff_lm2596_screw_z_offset]) {
            cylinder(rff_lm2596_screw_height, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
            translate([0,0,-rff_lm2596_screw_height/2.0+_m2_5_nut_height/2.0]) {
                _hexagon(_m2_5_nut_height, _m2_5_nut_diameter);
            }
        }
        translate([rff_lm2596_screw_front_x_offset, rff_lm2596_screw_right_y_offset, rff_lm2596_screw_z_offset]) {
            cylinder(rff_lm2596_screw_height, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
            translate([0,0,-rff_lm2596_screw_height/2.0+_m2_5_nut_height/2.0]) {
                _hexagon(_m2_5_nut_height, _m2_5_nut_diameter);
            }
        }
        translate([rff_lm2596_screw_back_x_offset, rff_lm2596_screw_left_y_offset, rff_lm2596_screw_z_offset]) {
            cylinder(rff_lm2596_screw_height, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
            translate([0,0,-rff_lm2596_screw_height/2.0+_m2_5_nut_height/2.0]) {
                _hexagon(_m2_5_nut_height, _m2_5_nut_diameter);
            }
        }
        translate([rff_lm2596_screw_back_x_offset, rff_lm2596_screw_right_y_offset, rff_lm2596_screw_z_offset]) {
            cylinder(rff_lm2596_screw_height, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
            translate([0,0,-rff_lm2596_screw_height/2.0+_m2_5_nut_height/2.0]) {
                _hexagon(_m2_5_nut_height, _m2_5_nut_diameter);
            }
        } 

        translate([rff_drok_screw_front_x_offset, rff_drok_screw_left_y_offset, rff_drok_screw_z_offset]) {
            cylinder(rff_drok_screw_height, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
            translate([0,0,-rff_drok_screw_height/2.0+_m2_5_nut_height/2.0]) {
                _hexagon(_m2_5_nut_height, _m2_5_nut_diameter);
            }
        }
        translate([rff_drok_screw_front_x_offset, rff_drok_screw_right_y_offset, rff_drok_screw_z_offset]) {
            cylinder(rff_drok_screw_height, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
            translate([0,0,-rff_drok_screw_height/2.0+_m2_5_nut_height/2.0]) {
                _hexagon(_m2_5_nut_height, _m2_5_nut_diameter);
            }
        }
        translate([rff_drok_screw_back_x_offset, rff_drok_screw_left_y_offset, rff_drok_screw_z_offset]) {
            cylinder(rff_drok_screw_height, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
            translate([0,0,-rff_drok_screw_height/2.0+_m2_5_nut_height/2.0]) {
                _hexagon(_m2_5_nut_height, _m2_5_nut_diameter);
            }
        }
        translate([rff_drok_screw_back_x_offset, rff_drok_screw_right_y_offset, rff_drok_screw_z_offset]) {
            cylinder(rff_drok_screw_height, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
            translate([0,0,-rff_drok_screw_height/2.0+_m2_5_nut_height/2.0]) {
                _hexagon(_m2_5_nut_height, _m2_5_nut_diameter);
            }
        } 
        
        translate([rff_front_hole_x_offset, rff_front_hole_left_y_offset, rff_front_hole_z_offset]) {
            cube([rff_front_hole_length, rff_front_hole_width, rff_front_hole_height], true);
        }
        translate([rff_front_hole_x_offset, rff_front_hole_right_y_offset, rff_front_hole_z_offset]) {
            cube([rff_front_hole_length, rff_front_hole_width, rff_front_hole_height], true);
        }        
       
    }

    
}