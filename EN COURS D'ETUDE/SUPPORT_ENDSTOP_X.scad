r_m3=2;
r_tete_m3=3.5;
r_ecrou_m3=3.3;
r_m6=3.2;

module endstop_x(){
    difference(){
        union(){
            translate([13,0,0]){cube([38.5,30,5]);}
            translate([13,5,4]){cube([26,13,20]);}
        }
        
        //trou central d'arbre
        hull(){
            translate([26.5,15,-5]){cylinder(r=5, h=50, $fn=100);}
            translate([60,15,-5]){cylinder(r=5, h=50, $fn=100);}
        }
        
        hull(){
            translate([0,15,10]){cylinder(r=5, h=50, $fn=100);}
            translate([60,15,10]){cylinder(r=5, h=50, $fn=100);}
        }
        
        //trous de montage
        
        translate([26.5+19.5,15-8,-5]){cylinder(r=r_m6, h=15, $fn=50);}
        translate([26.5+19.5,15+8,-5]){cylinder(r=r_m6, h=15, $fn=50);}
        
        
        
        
        //trous pour collier de serrage spirale
        hull(){
            translate([26.5-5-2,0,10]){rotate([-90,0,0])cylinder(r=2, h=50, $fn=50);}
            translate([26.5-5-2,0,12]){rotate([-90,0,0])cylinder(r=2, h=50, $fn=50);}
        }
        
        //trous pour fixation contact de fin de course
        hull(){
        translate([18,0,24]){rotate([-90,0,0])cylinder(r=2, h=50, $fn=50);}
        translate([18,0,17]){rotate([-90,0,0])cylinder(r=2, h=50, $fn=50);}
    }
        
        hull(){
        translate([18,19,24]){rotate([90,0,0])cylinder(r=3.5, h=12, $fn=50);}
        translate([18,19,17]){rotate([90,0,0])cylinder(r=3.5, h=12, $fn=50);}
    }
    
    hull(){
        translate([18+9,0,24]){rotate([-90,0,0])cylinder(r=2, h=50, $fn=50);}
        translate([18+9,0,17]){rotate([-90,0,0])cylinder(r=2, h=50, $fn=50);}
    }
        
        hull(){
        translate([18+9,19,24]){rotate([90,0,0])cylinder(r=3.5, h=12, $fn=50);}
        translate([18+9,19,17]){rotate([90,0,0])cylinder(r=3.5, h=12, $fn=50);}
    }
    }
}


endstop_x();