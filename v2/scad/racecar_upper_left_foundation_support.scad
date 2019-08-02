$include_rfs = true;
include <racecar_foundation_support.scad>

$include_rcb = true;
include <racecar_crossbar_body.scad>

rulfs_length = 12.5;
rulfs_width = 40.0;
rulfs_height = 28.87 + rcus_height;

rulfs_wrt_rcb_x_offset = rcb_length/2.0-rulfs_length/2.0-13.3;
rulfs_wrt_rcb_y_offset = rcb_width/2.0+rulfs_width/2.0+0.1;
rulfs_wrt_rcb_z_offset = rcb_height/2.0-rulfs_height/2.0;

if ($include_rulfs==undef) {
    RacecarUpperLeftFoundationSupport();
}

module RacecarUpperLeftFoundationSupport() {
    rotate([0,0,90]) {
        RacecarFoundationSupport(rulfs_width, rulfs_length, rulfs_height);
    }
}