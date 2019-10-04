include <../../misc/racecar_global_utils.scad>

rbb_base_length = 5.0;
rbb_base_width = 220;
rbb_base_height = 100;
rbb_base_x_offset = rbb_base_length/2.0;
rbb_base_y_offset = 0.0;
rbb_base_z_offset = 0.0;

rbb_support_radius = 3.75/2.0;
rbb_support_height = 4.6;
rbb_support_x_offset = rbb_base_x_offset - rbb_base_length/2.0 - rbb_support_height/2.0;
rbb_support_left_y_offset = rbb_base_y_offset+8.6/2.0;
rbb_support_right_y_offset = rbb_base_y_offset - 8.6/2.0;
rbb_support_z_offset = rbb_base_z_offset;

rbb_screw_radius = 1.75/2.0;
rbb_screw_height = rbb_support_height;
rbb_screw_x_offset = rbb_support_x_offset;
rbb_screw_left_y_offset = rbb_support_left_y_offset;
rbb_screw_right_y_offset = rbb_support_right_y_offset;
rbb_screw_z_offset = rbb_support_z_offset;

rbb_top_cut_length = rbb_base_length;
rbb_top_cut_width = rbb_base_width;
rbb_top_cut_height = rbb_base_height/2.0 - rbb_support_radius - _wall_thickness;
rbb_top_cut_x_offset = rbb_base_x_offset;
rbb_top_cut_y_offset = rbb_base_y_offset;
rbb_top_cut_z_offset = rbb_base_z_offset + rbb_base_height/2.0 - rbb_top_cut_height/2.0;

if ($include_rbb==undef) {
    
    RacecarBumperButton();

}

module RacecarBumperButton() {
    
    difference() {
        translate([rbb_base_x_offset, rbb_base_y_offset, rbb_base_z_offset]) {
            cube([rbb_base_length, rbb_base_width, rbb_base_height], true);
        }
        translate([rbb_top_cut_x_offset, rbb_top_cut_y_offset, rbb_top_cut_z_offset]) {
            cube([rbb_top_cut_length, rbb_top_cut_width, rbb_top_cut_height], true);
        }
    }
    
    difference() {
        translate([rbb_support_x_offset, rbb_support_left_y_offset, rbb_support_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rbb_support_height, rbb_support_radius, rbb_support_radius, true, $fn=_fn_val);
            }
        }
        translate([rbb_screw_x_offset, rbb_screw_left_y_offset, rbb_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rbb_screw_height, rbb_screw_radius, rbb_screw_radius, true, $fn=_fn_val);
            }
        }
    }

    difference() {
        translate([rbb_support_x_offset, rbb_support_right_y_offset, rbb_support_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rbb_support_height, rbb_support_radius, rbb_support_radius, true, $fn=_fn_val);
            }
        }
        translate([rbb_screw_x_offset, rbb_screw_right_y_offset, rbb_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rbb_screw_height, rbb_screw_radius, rbb_screw_radius, true, $fn=_fn_val);
            }
        }
    }
    
}