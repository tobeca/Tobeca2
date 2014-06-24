r_tige=5;
r_cote=4;
r_m3=1.5;
tete_vis=3;
ecart=11;
hauteur=2.25;

module blocage_arbre_y(){
	difference(){
		hull(){
			cylinder(h=hauteur, r=r_tige, $fn=100);
			translate([ecart,0,0]){cylinder(h=hauteur, r=r_cote, $fn=100);}
			translate([-ecart,0,0]){cylinder(h=hauteur, r=r_cote, $fn=100);}
		}
		translate([ecart,0,-5]){cylinder(h=hauteur+10, r=r_m3, $fn=100);}
		translate([-ecart,0,-5]){cylinder(h=hauteur+10, r=r_m3, $fn=100);}

		translate([ecart,0,hauteur-2]){cylinder(h=2.01, r1=r_m3, r2=tete_vis, $fn=100);}
		translate([-ecart,0,hauteur-2]){cylinder(h=2.01, r1=r_m3, r2=tete_vis, $fn=100);}

	}

}

blocage_arbre_y();