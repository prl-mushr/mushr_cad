include <../../misc/racecar_global_utils.scad>

rfs_screw_from_edge = 5.5;

if ($include_rfs==undef) {
    RacecarFoundationSupport();
}

module RacecarFoundationSupport(rfs_screw_height=10, rfs_length=20, rfs_width=10, rfs_height=20) {
    
    rfs_screw_front_x_offset = rfs_length/2.0-rfs_screw_from_edge;
    rfs_screw_back_x_offset = -rfs_length/2.0+rfs_screw_from_edge;
    rfs_screw_y_offset = 0.0;
    rfs_screw_z_offset = rfs_height/2.0 - rfs_screw_height/2.0;
    
    rfs_access_length = rfs_length/2.0 - rfs_screw_front_x_offset;
    rfs_access_width = _m2_5_nut_diameter;
    rfs_access_height = _m2_5_nut_height;
    rfs_access_front_x_offset = rfs_length/2.0 - rfs_access_length/2.0;
    rfs_access_back_x_offset = -rfs_length/2.0 + rfs_access_length/2.0;
    rfs_access_y_offset = rfs_screw_y_offset;
    rfs_access_z_offset = rfs_screw_z_offset + rfs_screw_height/2.0 - _wall_thickness - _m2_5_nut_height/2.0;
    
    difference() {
        translate([0.0,0.0,0.0]) {
            cube([rfs_length, rfs_width, rfs_height], true);
        }
        translate([rfs_screw_front_x_offset, rfs_screw_y_offset, rfs_screw_z_offset+0.01]) {
            rotate([180,0,0]) {
                _m2_5_nut_insert(rfs_screw_height);
            }
        } 
        translate([rfs_screw_back_x_offset, rfs_screw_y_offset, rfs_screw_z_offset+0.01]) {
            rotate([180,0,0]) {
                _m2_5_nut_insert(rfs_screw_height);
            }
        }
        translate([rfs_access_front_x_offset, rfs_access_y_offset, rfs_access_z_offset]) {
            cube([rfs_access_length, rfs_access_width, rfs_access_height], true);
        }
        translate([rfs_access_back_x_offset, rfs_access_y_offset, rfs_access_z_offset]) {
            cube([rfs_access_length, rfs_access_width, rfs_access_height], true);
        }        
    }
    
}