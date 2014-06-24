nema=35;
hauteur=20;
ep=3;
r_centre=12;
r_m3=2;
dec=4.5;

module equerre(){
	difference(){
		cube([nema,nema+ep*2,hauteur]);

		//extrusions générales
		translate([ep,ep,ep]){cube([nema,nema,hauteur]);}
		translate([nema,-5,nema]){rotate([-90,0,0])cylinder(h = nema+20, r = 29, $fn=200);}

		//trous pour le moteur
		translate([nema/2,(nema+ep*2)/2,-5]){cylinder(h = 15, r = r_centre, $fn=200);}
		translate([nema-dec,ep+dec,-5]){cylinder(h = 15, r = r_m3, $fn=50);}
		translate([nema-dec,nema+ep-dec,-5]){cylinder(h = 15, r = r_m3, $fn=50);}

		//trous de fixation sur les rails
		hull(){
			translate([-5,(nema+ep*2)/2-10,hauteur/2+ep/2-2]){rotate([0,90,0])cylinder(h = 15, r = r_m3, $fn=50);}
			translate([-5,(nema+ep*2)/2-10,hauteur/2+ep/2+2]){rotate([0,90,0])cylinder(h = 15, r = r_m3, $fn=50);}
		}

		hull(){
			translate([-5,(nema+ep*2)/2+10,hauteur/2+ep/2-2]){rotate([0,90,0])cylinder(h = 15, r = r_m3, $fn=50);}
			translate([-5,(nema+ep*2)/2+10,hauteur/2+ep/2+2]){rotate([0,90,0])cylinder(h = 15, r = r_m3, $fn=50);}
		}

	}
}

equerre();