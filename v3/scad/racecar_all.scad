// Doesn't matter if these vars are false or false, 
// they just have to be defined
$include_rcb = false;
include <racecar_crossbar_body.scad>

$include_rbcls = false;
include <racecar_back_cover_left_side.scad>

$include_rbcrs = false;
include <racecar_back_cover_right_side.scad>

$include_rfcbls = false;
include <racecar_front_cover_back_left_side.scad>

$include_rfcbrs = false;
include <racecar_front_cover_back_right_side.scad>

$include_rc = false;
include <../../chassis/racecar_chassis.scad>

$include_rsm = false;
include <racecar_servo_motor.scad>

$include_rb = false;
include <racecar_battery.scad>

$include_rjn = false;
include <racecar_jetson_nano.scad>

$include_rd435 = false;
include <racecar_d435.scad>

$include_ry = false;
include <racecar_ydlidar.scad>

draw_racecar_crossbar_body = false;
draw_racecar_back_foundation = true;
draw_racecar_front_foundation = true;
draw_racecar_upper_left_foundation_support = true;
draw_racecar_lower_left_foundation_support = true;
draw_racecar_lower_right_foundation_support = true;
draw_racecar_servo_cage = true;
draw_racecar_crossbar_upper_support = true;
draw_racecar_crossbar_bottom_support = true;
draw_racecar_back_cover_left_side = true;
draw_racecar_back_cover_right_side = true;
draw_racecar_back_cover_top = true;
draw_racecar_front_cover_back_left_side = true;
draw_racecar_front_cover_front_left_side = true;
draw_racecar_front_cover_center = true;
draw_racecar_front_cover_back_right_side = true;
draw_racecar_front_cover_front_right_side = true;
draw_racecar_chassis = false; // Takes a long time
draw_racecar_front_racecar_chassis_gearbox_spring_plate = false;
draw_racecar_back_racecar_chassis_gearbox_spring_plate = false;
draw_racecar_front_left_racecar_chassis_wheel_tire = false;
draw_racecar_front_left_racecar_chassis_wheel_hub = false;
draw_racecar_front_right_racecar_chassis_wheel_tire = false;
draw_racecar_front_right_racecar_chassis_wheel_hub = false;
draw_racecar_back_left_racecar_chassis_wheel_tire = false;
draw_racecar_back_left_racecar_chassis_wheel_hub = false;
draw_racecar_back_right_racecar_chassis_wheel_tire = false;
draw_racecar_back_right_racecar_chassis_wheel_hub = false;
draw_racecar_servo_motor_body = false;
draw_racecar_servo_motor_arm = false;
draw_racecar_servo_motor_arm_link = false;
draw_racecar_battery_chassis = false;
draw_racecar_battery_chassis_sticker = false;
draw_racecar_battery_foundation_left = false;
draw_racecar_battery_foundation_left_sticker = false;
draw_racecar_battery_foundation_right = false;
draw_racecar_battery_foundation_right_sticker = false;
draw_racecar_jetson_nano = false;
draw_racecar_d435 = false;
draw_racecar_d435_screen = false;
draw_racecar_ydlidar_top = false;
draw_racecar_ydlidar_motor = false;
draw_racecar_ydlidar_mount = false;
draw_racecar_back_cover_left_side_image = false;
draw_racecar_back_cover_right_side_image = false;
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
    
    if(draw_racecar_back_cover_left_side) {
        translate([rbf_wrt_rcb_x_offset, rbf_wrt_rcb_y_offset, rbf_wrt_rcb_z_offset]) {
            RacecarBackCoverLeftSide();
        }
    }
    
    if(draw_racecar_back_cover_left_side_image) {
        translate([rbf_wrt_rcb_x_offset, rbf_wrt_rcb_y_offset, rbf_wrt_rcb_z_offset]) {
            RacecarBackCoverLeftSideImage();
        }
    }    
    
    if(draw_racecar_back_cover_right_side) {
        translate([rbf_wrt_rcb_x_offset, rbf_wrt_rcb_y_offset, rbf_wrt_rcb_z_offset]) {
            RacecarBackCoverRightSide();
        }    
    }
    
    if(draw_racecar_back_cover_right_side_image) {
        translate([rbf_wrt_rcb_x_offset, rbf_wrt_rcb_y_offset, rbf_wrt_rcb_z_offset]) {
            RacecarBackCoverRightSideImage();
        }    
    }    
    
    if(draw_racecar_back_cover_top) {
        translate([rbf_wrt_rcb_x_offset+rbct_wrt_rbf_x_offset, rbf_wrt_rcb_y_offset+rbct_wrt_rbf_y_offset, rbf_wrt_rcb_z_offset+rbct_wrt_rbf_z_offset]) {
            RacecarBackCoverTop();
        }    
    }
    
    if(draw_racecar_front_cover_back_left_side) {
        translate([rff_wrt_rcb_x_offset, rff_wrt_rcb_y_offset, rff_wrt_rcb_z_offset]) {
            RacecarFrontCoverBackLeftSide();
        }
    }
    
    if(draw_racecar_front_cover_front_left_side) {
        translate([rff_wrt_rcb_x_offset, rff_wrt_rcb_y_offset, rff_wrt_rcb_z_offset]) {
            RacecarFrontCoverFrontLeftSide();
        }    
    }
    
    if(draw_racecar_front_cover_center) {
        translate([rff_wrt_rcb_x_offset, rff_wrt_rcb_y_offset, rff_wrt_rcb_z_offset]) {
            RacecarFrontCoverCenter();
        }  
    }
    
    if(draw_racecar_front_cover_back_right_side) {
        translate([rff_wrt_rcb_x_offset, rff_wrt_rcb_y_offset, rff_wrt_rcb_z_offset]) {
            RacecarFrontCoverBackRightSide();
        }
    }
    
    if(draw_racecar_front_cover_front_right_side) {
        translate([rff_wrt_rcb_x_offset, rff_wrt_rcb_y_offset, rff_wrt_rcb_z_offset]) {
            RacecarFrontCoverFrontRightSide();
        }  
    }
    
    if(draw_racecar_front_cover_center_number) {
        translate([rff_wrt_rcb_x_offset, rff_wrt_rcb_y_offset, rff_wrt_rcb_z_offset]) {
            RacecarFrontCoverCenterNumber();
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
    if(draw_racecar_front_right_racecar_chassis_wheel_tire) {
        translate([rc_wrt_rcb_x_offset+rc_wheel_front_x_offset, rc_wrt_rcb_y_offset+rc_wheel_right_y_offset, rc_wrt_rcb_z_offset+rc_wheel_z_offset]) {
            RacecarChassisWheelTire();
        }    
    }
    if(draw_racecar_front_right_racecar_chassis_wheel_hub) {
        translate([rc_wrt_rcb_x_offset+rc_wheel_front_x_offset, rc_wrt_rcb_y_offset+rc_wheel_right_y_offset, rc_wrt_rcb_z_offset+rc_wheel_z_offset]) {
            RacecarChassisWheelHub();
        }    
    }    

    echo("Front left wheel", 
        rc_wrt_rcb_x_offset+rc_wheel_front_x_offset, 
        rc_wrt_rcb_y_offset+rc_wheel_left_y_offset, 
        rc_wrt_rcb_z_offset+rc_wheel_z_offset);
    if(draw_racecar_front_left_racecar_chassis_wheel_tire) {
        translate([rc_wrt_rcb_x_offset+rc_wheel_front_x_offset, rc_wrt_rcb_y_offset+rc_wheel_left_y_offset, rc_wrt_rcb_z_offset+rc_wheel_z_offset]) {
            rotate([0,0,180]) {
                RacecarChassisWheelTire(false);
            }
        }     
    }
    if(draw_racecar_front_left_racecar_chassis_wheel_hub) {
        translate([rc_wrt_rcb_x_offset+rc_wheel_front_x_offset, rc_wrt_rcb_y_offset+rc_wheel_left_y_offset, rc_wrt_rcb_z_offset+rc_wheel_z_offset]) {
            rotate([0,0,180]) {
                RacecarChassisWheelHub(false);
            }
        }     
    }    

    echo("Back left wheel", 
        rc_wrt_rcb_x_offset+rc_wheel_back_x_offset, 
        rc_wrt_rcb_y_offset+rc_wheel_left_y_offset, 
        rc_wrt_rcb_z_offset+rc_wheel_z_offset);
    if(draw_racecar_back_left_racecar_chassis_wheel_tire) {
        translate([rc_wrt_rcb_x_offset+rc_wheel_back_x_offset, rc_wrt_rcb_y_offset+rc_wheel_left_y_offset, rc_wrt_rcb_z_offset+rc_wheel_z_offset]) {
            rotate([0,0,180]) {
                RacecarChassisWheelTire();
            }
        }  
    }
    if(draw_racecar_back_left_racecar_chassis_wheel_hub) {
        translate([rc_wrt_rcb_x_offset+rc_wheel_back_x_offset, rc_wrt_rcb_y_offset+rc_wheel_left_y_offset, rc_wrt_rcb_z_offset+rc_wheel_z_offset]) {
            rotate([0,0,180]) {
                RacecarChassisWheelHub();
            }
        }  
    }    
 
    echo("Back right wheel", 
        rc_wrt_rcb_x_offset+rc_wheel_back_x_offset, 
        rc_wrt_rcb_y_offset+rc_wheel_right_y_offset, 
        rc_wrt_rcb_z_offset+rc_wheel_z_offset);    
    if(draw_racecar_back_right_racecar_chassis_wheel_tire) {
        translate([rc_wrt_rcb_x_offset+rc_wheel_back_x_offset, rc_wrt_rcb_y_offset+rc_wheel_right_y_offset, rc_wrt_rcb_z_offset+rc_wheel_z_offset]) {
            RacecarChassisWheelTire(false);
        } 
    }
    if(draw_racecar_back_right_racecar_chassis_wheel_hub) {
        translate([rc_wrt_rcb_x_offset+rc_wheel_back_x_offset, rc_wrt_rcb_y_offset+rc_wheel_right_y_offset, rc_wrt_rcb_z_offset+rc_wheel_z_offset]) {
            RacecarChassisWheelHub(false);
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
    
    if(draw_racecar_battery_chassis_sticker) {
        translate([rb_chassis_wrt_rcb_x_offset, rb_chassis_wrt_rcb_y_offset, rb_chassis_wrt_rcb_z_offset]) {
            RacecarBatterySticker();
        }
    }    
    
    if(draw_racecar_battery_foundation_left) {
        translate([rb_foundation_left_wrt_rcb_x_offset,rb_foundation_left_wrt_rcb_y_offset,rb_foundation_left_wrt_rcb_z_offset]) {
            RacecarBattery();
        }
    }
    
    if(draw_racecar_battery_foundation_left_sticker) {
        translate([rb_foundation_left_wrt_rcb_x_offset,rb_foundation_left_wrt_rcb_y_offset,rb_foundation_left_wrt_rcb_z_offset]) {
            RacecarBatterySticker();
        }
    }    
    
    if(draw_racecar_battery_foundation_right) {
        translate([rb_foundation_right_wrt_rcb_x_offset,rb_foundation_right_wrt_rcb_y_offset,rb_foundation_right_wrt_rcb_z_offset]) {
            RacecarBattery();
        }
    }    
    
    if(draw_racecar_battery_foundation_right_sticker) {
        translate([rb_foundation_right_wrt_rcb_x_offset,rb_foundation_right_wrt_rcb_y_offset,rb_foundation_right_wrt_rcb_z_offset]) {
            RacecarBatterySticker();
        }
    }     
    
    if(draw_racecar_jetson_nano) {
        translate([rjn_wrt_rcb_x_offset, rjn_wrt_rcb_y_offset, rjn_wrt_rcb_z_offset]) {
            rotate([180,0,0]) {
                RacecarJetsonNano();
            }
        }
    }
 
     echo("D435: ", 
        rd435_wrt_rcb_x_offset, 
        rd435_wrt_rcb_y_offset,
        rd435_wrt_rcb_z_offset);   
    if(draw_racecar_d435) {
        translate([rd435_wrt_rcb_x_offset, rd435_wrt_rcb_y_offset, rd435_wrt_rcb_z_offset]) {
            RacecarD435();
        }
    }
    
    if(draw_racecar_d435_screen) {
        translate([rd435_wrt_rcb_x_offset, rd435_wrt_rcb_y_offset, rd435_wrt_rcb_z_offset]) {
            RacecarD435Screen();
        }
    }    
    
    
    echo("YDLidar: ", 
        ry_wrt_rcb_x_offset, 
        ry_wrt_rcb_y_offset,
        ry_wrt_rcb_z_offset);
    if(draw_racecar_ydlidar_top) {
        translate([ry_wrt_rcb_x_offset, ry_wrt_rcb_y_offset, ry_wrt_rcb_z_offset]) {
            RacecarYDLidarTop();
        }
    }
    if(draw_racecar_ydlidar_motor) {
        translate([ry_wrt_rcb_x_offset, ry_wrt_rcb_y_offset, ry_wrt_rcb_z_offset]) {
            RacecarYDLidarMotor();
        }
    }
    if(draw_racecar_ydlidar_mount) {
        translate([ry_wrt_rcb_x_offset, ry_wrt_rcb_y_offset, ry_wrt_rcb_z_offset]) {
            RacecarYDLidarMount();
        }
    }    
    
}