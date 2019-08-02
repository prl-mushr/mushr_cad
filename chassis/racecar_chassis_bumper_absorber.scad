$include_rcg = true;

include <racecar_chassis_gearbox.scad>

rcba_length = 43.15;
rcba_width = 59.15;
rcba_height = 6.0;

if ($include_rcba==undef) {
    RacecarChassisBumperAbsorber();
}

module RacecarChassisBumperAbsorber() {
    rcba_box_attach_length = 18.15;
    rcba_box_attach_width = 7.5;
    rcba_box_attach_height = rcba_height;
    rcba_box_attach_x_offset = rcba_box_attach_length/2.0 - rcba_length/2.0;
    rcba_box_attach_left_y_offset = (rcg_column_left_y_offset - rcg_column_right_y_offset)/2.0;
    rcba_box_attach_right_y_offset = -(rcg_column_left_y_offset - rcg_column_right_y_offset)/2.0;
    rcba_box_attach_z_offset = 0.0;
    
    rcba_base_length = 17.6;
    rcba_base_width = rcba_width;
    rcba_base_height = rcba_height;
    rcba_base_x_offset = rcba_box_attach_x_offset+rcba_box_attach_length/2.0+rcba_base_length/2.0;
    rcba_base_y_offset = 0.0;
    rcba_base_z_offset = rcba_box_attach_z_offset;
    
    rcba_bumper_attach_radius = rcba_height/2.0;
    rcba_bumper_attach_height = rcba_length - rcba_box_attach_length - rcba_base_length;
    rcba_bumper_attach_x_offset = rcba_base_x_offset + rcba_base_length/2.0 + rcba_bumper_attach_height/2.0;
    rcba_bumper_attach_left_y_offset = 30.0/2;
    rcba_bumper_attach_right_y_offset = -30.0/2.0;
    rcba_bumper_attach_z_offset = rcba_base_z_offset;
    
    translate([rcba_box_attach_x_offset, rcba_box_attach_left_y_offset, rcba_box_attach_z_offset]) {
        cube([rcba_box_attach_length, rcba_box_attach_width, rcba_box_attach_height], true);
    }
    
    translate([rcba_box_attach_x_offset, rcba_box_attach_right_y_offset, rcba_box_attach_z_offset]) {
        cube([rcba_box_attach_length, rcba_box_attach_width, rcba_box_attach_height], true);
    }  
  
    translate([rcba_base_x_offset,rcba_base_y_offset,rcba_base_z_offset]) {
        rotate([0,0,90]) {
            difference() {
                _rounded_square(rcba_base_width, rcba_base_length, rcba_base_height);
                scale([0.93,0.8,1.0]) {
                    _rounded_square(rcba_base_width, rcba_base_length, rcba_base_height);
                }
            }

        }
    }
    
    translate([rcba_bumper_attach_x_offset,rcba_bumper_attach_left_y_offset,rcba_bumper_attach_z_offset]) {
        rotate([0,90,0]) {
            cylinder(rcba_bumper_attach_height, rcba_bumper_attach_radius, rcba_bumper_attach_radius, true, $fn=_fn_val);
        }
    }
    
    translate([rcba_bumper_attach_x_offset,rcba_bumper_attach_right_y_offset,rcba_bumper_attach_z_offset]) {
        rotate([0,90,0]) {
            cylinder(rcba_bumper_attach_height, rcba_bumper_attach_radius, rcba_bumper_attach_radius, true, $fn=_fn_val);
        }
    }    
    
}

