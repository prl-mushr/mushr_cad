$include_rff = true;
include <racecar_front_foundation.scad>

$include_rbcls = true;
include <racecar_back_cover_left_side.scad>

$include_rcn = true;
include <../../misc/racecar_cover_number.scad>

rfcc_rbct_left_top_x = -rff_wrt_rcb_x_offset + rbf_wrt_rcb_x_offset + rbct_wrt_rbf_x_offset + rbct_length/2.0;
rfcc_rbct_left_top_y = -rff_wrt_rcb_y_offset + rbf_wrt_rcb_y_offset + rbct_wrt_rbf_y_offset + rbct_width/2.0+rbcls_rbct_extra_width;
rfcc_rbct_left_top_z = -rff_wrt_rcb_z_offset + rbf_wrt_rcb_z_offset + rbct_wrt_rbf_z_offset + rbct_height/2.0;
rfcc_rbct_left_bottom_x = -rff_wrt_rcb_x_offset + rbf_wrt_rcb_x_offset + rbct_wrt_rbf_x_offset + rbct_length/2.0;
rfcc_rbct_left_bottom_y = -rff_wrt_rcb_y_offset + rbf_wrt_rcb_y_offset + rbct_wrt_rbf_y_offset + rbct_width/2.0+rbcls_rbct_extra_width;
rfcc_rbct_left_bottom_z = -rff_wrt_rcb_z_offset + rbf_wrt_rcb_z_offset + rbct_wrt_rbf_z_offset - rbct_height/2.0;
rfcc_rbct_right_top_x = -rff_wrt_rcb_x_offset + rbf_wrt_rcb_x_offset + rbct_wrt_rbf_x_offset + rbct_length/2.0;
rfcc_rbct_right_top_y = -rff_wrt_rcb_y_offset + rbf_wrt_rcb_y_offset + rbct_wrt_rbf_y_offset - rbct_width/2.0-rbcls_rbct_extra_width;
rfcc_rbct_right_top_z = -rff_wrt_rcb_z_offset + rbf_wrt_rcb_z_offset + rbct_wrt_rbf_z_offset + rbct_height/2.0;
rfcc_rbct_right_bottom_x = -rff_wrt_rcb_x_offset + rbf_wrt_rcb_x_offset + rbct_wrt_rbf_x_offset + rbct_length/2.0;
rfcc_rbct_right_bottom_y = -rff_wrt_rcb_y_offset + rbf_wrt_rcb_y_offset + rbct_wrt_rbf_y_offset - rbct_width/2.0-rbcls_rbct_extra_width;
rfcc_rbct_right_bottom_z = -rff_wrt_rcb_z_offset + rbf_wrt_rcb_z_offset + rbct_wrt_rbf_z_offset - rbct_height/2.0;

rfcc_rff_cover_front_left_x = rff_head_front_left_x;
rfcc_rff_cover_front_left_y = rff_head_front_left_y;
rfcc_rff_cover_front_left_z = rff_front_wall_top_z;
rfcc_rff_cover_front_right_x = rff_head_front_right_x;
rfcc_rff_cover_front_right_y = rff_head_front_right_y;
rfcc_rff_cover_front_right_z = rff_front_wall_top_z;
rfcc_rff_cover_back_left_x = rff_front_wall_front_outer_left_x;
rfcc_rff_cover_back_left_y = rff_front_wall_front_outer_left_y;
rfcc_rff_cover_back_left_z = rff_front_wall_top_z;
rfcc_rff_cover_back_right_x = rff_front_wall_front_outer_right_x;
rfcc_rff_cover_back_right_y = rff_front_wall_front_outer_right_y;
rfcc_rff_cover_back_right_z = rff_front_wall_top_z;

rfcc_rff_wall_front_left_x = rff_head_front_left_x;
rfcc_rff_wall_front_left_y = rff_head_front_left_y;
rfcc_rff_wall_front_left_z = rff_front_wall_bottom_z;
rfcc_rff_wall_front_right_x = rff_head_front_right_x;
rfcc_rff_wall_front_right_y = rff_head_front_right_y;
rfcc_rff_wall_front_right_z = rff_front_wall_bottom_z;
rfcc_rff_wall_back_left_x = rff_front_wall_front_outer_left_x;
rfcc_rff_wall_back_left_y = rff_front_wall_front_outer_left_y;
rfcc_rff_wall_back_left_z = rff_front_wall_bottom_z;
rfcc_rff_wall_back_right_x = rff_front_wall_front_outer_right_x;
rfcc_rff_wall_back_right_y = rff_front_wall_front_outer_right_y;
rfcc_rff_wall_back_right_z = rff_front_wall_bottom_z;

rfcc_top_xz_slope = (rfcc_rff_cover_front_left_z-rfcc_rbct_left_top_z)/(rfcc_rff_cover_front_left_x-rfcc_rbct_left_top_x);
rfcc_bottom_xz_slope = (rfcc_rff_cover_back_left_z-rfcc_rbct_left_bottom_z)/(rfcc_rff_cover_back_left_x-rfcc_rbct_left_bottom_x);
rfcc_left_xy_slope = (rfcc_rff_cover_front_left_y-rfcc_rbct_left_top_y)/(rfcc_rff_cover_front_left_x-rfcc_rbct_left_top_x);
rfcc_right_xy_slope = (rfcc_rff_cover_front_right_y-rfcc_rbct_right_top_y)/(rfcc_rff_cover_front_right_x-rfcc_rbct_right_top_y);

rfcc_camera_cutout_extra_front_x = 45.0;
rfcc_camera_cutout_front_left_top_x = rfcc_rbct_left_top_x + rfcc_camera_cutout_extra_front_x;
rfcc_camera_cutout_front_left_top_y = rfcc_rbct_left_top_y + rfcc_camera_cutout_extra_front_x*rfcc_left_xy_slope;
rfcc_camera_cutout_front_left_top_z = rfcc_rbct_left_top_z + rfcc_camera_cutout_extra_front_x*rfcc_top_xz_slope;

rfcc_camera_cutout_front_left_bottom_x = rfcc_rbct_left_bottom_x + rfcc_camera_cutout_extra_front_x;
rfcc_camera_cutout_front_left_bottom_y = rfcc_rbct_left_bottom_y + rfcc_camera_cutout_extra_front_x*rfcc_left_xy_slope;
rfcc_camera_cutout_front_left_bottom_z = rfcc_rbct_left_bottom_z + rfcc_camera_cutout_extra_front_x*rfcc_bottom_xz_slope;  

rfcc_camera_cutout_front_right_top_x = rfcc_rbct_right_top_x + rfcc_camera_cutout_extra_front_x;
rfcc_camera_cutout_front_right_top_y = rfcc_rbct_right_top_y + rfcc_camera_cutout_extra_front_x*rfcc_right_xy_slope;
rfcc_camera_cutout_front_right_top_z = rfcc_rbct_right_top_z + rfcc_camera_cutout_extra_front_x*rfcc_top_xz_slope;

rfcc_camera_cutout_front_right_bottom_x = rfcc_rbct_right_bottom_x + rfcc_camera_cutout_extra_front_x;
rfcc_camera_cutout_front_right_bottom_y = rfcc_rbct_right_bottom_y + rfcc_camera_cutout_extra_front_x*rfcc_right_xy_slope;
rfcc_camera_cutout_front_right_bottom_z = rfcc_rbct_right_bottom_z + rfcc_camera_cutout_extra_front_x*rfcc_bottom_xz_slope;

rfcc_camera_cutout_z_separation = 25.0;
rfcc_camera_cutout_extra_back_x = rfcc_camera_cutout_extra_front_x + rfcc_camera_cutout_z_separation*(1.0/rfcc_top_xz_slope);

rfcc_camera_cutout_back_left_top_x = rfcc_rbct_left_top_x + rfcc_camera_cutout_extra_back_x;
rfcc_camera_cutout_back_left_top_y = rfcc_rbct_left_top_y + rfcc_camera_cutout_extra_back_x*rfcc_left_xy_slope;
rfcc_camera_cutout_back_left_top_z = rfcc_rbct_left_top_z + rfcc_camera_cutout_extra_back_x*rfcc_top_xz_slope;

rfcc_camera_cutout_back_left_bottom_x = rfcc_rbct_left_bottom_x + rfcc_camera_cutout_extra_back_x;
rfcc_camera_cutout_back_left_bottom_y = rfcc_rbct_left_bottom_y + rfcc_camera_cutout_extra_back_x*rfcc_left_xy_slope;
rfcc_camera_cutout_back_left_bottom_z = rfcc_rbct_left_bottom_z + rfcc_camera_cutout_extra_back_x*rfcc_bottom_xz_slope;   

rfcc_camera_cutout_back_right_top_x = rfcc_rbct_right_top_x + rfcc_camera_cutout_extra_back_x;
rfcc_camera_cutout_back_right_top_y = rfcc_rbct_right_top_y + rfcc_camera_cutout_extra_back_x*rfcc_right_xy_slope;
rfcc_camera_cutout_back_right_top_z = rfcc_rbct_right_top_z + rfcc_camera_cutout_extra_back_x*rfcc_top_xz_slope;

rfcc_camera_cutout_back_right_bottom_x = rfcc_rbct_right_bottom_x + rfcc_camera_cutout_extra_back_x;
rfcc_camera_cutout_back_right_bottom_y = rfcc_rbct_right_bottom_y + rfcc_camera_cutout_extra_back_x*rfcc_right_xy_slope;
rfcc_camera_cutout_back_right_bottom_z = rfcc_rbct_right_bottom_z + rfcc_camera_cutout_extra_back_x*rfcc_bottom_xz_slope;

rfcc_camera_mount_extra_x = -_wall_thickness + rfcc_camera_cutout_extra_back_x;

rfcc_camera_mount_left_top_x = rfcc_rbct_left_top_x+rfcc_camera_mount_extra_x;
rfcc_camera_mount_left_top_y = rfcc_rbct_left_top_y+rfcc_camera_mount_extra_x*rfcc_left_xy_slope;
rfcc_camera_mount_left_top_z = rfcc_rbct_left_top_z+rfcc_camera_mount_extra_x*rfcc_top_xz_slope;

rfcc_camera_mount_left_bottom_x = rfcc_rbct_left_top_x+rfcc_camera_mount_extra_x;
rfcc_camera_mount_left_bottom_y = rfcc_rbct_left_top_y+rfcc_camera_mount_extra_x*rfcc_left_xy_slope;
rfcc_camera_mount_left_bottom_z = rfcc_camera_cutout_front_left_bottom_z;

rfcc_camera_mount_right_top_x = rfcc_rbct_right_top_x+rfcc_camera_mount_extra_x;
rfcc_camera_mount_right_top_y = rfcc_rbct_right_top_y+rfcc_camera_mount_extra_x*rfcc_right_xy_slope;
rfcc_camera_mount_right_top_z = rfcc_rbct_right_top_z+rfcc_camera_mount_extra_x*rfcc_top_xz_slope;

rfcc_camera_mount_right_bottom_x = rfcc_rbct_right_top_x+rfcc_camera_mount_extra_x;
rfcc_camera_mount_right_bottom_y = rfcc_rbct_right_top_y+rfcc_camera_mount_extra_x*rfcc_right_xy_slope;
rfcc_camera_mount_right_bottom_z = rfcc_camera_cutout_front_right_bottom_z;    

rfcc_camera_mount_screw_height = 2*_wall_thickness;
rfcc_camera_mount_screw_x_offset = (rfcc_camera_mount_right_top_x+rfcc_camera_cutout_back_right_top_x)/2.0;
rfcc_camera_mount_screw_left_y_offset = (rfcc_camera_mount_left_top_y+rfcc_camera_mount_right_top_y)/2.0+45/2.0;
rfcc_camera_mount_screw_right_y_offset = (rfcc_camera_mount_left_top_y+rfcc_camera_mount_right_top_y)/2.0-45/2.0;
rfcc_camera_mount_screw_z_offset = rfcc_camera_cutout_front_right_top_z+14.5;

rfcc_t265_mount_screw_height = rfcc_camera_mount_screw_height;
rfcc_t265_mount_screw_x_offset = rfcc_camera_mount_screw_x_offset;
rfcc_t265_mount_screw_left_y_offset = (rfcc_camera_mount_left_top_y+rfcc_camera_mount_right_top_y)/2.0 - 9.1 + 50.0/2.0;
rfcc_t265_mount_screw_right_y_offset = rfcc_t265_mount_screw_left_y_offset - 50.0;
rfcc_t265_mount_screw_z_offset = rfcc_camera_cutout_front_right_top_z+14.5;

rfcc_number_slope = (rfcc_rbct_left_top_z-rfcc_rff_cover_front_left_z)/(rfcc_rbct_left_top_x-rfcc_rff_cover_front_left_x);
rfcc_number_x_rotation = -atan(rfcc_number_slope);
rfcc_number_y_rotation = 0.0;
rfcc_number_z_rotation = 90;
rfcc_number_extra_z = -45.0;
rfcc_number_extra_x = rfcc_number_extra_z*(1.0/rfcc_number_slope);
rfcc_number_x_offset = rfcc_rbct_left_top_x+rfcc_number_extra_x;
rfcc_number_y_offset = (rfcc_rbct_left_top_y+rfcc_rbct_right_top_y)/2.0;
rfcc_number_z_offset = rfcc_rbct_left_top_z-racecar_cover_number_height/2.0+rfcc_number_extra_z;    

if ($include_rfcc==undef) {
    RacecarFrontCoverCenter();
}

module RacecarFrontCoverCenterCutout() {
    polyhedron(points=[
    [rfcc_camera_cutout_front_left_top_x,rfcc_camera_cutout_front_left_top_y,rfcc_camera_cutout_front_left_top_z],
    [rfcc_camera_cutout_front_left_bottom_x,rfcc_camera_cutout_front_left_bottom_y,rfcc_camera_cutout_front_left_bottom_z],
    [rfcc_camera_cutout_front_right_top_x,rfcc_camera_cutout_front_right_top_y,rfcc_camera_cutout_front_right_top_z],
    [rfcc_camera_cutout_front_right_bottom_x,rfcc_camera_cutout_front_right_bottom_y,rfcc_camera_cutout_front_right_bottom_z],
    [rfcc_camera_cutout_back_left_top_x,rfcc_camera_cutout_back_left_top_y,rfcc_camera_cutout_back_left_top_z],
    [rfcc_camera_cutout_back_left_bottom_x,rfcc_camera_cutout_back_left_bottom_y,rfcc_camera_cutout_back_left_bottom_z],
    [rfcc_camera_cutout_back_right_top_x,rfcc_camera_cutout_back_right_top_y,rfcc_camera_cutout_back_right_top_z],
    [rfcc_camera_cutout_back_right_bottom_x,rfcc_camera_cutout_back_right_bottom_y,rfcc_camera_cutout_back_right_bottom_z],        
    ], faces=[[2,3,7,6],[1,0,4,5],[2,0,1,3],[5,4,6,7],[4,0,2,6],[5,7,3,1]]);    
}

module RacecarFrontCoverCenterUSB() {
    rfcc_usb_length = 10;
    rfcc_usb_width = 100.0;
    rfcc_usb_height = 30.0;
    translate([rfcc_camera_cutout_back_right_top_x+rfcc_usb_length/2.0,rfcc_camera_cutout_front_right_top_y-rfcc_usb_width/2.0,rfcc_camera_cutout_front_right_top_z+rfcc_usb_height/2.0]) {
        cube([rfcc_usb_length,rfcc_usb_width,rfcc_usb_height], true);
    }
}

module RacecarFrontCoverCenter() {
    
    rfcc_wall_screw_height = (rfcc_rff_wall_front_left_x - rfcc_rff_wall_back_left_x);
    rfcc_wall_screw_x_offset = (rfcc_rff_wall_front_left_x + rfcc_rff_wall_back_left_x)/2.0;
    rfcc_wall_screw_y_offset = (rfcc_rff_wall_front_left_y + rfcc_rff_wall_front_right_y)/2.0;
    rfcc_wall_screw_z_offset = (rfcc_rff_wall_front_left_z + rfcc_rff_cover_front_left_z)/2.0;

    /*
    translate([rfcc_t265_mount_screw_x_offset+8,(rfcc_t265_mount_screw_left_y_offset+rfcc_t265_mount_screw_right_y_offset)/2.0, rfcc_t265_mount_screw_z_offset]) {
       cube([12.5,108,24.5], true);
    } 

    translate([rfcc_camera_mount_screw_x_offset+15,0.0,rfcc_camera_mount_screw_z_offset]) {
        cube([25,90,25], true);
    }
    echo(rfcc_camera_cutout_back_left_top_y-rfcc_camera_cutout_back_right_top_y);
    echo(rfcc_camera_cutout_front_left_top_y-rfcc_camera_cutout_front_right_top_y);
    */
    difference() {
        union() {
            difference() {
                polyhedron(points=[
                [rfcc_rbct_left_top_x,rfcc_rbct_left_top_y,rfcc_rbct_left_top_z], // 0
                [rfcc_rbct_left_bottom_x,rfcc_rbct_left_bottom_y,rfcc_rbct_left_bottom_z], // 1
                [rfcc_rbct_right_top_x,rfcc_rbct_right_top_y,rfcc_rbct_right_top_z], // 2
                [rfcc_rbct_right_bottom_x,rfcc_rbct_right_bottom_y,rfcc_rbct_right_bottom_z], // 3
                [rfcc_rff_cover_front_left_x,rfcc_rff_cover_front_left_y,rfcc_rff_cover_front_left_z], // 4 
                [rfcc_rff_cover_front_right_x,rfcc_rff_cover_front_right_y,rfcc_rff_cover_front_right_z], // 5
                [rfcc_rff_cover_back_left_x,rfcc_rff_cover_back_left_y,rfcc_rff_cover_back_left_z], // 6
                [rfcc_rff_cover_back_right_x,rfcc_rff_cover_back_right_y,rfcc_rff_cover_back_right_z]], // 7
                faces=[[0,2,3,1],[0,4,5,2],[1,3,7,6],[0,1,6,4],[3,2,5,7],[4,6,7,5]]);
                
                scale([0.9999,1.05,1.001]) { // Hack - shouldn't have to rescale or translate
                    translate([0.00,0.0,-0.03]){
                        RacecarFrontCoverCenterCutout();
                    }
                } 
                scale([1.0,1.0,1.0]) { // Hack - shouldn't have to rescale or translate
                    translate([0.00,0.0,-0.0]){
                        RacecarFrontCoverCenterCutout();
                    }
                }                 
                
            }
            
            polyhedron(points=[
            [rfcc_rff_cover_front_left_x,rfcc_rff_cover_front_left_y,rfcc_rff_cover_front_left_z], // 0 
            [rfcc_rff_cover_front_right_x,rfcc_rff_cover_front_right_y,rfcc_rff_cover_front_right_z], // 1
            [rfcc_rff_cover_back_left_x,rfcc_rff_cover_back_left_y,rfcc_rff_cover_back_left_z], // 2
            [rfcc_rff_cover_back_right_x,rfcc_rff_cover_back_right_y,rfcc_rff_cover_back_right_z], // 3
            [rfcc_rff_wall_front_left_x,rfcc_rff_wall_front_left_y,rfcc_rff_wall_front_left_z], // 4
            [rfcc_rff_wall_front_right_x,rfcc_rff_wall_front_right_y,rfcc_rff_wall_front_right_z], // 5
            [rfcc_rff_wall_back_left_x,rfcc_rff_wall_back_left_y,rfcc_rff_wall_back_left_z], // 6
            [rfcc_rff_wall_back_right_x,rfcc_rff_wall_back_right_y,rfcc_rff_wall_back_right_z], // 7            
            ],faces=[[0,1,3,2],[2,3,7,6],[0,4,5,1],[0,2,6,4],[1,5,7,3],[4,6,7,5]]);
            
            polyhedron(points=[
            [rfcc_camera_mount_left_top_x,rfcc_camera_mount_left_top_y,rfcc_camera_mount_left_top_z],
            [rfcc_camera_mount_left_bottom_x,rfcc_camera_mount_left_bottom_y,rfcc_camera_mount_left_bottom_z],
            [rfcc_camera_mount_right_top_x,rfcc_camera_mount_right_top_y,rfcc_camera_mount_right_top_z],
            [rfcc_camera_mount_right_bottom_x,rfcc_camera_mount_right_bottom_y,rfcc_camera_mount_right_bottom_z],  
            [rfcc_camera_cutout_back_left_top_x,rfcc_camera_cutout_back_left_top_y,rfcc_camera_cutout_back_left_top_z],
            [rfcc_camera_cutout_back_right_top_x,rfcc_camera_cutout_back_right_top_y,rfcc_camera_cutout_back_right_top_z],
            [rfcc_camera_cutout_back_left_top_x,rfcc_camera_cutout_back_left_top_y,rfcc_camera_mount_left_bottom_z],
            [rfcc_camera_cutout_back_right_top_x,rfcc_camera_cutout_back_right_top_y,rfcc_camera_mount_right_bottom_z]],
            faces=[[0,2,3,1],[5,4,6,7],[2,0,4,5],[1,3,7,6],[4,0,1,6],[3,2,5,7]]);
            
            polyhedron(points=[
            [rfcc_camera_cutout_front_left_top_x,rfcc_camera_cutout_front_left_top_y,rfcc_camera_cutout_front_left_top_z],
            [rfcc_camera_cutout_front_left_bottom_x,rfcc_camera_cutout_front_left_bottom_y,rfcc_camera_cutout_front_left_bottom_z],
            [rfcc_camera_cutout_front_right_top_x,rfcc_camera_cutout_front_right_top_y,rfcc_camera_cutout_front_right_top_z],
            [rfcc_camera_cutout_front_right_bottom_x,rfcc_camera_cutout_front_right_bottom_y,rfcc_camera_cutout_front_right_bottom_z], 
            [rfcc_camera_cutout_back_left_top_x,rfcc_camera_cutout_back_left_top_y,rfcc_camera_mount_left_bottom_z],
            [rfcc_camera_cutout_back_right_top_x,rfcc_camera_cutout_back_right_top_y,rfcc_camera_mount_right_bottom_z],
            [rfcc_camera_cutout_back_left_top_x,rfcc_camera_cutout_back_left_top_y,rfcc_camera_cutout_front_left_top_z],
            [rfcc_camera_cutout_back_right_top_x,rfcc_camera_cutout_back_right_top_y,rfcc_camera_cutout_front_right_top_z]],
            faces=[[0,1,3,2],[5,4,6,7],[3,1,4,5],[0,2,7,6],[1,0,6,4],[2,3,5,7]]);
            
        }
        
        translate([rfcc_wall_screw_x_offset, rfcc_wall_screw_y_offset, rfcc_wall_screw_z_offset]) {
            scale([1.001,1,1]) {
                rotate([0,90,0]) {
                    _m2_5_flathead_screw(rfcc_wall_screw_height);
                }
            }
        }

        RacecarFrontCoverCenterNumber();
        
        translate([rfcc_camera_mount_screw_x_offset, rfcc_camera_mount_screw_left_y_offset, rfcc_camera_mount_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcc_camera_mount_screw_height, _m3_screw_shaft_radius, _m3_screw_shaft_radius, true, $fn=_fn_val);
            }
        }
        translate([rfcc_camera_mount_screw_x_offset, rfcc_camera_mount_screw_right_y_offset, rfcc_camera_mount_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcc_camera_mount_screw_height, _m3_screw_shaft_radius, _m3_screw_shaft_radius, true, $fn=_fn_val);
            }
        } 
       
        translate([rfcc_t265_mount_screw_x_offset, rfcc_t265_mount_screw_left_y_offset, rfcc_t265_mount_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcc_t265_mount_screw_height, _m3_screw_shaft_radius, _m3_screw_shaft_radius, true, $fn=_fn_val);
            }
        }
        translate([rfcc_t265_mount_screw_x_offset, rfcc_t265_mount_screw_right_y_offset, rfcc_t265_mount_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcc_t265_mount_screw_height, _m3_screw_shaft_radius, _m3_screw_shaft_radius, true, $fn=_fn_val);
            }
        }        
        
        translate([0,10,-15.0]) {
            RacecarFrontCoverCenterUSB();
        }
    }
    
}

module RacecarFrontCoverCenterNumber() {
    translate([rfcc_number_x_offset,rfcc_number_y_offset,rfcc_number_z_offset]) {
        rotate([rfcc_number_x_rotation,rfcc_number_y_rotation,rfcc_number_z_rotation]) {
            RacecarCoverNumber();
        }
    }    
}