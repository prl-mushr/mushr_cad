include <../misc/racecar_global_utils.scad>

rcst_length = 21.0;
rcst_width = 21.0;

rcstc_length = 13.45;
rcstc_width = 6.00;
rcstc_height = rcstc_width;

if ($include_rclsl==undef) {

    RacecarChassisShockTower();

}

module RacecarChassisShockTower(rcst_height = 102.3) {  

    rcst_top_mount_cylinder_height = 4.15;
    rcst_top_mount_cylinder_radius = 13.15/2.0;
    rcst_top_mount_cylinder_x_offset = 0.0;
    rcst_top_mount_cylinder_y_offset = 0.0;
    rcst_top_mount_cylinder_z_offset = rcst_height/2.0 - rcst_top_mount_cylinder_radius;

    rcst_top_mount_cube_length = rcst_top_mount_cylinder_height;
    rcst_top_mount_cube_width = 2*rcst_top_mount_cylinder_radius;
    rcst_top_mount_cube_height = 6.75;
    rcst_top_mount_cube_x_offset = rcst_top_mount_cylinder_x_offset;
    rcst_top_mount_cube_y_offset = rcst_top_mount_cylinder_y_offset;
    rcst_top_mount_cube_z_offset = rcst_top_mount_cylinder_z_offset - rcst_top_mount_cube_height/2.0;
    
    rcst_top_connector_x_offset = rcst_top_mount_cylinder_x_offset + rcst_top_mount_cylinder_height/2.0 - rcstc_length/2.0+0.01;
    rcst_top_connector_y_offset = rcst_top_mount_cylinder_y_offset;
    rcst_top_connector_z_offset = rcst_top_mount_cylinder_z_offset;

    rcst_top_cap_height = 8.5;
    rcst_top_cap_diameter = 19.25;
    rcst_top_cap_x_offset = rcst_top_mount_cube_x_offset;
    rcst_top_cap_y_offset = rcst_top_mount_cube_y_offset;
    rcst_top_cap_z_offset = rcst_top_mount_cube_z_offset - rcst_top_mount_cube_height/2.0 - rcst_top_cap_height/2.0;

    rcst_bottom_mount_cylinder_height = 3.4;
    rcst_bottom_mount_cylinder_radius = 8.6/2.0;
    rcst_bottom_mount_cylinder_x_offset = rcst_top_mount_cylinder_x_offset;
    rcst_bottom_mount_cylinder_y_offset = rcst_top_mount_cylinder_y_offset;    
    rcst_bottom_mount_cylinder_z_offset = -rcst_height/2.0+rcst_bottom_mount_cylinder_radius;    
    
    rcst_bottom_connector_x_offset = rcst_bottom_mount_cylinder_x_offset + rcst_bottom_mount_cylinder_height/2.0 - rcstc_length/2.0+0.01;
    rcst_bottom_connector_y_offset = rcst_bottom_mount_cylinder_y_offset;
    rcst_bottom_connector_z_offset = rcst_bottom_mount_cylinder_z_offset;    

    rcst_bottom_mount_cube_length = rcst_bottom_mount_cylinder_height;
    rcst_bottom_mount_cube_width = 2*rcst_bottom_mount_cylinder_radius;
    rcst_bottom_mount_cube_height = 10.15;
    rcst_bottom_mount_cube_x_offset = rcst_bottom_mount_cylinder_x_offset;
    rcst_bottom_mount_cube_y_offset = rcst_bottom_mount_cylinder_y_offset;
    rcst_bottom_mount_cube_z_offset = rcst_bottom_mount_cylinder_z_offset + rcst_bottom_mount_cube_height/2.0;

    rcst_bottom_cap_height = 11.0;
    rcst_bottom_cap_bottom_radius = 9.75/2.0;
    rcst_bottom_cap_upper_radius = rcst_length/2.0;
    rcst_bottom_cap_x_offset = rcst_bottom_mount_cube_x_offset;
    rcst_bottom_cap_y_offset = rcst_bottom_mount_cube_y_offset;
    rcst_bottom_cap_z_offset = rcst_bottom_mount_cube_z_offset + rcst_bottom_mount_cube_height/2.0 + rcst_bottom_cap_height/2.0;

    rcst_body_height = (rcst_top_cap_z_offset-rcst_top_cap_height/2.0) - (rcst_bottom_cap_z_offset+rcst_bottom_cap_height/2.0);
    rcst_body_radius = 16.0/2.0;
    rcst_body_x_offset = rcst_bottom_cap_x_offset;
    rcst_body_y_offset = rcst_bottom_cap_y_offset;
    rcst_body_z_offset = rcst_bottom_cap_z_offset + rcst_bottom_cap_height/2.0 + rcst_body_height/2.0;
    
    rcst_spring_outer_diameter = rcst_length;
    rcst_spring_coil_thickness = 1.43;
    rcst_spring_length = rcst_body_height;
    rcst_spring_coil_count = 7;
    rcst_spring_coil_x_offset = rcst_body_x_offset;
    rcst_spring_coil_y_offset = rcst_body_y_offset;    
    rcst_spring_coil_z_offset = rcst_body_z_offset - rcst_spring_length/2.0;
    
    difference() {
        union() {
            translate([rcst_top_mount_cylinder_x_offset, rcst_top_mount_cylinder_y_offset, rcst_top_mount_cylinder_z_offset]) {
                rotate([0,90,0]) {
                    cylinder(rcst_top_mount_cylinder_height, rcst_top_mount_cylinder_radius, rcst_top_mount_cylinder_radius, true, $fn=_fn_val);
                }
            }
            
            translate([rcst_top_mount_cube_x_offset, rcst_top_mount_cube_y_offset, rcst_top_mount_cube_z_offset]) {
                cube([rcst_top_mount_cube_length, rcst_top_mount_cube_width, rcst_top_mount_cube_height], true);
            }            
        }
        translate([rcst_top_connector_x_offset, rcst_top_connector_y_offset, rcst_top_connector_z_offset]) {
            RacecarChassisShockTowerConnector(false);
        }
    }
    translate([rcst_top_connector_x_offset, rcst_top_connector_y_offset, rcst_top_connector_z_offset]) {
            RacecarChassisShockTowerConnector(true);
    }
    translate([rcst_top_cap_x_offset, rcst_top_cap_y_offset, rcst_top_cap_z_offset]) {
        _hexagon(rcst_top_cap_height, rcst_top_cap_diameter);
    }
    
    difference() {
        union() {
            translate([rcst_bottom_mount_cylinder_x_offset, rcst_bottom_mount_cylinder_y_offset, rcst_bottom_mount_cylinder_z_offset]) {
                rotate([0,90,0]) {
                    cylinder(rcst_bottom_mount_cylinder_height, rcst_bottom_mount_cylinder_radius, rcst_bottom_mount_cylinder_radius, true, $fn=_fn_val);
                }
            }
            translate([rcst_bottom_mount_cube_x_offset, rcst_bottom_mount_cube_y_offset, rcst_bottom_mount_cube_z_offset]) {
                cube([rcst_bottom_mount_cube_length, rcst_bottom_mount_cube_width, rcst_bottom_mount_cube_height], true);
            }
        }
        translate([rcst_bottom_connector_x_offset, rcst_bottom_connector_y_offset, rcst_bottom_connector_z_offset]) {
            RacecarChassisShockTowerConnector(false);            
        }
    }
    translate([rcst_bottom_connector_x_offset, rcst_bottom_connector_y_offset, rcst_bottom_connector_z_offset]) {
        RacecarChassisShockTowerConnector(true);            
    }
    
    translate([rcst_bottom_cap_x_offset, rcst_bottom_cap_y_offset, rcst_bottom_cap_z_offset]) {
        cylinder(rcst_bottom_cap_height, rcst_bottom_cap_bottom_radius, rcst_bottom_cap_upper_radius, true, $fn=_fn_val);
    }
    
    translate([rcst_body_x_offset, rcst_body_y_offset, rcst_body_z_offset]) {
        cylinder(rcst_body_height, rcst_body_radius, rcst_body_radius, true, $fn=_fn_val);
    }
    
    translate([rcst_spring_coil_x_offset, rcst_spring_coil_y_offset, rcst_spring_coil_z_offset]) {
        rcst_spring_params = [rcst_spring_outer_diameter, rcst_spring_coil_thickness, rcst_spring_length, rcst_spring_coil_count];
        _comp_spring(rcst_spring_params);
    }
/*
extruder_spring = [ 7,    1, 10, 5];
_comp_spring(extruder_spring);
*/      
    
}

module RacecarChassisShockTowerConnector(include_cutout=true) {
    
    rsctc_base_height = 3.0;
    rsctc_base_radius = rcstc_width/2.0;
    rsctc_base_x_offset = rsctc_base_height/2.0 - rcstc_length/2.0;
    rsctc_base_y_offset = 0.0;
    rsctc_base_z_offset = 0.0;
    
    rsctc_head_height = 5.5;
    rsctc_head_radius = 4.5/2.0;
    rsctc_head_x_offset = -rsctc_head_height/2.0 + rcstc_length/2.0;
    rsctc_head_y_offset = rsctc_base_y_offset;
    rsctc_head_z_offset = rsctc_base_z_offset;    
    
    rsctc_body_height = rcstc_length - rsctc_head_height - rsctc_base_height;
    rsctc_back_body_radius = rsctc_base_radius;
    rsctc_front_body_radius = rsctc_head_radius;
    rsctc_body_x_offset = rsctc_head_x_offset - rsctc_head_height/2.0 - rsctc_body_height/2.0;
    rsctc_body_y_offset = rsctc_head_y_offset;
    rsctc_body_z_offset = rsctc_head_z_offset;   
   
    rsctc_cutout_height = rcstc_length;
    rsctc_cutout_radius = rsctc_head_radius - 0.8;
    rsctc_cutout_x_offset = 0.0;
    rsctc_cutout_y_offset = 0.0;
    rsctc_cutout_z_offset = 0.0;
    
    difference() {
        union() {
            translate([rsctc_base_x_offset, rsctc_base_y_offset, rsctc_base_z_offset]) {
                rotate([0,90,0]) {
                    cylinder(rsctc_base_height, rsctc_base_radius, rsctc_base_radius, true, $fn=_fn_val);
                }
            }
            
            translate([rsctc_head_x_offset, rsctc_head_y_offset, rsctc_head_z_offset]) {
                rotate([0,90,0]) {
                    cylinder(rsctc_head_height, rsctc_head_radius, rsctc_head_radius, true, $fn=_fn_val);
                }
            }    
            
            translate([rsctc_body_x_offset, rsctc_body_y_offset, rsctc_body_z_offset]) {
                rotate([0,90,0]) {
                    cylinder(rsctc_body_height, rsctc_back_body_radius, rsctc_front_body_radius, true, $fn=_fn_val);
                }
            }      
        }
        if(include_cutout) {
            translate([rsctc_cutout_x_offset, rsctc_cutout_y_offset, rsctc_cutout_z_offset]) {
                    rotate([0,90,0]) {
                        cylinder(rsctc_cutout_height, rsctc_cutout_radius, rsctc_cutout_radius, true, $fn=_fn_val);
                    }
            }
        }        
    }
    
}