entraxe=35;
largeur=55;
r_m3=2;
r_ecrou_m3=3.3;
dec_y=27.5;
ep=3;
hauteur=16;
dec_x=8;
ep_608=8;
r_m8=3.9;


module retour_y(){
	difference(){
		union(){
		cube([dec_x,largeur,hauteur]);

		hull(){
		translate([dec_x,0,0]){cube([15,55,ep]);}
		translate([dec_y,largeur/2,0]){ cylinder(h=ep, r=15, $fn=100);}
		}

		//flasque pour roulement
		translate([dec_y,largeur/2,ep]){cylinder(r=7.5, h=(hauteur-ep)/2-ep_608/2-0.5, $fn=100);}
		translate([dec_y,largeur/2,ep+(hauteur-ep)/2-ep_608/2-0.5]){cylinder(r=5.5, h=0.5, $fn=50);}
		translate([dec_y,largeur/2,ep+(hauteur-ep)/2-ep_608/2]){cylinder(r=r_m8, h=ep_608/2, $fn=50);}

		}

		//extrusions pour symétriser
		translate([dec_x/2,largeur/2-1,ep]){cube([15,55,hauteur]);}
		translate([-1,-1,ep]){cube([dec_x/2+1,largeur/2+1+1,hauteur]);}

		//trous de fixation à la mallette
		translate([10,10,hauteur/2+ep/2]){rotate([0,-90,0]) cylinder(h=20, r=r_m3, $fn=50);}
    	translate([10,45,hauteur/2+ep/2]){rotate([0,-90,0]) cylinder(h=20, r=r_m3, $fn=50);}

		

		//trou d'axe
		translate([dec_y,largeur/2,-5]){ cylinder(h=hauteur*2, r=r_m3, $fn=50);}
		translate([dec_y,largeur/2,-0.01]){ cylinder(h=3.5, r=3, $fn=50);}

		
	}
	
}

retour_y();

//translate([0,largeur,hauteur+ep]){rotate([180,0,0])retour_y();}