include <../../misc/racecar_global_utils.scad>

rfs_screw_from_edge = 5.5;

if ($include_rfs==undef) {
    RacecarFoundationSupport();
}

module RacecarFoundationSupport(rfs_length=20, rfs_width=10, rfs_height=20) {
    
    rfs_screw_height = _m3_insert_depth;
    rfs_screw_radius = _m3_insert_radius;
    rfs_screw_front_x_offset = rfs_length/2.0-rfs_screw_from_edge;
    rfs_screw_back_x_offset = -rfs_length/2.0+rfs_screw_from_edge;
    rfs_screw_y_offset = 0.0;
    rfs_screw_z_offset = rfs_height/2.0 - rfs_screw_height/2.0;
    
    difference() {
        translate([0.0,0.0,0.0]) {
            cube([rfs_length, rfs_width, rfs_height], true);
        }
        translate([rfs_screw_front_x_offset, rfs_screw_y_offset, rfs_screw_z_offset+0.01]) {
            rotate([180,0,0]) {
                cylinder(rfs_screw_height, rfs_screw_radius, rfs_screw_radius, true, $fn=_fn_val);
            }
        } 
        translate([rfs_screw_back_x_offset, rfs_screw_y_offset, rfs_screw_z_offset+0.01]) {
            rotate([180,0,0]) {
                cylinder(rfs_screw_height, rfs_screw_radius, rfs_screw_radius, true, $fn=_fn_val);
            }
        }       
    }
    
}