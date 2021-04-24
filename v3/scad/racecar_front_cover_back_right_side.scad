$include_rfcfrs = true;
include <racecar_front_cover_front_right_side.scad>

$include_rct = true;
include <../../misc/racecar_cover_text.scad>

rfcbrs_cover_left_x = rff_side_wall_x_offset - rff_side_wall_length/2.0;;
rfcbrs_cover_left_y = rff_side_wall_right_y_offset-rff_side_wall_width/2.0;
rfcbrs_cover_left_z = rff_side_wall_z_offset + rff_side_wall_height/2.0;
rfcbrs_cover_right_x = rff_side_wall_x_offset - rff_side_wall_length/2.0;
rfcbrs_cover_right_y = -rff_base_width/2.0;
rfcbrs_cover_right_z = rff_side_wall_z_offset + rff_side_wall_height/2.0;


rfcbrs_text_slope = (rfcc_rbct_right_top_z-rfcbrs_cover_right_z)/(rfcc_rbct_right_top_y-rfcbrs_cover_right_y);
rfcbrs_text_x_rotation = atan(rfcbrs_text_slope);
rfcbrs_text_y_rotation = 0.0;
rfcbrs_text_z_rotation = 0;
rfcbrs_text_extra_z = 10;
rfcbrs_text_extra_y = rfcbrs_text_extra_z*(1.0/rfcbrs_text_slope);
rfcbrs_text_x_offset = rfcbrs_cover_right_x+rff_side_wall_length/2.0-8;
rfcbrs_text_y_offset = rfcbrs_cover_right_y+rfcbrs_text_extra_y;
rfcbrs_text_z_offset = rfcbrs_cover_right_z+rfcbrs_text_extra_z; 

rfcbrs_fill_back_right_top_x = rfcc_camera_mount_right_top_x;
rfcbrs_fill_back_right_top_y = rfcc_camera_mount_right_top_y;
rfcbrs_fill_back_right_top_z = rfcc_camera_cutout_back_right_top_z;

rfcbrs_fill_back_right_bottom_x = rfcc_camera_mount_right_bottom_x;
rfcbrs_fill_back_right_bottom_z = rfcc_camera_mount_right_bottom_z;
rfcbrs_fill_back_right_bottom_y = rfcbrs_fill_back_right_top_y+((rfcc_rbct_right_top_y-rfcbrs_cover_right_y)/(rfcc_rbct_right_top_z-rfcbrs_cover_right_z))*(rfcbrs_fill_back_right_bottom_z-rfcbrs_fill_back_right_top_z);

rfcbrs_fill_back_left_bottom_x = rfcc_camera_mount_right_bottom_x;
rfcbrs_fill_back_left_bottom_y = rfcc_camera_mount_right_bottom_y+3;
rfcbrs_fill_back_left_bottom_z = rfcc_camera_mount_right_bottom_z;

rfcbrs_fill_front_right_bottom_x = rfcc_camera_cutout_back_right_top_x;
rfcbrs_fill_front_right_bottom_y = rfcbrs_fill_back_right_bottom_y;
rfcbrs_fill_front_right_bottom_z = rfcbrs_fill_back_right_bottom_z;

rfcbrs_fill_front_left_bottom_x = rfcbrs_fill_front_right_bottom_x;
rfcbrs_fill_front_left_bottom_y = rfcc_camera_cutout_back_right_top_y+3;
rfcbrs_fill_front_left_bottom_z = rfcbrs_fill_front_right_bottom_z;

rfcbrs_fill_front_right_top_x = rfcc_camera_cutout_back_right_top_x;
rfcbrs_fill_front_right_top_y = rfcbrs_fill_back_right_top_y;
rfcbrs_fill_front_right_top_z = rfcbrs_fill_back_right_top_z;

if ($include_rfcbrs==undef) {
    RacecarFrontCoverBackRightSide();
    //RacecarFrontCoverBackRightSideText();
}

module RacecarFrontCoverBackRightSide() {
    
    rfcbrs_wall_length = rfcfrs_cover_right_x - rfcbrs_cover_right_x;
    rfcbrs_wall_width = rfcbrs_cover_left_y - rfcbrs_cover_right_y;
    rfcbrs_wall_height = rff_side_wall_height;
    rfcbrs_wall_x_offset = (rfcfrs_cover_right_x+rfcbrs_cover_right_x)/2.0;
    rfcbrs_wall_y_offset = (rfcbrs_cover_left_y+rfcbrs_cover_right_y)/2.0;
    rfcbrs_wall_z_offset = rff_base_height/2.0 + rff_side_wall_height/2.0;
    
    difference() {
        union() {
            polyhedron(points=[
            [rfcc_rbct_right_top_x,rfcc_rbct_right_top_y,rfcc_rbct_right_top_z], // 0
            [rfcc_rbct_right_bottom_x,rfcc_rbct_right_bottom_y,rfcc_rbct_right_bottom_z], // 1
            [rfcfrs_cover_left_x,rfcfrs_cover_left_y,rfcfrs_cover_left_z], // 2
            [rfcfrs_cover_right_x,rfcfrs_cover_right_y,rfcfrs_cover_right_z], // 3
            [rfcbrs_cover_left_x,rfcbrs_cover_left_y,rfcbrs_cover_left_z], // 4
            [rfcbrs_cover_right_x,rfcbrs_cover_right_y,rfcbrs_cover_right_z] // 5         
            ], faces=[[0,3,5],[1,4,2],[1,0,5,4],[0,1,2,3], [3,2,4,5]]);
            
            polyhedron(points=[
                  [rfcbrs_fill_back_right_top_x, rfcbrs_fill_back_right_top_y, rfcbrs_fill_back_right_top_z], // 0
                  [rfcbrs_fill_back_right_bottom_x, rfcbrs_fill_back_right_bottom_y, rfcbrs_fill_back_right_bottom_z], // 1
                  [rfcbrs_fill_back_left_bottom_x, rfcbrs_fill_back_left_bottom_y, rfcbrs_fill_back_left_bottom_z], // 2 
                  [rfcbrs_fill_front_right_bottom_x, rfcbrs_fill_front_right_bottom_y, rfcbrs_fill_front_right_bottom_z], // 3
                  [rfcbrs_fill_front_left_bottom_x, rfcbrs_fill_front_left_bottom_y, rfcbrs_fill_front_left_bottom_z], // 4
                  [rfcbrs_fill_front_right_top_x, rfcbrs_fill_front_right_top_y, rfcbrs_fill_front_right_top_z] // 5
            ], faces=[[1,3,4,2], [0,1,2], [5,4,3],[0,5,3,1],[5,0,2,4]]);
            
            translate([rfcbrs_wall_x_offset,rfcbrs_wall_y_offset,rfcbrs_wall_z_offset]) {
                cube([rfcbrs_wall_length, rfcbrs_wall_width, rfcbrs_wall_height], true);
            }   
        }
        translate([rff_side_screw_front_x_offset, rfcbrs_wall_y_offset, rfcbrs_wall_z_offset]) {
            scale([1,1.001,1]) {
                rotate([90,0,0]) {
                    _m2_5_flathead_screw(rfcbrs_wall_width);
                }
            }
        }
        translate([rff_side_screw_back_x_offset, rfcbrs_wall_y_offset, rfcbrs_wall_z_offset]) {
            scale([1,1.001,1]) {
                rotate([90,0,0]) {
                    _m2_5_flathead_screw(rfcbrs_wall_width);
                }
            }
        }
        RacecarFrontCoverCenterUSB();
        //RacecarFrontCoverBackRightSideText();
        RacecarFrontCoverD455Removal();
        translate([rfcc_d455_head_screw_x_offset, rfcc_d455_head_screw_right_y_offset, rfcc_d455_head_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcc_d455_head_screw_height, 7.5/2, 7.5/2, true, $fn=_fn_val);
            }
        }
              
    }
    
}

module RacecarFrontCoverBackRightSideText() {
    translate([rfcbrs_text_x_offset,rfcbrs_text_y_offset,rfcbrs_text_z_offset]) {
        rotate([rfcbrs_text_x_rotation,rfcbrs_text_y_rotation,rfcbrs_text_z_rotation]) {
            translate([0,0,-_wall_thickness/4.0+0.01]) {
                RacecarCoverText();
            }
        }
    }    
}