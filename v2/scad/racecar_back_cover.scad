$include_rbf=true;
include <racecar_back_foundation.scad>

use <../../misc/racecar_cover_image.scad>

rbc_length = rbf_compartment_length;
rbc_width = 92.0;
rbc_height = 97.0;

rbc_platform_length = rbc_length;
rbc_platform_width = rbc_width;
rbc_platform_height = 6.0;
rbc_platform_x_offset = rbf_compartment_x_offset;
rbc_platform_y_offset = rbf_compartment_y_offset;
rbc_platform_z_offset = rbf_compartment_z_offset + rbf_compartment_height/2.0+rbc_height-rbc_platform_height/2.0;

rbc_side_wall_length = rbf_side_wall_length;
rbc_side_wall_width = rbf_compartment_y_offset + rbf_compartment_top_width/2.0 - (rbf_side_wall_left_y_offset+rbf_side_wall_width/2.0);
rbc_side_wall_height = rbf_side_wall_height;
rbc_side_wall_x_offset = rbf_side_wall_x_offset;
rbc_side_wall_left_y_offset = rbf_side_wall_left_y_offset+rbf_side_wall_width/2.0+rbc_side_wall_width/2.0;
rbc_side_wall_right_y_offset = rbf_side_wall_right_y_offset-rbf_side_wall_width/2.0-rbc_side_wall_width/2.0;
rbc_side_wall_z_offset = rbf_side_wall_z_offset; 

rbcl_front_x = rbc_side_wall_x_offset + rbc_side_wall_length/2.0;
rbcl_back_x = rbc_side_wall_x_offset - rbc_side_wall_length/2.0;
rbcl_left_y = rbc_side_wall_left_y_offset + rbc_side_wall_width/2.0;
rbcl_mid_y = rbc_side_wall_left_y_offset - rbc_side_wall_width/2.0;
rbcl_right_y = rbc_platform_y_offset + rbc_platform_width/2.0;
rbcl_top_z = rbc_platform_z_offset + rbc_platform_height/2.0;
rbcl_mid_z = rbc_platform_z_offset - rbc_platform_height/2.0;
rbcl_bottom_z = rbc_side_wall_z_offset + rbc_side_wall_height/2.0;


rbcr_front_x = rbc_side_wall_x_offset + rbc_side_wall_length/2.0;
rbcr_back_x = rbc_side_wall_x_offset - rbc_side_wall_length/2.0;
rbcr_right_y = rbc_side_wall_right_y_offset - rbc_side_wall_width/2.0;
rbcr_mid_y = rbc_side_wall_right_y_offset + rbc_side_wall_width/2.0;
rbcr_left_y = rbc_platform_y_offset - rbc_platform_width/2.0;
rbcr_top_z = rbc_platform_z_offset + rbc_platform_height/2.0;
rbcr_mid_z = rbc_platform_z_offset - rbc_platform_height/2.0;
rbcr_bottom_z = rbc_side_wall_z_offset + rbc_side_wall_height/2.0;


rbc_laser_from_front = (rbc_platform_length - 101.7)/2 + 13;
rbc_laser_height = 3.0;
rbc_laser_radius = 5.75/2.0;
rbc_laser_front_x_offset = rbc_platform_x_offset + rbc_platform_length/2.0 - rbc_laser_from_front;
rbc_laser_back_x_offset = rbc_laser_front_x_offset - 57.0;
rbc_laser_front_left_y_offset = rbc_platform_y_offset + 31.0;
rbc_laser_front_right_y_offset = rbc_platform_y_offset - 31.0;
rbc_laser_back_left_y_offset = rbc_platform_y_offset + 25.0;
rbc_laser_back_right_y_offset = rbc_platform_y_offset - 25.0;
rbc_laser_z_offset = rbc_platform_z_offset + rbc_platform_height/2.0 - rbc_laser_height/2.0;

if($include_rbc==undef) {
    RacecarBackCover();
}

module RacecarBackCover() {
    
    rbc_side_wall_screw_height = rbc_side_wall_width;
    rbc_side_wall_screw_front_x_offset = rbf_side_wall_screw_front_x_offset;
    rbc_side_wall_screw_back_x_offset = rbf_side_wall_screw_back_x_offset;
    rbc_side_wall_screw_left_y_offset = rbf_side_wall_screw_left_y_offset+rbf_side_wall_screw_height/2.0+rbc_side_wall_width/2.0;
    rbc_side_wall_screw_right_y_offset = rbf_side_wall_screw_right_y_offset-rbf_side_wall_screw_height/2.0-rbc_side_wall_width/2.0; 
    rbc_side_wall_screw_z_offset = rbf_side_wall_screw_z_offset;
    
    rbc_laser_screw_head_radius = 4/2.0;
    rbc_laser_screw_head_height = 7.64 - 6.5;
    rbc_laser_screw_shaft_radius = 2.35/2;    
    rbc_laser_screw_height = rbc_platform_height;
    rbc_laser_screw_front_x_offset = rbc_laser_front_x_offset;
    rbc_laser_screw_back_x_offset = rbc_laser_back_x_offset;
    rbc_laser_screw_front_left_y_offset = rbc_laser_front_left_y_offset;
    rbc_laser_screw_front_right_y_offset = rbc_laser_front_right_y_offset;
    rbc_laser_screw_back_left_y_offset = rbc_laser_back_left_y_offset;
    rbc_laser_screw_back_right_y_offset = rbc_laser_back_right_y_offset;    
    rbc_laser_screw_z_offset = rbc_platform_z_offset;
    
    rbc_laser_connector_length = 32.0;
    rbc_laser_connector_width = 10.0;
    rbc_laser_connector_height = rbc_platform_height;
    rbc_laser_connector_x_offset = 0.5*(rbc_laser_front_x_offset+rbc_laser_back_x_offset);
    rbc_laser_connector_y_offset = 0.5*(rbc_laser_front_left_y_offset+rbc_laser_front_right_y_offset)+12.0;
    rbc_laser_connector_z_offset = rbc_platform_z_offset;
    
    rbc_laser_board_height = _m3_insert_depth;
    rbc_laser_board_radius = _m3_insert_radius;
    rbc_laser_board_back_x_offset = rbc_laser_connector_x_offset + rbc_laser_connector_length/2.0 + rbc_laser_board_radius-6.0;
    rbc_laser_board_front_x_offset = rbc_laser_board_back_x_offset + 25.5;
    rbc_laser_board_left_y_offset = rbc_platform_y_offset + 28.5/2+10.0;
    rbc_laser_board_right_y_offset =  rbc_laser_board_left_y_offset - 28.5;
    rbc_laser_board_z_offset = rbc_platform_z_offset - rbc_platform_height/2.0+rbc_laser_board_height/2.0;
        
    difference() {
        translate([rbc_platform_x_offset,rbc_platform_y_offset,rbc_platform_z_offset]) {
           cube([rbc_platform_length, rbc_platform_width, rbc_platform_height], true);
        }  
        translate([rbc_laser_front_x_offset, rbc_laser_front_left_y_offset, rbc_laser_z_offset]) {
            cylinder(rbc_laser_height, rbc_laser_radius, rbc_laser_radius, true, $fn=_fn_val);
        }
        translate([rbc_laser_screw_front_x_offset, rbc_laser_screw_front_left_y_offset, rbc_laser_screw_z_offset]) {
            rotate([180,0,0]) {
                _flathead_screw(rbc_laser_screw_height+0.01, rbc_laser_screw_head_height, rbc_laser_screw_head_radius, rbc_laser_screw_shaft_radius);                
            }
        }        
        translate([rbc_laser_front_x_offset, rbc_laser_front_right_y_offset, rbc_laser_z_offset]) {
            cylinder(rbc_laser_height, rbc_laser_radius, rbc_laser_radius, true, $fn=_fn_val);
        }
        translate([rbc_laser_screw_front_x_offset, rbc_laser_screw_front_right_y_offset, rbc_laser_screw_z_offset]) {
            rotate([180,0,0]) {
                _flathead_screw(rbc_laser_screw_height+0.01, rbc_laser_screw_head_height, rbc_laser_screw_head_radius, rbc_laser_screw_shaft_radius);                
            }
        }          
        translate([rbc_laser_back_x_offset, rbc_laser_back_left_y_offset, rbc_laser_z_offset]) {
            cylinder(rbc_laser_height, rbc_laser_radius, rbc_laser_radius, true, $fn=_fn_val);
        }
        translate([rbc_laser_screw_back_x_offset, rbc_laser_screw_back_left_y_offset, rbc_laser_screw_z_offset]) {
            rotate([180,0,0]) {
                _flathead_screw(rbc_laser_screw_height+0.01, rbc_laser_screw_head_height, rbc_laser_screw_head_radius, rbc_laser_screw_shaft_radius);                
            }
        }                  
        translate([rbc_laser_back_x_offset, rbc_laser_back_right_y_offset, rbc_laser_z_offset]) {
            cylinder(rbc_laser_height, rbc_laser_radius, rbc_laser_radius, true, $fn=_fn_val);
        }  
        translate([rbc_laser_screw_back_x_offset, rbc_laser_screw_back_right_y_offset, rbc_laser_screw_z_offset]) {
            rotate([180,0,0]) {
                _flathead_screw(rbc_laser_screw_height+0.01, rbc_laser_screw_head_height, rbc_laser_screw_head_radius, rbc_laser_screw_shaft_radius);                
            }
        }           
        translate([rbc_laser_connector_x_offset,rbc_laser_connector_y_offset,rbc_laser_connector_z_offset]) {
            cube([rbc_laser_connector_length,rbc_laser_connector_width,rbc_laser_connector_height],true);
        }
        translate([rbc_laser_board_front_x_offset, rbc_laser_board_left_y_offset, rbc_laser_board_z_offset]) {
            cylinder(rbc_laser_board_height, rbc_laser_board_radius, rbc_laser_board_radius, true, $fn=_fn_val);
        }
        translate([rbc_laser_board_front_x_offset, rbc_laser_board_right_y_offset, rbc_laser_board_z_offset]) {
            cylinder(rbc_laser_board_height, rbc_laser_board_radius, rbc_laser_board_radius, true, $fn=_fn_val);
        }        
        translate([rbc_laser_board_back_x_offset, rbc_laser_board_left_y_offset, rbc_laser_board_z_offset]) {
            cylinder(rbc_laser_board_height, rbc_laser_board_radius, rbc_laser_board_radius, true, $fn=_fn_val);
        }
        translate([rbc_laser_board_back_x_offset, rbc_laser_board_right_y_offset, rbc_laser_board_z_offset]) {
            cylinder(rbc_laser_board_height, rbc_laser_board_radius, rbc_laser_board_radius, true, $fn=_fn_val);
        }                
    }
    difference() {
        translate([rbc_side_wall_x_offset, rbc_side_wall_left_y_offset, rbc_side_wall_z_offset]) {
            cube([rbc_side_wall_length, rbc_side_wall_width, rbc_side_wall_height], true);
        }
        translate([rbc_side_wall_screw_front_x_offset, rbc_side_wall_screw_left_y_offset, rbc_side_wall_screw_z_offset]) {
            rotate([-90,0,0]) {
                _m3_flathead_screw(rbc_side_wall_screw_height+0.01);
            }
        }
        translate([rbc_side_wall_screw_back_x_offset, rbc_side_wall_screw_left_y_offset, rbc_side_wall_screw_z_offset]) {
            rotate([-90,0,0]) {
                _m3_flathead_screw(rbc_side_wall_screw_height+0.01);
            }
        }        
    }
    difference() {
        translate([rbc_side_wall_x_offset, rbc_side_wall_right_y_offset, rbc_side_wall_z_offset]) {
            cube([rbc_side_wall_length, rbc_side_wall_width, rbc_side_wall_height], true);
        }    
        translate([rbc_side_wall_screw_front_x_offset, rbc_side_wall_screw_right_y_offset, rbc_side_wall_screw_z_offset]) {
            rotate([90,0,0]) {
                _m3_flathead_screw(rbc_side_wall_screw_height+0.01);
            }
        }
        translate([rbc_side_wall_screw_back_x_offset, rbc_side_wall_screw_right_y_offset, rbc_side_wall_screw_z_offset]) {
            rotate([90,0,0]) {
                _m3_flathead_screw(rbc_side_wall_screw_height+0.01);
            }
        }        
    }
    RacecarBackCoverLeft();
    RacecarBackCoverRight();
}

module RacecarBackCoverLeft() {

    difference() {
            
        polyhedron(points=[[rbcl_front_x,rbcl_left_y,rbcl_bottom_z], //0
                           [rbcl_front_x,rbcl_mid_y,rbcl_bottom_z],  //1
                           [rbcl_back_x,rbcl_left_y,rbcl_bottom_z],  //2
                           [rbcl_back_x,rbcl_mid_y,rbcl_bottom_z],   //3
                           [rbcl_front_x,rbcl_right_y,rbcl_mid_z],   //4
                           [rbcl_front_x,rbcl_right_y,rbcl_top_z],   //5
                           [rbcl_back_x,rbcl_right_y,rbcl_mid_z],    //6
                           [rbcl_back_x,rbcl_right_y,rbcl_top_z]],   //7
                    faces=[[0,2,3,1],[2,0,5,7],[1,3,6,4],[5,4,6,7],[3,2,7,6],[0,1,4,5]]);
                    
        RacecarBackCoverLeftImage();


    }   
}

module RacecarBackCoverLeftImage() {

    rbcli_cover_image_slope = (rbcl_top_z-rbcl_bottom_z)/(rbcl_right_y-rbcl_left_y);
    rbcli_cover_image_x_rotation = atan(rbcli_cover_image_slope);
    rbcli_cover_image_y_rotation = 180;
    rbcli_cover_image_z_rotation = 180;
    rbcli_cover_image_extra_y = -22.5;
    rbcli_cover_image_x_offset = 0.5*(rbcl_front_x+rbcl_back_x);
    rbcli_cover_image_y_offset = rbcl_left_y-_wall_thickness/4.0+rbcli_cover_image_extra_y;
    rbcli_cover_image_z_offset = rbcl_bottom_z + rbcli_cover_image_extra_y*rbcli_cover_image_slope;

    translate([rbcli_cover_image_x_offset, rbcli_cover_image_y_offset, rbcli_cover_image_z_offset]) {
        rotate([rbcli_cover_image_x_rotation,rbcli_cover_image_y_rotation, rbcli_cover_image_z_rotation]) {
            scale([1.37,1.37,1.0]) {
                RacecarCoverImage();
            }
        }
    } 
    
}

module RacecarBackCoverRight() {
    
    difference() {
        polyhedron(points=[[rbcr_front_x,rbcr_right_y,rbcr_bottom_z], //0
                       [rbcr_front_x,rbcr_mid_y,rbcr_bottom_z],   //1
                       [rbcr_back_x,rbcr_right_y,rbcr_bottom_z],  //2
                       [rbcr_back_x,rbcr_mid_y,rbcr_bottom_z],    //3
                       [rbcr_front_x,rbcr_left_y,rbcr_mid_z],     //4
                       [rbcr_front_x,rbcr_left_y,rbcr_top_z],     //5
                       [rbcr_back_x,rbcr_left_y,rbcr_mid_z],      //6
                       [rbcr_back_x,rbcr_left_y,rbcr_top_z]],     //7
                faces=[[0,1,3,2],[4,5,7,6],[0,2,7,5],[4,6,3,1],[6,7,2,3],[1,0,5,4]]);
    
        RacecarBackCoverRightImage();
        
    }
    
}

module RacecarBackCoverRightImage() {

    rbcri_cover_image_slope = (rbcr_top_z-rbcr_bottom_z)/(rbcr_left_y-rbcr_right_y);
    rbcri_cover_image_x_rotation = atan(rbcri_cover_image_slope);
    rbcri_cover_image_y_rotation = 0;
    rbcri_cover_image_z_rotation = 0;
    rbcri_cover_image_extra_y = 22.5;
    rbcri_cover_image_x_offset = 0.5*(rbcr_front_x+rbcr_back_x);
    rbcri_cover_image_y_offset = rbcr_right_y+_wall_thickness/4.0+rbcri_cover_image_extra_y;
    rbcri_cover_image_z_offset = rbcr_bottom_z + rbcri_cover_image_extra_y*rbcri_cover_image_slope;

    translate([rbcri_cover_image_x_offset, rbcri_cover_image_y_offset, rbcri_cover_image_z_offset]) {
        rotate([rbcri_cover_image_x_rotation,rbcri_cover_image_y_rotation, rbcri_cover_image_z_rotation]) {
            scale([1.37,1.37,1.0]) {
                RacecarCoverImage();
            }
        }
    }
    
}

