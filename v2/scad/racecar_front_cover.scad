$include_rcm = true;
include <racecar_camera_mount.scad>

$include_rbc = true;
include <racecar_back_cover.scad>

$include_rcn = true;
include <../../misc/racecar_cover_number.scad>

rfc_wrt_rcb_x_offset = rff_wrt_rcb_x_offset;
rfc_wrt_rcb_y_offset = rff_wrt_rcb_y_offset;
rfc_wrt_rcb_z_offset = rff_wrt_rcb_z_offset;

rfcc_front_x = rff_extend_x_offset + rff_extend_length/2.0;
rfcc_mid_x = rff_outer_front_wall_x_offset + rff_outer_front_wall_length/2.0;
rfcc_back_x = rff_side_wall_x_offset - rff_side_wall_length/2.0;
rfcc_far_left_y = rbc_platform_y_offset + rbc_platform_width/2.0;
rfcc_mid_left_y = rff_extend_y_offset + rff_extend_top_width/2.0;
rfcc_near_left_y = rff_outer_front_wall_y_offset + rff_outer_front_wall_front_width/2.0;
rfcc_near_right_y = rff_outer_front_wall_y_offset - rff_outer_front_wall_front_width/2.0;
rfcc_mid_right_y = rff_extend_y_offset - rff_extend_top_width/2.0;
rfcc_far_right_y = rbc_platform_y_offset - rbc_platform_width/2.0;
rfcc_bottom_z = rff_outer_front_wall_z_offset + rff_outer_front_wall_height/2.0;
rfcc_mid_z = rbc_platform_z_offset - rbc_platform_height/2.0;
rfcc_top_z = rbc_platform_z_offset + rbc_platform_height/2.0;

rfcc_wall_bottom_z = rff_outer_front_wall_z_offset - rff_outer_front_wall_height/2.0;

rfcc_number_slope = (rfcc_top_z-rfcc_bottom_z)/(rfcc_back_x-rfcc_front_x);
rfcc_number_x_rotation = -atan(rfcc_number_slope);
rfcc_number_y_rotation = 0.0;
rfcc_number_z_rotation = 90;
rfcc_number_extra_z = -20.0;
rfcc_number_extra_x = rfcc_number_extra_z*(1.0/rfcc_number_slope);
rfcc_number_x_offset = rfcc_back_x+rfcc_number_extra_x;
rfcc_number_y_offset = (rfcc_near_left_y+rfcc_near_right_y)/2.0;
rfcc_number_z_offset = rfcc_top_z-racecar_cover_number_height/2.0+rfcc_number_extra_z;   

rfcc_camera_length = rcm_length + _wall_thickness;
rfcc_camera_width = rbc_platform_width;
rfcc_camera_height = (rbc_platform_z_offset+rbc_platform_height/2.0)-(rff_outer_front_wall_z_offset-rff_outer_front_wall_height/2.0);
rfcc_camera_x_offset = rff_imu_x_offset;
rfcc_camera_y_offset = rff_imu_y_offset;
rfcc_camera_z_offset = rff_outer_front_wall_z_offset-rff_outer_front_wall_height/2.0+rfcc_camera_height/2.0;

rfcc_button_length = 15.0;
rfcc_button_width = rff_jetson_front_left_y_offset - rff_jetson_front_right_y_offset - 20;
rfcc_button_height = rfcc_camera_height;
rfcc_button_x_offset = rfcc_camera_x_offset - rfcc_camera_length/2.0 - rfcc_button_length/2.0;
rfcc_button_y_offset = rfcc_camera_y_offset;
rfcc_button_z_offset = rfcc_camera_z_offset;

if($include_rfc==undef) {
    RacecarFrontCover();
}

module RacecarFrontCover() {
    RacecarFrontCoverBackLeft();
    
    difference() {
        union() {
            RacecarFrontCoverFrontLeft();
            RacecarFrontCoverCenter();
            RacecarFrontCoverFrontRight();
        }
        translate([rfcc_button_x_offset,rfcc_button_y_offset,rfcc_button_z_offset]) {
            cube([rfcc_button_length, rfcc_button_width, rfcc_button_height], true);
        }
    }
    RacecarFrontCoverBackRight();
}

module RacecarFrontCoverBackLeft() {
    rfcbl_back_x = rff_side_wall_x_offset - rff_side_wall_length/2.0;
    rfcbl_mid_x = rff_side_wall_x_offset + rff_side_wall_length/2.0;
    rfcbl_front_x = rff_compartment_x_offset + rff_compartment_length/2.0;
    rfcbl_left_y = rff_compartment_y_offset + rff_compartment_top_width/2.0;
    rfcbl_mid_y = rff_side_wall_left_y_offset + rff_side_wall_width/2.0;
    rfcbl_right_y = rbc_platform_y_offset + rbc_platform_width/2.0;
    rfcbl_bottom_z = rff_side_wall_z_offset + rff_side_wall_height/2.0;
    rfcbl_mid_z = rbc_platform_z_offset - rbc_platform_height/2.0;
    rfcbl_top_z = rbc_platform_z_offset + rbc_platform_height/2.0;
    
    rfcbl_wall_bottom_z = rff_side_wall_z_offset - rff_side_wall_height/2.0;
    
    difference() {
        polyhedron(points=[
            [rfcbl_back_x, rfcbl_left_y, rfcbl_bottom_z], //0
            [rfcbl_back_x, rfcbl_mid_y, rfcbl_bottom_z],  //1
            [rfcbl_mid_x, rfcbl_mid_y, rfcbl_bottom_z],   //2
            [rfcbl_front_x, rfcbl_left_y, rfcbl_bottom_z],//3
            [rfcbl_back_x, rfcbl_left_y, rfcbl_wall_bottom_z], //4
            [rfcbl_back_x, rfcbl_mid_y, rfcbl_wall_bottom_z],  //5
            [rfcbl_mid_x, rfcbl_mid_y, rfcbl_wall_bottom_z],   //6
            [rfcbl_front_x, rfcbl_left_y, rfcbl_wall_bottom_z],//7        
        ], 
        faces=[[3,2,1,0],[4,5,6,7],[3,0,4,7],[1,2,6,5],[2,3,7,6],[0,1,5,4]]);
        translate([rff_side_wall_screw_front_x_offset, 0.5*(rfcbl_left_y+rfcbl_mid_y), 0.5*(rfcbl_bottom_z+rfcbl_wall_bottom_z)]) {
            scale([1,1.001,1]) {
                rotate([-90,0,0]) {
                    _m3_flathead_screw(rfcbl_left_y-rfcbl_mid_y);
                }
            }
        }
        translate([rff_side_wall_screw_back_x_offset, 0.5*(rfcbl_left_y+rfcbl_mid_y), 0.5*(rfcbl_bottom_z+rfcbl_wall_bottom_z)]) {
            scale([1,1.001,1]) {
                rotate([-90,0,0]) {
                    _m3_flathead_screw(rfcbl_left_y-rfcbl_mid_y);
                }
            }
        }     
    }

    polyhedron(points=[
        [rfcbl_back_x, rfcbl_left_y, rfcbl_bottom_z], //0
        [rfcbl_back_x, rfcbl_mid_y, rfcbl_bottom_z],  //1
        [rfcbl_mid_x, rfcbl_mid_y, rfcbl_bottom_z],   //2
        [rfcbl_front_x, rfcbl_left_y, rfcbl_bottom_z],//3
        [rfcbl_back_x, rfcbl_right_y, rfcbl_mid_z],   //4
        [rfcbl_back_x, rfcbl_right_y, rfcbl_top_z]    //5
    ], 
    faces=[[0,1,2,3], [0,3,5], [2,1,4], [4,1,0,5], [3,2,4,5]]);
    
}

module RacecarFrontCoverFrontLeft() {
    
    rfcfl_far_back_x = rff_side_wall_x_offset - rff_side_wall_length/2.0;
    rfcfl_near_back_x = rff_side_wall_x_offset + rff_side_wall_length/2.0;
    rfcfl_mid_x = rff_compartment_x_offset + rff_compartment_length/2.0;
    rfcfl_near_front_x = rff_outer_front_wall_x_offset + rff_outer_front_wall_length/2.0;
    rfcfl_far_front_x = rff_extend_x_offset + rff_extend_length/2.0;
    rfcfl_far_left_y = rff_compartment_y_offset + rff_compartment_top_width/2.0;
    rfcfl_near_left_y = rff_side_wall_left_y_offset + rff_side_wall_width/2.0;
    rfcfl_mid_y = rbc_platform_y_offset + rbc_platform_width/2.0;
    rfcfl_near_right_y = rff_extend_y_offset + rff_extend_top_width/2.0;
    rfcfl_far_right_y = rff_outer_front_wall_y_offset + rff_outer_front_wall_front_width/2.0;
    rfcfl_bottom_z = rff_outer_front_wall_z_offset + rff_outer_front_wall_height/2.0;
    rfcfl_mid_z = rbc_platform_z_offset - rbc_platform_height/2.0;
    rfcfl_top_z = rbc_platform_z_offset + rbc_platform_height/2.0;
    
    rfcfl_wall_bottom_z = rff_outer_front_wall_z_offset - rff_outer_front_wall_height/2.0;
    
    polyhedron(points=[
        [rfcfl_near_back_x,rfcfl_near_left_y,rfcfl_bottom_z],   //0
        [rfcfl_mid_x,rfcfl_far_left_y,rfcfl_bottom_z],          //1
        [rfcfl_far_front_x, rfcfl_near_right_y, rfcfl_bottom_z],//2
        [rfcfl_near_front_x, rfcfl_far_right_y, rfcfl_bottom_z],//3
        [rfcfl_far_back_x,rfcfl_mid_y,rfcfl_mid_z],             //4
        [rfcfl_far_back_x,rfcfl_mid_y,rfcfl_top_z]              //5
    ],
    faces=[[1,0,3,2],[0,1,5,4],[1,2,5],[0,4,3],[2,3,4,5]]);

    polyhedron(points=[
        [rfcfl_near_back_x,rfcfl_near_left_y,rfcfl_bottom_z],        //0
        [rfcfl_mid_x,rfcfl_far_left_y,rfcfl_bottom_z],               //1
        [rfcfl_far_front_x, rfcfl_near_right_y, rfcfl_bottom_z],     //2
        [rfcfl_near_front_x, rfcfl_far_right_y, rfcfl_bottom_z],     //3  
        [rfcfl_near_back_x,rfcfl_near_left_y,rfcfl_wall_bottom_z],   //4
        [rfcfl_mid_x,rfcfl_far_left_y,rfcfl_wall_bottom_z],          //5
        [rfcfl_far_front_x, rfcfl_near_right_y, rfcfl_wall_bottom_z],//6
        [rfcfl_near_front_x, rfcfl_far_right_y, rfcfl_wall_bottom_z],//7          
    ],
    faces=[[0,1,2,3],[1,0,4,5],[3,2,6,7],[5,4,7,6],[6,2,1,5],[3,7,4,0]]);

}

module RacecarFrontCoverCenter() {
    
    difference() {
        polyhedron(points=[
        [rfcc_back_x,rfcc_far_left_y,rfcc_mid_z],      //0
        [rfcc_back_x,rfcc_far_left_y,rfcc_top_z],      //1
        [rfcc_front_x,rfcc_mid_left_y,rfcc_bottom_z],  //2
        [rfcc_mid_x,rfcc_near_left_y,rfcc_bottom_z],   //3
        [rfcc_mid_x,rfcc_near_right_y,rfcc_bottom_z],  //4
        [rfcc_front_x,rfcc_mid_right_y,rfcc_bottom_z], //5
        [rfcc_back_x,rfcc_far_right_y,rfcc_top_z],     //6
        [rfcc_back_x,rfcc_far_right_y,rfcc_mid_z]      //7
        ],
        faces=[[2,3,4,5],[1,0,3,2],[1,2,5,6],[4,3,0,7],[5,4,7,6],[0,1,6,7]]);
        translate([rfcc_camera_x_offset, rfcc_camera_y_offset, rfcc_camera_z_offset]) {
            cube([rfcc_camera_length, rfcc_camera_width,rfcc_camera_height], true);
        }
        RacecarFrontCoverCenterNumber();
    }
    
    difference() {
        polyhedron(points=[
        [rfcc_front_x,rfcc_mid_left_y,rfcc_bottom_z],       //0
        [rfcc_mid_x,rfcc_near_left_y,rfcc_bottom_z],        //1
        [rfcc_mid_x,rfcc_near_right_y,rfcc_bottom_z],       //2
        [rfcc_front_x,rfcc_mid_right_y,rfcc_bottom_z],      //3
        [rfcc_front_x,rfcc_mid_left_y,rfcc_wall_bottom_z],  //4
        [rfcc_mid_x,rfcc_near_left_y,rfcc_wall_bottom_z],   //5
        [rfcc_mid_x,rfcc_near_right_y,rfcc_wall_bottom_z],  //6
        [rfcc_front_x,rfcc_mid_right_y,rfcc_wall_bottom_z], //7
        ],
        faces=[[1,0,3,2],[4,5,6,7],[0,1,5,4],[2,3,7,6],[3,0,4,7],[1,2,6,5]]);
        translate([0.5*(rfcc_front_x+rfcc_mid_x), rff_front_wall_screw_y_offset, 0.5*(rfcc_bottom_z+rfcc_wall_bottom_z)]) {
            scale([1.001,1,1]) {
                rotate([0,90,0]) {
                    _m3_flathead_screw(rfcc_front_x-rfcc_mid_x);
                }
            }
        }        
    }
}

module RacecarFrontCoverFrontRight() {
    
    rfcfr_far_back_x = rff_side_wall_x_offset - rff_side_wall_length/2.0;
    rfcfr_near_back_x = rff_side_wall_x_offset + rff_side_wall_length/2.0;
    rfcfr_mid_x = rff_compartment_x_offset + rff_compartment_length/2.0;
    rfcfr_near_front_x = rff_outer_front_wall_x_offset + rff_outer_front_wall_length/2.0;
    rfcfr_far_front_x = rff_extend_x_offset + rff_extend_length/2.0;
    rfcfr_far_right_y = rff_compartment_y_offset - rff_compartment_top_width/2.0;
    rfcfr_near_right_y = rff_side_wall_right_y_offset - rff_side_wall_width/2.0;
    rfcfr_mid_y = rbc_platform_y_offset - rbc_platform_width/2.0;
    rfcfr_near_left_y = rff_extend_y_offset - rff_extend_top_width/2.0;
    rfcfr_far_left_y = rff_outer_front_wall_y_offset - rff_outer_front_wall_front_width/2.0;
    rfcfr_bottom_z = rff_outer_front_wall_z_offset + rff_outer_front_wall_height/2.0;
    rfcfr_mid_z = rbc_platform_z_offset - rbc_platform_height/2.0;
    rfcfr_top_z = rbc_platform_z_offset + rbc_platform_height/2.0;
    
    rfcfr_wall_bottom_z = rff_outer_front_wall_z_offset - rff_outer_front_wall_height/2.0;
    
    polyhedron(points=[
        [rfcfr_near_back_x,rfcfr_near_right_y,rfcfr_bottom_z],   //0
        [rfcfr_mid_x,rfcfr_far_right_y,rfcfr_bottom_z],          //1
        [rfcfr_far_front_x, rfcfr_near_left_y, rfcfr_bottom_z],//2
        [rfcfr_near_front_x, rfcfr_far_left_y, rfcfr_bottom_z],//3
        [rfcfr_far_back_x,rfcfr_mid_y,rfcfr_mid_z],             //4
        [rfcfr_far_back_x,rfcfr_mid_y,rfcfr_top_z]              //5
    ],
    faces=[[1,0,3,2],[0,1,5,4],[1,2,5],[0,4,3],[2,3,4,5]]);


    polyhedron(points=[
        [rfcfr_near_back_x,rfcfr_near_right_y,rfcfr_bottom_z],        //0
        [rfcfr_mid_x,rfcfr_far_right_y,rfcfr_bottom_z],               //1
        [rfcfr_far_front_x, rfcfr_near_left_y, rfcfr_bottom_z],     //2
        [rfcfr_near_front_x, rfcfr_far_left_y, rfcfr_bottom_z],     //3  
        [rfcfr_near_back_x,rfcfr_near_right_y,rfcfr_wall_bottom_z],   //4
        [rfcfr_mid_x,rfcfr_far_right_y,rfcfr_wall_bottom_z],          //5
        [rfcfr_far_front_x, rfcfr_near_left_y, rfcfr_wall_bottom_z],//6
        [rfcfr_near_front_x, rfcfr_far_left_y, rfcfr_wall_bottom_z],//7          
    ],
    faces=[[0,1,2,3],[1,0,4,5],[3,2,6,7],[5,4,7,6],[6,2,1,5],[3,7,4,0]]);

}

module RacecarFrontCoverBackRight() {
    rfcbr_back_x = rff_side_wall_x_offset - rff_side_wall_length/2.0;
    rfcbr_mid_x = rff_side_wall_x_offset + rff_side_wall_length/2.0;
    rfcbr_front_x = rff_compartment_x_offset + rff_compartment_length/2.0;
    rfcbr_right_y = rff_compartment_y_offset - rff_compartment_top_width/2.0;
    rfcbr_mid_y = rff_side_wall_right_y_offset - rff_side_wall_width/2.0;
    rfcbr_left_y = rbc_platform_y_offset - rbc_platform_width/2.0;
    rfcbr_bottom_z = rff_side_wall_z_offset + rff_side_wall_height/2.0;
    rfcbr_mid_z = rbc_platform_z_offset - rbc_platform_height/2.0;
    rfcbr_top_z = rbc_platform_z_offset + rbc_platform_height/2.0;
    
    rfcbr_wall_bottom_z = rff_side_wall_z_offset - rff_side_wall_height/2.0;
    
    rfcbr_ssd_length = 60.0;
    rfcbr_ssd_width = 10.0;
    rfcbr_ssd_height = rfcc_button_height;
    rfcbr_ssd_x_offset = rff_jetson_front_right_x_offset - rfcbr_ssd_length/2.0 - 12.0;
    rfcbr_ssd_y_offset = rff_jetson_front_right_y_offset;
    rfcbr_ssd_z_offset = rfcc_button_z_offset;
        
    difference() {
        polyhedron(points=[
            [rfcbr_back_x, rfcbr_right_y, rfcbr_bottom_z], //0
            [rfcbr_back_x, rfcbr_mid_y, rfcbr_bottom_z],  //1
            [rfcbr_mid_x, rfcbr_mid_y, rfcbr_bottom_z],   //2
            [rfcbr_front_x, rfcbr_right_y, rfcbr_bottom_z],//3
            [rfcbr_back_x, rfcbr_right_y, rfcbr_wall_bottom_z], //4
            [rfcbr_back_x, rfcbr_mid_y, rfcbr_wall_bottom_z],  //5
            [rfcbr_mid_x, rfcbr_mid_y, rfcbr_wall_bottom_z],   //6
            [rfcbr_front_x, rfcbr_right_y, rfcbr_wall_bottom_z],//7        
        ], 
        faces=[[3,2,1,0],[4,5,6,7],[3,0,4,7],[1,2,6,5],[2,3,7,6],[0,1,5,4]]);
        translate([rff_side_wall_screw_front_x_offset, 0.5*(rfcbr_right_y+rfcbr_mid_y), 0.5*(rfcbr_bottom_z+rfcbr_wall_bottom_z)]) {
            scale([1,1.001,1]) {
                rotate([90,0,0]) {
                    _m3_flathead_screw(rfcbr_mid_y-rfcbr_right_y);
                }
            }
        }
        translate([rff_side_wall_screw_back_x_offset, 0.5*(rfcbr_right_y+rfcbr_mid_y), 0.5*(rfcbr_bottom_z+rfcbr_wall_bottom_z)]) {
            scale([1,1.001,1]) {
                rotate([90,0,0]) {
                    _m3_flathead_screw(rfcbr_mid_y-rfcbr_right_y);
                }
            }
        }
    }

    difference() {
        polyhedron(points=[
            [rfcbr_back_x, rfcbr_right_y, rfcbr_bottom_z], //0
            [rfcbr_back_x, rfcbr_mid_y, rfcbr_bottom_z],  //1
            [rfcbr_mid_x, rfcbr_mid_y, rfcbr_bottom_z],   //2
            [rfcbr_front_x, rfcbr_right_y, rfcbr_bottom_z],//3
            [rfcbr_back_x, rfcbr_left_y, rfcbr_mid_z],   //4
            [rfcbr_back_x, rfcbr_left_y, rfcbr_top_z]    //5
        ], 
        faces=[[0,1,2,3], [0,3,5], [2,1,4], [4,1,0,5], [3,2,4,5]]);
        /*
        translate([rfcbr_ssd_x_offset,rfcbr_ssd_y_offset,rfcbr_ssd_z_offset]) {
            cube([rfcbr_ssd_length, rfcbr_ssd_width, rfcbr_ssd_height], true);
        }
        */
    }
    
}

module RacecarFrontCoverCenterNumber() {
    translate([rfcc_number_x_offset,rfcc_number_y_offset,rfcc_number_z_offset]) {
        rotate([rfcc_number_x_rotation,rfcc_number_y_rotation,rfcc_number_z_rotation]) {
            scale([35.0/racecar_cover_number_size,35.0/racecar_cover_number_size,1]) {
                RacecarCoverNumber();
            }
        }
    }    
}