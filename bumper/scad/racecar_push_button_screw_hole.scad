include <../../misc/racecar_global_utils.scad>

rpbsh_length = 4.8;
rpbsh_width = _m2_5_nut_diameter + 2*_wall_thickness;
rpbsh_height = 6.4;
rpbsh_x_offset = 0.0;
rpbsh_y_offset = 0.0;
rpbsh_z_offset = 0.0;

rpbsh_extend_length = _m2_5_nut_height+_wall_thickness;
rpbsh_extend_width = rpbsh_width;
rpbsh_extend_height = _m2_5_nut_diameter + _wall_thickness;
rpbsh_extend_x_offset = rpbsh_x_offset + rpbsh_length/2.0 + rpbsh_extend_length/2.0;
rpbsh_extend_y_offset = rpbsh_y_offset;
rpbsh_extend_z_offset = rpbsh_z_offset - rpbsh_height/2.0 + rpbsh_extend_height/2.0;

if ($include_rpbsh==undef) {
    RacecarPushButtonScrewHole();
}

module RacecarPushButtonScrewHole() {
    
    rpbsh_nut_diameter = _m2_5_nut_diameter;
    rpbsh_nut_height = _m2_5_nut_height;
    rpbsh_nut_x_offset = rpbsh_extend_x_offset+rpbsh_extend_length/2.0 - rpbsh_nut_height/2.0;
    rpbsh_nut_y_offset = rpbsh_extend_y_offset;
    rpbsh_nut_z_offset = rpbsh_extend_z_offset;    
    
    rpbsh_screw_height = rpbsh_length+rpbsh_extend_length;
    rpbsh_screw_radius = _m2_5_screw_shaft_radius;
    rpbsh_screw_x_offset = rpbsh_x_offset-rpbsh_length/2.0+rpbsh_screw_height/2.0;
    rpbsh_screw_y_offset = rpbsh_nut_y_offset;
    rpbsh_screw_z_offset = rpbsh_nut_z_offset;
    
    difference() {
        union() {
            translate([rpbsh_x_offset, rpbsh_y_offset, rpbsh_x_offset]) {
                rotate([0,180,0]) {
                    RPBSHTriangle(rpbsh_length, rpbsh_width, rpbsh_height);
                }
            }            
            translate([rpbsh_extend_x_offset, rpbsh_extend_y_offset, rpbsh_extend_z_offset]) {
                cube([rpbsh_extend_length, rpbsh_extend_width, rpbsh_extend_height], true);
            }
        }

        translate([rpbsh_nut_x_offset+0.001, rpbsh_nut_y_offset, rpbsh_nut_z_offset]) {
            rotate([0,90,0]) {
                rotate([0,0,30]) {
                    _hexagon(rpbsh_nut_height, rpbsh_nut_diameter);
                }
            }
        }
        translate([rpbsh_screw_x_offset, rpbsh_screw_y_offset, rpbsh_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rpbsh_screw_height, rpbsh_screw_radius, rpbsh_screw_radius, true, $fn=_fn_val);
            }
        }
    }
    
}

module RPBSHTriangle(l, w, h) {

    translate([-l/2,-w/2,-h/2]) {
        _triangle(l,w,h);
    }
       
}