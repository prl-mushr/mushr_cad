$include_rcb = true;
include <racecar_crossbar_body.scad>

$include_rllfs = true;
include <racecar_lower_left_foundation_support.scad>

$include_rlrfs = true;
include <racecar_lower_right_foundation_support.scad>

rbf_length = 110; 
rbf_width = 130;
rbf_height = 5; 

rbf_wrt_rcb_x_offset = -rbf_length/2.0 + rcb_body_screw_front_x_offset - (rcb_body_screw_front_x_offset - rcb_body_screw_back_x_offset) /2.0;
rbf_wrt_rcb_y_offset = 0.0;
rbf_wrt_rcb_z_offset = rbf_height/2.0 + rcb_height/2.0;

rbf_side_wall_length = rbf_length;
rbf_side_wall_width = 5.0;
rbf_side_wall_height = 6.0;
rbf_side_wall_x_offset = 0.0;
rbf_side_wall_left_y_offset = rbf_width/2.0-_wall_thickness-rbf_side_wall_width/2.0;
rbf_side_wall_right_y_offset = -rbf_width/2.0+_wall_thickness+rbf_side_wall_width/2.0;
rbf_side_wall_z_offset = rbf_height/2.0 + rbf_side_wall_height/2.0;

rbf_side_screw_height = rbf_side_wall_width;
rbf_side_screw_front_x_offset = rbf_side_wall_x_offset + rbf_side_wall_length/2.0 - _m2_5_screw_head_radius - _wall_thickness;
rbf_side_screw_back_x_offset = rbf_side_wall_x_offset - rbf_side_wall_length/2.0 + _m2_5_screw_head_radius + _wall_thickness+ 12.0;    
rbf_side_screw_left_y_offset = rbf_side_wall_left_y_offset;
rbf_side_screw_right_y_offset = rbf_side_wall_right_y_offset;
rbf_side_screw_z_offset = rbf_side_wall_z_offset;

rbf_battery_wall_back_length = _wall_thickness;
rbf_battery_wall_back_width = 2*48.75+3*_wall_thickness;
rbf_battery_wall_back_height = 5.0;
rbf_battery_wall_back_x_offset = -rbf_length/2.0 + rbf_battery_wall_back_length/2.0;
rbf_battery_wall_back_y_offset = 0.0;
rbf_battery_wall_back_z_offset = rbf_height/2.0+rbf_battery_wall_back_height/2.0;

rbf_battery_wall_side_length = 10.0;
rbf_battery_wall_side_width = _wall_thickness;
rbf_battery_wall_side_height = rbf_battery_wall_back_height;
rbf_battery_wall_side_x_offset = rbf_battery_wall_back_x_offset + rbf_battery_wall_back_length/2.0+rbf_battery_wall_side_length/2.0;
rbf_battery_wall_side_left_y_offset = 48.75 + rbf_battery_wall_side_width;
rbf_battery_wall_side_right_y_offset = -48.75-rbf_battery_wall_side_width;
rbf_battery_wall_side_z_offset = rbf_height/2.0 + rbf_battery_wall_side_height/2.0;

rbf_battery_wall_round_length = (rbf_battery_wall_side_length + rbf_battery_wall_back_length);
rbf_battery_wall_round_width = rbf_battery_wall_side_width;
rbf_battery_wall_round_height = 14.0 - rbf_battery_wall_side_height;
rbf_battery_wall_round_x_offset = rbf_battery_wall_side_x_offset + rbf_battery_wall_side_length/2.0 -  rbf_battery_wall_round_length/2.0;
rbf_battery_wall_round_left_y_offset = rbf_battery_wall_side_left_y_offset;
rbf_battery_wall_round_right_y_offset = rbf_battery_wall_side_right_y_offset;
rbf_battery_wall_round_z_offset = rbf_battery_wall_side_z_offset + rbf_battery_wall_side_height/2.0;

rbf_attach_length = 10.0;
rbf_attach_width = 10.0;
rbf_attach_height = rbf_height/2.0;
rbf_attach_x_offset = rbf_length/2.0-rbf_attach_length/2.0;
rbf_attach_left_y_offset = rbf_side_wall_left_y_offset - rbf_side_wall_width/2.0 - rbf_attach_width/2.0;
rbf_attach_right_y_offset = rbf_side_wall_right_y_offset + rbf_side_wall_width/2.0 + rbf_attach_width/2.0;
rbf_attach_z_offset = rbf_height/2.0 - rbf_attach_height/2.0;

if ($include_rbf==undef) {
    RacecarBackFoundation();
}

module RacecarBackFoundation() {
    
    rbf_crossbar_body_screw_height = rbf_height;
    rbf_crossbar_body_screw_x_offset = -rbf_wrt_rcb_x_offset+rcb_body_screw_back_x_offset;
    rbf_crossbar_body_screw_y_offset = -rbf_wrt_rcb_y_offset+rcb_body_screw_y_offset;
    rbf_crossbar_body_screw_z_offset = 0.0;    
    
    rbf_crossbar_bottom_screw_height = rbf_height;
    rbf_crossbar_bottom_screw_x_offset = -rbf_wrt_rcb_x_offset+rcbs_wrt_rcb_x_offset+rcbs_screw_x_offset;
    rbf_crossbar_bottom_screw_left_y_offset = -rbf_wrt_rcb_y_offset+rcbs_wrt_rcb_y_offset+rcbs_screw_left_y_offset;
    rbf_crossbar_bottom_screw_right_y_offset = -rbf_wrt_rcb_y_offset+rcbs_wrt_rcb_y_offset+rcbs_screw_right_y_offset;
    rbf_crossbar_bottom_screw_z_offset = 0.0;
    
    rbf_rllfs_screw_height = rbf_height;
    rbf_rllfs_screw_front_x_offset = -rbf_wrt_rcb_x_offset+rllfs_wrt_rcb_x_offset+rllfs_length/2.0-rfs_screw_from_edge;
    rbf_rllfs_screw_back_x_offset = -rbf_wrt_rcb_x_offset+rllfs_wrt_rcb_x_offset-rllfs_length/2.0+rfs_screw_from_edge;
    rbf_rllfs_screw_y_offset = -rbf_wrt_rcb_y_offset + rllfs_wrt_rcb_y_offset;
    rbf_rllfs_screw_z_offset = 0.0;
    
    rbf_rlrfs_screw_height = rbf_height;
    rbf_rlrfs_screw_front_x_offset = -rbf_wrt_rcb_x_offset + rlrfs_wrt_rcb_x_offset+rlrfs_length/2.0-rfs_screw_from_edge;
    rbf_rlrfs_screw_back_x_offset = -rbf_wrt_rcb_x_offset+rlrfs_wrt_rcb_x_offset-rlrfs_length/2.0+rfs_screw_from_edge;
    rbf_rlrfs_screw_y_offset = -rbf_wrt_rcb_y_offset + rlrfs_wrt_rcb_y_offset;
    rbf_rlrfs_screw_z_offset = 0.0;
    
    rbf_cutout_length = rbf_length - 20.0;
    rbf_cutout_width = (rbf_crossbar_bottom_screw_right_y_offset - rbf_rlrfs_screw_y_offset)/2.0;    
    rbf_cutout_height = 2.0;
    rbf_cutout_x_offset = 0.0;
    rbf_cutout_left_y_offset = rbf_width/4.0;
    rbf_cutout_right_y_offset = -rbf_width/4.0;
    rbf_cutout_z_offset = rbf_height/2.0 - rbf_cutout_height/2.0;
    
    rbf_cutout_zip_n = 6;
    rbf_cutout_zip_m = 2;
    rbf_cutout_zip_length = 7.5;
    rbf_cutout_zip_width = 2.0;
    rbf_cutout_zip_height = rbf_height;
    rbf_cutout_zip_length_interval = (rbf_cutout_length - (rbf_cutout_zip_n*rbf_cutout_zip_length))/(rbf_cutout_zip_n+1.0);
    rbf_cutout_zip_width_interval = (rbf_cutout_width - (rbf_cutout_zip_m*rbf_cutout_zip_width))/(rbf_cutout_zip_m+1.0);
    rbf_cutout_zip_start_x_offset = rbf_cutout_x_offset - ((rbf_cutout_zip_n-1)*rbf_cutout_zip_length)/2.0-((rbf_cutout_zip_n/2.0-0.5)*rbf_cutout_zip_length_interval);
    rbf_cutout_zip_start_left_y_offset = rbf_cutout_left_y_offset - ((rbf_cutout_zip_m-1)*rbf_cutout_zip_width)/2.0-((rbf_cutout_zip_m/2.0-0.5)*rbf_cutout_zip_width_interval);
    rbf_cutout_zip_start_right_y_offset = rbf_cutout_right_y_offset - ((rbf_cutout_zip_m-1)*rbf_cutout_zip_width)/2.0-((rbf_cutout_zip_m/2.0-0.5)*rbf_cutout_zip_width_interval);
    rbf_cutout_zip_z_offset = 0.0;
 
    rbf_rllfs_screw_access_height = rbf_battery_wall_round_height + rbf_battery_wall_side_height;
    rbf_rllfs_screw_access_x_offset = rbf_rllfs_screw_back_x_offset;
    rbf_rllfs_screw_access_y_offset = rbf_rllfs_screw_y_offset;
    rbf_rllfs_screw_access_z_offset = rbf_height/2.0+rbf_rllfs_screw_access_height/2.0;
 
    rbf_vesc_access_length = 25.0;
    rbf_vesc_access_width = 12.0;
    rbf_vesc_access_height = rbf_height;
    rbf_vesc_access_x_offset = rbf_cutout_x_offset;
    rbf_vesc_access_y_offset = rbf_side_wall_left_y_offset - rbf_side_wall_width/2.0 - rbf_vesc_access_width/2.0;
    rbf_vesc_access_z_offset = 0.0;
 
    difference() {
        union() {
            translate([0.0,0.0,0.0]) {
                cube([rbf_length, rbf_width, rbf_height], true);        
            }    
            translate([rbf_side_wall_x_offset, rbf_side_wall_left_y_offset, rbf_side_wall_z_offset]) {
                cube([rbf_side_wall_length, rbf_side_wall_width, rbf_side_wall_height], true);
            }
            translate([rbf_side_wall_x_offset, rbf_side_wall_right_y_offset, rbf_side_wall_z_offset]) {
                cube([rbf_side_wall_length, rbf_side_wall_width, rbf_side_wall_height], true);
            }
            translate([rbf_battery_wall_back_x_offset, rbf_battery_wall_back_y_offset, rbf_battery_wall_back_z_offset]) {
                cube([rbf_battery_wall_back_length, rbf_battery_wall_back_width, rbf_battery_wall_back_height], true);
            }
            translate([rbf_battery_wall_side_x_offset, rbf_battery_wall_side_left_y_offset, rbf_battery_wall_side_z_offset]) {
                cube([rbf_battery_wall_side_length, rbf_battery_wall_side_width, rbf_battery_wall_side_height], true);
            }
            translate([rbf_battery_wall_side_x_offset, rbf_battery_wall_side_right_y_offset, rbf_battery_wall_side_z_offset]) {
                cube([rbf_battery_wall_side_length, rbf_battery_wall_side_width, rbf_battery_wall_side_height], true);
            }
            translate([rbf_battery_wall_side_x_offset, 0.0, rbf_battery_wall_side_z_offset]) {
                cube([rbf_battery_wall_side_length, rbf_battery_wall_side_width, rbf_battery_wall_side_height], true);
            }            
            translate([rbf_battery_wall_round_x_offset, rbf_battery_wall_round_left_y_offset, rbf_battery_wall_round_z_offset]){
                scale([rbf_battery_wall_round_length, rbf_battery_wall_round_width, 2*rbf_battery_wall_round_height]) {
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
            translate([rbf_battery_wall_round_x_offset, rbf_battery_wall_round_right_y_offset, rbf_battery_wall_round_z_offset]){
                scale([rbf_battery_wall_round_length, rbf_battery_wall_round_width, 2*rbf_battery_wall_round_height]) {
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
            translate([rbf_battery_wall_round_x_offset, 0.0, rbf_battery_wall_round_z_offset]){
                scale([rbf_battery_wall_round_length, rbf_battery_wall_round_width, 2*rbf_battery_wall_round_height]) {
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
        }    
        translate([rbf_crossbar_body_screw_x_offset, rbf_crossbar_body_screw_y_offset, rbf_crossbar_body_screw_z_offset]) {
            _m2_5_flathead_screw(rbf_crossbar_body_screw_height);
        }
        translate([rbf_crossbar_bottom_screw_x_offset, rbf_crossbar_bottom_screw_left_y_offset, rbf_crossbar_bottom_screw_z_offset]) {
            _m3_flathead_screw(rbf_crossbar_bottom_screw_height);
        }
        translate([rbf_crossbar_bottom_screw_x_offset, rbf_crossbar_bottom_screw_right_y_offset, rbf_crossbar_bottom_screw_z_offset]) {
            _m3_flathead_screw(rbf_crossbar_bottom_screw_height);
        } 
        translate([rbf_rllfs_screw_front_x_offset, rbf_rllfs_screw_y_offset, rbf_rllfs_screw_z_offset]) {
            _m2_5_flathead_screw(rbf_rllfs_screw_height);
        }
        translate([rbf_rllfs_screw_back_x_offset, rbf_rllfs_screw_y_offset, rbf_rllfs_screw_z_offset]) {
            _m2_5_flathead_screw(rbf_rllfs_screw_height);
        } 
         translate([rbf_rlrfs_screw_front_x_offset, rbf_rlrfs_screw_y_offset, rbf_rlrfs_screw_z_offset]) {
            _m2_5_flathead_screw(rbf_rlrfs_screw_height);
        }
        translate([rbf_rlrfs_screw_back_x_offset, rbf_rlrfs_screw_y_offset, rbf_rlrfs_screw_z_offset]) {
            _m2_5_flathead_screw(rbf_rlrfs_screw_height);
        }

        translate([rbf_cutout_x_offset, rbf_cutout_left_y_offset, rbf_cutout_z_offset]) {
            _rounded_square(rbf_cutout_length, rbf_cutout_width, rbf_cutout_height);
        }        
        for(i = [0:rbf_cutout_zip_n-1]) {
            for(j = [0:rbf_cutout_zip_m-1]) {
                translate([rbf_cutout_zip_start_x_offset+i*(rbf_cutout_zip_length+rbf_cutout_zip_length_interval), rbf_cutout_zip_start_left_y_offset+j*(rbf_cutout_zip_width+rbf_cutout_zip_width_interval),rbf_cutout_zip_z_offset]) {
                    _rounded_square(rbf_cutout_zip_length, rbf_cutout_zip_width, rbf_cutout_zip_height);
                }
            }
        }        
        
        translate([rbf_cutout_x_offset, rbf_cutout_right_y_offset, rbf_cutout_z_offset]) {
            _rounded_square(rbf_cutout_length, rbf_cutout_width, rbf_cutout_height);
        }
        
        for(i = [0:rbf_cutout_zip_n-1]) {
            for(j = [0:rbf_cutout_zip_m-1]) {
                translate([rbf_cutout_zip_start_x_offset+i*(rbf_cutout_zip_length+rbf_cutout_zip_length_interval), rbf_cutout_zip_start_right_y_offset+j*(rbf_cutout_zip_width+rbf_cutout_zip_width_interval),rbf_cutout_zip_z_offset]) {
                    _rounded_square(rbf_cutout_zip_length, rbf_cutout_zip_width, rbf_cutout_zip_height);
                }
            }
        }
        
        translate([rbf_side_screw_front_x_offset, rbf_side_screw_left_y_offset, rbf_side_screw_z_offset]) {
            scale([1,1.001,1]) {
                rotate([90,0,0]) {
                    _m2_5_nut_insert(rbf_side_screw_height);
                }
            }
        }
        translate([rbf_side_screw_back_x_offset, rbf_side_screw_left_y_offset, rbf_side_screw_z_offset]) {
            scale([1,1.001,1]) {
                rotate([90,0,0]) {
                    _m2_5_nut_insert(rbf_side_screw_height);
                }
            }
        }   
        translate([rbf_side_screw_front_x_offset, rbf_side_screw_right_y_offset, rbf_side_screw_z_offset]) {
            scale([1,1.001,1]) {
                rotate([-90,0,0]) {
                    _m2_5_nut_insert(rbf_side_screw_height);
                }
            }
        }
        translate([rbf_side_screw_back_x_offset, rbf_side_screw_right_y_offset, rbf_side_screw_z_offset]) {
            scale([1,1.001,1]) {
                rotate([-90,0,0]) {
                    _m2_5_nut_insert(rbf_side_screw_height);
                }
            }
        } 
        translate([rbf_rllfs_screw_access_x_offset,rbf_rllfs_screw_access_y_offset,rbf_rllfs_screw_access_z_offset]) {
            cylinder(rbf_rllfs_screw_access_height, _m2_5_screw_head_radius, _m2_5_screw_head_radius, true, $fn=_fn_val); 
        }
        translate([rbf_vesc_access_x_offset, rbf_vesc_access_y_offset, rbf_vesc_access_z_offset]) {
            cube([rbf_vesc_access_length, rbf_vesc_access_width, rbf_vesc_access_height], true);
        }
        RacecarBackFoundationAttach(false);
        translate([rbf_attach_x_offset, rbf_attach_left_y_offset, 0.0]) {
            cylinder(rbf_height, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
        }
        translate([rbf_attach_x_offset, rbf_attach_right_y_offset, 0.0]) {
            cylinder(rbf_height, _m2_5_screw_shaft_radius, _m2_5_screw_shaft_radius, true, $fn=_fn_val);
        }        
    }
}

module RacecarBackFoundationAttach(difference_screws=true) {
    
    if(difference_screws) {
        difference() {
            union() {
                translate([rbf_attach_x_offset, rbf_attach_left_y_offset, rbf_attach_z_offset]) {
                    cube([rbf_attach_length, rbf_attach_width, rbf_attach_height], true);
                }
                
                translate([rbf_attach_x_offset, rbf_attach_right_y_offset, rbf_attach_z_offset]) {
                    cube([rbf_attach_length, rbf_attach_width, rbf_attach_height], true);
                }
            }
            translate([rbf_attach_x_offset, rbf_attach_left_y_offset, rbf_attach_z_offset]) {
                _m2_5_flathead_screw(rbf_attach_height);
            }
            translate([rbf_attach_x_offset, rbf_attach_right_y_offset, rbf_attach_z_offset]) {
                _m2_5_flathead_screw(rbf_attach_height);
            }            
        }    
    } else {
        translate([rbf_attach_x_offset, rbf_attach_left_y_offset, rbf_attach_z_offset]) {
            cube([rbf_attach_length, rbf_attach_width, rbf_attach_height], true);
        }
        
        translate([rbf_attach_x_offset, rbf_attach_right_y_offset, rbf_attach_z_offset]) {
            cube([rbf_attach_length, rbf_attach_width, rbf_attach_height], true);
        }    
    }    

}