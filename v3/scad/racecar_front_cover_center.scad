$include_rff = true;
include <racecar_front_foundation.scad>

$include_rbcls = true;
include <racecar_back_cover_left_side.scad>

$include_rcn = true;
include <../../misc/racecar_cover_number.scad>

/////////////////////////////////////////////////////////////////////////////////
//
//  Adding lighting effects based on Adafruit NeoPixel Stick (x8 RGBW LEDs) for
//  visual feedback (particularly during robot startup) and illumination for RGB
//  camera (part of Realsense D435/D435i/D455 Depth Camera) in dark environments.
//
//  See https://github.com/pfliegster/mushr-lighting-system for a detailed discussion
//  of the lighting system components. In addition to these OpenSCAD modifications, some
//  additional software for both the lighting controller (on Adafruit Trinket M0) and 
//  companion ROS software package is required.
//
//  The Lighting System Requires external GitHub Repository for NeoPixel Enclosure Design:
//      https://github.com/pfliegster/neopixel-enclosures  (Release Tag v0.2 or later)
//
//  First: Include the NeoPixel-Enclosure repository design files for headlight and/or
//  lightbar assemblies:
$include_back = false;
include <../../../neopixel-enclosures/neopixel_x8_stick_case_back.scad>
$include_front = false;
include <../../../neopixel-enclosures/neopixel_x8_stick_case_front.scad>
//
//  Include the Trinket-M0 Enclosure repository design files for trinket mounting base:
include <../../../trinket-m0-enclosure/trinket_m0_enclosure_elements.scad>
//
// Note: The lighting system components are disabled by default (the following two boolean
//       values are set to false). If the MuSHR user would like to add the lighting system
//       components, simply change these two booleans to 'true' as desired for your setup and
//       re-render your OpenSCAD files or use the provided additional STL files provided in the
//       v3/stl directory.
//
// Put headlight mount on top of racecar hood if 'true':
_include_neopixel_headlight = false;
// Add "Adafruit Trinket M0", used as light controller for NeoPixel Stick based
//  Lightbar and/or Headlights. We add Trinket mounting provisions on underside of
//  racecar cover with this when 'true':
_include_trinket_mcu = false;
//
// Decide to build Headlight, Lightbar, and Trinket MCU mounting parts **ONLY** if
// the 'neopixel-enclosures' and 'trinket-m0-enclosure' Repositories are installed
//  and referenced correctly above in the includes:
neopixel_back_parts_are_available        = ($neopixel_back_parts_are_available == undef) ? false : true;
trinket_enclosure_elements_are_available = ($trinket_enclosure_elements_are_available == undef) ? false : true;
_build_neopixel_headlight = neopixel_back_parts_are_available && _include_neopixel_headlight;
_build_trinket_mcu        = trinket_enclosure_elements_are_available && _include_trinket_mcu;
//  Some additional modules can be displayed for visualization and verification
//  of proper model construction:
display_headlight_assembly  = false;
display_trinket_assembly    = false;
// Dimensions associated with optional headlight bar, top lightbar & controller MCU board:
neopixel_headlight_position = [49, 0, 24.7]; // Manually derived visually (w/ trial and error :-) )
headlight_assy_thickness = 10.25;
headlight_case_screw_separation = 60.0;
//
// Location for "Adafruit Trinket M0" (lighting controller) mounting base and screw holes:
trinket_origin_x = -38;
trinket_origin_y = -2;
trinket_origin_z = 42.8;

rfcc_rbct_left_top_x = -rff_wrt_rcb_x_offset + rbf_wrt_rcb_x_offset + rbct_wrt_rbf_x_offset + rbct_length/2.0;
rfcc_rbct_left_top_y = -rff_wrt_rcb_y_offset + rbf_wrt_rcb_y_offset + rbct_wrt_rbf_y_offset + rbct_width/2.0+rbcls_rbct_extra_width;
rfcc_rbct_left_top_z = -rff_wrt_rcb_z_offset + rbf_wrt_rcb_z_offset + rbct_wrt_rbf_z_offset + rbct_height/2.0;
rfcc_rbct_left_bottom_x = -rff_wrt_rcb_x_offset + rbf_wrt_rcb_x_offset + rbct_wrt_rbf_x_offset + rbct_length/2.0;
rfcc_rbct_left_bottom_y = -rff_wrt_rcb_y_offset + rbf_wrt_rcb_y_offset + rbct_wrt_rbf_y_offset + rbct_width/2.0+rbcls_rbct_extra_width;
rfcc_rbct_left_bottom_z = -rff_wrt_rcb_z_offset + rbf_wrt_rcb_z_offset + rbct_wrt_rbf_z_offset - rbct_height/2.0;
rfcc_rbct_right_top_x = -rff_wrt_rcb_x_offset + rbf_wrt_rcb_x_offset + rbct_wrt_rbf_x_offset + rbct_length/2.0;
rfcc_rbct_right_top_y = -rff_wrt_rcb_y_offset + rbf_wrt_rcb_y_offset + rbct_wrt_rbf_y_offset - rbct_width/2.0-rbcls_rbct_extra_width;
rfcc_rbct_right_top_z = -rff_wrt_rcb_z_offset + rbf_wrt_rcb_z_offset + rbct_wrt_rbf_z_offset + rbct_height/2.0;
rfcc_rbct_right_bottom_x = -rff_wrt_rcb_x_offset + rbf_wrt_rcb_x_offset + rbct_wrt_rbf_x_offset + rbct_length/2.0;
rfcc_rbct_right_bottom_y = -rff_wrt_rcb_y_offset + rbf_wrt_rcb_y_offset + rbct_wrt_rbf_y_offset - rbct_width/2.0-rbcls_rbct_extra_width;
rfcc_rbct_right_bottom_z = -rff_wrt_rcb_z_offset + rbf_wrt_rcb_z_offset + rbct_wrt_rbf_z_offset - rbct_height/2.0;

rfcc_rff_cover_front_left_x = rff_head_front_left_x;
rfcc_rff_cover_front_left_y = rff_head_front_left_y;
rfcc_rff_cover_front_left_z = rff_front_wall_top_z;
rfcc_rff_cover_front_right_x = rff_head_front_right_x;
rfcc_rff_cover_front_right_y = rff_head_front_right_y;
rfcc_rff_cover_front_right_z = rff_front_wall_top_z;
rfcc_rff_cover_back_left_x = rff_front_wall_front_outer_left_x;
rfcc_rff_cover_back_left_y = rff_front_wall_front_outer_left_y;
rfcc_rff_cover_back_left_z = rff_front_wall_top_z;
rfcc_rff_cover_back_right_x = rff_front_wall_front_outer_right_x;
rfcc_rff_cover_back_right_y = rff_front_wall_front_outer_right_y;
rfcc_rff_cover_back_right_z = rff_front_wall_top_z;

rfcc_rff_wall_front_left_x = rff_head_front_left_x;
rfcc_rff_wall_front_left_y = rff_head_front_left_y;
rfcc_rff_wall_front_left_z = rff_front_wall_bottom_z;
rfcc_rff_wall_front_right_x = rff_head_front_right_x;
rfcc_rff_wall_front_right_y = rff_head_front_right_y;
rfcc_rff_wall_front_right_z = rff_front_wall_bottom_z;
rfcc_rff_wall_back_left_x = rff_front_wall_front_outer_left_x;
rfcc_rff_wall_back_left_y = rff_front_wall_front_outer_left_y;
rfcc_rff_wall_back_left_z = rff_front_wall_bottom_z;
rfcc_rff_wall_back_right_x = rff_front_wall_front_outer_right_x;
rfcc_rff_wall_back_right_y = rff_front_wall_front_outer_right_y;
rfcc_rff_wall_back_right_z = rff_front_wall_bottom_z;

rfcc_top_xz_slope = (rfcc_rff_cover_front_left_z-rfcc_rbct_left_top_z)/(rfcc_rff_cover_front_left_x-rfcc_rbct_left_top_x);
rfcc_bottom_xz_slope = (rfcc_rff_cover_back_left_z-rfcc_rbct_left_bottom_z)/(rfcc_rff_cover_back_left_x-rfcc_rbct_left_bottom_x);
rfcc_left_xy_slope = (rfcc_rff_cover_front_left_y-rfcc_rbct_left_top_y)/(rfcc_rff_cover_front_left_x-rfcc_rbct_left_top_x);
rfcc_right_xy_slope = (rfcc_rff_cover_front_right_y-rfcc_rbct_right_top_y)/(rfcc_rff_cover_front_right_x-rfcc_rbct_right_top_y);

rfcc_camera_cutout_extra_front_x = 45.0;
rfcc_camera_cutout_front_left_top_x = rfcc_rbct_left_top_x + rfcc_camera_cutout_extra_front_x;
rfcc_camera_cutout_front_left_top_y = rfcc_rbct_left_top_y + rfcc_camera_cutout_extra_front_x*rfcc_left_xy_slope;
rfcc_camera_cutout_front_left_top_z = rfcc_rbct_left_top_z + rfcc_camera_cutout_extra_front_x*rfcc_top_xz_slope;

rfcc_camera_cutout_front_left_bottom_x = rfcc_rbct_left_bottom_x + rfcc_camera_cutout_extra_front_x;
rfcc_camera_cutout_front_left_bottom_y = rfcc_rbct_left_bottom_y + rfcc_camera_cutout_extra_front_x*rfcc_left_xy_slope;
rfcc_camera_cutout_front_left_bottom_z = rfcc_rbct_left_bottom_z + rfcc_camera_cutout_extra_front_x*rfcc_bottom_xz_slope;  

rfcc_camera_cutout_front_right_top_x = rfcc_rbct_right_top_x + rfcc_camera_cutout_extra_front_x;
rfcc_camera_cutout_front_right_top_y = rfcc_rbct_right_top_y + rfcc_camera_cutout_extra_front_x*rfcc_right_xy_slope;
rfcc_camera_cutout_front_right_top_z = rfcc_rbct_right_top_z + rfcc_camera_cutout_extra_front_x*rfcc_top_xz_slope;

rfcc_camera_cutout_front_right_bottom_x = rfcc_rbct_right_bottom_x + rfcc_camera_cutout_extra_front_x;
rfcc_camera_cutout_front_right_bottom_y = rfcc_rbct_right_bottom_y + rfcc_camera_cutout_extra_front_x*rfcc_right_xy_slope;
rfcc_camera_cutout_front_right_bottom_z = rfcc_rbct_right_bottom_z + rfcc_camera_cutout_extra_front_x*rfcc_bottom_xz_slope;

rfcc_camera_cutout_z_separation = 25.0;
rfcc_camera_cutout_extra_back_x = rfcc_camera_cutout_extra_front_x + rfcc_camera_cutout_z_separation*(1.0/rfcc_top_xz_slope);

rfcc_camera_cutout_back_left_top_x = rfcc_rbct_left_top_x + rfcc_camera_cutout_extra_back_x;
rfcc_camera_cutout_back_left_top_y = rfcc_rbct_left_top_y + rfcc_camera_cutout_extra_back_x*rfcc_left_xy_slope;
rfcc_camera_cutout_back_left_top_z = rfcc_rbct_left_top_z + rfcc_camera_cutout_extra_back_x*rfcc_top_xz_slope;

rfcc_camera_cutout_back_left_bottom_x = rfcc_rbct_left_bottom_x + rfcc_camera_cutout_extra_back_x;
rfcc_camera_cutout_back_left_bottom_y = rfcc_rbct_left_bottom_y + rfcc_camera_cutout_extra_back_x*rfcc_left_xy_slope;
rfcc_camera_cutout_back_left_bottom_z = rfcc_rbct_left_bottom_z + rfcc_camera_cutout_extra_back_x*rfcc_bottom_xz_slope-0.01;   

rfcc_camera_cutout_back_right_top_x = rfcc_rbct_right_top_x + rfcc_camera_cutout_extra_back_x;
rfcc_camera_cutout_back_right_top_y = rfcc_rbct_right_top_y + rfcc_camera_cutout_extra_back_x*rfcc_right_xy_slope;
rfcc_camera_cutout_back_right_top_z = rfcc_rbct_right_top_z + rfcc_camera_cutout_extra_back_x*rfcc_top_xz_slope;

rfcc_camera_cutout_back_right_bottom_x = rfcc_rbct_right_bottom_x + rfcc_camera_cutout_extra_back_x;
rfcc_camera_cutout_back_right_bottom_y = rfcc_rbct_right_bottom_y + rfcc_camera_cutout_extra_back_x*rfcc_right_xy_slope;
rfcc_camera_cutout_back_right_bottom_z = rfcc_rbct_right_bottom_z + rfcc_camera_cutout_extra_back_x*rfcc_bottom_xz_slope-0.01;

rfcc_camera_mount_extra_x = -_wall_thickness + rfcc_camera_cutout_extra_back_x;

rfcc_camera_mount_left_top_x = rfcc_rbct_left_top_x+rfcc_camera_mount_extra_x;
rfcc_camera_mount_left_top_y = rfcc_rbct_left_top_y+rfcc_camera_mount_extra_x*rfcc_left_xy_slope;
rfcc_camera_mount_left_top_z = rfcc_rbct_left_top_z+rfcc_camera_mount_extra_x*rfcc_top_xz_slope;

rfcc_camera_mount_left_bottom_x = rfcc_rbct_left_top_x+rfcc_camera_mount_extra_x;
rfcc_camera_mount_left_bottom_y = rfcc_rbct_left_top_y+rfcc_camera_mount_extra_x*rfcc_left_xy_slope;
rfcc_camera_mount_left_bottom_z = rfcc_camera_cutout_front_left_bottom_z;

rfcc_camera_mount_right_top_x = rfcc_rbct_right_top_x+rfcc_camera_mount_extra_x;
rfcc_camera_mount_right_top_y = rfcc_rbct_right_top_y+rfcc_camera_mount_extra_x*rfcc_right_xy_slope;
rfcc_camera_mount_right_top_z = rfcc_rbct_right_top_z+rfcc_camera_mount_extra_x*rfcc_top_xz_slope;

rfcc_camera_mount_right_bottom_x = rfcc_rbct_right_top_x+rfcc_camera_mount_extra_x;
rfcc_camera_mount_right_bottom_y = rfcc_rbct_right_top_y+rfcc_camera_mount_extra_x*rfcc_right_xy_slope;
rfcc_camera_mount_right_bottom_z = rfcc_camera_cutout_front_right_bottom_z;    

rfcc_camera_mount_screw_height = 2*_wall_thickness;
rfcc_camera_mount_screw_x_offset = (rfcc_camera_mount_right_top_x+rfcc_camera_cutout_back_right_top_x)/2.0;
rfcc_camera_mount_screw_left_y_offset = (rfcc_camera_mount_left_top_y+rfcc_camera_mount_right_top_y)/2.0+45/2.0;
rfcc_camera_mount_screw_right_y_offset = (rfcc_camera_mount_left_top_y+rfcc_camera_mount_right_top_y)/2.0-45/2.0;
rfcc_camera_mount_screw_z_offset = rfcc_camera_cutout_front_right_top_z+14.5;

rfcc_t265_mount_screw_height = rfcc_camera_mount_screw_height;
rfcc_t265_mount_screw_x_offset = rfcc_camera_mount_screw_x_offset;
rfcc_t265_mount_screw_left_y_offset = (rfcc_camera_mount_left_top_y+rfcc_camera_mount_right_top_y)/2.0 + 50.0/2.0;//- 9.1 + 50.0/2.0;
rfcc_t265_mount_screw_right_y_offset = rfcc_t265_mount_screw_left_y_offset - 50.0;
rfcc_t265_mount_screw_z_offset = rfcc_camera_cutout_front_right_top_z+14.5;

rfcc_d455_mount_screw_height = rfcc_camera_mount_screw_height;
rfcc_d455_mount_screw_x_offset = rfcc_camera_mount_screw_x_offset;
rfcc_d455_mount_screw_left_y_offset = (rfcc_camera_mount_left_top_y+rfcc_camera_mount_right_top_y)/2.0 + 95.0/2.0;
rfcc_d455_mount_screw_right_y_offset = (rfcc_camera_mount_left_top_y+rfcc_camera_mount_right_top_y)/2.0 - 95.0/2.0;
rfcc_d455_mount_screw_z_offset = rfcc_camera_cutout_front_right_top_z+29.0/2+2;

rfcc_d455_head_screw_height = (rfcc_d455_mount_screw_x_offset+rfcc_d455_mount_screw_height/2.0)-rfcc_rbct_left_bottom_x;
rfcc_d455_head_screw_x_offset = rfcc_camera_mount_left_top_x - rfcc_d455_head_screw_height/2.0+0.7;
rfcc_d455_head_screw_left_y_offset = rfcc_d455_mount_screw_left_y_offset;
rfcc_d455_head_screw_right_y_offset = rfcc_d455_mount_screw_right_y_offset;
rfcc_d455_head_screw_z_offset = rfcc_d455_mount_screw_z_offset;

rfcc_number_slope = (rfcc_rbct_left_top_z-rfcc_rff_cover_front_left_z)/(rfcc_rbct_left_top_x-rfcc_rff_cover_front_left_x);
rfcc_number_x_rotation = -atan(rfcc_number_slope);
rfcc_number_y_rotation = 0.0;
rfcc_number_z_rotation = 90;
rfcc_number_extra_z = -45.0;
rfcc_number_extra_x = rfcc_number_extra_z*(1.0/rfcc_number_slope);
rfcc_number_x_offset = rfcc_rbct_left_top_x+rfcc_number_extra_x;
rfcc_number_y_offset = (rfcc_rbct_left_top_y+rfcc_rbct_right_top_y)/2.0;
rfcc_number_z_offset = rfcc_rbct_left_top_z-racecar_cover_number_height/2.0+rfcc_number_extra_z;    

rfcct265p_base_length = 8.0;
rfcct265p_base_width = -2*rfcc_t265_mount_screw_right_y_offset + 2*_m3_screw_head_radius+4*_wall_thickness+35;//+20; //added+35 to fit D455 holes
rfcct265p_base_height = rfcc_rbct_left_top_z-(rfcc_t265_mount_screw_z_offset-_m3_screw_shaft_radius- _wall_thickness)+24.5/2.0+_m3_screw_shaft_radius+_wall_thickness;
rfcct265p_base_x_offset = rfcc_camera_cutout_back_left_top_x+ rfcct265p_base_length/2.0;
rfcct265p_base_y_offset = (rfcc_rbct_left_top_y + rfcc_rbct_right_top_y)/2.0;
rfcct265p_base_z_offset = rfcc_t265_mount_screw_z_offset-_m3_screw_shaft_radius- _wall_thickness + rfcct265p_base_height/2.0;

rfcct265p_screw_z_offset = rfcct265p_base_z_offset + rfcct265p_base_height/2.0 - _wall_thickness - _m3_screw_shaft_radius + 4; //+4 to raise t265 mounting height to fit D455

/*
rfcct265p_extra_length = rfcct265p_base_length;
rfcct265p_extra_width = rfcct265p_base_width+35;
rfcct265p_extra_height = 15.0;
rfcct265p_extra_x_offset = rfcct265p_base_x_offset;
rfcct265p_extra_y_offset = rfcct265p_base_y_offset;
rfcct265p_extra_z_offset = rfcct265p_base_z_offset + rfcct265p_base_height/2.0+rfcct265p_extra_height/2.0;

rfcct265p_extra_screw_x_offset = rfcct265p_extra_x_offset;
rfcct265p_extra_screw_left_y_offset = rfcct265p_extra_y_offset + 45.0/2 - 17.5 - 15;
rfcct265p_extra_screw_right_y_offset = rfcct265p_extra_screw_left_y_offset - 45.0;
rfcct265p_extra_screw_z_offset = rfcct265p_extra_z_offset;
*/
if ($include_rfcc==undef) {
    RacecarFrontCoverCenter();
    RacecarFrontCoverCenterT265Plate();

    // Display the NeoPixel Headlight Assembly if it was built:
    if (_build_neopixel_headlight) {
        if (display_headlight_assembly) {
            NeoPixelHeadlightAssembly();
        }
    }

    // Display the Trinket-M0 Lighting Controller Assembly if it was built:
    if (_build_trinket_mcu) {
        if (display_trinket_assembly) {
            TrinketMcuAssembly();
        }
    }

    // Print config
    /*
    rotate([0,90,0]) {
        translate([-rfcct265p_base_x_offset, -rfcct265p_base_y_offset, -rfcct265p_base_z_offset]) {
            RacecarFrontCoverCenterT265Plate();
        }
    }
    */
    
    // Alternate Print configurations for the Headlight and Rear Lightbar Assembly Parts:
//    HeadlightAssemblyBack();     // Rendered and save as: headlight_assembly_back.stl
//    HeadlightAssemblyFront();    // Rendered and save as: headlight_assembly_front.stl
//    RearLightbarAssemblyBack();  // Rendered and save as: rear_lightbar_assembly_back.stl
//    RearLightbarAssemblyFront(); // Rendered and save as: rear_lightbar_assembly_front.stl
    
}

module TrinketMcuAssembly() {
    translate([trinket_origin_x, trinket_origin_y, trinket_origin_z - 4]) {
        rotate([180, 0, 0]) {
            ada_trnk_m0_pwb_model();
            translate([0, -30, -0.8]) rotate([90, 0, 0])
                jst_wiring_harness(num_conductor = 4, harness_length = 30,
                                    connector_type = "header", $fn=80);

            mounting_screw_z_offset = ada_trk_m0_pwb_height - mounting_screw_length;
            num_pwb_holes   = len(ada_trk_m0_holes);
            for (i = [ 0: num_pwb_holes-1 ]) {
                if (ada_trk_m0_holes[i][4] == trnk_mtg_option_screw) {
                    screw_position = [
                        ada_trk_m0_holes[i][0].x,
                        ada_trk_m0_holes[i][0].y,
                        mounting_screw_z_offset];
                    
                    color("silver") translate(screw_position)
                        generic_screw_model(screw_diam = 2.0,
                            screw_type = "cylinder",
                            head_diam = 3.65,
                            head_height = 1.96,
                            length = mounting_screw_length, $fn=80);
                }
            }
        }
    }
}

module HeadlightAssemblyBack() {
    // Modify a few parameters from the default neopixel enclosure configuration:
    neopixel_stick_case_back(
        xy_center  = true,
        add_back_mounting_screws = true,
        case_screw_separation = headlight_case_screw_separation,
        case_thickness = headlight_assy_thickness
    );
}

module HeadlightAssemblyFront() {
    // Modify a few parameters from the default neopixel enclosure configuration:
    neopixel_stick_case_front(
        xy_center  = true,
        case_screw_separation = headlight_case_screw_separation
    );
}

module RearLightbarAssemblyBack() {
    // Use all default neopixel enclosure dimension parameters:
    neopixel_stick_case_back(
        xy_center  = true
    );
}

module RearLightbarAssemblyFront() {
    // Use all default neopixel enclosure dimension parameters:
    neopixel_stick_case_front(
        xy_center  = true
    );
}

module NeoPixelHeadlightAssembly() {
    mtg_screw_length = 10;
    case_screw_length = 10;
    harness_pocket_depth = 3.6; // This is from the NeoPixel Stick Back Enclosure construction.
    case_screw_offset = (headlight_case_screw_separation - ada_nps8_pwb_length)/2;
    back_surface_z = headlight_assy_thickness - front_surface_z;

    mtg_screw1_pos = [  0.31*ada_nps8_pwb_length - ada_nps8_pwb_length/2,
                        0.43*ada_nps8_pwb_width - ada_nps8_pwb_width/2,
                        -(mtg_screw_length + harness_pocket_depth)];
    mtg_screw2_pos = [  0.69*ada_nps8_pwb_length - ada_nps8_pwb_length/2,
                        0.43*ada_nps8_pwb_width - ada_nps8_pwb_width/2,
                        -(mtg_screw_length + harness_pocket_depth)];
    case_screw1_pos = [  -(ada_nps8_pwb_length/2 + case_screw_offset),
                        0,
                        ada_nps8_pwb_height + front_surface_z - case_screw_length];
    case_screw2_pos = [  ada_nps8_pwb_length/2 + case_screw_offset,
                        0,
                        ada_nps8_pwb_height + front_surface_z - case_screw_length];
    case_nut1_pos = [  -(ada_nps8_pwb_length/2 + case_screw_offset),
                        0,
                        ada_nps8_pwb_height - back_surface_z];
    case_nut2_pos = [   ada_nps8_pwb_length/2 + case_screw_offset,
                        0,
                        ada_nps8_pwb_height - back_surface_z];

    translate(neopixel_headlight_position) {
        rotate([0, 90, 0]) {
            rotate([0, 0, 90]) {
                neopixel_stick_case_back(
                    xy_center  = true,
                    add_back_mounting_screws = true,
                    case_screw_separation = headlight_case_screw_separation,
                    case_thickness = headlight_assy_thickness,
                    back_alpha = 1.0
                );
                neopixel_stick_case_front(
                    case_screw_separation = headlight_case_screw_separation,
                    screw_case = true,
                    screw_type = "flat",
                    xy_center  = true,
                    front_alpha = 1.0
                );
                ada_nps8_pwb_model(xy_center = true, $fn=40);
                neopixel_wiring_harness(num_conductor = 4, harness_length = 50,
                    connector_type = "socket", xy_center = true, $fn=40);

                color("silver") {
                    translate(mtg_screw1_pos) {
                        generic_screw_model(screw_diam = 3.0, screw_type = "flat",
                            length = mtg_screw_length, $fn=80);
                    }
                    translate(mtg_screw2_pos) {
                        generic_screw_model(screw_diam = 3.0, screw_type = "flat",
                            length = mtg_screw_length, $fn=80);
                    }
                    translate(case_screw1_pos) {
                        generic_screw_model(screw_diam = 3.0, screw_type = "flat",
                            length = case_screw_length, $fn=80);
                    }
                    translate(case_screw2_pos) {
                        generic_screw_model(screw_diam = 3.0, screw_type = "flat",
                            length = case_screw_length, $fn=80);
                    }
                    translate(case_nut1_pos) {
                        m3_nut(outer_diameter = 6.4);
                    }
                    translate(case_nut2_pos) {
                        m3_nut(outer_diameter = 6.4);
                    }
                }
            }
        }
    }
}

// Build the Headlight Mounting structure for NeoPixel Enclosure using a 
// large cylinder segment (snipped) on the top side of the RFCC model part:
module NeoPixelHeadlightMount() {
    rfcc_hlm_cylinder_height = 38;
    rfcc_hlm_cylinder_radius = 20;
    rfcc_hlm_cylinder_position_offset = [-25, 0, -13]; // Relative to NeoPixel Enclosure model used for headlight
    mount_position = neopixel_headlight_position + rfcc_hlm_cylinder_position_offset;

    difference() {
        translate(mount_position) {
            rotate([0, 90, 0]) {
                cylinder(h = rfcc_hlm_cylinder_height, r = rfcc_hlm_cylinder_radius, center = true, $fn = 120);
            }
        }
        // Create a rotated cube to snip away solid body below the racecar hood inner surface:
        rfcc_hlm_bottom_snip_rotate_y = -atan(rfcc_bottom_xz_slope);
        rfcc_hlm_bottom_snip_cube_length = 90;
        rfcc_hlm_bottom_snip_cube_width  = 70;
        rfcc_hlm_bottom_snip_cube_height = 67;

        rotate([0, rfcc_hlm_bottom_snip_rotate_y, 0]) {
            cube([  rfcc_hlm_bottom_snip_cube_length,
                    rfcc_hlm_bottom_snip_cube_width,
                    rfcc_hlm_bottom_snip_cube_height], center = true);
        }
    }        
}

module RacecarFrontCoverCenterCutout() {
    polyhedron(points=[
    [rfcc_camera_cutout_front_left_top_x,rfcc_camera_cutout_front_left_top_y,rfcc_camera_cutout_front_left_top_z],
    [rfcc_camera_cutout_front_left_bottom_x,rfcc_camera_cutout_front_left_bottom_y,rfcc_camera_cutout_front_left_bottom_z],
    [rfcc_camera_cutout_front_right_top_x,rfcc_camera_cutout_front_right_top_y,rfcc_camera_cutout_front_right_top_z],
    [rfcc_camera_cutout_front_right_bottom_x,rfcc_camera_cutout_front_right_bottom_y,rfcc_camera_cutout_front_right_bottom_z],
    [rfcc_camera_cutout_back_left_top_x,rfcc_camera_cutout_back_left_top_y,rfcc_camera_cutout_back_left_top_z],
    [rfcc_camera_cutout_back_left_bottom_x,rfcc_camera_cutout_back_left_bottom_y,rfcc_camera_cutout_back_left_bottom_z],
    [rfcc_camera_cutout_back_right_top_x,rfcc_camera_cutout_back_right_top_y,rfcc_camera_cutout_back_right_top_z],
    [rfcc_camera_cutout_back_right_bottom_x,rfcc_camera_cutout_back_right_bottom_y,rfcc_camera_cutout_back_right_bottom_z],        
    ], faces=[[2,3,7,6],[1,0,4,5],[2,0,1,3],[5,4,6,7],[4,0,2,6],[5,7,3,1]]);    
}

module RacecarFrontCoverCenterUSB() {
    rfcc_usb_length = 10+rfcct265p_base_length;
    rfcc_usb_width = 100.0;
    rfcc_usb_height = 30.0;
    
    //the translate-y value is changed to 2.25 to make the USB hole wider to fit the D455 & T265 wire
    translate([rfcc_camera_cutout_back_right_top_x+rfcc_usb_length/2.0,rfcc_camera_cutout_front_right_top_y-rfcc_usb_width/2.1,rfcc_camera_cutout_front_right_top_z+rfcc_usb_height/2.0]) {
        cube([rfcc_usb_length,rfcc_usb_width,rfcc_usb_height], true);
    }
}

module RacecarFrontCoverD455Removal() {
    rfc_d455r_length = rfcc_camera_cutout_front_right_top_x - rfcc_camera_cutout_back_right_top_x;
    rfc_d455r_width = rff_width;
    rfc_d455r_height = rfcc_camera_cutout_back_right_top_z -rfcc_camera_cutout_front_right_bottom_z;
    rfc_d455r_x_offset = 0.5*(rfcc_camera_cutout_back_right_top_x + rfcc_camera_cutout_front_right_top_x);
    rfc_d455r_y_offset = 0.5*(rfcc_camera_cutout_back_left_bottom_y+rfcc_camera_cutout_back_right_bottom_y);
    rfc_d455r_z_offset = rfcc_camera_cutout_front_right_top_z+rfc_d455r_height/2.0;
    
    translate([rfc_d455r_x_offset, rfc_d455r_y_offset, rfc_d455r_z_offset]) {
        cube([rfc_d455r_length, rfc_d455r_width, rfc_d455r_height], true);
    }
}

module RacecarFrontCoverCenter() {
    
    rfcc_wall_screw_height = (rfcc_rff_wall_front_left_x - rfcc_rff_wall_back_left_x);
    rfcc_wall_screw_x_offset = (rfcc_rff_wall_front_left_x + rfcc_rff_wall_back_left_x)/2.0;
    rfcc_wall_screw_y_offset = (rfcc_rff_wall_front_left_y + rfcc_rff_wall_front_right_y)/2.0;
    rfcc_wall_screw_z_offset = (rfcc_rff_wall_front_left_z + rfcc_rff_cover_front_left_z)/2.0;

    /*
    translate([rfcc_t265_mount_screw_x_offset+8,(rfcc_t265_mount_screw_left_y_offset+rfcc_t265_mount_screw_right_y_offset)/2.0, rfcc_t265_mount_screw_z_offset]) {
       cube([12.5,108,24.5], true);
    } 

    translate([rfcc_camera_mount_screw_x_offset+15,0.0,rfcc_camera_mount_screw_z_offset]) {
        cube([25,90,25], true);
    }
    echo(rfcc_camera_cutout_back_left_top_y-rfcc_camera_cutout_back_right_top_y);
    echo(rfcc_camera_cutout_front_left_top_y-rfcc_camera_cutout_front_right_top_y);
    */
    difference() {
        union() {
            difference() {
                polyhedron(points=[
                [rfcc_rbct_left_top_x,rfcc_rbct_left_top_y,rfcc_rbct_left_top_z], // 0
                [rfcc_rbct_left_bottom_x,rfcc_rbct_left_bottom_y,rfcc_rbct_left_bottom_z], // 1
                [rfcc_rbct_right_top_x,rfcc_rbct_right_top_y,rfcc_rbct_right_top_z], // 2
                [rfcc_rbct_right_bottom_x,rfcc_rbct_right_bottom_y,rfcc_rbct_right_bottom_z], // 3
                [rfcc_rff_cover_front_left_x,rfcc_rff_cover_front_left_y,rfcc_rff_cover_front_left_z], // 4 
                [rfcc_rff_cover_front_right_x,rfcc_rff_cover_front_right_y,rfcc_rff_cover_front_right_z], // 5
                [rfcc_rff_cover_back_left_x,rfcc_rff_cover_back_left_y,rfcc_rff_cover_back_left_z], // 6
                [rfcc_rff_cover_back_right_x,rfcc_rff_cover_back_right_y,rfcc_rff_cover_back_right_z]], // 7
                faces=[[0,2,3,1],[0,4,5,2],[1,3,7,6],[0,1,6,4],[3,2,5,7],[4,6,7,5]]);
                
                scale([0.9999,1.05,1.001]) { // Hack - shouldn't have to rescale or translate
                    translate([0.00,0.0,-0.03]){
                        RacecarFrontCoverCenterCutout();
                    }
                } 
                scale([1.0,1.0,1.0]) { // Hack - shouldn't have to rescale or translate
                    translate([0.00,0.0,-0.0]){
                        RacecarFrontCoverCenterCutout();
                    }
                }                 
                
            }
            
            polyhedron(points=[
            [rfcc_rff_cover_front_left_x,rfcc_rff_cover_front_left_y,rfcc_rff_cover_front_left_z], // 0 
            [rfcc_rff_cover_front_right_x,rfcc_rff_cover_front_right_y,rfcc_rff_cover_front_right_z], // 1
            [rfcc_rff_cover_back_left_x,rfcc_rff_cover_back_left_y,rfcc_rff_cover_back_left_z], // 2
            [rfcc_rff_cover_back_right_x,rfcc_rff_cover_back_right_y,rfcc_rff_cover_back_right_z], // 3
            [rfcc_rff_wall_front_left_x,rfcc_rff_wall_front_left_y,rfcc_rff_wall_front_left_z], // 4
            [rfcc_rff_wall_front_right_x,rfcc_rff_wall_front_right_y,rfcc_rff_wall_front_right_z], // 5
            [rfcc_rff_wall_back_left_x,rfcc_rff_wall_back_left_y,rfcc_rff_wall_back_left_z], // 6
            [rfcc_rff_wall_back_right_x,rfcc_rff_wall_back_right_y,rfcc_rff_wall_back_right_z], // 7            
            ],faces=[[0,1,3,2],[2,3,7,6],[0,4,5,1],[0,2,6,4],[1,5,7,3],[4,6,7,5]]);
            
            polyhedron(points=[
            [rfcc_camera_mount_left_top_x,rfcc_camera_mount_left_top_y,rfcc_camera_mount_left_top_z],
            [rfcc_camera_mount_left_bottom_x,rfcc_camera_mount_left_bottom_y,rfcc_camera_mount_left_bottom_z],
            [rfcc_camera_mount_right_top_x,rfcc_camera_mount_right_top_y,rfcc_camera_mount_right_top_z],
            [rfcc_camera_mount_right_bottom_x,rfcc_camera_mount_right_bottom_y,rfcc_camera_mount_right_bottom_z],  
            [rfcc_camera_cutout_back_left_top_x,rfcc_camera_cutout_back_left_top_y,rfcc_camera_cutout_back_left_top_z],
            [rfcc_camera_cutout_back_right_top_x,rfcc_camera_cutout_back_right_top_y,rfcc_camera_cutout_back_right_top_z],
            [rfcc_camera_cutout_back_left_top_x,rfcc_camera_cutout_back_left_top_y,rfcc_camera_mount_left_bottom_z],
            [rfcc_camera_cutout_back_right_top_x,rfcc_camera_cutout_back_right_top_y,rfcc_camera_mount_right_bottom_z]],
            faces=[[0,2,3,1],[5,4,6,7],[2,0,4,5],[1,3,7,6],[4,0,1,6],[3,2,5,7]]);
            
            polyhedron(points=[
            [rfcc_camera_cutout_front_left_top_x,rfcc_camera_cutout_front_left_top_y,rfcc_camera_cutout_front_left_top_z],
            [rfcc_camera_cutout_front_left_bottom_x,rfcc_camera_cutout_front_left_bottom_y,rfcc_camera_cutout_front_left_bottom_z],
            [rfcc_camera_cutout_front_right_top_x,rfcc_camera_cutout_front_right_top_y,rfcc_camera_cutout_front_right_top_z],
            [rfcc_camera_cutout_front_right_bottom_x,rfcc_camera_cutout_front_right_bottom_y,rfcc_camera_cutout_front_right_bottom_z], 
            [rfcc_camera_cutout_back_left_top_x,rfcc_camera_cutout_back_left_top_y,rfcc_camera_mount_left_bottom_z],
            [rfcc_camera_cutout_back_right_top_x,rfcc_camera_cutout_back_right_top_y,rfcc_camera_mount_right_bottom_z],
            [rfcc_camera_cutout_back_left_top_x,rfcc_camera_cutout_back_left_top_y,rfcc_camera_cutout_front_left_top_z],
            [rfcc_camera_cutout_back_right_top_x,rfcc_camera_cutout_back_right_top_y,rfcc_camera_cutout_front_right_top_z]],
            faces=[[0,1,3,2],[5,4,6,7],[3,1,4,5],[0,2,7,6],[1,0,6,4],[2,3,5,7]]);
            
            if (_build_neopixel_headlight)  {
                NeoPixelHeadlightMount();
            }
            if (_build_trinket_mcu)  {
                translate([trinket_origin_x, trinket_origin_y, trinket_origin_z]) {
                    rotate([180, 0, 0]) {
                        AdafruitTrinketMountingBase(
                            mounting_width = 22,
                            base_thickness = 4,
                            stud_height = 5,
                            lip_height = 1);
                    }
                }
            }
        }
        
        // Add mounting holes for Trinket M0 MCU board:
        if (_build_trinket_mcu)  {
            translate([trinket_origin_x, trinket_origin_y, trinket_origin_z]) {
                rotate([180, 0, 0]) {
                    AdafruitTrinketMountingHoles(screw_depth = 8.5);
                }
            }
        }

        if (_build_neopixel_headlight) {
        // Remove Volume (with clearance) for mounting of NeoPixel Headlight Enclosure back part to hood:        
            translate(neopixel_headlight_position) {
                rotate([0, 90, 0]) {
                    rotate([0, 0, 90]) {
                        NeopixelCaseCutoutRegion(screw_case = true, xy_center = true, clearance = 0.6);
                    }
                }
            }
        // Remove hole for wiring harness through hood, bulge, and into Neopixel Enclosure back part:        
            translate(neopixel_headlight_position - [5, 0, 0]) {
                rotate([0, 90, 0]) {
                    rotate([0, 0, 90]) {
                        HarnessCutoutRegionExtended(length = 45, xy_center = true);
                        MountingScrewsCutoutRegion(screw_depth = 8, xy_center = true,
                            case_thickness = headlight_assy_thickness);
                    }
                }
            }
        }

        translate([rfcc_wall_screw_x_offset, rfcc_wall_screw_y_offset, rfcc_wall_screw_z_offset]) {
            scale([1.001,1,1]) {
                rotate([0,90,0]) {
                    _m2_5_flathead_screw(rfcc_wall_screw_height);
                }
            }
        }

        RacecarFrontCoverCenterNumber();
        
        translate([rfcc_camera_mount_screw_x_offset, rfcc_camera_mount_screw_left_y_offset, rfcc_camera_mount_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcc_camera_mount_screw_height, _m3_screw_shaft_radius, _m3_screw_shaft_radius, true, $fn=_fn_val);
            }
        }
        translate([rfcc_camera_mount_screw_x_offset, rfcc_camera_mount_screw_right_y_offset, rfcc_camera_mount_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcc_camera_mount_screw_height, _m3_screw_shaft_radius, _m3_screw_shaft_radius, true, $fn=_fn_val);
            }
        } 
       
        translate([rfcc_t265_mount_screw_x_offset, rfcc_t265_mount_screw_left_y_offset, rfcc_t265_mount_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcc_t265_mount_screw_height, _m3_screw_shaft_radius, _m3_screw_shaft_radius, true, $fn=_fn_val);
            }
        }
        translate([rfcc_t265_mount_screw_x_offset, rfcc_t265_mount_screw_right_y_offset, rfcc_t265_mount_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcc_t265_mount_screw_height, _m3_screw_shaft_radius, _m3_screw_shaft_radius, true, $fn=_fn_val);
            }
        }        

        translate([rfcc_d455_mount_screw_x_offset, rfcc_d455_mount_screw_right_y_offset, rfcc_d455_mount_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcc_d455_mount_screw_height, _m4_screw_shaft_radius, _m4_screw_shaft_radius, true, $fn=_fn_val);
            }
        }
       
        translate([rfcc_d455_mount_screw_x_offset, rfcc_d455_mount_screw_left_y_offset, rfcc_d455_mount_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcc_d455_mount_screw_height, _m4_screw_shaft_radius, _m4_screw_shaft_radius, true, $fn=_fn_val);
            }
        }      

        translate([rfcc_d455_head_screw_x_offset, rfcc_d455_head_screw_right_y_offset, rfcc_d455_head_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcc_d455_head_screw_height, 7.5/2, 7.5/2, true, $fn=_fn_val);
            }
        }
       
        translate([rfcc_d455_head_screw_x_offset, rfcc_d455_head_screw_left_y_offset, rfcc_d455_head_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcc_d455_head_screw_height, 7.5/2, 7.5/2, true, $fn=_fn_val);
            }
        }       
 
        translate([0,10,-15.0]) {
            RacecarFrontCoverCenterUSB();
        }
    }
    
}

module RacecarFrontCoverCenterNumber() {
    translate([rfcc_number_x_offset,rfcc_number_y_offset,rfcc_number_z_offset]) {
        rotate([rfcc_number_x_rotation,rfcc_number_y_rotation,rfcc_number_z_rotation]) {
            RacecarCoverNumber();
        }
    }    
}

module RacecarFrontCoverCenterT265Plate() {
    
    difference() {
        union() {
            translate([rfcct265p_base_x_offset, rfcct265p_base_y_offset, rfcct265p_base_z_offset]) {
                cube([rfcct265p_base_length, rfcct265p_base_width, rfcct265p_base_height + 5], true);
            } //base_height increased to fit D455 + T265
            /*
            translate([rfcct265p_extra_x_offset,rfcct265p_extra_y_offset,rfcct265p_extra_z_offset,]){
                cube([rfcct265p_extra_length,rfcct265p_extra_width,rfcct265p_extra_height], true);
            }
            */
        }
        translate([rfcct265p_base_x_offset,rfcc_t265_mount_screw_left_y_offset,rfcc_t265_mount_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcct265p_base_length, _m3_screw_shaft_radius, _m3_screw_shaft_radius, true, $fn=_fn_val);
            }
        }
        translate([rfcct265p_base_x_offset,rfcc_t265_mount_screw_right_y_offset,rfcc_t265_mount_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcct265p_base_length, _m3_screw_shaft_radius, _m3_screw_shaft_radius, true, $fn=_fn_val);
            }
        }
        translate([rfcct265p_base_x_offset,rfcc_camera_mount_screw_left_y_offset,rfcc_t265_mount_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcct265p_base_length, _m3_screw_shaft_radius, _m3_screw_shaft_radius, true, $fn=_fn_val);
            }
        }
        translate([rfcct265p_base_x_offset,rfcc_camera_mount_screw_right_y_offset,rfcc_t265_mount_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcct265p_base_length, _m3_screw_shaft_radius, _m3_screw_shaft_radius, true, $fn=_fn_val);
            }
        } 
 
         translate([rfcct265p_base_x_offset,rfcc_t265_mount_screw_left_y_offset,rfcct265p_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcct265p_base_length, _m3_screw_shaft_radius, _m3_screw_shaft_radius, true, $fn=_fn_val);
            }
        }
        translate([rfcct265p_base_x_offset,rfcc_t265_mount_screw_right_y_offset,rfcct265p_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcct265p_base_length, _m3_screw_shaft_radius, _m3_screw_shaft_radius, true, $fn=_fn_val);
            }
        }
        translate([rfcct265p_base_x_offset,rfcc_camera_mount_screw_left_y_offset,rfcct265p_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcct265p_base_length, _m3_screw_shaft_radius, _m3_screw_shaft_radius, true, $fn=_fn_val);
            }
        }
        translate([rfcct265p_base_x_offset,rfcc_camera_mount_screw_right_y_offset,rfcct265p_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcct265p_base_length, _m3_screw_shaft_radius, _m3_screw_shaft_radius, true, $fn=_fn_val);
            }
        }  
        /*
        translate([rfcct265p_extra_screw_x_offset,rfcct265p_extra_screw_left_y_offset,rfcct265p_extra_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcct265p_base_length, _m3_screw_shaft_radius, _m3_screw_shaft_radius, true, $fn=_fn_val);
            }
        }
        translate([rfcct265p_extra_screw_x_offset,rfcct265p_extra_screw_right_y_offset,rfcct265p_extra_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcct265p_base_length, _m3_screw_shaft_radius, _m3_screw_shaft_radius, true, $fn=_fn_val);
            }
        } 
        */
  
        //d455 screwholes
          translate([rfcc_d455_mount_screw_x_offset, rfcc_d455_mount_screw_right_y_offset, rfcc_d455_mount_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcc_d455_mount_screw_height+20, _m4_screw_shaft_radius, _m4_screw_shaft_radius, true, $fn=_fn_val);
            }
        }
       
        translate([rfcc_d455_mount_screw_x_offset, rfcc_d455_mount_screw_left_y_offset, rfcc_d455_mount_screw_z_offset]) {
            rotate([0,90,0]) {
                cylinder(rfcc_d455_mount_screw_height+20, _m4_screw_shaft_radius, _m4_screw_shaft_radius, true, $fn=_fn_val);
            }
        }      
      
    }
}