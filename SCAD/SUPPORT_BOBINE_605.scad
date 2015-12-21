longueur=30;
largeur=18;
ep=5;

module support_bobine(){
    difference(){
        union(){
            cube([largeur,longueur,ep]);
            
            hull(){
                translate([0,2,5]){rotate([0,90,0])cylinder(h = largeur, r = 2, $fn=50);}
                translate([0,longueur/2,14]){rotate([0,90,0])cylinder(h = largeur, r = 12, $fn=100);}
                //translate([0,longueur/2+3,18]){rotate([0,90,0])cylinder(h = largeur, r = 5, $fn=50);}
                translate([0,longueur-2,5]){rotate([0,90,0])cylinder(h = largeur, r = 2, $fn=50);}
            }
            
           
        }
         //encastrement pour roulement
        hull(){
         translate([largeur/2-3,longueur/2,15]){rotate([0,90,0])cylinder(h = 6, r = 9, $fn=100);}
         translate([largeur/2-3,longueur/2,25]){rotate([0,90,0])cylinder(h = 6, r = 9, $fn=100);}
         translate([largeur/2-3,longueur/2-5,16]){rotate([0,90,0])cylinder(h = 6, r = 9, $fn=100);}
         translate([largeur/2-3,longueur/2+5,16]){rotate([0,90,0])cylinder(h = 6, r = 9, $fn=100);}
     }
         
         //trou pour vissage
         translate([-5,longueur/2,14]){rotate([0,90,0])cylinder(h = 25, r = 2.7, $fn=100);}
         
         //trou pour montage dans carter
         translate([largeur/2,longueur/2,-5]){cylinder(h = 25, r = 1.7, $fn=50);}
          translate([largeur/2,longueur/2,3]){cylinder(h = 25, r = 3.5, $fn=50);}
         
    }
}

support_bobine();