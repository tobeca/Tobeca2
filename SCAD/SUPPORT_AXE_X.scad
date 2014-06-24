longueur=105;
largeur=20;
hauteur=30;
r_m3_vis=1.2;
r_m5=2.75;
l_m5=7.8;
h_ecrou_m5=3.7;
r_m3=2;
r_arbre=4;
r_patin=3;


module support_axe_x(){
	difference(){
		cube([largeur,longueur,hauteur]);

		//extrusion du milieu
		translate([11,41.5,-5]){cube([15,22,hauteur+10]);}

		//trou pour tige M5
		translate([5.2,longueur/2,-5]){cylinder(h = hauteur+10, r = r_m5, $fn=50);}

		//encoche pour écrou M5
		translate([-5,longueur/2-l_m5/2,hauteur/2-h_ecrou_m5/2]){cube([20,l_m5,h_ecrou_m5]);}

		//trous pour le bloc moteur
		translate([largeur-5.5,37,-5]){cylinder(h = hauteur+10, r = r_m3, $fn=50);}
		translate([largeur-5.5,37+31,-5]){cylinder(h = hauteur+10, r = r_m3, $fn=50);}

		//trou pour vis d'offset Z
		translate([largeur/2,15,-5]){cylinder(h = hauteur+10, r = 1.5, $fn=50);}
		translate([largeur/2,15,hauteur-5]){cylinder(h = 10, r = 3.3, $fn=6);}

		//trous pour serrage des arbres
		translate([largeur/2,25,hauteur/2]){cylinder(h = hauteur+10, r = r_m3_vis, $fn=50);}
		translate([largeur/2,longueur-25,hauteur/2]){cylinder(h = hauteur+10, r = r_m3_vis, $fn=50);}


		//trous pour montage sur patins
		translate([-5,5.5,7]){rotate([0,90,0])cylinder(h = largeur+10, r = r_patin, $fn=50);}
		translate([-5,5.5,hauteur-7]){rotate([0,90,0])cylinder(h = largeur+10, r = r_patin, $fn=50);}
		translate([-5,longueur-5.5,7]){rotate([0,90,0])cylinder(h = largeur+10, r = r_patin, $fn=50);}
		translate([-5,longueur-5.5,hauteur-7]){rotate([0,90,0])cylinder(h = largeur+10, r = r_patin, $fn=50);}

		//trous pour les arbres de guidage
		translate([-5,25,hauteur/2]){rotate([0,90,0])cylinder(h = largeur+10, r = r_arbre, $fn=50);}
		translate([-5,longueur-25,hauteur/2]){rotate([0,90,0])cylinder(h = largeur+10, r = r_arbre, $fn=50);}
	}

		
}

support_axe_x();




	