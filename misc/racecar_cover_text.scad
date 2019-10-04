include <racecar_global_utils.scad>

racecar_cover_text= "MuSHR.io";
racecar_cover_text_font = "Arial:style=Bold Italic";
racecar_cover_text_size = 10;
racecar_cover_text_height = _wall_thickness / 2.0;
racecar_cover_text_x_offset = 0.0;
racecar_cover_text_y_offset = 0.0;
racecar_cover_text_z_offset = 0.0;

if ($include_rct==undef) {
                
    difference() {
        RacecarCoverText();
        minkowski() {
            difference() {
                translate([0,0,0.0]) {
                    cube([110,110,racecar_cover_text_height], true);
                }
                RacecarCoverText();
            }                   
            translate([0,0,0.0]) {
                cube([0.5,0.5,racecar_cover_text_height], true);
            }                        
        }
    } 

    //RacecarCoverText();
    
}

module RacecarCoverText() {
    translate([racecar_cover_text_x_offset, racecar_cover_text_y_offset, racecar_cover_text_z_offset]) {
            linear_extrude(height=racecar_cover_text_height, center=true) {
                text(text=racecar_cover_text, size=racecar_cover_text_size, font = racecar_cover_text_font, valign="center", halign="center");
            }
    }
}