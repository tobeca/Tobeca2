rayon=2;
longueur=40;
largeur=9;
ep=3;

module cale_porte(){
   difference(){
      hull(){
          translate([rayon,rayon,0]){cylinder(h = ep, r = rayon, $fn=50);}
          translate([longueur-rayon,rayon,0]){cylinder(h = ep, r = rayon, $fn=50);}
          translate([longueur-rayon,largeur-rayon,0]){cylinder(h = ep, r = rayon, $fn=50);}
          translate([rayon,largeur-rayon,0]){cylinder(h = ep, r = rayon, $fn=50);}
      }
      
      //trou de perçage
      translate([10,largeur/2,-5]){cylinder(h = 20, r = 0.5, $fn=50);}
      translate([longueur-10,largeur/2,-5]){cylinder(h = 20, r = 0.5, $fn=50);}
      
      
   } 
}
cale_porte();