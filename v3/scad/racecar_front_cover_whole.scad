$include_rfcbls = true;
include <racecar_front_cover_back_left_side.scad>

$include_rfcbrs = true;
include <racecar_front_cover_back_right_side.scad>

if(_print_config) {
    translate([0,0,68]) {
        rfcw_rotation_y = 180+atan(rfcc_top_xz_slope);
        rotate([0,rfcw_rotation_y,0]) {
            RacecarFrontCoverWhole();    
        }
    }
} else {
    RacecarFrontCoverWhole(); 
}

module RacecarFrontCoverWhole() {
    
    translate([rff_wrt_rcb_x_offset, rff_wrt_rcb_y_offset, rff_wrt_rcb_z_offset]) {
        RacecarFrontCoverBackLeftSide();
    }
    translate([rff_wrt_rcb_x_offset, rff_wrt_rcb_y_offset, rff_wrt_rcb_z_offset]) {
        RacecarFrontCoverFrontLeftSide();
    }    
    translate([rff_wrt_rcb_x_offset, rff_wrt_rcb_y_offset, rff_wrt_rcb_z_offset]) {
        RacecarFrontCoverCenter();
    }  
    translate([rff_wrt_rcb_x_offset, rff_wrt_rcb_y_offset, rff_wrt_rcb_z_offset]) {
        RacecarFrontCoverBackRightSide();
    }
    translate([rff_wrt_rcb_x_offset, rff_wrt_rcb_y_offset, rff_wrt_rcb_z_offset]) {
        RacecarFrontCoverFrontRightSide();
    }     
        
    
}