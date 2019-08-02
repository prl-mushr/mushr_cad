$include_rbf = true;
include <racecar_back_foundation.scad>

rs_length = 42.0;
rs_width = (rbf_scaffold_mount_left_y_offset - rbf_scaffold_mount_right_y_offset)-rbf_scaffold_mount_width;
rs_height = 50;
rs_x_offset = 0.0;
rs_y_offset = 0.0;
rs_z_offset = 0.0;

rs_wrt_rbf_x_offset = rbf_scaffold_mount_x_offset - rbf_scaffold_mount_length/2.0 + rs_length/2.0;
rs_wrt_rbf_y_offset = 0.5*(rbf_scaffold_mount_left_y_offset+rbf_scaffold_mount_right_y_offset);
rs_wrt_rbf_z_offset = rbf_scaffold_mount_z_offset - rbf_scaffold_mount_height/2.0 + rs_height/2.0;

rs_base_length = rs_length;
rs_base_width = rs_width;
rs_base_height = 5.0;
rs_base_x_offset = rs_x_offset;
rs_base_y_offset = rs_y_offset;
rs_base_z_offset = rs_height/2.0 - rs_base_height/2.0;

rs_leg_length = 15.0;
rs_leg_width = (rbf_scaffold_mount_left_y_offset-rbf_scaffold_mount_width/2.0) - (rbf_bank_y_offset + rbf_bank_width/2.0) ;
rs_leg_height = rs_height;
rs_leg_x_offset = rs_x_offset-rs_length/2.0+rs_leg_length/2.0;
rs_leg_left_y_offset = rs_y_offset+rs_width/2.0-rs_leg_width/2.0;
rs_leg_right_y_offset = rs_y_offset-rs_width/2.0+rs_leg_width/2.0;
rs_leg_z_offset = rs_z_offset + rs_height/2.0 - rs_leg_height/2.0;

if ($include_rs==undef) {
    RacecarScaffold();
}

module RacecarScaffold() {

    rs_leg_tri_length = rs_length - rs_leg_length;
    rs_leg_tri_width = rs_leg_width;
    rs_leg_tri_height = rs_leg_height;
    rs_leg_tri_x_offset = rs_leg_x_offset + rs_leg_length/2.0;
    rs_leg_tri_left_y_offset = rs_leg_left_y_offset-rs_leg_tri_width/2.0;
    rs_leg_tri_right_y_offset = rs_leg_right_y_offset-rs_leg_tri_width/2.0;;
    rs_leg_tri_z_offset = rs_leg_z_offset+rs_leg_tri_height/2.0;

    rs_base_hole_column_count = 4;
    rs_base_hole_length = 2.0;
    rs_base_hole_width = 7.5;
    rs_base_hole_height = rs_base_height;
    rs_base_hole_front_x_offset = rs_base_x_offset + rs_base_length/2.0-_wall_thickness-rs_base_hole_length/2.0;
    rs_base_hole_back_x_offset = rs_base_x_offset - rs_base_length/2.0+_wall_thickness+rs_base_hole_length/2.0;  
    rs_base_hole_far_right_y_offset = rs_base_y_offset + rs_base_width/2.0 - (4.0/5)*rs_base_width;    
    rs_base_hole_z_offset = rs_base_z_offset;

    rs_motor_hole_separation = 13.0;
    rs_motor_hole_length = 7.0;
    rs_motor_hole_width = rs_leg_width+0.001;
    rs_motor_hole_height = rs_leg_height - rs_base_height - rbf_scaffold_mount_height - 5.0;
    rs_motor_hole_mid_x_offset = rs_leg_x_offset-rs_leg_length/2.0+(rs_leg_length+rs_leg_tri_length)/2.0;
    rs_motor_hole_front_x_offset = rs_motor_hole_mid_x_offset + rs_motor_hole_separation; 
    rs_motor_hole_back_x_offset = rs_motor_hole_mid_x_offset -rs_motor_hole_separation;
    rs_motor_hole_y_offset = rs_leg_right_y_offset;
    rs_motor_hole_z_offset = rs_leg_z_offset - rs_leg_height/2.0+rs_motor_hole_height/2.0+rbf_scaffold_mount_height;

    rs_motor_cleanup_length = (rs_base_x_offset + rs_base_length/2.0) - (rs_motor_hole_mid_x_offset);
    rs_motor_cleanup_width = rs_leg_width;
    rs_motor_cleanup_height = rs_motor_hole_height;
    rs_motor_cleanup_x_offset = (rs_motor_hole_mid_x_offset) + rs_motor_cleanup_length /2.0;
    rs_motor_cleanup_y_offset = rs_leg_right_y_offset;
    rs_motor_cleanup_z_offset = rs_motor_hole_z_offset+rs_motor_hole_height/2.0-rs_motor_cleanup_height/2.0;

    rs_battery_hole_length = 20.0;
    rs_battery_hole_width = rs_leg_width + 0.001;
    rs_battery_hole_height = rs_leg_height - rbf_scaffold_mount_height - rs_base_height- 5.0;
    rs_battery_hole_x_offset = rs_leg_x_offset-rs_leg_length/2.0;
    rs_battery_hole_y_offset = rs_leg_left_y_offset;
    rs_battery_hole_z_offset = rs_leg_z_offset - rs_leg_height/2.0+rbf_scaffold_mount_height+rs_battery_hole_height/2.0;

    rs_insert_height = rs_leg_width;
    rs_insert_radius = _m3_insert_radius;
    rs_insert_back_x_offset = rs_leg_x_offset - 0.5*(rbf_scaffold_screw_front_x_offset - rbf_scaffold_screw_back_x_offset);    
    rs_insert_front_x_offset = rs_leg_x_offset + 0.5*(rbf_scaffold_screw_front_x_offset - rbf_scaffold_screw_back_x_offset);
    rs_insert_left_y_offset = rs_leg_left_y_offset+rs_leg_width/2.0-rs_insert_height/2.0;
    rs_insert_right_y_offset = rs_leg_right_y_offset-rs_leg_width/2.0+rs_insert_height/2.0;
    rs_insert_z_offset = rs_z_offset - rs_height/2.0 + rbf_scaffold_mount_height/2.0;

    difference() {
        union() {
            translate([rs_base_x_offset, rs_base_y_offset, rs_base_z_offset]) {
                cube([rs_base_length, rs_base_width, rs_base_height], true);
            }
            translate([rs_leg_x_offset, rs_leg_left_y_offset, rs_leg_z_offset]) {
                cube([rs_leg_length, rs_leg_width, rs_leg_height], true);
            }
            translate([rs_leg_x_offset, rs_leg_right_y_offset, rs_leg_z_offset]) {
                cube([rs_leg_length, rs_leg_width, rs_leg_height], true);
            }
            translate([rs_leg_tri_x_offset, rs_leg_tri_left_y_offset, rs_leg_tri_z_offset]) {
                rotate([0,90,0]) {
                    _triangle(rs_leg_tri_height, rs_leg_tri_width, rs_leg_tri_length);
                }            
            }
            translate([rs_leg_tri_x_offset, rs_leg_tri_right_y_offset, rs_leg_tri_z_offset]) {
                rotate([0,90,0]) {
                    _triangle(rs_leg_tri_height, rs_leg_tri_width, rs_leg_tri_length);
                }            
            }                
        }
        for(i=[0:rs_base_hole_column_count-1]) {
            translate([rs_base_hole_front_x_offset, rs_base_hole_far_right_y_offset+(i/(rs_base_hole_column_count+1))*rs_base_width, rs_base_hole_z_offset]) {
                rotate([0,0,90]) {
                    _rounded_square(rs_base_hole_width, rs_base_hole_length, rs_base_hole_height);
                }
            }
            translate([rs_base_hole_back_x_offset, rs_base_hole_far_right_y_offset+(i/(rs_base_hole_column_count+1))*rs_base_width, rs_base_hole_z_offset]) {
                rotate([0,0,90]) {
                    _rounded_square(rs_base_hole_width, rs_base_hole_length, rs_base_hole_height);
                }
            }            
        }
        translate([rs_motor_hole_mid_x_offset, rs_motor_hole_y_offset, rs_motor_hole_z_offset]) {            
            rotate([90,90,0]) {
                _rounded_square(rs_motor_hole_height, rs_motor_hole_length, rs_motor_hole_width);
            }   
        }    
    
        translate([rs_motor_hole_front_x_offset, rs_motor_hole_y_offset, rs_motor_hole_z_offset]) {            
            rotate([90,90,0]) {
                _rounded_square(rs_motor_hole_height, rs_motor_hole_length, rs_motor_hole_width);
            }   
        }

        translate([rs_motor_hole_back_x_offset, rs_motor_hole_y_offset, rs_motor_hole_z_offset]) {            
            rotate([90,90,0]) {
                _rounded_square(rs_motor_hole_height, rs_motor_hole_length, rs_motor_hole_width);
            }   
        }
        
        translate([rs_motor_cleanup_x_offset,rs_motor_cleanup_y_offset,rs_motor_cleanup_z_offset]) {
            cube([rs_motor_cleanup_length,rs_motor_cleanup_width,rs_motor_cleanup_height], true);
        }

        translate([rs_battery_hole_x_offset, rs_battery_hole_y_offset, rs_battery_hole_z_offset]) {            
            rotate([90,90,0]) {
                _rounded_square(rs_battery_hole_height, rs_battery_hole_length, rs_battery_hole_width);
            }   
        }
        translate([rs_insert_front_x_offset, rs_insert_left_y_offset, rs_insert_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rs_insert_height, rs_insert_radius, rs_insert_radius, true, $fn=_fn_val);
            }
        } 
        translate([rs_insert_back_x_offset, rs_insert_left_y_offset, rs_insert_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rs_insert_height, rs_insert_radius, rs_insert_radius, true, $fn=_fn_val);
            }
        } 
        translate([rs_insert_front_x_offset, rs_insert_right_y_offset, rs_insert_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rs_insert_height, rs_insert_radius, rs_insert_radius, true, $fn=_fn_val);
            }
        } 
        translate([rs_insert_back_x_offset, rs_insert_right_y_offset, rs_insert_z_offset]) {
            rotate([90,0,0]) {
                cylinder(rs_insert_height, rs_insert_radius, rs_insert_radius, true, $fn=_fn_val);
            }
        }         
    }   
}