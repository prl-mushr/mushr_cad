include <../../misc/racecar_global_utils.scad>

rcus_length = 9.4;
rcus_width = 25.0;
rcus_height = 20;

rcus_knub_x_from_top = 4.5;

rcus_screw_x_from_top = 6.67;
rcus_screw_y_separation = 16;
rcus_screw_radius = 4.0/2.0;
rcus_screw_x_offset = rcus_length/2.0 - rcus_screw_x_from_top;
rcus_screw_left_y_offset = rcus_screw_y_separation/2.0;
rcus_screw_right_y_offset = -rcus_screw_y_separation/2.0;  
rcus_screw_z_offset = 0.0;

if ($include_rcus==undef) {
    RacecarCrossbarUpperSupport();
}

module RacecarCrossbarUpperSupport(height=rcus_height, draw_knub=true) {

    rcus_head_length = 4.75;
    rcus_head_width = rcus_width/2.0;
    rcus_head_height = height;   
    rcus_head_x_offset = -rcus_head_length/2.0+rcus_length/2.0;
    rcus_head_y_offset = 0.0;
    rcus_head_z_offset = 0.0; 
    
    rcus_base_length = rcus_length-rcus_head_length;
    rcus_base_width = rcus_width;
    rcus_base_height = height;
    rcus_base_x_offset = rcus_base_length/2.0-rcus_length/2.0;
    rcus_base_y_offset = 0.0;
    rcus_base_z_offset = 0.0;
    
    rcus_knub_height = 3.0;
    rcus_knub_radius = 1.5;
    rcus_knub_x_offset = rcus_length/2.0-rcus_knub_x_from_top;
    rcus_knub_y_offset = 0.0;
    rcus_knub_z_offset = rcus_knub_height/2.0+height/2.0;
    
    rcus_knub_hole_height = 3.5;
    rcus_knub_hole_radius = 1.75;
    rcus_knub_hole_x_offset = rcus_knub_x_offset;
    rcus_knub_hole_y_offset = 0.0;
    rcus_knub_hole_z_offset = rcus_knub_hole_height/2.0-height/2.0;
    
    rcus_screw_height = height;      
    
    difference() {
        union() {
            translate([rcus_head_x_offset-rcus_head_length/2.0, rcus_head_y_offset, rcus_head_z_offset-rcus_head_height/2.0]) {
                rotate([90,0,0]) {
                    _triangle(rcus_head_length, rcus_head_height, rcus_head_width);
                }
            }       
            translate([rcus_head_x_offset-rcus_head_length/2.0, rcus_head_y_offset, rcus_head_z_offset+rcus_head_height/2.0]) {
                rotate([-90,0,0]) {
                    _triangle(rcus_head_length, rcus_head_height, rcus_head_width);
                }
            }            
            translate([rcus_base_x_offset, rcus_base_y_offset, rcus_base_z_offset]) {
                cube([rcus_base_length, rcus_base_width, rcus_base_height], true);
            }    

            if(draw_knub) {
                translate([rcus_knub_x_offset, rcus_knub_y_offset, rcus_knub_z_offset]) {
                    cylinder(rcus_knub_height, rcus_knub_radius, rcus_knub_radius, true, $fn=_fn_val);
                }    
            }
                        
        }
        
        union() {
            translate([rcus_knub_hole_x_offset, rcus_knub_hole_y_offset, rcus_knub_hole_z_offset]) {
                cylinder(rcus_knub_hole_height, rcus_knub_hole_radius, rcus_knub_hole_radius, true, $fn=_fn_val);
            }
            translate([rcus_screw_x_offset, rcus_screw_left_y_offset, rcus_screw_z_offset]) {
                cylinder(rcus_screw_height, rcus_screw_radius, rcus_screw_radius, true, $fn=_fn_val);
            }
            
            translate([rcus_screw_x_offset, rcus_screw_right_y_offset, rcus_screw_z_offset]) {
                cylinder(rcus_screw_height, rcus_screw_radius, rcus_screw_radius, true, $fn=_fn_val);
            }            
        }
    }
}