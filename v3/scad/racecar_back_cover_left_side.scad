$include_rbf = true;
include <racecar_back_foundation.scad>

$include_rbct = true;
include <racecar_back_cover_top.scad>

use <../../misc/racecar_cover_image.scad>

rbcls_rbct_extra_length = rbct_length;
rbcls_rbct_extra_width = 2.0;
rbcls_rbct_extra_height = rbct_height;
rbcls_rbct_extra_x_offset = rbct_wrt_rbf_x_offset+rbctcl_wrt_rbct_x_offset;
rbcls_rbct_extra_y_offset = rbct_wrt_rbf_y_offset+rbctcl_wrt_rbct_y_offset+rbctcl_width/2.0+rbcls_rbct_extra_width/2.0;
rbcls_rbct_extra_z_offset = rbct_wrt_rbf_z_offset;

rbcls_rbct_front_top_x = rbct_wrt_rbf_x_offset + rbct_length/2.0; 
rbcls_rbct_front_top_y = rbcls_rbct_extra_y_offset+rbcls_rbct_extra_width/2.0;
rbcls_rbct_front_top_z = rbct_wrt_rbf_z_offset + rbct_height/2.0;
rbcls_rbct_front_bottom_x = rbct_wrt_rbf_x_offset + rbct_length/2.0; 
rbcls_rbct_front_bottom_y = rbcls_rbct_extra_y_offset+rbcls_rbct_extra_width/2.0;
rbcls_rbct_front_bottom_z = rbct_wrt_rbf_z_offset - rbct_height/2.0;
rbcls_rbct_back_top_x = rbct_wrt_rbf_x_offset - rbct_length/2.0; 
rbcls_rbct_back_top_y = rbcls_rbct_extra_y_offset+rbcls_rbct_extra_width/2.0;
rbcls_rbct_back_top_z = rbct_wrt_rbf_z_offset + rbct_height/2.0;
rbcls_rbct_back_bottom_x = rbct_wrt_rbf_x_offset - rbct_length/2.0; 
rbcls_rbct_back_bottom_y = rbcls_rbct_extra_y_offset+rbcls_rbct_extra_width/2.0;
rbcls_rbct_back_bottom_z = rbct_wrt_rbf_z_offset - rbct_height/2.0;

rbcls_rbf_front_left_x = rbf_length/2.0;
rbcls_rbf_front_left_y = rbf_width/2.0;
rbcls_rbf_front_left_z = rbf_height/2.0 + rbf_side_wall_height;
rbcls_rbf_front_right_x = rbf_length/2.0;
rbcls_rbf_front_right_y = rbf_width/2.0 - _wall_thickness;
rbcls_rbf_front_right_z = rbf_height/2.0 + rbf_side_wall_height;    
rbcls_rbf_back_left_x = -rbf_length/2.0;
rbcls_rbf_back_left_y = rbf_width/2.0;
rbcls_rbf_back_left_z = rbf_height/2.0 + rbf_side_wall_height;
rbcls_rbf_back_right_x = -rbf_length/2.0;
rbcls_rbf_back_right_y = rbf_width/2.0 - _wall_thickness;
rbcls_rbf_back_right_z = rbf_height/2.0 + rbf_side_wall_height;  

rbcls_cover_image_slope = (rbcls_rbct_front_top_z-rbcls_rbf_back_left_z)/(rbcls_rbct_front_top_y-rbcls_rbf_back_left_y);
rbcls_cover_image_x_rotation = atan(rbcls_cover_image_slope);
rbcls_cover_image_y_rotation = 180;
rbcls_cover_image_z_rotation = 180;
rbcls_cover_image_extra_y = -6.3;
rbcls_cover_image_x_offset = rbcls_rbct_extra_x_offset;
rbcls_cover_image_y_offset = rbcls_rbf_back_left_y-_wall_thickness/4.0+rbcls_cover_image_extra_y;
rbcls_cover_image_z_offset = rbcls_rbf_back_left_z+rbcls_cover_image_extra_y*rbcls_cover_image_slope;

if ($include_rbcls==undef) {
    
    if(_print_config) {
        rbcls_print_slope = (rbcls_rbct_front_top_z-rbcls_rbf_back_left_z)/(rbcls_rbct_front_top_y-rbcls_rbf_back_left_y);;
        rbcls_print_rotation_x = 180-atan(rbcls_print_slope);
        translate([0,-30,65]) {
            rotate([rbcls_print_rotation_x,0,0]) {
                RacecarBackCoverLeftSide();
            }
        }
    } else {
        RacecarBackCoverLeftSide();
    }    

}

module RacecarBackCoverLeftSide() {

    rbcls_side_wall_length = rbf_length;
    rbcls_side_wall_width = _wall_thickness;
    rbcls_side_wall_height = rbf_side_wall_height;
    rbcls_side_wall_x_offset = rbct_wrt_rbf_x_offset;
    rbcls_side_wall_y_offset = rbf_side_wall_left_y_offset + rbf_side_wall_width/2.0 + rbcls_side_wall_width/2.0;
    rbcls_side_wall_z_offset = rbf_side_wall_z_offset;

    difference() {
        union() {
            polyhedron(points=[
            [rbcls_rbct_front_top_x,rbcls_rbct_front_top_y,rbcls_rbct_front_top_z],
            [rbcls_rbct_front_bottom_x,rbcls_rbct_front_bottom_y,rbcls_rbct_front_bottom_z],
            [rbcls_rbct_back_top_x,rbcls_rbct_back_top_y,rbcls_rbct_back_top_z],
            [rbcls_rbct_back_bottom_x,rbcls_rbct_back_bottom_y,rbcls_rbct_back_bottom_z],
            [rbcls_rbf_front_left_x,rbcls_rbf_front_left_y,rbcls_rbf_front_left_z],
            [rbcls_rbf_front_right_x,rbcls_rbf_front_right_y,rbcls_rbf_front_right_z],
            [rbcls_rbf_back_left_x,rbcls_rbf_back_left_y,rbcls_rbf_back_left_z],
            [rbcls_rbf_back_right_x,rbcls_rbf_back_right_y,rbcls_rbf_back_right_z]
            ], faces=[[0,1,3,2],[0,2,6,4],[1,5,7,3],[2,3,7,6],[0,4,5,1],[4,6,7,5]]);
           
            translate([rbct_wrt_rbf_x_offset+rbctcl_wrt_rbct_x_offset,rbct_wrt_rbf_y_offset+ rbctcl_wrt_rbct_y_offset, rbct_wrt_rbf_z_offset+rbctcl_wrt_rbct_z_offset]) {
                RacecarBackCoverTopConnectorLeft(true);
            }  
            
            translate([rbcls_rbct_extra_x_offset, rbcls_rbct_extra_y_offset, rbcls_rbct_extra_z_offset]) {
                cube([rbcls_rbct_extra_length,rbcls_rbct_extra_width, rbcls_rbct_extra_height], true);
            }
            
            translate([rbcls_side_wall_x_offset,rbcls_side_wall_y_offset,rbcls_side_wall_z_offset]) {
                cube([rbcls_side_wall_length, rbcls_side_wall_width, rbcls_side_wall_height], true);
            }
            
        }
        translate([rbf_side_screw_front_x_offset, rbcls_side_wall_y_offset, rbcls_side_wall_z_offset]) {
            scale([1,1.001,1]) {
                rotate([-90,0,0]) {
                    _m2_5_flathead_screw(rbcls_side_wall_width);
                }
            }
        }
        translate([rbf_side_screw_back_x_offset, rbcls_side_wall_y_offset, rbcls_side_wall_z_offset]) {
            scale([1,1.001,1]) {
                rotate([-90,0,0]) {
                    _m2_5_flathead_screw(rbcls_side_wall_width);
                }
            }
        }
        RacecarBackCoverLeftSideImage();
    }  
}

module RacecarBackCoverLeftSideImage() {
    
        translate([rbcls_cover_image_x_offset,rbcls_cover_image_y_offset,rbcls_cover_image_z_offset]) {
            rotate([rbcls_cover_image_x_rotation,rbcls_cover_image_y_rotation,rbcls_cover_image_z_rotation]) {
                RacecarCoverImage();
            }
        }     
}