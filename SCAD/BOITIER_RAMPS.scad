longueur=130;
largeur=95;
hauteur=43;
epaisseur_mur=2;
epaisseur_fond=2;
ep_fan=11;
ecart_x_trou=74.5;
ecart_y_trou=48;
r_trou_m3=2;
r_ecrou_m3=3.3;
ep_ecrou_m3=1;
dim_fan=40;
entraxe_fan=32;
r_trou_fan=19;
r_tete=3;


module sanguinololu(){
	difference(){
		cube([longueur,largeur,hauteur]);

		translate([epaisseur_mur,epaisseur_mur,epaisseur_fond]){cube([longueur-epaisseur_mur*2,largeur-epaisseur_mur*2,hauteur*2]);}

		//trous de vissage
		translate([(longueur-ecart_x_trou)/2+ecart_x_trou,largeur/2-ecart_y_trou/2,-5]){cylinder(h = 10, r = r_trou_m3, $fn=50);}
		translate([(longueur-ecart_x_trou)/2-6,largeur/2+ecart_y_trou/2,-5]){cylinder(h = 10, r = r_trou_m3, $fn=50);}
		

		//trous pour ventilateur
		translate([-5,largeur/2-entraxe_fan/2,epaisseur_fond+(dim_fan-entraxe_fan)/2]){rotate([0,90,0])cylinder(h = 10, r = r_trou_m3, $fn=50);}
		translate([epaisseur_mur/2,largeur/2-entraxe_fan/2,epaisseur_fond+(dim_fan-entraxe_fan)/2]){rotate([0,90,0])cylinder(h = epaisseur_mur/2, r1 = r_trou_m3, r2=r_tete, $fn=50);}

		translate([-5,largeur/2+entraxe_fan/2,epaisseur_fond+(dim_fan-entraxe_fan)/2]){rotate([0,90,0])cylinder(h = 10, r = r_trou_m3, $fn=50);}
		translate([epaisseur_mur/2,largeur/2+entraxe_fan/2,epaisseur_fond+(dim_fan-entraxe_fan)/2]){rotate([0,90,0])cylinder(h = epaisseur_mur/2, r1 = r_trou_m3, r2=r_tete, $fn=50);}

		translate([-5,largeur/2-entraxe_fan/2,epaisseur_fond+(dim_fan-entraxe_fan)/2+entraxe_fan]){rotate([0,90,0])cylinder(h = 10, r = r_trou_m3, $fn=50);}
		translate([epaisseur_mur/2,largeur/2-entraxe_fan/2,epaisseur_fond+(dim_fan-entraxe_fan)/2+entraxe_fan]){rotate([0,90,0])cylinder(h = epaisseur_mur/2, r1 = r_trou_m3, r2=r_tete, $fn=50);}
		

		translate([-5,largeur/2+entraxe_fan/2,epaisseur_fond+(dim_fan-entraxe_fan)/2+entraxe_fan]){rotate([0,90,0])cylinder(h = 10, r = r_trou_m3, $fn=50);}
		translate([epaisseur_mur/2,largeur/2+entraxe_fan/2,epaisseur_fond+(dim_fan-entraxe_fan)/2+entraxe_fan]){rotate([0,90,0])cylinder(h = epaisseur_mur/2, r1 = r_trou_m3, r2=r_tete, $fn=50);}
		
		translate([-5,largeur/2,epaisseur_fond+dim_fan/2]){rotate([0,90,0])cylinder(h = 10, r = r_trou_fan, $fn=50);}

		

		//trou pour prise USB
		hull(){
			translate([longueur-5, 25+3, 5])rotate([0,90,0])cylinder(h = 10, r = r_trou_m3, $fn=50);
			translate([longueur-5, 40+3, 5])rotate([0,90,0])cylinder(h = 10, r = r_trou_m3, $fn=50);

			translate([longueur-5, 25+3, 20])rotate([0,90,0])cylinder(h = 10, r = r_trou_m3, $fn=50);
			translate([longueur-5, 40+3, 20])rotate([0,90,0])cylinder(h = 10, r = r_trou_m3, $fn=50);
		}

		//trou pour branchement alimentation
		hull(){
			translate([longueur-5, 52, 10])rotate([0,90,0])cylinder(h = 10, r = r_trou_m3, $fn=50);
			translate([longueur-5, 82, 10])rotate([0,90,0])cylinder(h = 10, r = r_trou_m3, $fn=50);

			translate([longueur-5, 82, hauteur+2])rotate([0,90,0])cylinder(h = 10, r = r_trou_m3, $fn=50);
			translate([longueur-5, 52, hauteur+2])rotate([0,90,0])cylinder(h = 10, r = r_trou_m3, $fn=50);
		}

		//trou pour passage câbles gauche
		translate([60,largeur-5,10]){cube([20,20,hauteur]);}
		//trou pour passage câbles droite
		translate([40,-5,10]){cube([10,20,hauteur]);}

		//vide fond du boitier
		translate([(longueur-ecart_x_trou)/2+12,(largeur-ecart_y_trou)/2-17.5,-5]){cube([ecart_x_trou-19,ecart_y_trou+35,10]);}
		translate([5,largeur/2-15,-5]){cube([ecart_x_trou+39,30,10]);}


	}
}
sanguinololu();