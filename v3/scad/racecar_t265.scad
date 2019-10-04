$include_rfcc = true;
include <racecar_front_cover_center.scad>

rt265_length = 12.5;
rt265_width = 108;
rt265_height = 24.43;

rt265_wrt_rcb_x_offset = rff_wrt_rcb_x_offset+rfcct265p_base_x_offset+rfcct265p_base_length/2.0+rt265_length/2.0;//+ rfcc_camera_mount_screw_x_offset + rfcc_camera_mount_screw_height/2.0+ rd435_length/2.0-1.5;
rt265_wrt_rcb_y_offset = rff_wrt_rcb_y_offset+0.5*(rfcc_camera_mount_screw_left_y_offset+rfcc_camera_mount_screw_right_y_offset);
rt265_wrt_rcb_z_offset = rff_wrt_rcb_z_offset + rfcct265p_screw_z_offset;

if($include_rt265==undef) {
    RacecarT265();
}

module RacecarT265() {
    rt265_front_length = 8.2;
    
    rt265_back_base_y_scale = 0.99;
    rt265_back_base_z_scale = 1.0-((1-rt265_back_base_y_scale)*(rt265_width/rt265_height));
    rt265_back_base_shift = rt265_width*(1.0-rt265_back_base_y_scale)/2.0;
    rt265_back_base_x_offset = rt265_length/2.0-rt265_front_length;
    rt265_back_base_y_offset = 0.0;
    rt265_back_base_z_offset = 0.0;
    
    rt265_back_radius = 3;
    rt265_back_x_offset = -rt265_length/2.0 + rt265_back_radius/2.0;
    rt265_back_left_y_offset = rt265_width/2.0- rt265_back_base_shift - rt265_back_radius/2.0;
    rt265_back_right_y_offset = -rt265_width/2.0 + rt265_back_base_shift + rt265_back_radius/2.0;
    rt265_back_top_z_offset = rt265_height/2.0 - rt265_back_base_shift - rt265_back_radius/2.0;
    rt265_back_bottom_z_offset = -rt265_height/2.0+ rt265_back_base_shift + rt265_back_radius/2.0;    
    
    difference() {
        translate([rt265_length/2.0-rt265_front_length/2.0,0,0]) {
            RacecarT265Front(rt265_front_length);        
        }
        RacecarT265FrontScreen(0.25);
    }
    
    hull() {
        translate([rt265_back_base_x_offset, rt265_back_base_y_offset, rt265_back_base_z_offset]) {
            scale([1.0,rt265_back_base_y_scale,rt265_back_base_z_scale]) {
                RacecarT265Front(0.1);
            }
        }
        
        translate([rt265_back_x_offset, rt265_back_left_y_offset, rt265_back_top_z_offset]) {
            rotate([0,0,90]) {
                _quarter_sphere(rt265_back_radius);
            }
        }
        
        translate([rt265_back_x_offset, rt265_back_left_y_offset, rt265_back_bottom_z_offset]) {
            rotate([0,90,90]) {
                _quarter_sphere(rt265_back_radius);
            }
        }    
        
        translate([rt265_back_x_offset, rt265_back_right_y_offset, rt265_back_top_z_offset]) {
            rotate([0,0,180]) {
                _quarter_sphere(rt265_back_radius);
            }
        }
        
        translate([rt265_back_x_offset, rt265_back_right_y_offset, rt265_back_bottom_z_offset]) {
            rotate([ 90,180,0]) {
                _quarter_sphere(rt265_back_radius);
            }
        }     
    }

    
}

module RacecarT265FrontScreen(rt265fs_length = 0.1) {

    rt265fs_y_scale = 0.99;
    rt265fs_z_scale = 1.0-((1-rt265fs_y_scale)*(rt265_width/rt265_height));
    rt265fs_shift = rt265_width*(1.0-rt265fs_y_scale)/2.0;
    rt265fs_x_offset = rt265_length/2.0-rt265fs_length/2.0;
    rt265fs_y_offset = 0.0;
    rt265fs_z_offset = 0.0;
    
    translate([rt265fs_x_offset+0.01, rt265fs_y_offset, rt265fs_z_offset]) {
        scale([1.0,rt265fs_y_scale,rt265fs_z_scale]) {
            RacecarT265Front(rt265fs_length);
        }
    }    
    
}

module RacecarT265Front(rt265_front_length=8.2) {
    rt265_front_radius = 4.5;
    rt265_front_x_offset = 0.0;
    rt265_front_left_y_offset = rt265_width/2.0 - rt265_front_radius;
    rt265_front_right_y_offset = -rt265_width/2.0 + rt265_front_radius;
    rt265_front_top_z_offset = rt265_height/2.0 - rt265_front_radius;
    rt265_front_bottom_z_offset = -rt265_height/2.0 + rt265_front_radius;
    
    hull() {
        translate([rt265_front_x_offset, rt265_front_left_y_offset, rt265_front_top_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rt265_front_length, rt265_front_radius, rt265_front_radius, true, $fn=_fn_val);
            }
        }
        translate([rt265_front_x_offset, rt265_front_left_y_offset, rt265_front_bottom_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rt265_front_length, rt265_front_radius, rt265_front_radius, true, $fn=_fn_val);
            }
        }    
        
        translate([rt265_front_x_offset, rt265_front_right_y_offset, rt265_front_top_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rt265_front_length, rt265_front_radius, rt265_front_radius, true, $fn=_fn_val);
            }
        }
        translate([rt265_front_x_offset, rt265_front_right_y_offset, rt265_front_bottom_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rt265_front_length, rt265_front_radius, rt265_front_radius, true, $fn=_fn_val);
            }
        }       
    } 
}