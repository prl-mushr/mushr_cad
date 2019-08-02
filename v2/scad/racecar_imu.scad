include <../../misc/racecar_global_utils.scad>

rimu_length = 32.0;
rimu_width = 32.0;
rimu_height = 1.69+2*6.3;
rimu_x_offset = 0.0;
rimu_y_offset = 0.0;
rimu_z_offset = 0.0;

rimu_base_length = rimu_length;
rimu_base_width = rimu_width;
rimu_base_height = 1.69;
rimu_base_x_offset = rimu_x_offset;
rimu_base_y_offset = rimu_y_offset;
rimu_base_z_offset = rimu_z_offset;

rimu_support_diameter = 5.0;
rimu_support_height = 6.3;
rimu_support_front_x_offset = rimu_base_x_offset + 26.67/2.0;
rimu_support_back_x_offset = rimu_base_x_offset - 26.67/2.0;
rimu_support_left_y_offset = rimu_base_y_offset + 26.67/2.0;
rimu_support_right_y_offset = rimu_base_y_offset - 26.67/2.0;
rimu_support_top_z_offset = rimu_base_z_offset + rimu_base_height/2.0 + rimu_support_height/2.0;
rimu_support_bottom_z_offset = rimu_base_z_offset - rimu_base_height/2.0 - rimu_support_height/2.0;  

if($include_rimu==undef) {
    RacecarIMU();
}

module RacecarIMU() {  
    
    translate([rimu_base_x_offset, rimu_base_y_offset, rimu_base_z_offset]) {
        cube([rimu_base_length, rimu_base_width, rimu_base_height], true);
    }
    translate([rimu_support_front_x_offset, rimu_support_left_y_offset, rimu_support_top_z_offset]) {
        _hexagon(rimu_support_height, rimu_support_diameter);
    }
    translate([rimu_support_front_x_offset, rimu_support_left_y_offset, rimu_support_bottom_z_offset]) {
        _hexagon(rimu_support_height, rimu_support_diameter);
    }
    translate([rimu_support_front_x_offset, rimu_support_right_y_offset, rimu_support_top_z_offset]) {
        _hexagon(rimu_support_height, rimu_support_diameter);
    }
    translate([rimu_support_front_x_offset, rimu_support_right_y_offset, rimu_support_bottom_z_offset]) {
        _hexagon(rimu_support_height, rimu_support_diameter);
    }    
    translate([rimu_support_back_x_offset, rimu_support_left_y_offset, rimu_support_top_z_offset]) {
        _hexagon(rimu_support_height, rimu_support_diameter);
    }
    translate([rimu_support_back_x_offset, rimu_support_left_y_offset, rimu_support_bottom_z_offset]) {
        _hexagon(rimu_support_height, rimu_support_diameter);
    }
    translate([rimu_support_back_x_offset, rimu_support_right_y_offset, rimu_support_top_z_offset]) {
        _hexagon(rimu_support_height, rimu_support_diameter);
    }
    translate([rimu_support_back_x_offset, rimu_support_right_y_offset, rimu_support_bottom_z_offset]) {
        _hexagon(rimu_support_height, rimu_support_diameter);
    }        
}