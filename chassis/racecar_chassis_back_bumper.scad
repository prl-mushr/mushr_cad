$include_rcg = true;

include <racecar_chassis_gearbox.scad>

rcbb_gearbox_attach_length = 10.21;
rcbb_gearbox_attach_width = 6.00;
rcbb_gearbox_attach_height = 6.0;
rcbb_gearbox_attach_x_offset = rcg_base_x_offset - rcg_base_length/2.0 - rcbb_gearbox_attach_length/2.0;
rcbb_gearbox_attach_left_y_offset = rcg_base_y_offset + rcg_base_width/2.0 - rcbb_gearbox_attach_width/2.0;
rcbb_gearbox_attach_right_y_offset = rcg_base_y_offset - rcg_base_width/2.0 + rcbb_gearbox_attach_width/2.0;
rcbb_gearbox_attach_z_offset = rcg_base_z_offset + rcg_base_height/2.0 - rcbb_gearbox_attach_height/2.0;

rcbb_extend_attach_length = 10.16;
rcbb_extend_attach_back_width = rcbb_gearbox_attach_width+(rcbb_gearbox_attach_left_y_offset-rcbb_gearbox_attach_right_y_offset)-2.0;
rcbb_extend_attach_front_width = 20.0;
rcbb_extend_attach_height = 6.0;
rcbb_extend_attach_x_offset = rcbb_gearbox_attach_x_offset - rcbb_gearbox_attach_length/2.0 + rcbb_extend_attach_height/2.0;
rcbb_extend_attach_y_offset = (rcbb_gearbox_attach_left_y_offset+rcbb_gearbox_attach_right_y_offset)/2.0;
rcbb_extend_attach_z_offset = rcbb_gearbox_attach_z_offset + rcbb_gearbox_attach_height/2.0 + rcbb_extend_attach_length/2.0;

rcbb_bumper_attach_cylinder_height = 9.23;
rcbb_bumper_attach_cylinder_radius = rcbb_extend_attach_height/2.0;
rcbb_bumper_attach_trap_length = 50.0;
rcbb_bumper_attach_trap_front_width = 40.0;
rcbb_bumper_attach_trap_back_width = 78.0;
rcbb_bumper_attach_trap_height = 5.0;
rcbb_bumper_attach_pitch = -20.0;
rcbb_bumper_attach_x_offset = rcbb_extend_attach_x_offset-1.5;
rcbb_bumper_attach_y_offset = rcbb_extend_attach_y_offset;
rcbb_bumper_attach_z_offset = rcbb_extend_attach_z_offset+rcbb_extend_attach_length/2.0+ rcbb_bumper_attach_cylinder_radius/2.0+1;

rcbb_back_bar_base = 8.8;
rcbb_back_bar_height = 5.0;
rcbb_back_bar_length = 268;
rcbb_back_bar_x_offset = rcbb_bumper_attach_x_offset - rcbb_extend_attach_length/2.0-  rcbb_bumper_attach_trap_length*cos(abs(rcbb_bumper_attach_pitch))+3;
rcbb_back_bar_y_offset = rcbb_bumper_attach_y_offset;
rcbb_back_bar_z_offset = rcbb_bumper_attach_z_offset + rcbb_bumper_attach_cylinder_height/2.0 -  rcbb_bumper_attach_trap_length*sin(abs(rcbb_bumper_attach_pitch))+3; 

rcbb_bar_support_height = rcbb_extend_attach_x_offset - rcbb_back_bar_x_offset;
rcbb_bar_support_radius = rcbb_bumper_attach_cylinder_radius;
rcbb_bar_support_x_offset = 0.5*(rcbb_extend_attach_x_offset + rcbb_back_bar_x_offset)+2;
rcbb_bar_support_left_y_offset = rcbb_back_bar_y_offset + 10.0;
rcbb_bar_support_right_y_offset = rcbb_back_bar_y_offset - 10.0;
rcbb_bar_support_z_offset = rcbb_back_bar_z_offset;

rcbb_top_length = 25.0;
rcbb_top_front_width = 100.0;
rcbb_top_back_width = 221.0;
rcbb_top_height = rcbb_back_bar_height;
rcbb_top_x_offset = rcbb_back_bar_x_offset;
rcbb_top_y_offset = rcbb_back_bar_y_offset;
rcbb_top_z_offset = rcbb_back_bar_z_offset + rcbb_top_length/2.0+1.0;

rcbb_flap_length = 1.5;
rcbb_flap_width = 40.0;
rcbb_flap_height = 50.5;
rcbb_flap_radius = 3.3;
rcbb_flap_x_offset =  rcbb_back_bar_x_offset + rcbb_back_bar_height/2.0 + rcbb_flap_length/2.0;
rcbb_flap_left_y_offset = rcbb_back_bar_y_offset+rcbb_back_bar_length/2.0-rcbb_flap_width/2.0;
rcbb_flap_right_y_offset = rcbb_back_bar_y_offset-rcbb_back_bar_length/2.0+rcbb_flap_width/2.0;
rcbb_flap_z_offset = rcbb_back_bar_z_offset + rcbb_back_bar_base/2.0 - rcbb_flap_height/2.0;

if ($include_rcbb==undef) {
    RacecarChassisBackBumper();
}

module RacecarChassisBackBumper() {
    translate([rcbb_gearbox_attach_x_offset, rcbb_gearbox_attach_left_y_offset, rcbb_gearbox_attach_z_offset]) {
        cube([rcbb_gearbox_attach_length, rcbb_gearbox_attach_width, rcbb_gearbox_attach_height], true);
    }
    
    translate([rcbb_gearbox_attach_x_offset, rcbb_gearbox_attach_right_y_offset, rcbb_gearbox_attach_z_offset]) {
        cube([rcbb_gearbox_attach_length, rcbb_gearbox_attach_width, rcbb_gearbox_attach_height], true);
    }    
    
    translate([rcbb_extend_attach_x_offset, rcbb_extend_attach_y_offset, rcbb_extend_attach_z_offset]) {
        rotate([0,-90,0]) {
            _rounded_trapezoid(rcbb_extend_attach_front_width,rcbb_extend_attach_back_width, rcbb_extend_attach_length, rcbb_extend_attach_height);
        }
    }
   
    translate([rcbb_bumper_attach_x_offset, rcbb_bumper_attach_y_offset, rcbb_bumper_attach_z_offset]) {
        rotate([0,rcbb_bumper_attach_pitch, 0]) {
            translate([0.0,rcbb_extend_attach_front_width/2.0-rcbb_bumper_attach_cylinder_radius-2.45,0.0]) {
                cylinder(rcbb_bumper_attach_cylinder_height, rcbb_bumper_attach_cylinder_radius, rcbb_bumper_attach_cylinder_radius, true, $fn=_fn_val);
            }
            translate([0.0,-rcbb_extend_attach_front_width/2.0+rcbb_bumper_attach_cylinder_radius+2.45,0.0]) {
                cylinder(rcbb_bumper_attach_cylinder_height, rcbb_bumper_attach_cylinder_radius, rcbb_bumper_attach_cylinder_radius, true, $fn=_fn_val);
            }
            translate([-rcbb_bumper_attach_trap_length/2.0+rcbb_bumper_attach_cylinder_radius-1.0, 0.0, rcbb_bumper_attach_cylinder_height/2.0+rcbb_bumper_attach_trap_height/2.0]) {
                difference() {
                    _rounded_trapezoid(rcbb_bumper_attach_trap_front_width, rcbb_bumper_attach_trap_back_width, rcbb_bumper_attach_trap_length, rcbb_bumper_attach_trap_height, true, $fn=_fn_val);
                    _rounded_trapezoid(rcbb_bumper_attach_trap_front_width-10, rcbb_bumper_attach_trap_back_width-10, rcbb_bumper_attach_trap_length-12, rcbb_bumper_attach_trap_height, true, $fn=_fn_val);
                }
            }
        }
    }
    
    translate([rcbb_back_bar_x_offset, rcbb_back_bar_y_offset, rcbb_back_bar_z_offset]) {
        rotate([0,-90,0]) {
            _bh_triangle(rcbb_back_bar_base, rcbb_back_bar_height, rcbb_back_bar_length);
        }
    }
  
    translate([rcbb_bar_support_x_offset, rcbb_bar_support_left_y_offset, rcbb_bar_support_z_offset]) {
        rotate([0,90,0]) {
            cylinder(rcbb_bar_support_height, rcbb_bar_support_radius, rcbb_bar_support_radius, true, $fn=_fn_val);
        }
    }
    
    translate([rcbb_bar_support_x_offset, rcbb_bar_support_right_y_offset, rcbb_bar_support_z_offset]) {
        rotate([0,90,0]) {
            cylinder(rcbb_bar_support_height, rcbb_bar_support_radius, rcbb_bar_support_radius, true, $fn=_fn_val);
        }
    }   
   
    translate([rcbb_top_x_offset, rcbb_top_y_offset, rcbb_top_z_offset]) {
        rotate([0,-90,0]) {
            difference(){
                _rounded_trapezoid(rcbb_top_front_width, rcbb_top_back_width, rcbb_top_length, rcbb_top_height);
                translate([-(rcbb_top_length+2)/2.0+(rcbb_top_length-1.5)/2.0,0,0]) {
                    cube([rcbb_top_length-1.5,rcbb_top_front_width-10.0,rcbb_top_height], true);
                }
                translate([-(rcbb_top_length+2)/2.0,rcbb_top_front_width/2.0,rcbb_top_height/2.0]) {
                    rotate([-90,0,0]){
                        _trap_triangle(rcbb_top_height+0.01,rcbb_top_length-1.5,(rcbb_top_back_width-rcbb_top_front_width)/2.0);
                    }                   
                }
                translate([-(rcbb_top_length+2)/2.0,-rcbb_top_front_width/2.0,-rcbb_top_height/2.0-0.001]) {
                    rotate([90,0,0]){
                        _trap_triangle(rcbb_top_height+0.01,rcbb_top_length-1.5,(rcbb_top_back_width-rcbb_top_front_width)/2.0);
                    }                   
                }                
            }      
        }
    }
 
    translate([rcbb_flap_x_offset, rcbb_flap_left_y_offset, rcbb_flap_z_offset]) {
        hull() {
            cube([rcbb_flap_length, rcbb_flap_width-2*rcbb_flap_radius,rcbb_flap_height-2*rcbb_flap_radius], true);
            translate([0.0,(rcbb_flap_width-2*rcbb_flap_radius)/2.0,(rcbb_flap_height-2*rcbb_flap_radius)/2.0]) {
                rotate([0,90,0]) {
                    cylinder(rcbb_flap_length, rcbb_flap_radius, rcbb_flap_radius, true, $fn=_fn_val);
                }
            }
            translate([0.0,-(rcbb_flap_width-2*rcbb_flap_radius)/2.0,(rcbb_flap_height-2*rcbb_flap_radius)/2.0]) {
                rotate([0,90,0]) {
                    cylinder(rcbb_flap_length, rcbb_flap_radius, rcbb_flap_radius, true, $fn=_fn_val);
                }
            }
            translate([0.0,(rcbb_flap_width-2*rcbb_flap_radius)/2.0,-(rcbb_flap_height-2*rcbb_flap_radius)/2.0]) {
                rotate([0,90,0]) {
                    cylinder(rcbb_flap_length, rcbb_flap_radius, rcbb_flap_radius, true, $fn=_fn_val);
                }
            }
            translate([0.0,-(rcbb_flap_width-2*rcbb_flap_radius)/2.0,-(rcbb_flap_height-2*rcbb_flap_radius)/2.0]) {
                rotate([0,90,0]) {
                    cylinder(rcbb_flap_length, rcbb_flap_radius, rcbb_flap_radius, true, $fn=_fn_val);
                }
            }            
        }
    }
    
    translate([rcbb_flap_x_offset, rcbb_flap_right_y_offset, rcbb_flap_z_offset]) {
        hull() {
            cube([rcbb_flap_length, rcbb_flap_width-2*rcbb_flap_radius,rcbb_flap_height-2*rcbb_flap_radius], true);
            translate([0.0,(rcbb_flap_width-2*rcbb_flap_radius)/2.0,(rcbb_flap_height-2*rcbb_flap_radius)/2.0]) {
                rotate([0,90,0]) {
                    cylinder(rcbb_flap_length, rcbb_flap_radius, rcbb_flap_radius, true, $fn=_fn_val);
                }
            }
            translate([0.0,-(rcbb_flap_width-2*rcbb_flap_radius)/2.0,(rcbb_flap_height-2*rcbb_flap_radius)/2.0]) {
                rotate([0,90,0]) {
                    cylinder(rcbb_flap_length, rcbb_flap_radius, rcbb_flap_radius, true, $fn=_fn_val);
                }
            }
            translate([0.0,(rcbb_flap_width-2*rcbb_flap_radius)/2.0,-(rcbb_flap_height-2*rcbb_flap_radius)/2.0]) {
                rotate([0,90,0]) {
                    cylinder(rcbb_flap_length, rcbb_flap_radius, rcbb_flap_radius, true, $fn=_fn_val);
                }
            }
            translate([0.0,-(rcbb_flap_width-2*rcbb_flap_radius)/2.0,-(rcbb_flap_height-2*rcbb_flap_radius)/2.0]) {
                rotate([0,90,0]) {
                    cylinder(rcbb_flap_length, rcbb_flap_radius, rcbb_flap_radius, true, $fn=_fn_val);
                }
            }            
        }
    }    
    
}