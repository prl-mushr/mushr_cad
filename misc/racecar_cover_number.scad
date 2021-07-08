include <racecar_global_utils.scad>

racecar_cover_number_text = "1";
racecar_cover_number_font = "Arial:style=Bold Italic";
racecar_cover_number_size = 25.0;
racecar_cover_number_height = _wall_thickness / 2.0;
racecar_cover_number_x_offset = 0.0;
racecar_cover_number_y_offset = 15.0;
racecar_cover_number_z_offset = 0.0;

if ($include_rcn==undef) {
                
    difference() {
        RacecarCoverNumber(false);
        minkowski() {
            difference() {
                translate([0,0,0.0]) {
                    cube([110,110,racecar_cover_number_height], true);
                }
                RacecarCoverNumber(false);
            }                   
            translate([0,0,0.0]) {
                cube([1.25,1.25,racecar_cover_number_height], true);
            }                        
        }
    } 

    //RacecarCoverNumber();
    
}

module RacecarCoverNumber() {
    translate([racecar_cover_number_x_offset, racecar_cover_number_y_offset, racecar_cover_number_z_offset]) {
            linear_extrude(height=racecar_cover_number_height, center=true) {
                text(text=racecar_cover_number_text, size=racecar_cover_number_size, font = racecar_cover_number_font, valign="center", halign="center");
            }
    }
}