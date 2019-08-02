$include_rbf = true;
include <racecar_back_foundation.scad>

$include_rulfs = true;
include <racecar_upper_left_foundation_support.scad>

$include_rimu = true;
include <racecar_imu.scad>

rff_length = 98.0;
rff_width = rbf_width;
rff_height = rbf_height;
rff_x_offset = 0.0;
rff_y_offset = 0.0;
rff_z_offset = 0.0;

rff_wrt_rcb_x_offset = rbf_wrt_rcb_x_offset + rbf_length/2.0 + rff_length/2.0;
rff_wrt_rcb_y_offset = rbf_wrt_rcb_y_offset;
rff_wrt_rcb_z_offset = rbf_wrt_rcb_z_offset;

/*
rff_wrt_rcb_x_offset = rff_length/2.0 + rcb_body_screw_front_x_offset - (rcb_body_screw_front_x_offset - rcb_body_screw_back_x_offset) /2.0;
rff_wrt_rcb_y_offset = 0.0;
rff_wrt_rcb_z_offset = rff_height/2.0 + rcb_height/2.0;
*/

rff_compartment_length = rff_length;
rff_compartment_bottom_width = rbf_compartment_bottom_width;
rff_compartment_top_width = rbf_compartment_top_width;
rff_compartment_height = rbf_compartment_height;
rff_compartment_x_offset = rff_x_offset;
rff_compartment_y_offset = rff_y_offset;
rff_compartment_z_offset = rff_z_offset + rff_height/2.0 + rff_compartment_height/2.0;

rff_extend_length = 34.0;
rff_extend_base_width = rff_compartment_top_width;
rff_extend_bottom_width = rff_compartment_bottom_width;
rff_extend_top_width = 30.0;
rff_extend_height = rff_compartment_height;
rff_extend_x_offset = rff_compartment_x_offset+rff_compartment_length/2.0+rff_extend_length/2.0;
rff_extend_y_offset = rff_compartment_y_offset;
rff_extend_z_offset = rff_compartment_z_offset;

rff_side_wall_length = rff_compartment_length - _wall_thickness;
rff_side_wall_width = rbf_side_wall_width;
rff_side_wall_height = rbf_side_wall_height;
rff_side_wall_x_offset = rff_compartment_x_offset - rff_compartment_length/2.0 + rff_side_wall_length/2.0;
rff_side_wall_left_y_offset = rbf_side_wall_left_y_offset;
rff_side_wall_right_y_offset = rbf_side_wall_right_y_offset;
rff_side_wall_z_offset = rbf_side_wall_z_offset;

rff_outer_front_wall_length = rff_extend_length;
rff_outer_front_wall_back_width = rff_extend_base_width-2*_wall_thickness;
rff_outer_front_wall_front_width = rff_extend_top_width-2*_wall_thickness;
rff_outer_front_wall_height = rff_side_wall_height;
rff_outer_front_wall_x_offset = rff_extend_x_offset + rff_extend_length/2.0 - rff_outer_front_wall_length/2.0-_wall_thickness;
rff_outer_front_wall_y_offset = rff_extend_y_offset;
rff_outer_front_wall_z_offset = rff_extend_z_offset + rff_extend_height/2.0 + rff_outer_front_wall_height/2.0;

rff_inner_front_wall_length = rff_outer_front_wall_length - 2*_wall_thickness;
rff_inner_front_wall_back_width = rff_outer_front_wall_back_width - 2*rff_side_wall_width;
rff_inner_front_wall_front_width = rff_outer_front_wall_front_width;
rff_inner_front_wall_height = rff_outer_front_wall_height;
rff_inner_front_wall_x_offset = rff_outer_front_wall_x_offset - _wall_thickness;
rff_inner_front_wall_y_offset = rff_outer_front_wall_y_offset;
rff_inner_front_wall_z_offset = rff_outer_front_wall_z_offset;

rff_bank_length = 78.0;
rff_bank_width = rbf_bank_width;
rff_bank_height = rbf_bank_height;
rff_bank_x_offset = rff_x_offset - rff_length/2.0 + rff_bank_length/2.0;
rff_bank_y_offset = rff_y_offset;
rff_bank_z_offset = rff_z_offset + rff_height/2.0 + rff_bank_height/2.0;
 
rff_jetson_height = _m3_insert_depth;
rff_jetson_radius = _m3_insert_radius;
rff_jetson_front_right_x_offset = -rff_wrt_rcb_x_offset +rbf_wrt_rcb_x_offset+rbf_jetson_back_right_x_offset + 155.48;
rff_jetson_front_right_y_offset = -rff_wrt_rcb_y_offset +rbf_wrt_rcb_y_offset+rbf_jetson_back_right_y_offset;
rff_jetson_front_right_z_offset = -rff_wrt_rcb_z_offset +rbf_wrt_rcb_z_offset+rbf_jetson_back_right_z_offset;
rff_jetson_front_left_x_offset = -rff_wrt_rcb_x_offset +rbf_wrt_rcb_x_offset+rbf_jetson_back_left_x_offset + 132.334;
rff_jetson_front_left_y_offset = -rff_wrt_rcb_y_offset +rbf_wrt_rcb_y_offset+rbf_jetson_back_left_y_offset;
rff_jetson_front_left_z_offset = -rff_wrt_rcb_z_offset +rbf_wrt_rcb_z_offset+rbf_jetson_back_left_z_offset;

rff_imu_x_offset = rff_extend_x_offset-15;
rff_imu_y_offset = rff_extend_y_offset;
rff_imu_z_offset = rff_extend_z_offset + rff_extend_height/2.0 + rimu_height/2.0;

rff_imu_mount_height = _m3_insert_depth;
rff_imu_mount_radius = _m3_insert_radius;
rff_imu_mount_front_x_offset =  rff_imu_x_offset + rimu_support_front_x_offset;
rff_imu_mount_back_x_offset =  rff_imu_x_offset + rimu_support_back_x_offset;
rff_imu_mount_left_y_offset = rff_imu_y_offset + rimu_support_left_y_offset;
rff_imu_mount_right_y_offset = rff_imu_y_offset + rimu_support_right_y_offset;
rff_imu_mount_z_offset = rff_extend_z_offset + rff_extend_height/2.0 - rff_imu_mount_height/2.0+0.01;

rff_side_wall_screw_height = _m3_insert_depth;
rff_side_wall_screw_radius = _m3_insert_radius;
rff_side_wall_screw_front_x_offset = rff_side_wall_x_offset - rff_side_wall_length/2.0 + 2*_wall_thickness;
rff_side_wall_screw_back_x_offset = rff_side_wall_x_offset + rff_side_wall_length/2.0 - 2*_wall_thickness;
rff_side_wall_screw_left_y_offset = rff_side_wall_left_y_offset + rff_side_wall_width/2.0 - rff_side_wall_screw_height/2.0;
rff_side_wall_screw_right_y_offset = rff_side_wall_right_y_offset - rff_side_wall_width/2.0 + rff_side_wall_screw_height/2.0;
rff_side_wall_screw_z_offset = rff_side_wall_z_offset;

rff_front_wall_screw_height = _m3_insert_depth;
rff_front_wall_screw_radius = _m3_insert_radius;
rff_front_wall_screw_x_offset = rff_outer_front_wall_x_offset + rff_outer_front_wall_length/2.0 - rff_front_wall_screw_height/2.0;
rff_front_wall_screw_y_offset = rff_outer_front_wall_y_offset;
rff_front_wall_screw_z_offset = rff_outer_front_wall_z_offset;

rff_battery_wall_front_length = rbf_battery_wall_back_length;
rff_battery_wall_front_width = rbf_battery_wall_back_width;
rff_battery_wall_front_height = rbf_battery_wall_back_height;
rff_battery_wall_front_x_offset = -rff_wrt_rcb_x_offset+rbf_wrt_rcb_x_offset+rbf_battery_wall_back_x_offset+rbf_battery_wall_back_length/2.0+rff_battery_wall_front_length/2.0+137.5;
rff_battery_wall_front_y_offset = -rff_wrt_rcb_y_offset+rbf_wrt_rcb_y_offset+rbf_battery_wall_back_y_offset;
rff_battery_wall_front_z_offset = rff_height/2.0 + rff_battery_wall_front_height/2.0;

rff_foundation_bar_x_offset = -rff_wrt_rcb_x_offset +rbf_wrt_rcb_x_offset +rbf_foundation_bar_x_offset;
rff_foundation_bar_y_offset = -rff_wrt_rcb_y_offset +rbf_wrt_rcb_y_offset +rbf_foundation_bar_y_offset;
rff_foundation_bar_z_offset = -rff_wrt_rcb_z_offset +rbf_wrt_rcb_z_offset +rbf_foundation_bar_z_offset;

if($include_rff==undef) {
    RacecarFrontFoundation();
}

module RacecarFrontFoundation() {

    rff_crossbar_body_screw_height = rff_height;
    rff_crossbar_body_screw_x_offset = -rff_wrt_rcb_x_offset+rcb_body_screw_front_x_offset;
    rff_crossbar_body_screw_y_offset = -rff_wrt_rcb_y_offset+rcb_body_screw_y_offset;
    rff_crossbar_body_screw_z_offset = rff_z_offset;        
    
    rff_crossbar_top_screw_height = rff_height;
    rff_crossbar_top_screw_x_offset = -rff_wrt_rcb_x_offset+rcus_wrt_rcb_x_offset+rcus_screw_x_offset;
    rff_crossbar_top_screw_left_y_offset = -rff_wrt_rcb_y_offset+rcus_wrt_rcb_y_offset+rcus_screw_left_y_offset;
    rff_crossbar_top_screw_right_y_offset = -rff_wrt_rcb_y_offset+rcus_wrt_rcb_y_offset+rcus_screw_right_y_offset;
    rff_crossbar_top_screw_z_offset = rff_z_offset;    
    
    rff_rulfs_screw_height = rff_height;
    rff_rulfs_screw_x_offset = -rff_wrt_rcb_x_offset + rulfs_wrt_rcb_x_offset;
    rff_rulfs_screw_left_y_offset = -rff_wrt_rcb_y_offset + rulfs_wrt_rcb_y_offset + rulfs_width/2.0 - rfs_screw_from_edge;
    rff_rulfs_screw_right_y_offset = -rff_wrt_rcb_y_offset + rulfs_wrt_rcb_y_offset - rulfs_width/2.0 + rfs_screw_from_edge;    
    rff_rulfs_screw_z_offset = rff_z_offset;

    rff_rulfs_access_radius = _m3_screw_head_radius + 1;
    rff_rulfs_access_length = rff_rulfs_access_radius;
    rff_rulfs_access_width = (rff_rulfs_screw_left_y_offset - rff_rulfs_screw_right_y_offset) + 2*rff_rulfs_access_radius;
    rff_rulfs_access_height = rff_compartment_height;
    rff_rulfs_access_x_offset = rff_rulfs_screw_x_offset-rff_rulfs_access_length/2.0;
    rff_rulfs_access_y_offset = 0.5*(rff_rulfs_screw_left_y_offset + rff_rulfs_screw_right_y_offset);
    rff_rulfs_access_z_offset = rff_rulfs_screw_z_offset+rff_rulfs_screw_height/2.0+rff_rulfs_access_height/2.0+0.01;

    rff_crossbar_access_radius = _m3_screw_head_radius + 1;
    rff_crossbar_access_length = 22.0 - _wall_thickness;
    rff_crossbar_access_width = (rff_crossbar_top_screw_left_y_offset - rff_crossbar_top_screw_right_y_offset);
    rff_crossbar_access_height = rff_compartment_height;
    rff_crossbar_access_x_offset = rff_crossbar_top_screw_x_offset;
    rff_crossbar_access_y_offset = 0.5*(rff_crossbar_top_screw_left_y_offset +rff_crossbar_top_screw_right_y_offset);
    rff_crossbar_access_z_offset = rff_compartment_z_offset;
        
    rff_foundation_bar_fastener_height = _m3_insert_depth;
    rff_foundation_bar_fastener_radius = _m3_insert_radius;
    rff_foundation_bar_fastener_x_offset = rff_foundation_bar_x_offset + rfb_screw_front_x_offset;
    rff_foundation_bar_fastener_left_y_offset = rff_foundation_bar_y_offset + rfb_screw_left_y_offset;
    rff_foundation_bar_fastener_right_y_offset = rff_foundation_bar_y_offset + rfb_screw_right_y_offset;
    rff_foundation_bar_fastener_z_offset = rff_foundation_bar_z_offset - rfb_height/2.0 - rff_foundation_bar_fastener_height/2.0;
    
    
    rff_ssd_card_length = 70.5;
    rff_ssd_card_width = 130;
    rff_ssd_card_height = 4.5;
    rff_ssd_card_x_offset = rff_foundation_bar_x_offset + rfb_length/2.0 + rff_ssd_card_length/2.0;
    rff_ssd_card_y_offset = rff_y_offset;
    rff_ssd_card_z_offset = rff_compartment_z_offset + rff_compartment_height/2.0 - rff_ssd_card_height/2.0+0.001;    
    
    rff_ssd_cable_length = (rff_x_offset+rff_length/2.0)-(rff_bank_x_offset+rff_bank_length/2.0)-2*_wall_thickness;
    rff_ssd_cable_width = 30.0;
    rff_ssd_cable_height = rff_compartment_height;
    rff_ssd_cable_x_offset = rff_bank_x_offset+rff_bank_length/2.0+rff_ssd_cable_length/2.0-0.01;
    rff_ssd_cable_y_offset = rff_bank_y_offset - rff_bank_width/2.0+rff_ssd_cable_width/2.0+_wall_thickness;
    rff_ssd_cable_z_offset = rff_compartment_z_offset+rff_compartment_height/2.0-rff_ssd_cable_height/2.0+0.001;
    
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
    
    difference() {
        union() {
            translate([rff_x_offset, rff_y_offset, rff_z_offset]) {
                cube([rff_length, rff_width, rff_height], true);
            }             
            
            translate([rff_compartment_x_offset, rff_compartment_y_offset, rff_compartment_z_offset]) {
                rotate([0,90,0]) {
                    _trapezoid(rff_compartment_bottom_width, rff_compartment_top_width, rff_compartment_height, rff_compartment_length);  
                }    
            }
        
            translate([rff_extend_x_offset, rff_extend_y_offset, rff_extend_z_offset]) {
                _spec_trap(rff_extend_base_width, rff_extend_top_width,rff_extend_bottom_width, rff_extend_length, rff_extend_height);
            }

            difference() {
                translate([rff_outer_front_wall_x_offset, rff_outer_front_wall_y_offset, rff_outer_front_wall_z_offset]) {
                    _trapezoid(rff_outer_front_wall_front_width, rff_outer_front_wall_back_width, rff_outer_front_wall_length, rff_outer_front_wall_height);           
                }
                translate([rff_inner_front_wall_x_offset-0.01, rff_inner_front_wall_y_offset, rff_inner_front_wall_z_offset]) {
                    _trapezoid(rff_inner_front_wall_front_width, rff_inner_front_wall_back_width, rff_inner_front_wall_length, rff_inner_front_wall_height);           
                }
                translate([rff_front_wall_screw_x_offset, rff_front_wall_screw_y_offset, rff_front_wall_screw_z_offset]) {
                    rotate([0,90,0]) {
                        cylinder(rff_front_wall_screw_height, rff_front_wall_screw_radius, rff_front_wall_screw_radius, true, $fn=_fn_val);
                    }
                }
            }
            
        }
        
        translate([rff_bank_x_offset-0.001, rff_bank_y_offset, rff_bank_z_offset+0.001]) {
            cube([rff_bank_length, rff_bank_width, rff_bank_height], true);
        }
        
        translate([rff_crossbar_body_screw_x_offset, rff_crossbar_body_screw_y_offset, rff_crossbar_body_screw_z_offset]) {
            _m3_flathead_screw(rff_crossbar_body_screw_height+0.01);            
        }
        translate([rff_crossbar_top_screw_x_offset, rff_crossbar_top_screw_left_y_offset, rff_crossbar_top_screw_z_offset]) {
            _m3_flathead_screw(rff_crossbar_top_screw_height);
        }
        translate([rff_crossbar_top_screw_x_offset, rff_crossbar_top_screw_left_y_offset, rff_crossbar_top_screw_z_offset+rff_crossbar_top_screw_height/2.0+rff_compartment_height/2.0]) {
            cylinder(rff_compartment_height+0.01, rff_crossbar_access_radius, rff_crossbar_access_radius, true, $fn=_fn_val);
        }
        translate([rff_crossbar_top_screw_x_offset, rff_crossbar_top_screw_right_y_offset, rff_crossbar_top_screw_z_offset]) {
            _m3_flathead_screw(rff_crossbar_top_screw_height);
        }        
        translate([rff_crossbar_top_screw_x_offset, rff_crossbar_top_screw_right_y_offset, rff_crossbar_top_screw_z_offset+rff_crossbar_top_screw_height/2.0+rff_compartment_height/2.0]) {
            cylinder(rff_compartment_height+0.01, rff_crossbar_access_radius, rff_crossbar_access_radius, true, $fn=_fn_val);
        }
        translate([rff_crossbar_access_x_offset,rff_crossbar_access_y_offset,rff_crossbar_access_z_offset]) {
            cube([rff_crossbar_access_length, rff_crossbar_access_width, rff_crossbar_access_height+0.01], true);
        }

        translate([rff_rulfs_screw_x_offset, rff_rulfs_screw_left_y_offset, rff_rulfs_screw_z_offset]) {
            _m3_flathead_screw(rff_rulfs_screw_height);
        }
        translate([rff_rulfs_screw_x_offset, rff_rulfs_screw_left_y_offset, rff_rulfs_screw_z_offset+rff_rulfs_screw_height/2.0+rff_compartment_height/2.0]) {
            cylinder(rff_compartment_height+0.01, rff_rulfs_access_radius, rff_rulfs_access_radius, true, $fn=_fn_val);
        }
        translate([rff_rulfs_screw_x_offset, rff_rulfs_screw_right_y_offset, rff_rulfs_screw_z_offset]) {
            _m3_flathead_screw(rff_rulfs_screw_height);
        }
        translate([rff_rulfs_screw_x_offset, rff_rulfs_screw_right_y_offset, rff_rulfs_screw_z_offset+rff_rulfs_screw_height/2.0+rff_compartment_height/2.0]) {
            cylinder(rff_compartment_height+0.01, rff_rulfs_access_radius, rff_rulfs_access_radius, true, $fn=_fn_val);
        } 
        translate([rff_rulfs_access_x_offset,rff_rulfs_access_y_offset,rff_rulfs_access_z_offset]) {
            cube([rff_rulfs_access_length, rff_rulfs_access_width, rff_rulfs_access_height], true);
        }
        translate([rff_foundation_bar_x_offset,rff_foundation_bar_y_offset,rff_foundation_bar_z_offset]) {
            RacecarFoundationBar(false);
        }
        translate([rff_foundation_bar_fastener_x_offset, rff_foundation_bar_fastener_left_y_offset, rff_foundation_bar_fastener_z_offset]) {
            cylinder(rff_foundation_bar_fastener_height, rff_foundation_bar_fastener_radius, rff_foundation_bar_fastener_radius, true, $fn=_fn_val);
        }
        translate([rff_foundation_bar_fastener_x_offset, rff_foundation_bar_fastener_right_y_offset, rff_foundation_bar_fastener_z_offset]) {
            cylinder(rff_foundation_bar_fastener_height, rff_foundation_bar_fastener_radius, rff_foundation_bar_fastener_radius, true, $fn=_fn_val);
        }  
        translate([rff_ssd_card_x_offset,rff_ssd_card_y_offset,rff_ssd_card_z_offset]) {
            cube([rff_ssd_card_length, rff_ssd_card_width, rff_ssd_card_height], true);
        }
        translate([rff_ssd_cable_x_offset,rff_ssd_cable_y_offset,rff_ssd_cable_z_offset]) {
            cube([rff_ssd_cable_length, rff_ssd_cable_width, rff_ssd_cable_height], true);
        }
        translate([rff_jetson_front_right_x_offset, rff_jetson_front_right_y_offset, rff_jetson_front_right_z_offset]) {
            cylinder(rff_jetson_height, rff_jetson_radius, rff_jetson_radius, true, $fn=_fn_val);
        }
        translate([rff_jetson_front_left_x_offset, rff_jetson_front_left_y_offset, rff_jetson_front_left_z_offset+0.01]) {
            cylinder(rff_jetson_height, rff_jetson_radius, rff_jetson_radius, true, $fn=_fn_val);
        }        
        translate([rff_imu_mount_front_x_offset, rff_imu_mount_left_y_offset, rff_imu_mount_z_offset]) {
            cylinder(rff_imu_mount_height, rff_imu_mount_radius, rff_imu_mount_radius, true, $fn=_fn_val);
        }
        translate([rff_imu_mount_front_x_offset, rff_imu_mount_right_y_offset, rff_imu_mount_z_offset]) {
            cylinder(rff_imu_mount_height, rff_imu_mount_radius, rff_imu_mount_radius, true, $fn=_fn_val);
        }        
        translate([rff_imu_mount_back_x_offset, rff_imu_mount_left_y_offset, rff_imu_mount_z_offset]) {
            cylinder(rff_imu_mount_height, rff_imu_mount_radius, rff_imu_mount_radius, true, $fn=_fn_val);
        }
        translate([rff_imu_mount_back_x_offset, rff_imu_mount_right_y_offset, rff_imu_mount_z_offset]) {
            cylinder(rff_imu_mount_height, rff_imu_mount_radius, rff_imu_mount_radius, true, $fn=_fn_val);
        }                
    }
    
    difference() {
        translate([rff_side_wall_x_offset, rff_side_wall_left_y_offset, rff_side_wall_z_offset]) {
            cube([rff_side_wall_length, rff_side_wall_width, rff_side_wall_height], true);
        }
        translate([rff_side_wall_screw_front_x_offset, rff_side_wall_screw_left_y_offset, rff_side_wall_screw_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rff_side_wall_screw_height, rff_side_wall_screw_radius, rff_side_wall_screw_radius, true, $fn=_fn_val);
            }
        }  
        translate([rff_side_wall_screw_back_x_offset, rff_side_wall_screw_left_y_offset, rff_side_wall_screw_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rff_side_wall_screw_height, rff_side_wall_screw_radius, rff_side_wall_screw_radius, true, $fn=_fn_val);
            }
        }          
    }
    
    difference() {
        translate([rff_side_wall_x_offset, rff_side_wall_right_y_offset, rff_side_wall_z_offset]) {
            cube([rff_side_wall_length, rff_side_wall_width, rff_side_wall_height], true);
        }    
        translate([rff_side_wall_screw_front_x_offset, rff_side_wall_screw_right_y_offset, rff_side_wall_screw_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rff_side_wall_screw_height, rff_side_wall_screw_radius, rff_side_wall_screw_radius, true, $fn=_fn_val);
            }
        }  
        translate([rff_side_wall_screw_back_x_offset, rff_side_wall_screw_right_y_offset, rff_side_wall_screw_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rff_side_wall_screw_height, rff_side_wall_screw_radius, rff_side_wall_screw_radius, true, $fn=_fn_val);
            }
        }                  
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


}