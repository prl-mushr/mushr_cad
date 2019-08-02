include <racecar_global_utils.scad>

rci_dst = "../images/husky_thresholded.dxf";
rci_x_scale = 0.35;
rci_y_scale = 0.35;
rci_height = _wall_thickness / 2.0;
rci_x_offset = -38.0;
rci_y_offset = -32.5;
rci_z_offset = 0.0;

if ($include_rci==undef) {
                 
    difference() {
        RacecarCoverImage(false);
        minkowski() {
            difference() {
                translate([0,0,0.0]) {
                    cube([110,110,rci_height], true);
                }
                RacecarCoverImage(false);
            }                   
            translate([0,0,0.0]) {
                cube([1.0,1.0,rci_height], true);
            }                        
        }
    }    
    //RacecarCoverImage();
}

module RacecarCoverImage() {
    translate([rci_x_offset, rci_y_offset, rci_z_offset]) {
        scale([rci_x_scale,rci_y_scale,1]) {    
            linear_extrude(height=rci_height, center=true) {
                import(rci_dst);
            }
        }    
    }
}
