r_ext=14;
ep=2;
hauteur=98;
r_vis=1.4;

module boitier(){
	difference(){
		hull(){
			cylinder(h = hauteur, r = r_ext, $fn=100);
			translate([60,0,0]){cylinder(h = hauteur, r = r_ext, $fn=100);}
			translate([50,25,0]){cylinder(h = hauteur, r = 8, $fn=100);}
		}

		//évidement intérieur général
		hull(){
			translate([0,0,-2])cylinder(h = hauteur+5, r = r_ext-ep, $fn=100);
			translate([60,0,-2]){cylinder(h = hauteur+5, r = r_ext-ep, $fn=100);}
			translate([50,25,-2]){cylinder(h = hauteur+5, r = 6, $fn=100);}
		}
		//ouvertures pour écran
		translate([7,-r_ext-5,10]){cube([26,10,hauteur-20]);}

		//trous pour visser carte
		translate([-8,-r_ext-5,2.5]){rotate([-90,0,0])cylinder(h = 15, r = 1.5, $fn=50);}
		translate([-8,-r_ext-5,hauteur-2.5]){rotate([-90,0,0])cylinder(h = 15, r = 1.5, $fn=50);}

		//trou pour encodeur
		translate([59,-r_ext-5,61.5]){rotate([-90,0,0])cylinder(h = 15, r = 5, $fn=50);}
		
		
	}

	//ajout pour vissage des flancs
	difference(){
		union(){
			translate([-4,-r_ext+3.5,0])cylinder(h = hauteur, r = 2.5, $fn=50);
			translate([0,r_ext-2.5,0])cylinder(h = hauteur, r = 2.5, $fn=50);
			translate([42.5,-r_ext+3,0])cylinder(h = hauteur, r = 2.5, $fn=50);
			translate([52,29,0])cylinder(h = hauteur, r = 2.5, $fn=50);
			translate([68,-r_ext+6,0])cylinder(h = hauteur, r = 2.5, $fn=50);
		}

		translate([-4,-r_ext+3.5,-2])cylinder(h = hauteur+10, r = r_vis, $fn=50);
		translate([0,r_ext-2.5,-2])cylinder(h = hauteur+10, r = r_vis, $fn=50);
		translate([42.5,-r_ext+3,-2])cylinder(h = hauteur+10, r = r_vis, $fn=50);
		translate([52,29,-2])cylinder(h = hauteur+10, r = r_vis, $fn=50);
		translate([68,-r_ext+6,-2])cylinder(h = hauteur+10, r = r_vis, $fn=50);
	}
	

}

module capot(){
	difference(){

	hull(){
			cylinder(h = ep, r = r_ext, $fn=100);
			translate([60,0,0]){cylinder(h = ep, r = r_ext, $fn=100);}
			translate([50,25,0]){cylinder(h = ep, r = 8, $fn=100);}
		}

	translate([-4,-r_ext+3.5,-2])cylinder(h = hauteur+10, r = 1.5, $fn=50);
	translate([0,r_ext-2.5,-2])cylinder(h = hauteur+10, r = 1.5, $fn=50);
	translate([42.5,-r_ext+3,-2])cylinder(h = hauteur+10, r = 1.5, $fn=50);
	translate([52,29,-2])cylinder(h = hauteur+10, r = 1.5, $fn=50);
	translate([68,-r_ext+6,-2])cylinder(h = hauteur, r = 1.5, $fn=50);

	//trou pour carte SD
	translate([50,4,-2]){cube([25,3,5]);}

	}
}

//boitier();

translate([0,50,0])capot();