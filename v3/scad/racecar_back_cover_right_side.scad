$include_rbct = true;
include <racecar_back_cover_top.scad>

use <../../misc/racecar_cover_image.scad>

rbcrs_rbct_extra_length = rbct_length;
rbcrs_rbct_extra_width = 2.0;
rbcrs_rbct_extra_height = rbct_height;
rbcrs_rbct_extra_x_offset = rbct_wrt_rbf_x_offset+rbctcr_wrt_rbct_x_offset;
rbcrs_rbct_extra_y_offset = rbct_wrt_rbf_y_offset+rbctcr_wrt_rbct_y_offset-rbctcr_width/2.0-rbcrs_rbct_extra_width/2.0;
rbcrs_rbct_extra_z_offset = rbct_wrt_rbf_z_offset;


rbcrs_rbct_front_top_x = rbct_wrt_rbf_x_offset + rbct_length/2.0; 
rbcrs_rbct_front_top_y = rbcrs_rbct_extra_y_offset-rbcrs_rbct_extra_width/2.0;
rbcrs_rbct_front_top_z = rbct_wrt_rbf_z_offset + rbct_height/2.0;
rbcrs_rbct_front_bottom_x = rbct_wrt_rbf_x_offset + rbct_length/2.0; 
rbcrs_rbct_front_bottom_y = rbcrs_rbct_extra_y_offset-rbcrs_rbct_extra_width/2.0;
rbcrs_rbct_front_bottom_z = rbct_wrt_rbf_z_offset - rbct_height/2.0;
rbcrs_rbct_back_top_x = rbct_wrt_rbf_x_offset - rbct_length/2.0; 
rbcrs_rbct_back_top_y = rbcrs_rbct_extra_y_offset-rbcrs_rbct_extra_width/2.0;
rbcrs_rbct_back_top_z = rbct_wrt_rbf_z_offset + rbct_height/2.0;
rbcrs_rbct_back_bottom_x = rbct_wrt_rbf_x_offset - rbct_length/2.0; 
rbcrs_rbct_back_bottom_y = rbcrs_rbct_extra_y_offset-rbcrs_rbct_extra_width/2.0;
rbcrs_rbct_back_bottom_z = rbct_wrt_rbf_z_offset - rbct_height/2.0;

rbcrs_rbf_front_left_x = rbf_length/2.0;
rbcrs_rbf_front_left_y = -rbf_width/2.0 + _wall_thickness;
rbcrs_rbf_front_left_z = rbf_height/2.0 + rbf_side_wall_height;
rbcrs_rbf_front_right_x = rbf_length/2.0;
rbcrs_rbf_front_right_y = -rbf_width/2.0;
rbcrs_rbf_front_right_z = rbf_height/2.0 + rbf_side_wall_height;    
rbcrs_rbf_back_left_x = -rbf_length/2.0;
rbcrs_rbf_back_left_y = -rbf_width/2.0 + _wall_thickness;
rbcrs_rbf_back_left_z = rbf_height/2.0 + rbf_side_wall_height;
rbcrs_rbf_back_right_x = -rbf_length/2.0;
rbcrs_rbf_back_right_y = -rbf_width/2.0;
rbcrs_rbf_back_right_z = rbf_height/2.0 + rbf_side_wall_height;  

rbcrs_cover_image_slope = (rbcrs_rbct_front_top_z-rbcrs_rbf_back_right_z)/(rbcrs_rbct_front_top_y-rbcrs_rbf_back_right_y);
rbcrs_cover_image_x_rotation = atan(rbcrs_cover_image_slope);
rbcrs_cover_image_y_rotation = 0;
rbcrs_cover_image_z_rotation = 0;
rbcrs_cover_image_extra_y = 6.3;
rbcrs_cover_image_x_offset = rbcrs_rbct_extra_x_offset;
rbcrs_cover_image_y_offset = rbcrs_rbf_back_right_y+_wall_thickness/4.0+rbcrs_cover_image_extra_y;
rbcrs_cover_image_z_offset = rbcrs_rbf_back_left_z+rbcrs_cover_image_extra_y*rbcrs_cover_image_slope;

if ($include_rbcrs==undef) {
    if(_print_config) {
        rbcrs_print_slope = (rbcrs_rbct_front_top_z-rbcrs_rbf_back_right_z)/(rbcrs_rbct_front_top_y-rbcrs_rbf_back_right_y);
        rbcrs_print_rotation_x = 180-atan(rbcrs_print_slope);
        translate([0,30,65]) {
            rotate([rbcrs_print_rotation_x,0,0]) {
                RacecarBackCoverRightSide();
            }
        }
    } else {
        RacecarBackCoverRightSide();
    }
}

module RacecarBackCoverRightSide() {

    rbcrs_side_wall_length = rbf_length;
    rbcrs_side_wall_width = _wall_thickness;
    rbcrs_side_wall_height = rbf_side_wall_height;
    rbcrs_side_wall_x_offset = rbct_wrt_rbf_x_offset;
    rbcrs_side_wall_y_offset = rbf_side_wall_right_y_offset - rbf_side_wall_width/2.0 - rbcrs_side_wall_width/2.0;
    rbcrs_side_wall_z_offset = rbf_side_wall_z_offset;


    difference() {
        union() {
            polyhedron(points=[
            [rbcrs_rbct_front_top_x,rbcrs_rbct_front_top_y,rbcrs_rbct_front_top_z],
            [rbcrs_rbct_front_bottom_x,rbcrs_rbct_front_bottom_y,rbcrs_rbct_front_bottom_z],
            [rbcrs_rbct_back_top_x,rbcrs_rbct_back_top_y,rbcrs_rbct_back_top_z],
            [rbcrs_rbct_back_bottom_x,rbcrs_rbct_back_bottom_y,rbcrs_rbct_back_bottom_z],
            [rbcrs_rbf_front_left_x,rbcrs_rbf_front_left_y,rbcrs_rbf_front_left_z],
            [rbcrs_rbf_front_right_x,rbcrs_rbf_front_right_y,rbcrs_rbf_front_right_z],
            [rbcrs_rbf_back_left_x,rbcrs_rbf_back_left_y,rbcrs_rbf_back_left_z],
            [rbcrs_rbf_back_right_x,rbcrs_rbf_back_right_y,rbcrs_rbf_back_right_z]
            ], faces=[[0,2,3,1],[0,5,7,2],[4,1,3,6],[4,5,0,1],[4,6,7,5],[7,6,3,2]]);
                       
            translate([rbct_wrt_rbf_x_offset+rbctcr_wrt_rbct_x_offset,rbct_wrt_rbf_y_offset+ rbctcr_wrt_rbct_y_offset, rbct_wrt_rbf_z_offset+rbctcr_wrt_rbct_z_offset]) {
                RacecarBackCoverTopConnectorRight(true);
            }  
            
            translate([rbcrs_rbct_extra_x_offset, rbcrs_rbct_extra_y_offset, rbcrs_rbct_extra_z_offset]) {
                cube([rbcrs_rbct_extra_length,rbcrs_rbct_extra_width, rbcrs_rbct_extra_height], true);
            }
            
            translate([rbcrs_side_wall_x_offset,rbcrs_side_wall_y_offset,rbcrs_side_wall_z_offset]) {
                cube([rbcrs_side_wall_length, rbcrs_side_wall_width, rbcrs_side_wall_height], true);
            }             
        }
        
        translate([rbf_side_screw_front_x_offset, rbcrs_side_wall_y_offset, rbcrs_side_wall_z_offset]) {
            scale([1,1.001,1]) {
                rotate([90,0,0]) {
                    _m2_5_flathead_screw(rbcrs_side_wall_width);
                }
            }
            
        }
        
        translate([rbf_side_screw_back_x_offset, rbcrs_side_wall_y_offset, rbcrs_side_wall_z_offset]) {
            scale([1,1.001,1]) {
                rotate([90,0,0]) {
                    _m2_5_flathead_screw(rbcrs_side_wall_width);
                }
            }
        }
        
        RacecarBackCoverRightSideImage();
        
    }  
}

module RacecarBackCoverRightSideImage() {

    translate([rbcrs_cover_image_x_offset,rbcrs_cover_image_y_offset,rbcrs_cover_image_z_offset]) {
        rotate([rbcrs_cover_image_x_rotation,rbcrs_cover_image_y_rotation,rbcrs_cover_image_z_rotation]) {
            RacecarCoverImage();
        }
    }      
    
}