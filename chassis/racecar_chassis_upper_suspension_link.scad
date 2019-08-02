include <../misc/racecar_global_utils.scad>

if ($include_rcusl==undef) {
    RacecarChassisUpperSuspensionLink();
}

rcuslh_length = 20.82;
rcuslh_width  = 26.8;
rcuslh_height = 7.0;

module RacecarChassisUpperSuspensionLink(rcusl_width = 71.33) {
    
    rcusl_body_cylinder_height = rcusl_width - 2*rcuslh_width;
    rcusl_body_cylinder_radius = 4.0/2.0;
    rcusl_body_hex_height = 6.0;
    rcusl_body_hex_diameter = 4.5;
    rcusl_body_x_offset = 0.0;
    rcusl_body_y_offset = 0.0;
    rcusl_body_z_offset = 0.0;
    
    translate([rcusl_body_x_offset, rcusl_body_y_offset, rcusl_body_z_offset]) {
        rotate([90,0,0]) {
            cylinder(rcusl_body_cylinder_height, rcusl_body_cylinder_radius, rcusl_body_cylinder_radius, true, $fn=_fn_val);
            _hexagon(rcusl_body_hex_height, rcusl_body_hex_diameter);
        }
    }
    
    translate([0.0,rcusl_width/2.0-rcuslh_width/2.0,0.0]) {
        RacecarChassisUpperSuspensionLinkHead();
    }

    translate([0.0,-rcusl_width/2.0+rcuslh_width/2.0,0.0]) {
        rotate([0,0,180]) {
            RacecarChassisUpperSuspensionLinkHead();
        }
    }
    
}

module RacecarChassisUpperSuspensionLinkHead() {
    rcuslh_base_length = 9.8;
    rcuslh_base_back_width = 11.0;
    rcuslh_base_front_width = 8.75;
    rcuslh_base_height = rcuslh_height;
    rcuslh_base_x_offset = 0.0;
    rcuslh_base_y_offset = rcuslh_base_length/2.0 - rcuslh_width/2.0;
    rcuslh_base_z_offset = 0.0;
    
    rcuslh_body_trap_length = 4.0;
    rcuslh_body_trap_back_width = rcuslh_length;
    rcuslh_body_trap_front_width = rcuslh_base_back_width;
    rcuslh_body_trap_height = rcuslh_base_height;
    rcuslh_body_trap_x_offset = rcuslh_base_x_offset;
    rcuslh_body_trap_y_offset = rcuslh_base_y_offset + rcuslh_base_length/2.0 + rcuslh_body_trap_length/2.0;
    rcuslh_body_trap_z_offset = rcuslh_base_z_offset;
    
    rcuslh_end_radius = rcuslh_height/2.0;
    rcuslh_end_height = rcuslh_length;
    rcuslh_end_x_offset = rcuslh_body_trap_z_offset;
    rcuslh_end_y_offset = rcuslh_width/2.0 - rcuslh_end_radius;
    rcuslh_end_z_offset = rcuslh_body_trap_z_offset;
    
    rcuslh_body_cube_length = rcuslh_length;
    rcuslh_body_cube_width = rcuslh_width - rcuslh_base_length - rcuslh_body_trap_length - rcuslh_end_radius;
    rcuslh_body_cube_height = rcuslh_body_trap_height;
    rcuslh_body_cube_x_offset = rcuslh_end_x_offset;
    rcuslh_body_cube_y_offset = rcuslh_body_trap_y_offset + rcuslh_body_trap_length/2.0 + rcuslh_body_cube_width/2.0;
    rcuslh_body_cube_z_offset = rcuslh_body_trap_z_offset;
    
    translate([rcuslh_base_x_offset, rcuslh_base_y_offset, rcuslh_base_z_offset]) {
        rotate([0,0,-90]) {
            _trapezoid(rcuslh_base_front_width, rcuslh_base_back_width, rcuslh_base_length, rcuslh_base_height);
        }
    }

    translate([rcuslh_body_trap_x_offset, rcuslh_body_trap_y_offset, rcuslh_body_trap_z_offset]) {
        rotate([0,0,-90]) {
            _trapezoid(rcuslh_body_trap_front_width, rcuslh_body_trap_back_width, rcuslh_body_trap_length, rcuslh_body_trap_height);
        }
    }    
    
    translate([rcuslh_end_x_offset, rcuslh_end_y_offset, rcuslh_end_z_offset]) {
        rotate([0,90,0]) {
            cylinder(rcuslh_end_height, rcuslh_end_radius, rcuslh_end_radius, true, $fn=_fn_val);
        }
    }
    
    translate([rcuslh_body_cube_x_offset, rcuslh_body_cube_y_offset, rcuslh_body_cube_z_offset]) {
        cube([rcuslh_body_cube_length, rcuslh_body_cube_width, rcuslh_body_cube_height], true);
    }
    
}