include <../../misc/racecar_global_utils.scad>

$include_rff = true;
include <racecar_front_foundation.scad>

$include_rfcc = true;
include <racecar_front_cover_center.scad>

rfcfls_cover_left_x = rff_head_back_left_x;
rfcfls_cover_left_y = rff_head_back_left_y;
rfcfls_cover_left_z = rff_front_wall_top_z;
rfcfls_cover_right_x = rff_front_wall_back_outer_left_x;
rfcfls_cover_right_y = rff_front_wall_back_outer_left_y;
rfcfls_cover_right_z = rff_front_wall_top_z;

rfcfls_wall_left_x = rff_head_back_left_x;
rfcfls_wall_left_y = rff_head_back_left_y;
rfcfls_wall_left_z = rff_front_wall_bottom_z;
rfcfls_wall_right_x = rff_front_wall_back_outer_left_x;
rfcfls_wall_right_y = rff_front_wall_back_outer_left_y;
rfcfls_wall_right_z = rff_front_wall_bottom_z;


if ($include_rfcfls==undef) {
    RacecarFrontCoverFrontLeftSide();
}

module RacecarFrontCoverFrontLeftSide() {
    
    difference() {
        union() {
            polyhedron(points=[
            [rfcc_rbct_left_top_x, rfcc_rbct_left_top_y, rfcc_rbct_left_top_z], // 0
            [rfcc_rbct_left_bottom_x, rfcc_rbct_left_bottom_y, rfcc_rbct_left_bottom_z], // 1        
            [rfcc_rff_cover_front_left_x, rfcc_rff_cover_front_left_y, rfcc_rff_cover_front_left_z], // 2    
            [rfcc_rff_cover_back_left_x, rfcc_rff_cover_back_left_y, rfcc_rff_cover_back_left_z], // 3
            [rfcfls_cover_left_x,rfcfls_cover_left_y,rfcfls_cover_left_z], // 4
            [rfcfls_cover_right_x,rfcfls_cover_right_y,rfcfls_cover_right_z] // 5
            ], faces=[[0,4,2],[1,3,5],[5,4,0,1],[0,2,3,1], [2,4,5,3]]);
            polyhedron(points=[
            [rfcc_rff_cover_front_left_x, rfcc_rff_cover_front_left_y, rfcc_rff_cover_front_left_z], // 0  
            [rfcc_rff_cover_back_left_x, rfcc_rff_cover_back_left_y, rfcc_rff_cover_back_left_z], // 1
            [rfcfls_cover_left_x,rfcfls_cover_left_y,rfcfls_cover_left_z], // 2
            [rfcfls_cover_right_x,rfcfls_cover_right_y,rfcfls_cover_right_z], // 3       
            [rfcc_rff_wall_front_left_x,rfcc_rff_wall_front_left_y,rfcc_rff_wall_front_left_z], // 4
            [rfcc_rff_wall_back_left_x,rfcc_rff_wall_back_left_y,rfcc_rff_wall_back_left_z], // 5
            [rfcfls_wall_left_x,rfcfls_wall_left_y,rfcfls_wall_left_z], // 6
            [rfcfls_wall_right_x,rfcfls_wall_right_y,rfcfls_wall_right_z] //7
            ], faces=[[0,1,3,2],[0,2,6,4],[1,5,7,3],[2,3,7,6],[1,0,4,5],[5,4,6,7]]);
        }
    }
}