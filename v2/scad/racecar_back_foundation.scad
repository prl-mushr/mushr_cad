$include_rcb = true;
include <racecar_crossbar_body.scad>

$include_rllfs = true;
include <racecar_lower_left_foundation_support.scad>

$include_rlrfs = true;
include <racecar_lower_right_foundation_support.scad>

$include_rfb = true;
include <racecar_foundation_bar.scad>

rbf_length = 110; 
rbf_width = 130;
rbf_height = 5.0;
rbf_x_offset = 0.0;
rbf_y_offset = 0.0;
rbf_z_offset = 0.0;

rbf_wrt_rcb_x_offset = -rbf_length/2.0 + rcb_body_screw_front_x_offset - (rcb_body_screw_front_x_offset - rcb_body_screw_back_x_offset) /2.0+3.5;
rbf_wrt_rcb_y_offset = 0.0;
rbf_wrt_rcb_z_offset = rbf_height/2.0 + rcb_height/2.0;

rbf_compartment_length = rbf_length;
rbf_compartment_bottom_width = rbf_width;
rbf_compartment_top_width = 185.0;
rbf_compartment_height = 28.0;
rbf_compartment_x_offset = rbf_x_offset;
rbf_compartment_y_offset = rbf_y_offset;
rbf_compartment_z_offset = rbf_z_offset + rbf_height/2.0+rbf_compartment_height/2.0;    

rbf_bank_length = 185.0+_wall_thickness;
rbf_bank_width = 115.0;
rbf_bank_height = rbf_compartment_height;
rbf_bank_x_offset = rbf_x_offset -rbf_length/2.0 + rbf_bank_length/2.0-0.001;
rbf_bank_y_offset = rbf_y_offset;
rbf_bank_z_offset = rbf_z_offset + rbf_height/2.0 + (rbf_bank_height)/2.0+0.0001;  

rbf_scaffold_mount_length = 15.0;
rbf_scaffold_mount_width = 2*_wall_thickness;
rbf_scaffold_mount_height = 10.0;
rbf_scaffold_mount_x_offset = rbf_compartment_x_offset-rbf_compartment_length/2.0+rbf_scaffold_mount_length/2.0;
rbf_scaffold_mount_left_y_offset = rbf_bank_y_offset + rbf_bank_width/2.0 + 2*_wall_thickness + rbf_scaffold_mount_width/2.0;
rbf_scaffold_mount_right_y_offset = rbf_bank_y_offset - rbf_bank_width/2.0 - 2*_wall_thickness - rbf_scaffold_mount_width/2.0;
rbf_scaffold_mount_z_offset = rbf_compartment_z_offset+rbf_compartment_height/2.0+rbf_scaffold_mount_height/2.0;

rbf_scaffold_screw_height = rbf_scaffold_mount_width;
rbf_scaffold_screw_front_x_offset = rbf_scaffold_mount_x_offset + rbf_scaffold_mount_length/2.0 - _wall_thickness;
rbf_scaffold_screw_back_x_offset = rbf_scaffold_mount_x_offset - rbf_scaffold_mount_length/2.0 + _wall_thickness;
rbf_scaffold_screw_left_y_offset =  rbf_scaffold_mount_left_y_offset;
rbf_scaffold_screw_right_y_offset =  rbf_scaffold_mount_right_y_offset;
rbf_scaffold_screw_z_offset =  rbf_scaffold_mount_z_offset;

rbf_side_wall_length = rbf_compartment_length;
rbf_side_wall_width = 6.0;
rbf_side_wall_height = 6.0;
rbf_side_wall_x_offset = rbf_compartment_x_offset;
rbf_side_wall_left_y_offset = rbf_compartment_y_offset+rbf_compartment_top_width/2.0-_wall_thickness-rbf_side_wall_width/2.0;
rbf_side_wall_right_y_offset = rbf_compartment_y_offset-rbf_compartment_top_width/2.0+_wall_thickness+rbf_side_wall_width/2.0;
rbf_side_wall_z_offset = rbf_compartment_z_offset+rbf_compartment_height/2.0+rbf_side_wall_height/2.0;

rbf_jetson_height = _m3_insert_depth;
rbf_jetson_radius = _m3_insert_radius;
rbf_jetson_back_right_x_offset = rbf_x_offset - rbf_length/2.0 + 29.276;
rbf_jetson_back_right_y_offset = rbf_y_offset - 78.486;
rbf_jetson_back_right_z_offset = rbf_compartment_z_offset + rbf_compartment_height/2.0 - rbf_jetson_height/2.0;
rbf_jetson_back_left_x_offset = rbf_x_offset - rbf_length/2.0 + 52.39;
rbf_jetson_back_left_y_offset = rbf_y_offset + 78.486;
rbf_jetson_back_left_z_offset = rbf_compartment_z_offset + rbf_compartment_height/2.0 - rbf_jetson_height/2.0;

rbf_foundation_bar_x_offset = rbf_x_offset + rbf_length/2.0;
rbf_foundation_bar_y_offset = rbf_y_offset;
rbf_foundation_bar_z_offset = rbf_compartment_z_offset + rbf_compartment_height/2.0 - rfb_height/2.0;  

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

rbf_side_wall_screw_height = _m3_insert_depth;
rbf_side_wall_screw_radius = _m3_insert_radius;
rbf_side_wall_screw_front_x_offset = rbf_side_wall_x_offset + rbf_side_wall_length/2.0 - 2*_wall_thickness;
rbf_side_wall_screw_back_x_offset = rbf_side_wall_x_offset - rbf_side_wall_length/2.0 + 2*_wall_thickness;
rbf_side_wall_screw_left_y_offset = rbf_side_wall_left_y_offset + rbf_side_wall_width/2.0 - rbf_side_wall_screw_height/2.0;
rbf_side_wall_screw_right_y_offset = rbf_side_wall_right_y_offset - rbf_side_wall_width/2.0 + rbf_side_wall_screw_height/2.0;
rbf_side_wall_screw_z_offset = rbf_side_wall_z_offset;

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
    
    rbf_battery_hole_length = 20.0;
    rbf_battery_hole_width = rbf_side_wall_left_y_offset - rbf_scaffold_mount_left_y_offset - rbf_side_wall_width/2.0 - rbf_scaffold_mount_width/2.0;
    rbf_battery_hole_height = rbf_compartment_height;
    rbf_battery_hole_x_offset = rbf_compartment_x_offset - rbf_compartment_length/2.0 + 2*_wall_thickness + rbf_battery_hole_length/2.0;
    rbf_battery_hole_y_offset = rbf_side_wall_left_y_offset - rbf_side_wall_width/2.0 -  rbf_battery_hole_width/2.0;
    rbf_battery_hole_z_offset = rbf_compartment_z_offset;
     
    rbf_motor_hole_length = 20.0;
    rbf_motor_hole_width = rbf_scaffold_mount_right_y_offset - rbf_side_wall_right_y_offset - rbf_side_wall_width/2.0 - rbf_scaffold_mount_width/2.0;
    rbf_motor_hole_height = rbf_compartment_height;
    rbf_motor_hole_x_offset = rbf_compartment_x_offset - rbf_compartment_length/2.0 + 2*_wall_thickness + rbf_motor_hole_length/2.0;
    rbf_motor_hole_y_offset = rbf_side_wall_right_y_offset + rbf_side_wall_width/2.0 +  rbf_motor_hole_width/2.0;
    rbf_motor_hole_z_offset = rbf_compartment_z_offset;
    
    rbf_antenna_from_top = 3.23;
    rbf_antenna_separation = 15.19;
    rbf_antenna_height = _m3_insert_depth;
    rbf_antenna_radius = _m3_insert_radius;
    rbf_antenna_x_offset = rbf_x_offset - rbf_length/2.0 + rbf_antenna_height/2.0;
    rbf_antenna_left_y_offset = rbf_scaffold_mount_right_y_offset + rbf_scaffold_mount_width/2.0 - rbf_antenna_radius; 
    rbf_antenna_right_y_offset = rbf_antenna_left_y_offset -  rbf_antenna_separation;
    rbf_antenna_z_offset = rbf_compartment_z_offset + rbf_compartment_height / 2.0 - rbf_antenna_from_top;  

    rbf_foundation_bar_fastener_height = _m3_insert_depth;
    rbf_foundation_bar_fastener_radius = _m3_insert_radius;
    rbf_foundation_bar_fastener_x_offset = rbf_foundation_bar_x_offset + rfb_screw_back_x_offset;
    rbf_foundation_bar_fastener_left_y_offset = rbf_foundation_bar_y_offset + rfb_screw_left_y_offset;
    rbf_foundation_bar_fastener_right_y_offset = rbf_foundation_bar_y_offset + rfb_screw_right_y_offset;rbf_foundation_bar_fastener_z_offset = rbf_compartment_z_offset + rbf_compartment_height/2.0-rbf_foundation_bar_fastener_height/2.0;
    
    difference() {
        union() {
            translate([rbf_compartment_x_offset, rbf_compartment_y_offset, rbf_compartment_z_offset]) {
                rotate([0,90,0]) {
                    _trapezoid(rbf_compartment_bottom_width, rbf_compartment_top_width, rbf_compartment_height, rbf_compartment_length);  
                }    
            }
            translate([rbf_x_offset, rbf_y_offset, rbf_z_offset]) {
                cube([rbf_length, rbf_width, rbf_height], true);
            }            
        }

        translate([rbf_bank_x_offset, rbf_bank_y_offset, rbf_bank_z_offset]) {
                        cube([rbf_bank_length, rbf_bank_width, rbf_bank_height], true);
        }   
        translate([rbf_crossbar_body_screw_x_offset, rbf_crossbar_body_screw_y_offset, rbf_crossbar_body_screw_z_offset]) {
            _m3_flathead_screw(rbf_crossbar_body_screw_height+0.01);
        }
        translate([rbf_crossbar_bottom_screw_x_offset, rbf_crossbar_bottom_screw_left_y_offset, rbf_crossbar_bottom_screw_z_offset]) {
            _m3_flathead_screw(rbf_crossbar_bottom_screw_height+0.01);
        }
        translate([rbf_crossbar_bottom_screw_x_offset, rbf_crossbar_bottom_screw_right_y_offset, rbf_crossbar_bottom_screw_z_offset]) {
            _m3_flathead_screw(rbf_crossbar_bottom_screw_height+0.01);
        } 
        translate([rbf_rllfs_screw_front_x_offset, rbf_rllfs_screw_y_offset, rbf_rllfs_screw_z_offset]) {
            _m3_flathead_screw(rbf_rllfs_screw_height+0.01);
        }
        translate([rbf_rllfs_screw_back_x_offset, rbf_rllfs_screw_y_offset, rbf_rllfs_screw_z_offset]) {
            _m3_flathead_screw(rbf_rllfs_screw_height+0.01);
        } 
         translate([rbf_rlrfs_screw_front_x_offset, rbf_rlrfs_screw_y_offset, rbf_rlrfs_screw_z_offset]) {
            _m3_flathead_screw(rbf_rlrfs_screw_height+0.01);
        }
        translate([rbf_rlrfs_screw_back_x_offset, rbf_rlrfs_screw_y_offset, rbf_rlrfs_screw_z_offset]) {
            _m3_flathead_screw(rbf_rlrfs_screw_height+0.01);
        }
        translate([rbf_battery_hole_x_offset, rbf_battery_hole_y_offset, rbf_battery_hole_z_offset]) {
            cube([rbf_battery_hole_length, rbf_battery_hole_width, rbf_battery_hole_height], true);
        }
        translate([rbf_motor_hole_x_offset, rbf_motor_hole_y_offset, rbf_motor_hole_z_offset]) {
            cube([rbf_motor_hole_length, rbf_motor_hole_width, rbf_motor_hole_height], true);
        }
        translate([rbf_antenna_x_offset-0.01, rbf_antenna_left_y_offset, rbf_antenna_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rbf_antenna_height, rbf_antenna_radius, rbf_antenna_radius, true, $fn=_fn_val);
            }
        }
        translate([rbf_antenna_x_offset-0.01, rbf_antenna_right_y_offset, rbf_antenna_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rbf_antenna_height, rbf_antenna_radius, rbf_antenna_radius, true, $fn=_fn_val);
            }
        } 
 
        translate([rbf_jetson_back_right_x_offset, rbf_jetson_back_right_y_offset, rbf_jetson_back_right_z_offset]) {
            cylinder(rbf_jetson_height, rbf_jetson_radius, rbf_jetson_radius, true, $fn=_fn_val);
        }
        
        translate([rbf_jetson_back_left_x_offset, rbf_jetson_back_left_y_offset, rbf_jetson_back_left_z_offset+0.01]) {
            cylinder(rbf_jetson_height, rbf_jetson_radius, rbf_jetson_radius, true, $fn=_fn_val);
        }        
        
        translate([rbf_foundation_bar_x_offset,rbf_foundation_bar_y_offset,rbf_foundation_bar_z_offset+0.01]) {
           RacecarFoundationBar(false);
        }        
        translate([rbf_foundation_bar_fastener_x_offset, rbf_foundation_bar_fastener_left_y_offset, rbf_foundation_bar_fastener_z_offset]) {
            cylinder(rbf_foundation_bar_fastener_height, rbf_foundation_bar_fastener_radius, rbf_foundation_bar_fastener_radius, true, $fn=_fn_val);
        }
        translate([rbf_foundation_bar_fastener_x_offset, rbf_foundation_bar_fastener_right_y_offset, rbf_foundation_bar_fastener_z_offset]) {
            cylinder(rbf_foundation_bar_fastener_height, rbf_foundation_bar_fastener_radius, rbf_foundation_bar_fastener_radius, true, $fn=_fn_val);
        }                
        
    }   
        
    difference() {
    
        translate([rbf_scaffold_mount_x_offset,rbf_scaffold_mount_left_y_offset, rbf_scaffold_mount_z_offset]) {
            cube([rbf_scaffold_mount_length, rbf_scaffold_mount_width, rbf_scaffold_mount_height], true);
        }
        translate([rbf_scaffold_screw_front_x_offset, rbf_scaffold_screw_left_y_offset, rbf_scaffold_screw_z_offset]) {
            rotate([-90,0,0]) {
                _m3_flathead_screw(rbf_scaffold_screw_height+0.001);
            }
        }
        translate([rbf_scaffold_screw_back_x_offset, rbf_scaffold_screw_left_y_offset, rbf_scaffold_screw_z_offset]) {
            rotate([-90,0,0]) {
                _m3_flathead_screw(rbf_scaffold_screw_height+0.001);
            }
        }        
    }

    difference() {
        translate([rbf_scaffold_mount_x_offset,rbf_scaffold_mount_right_y_offset, rbf_scaffold_mount_z_offset]) {
            cube([rbf_scaffold_mount_length, rbf_scaffold_mount_width, rbf_scaffold_mount_height], true);
        }    
        translate([rbf_scaffold_screw_front_x_offset, rbf_scaffold_screw_right_y_offset, rbf_scaffold_screw_z_offset]) {
            rotate([90,0,0]) {
                _m3_flathead_screw(rbf_scaffold_screw_height+0.001);
            }
        }
        translate([rbf_scaffold_screw_back_x_offset, rbf_scaffold_screw_right_y_offset, rbf_scaffold_screw_z_offset]) {
            rotate([90,0,0]) {
                _m3_flathead_screw(rbf_scaffold_screw_height+0.001);
            }
        }         
    }   

    difference() {

        translate([rbf_side_wall_x_offset, rbf_side_wall_left_y_offset, rbf_side_wall_z_offset]) {
            cube([rbf_side_wall_length, rbf_side_wall_width, rbf_side_wall_height], true);
        }
        
        translate([rbf_side_wall_screw_front_x_offset, rbf_side_wall_screw_left_y_offset, rbf_side_wall_screw_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rbf_side_wall_screw_height, rbf_side_wall_screw_radius, rbf_side_wall_screw_radius, true, $fn=_fn_val);
            }
        }
        
        translate([rbf_side_wall_screw_back_x_offset, rbf_side_wall_screw_left_y_offset, rbf_side_wall_screw_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rbf_side_wall_screw_height, rbf_side_wall_screw_radius, rbf_side_wall_screw_radius, true, $fn=_fn_val);
            }
        }
        
    }
    
    difference() {
        translate([rbf_side_wall_x_offset, rbf_side_wall_right_y_offset, rbf_side_wall_z_offset]) {
            cube([rbf_side_wall_length, rbf_side_wall_width, rbf_side_wall_height], true);
        }
        
        translate([rbf_side_wall_screw_front_x_offset, rbf_side_wall_screw_right_y_offset, rbf_side_wall_screw_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rbf_side_wall_screw_height, rbf_side_wall_screw_radius, rbf_side_wall_screw_radius, true, $fn=_fn_val);
            }
        }
        
        translate([rbf_side_wall_screw_back_x_offset, rbf_side_wall_screw_right_y_offset, rbf_side_wall_screw_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rbf_side_wall_screw_height, rbf_side_wall_screw_radius, rbf_side_wall_screw_radius, true, $fn=_fn_val);
            }
        }        
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