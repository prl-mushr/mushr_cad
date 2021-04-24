$include_rfcfls = true;
include <racecar_front_cover_front_left_side.scad>

$include_rct = true;
include <../../misc/racecar_cover_text.scad>

rfcbls_cover_left_x = rff_side_wall_x_offset - rff_side_wall_length/2.0;;
rfcbls_cover_left_y = rff_base_width/2.0;
rfcbls_cover_left_z = rff_side_wall_z_offset + rff_side_wall_height/2.0;;
rfcbls_cover_right_x = rff_side_wall_x_offset - rff_side_wall_length/2.0;
rfcbls_cover_right_y = rff_side_wall_left_y_offset+rff_side_wall_width/2.0;
rfcbls_cover_right_z = rff_side_wall_z_offset + rff_side_wall_height/2.0;;

rfcbls_text_slope = (rfcc_rbct_left_top_z-rfcbls_cover_left_z)/(rfcc_rbct_left_top_y-rfcbls_cover_left_y);
rfcbls_text_x_rotation = -atan(rfcbls_text_slope);
rfcbls_text_y_rotation = 0.0;
rfcbls_text_z_rotation = 180;
rfcbls_text_extra_z = 10;
rfcbls_text_extra_y = rfcbls_text_extra_z*(1.0/rfcbls_text_slope);
rfcbls_text_x_offset = rfcbls_cover_left_x+rff_side_wall_length/2.0-8;
rfcbls_text_y_offset = rfcbls_cover_left_y+rfcbls_text_extra_y;
rfcbls_text_z_offset = rfcbls_cover_left_z+rfcbls_text_extra_z; 

rfcbls_fill_back_right_top_x = rfcc_camera_mount_left_top_x;
rfcbls_fill_back_right_top_y = rfcc_camera_mount_left_top_y;
rfcbls_fill_back_right_top_z = rfcc_camera_cutout_back_left_top_z;

rfcbls_fill_back_left_bottom_x = rfcc_camera_mount_left_bottom_x;
rfcbls_fill_back_left_bottom_z = rfcc_camera_mount_left_bottom_z;
rfcbls_fill_back_left_bottom_y = rfcbls_fill_back_right_top_y+((rfcc_rbct_left_top_y-rfcbls_cover_left_y)/(rfcc_rbct_left_top_z-rfcbls_cover_left_z))*(rfcbls_fill_back_left_bottom_z-rfcbls_fill_back_right_top_z);

rfcbls_fill_back_right_bottom_x = rfcc_camera_mount_left_bottom_x;
rfcbls_fill_back_right_bottom_y = rfcc_camera_mount_left_bottom_y-3;
rfcbls_fill_back_right_bottom_z = rfcc_camera_mount_left_bottom_z;

rfcbls_fill_front_left_bottom_x = rfcc_camera_cutout_back_left_top_x;
rfcbls_fill_front_left_bottom_y = rfcbls_fill_back_left_bottom_y;
rfcbls_fill_front_left_bottom_z = rfcbls_fill_back_left_bottom_z;

rfcbls_fill_front_right_bottom_x = rfcbls_fill_front_left_bottom_x;
rfcbls_fill_front_right_bottom_y = rfcc_camera_cutout_back_left_top_y-3;
rfcbls_fill_front_right_bottom_z = rfcbls_fill_front_left_bottom_z;

rfcbls_fill_front_right_top_x = rfcc_camera_cutout_back_left_top_x;
rfcbls_fill_front_right_top_y = rfcbls_fill_back_right_top_y;
rfcbls_fill_front_right_top_z = rfcbls_fill_back_right_top_z;


if ($include_rfcbls==undef) {
    RacecarFrontCoverBackLeftSide();
}

module RacecarFrontCoverBackLeftSide() {
    
    rfcbls_wall_length = rfcfls_cover_left_x - rfcbls_cover_left_x;
    rfcbls_wall_width = rfcbls_cover_left_y - rfcbls_cover_right_y;
    rfcbls_wall_height = rff_side_wall_height;
    rfcbls_wall_x_offset = (rfcfls_cover_left_x+rfcbls_cover_left_x)/2.0;
    rfcbls_wall_y_offset = (rfcbls_cover_left_y+rfcbls_cover_right_y)/2.0;
    rfcbls_wall_z_offset =  rff_base_height/2.0 + rff_side_wall_height/2.0;
    
    difference() {
        union() {
            
            polyhedron(points=[
            [rfcc_rbct_left_top_x,rfcc_rbct_left_top_y,rfcc_rbct_left_top_z], // 0
            [rfcc_rbct_left_bottom_x,rfcc_rbct_left_bottom_y,rfcc_rbct_left_bottom_z], // 1
            [rfcfls_cover_left_x,rfcfls_cover_left_y,rfcfls_cover_left_z], // 2
            [rfcfls_cover_right_x,rfcfls_cover_right_y,rfcfls_cover_right_z], // 3
            [rfcbls_cover_left_x,rfcbls_cover_left_y,rfcbls_cover_left_z], // 4
            [rfcbls_cover_right_x,rfcbls_cover_right_y,rfcbls_cover_right_z] // 5         
            ], faces=[[0,4,2],[1,3,5],[0,1,5,4],[2,3,1,0], [2,4,5,3]]);
               
            translate([rfcbls_wall_x_offset,rfcbls_wall_y_offset,rfcbls_wall_z_offset]) {
                cube([rfcbls_wall_length, rfcbls_wall_width, rfcbls_wall_height], true);
            }
 
            polyhedron(points=[
            [rfcbls_fill_back_right_top_x, rfcbls_fill_back_right_top_y, rfcbls_fill_back_right_top_z], // 0
            [rfcbls_fill_back_left_bottom_x, rfcbls_fill_back_left_bottom_y, rfcbls_fill_back_left_bottom_z], // 1
            [rfcbls_fill_back_right_bottom_x, rfcbls_fill_back_right_bottom_y, rfcbls_fill_back_right_bottom_z], // 2 
            [rfcbls_fill_front_left_bottom_x, rfcbls_fill_front_left_bottom_y, rfcbls_fill_front_left_bottom_z], // 3
            [rfcbls_fill_front_right_bottom_x, rfcbls_fill_front_right_bottom_y, rfcbls_fill_front_right_bottom_z], // 4
            [rfcbls_fill_front_right_top_x, rfcbls_fill_front_right_top_y, rfcbls_fill_front_right_top_z] // 5
            ], faces=[[0,2,1], [5,3,4], [0,1,3,5],[0,5,4,2], [1,2,4,3]]);
            
        }
        
        
        translate([rff_side_screw_front_x_offset, rfcbls_wall_y_offset, rfcbls_wall_z_offset]) {
            scale([1,1.001,1]) {
                rotate([-90,0,0]) {
                    _m2_5_flathead_screw(rfcbls_wall_width);
                }
            }
        }
        translate([rff_side_screw_back_x_offset, rfcbls_wall_y_offset, rfcbls_wall_z_offset]) {
            scale([1,1.001,1]) {
                rotate([-90,0,0]) {
                    _m2_5_flathead_screw(rfcbls_wall_width);
                }
            }
        }        
        RacecarFrontCoverD455Removal();
        //RacecarFrontCoverBackLeftSideText();
       
        translate([rfcc_d455_head_screw_x_offset, rfcc_d455_head_screw_left_y_offset, rfcc_d455_head_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcc_d455_head_screw_height, 7.5/2, 7.5/2, true, $fn=_fn_val);
            }
        } 
        
    }
}

module RacecarFrontCoverBackLeftSideText() {
    translate([rfcbls_text_x_offset,rfcbls_text_y_offset,rfcbls_text_z_offset]) {
        rotate([rfcbls_text_x_rotation,rfcbls_text_y_rotation,rfcbls_text_z_rotation]) {
            translate([0,0,-_wall_thickness/4.0+0.01]) {
                RacecarCoverText();
            }
        }
    }    
}