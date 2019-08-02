$include_rff = true;
include <racecar_front_foundation.scad>

rjtx2_support_height = rimu_support_height;
rjtx2_support_diameter = rimu_support_diameter;
rjtx2_support_front_right_x_offset = 77.724;
rjtx2_support_front_right_y_offset = -78.486;
rjtx2_support_front_right_z_offset = rjtx2_support_height/2.0;
rjtx2_support_front_left_x_offset = 77.724;
rjtx2_support_front_left_y_offset = 78.486;
rjtx2_support_front_left_z_offset = rjtx2_support_front_right_z_offset;
rjtx2_support_back_right_x_offset = -77.724;
rjtx2_support_back_right_y_offset = -78.486;
rjtx2_support_back_right_z_offset = rjtx2_support_front_right_z_offset;
rjtx2_support_back_left_x_offset = -54.61;
rjtx2_support_back_left_y_offset = 78.486;
rjtx2_support_back_left_z_offset = rjtx2_support_back_right_z_offset;

rjtx2_wrt_rcb_x_offset = -rjtx2_support_back_right_x_offset +rbf_wrt_rcb_x_offset + rbf_jetson_back_right_x_offset;
rjtx2_wrt_rcb_y_offset = -rjtx2_support_back_right_y_offset +rbf_wrt_rcb_y_offset + rbf_jetson_back_right_y_offset;
rjtx2_wrt_rcb_z_offset = rbf_wrt_rcb_z_offset + rbf_jetson_back_right_z_offset + rbf_jetson_height/2.0;

if($include_rjtx2==undef) {
    RacecarJetsonTX2();
}

module RacecarJetsonTX2() {    
    rjtx2_base_length = 170.0;
    rjtx2_base_width = 170.0;
    rjtx2_base_height = 1.5;
    rjtx2_base_x_offset = 0.0;
    rjtx2_base_y_offset = 0.0;
    rjtx2_base_z_offset = rjtx2_base_height/2.0+rjtx2_support_height;
    
    rjtx2_heat_sink_length = 87.15;
    rjtx2_heat_sink_width = 50.0;
    rjtx2_heat_sink_height = 34.0;
    rjtx2_heat_sink_x_offset = rjtx2_base_x_offset - rjtx2_base_length/2.0 + 34.0 + rjtx2_heat_sink_length/2.0;
    rjtx2_heat_sink_y_offset = rjtx2_base_y_offset - rjtx2_base_width/2.0 + 32.0 + rjtx2_heat_sink_width/2.0;
    rjtx2_heat_sink_z_offset = rjtx2_base_z_offset + rjtx2_base_height/2.0 + rjtx2_heat_sink_height/2.0;
    
    rjtx2_power_plug_length = 13.16;
    rjtx2_power_plug_width = 10.0;
    rjtx2_power_plug_height = 10.0;
    rjtx2_power_plug_x_offset = rjtx2_base_x_offset - rjtx2_base_length/2.0 + rjtx2_power_plug_length/2.0;
    rjtx2_power_plug_y_offset = rjtx2_base_y_offset + rjtx2_base_width/2.0 - 3.0 - rjtx2_power_plug_width/2.0;
    rjtx2_power_plug_z_offset = rjtx2_base_z_offset + rjtx2_base_height/2.0 + rjtx2_power_plug_height/2.0;
    
    rjtx2_usbm_length = 5.75;
    rjtx2_usbm_width = 7.86;
    rjtx2_usbm_height = 2.2;
    rjtx2_usbm_x_offset = rjtx2_base_x_offset - rjtx2_base_length/2.0 + rjtx2_usbm_length/2.0 -1.5;
    rjtx2_usbm_y_offset = rjtx2_base_y_offset + rjtx2_base_width/2.0 - 45.0 - rjtx2_usbm_width/2.0;
    rjtx2_usbm_z_offset = rjtx2_base_z_offset + rjtx2_base_height/2.0 + rjtx2_usbm_height/2.0;
    
    rjtx2_usba_length = 16.67;
    rjtx2_usba_width = 14.83;
    rjtx2_usba_height = 6.95;
    rjtx2_usba_x_offset = rjtx2_base_x_offset - rjtx2_base_length/2.0 + rjtx2_usba_length/2.0 - 1.0;
    rjtx2_usba_y_offset = rjtx2_base_y_offset + rjtx2_base_width/2.0 - 58.67 - rjtx2_usba_width/2.0;
    rjtx2_usba_z_offset = rjtx2_base_z_offset + rjtx2_base_height/2.0 + rjtx2_usba_height/2.0;
    
    rjtx2_hdmi_length = 18.45;
    rjtx2_hdmi_width = 15.5;
    rjtx2_hdmi_height = 5.87;
    rjtx2_hdmi_x_offset = rjtx2_base_x_offset - rjtx2_base_length/2.0 + rjtx2_hdmi_length/2.0;              
    rjtx2_hdmi_y_offset = rjtx2_base_y_offset + rjtx2_base_width/2.0 - 79.5 - rjtx2_hdmi_width/2.0;
    rjtx2_hdmi_z_offset = rjtx2_base_z_offset + rjtx2_base_height/2.0 + rjtx2_hdmi_height/2.0;
    
    rjtx2_sd_length = 30.0;
    rjtx2_sd_width = 28.0;
    rjtx2_sd_height = 3.0;
    rjtx2_sd_x_offset = rjtx2_base_x_offset - rjtx2_base_length/2.0 + rjtx2_sd_length/2.0 + 1.3;
    rjtx2_sd_y_offset = rjtx2_base_y_offset - rjtx2_base_width/2.0 + 44.3 + rjtx2_sd_width/2.0;
    rjtx2_sd_z_offset = rjtx2_base_z_offset + rjtx2_base_height/2.0 + rjtx2_sd_height/2.0;
    
    rjtx2_ethernet_length = 15.75;
    rjtx2_ethernet_width = 16.5;
    rjtx2_ethernet_height = 13.4;
    rjtx2_ethernet_x_offset = rjtx2_base_x_offset - rjtx2_base_length/2.0 + rjtx2_ethernet_length/2.0 + 0.3;
    rjtx2_ethernet_y_offset = rjtx2_base_y_offset - rjtx2_base_width/2.0 + 19.0 + rjtx2_ethernet_width/2.0;
    rjtx2_ethernet_z_offset = rjtx2_base_z_offset + rjtx2_base_height/2.0 + rjtx2_ethernet_height/2.0;
    
    translate([rjtx2_support_front_right_x_offset, rjtx2_support_front_right_y_offset, rjtx2_support_front_right_z_offset]) {
        _hexagon(rjtx2_support_height, rjtx2_support_diameter);
    }

    translate([rjtx2_support_front_left_x_offset, rjtx2_support_front_left_y_offset, rjtx2_support_front_left_z_offset]) {
        _hexagon(rjtx2_support_height, rjtx2_support_diameter);
    }

    translate([rjtx2_support_back_right_x_offset, rjtx2_support_back_right_y_offset, rjtx2_support_back_right_z_offset]) {
        _hexagon(rjtx2_support_height, rjtx2_support_diameter);
    }

    translate([rjtx2_support_back_left_x_offset, rjtx2_support_back_left_y_offset, rjtx2_support_back_left_z_offset]) {
        _hexagon(rjtx2_support_height, rjtx2_support_diameter);
    }
    
    translate([rjtx2_base_x_offset, rjtx2_base_y_offset, rjtx2_base_z_offset]) {
        cube([rjtx2_base_length, rjtx2_base_width, rjtx2_base_height], true);
    }
    
    translate([rjtx2_heat_sink_x_offset, rjtx2_heat_sink_y_offset, rjtx2_heat_sink_z_offset]) {
        cube([rjtx2_heat_sink_length, rjtx2_heat_sink_width, rjtx2_heat_sink_height], true);
    }

    translate([rjtx2_power_plug_x_offset,rjtx2_power_plug_y_offset,rjtx2_power_plug_z_offset]) {
        cube([rjtx2_power_plug_length, rjtx2_power_plug_width, rjtx2_power_plug_height], true);
    }

    translate([rjtx2_usbm_x_offset,rjtx2_usbm_y_offset,rjtx2_usbm_z_offset]) {
        cube([rjtx2_usbm_length, rjtx2_usbm_width, rjtx2_usbm_height], true);
    }
    
    translate([rjtx2_usba_x_offset,rjtx2_usba_y_offset,rjtx2_usba_z_offset]) {
        cube([rjtx2_usba_length, rjtx2_usba_width, rjtx2_usba_height], true);
    }    
    
    translate([rjtx2_hdmi_x_offset,rjtx2_hdmi_y_offset,rjtx2_hdmi_z_offset]) {
        cube([rjtx2_hdmi_length, rjtx2_hdmi_width, rjtx2_hdmi_height], true);
    }        
    
    translate([rjtx2_sd_x_offset,rjtx2_sd_y_offset,rjtx2_sd_z_offset]) {
        cube([rjtx2_sd_length, rjtx2_sd_width, rjtx2_sd_height], true);
    }            
    
    translate([rjtx2_ethernet_x_offset,rjtx2_ethernet_y_offset,rjtx2_ethernet_z_offset]) {
        cube([rjtx2_ethernet_length, rjtx2_ethernet_width, rjtx2_ethernet_height], true);
    }            
        
}