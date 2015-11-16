r_arr=2;

longueur=50;
largeur=31;
ep_plaque=3;

module patte(){
    difference(){
        hull(){
            translate([r_arr,r_arr,0]){cylinder(h = ep_plaque, r = r_arr, $fn=100);}
            translate([longueur-r_arr,r_arr,0]){cylinder(r=r_arr, h=ep_plaque, $fn=50);}
                translate([longueur-r_arr,largeur-r_arr,0]){cylinder(r=r_arr, h=ep_plaque, $fn=50);}
                translate([r_arr,largeur-r_arr,0]){cylinder(r=r_arr, h=ep_plaque, $fn=50);}
        }
        
        //trous de montage
        translate([longueur/2-15,largeur/2,-5]){cylinder(h = 20, r = 2, $fn=100);}
        translate([longueur/2+15,largeur/2,-5]){cylinder(h = 20, r = 3, $fn=100);}
    }
}

patte();