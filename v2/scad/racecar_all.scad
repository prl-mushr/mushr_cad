// Doesn't matter if these vars are false or false, 
// they just have to be defined
$include_rcb = false;
include <racecar_crossbar_body.scad>

$include_rs = true;
include <racecar_scaffold.scad>

$include_rjtx2 = true;
include <racecar_jetson_tx2.scad>

$include_rcs = true;
include <racecar_camera_stand.scad>

$include_rbc = true;
include <racecar_back_cover.scad>

$include_rfc = true;
include <racecar_front_cover.scad>

$include_rc = false;
include <../../chassis/racecar_chassis.scad>

$include_rsm = false;
include <racecar_servo_motor.scad>

$include_rb = false;
include <racecar_battery.scad>

$include_rusbh = true;
include <racecar_usb_hub.scad>

$include_ry = false;
include <racecar_ydlidar.scad>


draw_racecar_crossbar_body = false;
draw_racecar_back_foundation = true;
draw_racecar_front_foundation = true;
draw_racecar_imu = false;
draw_racecar_foundation_bar = true;
draw_racecar_jetson_tx2 = false;
draw_racecar_camera_mount = true;
draw_racecar_camera_stand = false;
draw_racecar_scaffold = true;
draw_racecar_usb_hub = false;
draw_racecar_upper_left_foundation_support = true;
draw_racecar_lower_left_foundation_support = true;
draw_racecar_lower_right_foundation_support = true;
draw_racecar_servo_cage = true;
draw_racecar_crossbar_upper_support = true;
draw_racecar_crossbar_bottom_support = true;
draw_racecar_back_cover = true;
draw_racecar_front_cover = true;
draw_racecar_chassis = false; // Takes a long time
draw_racecar_front_racecar_chassis_gearbox_spring_plate = false;
draw_racecar_back_racecar_chassis_gearbox_spring_plate = false;
draw_racecar_front_left_racecar_chassis_wheel = false;
draw_racecar_front_right_racecar_chassis_wheel = false;
draw_racecar_back_left_racecar_chassis_wheel = false;
draw_racecar_back_right_racecar_chassis_wheel = false;
draw_racecar_servo_motor_body = false;
draw_racecar_servo_motor_arm = false;
draw_racecar_servo_motor_arm_link = false;
draw_racecar_battery_chassis = false;
draw_racecar_battery_foundation_left = false;
draw_racecar_battery_foundation_right = false;
draw_racecar_d435 = false;
draw_racecar_ydlidar = false;
draw_racecar_back_cover_left_image = false;
draw_racecar_back_cover_right_image = false;
draw_racecar_front_cover_center_number = false;

RacecarAll();

module RacecarAll() {
    
    if(draw_racecar_crossbar_body) {
        translate([0.0,0.0,0.0]) {
            RacecarCrossbarBody();
        }
    }

    if(draw_racecar_back_foundation) {
        translate([rbf_wrt_rcb_x_offset, rbf_wrt_rcb_y_offset, rbf_wrt_rcb_z_offset]) {
            RacecarBackFoundation();
        }
    }
    
    if(draw_racecar_front_foundation) {
        translate([rff_wrt_rcb_x_offset, rff_wrt_rcb_y_offset, rff_wrt_rcb_z_offset]) {
            RacecarFrontFoundation();
        }
    }

    if(draw_racecar_imu) {
        translate([rff_wrt_rcb_x_offset+rff_imu_x_offset, rff_wrt_rcb_y_offset+rff_imu_y_offset, rff_wrt_rcb_z_offset+rff_imu_z_offset]) {
            RacecarIMU();
        }        
    }
    
    if(draw_racecar_foundation_bar) {
        translate([rff_wrt_rcb_x_offset + rff_foundation_bar_x_offset,rff_wrt_rcb_y_offset + rff_foundation_bar_y_offset,rff_wrt_rcb_z_offset + rff_foundation_bar_z_offset]) {
            RacecarFoundationBar();
        }
    }

    if(draw_racecar_jetson_tx2) {
        translate([rjtx2_wrt_rcb_x_offset, rjtx2_wrt_rcb_y_offset, rjtx2_wrt_rcb_z_offset]) {
            RacecarJetsonTX2();
        }
    }

    if(draw_racecar_camera_mount) {
        translate([rcm_wrt_rcb_x_offset,rcm_wrt_rcb_y_offset,rcm_wrt_rcb_z_offset]) {
            RacecarCameraMount();
        }
    }


    echo("Camera stand", 
        rcs_wrt_rcb_x_offset, 
        rcs_wrt_rcb_y_offset, 
        rcs_wrt_rcb_z_offset+rcs_height/2.0);
    if(draw_racecar_camera_stand) {
        translate([rcs_wrt_rcb_x_offset, rcs_wrt_rcb_y_offset, rcs_wrt_rcb_z_offset]) {
            RacecarCameraStand();
        }
    }

    if(draw_racecar_scaffold) {
        translate([rbf_wrt_rcb_x_offset+rs_wrt_rbf_x_offset,rbf_wrt_rcb_y_offset+rs_wrt_rbf_y_offset,rbf_wrt_rcb_z_offset+rs_wrt_rbf_z_offset]) {
            RacecarScaffold();
        }
    }

    if(draw_racecar_usb_hub) {
        translate([rusbh_wrt_rcb_x_offset, rusbh_wrt_rcb_y_offset, rusbh_wrt_rcb_z_offset]) {
            RacecarUSBHub();
        }
    }

    if(draw_racecar_upper_left_foundation_support) {
        translate([rulfs_wrt_rcb_x_offset, rulfs_wrt_rcb_y_offset, rulfs_wrt_rcb_z_offset]) {
            RacecarUpperLeftFoundationSupport();
        }
    }
    
    if(draw_racecar_lower_left_foundation_support) {
        translate([rllfs_wrt_rcb_x_offset, rllfs_wrt_rcb_y_offset, rllfs_wrt_rcb_z_offset]) {
            RacecarLowerLeftFoundationSupport();
        }
    }
    
    if(draw_racecar_lower_right_foundation_support) {
        translate([rlrfs_wrt_rcb_x_offset, rlrfs_wrt_rcb_y_offset, rlrfs_wrt_rcb_z_offset]) {
            RacecarLowerRightFoundationSupport();
        }    
    }
    
    if(draw_racecar_servo_cage) {
        translate([rsc_wrt_rcb_x_offset, rsc_wrt_rcb_y_offset, rsc_wrt_rcb_z_offset]) {
            RacecarServoCage();
        }
    }
    
    if(draw_racecar_crossbar_upper_support) {
        translate([rcus_wrt_rcb_x_offset, rcus_wrt_rcb_y_offset, rcus_wrt_rcb_z_offset]) {
            RacecarCrossbarUpperSupport();
        }
    }
    
    if(draw_racecar_crossbar_bottom_support) {
        translate([rcbs_wrt_rcb_x_offset, rcbs_wrt_rcb_y_offset, rcbs_wrt_rcb_z_offset]) {
            RacecarCrossbarBottomSupport();
        }    
    }

    if(draw_racecar_back_cover) {
        translate([rbf_wrt_rcb_x_offset, rbf_wrt_rcb_y_offset, rbf_wrt_rcb_z_offset]) {
            RacecarBackCover();
        }
    }

    if(draw_racecar_front_cover) {
        translate([rfc_wrt_rcb_x_offset, rfc_wrt_rcb_y_offset, rfc_wrt_rcb_z_offset]) {
            RacecarFrontCover();
        }
    }

    if(draw_racecar_chassis) {
        translate([rc_wrt_rcb_x_offset, rc_wrt_rcb_y_offset, rc_wrt_rcb_z_offset]) {
            RacecarChassis();
        }
    }
    
    if(draw_racecar_back_racecar_chassis_gearbox_spring_plate) {
        translate([rc_wrt_rcb_x_offset+rc_back_gearbox_x_offset,rc_wrt_rcb_y_offset+rc_back_gearbox_y_offset,rc_wrt_rcb_z_offset+rc_back_gearbox_z_offset]) {
            RacecarChassisGearboxSpringPlate();
        }     
    }
    
    if(draw_racecar_front_racecar_chassis_gearbox_spring_plate) {
        translate([rc_wrt_rcb_x_offset+rc_front_gearbox_x_offset,rc_wrt_rcb_y_offset+rc_front_gearbox_y_offset,rc_wrt_rcb_z_offset+rc_front_gearbox_z_offset]) {
            rotate([0,0,180]) {
                RacecarChassisGearboxSpringPlate();
            }
        }   
    }

    echo("Front right wheel", 
        rc_wrt_rcb_x_offset+rc_wheel_front_x_offset, 
        rc_wrt_rcb_y_offset+rc_wheel_right_y_offset, 
        rc_wrt_rcb_z_offset+rc_wheel_z_offset);
    if(draw_racecar_front_right_racecar_chassis_wheel) {
        translate([rc_wrt_rcb_x_offset+rc_wheel_front_x_offset, rc_wrt_rcb_y_offset+rc_wheel_right_y_offset, rc_wrt_rcb_z_offset+rc_wheel_z_offset]) {
            RacecarChassisWheel();
        }    
    }

    echo("Front left wheel", 
        rc_wrt_rcb_x_offset+rc_wheel_front_x_offset, 
        rc_wrt_rcb_y_offset+rc_wheel_left_y_offset, 
        rc_wrt_rcb_z_offset+rc_wheel_z_offset);
    if(draw_racecar_front_left_racecar_chassis_wheel) {
        translate([rc_wrt_rcb_x_offset+rc_wheel_front_x_offset, rc_wrt_rcb_y_offset+rc_wheel_left_y_offset, rc_wrt_rcb_z_offset+rc_wheel_z_offset]) {
            rotate([0,0,180]) {
                RacecarChassisWheel(false);
            }
        }     
    }

    echo("Back left wheel", 
        rc_wrt_rcb_x_offset+rc_wheel_back_x_offset, 
        rc_wrt_rcb_y_offset+rc_wheel_left_y_offset, 
        rc_wrt_rcb_z_offset+rc_wheel_z_offset);
    if(draw_racecar_back_left_racecar_chassis_wheel) {
        translate([rc_wrt_rcb_x_offset+rc_wheel_back_x_offset, rc_wrt_rcb_y_offset+rc_wheel_left_y_offset, rc_wrt_rcb_z_offset+rc_wheel_z_offset]) {
            rotate([0,0,180]) {
                RacecarChassisWheel();
            }
        }  
    }
 
    echo("Back right wheel", 
        rc_wrt_rcb_x_offset+rc_wheel_back_x_offset, 
        rc_wrt_rcb_y_offset+rc_wheel_right_y_offset, 
        rc_wrt_rcb_z_offset+rc_wheel_z_offset);    
    if(draw_racecar_back_right_racecar_chassis_wheel) {
        translate([rc_wrt_rcb_x_offset+rc_wheel_back_x_offset, rc_wrt_rcb_y_offset+rc_wheel_right_y_offset, rc_wrt_rcb_z_offset+rc_wheel_z_offset]) {
            RacecarChassisWheel(false);
        } 
    }
    
    if(draw_racecar_servo_motor_body) {
        translate([rsm_wrt_rcb_x_offset,rsm_wrt_rcb_y_offset,rsm_wrt_rcb_z_offset]) {
            RacecarServoMotorBody();
        }
    }
    
    if(draw_racecar_servo_motor_arm) {
        translate([rsm_wrt_rcb_x_offset,rsm_wrt_rcb_y_offset,rsm_wrt_rcb_z_offset]) {
            RacecarServoMotorArm();
        }
    }    
    
    if(draw_racecar_servo_motor_arm_link) {
        translate([rsm_wrt_rcb_x_offset,rsm_wrt_rcb_y_offset,rsm_wrt_rcb_z_offset]) {
            RacecarServoMotorArmLink();
        }
    }    
    
    if(draw_racecar_battery_chassis) {
        translate([rb_chassis_wrt_rcb_x_offset, rb_chassis_wrt_rcb_y_offset, rb_chassis_wrt_rcb_z_offset]) {
            RacecarBattery();
        }
    }
    
    if(draw_racecar_battery_foundation_left) {
        translate([rb_foundation_left_wrt_rcb_x_offset, rb_foundation_left_wrt_rcb_y_offset, rb_foundation_left_wrt_rcb_z_offset]) {
            RacecarBattery();
        }
    }    
    
    if(draw_racecar_battery_foundation_right) {
        translate([rb_foundation_right_wrt_rcb_x_offset, rb_foundation_right_wrt_rcb_y_offset, rb_foundation_right_wrt_rcb_z_offset]) {
            RacecarBattery();
        }
    }        
    
    /*
     echo("D435: ", 
        rd435_wrt_rcb_x_offset, 
        rd435_wrt_rcb_y_offset,
        rd435_wrt_rcb_z_offset);   
    if(draw_racecar_d435) {
        translate([rd435_wrt_rcb_x_offset, rd435_wrt_rcb_y_offset, rd435_wrt_rcb_z_offset]) {
            RacecarD435();
        }
    }
    */
    
    echo("YDLidar: ", 
        ry_wrt_rcb_x_offset, 
        ry_wrt_rcb_y_offset,
        ry_wrt_rcb_z_offset);
    if(draw_racecar_ydlidar) {
        translate([ry_wrt_rcb_x_offset, ry_wrt_rcb_y_offset, ry_wrt_rcb_z_offset]) {
            RacecarYDLidar();
        }
    }
    
    if(draw_racecar_back_cover_left_image) {
        translate([rbf_wrt_rcb_x_offset, rbf_wrt_rcb_y_offset, rbf_wrt_rcb_z_offset]) {
            RacecarBackCoverLeftImage();
        }
    }    
    
    if(draw_racecar_back_cover_right_image) {
        translate([rbf_wrt_rcb_x_offset, rbf_wrt_rcb_y_offset, rbf_wrt_rcb_z_offset]) {
            RacecarBackCoverRightImage();
        }    
    }    
    
    if(draw_racecar_front_cover_center_number) {
        translate([rff_wrt_rcb_x_offset, rff_wrt_rcb_y_offset, rff_wrt_rcb_z_offset]) {
            RacecarFrontCoverCenterNumber();
        }  
    }    
    
}