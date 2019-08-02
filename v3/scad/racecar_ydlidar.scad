$include_rbct = true;
include <racecar_back_cover_top.scad>

ry_length = 101.7;
ry_width = 71.2;
ry_height = 59.0;
ry_fn_val = 50;

ryt_inner_cylinder_radius = 65.97/2.0;
ryt_inner_cylinder_height = 25.03;
ryt_inner_cylinder_x_offset = 0.0;
ryt_inner_cylinder_y_offset = 0.0;
ryt_inner_cylinder_z_offset = ry_height/2.0 - ryt_inner_cylinder_height/2.0;

ryt_outer_cylinder_height = 3.5;
ryt_outer_cylinder_radius = 68.63/2.0;
ryt_outer_cylinder_x_offset = 0.0;
ryt_outer_cylinder_y_offset = 0.0;
ryt_outer_cylinder_z_offset = ryt_inner_cylinder_z_offset - ryt_inner_cylinder_height/2.0 + ryt_outer_cylinder_height/2.0;

ryb_front_cylinder_radius = 71.0/2.0;
ryb_front_cylinder_x_offset = ryt_inner_cylinder_x_offset;
ryb_front_cylinder_y_offset = ryt_inner_cylinder_y_offset;

ryb_back_cylinder_radius = 35/2.0;
ryb_back_cylinder_x_offset = ryb_front_cylinder_x_offset + ryb_front_cylinder_radius - ry_length + ryb_back_cylinder_radius;
ryb_back_cylinder_y_offset = ryb_front_cylinder_y_offset;

ryb_leg_radius = 9.5/2.0;
ryb_leg_front_x_offset = ryt_inner_cylinder_x_offset + 22.0;
ryb_leg_back_x_offset = ryt_inner_cylinder_x_offset - 35.0;
ryb_leg_front_left_y_offset = ryt_inner_cylinder_y_offset + 31.0;
ryb_leg_front_right_y_offset = ryt_inner_cylinder_y_offset - 31.0;
ryb_leg_back_left_y_offset = ryt_inner_cylinder_y_offset + 25.0;
ryb_leg_back_right_y_offset = ryt_inner_cylinder_y_offset - 25.0;

ry_lower_platform_height = 2.0;
ry_lower_platform_leg_height = ry_lower_platform_height;

ryb_leg_height = 4.5;
ryb_base_height = 10.0;

ry_wrt_rcb_x_offset = rbf_wrt_rcb_x_offset + rbct_wrt_rbf_x_offset - ryb_leg_front_x_offset + rbct_laser_leg_front_x_offset;
ry_wrt_rcb_y_offset = rbf_wrt_rcb_y_offset + rbct_wrt_rbf_y_offset - ryb_leg_front_left_y_offset + rbct_laser_leg_front_left_y_offset;
ry_wrt_rcb_z_offset = rbf_wrt_rcb_z_offset + rbct_wrt_rbf_z_offset + rbct_height/2.0 + ry_height/2.0-3;

if($include_ry==undef) {
    RacecarYDLidar();
    
    //RacecarYDLidarTop();    
    //RacecarYDLidarMotor();
    //RacecarYDLidarMount();    
    
}

module RacecarYDLidar() {
    
    RacecarYDLidarTop();    

    RacecarYDLidarMotor();
    
    RacecarYDLidarMount();
    
}

module RacecarYDLidarMount() {

    ry_leg_height = ry_height - ryt_inner_cylinder_height - ryb_base_height/2.0;
    ry_leg_diameter = 5.0;
    ry_leg_z_offset = ryt_inner_cylinder_z_offset - ryt_inner_cylinder_height/2.0 - ryb_base_height/2.0-ry_leg_height/2.0;  
    
    
    RacecarYDLidarBase(ryb_base_height, ryb_leg_height);
    translate([0.0, 0.0, -17.5]) {
        RacecarYDLidarBase(ry_lower_platform_height, ry_lower_platform_leg_height);
    }
    translate([ryb_leg_front_x_offset, ryb_leg_front_left_y_offset, ry_leg_z_offset]) {
        _hexagon(ry_leg_height, ry_leg_diameter);
    }
    translate([ryb_leg_back_x_offset, ryb_leg_back_left_y_offset, ry_leg_z_offset]) {
        _hexagon(ry_leg_height, ry_leg_diameter);
    }    
    translate([ryb_leg_front_x_offset, ryb_leg_front_right_y_offset, ry_leg_z_offset]) {
        _hexagon(ry_leg_height, ry_leg_diameter);
    }
    translate([ryb_leg_back_x_offset, ryb_leg_back_right_y_offset, ry_leg_z_offset]) {
        _hexagon(ry_leg_height, ry_leg_diameter);
    }    
}

module RacecarYDLidarTop() {
        
    ryt_emitter_cutout_height = 13.0;
    ryt_emitter_cutout_radius = 10.5/2.0;
    ryt_emitter_cutout_x_offset = ryt_inner_cylinder_x_offset+ryt_inner_cylinder_radius - ryt_emitter_cutout_height/2.0-2;
    ryt_emitter_cutout_y_offset = ryt_inner_cylinder_y_offset - ryt_outer_cylinder_radius/2.0;
    ryt_emitter_cutout_z_offset = ryt_inner_cylinder_z_offset + 3;
    
    ryt_receiver_cutout_height = ryt_emitter_cutout_height;
    ryt_receiver_cutout_length = 15.0;
    ryt_receiver_cutout_width = 2*ryt_emitter_cutout_radius;
    ryt_receiver_cutout_x_offset = ryt_emitter_cutout_x_offset+1.0;
    ryt_receiver_cutout_y_offset = ryt_inner_cylinder_y_offset + ryt_outer_cylinder_radius/2.0;
    ryt_receiver_cutout_z_offset = ryt_emitter_cutout_z_offset;
    
    difference() {
        union() {
            translate([ryt_inner_cylinder_x_offset, ryt_inner_cylinder_y_offset, ryt_inner_cylinder_z_offset]) {
                cylinder(ryt_inner_cylinder_height, ryt_inner_cylinder_radius, ryt_inner_cylinder_radius, true, $fn=ry_fn_val);
            }
            
            translate([ryt_outer_cylinder_x_offset, ryt_outer_cylinder_y_offset, ryt_outer_cylinder_z_offset]) {
                cylinder(ryt_outer_cylinder_height, ryt_outer_cylinder_radius, ryt_outer_cylinder_radius, true, $fn=ry_fn_val);
            }    
        }    
        translate([ryt_emitter_cutout_x_offset, ryt_emitter_cutout_y_offset, ryt_emitter_cutout_z_offset]) {
            rotate([0,90,0]) {
                cylinder(ryt_emitter_cutout_height, ryt_emitter_cutout_radius, ryt_emitter_cutout_radius, true, $fn=ry_fn_val);
            }
        }
        
        translate([ryt_receiver_cutout_x_offset, ryt_receiver_cutout_y_offset, ryt_receiver_cutout_z_offset]) {
            rotate([0,90,0]) {
                rotate([0,0,90]) {
                    _rounded_square(ryt_receiver_cutout_length, ryt_receiver_cutout_width, ryt_receiver_cutout_height);
                }
            }
        }
    }
}

module RacecarYDLidarBase(ryb_base_height = 10.0, ryb_leg_height = 4.5) {
    
    ryb_front_cylinder_height = ryb_base_height;
    ryb_front_cylinder_z_offset = ryt_inner_cylinder_z_offset - ryt_inner_cylinder_height/2.0 - ryb_front_cylinder_height/2.0;
    
    ryb_back_cylinder_height = ryb_base_height;
    ryb_back_cylinder_z_offset = ryb_front_cylinder_z_offset;    
    
    ryb_leg_z_offset = ryb_back_cylinder_z_offset;
    
    ryb_leg_hidden_radius = 20.0;
    ryb_leg_hidden_height = ryb_leg_height;
    ryb_leg_hidden_x_offset = ryb_front_cylinder_x_offset;
    ryb_leg_hidden_y_offset = ryb_front_cylinder_y_offset;
    ryb_leg_hidden_z_offset = ryb_front_cylinder_z_offset;
    
    hull() {
        translate([ryb_front_cylinder_x_offset, ryb_front_cylinder_y_offset, ryb_front_cylinder_z_offset]) {
            cylinder(ryb_front_cylinder_height, ryb_front_cylinder_radius, ryb_front_cylinder_radius, true, $fn=ry_fn_val);
        }
        
        translate([ryb_back_cylinder_x_offset, ryb_back_cylinder_y_offset, ryb_back_cylinder_z_offset]) {
            cylinder(ryb_back_cylinder_height, ryb_back_cylinder_radius, ryb_back_cylinder_radius, true, $fn=ry_fn_val);
        }
    }  
         
    hull() {
        translate([ryb_leg_hidden_x_offset, ryb_leg_hidden_y_offset, ryb_leg_hidden_z_offset]) {
            cylinder(ryb_leg_hidden_height, ryb_leg_hidden_radius, ryb_leg_hidden_radius, true, $fn=ry_fn_val);
        }
        translate([ryb_leg_front_x_offset, ryb_leg_front_left_y_offset, ryb_leg_z_offset]) {
            cylinder(ryb_leg_height, ryb_leg_radius, ryb_leg_radius, true, $fn=ry_fn_val);
        }
    }

    hull() {
        translate([ryb_leg_hidden_x_offset, ryb_leg_hidden_y_offset, ryb_leg_hidden_z_offset]) {
            cylinder(ryb_leg_hidden_height, ryb_leg_hidden_radius, ryb_leg_hidden_radius, true, $fn=ry_fn_val);
        }
        translate([ryb_leg_back_x_offset, ryb_leg_back_left_y_offset, ryb_leg_z_offset]) {
            cylinder(ryb_leg_height, ryb_leg_radius, ryb_leg_radius, true, $fn=ry_fn_val);
        }
    }    
    
    hull() {
        translate([ryb_leg_hidden_x_offset, ryb_leg_hidden_y_offset, ryb_leg_hidden_z_offset]) {
            cylinder(ryb_leg_hidden_height, ryb_leg_hidden_radius, ryb_leg_hidden_radius, true, $fn=ry_fn_val);
        }
        translate([ryb_leg_front_x_offset, ryb_leg_front_right_y_offset, ryb_leg_z_offset]) {
            cylinder(ryb_leg_height, ryb_leg_radius, ryb_leg_radius, true, $fn=ry_fn_val);
        }
    }

    hull() {
        translate([ryb_leg_hidden_x_offset, ryb_leg_hidden_y_offset, ryb_leg_hidden_z_offset]) {
            cylinder(ryb_leg_hidden_height, ryb_leg_hidden_radius, ryb_leg_hidden_radius, true, $fn=ry_fn_val);
        }
        translate([ryb_leg_back_x_offset, ryb_leg_back_right_y_offset, ryb_leg_z_offset]) {
            cylinder(ryb_leg_height, ryb_leg_radius, ryb_leg_radius, true, $fn=ry_fn_val);
        }
    }    
    
}

module RacecarYDLidarMotor() {
    rym_height = 20.0;
    rym_radius = 32.0/2.0;    
    
    rym_x_offset = ryb_back_cylinder_x_offset;
    rym_y_offset = ryb_back_cylinder_y_offset;
    rym_z_offset = ryt_inner_cylinder_z_offset - ryt_inner_cylinder_height/2.0-ryb_base_height-rym_height/2.0;
    
    translate([rym_x_offset, rym_y_offset, rym_z_offset]) {
        cylinder(rym_height, rym_radius, rym_radius, true, $fn=ry_fn_val);
    }
}