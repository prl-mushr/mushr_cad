$include_rfcc = true;
include <racecar_front_cover_center.scad>

rd435_length = 25.15;

rd435_front_length = 19.5;
rd435_front_width = 84.0;
rd435_front_height = 1.0;

rd435_back_length = 25.0;
rd435_back_width = 90.0;
rd435_back_height = 1.0;

rd435_wrt_rcb_x_offset = rff_wrt_rcb_x_offset+rfcct265p_base_x_offset+rfcct265p_base_length/2.0+rd435_length/2.0;//+ rfcc_camera_mount_screw_x_offset + rfcc_camera_mount_screw_height/2.0+ rd435_length/2.0-1.5;
rd435_wrt_rcb_y_offset = rff_wrt_rcb_y_offset+0.5*(rfcc_camera_mount_screw_left_y_offset+rfcc_camera_mount_screw_right_y_offset);
rd435_wrt_rcb_z_offset = rff_wrt_rcb_z_offset + rfcc_camera_mount_screw_z_offset;

if($include_rd435==undef) {
    RacecarD435();
    //RacecarD435Screen();
}

module RacecarD435Screen() {
    translate([0.1,0,0]) {
        scale([0.99,0.98,0.9]) {
            RacecarD435Front();
        }
    }
}

module RacecarD435() {
    
    rd435_top_holes_length = 8.0;
    rd435_top_holes_width = 1.75;
    rd435_top_holes_height = rd435_length/2.0;
    rd435_top_holes_spacing = 4.5 - rd435_top_holes_width;
    rd435_hole_iter = 11;
    rd435_top_holes_x_offset = -rd435_length/2.0 + rd435_top_holes_length/2.0 + 3.0;
    rd435_top_holes_y_offset = 0.0;
    rd435_top_holes_z_offset = rd435_back_length/2.0 - rd435_top_holes_height/2.0;
    
    difference() {
        hull() {
            RacecarD435Front();
            RacecarD435Back();
        }
        for(i=[0:rd435_hole_iter-1]) {
            translate([rd435_top_holes_x_offset, rd435_top_holes_y_offset + i*rd435_top_holes_spacing, rd435_top_holes_z_offset]) {
                _rounded_square(rd435_top_holes_length, rd435_top_holes_width, rd435_top_holes_height);
            }
            translate([rd435_top_holes_x_offset, rd435_top_holes_y_offset - i*rd435_top_holes_spacing, rd435_top_holes_z_offset]) {
                _rounded_square(rd435_top_holes_length, rd435_top_holes_width, rd435_top_holes_height);
            }            
        }
        
        scale([1.0,0.98,0.9]) {
            RacecarD435Front();
        }
        
    }
    
    color([0,0,0]) {
        scale([0.99,0.98,0.9]) {
            RacecarD435Front();
        }
    } 
    
    
}

module RacecarD435Front() {
    translate([rd435_length/2.0 - rd435_front_height/2.0,0,0]) {
        rotate([0,90,0]) {
            rotate([0,0,90]) {
                _rounded_square(rd435_front_width, rd435_front_length, rd435_front_height);
            }
        }
    }
}

module RacecarD435Back() {
    translate([-rd435_length/2.0 + rd435_back_height/2.0,0,0]) {
        rotate([0,90,0]) {
            rotate([0,0,90]) {
                _rounded_square(rd435_back_width, rd435_back_length, rd435_back_height);
            }
        }
    }    
}