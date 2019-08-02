$include_rfcfls = true;
include <racecar_front_cover_front_left_side.scad>

rfcbls_cover_left_x = rff_side_wall_x_offset - rff_side_wall_length/2.0;;
rfcbls_cover_left_y = rff_base_width/2.0;
rfcbls_cover_left_z = rff_side_wall_z_offset + rff_side_wall_height/2.0;;
rfcbls_cover_right_x = rff_side_wall_x_offset - rff_side_wall_length/2.0;
rfcbls_cover_right_y = rff_side_wall_left_y_offset+rff_side_wall_width/2.0;
rfcbls_cover_right_z = rff_side_wall_z_offset + rff_side_wall_height/2.0;;

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
    }
}