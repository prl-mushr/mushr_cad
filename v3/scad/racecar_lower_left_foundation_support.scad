$include_rfs = true;
include <racecar_foundation_support.scad>

$include_rcb = true;
include <racecar_crossbar_body.scad>

rllfs_length = 23;
rllfs_width = 20.0;
rllfs_height = 28.87 + rcus_height;

rllfs_wrt_rcb_x_offset = -rcb_length/2.0-rllfs_length/2.0+13.5;
rllfs_wrt_rcb_y_offset = rcb_width/2.0+rllfs_width/2.0+22.0;
rllfs_wrt_rcb_z_offset = rcb_height/2.0-rllfs_height/2.0;

rllfs_screw_height = 10.0;

if ($include_rllfs==undef) {
    RacecarLowerLeftFoundationSupport();
}

module RacecarLowerLeftFoundationSupport() {
        RacecarFoundationSupport(rllfs_screw_height, rllfs_length, rllfs_width, rllfs_height);
}