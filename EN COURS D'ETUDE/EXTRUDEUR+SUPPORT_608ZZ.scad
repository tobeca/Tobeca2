largeur=24;
longueur=73;
r_m8=4.1;
r_m3=1.5;
ecrou_m3=3.3;
ep=10;
dec_trou_serrage=4;
r_trou_filament=2;
r_douille=7.5;
long_608=34;

module arrondi(RAYON,EP){
	difference(){
		cube([RAYON*2,RAYON*2,EP]);

		translate([RAYON,RAYON,-5])cylinder(r=RAYON, h=EP+10, $fn=100);

		translate([RAYON,-5,-5])cube([RAYON*2+10,RAYON*2+10,EP+10]);
		translate([-5,RAYON,-5])cube([RAYON*2+10,RAYON*2+10,EP+10]);

	}
}

module support_608zz(){
	difference(){
		
	//forme générale
	cube([largeur,long_608,ep]);

		//extrusion pour 608ZZ
		translate([largeur/2-4,long_608/2-12,-5]){cube([8,24,ep+10]);}

		//passage tige M8
		translate([-5,long_608/2,ep]){rotate([0,90,0])cylinder(r=r_m8, h=largeur+2, $fn=50);}
	

		//trou pour vis de serrage
		translate([dec_trou_serrage,long_608-3,-5]){cylinder(r=r_m3+0.5, h=ep+15, $fn=50);}
		translate([largeur-dec_trou_serrage,long_608-3,-5]){cylinder(r=r_m3+0.5, h=ep+15, $fn=50);}
		translate([dec_trou_serrage,3,-5]){cylinder(r=r_m3+0.5, h=ep+15, $fn=50);}
		translate([largeur-dec_trou_serrage,3,-5]){cylinder(r=r_m3+0.5, h=ep+15, $fn=50);}
	}
}

module trous_moteur(){
		cylinder(r=r_m3+0.25, h=largeur+10, $fn=50);
		translate([31,0,0]){cylinder(r=r_m3+0.25, h=largeur+10, $fn=50);}
		
}


module extrudeur(){
	difference(){
		union(){
			//partie à fixer sur plaque
			cube([longueur,10,largeur]);

			//partie générale
			translate([30,10,0]){cube([25,44,largeur]);}
			translate([27,10,0]){cube([25,20,largeur]);}
			

			//débord pour fixation moteur
			translate([55,20,0]){cube([8,12.8,largeur]);}
			translate([55+8,20+12.8/2,0]){cylinder(r=12.8/2, h=largeur, $fn=50);}
			
			//arrondis sur la pièce	
			translate([55,10,0]){arrondi(3,largeur);}
			translate([55,20,0]){rotate([0,0,270])arrondi(6,largeur);}
			translate([55,32.8,0]){arrondi(8,largeur);}
		}
		//arrondi en haut de la pièce
		translate([55.5,54.5,-5]){rotate([0,0,180])arrondi(9,largeur+10);}

		//ajout des arrondis pour les douilles
		translate([9,-4,-5]){cylinder(h = 50, r = r_douille, $fn=50);}
		translate([longueur-9,-4,-5]){cylinder(h = 50, r = r_douille, $fn=50);}
		
		//trous pour colliers pour fixer les douilles
		translate([9+9,-5,5]){rotate([-90,0,0])cylinder(r=r_m3, h=20, $fn=50);}
		translate([9+9,-5,largeur-5]){rotate([-90,0,0])cylinder(r=r_m3, h=20, $fn=50);}
		translate([longueur-9-9,-5,5]){rotate([-90,0,0])cylinder(r=r_m3, h=20, $fn=50);}
		translate([longueur-9-9,-5,largeur-5]){rotate([-90,0,0])cylinder(r=r_m3, h=20, $fn=50);}

		//placement de trous pour fixation du moteur
		translate([39.5,48.5,-5]){rotate([0,0,-45])trous_moteur();}

		//trou général pour passage du filament
		translate([longueur/2-1.5,-5,largeur/2]){rotate([-90,0,0])cylinder(r=r_trou_filament, h=100, $fn=50);}
		

		//trou central
		translate([40,27,largeur/2+3]){cylinder(r=12, h=20, $fn=100);}

	hull(){
		translate([40,27,-5]){cylinder(r=6, h=largeur+10, $fn=100);}
		translate([35,27,-5]){cylinder(r=6, h=largeur+10, $fn=100);}
		}


		translate([20,22,-5]){cube([20,10,largeur+10]);}
		translate([40-11-3,27,-5]){cylinder(r=12, h=largeur+10, $fn=200);}

		//trou passage serrage vis
		translate([25,41,dec_trou_serrage]){rotate([0,90,0])cylinder(r=r_m3, h=100, $fn=50);}	
		translate([25,41,largeur-dec_trou_serrage]){rotate([0,90,0])cylinder(r=r_m3, h=100, $fn=50);}

		translate([25,13,dec_trou_serrage]){rotate([0,90,0])cylinder(r=r_m3, h=100, $fn=50);}	
		translate([25,13,largeur-dec_trou_serrage]){rotate([0,90,0])cylinder(r=r_m3, h=100, $fn=50);}

		//extrusion pour laisser le passage au support_608
		translate([-5,8,-5]){cube([32,5,largeur+10]);}
		
		//trou pour ventilateurs
		translate([-5,5,5]){rotate([0,90,0])cylinder(r=r_m3, h=longueur+20, $fn=50);}
		
		//trous pour fixer la courroie
		translate([longueur/2-14,-5,5]){rotate([-90,0,0])cylinder(r=r_m3, h=20, $fn=50);}
		translate([longueur/2-14,-5,largeur-10]){rotate([-90,0,0])cylinder(r=r_m3, h=20, $fn=50);}
		

		//trous pour passer jhead (passage pour maintien)
		translate([longueur/2-1.5,-5,largeur/2]){rotate([-90,0,0])cylinder(r=8, h=11.5, $fn=100);}
		translate([longueur/2-1.5+7.5,5,-5]){cylinder(r=r_m3, h=largeur+20, $fn=50);}
		translate([longueur/2-1.5-7.5,5,-5]){cylinder(r=r_m3, h=largeur+20, $fn=50);}
		
	}
	
}

extrudeur();

translate([15,10,largeur]){rotate([0,90,0])support_608zz();}
//support_608zz();