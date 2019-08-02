include <../../misc/racecar_global_utils.scad>

rfb_length = 25;
rfb_width = 0.5*(185.0+130.0);
rfb_height = _wall_thickness;
rfb_x_offset = 0.0;
rfb_y_offset = 0.0;
rfb_z_offset = 0.0;

rfb_screw_height = rfb_height;
rfb_screw_radius = _m3_screw_head_radius;
rfb_screw_front_x_offset = rfb_x_offset + rfb_length/2.0-2*_wall_thickness;
rfb_screw_back_x_offset = rfb_x_offset - rfb_length/2.0+2*_wall_thickness;
rfb_screw_left_y_offset = rfb_y_offset + rfb_width/2.0 - _wall_thickness - rfb_screw_radius;
rfb_screw_right_y_offset = rfb_y_offset - rfb_width/2.0 + _wall_thickness + rfb_screw_radius;
rfb_screw_z_offset = rfb_z_offset + rfb_height/2.0 - rfb_screw_height/2.0;

if ($include_rfb==undef) {
    RacecarFoundationBar();
}

module RacecarFoundationBar(draw_screws=true) {

    difference() {
        translate([rfb_x_offset, rfb_y_offset, rfb_z_offset]) {
            cube([rfb_length, rfb_width, rfb_height], true);
        }
        if(draw_screws) {
            translate([rfb_screw_front_x_offset, rfb_screw_left_y_offset, rfb_screw_z_offset]) {
                _m3_flathead_screw(rfb_screw_height);
            }
            translate([rfb_screw_front_x_offset, rfb_screw_right_y_offset, rfb_screw_z_offset]) {
                _m3_flathead_screw(rfb_screw_height);
            }       
            translate([rfb_screw_back_x_offset, rfb_screw_left_y_offset, rfb_screw_z_offset]) {
                _m3_flathead_screw(rfb_screw_height);
            }
            translate([rfb_screw_back_x_offset, rfb_screw_right_y_offset, rfb_screw_z_offset]) {
                _m3_flathead_screw(rfb_screw_height);
            }               
        }
    }
    
}