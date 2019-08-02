$include_rbct = true;

include <racecar_back_cover_top.scad>

rjn_length = 80.0;
rjn_width = 100.0;
rjn_height = 1.75;

rjn_support_radius = 5/2.0;
rjn_support_height = 4.2;

rjn_wrt_rcb_x_offset = rbf_wrt_rcb_x_offset + rbct_wrt_rbf_x_offset - rbct_length/2.0 + rjn_length/2.0;
rjn_wrt_rcb_y_offset = rbf_wrt_rcb_y_offset + rbct_wrt_rbf_y_offset;
rjn_wrt_rcb_z_offset = rbf_wrt_rcb_z_offset + rbct_wrt_rbf_z_offset - rbct_height/2.0 - rjn_height/2.0 - rjn_support_height;

if($include_rjn==undef) {
    RacecarJetsonNano();
}

module RacecarJetsonNano() {
    rjn_x_offset = 0.0;
    rjn_y_offset = 0.0;
    rjn_z_offset = 0.0;
    
    rjn_heatsink_length = 49.0;
    rjn_heatsink_width = 69.68;
    rjn_heatsink_height = 26.75;
    rjn_heatsink_x_offset = rjn_x_offset + rjn_length/2.0 - rjn_heatsink_length/2.0;
    rjn_heatsink_y_offset = rjn_y_offset;
    rjn_heatsink_z_offset = rjn_z_offset + rjn_height/2.0 + rjn_heatsink_height/2.0;
    
    rjn_power_plug_length = 14.22;
    rjn_power_plug_width = 9.1;
    rjn_power_plug_height = 11.0;
    rjn_power_plug_x_offset = rjn_x_offset - rjn_length/2.0 + rjn_power_plug_length/2.0 - 1.5;
    rjn_power_plug_y_offset = rjn_y_offset + rjn_width/2.0 - rjn_power_plug_width/2.0 - 1.5;
    rjn_power_plug_z_offset = rjn_z_offset + rjn_height/2.0 + rjn_power_plug_height/2.0;
    
    rjn_hdmi_plug_length = 18.15;
    rjn_hdmi_plug_width = 17.0;
    rjn_hdmi_plug_height = 18.41;
    rjn_hdmi_plug_x_offset = rjn_x_offset - rjn_length/2.0 + rjn_hdmi_plug_length/2.0 - 1.5;
    rjn_hdmi_plug_y_offset = rjn_y_offset + rjn_width/2.0 - rjn_hdmi_plug_width/2.0 - 16.5;
    rjn_hdmi_plug_z_offset = rjn_z_offset + rjn_height/2.0 + rjn_hdmi_plug_height/2.0;
    
    rjn_usb_plug_length = 17.6;
    rjn_usb_plug_width  = 13.2;
    rjn_usb_plug_height = 15.4;
    rjn_usb_plug_x_offset = rjn_x_offset - rjn_length/2.0 + rjn_usb_plug_length/2.0 - 1.5;
    rjn_usb_plug_left_y_offset = rjn_y_offset + rjn_width/2.0 - rjn_usb_plug_width/2.0 - 37.0;
    rjn_usb_plug_right_y_offset = rjn_y_offset + rjn_width/2.0 - rjn_usb_plug_width/2.0 - 53.75;
    rjn_usb_plug_z_offset = rjn_z_offset + rjn_height/2.0 + rjn_usb_plug_height/2.0;
    
    rjn_ethernet_plug_length = 21.5;
    rjn_ethernet_plug_width = 16.0;
    rjn_ethernet_plug_height = 13.67;
    rjn_ethernet_plug_x_offset = rjn_x_offset - rjn_length/2.0 + rjn_ethernet_plug_length/2.0 - 1.5;
    rjn_ethernet_plug_y_offset = rjn_y_offset - rjn_width/2.0 + rjn_ethernet_plug_width/2.0 + 14.75;
    rjn_ethernet_plug_z_offset = rjn_z_offset + rjn_height/2.0 + rjn_ethernet_plug_height/2.0;
    
    rjn_usbc_plug_length = 6.75;
    rjn_usbc_plug_width = 8.13;
    rjn_usbc_plug_height = 2.75;
    rjn_usbc_plug_x_offset = rjn_x_offset - rjn_length/2.0 + rjn_usbc_plug_length/2.0 - 0.9;
    rjn_usbc_plug_y_offset = rjn_y_offset - rjn_width/2.0 + rjn_usbc_plug_width/2.0 + 4.5;
    rjn_usbc_plug_z_offset = rjn_z_offset + rjn_height/2.0 + rjn_usbc_plug_height/2.0;
    
    rjn_support_front_x_offset = rjn_x_offset + rjn_length/2.0 - 3.5;
    rjn_support_back_x_offset = rjn_support_front_x_offset - 58.25;
    rjn_support_left_y_offset = rjn_y_offset + rjn_width/2.0 - 3.0;
    rjn_support_right_y_offset = rjn_support_left_y_offset - 75.0;
    rjn_support_z_offset = rjn_z_offset - rjn_height/2.0 - rjn_support_height/2.0;
    
    translate([rjn_x_offset, rjn_y_offset, rjn_z_offset]) {
        cube([rjn_length, rjn_width, rjn_height], true);
    }
    
    translate([rjn_heatsink_x_offset, rjn_heatsink_y_offset, rjn_heatsink_z_offset]) {
        cube([rjn_heatsink_length, rjn_heatsink_width, rjn_heatsink_height], true);
    }
    
    translate([rjn_power_plug_x_offset, rjn_power_plug_y_offset, rjn_power_plug_z_offset]) {
        cube([rjn_power_plug_length, rjn_power_plug_width, rjn_power_plug_height], true);
    }
    
    translate([rjn_hdmi_plug_x_offset, rjn_hdmi_plug_y_offset, rjn_hdmi_plug_z_offset]) {
        cube([rjn_hdmi_plug_length, rjn_hdmi_plug_width, rjn_hdmi_plug_height], true);
    }    
    
    translate([rjn_usb_plug_x_offset, rjn_usb_plug_left_y_offset, rjn_usb_plug_z_offset]) {
        cube([rjn_usb_plug_length, rjn_usb_plug_width, rjn_usb_plug_height], true);
    }
    
    translate([rjn_usb_plug_x_offset, rjn_usb_plug_right_y_offset, rjn_usb_plug_z_offset]) {
        cube([rjn_usb_plug_length, rjn_usb_plug_width, rjn_usb_plug_height], true);
    }    
    
    translate([rjn_ethernet_plug_x_offset, rjn_ethernet_plug_y_offset, rjn_ethernet_plug_z_offset]) {
        cube([rjn_ethernet_plug_length, rjn_ethernet_plug_width, rjn_ethernet_plug_height], true);
    }

    translate([rjn_usbc_plug_x_offset, rjn_usbc_plug_y_offset, rjn_usbc_plug_z_offset]) {
        cube([rjn_usbc_plug_length, rjn_usbc_plug_width, rjn_usbc_plug_height], true);
    }   
    
    translate([rjn_support_front_x_offset, rjn_support_left_y_offset, rjn_support_z_offset]) {
        cylinder(rjn_support_height, rjn_support_radius, rjn_support_radius, true, $fn=_fn_val);
    }
    
    translate([rjn_support_front_x_offset, rjn_support_right_y_offset, rjn_support_z_offset]) {
        cylinder(rjn_support_height, rjn_support_radius, rjn_support_radius, true, $fn=_fn_val);
    }    
    
    translate([rjn_support_back_x_offset, rjn_support_left_y_offset, rjn_support_z_offset]) {
        cylinder(rjn_support_height, rjn_support_radius, rjn_support_radius, true, $fn=_fn_val);
    }
    
    translate([rjn_support_back_x_offset, rjn_support_right_y_offset, rjn_support_z_offset]) {
        cylinder(rjn_support_height, rjn_support_radius, rjn_support_radius, true, $fn=_fn_val);
    }        
    
}