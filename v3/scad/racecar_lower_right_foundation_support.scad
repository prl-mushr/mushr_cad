$include_rfs = true;
include <racecar_foundation_support.scad>

$include_rsc = true;
include <racecar_servo_cage.scad>

rlrfs_length = 60;
rlrfs_width = 9;
rlrfs_height = rsc_height-3.67;

rlrfs_wrt_rcb_x_offset = rcb_body_screw_back_x_offset - rlrfs_length/2.0-26.5;
rlrfs_wrt_rcb_y_offset = rcb_body_screw_y_offset-rlrfs_width/2.0-40.67;
rlrfs_wrt_rcb_z_offset = rcb_height/2.0 - rlrfs_height/2.0;

rlrfs_screw_height = 10.0;

if ($include_rlrfs==undef) {
    RacecarLowerRightFoundationSupport();
}

module RacecarLowerRightFoundationSupport() {
        RacecarFoundationSupport(rlrfs_screw_height, rlrfs_length, rlrfs_width, rlrfs_height);
}