_print_config = true;
_fn_val = 100;

_wall_thickness = 3.0;
_m3_nut_height = 3.0;
_m3_nut_diameter = 5.7;
_m2_5_nut_height = 2.5;
_m2_5_nut_diameter = 5.2;

_m4_screw_head_height = 2.48;
_m4_screw_head_radius = 8.96/2;
_m4_screw_shaft_radius = 2.25;
_m3_screw_head_height = 1.7;
_m3_screw_head_radius = 6.2/2.0;
_m3_screw_shaft_radius = 3.5/2.0;
_m2_5_screw_head_height = 1.5;
_m2_5_screw_head_radius = 5.0/2.0;
_m2_5_screw_shaft_radius = 3.0/2.0;

_m3_insert_depth = 5.0;
_m3_insert_radius = 2.0;

_ball_head_length = 6.0;
_ball_head_width = 6.0;
_ball_head_height = 7.35;

module _m4_flathead_screw(screw_height) {
    _flathead_screw(screw_height, _m4_screw_head_height, _m4_screw_head_radius, _m4_screw_shaft_radius);
}

module _m3_flathead_screw(screw_height) {
    _flathead_screw(screw_height, _m3_screw_head_height, _m3_screw_head_radius, _m3_screw_shaft_radius);
}

module _m2_5_flathead_screw(screw_height) {
    _flathead_screw(screw_height, _m2_5_screw_head_height, _m2_5_screw_head_radius, _m2_5_screw_shaft_radius);
}

module _flathead_screw(screw_height, screw_head_height, screw_head_radius, screw_shaft_radius) {
    
    shaft_length = screw_height - screw_head_height;
    
    translate([0,0,screw_height/2.0-screw_head_height/2.0]) {
        cylinder(screw_head_height, screw_shaft_radius,screw_head_radius, true, $fn=_fn_val);        
    }
    translate([0,0,-screw_height/2.0+shaft_length/2.0]) {
        cylinder(shaft_length, screw_shaft_radius, screw_shaft_radius, true, $fn=_fn_val);
    }
}

module _m2_5_nut_insert_with_access(access_length, screw_height) {
    _nut_insert_with_access(access_length, screw_height, _m2_5_screw_shaft_radius, _m2_5_nut_height, _m2_5_nut_diameter);
}

module _nut_insert_with_access(access_length, screw_height, screw_radius, nut_height, nut_diameter) {
    _nut_insert(screw_height, screw_radius, nut_height, nut_diameter);
    
    translate([-access_length/2.0, 0.0,-screw_height/2.0+_wall_thickness+nut_height/2.0]) {
        cube([access_length, nut_diameter, nut_height], true);
    }
    
    translate([-access_length, 0.0, -screw_height/2.0+(nut_height+_wall_thickness)/2.0]) {
        _hexagon(nut_height+_wall_thickness, nut_diameter);
    }
}

module _m3_nut_insert(screw_height) {
    _nut_insert(screw_height,_m3_screw_shaft_radius, _m3_nut_height, _m3_nut_diameter);
}

module _m2_5_nut_insert(screw_height) {
    _nut_insert(screw_height,_m2_5_screw_shaft_radius, _m2_5_nut_height, _m2_5_nut_diameter);
}


module _nut_insert(screw_height, screw_radius, nut_height, nut_diameter) {
    cylinder(screw_height, screw_radius, screw_radius, true, $fn=_fn_val);
    translate([0.0,0.0,-screw_height/2.0+_wall_thickness+nut_height/2.0]) {
        _hexagon(nut_height, nut_diameter);
    }
}

module _rounded_square(length, width, height) {
    translate([0.0,0.0,0.0]) {
        cube([length-width, width, height], true);
    }
    
    translate([-(length-width)/2.0, 0.0, 0.0]) {
        cylinder(height, width/2.0, width/2.0, true, $fn=_fn_val);
    }
    translate([(length-width)/2.0, 0.0,0.0]) {
        cylinder(height, width/2.0, width/2.0, true, $fn=_fn_val);
    }
}

// Diameter is from face-to-face, not vertex to vertex
module _hexagon(height, diameter) {
    hull() {
        cube([diameter/1.732, diameter, height], true);
        rotate([0,0,120]) {
            cube([diameter/1.732, diameter, height], true);
        }
    }
}

module _triangle(l, w, h) {

       polyhedron(points=[
               [0,0,h],           // 0    front top corner
               [0,0,0],[l,0,0],   // 1, 2 front left & right bottom corners
               [0,w,h],           // 3    back top corner
               [0,w,0],[l,w,0]    // 4, 5 back left & right bottom corners
       ], faces=[ // points for all faces must be ordered clockwise when looking in
               [0,2,1],    // top face
               [3,4,5],    // base face
               [0,1,4,3],  // h face
               [1,2,5,4],  // w face
               [0,3,5,2],  // hypotenuse face
       ]); 
    
       
}

module _bh_triangle(base, height, length) {
    translate([0,-length/2.0,-height/2.0]) {
        _triangle(base/2.0, length, height);
    }
    translate([0,length/2.0,-height/2.0]) {
        rotate([0,0,180]) {
            _triangle(base/2.0, length, height);
        }    
    }
}

module _rounded_bh_triangle(base,height,length, rounding_radius=1.0) {
    hull() {
        _bh_triangle(base,height,length);
        translate([0,0,height/2.0]) {
            rotate([90,0,0]) {
                cylinder(length, rounding_radius, rounding_radius, true, $fn=_fn_val);
            }
        }
        translate([-base/2.0,0,-height/2.0]) {
            rotate([90,0,0]) {
                cylinder(length, rounding_radius, rounding_radius, true, $fn=_fn_val);
            }
        }        
        translate([base/2.0,0,-height/2.0]) {
            rotate([90,0,0]) {
                cylinder(length, rounding_radius, rounding_radius, true, $fn=_fn_val);
            }
        }                
    }
}

module _diamond(length, width, height) {
    translate([length/4.0,0,0]) {
        rotate([90,0,90]) {
            _bh_triangle(width,length/2.0 ,height);
        }
    }
    translate([-length/4.0,0,0]) {
        rotate([-90,0,90]) {
            _bh_triangle(width,length/2.0 ,height);
        }
    }    
}

module _rounded_diamond(length, width, height, rounding_radius=1.0) {
    hull() {
        _diamond(length, width, height);
        translate([length/2.0, 0, 0]) {
            cylinder(height, rounding_radius, rounding_radius, true, $fn=_fn_val);
        }
        translate([-length/2.0, 0, 0]) {
            cylinder(height, rounding_radius, rounding_radius, true, $fn=_fn_val);
        }
        translate([0, width/2.0, 0]) {
            cylinder(height, rounding_radius, rounding_radius, true, $fn=_fn_val);
        }
        translate([0, -width/2.0, 0]) {
            cylinder(height, rounding_radius, rounding_radius, true, $fn=_fn_val);
        }        
    }
}

module _spec_trap(base_width, top_width, bottom_width, length, height) {
    translate([-length/2.0, 0, height/2.0]) {
        polyhedron(points=[[0,-base_width/2.0,0],[0,base_width/2.0,0],[0,-bottom_width/2.0,-height],[0,bottom_width/2.0,-height],[length,-top_width/2.0,0], [length,top_width/2.0,0]], faces=[[0,1,3,2],[0,2,4],[1,5,3],[2,3,5,4],[0,4,5,1]]);        
    }
   
}

module _trap_triangle(l, w, h) {
       polyhedron(points=[
               [0,0,h],           // 0    front top corner
               [0,0,0],[w,0,0],   // 1, 2 front left & right bottom corners
               [0,l,h],           // 3    back top corner
               [0,l,0],[w,l,0]    // 4, 5 back left & right bottom corners
       ], faces=[ // points for all faces must be ordered clockwise when looking in
               [0,2,1],    // top face
               [3,4,5],    // base face
               [0,1,4,3],  // h face
               [1,2,5,4],  // w face
               [0,3,5,2],  // hypotenuse face
       ]);
}

module _trapezoid(w1,w2,l,h) {
    
    cube([l,w1,h],true);
    translate([-l/2.0,w1/2.0,-h/2.0]) {
        rotate([90,0,90]) {
                _trap_triangle(h,(w2-w1)/2,l);
        }        
    }
    translate([-l/2.0,-w1/2.0,h/2.0]) {
        rotate([-90,0,-90]) {
                _trap_triangle(h,(w2-w1)/2,l);
        }        
    }    
    
    
}

module _rounded_trapezoid(w1,w2,l,h, rounding_radius=1.0) {
    hull() {
        _trapezoid(w1,w2,l,h);
        translate([l/2.0, w1/2.0,0.0]) {
            cylinder(h, rounding_radius, rounding_radius, true, $fn=_fn_val);
        }
        translate([l/2.0, -w1/2.0,0.0]) {
            cylinder(h, rounding_radius, rounding_radius, true, $fn=_fn_val);
        }        
        translate([-l/2.0, w2/2.0,0.0]) {
            cylinder(h, rounding_radius, rounding_radius, true, $fn=_fn_val);
        }
        translate([-l/2.0, -w2/2.0,0.0]) {
            cylinder(h, rounding_radius, rounding_radius, true, $fn=_fn_val);
        }                
    }
    
}

module _rounded_edge(length, width, height) {
    difference() {
        cube([length, width, height], true);
        translate([-length/2.0, -width/2.0, 0.0]) {
            scale([length, width, height]) {
                cylinder(1.0,1.0,1.0,true,$fn=_fn_val);
            }
        }
    }
    
}

module _ball_head() {
    hexagon_height = 1.2;
    hexagon_diameter = 6.0;
    hexagon_z_offset = hexagon_height/2.0 - _ball_head_height/2.0;
    
    cylinder_radius = 3.5/2.0;
    cylinder_height = 2.0;
    cylinder_z_offset = hexagon_z_offset + hexagon_height/2.0 + cylinder_height/2.0;
    
    sphere_radius = 5.75/2.0;
    sphere_z_offset = -sphere_radius + _ball_head_height/2.0;
    
    translate([0,0,hexagon_z_offset]) {
        _hexagon( hexagon_height,hexagon_diameter);
    }
    translate([0,0,cylinder_z_offset]) {
        cylinder(cylinder_height, cylinder_radius, cylinder_radius, true, $fn=_fn_val);
    }
    translate([0,0,sphere_z_offset]) {
        sphere(r=sphere_radius, $fn=_fn_val);
    }
}

// Adapted from Mendel90 
// https://github.com/nophead/Mendel90/blob/master/scad/vitamins/springs.scad
module _coil(r1 = 100, r2 = 10, h = 100, twists)
{
    hr = h / (twists * 2);
    stepsize = 1/16;
    module segment(i1, i2) {
        alpha1 = i1 * 360*r2/hr;
        alpha2 = i2 * 360*r2/hr;
        len1 = sin(acos(i1*2-1))*r2;
        len2 = sin(acos(i2*2-1))*r2;
        if (len1 < 0.01)
            polygon([
                [ cos(alpha1)*r1, sin(alpha1)*r1 ],
                [ cos(alpha2)*(r1-len2), sin(alpha2)*(r1-len2) ],
                [ cos(alpha2)*(r1+len2), sin(alpha2)*(r1+len2) ]
            ]);
        if (len2 < 0.01)
            polygon([
                [ cos(alpha1)*(r1+len1), sin(alpha1)*(r1+len1) ],
                [ cos(alpha1)*(r1-len1), sin(alpha1)*(r1-len1) ],
                [ cos(alpha2)*r1, sin(alpha2)*r1 ],
            ]);
        if (len1 >= 0.01 && len2 >= 0.01)
            polygon([
                [ cos(alpha1)*(r1+len1), sin(alpha1)*(r1+len1) ],
                [ cos(alpha1)*(r1-len1), sin(alpha1)*(r1-len1) ],
                [ cos(alpha2)*(r1-len2), sin(alpha2)*(r1-len2) ],
                [ cos(alpha2)*(r1+len2), sin(alpha2)*(r1+len2) ]
            ]);
    }
    linear_extrude(height = h, twist = 180*h/hr,
            $fn = (hr/r2)/stepsize, convexity = 5) {
        for (i = [ stepsize : stepsize : 1+stepsize/2 ])
            segment(i-stepsize, min(i, 1));
    }
}

// Adapted from Mendel90 
// https://github.com/nophead/Mendel90/blob/master/scad/vitamins/springs.scad
module _comp_spring(type, l = 0) {
    
    function spring_od(type)     = type[0]; // Coil outer diameter
    function spring_gauge(type)  = type[1]; // Coil thickness
    function spring_length(type) = type[2]; // Height of spring
    function spring_coils(type)  = type[3]; // Number of coils in spring    
    
    l = (l == 0) ? spring_length(type) : l;

    _coil(r1 = (spring_od(type) - spring_gauge(type)) / 2, r2 = spring_gauge(type) / 2, h = l, twists = spring_coils(type));

}

module _quarter_sphere(radius){
    translate([-radius/2.0,-radius/2.0,-radius/2.0]) {
        difference() {
            sphere(radius, $fn=_fn_val);
            translate([0,0,-radius/2.0]) {
                cube([2*radius,2*radius,radius], true);
            }
            translate([0,-radius/2.0,radius/2.0]) {
                cube([2*radius,radius,radius], true);
            }
            translate([-radius/2.0,radius/2.0,radius/2.0]) {
                cube([radius, radius, radius], true);
            }
        }
    }
}