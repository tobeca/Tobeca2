

module bridage_plateau(){
    difference(){
        cube([28,20,15]);
        
        //trous pour montage de l'insert
        translate([14,-5,5]){rotate([-90,0,0])cylinder(r=2, h=30, $fn=50);}
        translate([14,10,5]){rotate([-90,0,0])cylinder(r=3.3, h=30, $fn=6);}
        
        //trous de montage sur le plateau
        translate([5,10,-5]){cylinder(r=2, h=30, $fn=50);}
        translate([5,10,6]){rotate([0,0,30])cylinder(r=3.3, h=30, $fn=6);}
        translate([28-5,10,-5]){cylinder(r=2, h=30, $fn=50);}
        translate([28-5,10,6]){rotate([0,0,30])cylinder(r=3.3, h=30, $fn=6);}
    }
    
}

bridage_plateau();