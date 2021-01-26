include <../../misc/racecar_global_utils.scad>

$include_rff = true;
include <racecar_front_foundation.scad>

$include_rfcc = true;
include <racecar_front_cover_center.scad>

rfcfrs_cover_left_x = rff_front_wall_back_outer_right_x;
rfcfrs_cover_left_y = rff_front_wall_back_outer_right_y;
rfcfrs_cover_left_z = rff_front_wall_top_z;
rfcfrs_cover_right_x = rff_head_back_right_x;
rfcfrs_cover_right_y = rff_head_back_right_y;
rfcfrs_cover_right_z = rff_front_wall_top_z;

rfcfrs_wall_left_x = rff_front_wall_back_outer_right_x;
rfcfrs_wall_left_y = rff_front_wall_back_outer_right_y;
rfcfrs_wall_left_z = rff_front_wall_bottom_z;
rfcfrs_wall_right_x = rff_head_back_right_x;
rfcfrs_wall_right_y = rff_head_back_right_y;
rfcfrs_wall_right_z = rff_front_wall_bottom_z;


if ($include_rfcfrs==undef) {
    RacecarFrontCoverFrontRightSide();
}

module RacecarFrontCoverFrontRightSide() {
    
    difference() {
        union() {
            polyhedron(points=[
            [rfcc_rbct_right_top_x, rfcc_rbct_right_top_y, rfcc_rbct_right_top_z], // 0
            [rfcc_rbct_right_bottom_x, rfcc_rbct_right_bottom_y, rfcc_rbct_right_bottom_z], // 1        
            [rfcc_rff_cover_front_right_x, rfcc_rff_cover_front_right_y, rfcc_rff_cover_front_right_z], // 2    
            [rfcc_rff_cover_back_right_x, rfcc_rff_cover_back_right_y, rfcc_rff_cover_back_right_z], // 3
            [rfcfrs_cover_left_x,rfcfrs_cover_left_y,rfcfrs_cover_left_z], // 4
            [rfcfrs_cover_right_x,rfcfrs_cover_right_y,rfcfrs_cover_right_z] // 5
            ], faces=[[0,2,5],[1,4,3],[5,4,1,0],[0,1,3,2], [2,3,4,5]]);
            
            polyhedron(points=[
            [rfcc_rff_cover_front_right_x, rfcc_rff_cover_front_right_y, rfcc_rff_cover_front_right_z], // 0  
            [rfcc_rff_cover_back_right_x, rfcc_rff_cover_back_right_y, rfcc_rff_cover_back_right_z], // 1
            [rfcfrs_cover_left_x,rfcfrs_cover_left_y,rfcfrs_cover_left_z], // 2
            [rfcfrs_cover_right_x,rfcfrs_cover_right_y,rfcfrs_cover_right_z], // 3       
            [rfcc_rff_wall_front_right_x,rfcc_rff_wall_front_right_y,rfcc_rff_wall_front_right_z], // 4
            [rfcc_rff_wall_back_right_x,rfcc_rff_wall_back_right_y,rfcc_rff_wall_back_right_z], // 5
            [rfcfrs_wall_left_x,rfcfrs_wall_left_y,rfcfrs_wall_left_z], // 6
            [rfcfrs_wall_right_x,rfcfrs_wall_right_y,rfcfrs_wall_right_z] //7
            ], faces=[[1,0,3,2],[3,0,4,7],[1,2,6,5],[0,1,5,4],[2,3,7,6],[4,5,6,7]]);
            
        }
        RacecarFrontCoverCenterUSB();
        RacecarFrontCoverD455Removal();
    }
}