r_douille=19/2;
r_m5=2.6;
r_em5=4.6;

long=35;
larg=40;
hauteur=12;

l_douille=29;

ent_x=21/2;
ent_y=28/2;

ecart=8;
lco=4;

r_arr=3;

module support_lm10uu(){
	difference(){
	hull(){
		translate([r_arr,r_arr,0]){cylinder(h = hauteur, r = r_arr, $fn=100);}
		translate([long-r_arr,r_arr,0]){cylinder(h = hauteur, r = r_arr, $fn=100);}
		translate([long-r_arr,larg-r_arr,0]){cylinder(h = hauteur, r = r_arr, $fn=100);}
		translate([r_arr,larg-r_arr,0]){cylinder(h = hauteur, r = r_arr, $fn=100);}

	}

		//creu pour douille
		translate([long/2-l_douille/2,larg/2,hauteur]){rotate([0,90,0])cylinder(h = l_douille, r = r_douille, $fn=100);}
		translate([-5,larg/2,hauteur]){rotate([0,90,0])cylinder(h = 100, r = 6, $fn=100);}
		

		//trous de fixation M5
		translate([long/2-ent_x,larg/2-ent_y,-5]){cylinder(h = hauteur*2, r = r_m5, $fn=100);}
		translate([long/2-ent_x,larg/2+ent_y,-5]){cylinder(h = hauteur*2, r = r_m5, $fn=100);}
		translate([long/2+ent_x,larg/2-ent_y,-5]){cylinder(h = hauteur*2, r = r_m5, $fn=100);}
		translate([long/2+ent_x,larg/2+ent_y,-5]){cylinder(h = hauteur*2, r = r_m5, $fn=100);}

		//emplacements pour écrous M5
		translate([long/2-ent_x,larg/2-ent_y,3]){cylinder(h = hauteur, r = r_em5, $fn=6);}
		translate([long/2-ent_x,larg/2+ent_y,3]){cylinder(h = hauteur, r = r_em5, $fn=6);}
		translate([long/2+ent_x,larg/2-ent_y,3]){cylinder(h = hauteur, r = r_em5, $fn=6);}
		translate([long/2+ent_x,larg/2+ent_y,3]){cylinder(h = hauteur, r = r_em5, $fn=6);}


		//passages pour les colliers de maintien
		translate([long/2-lco/2,-1,-5]){cube([ lco, 8+1, hauteur*2]);}
		
		translate([long/2-lco/2,larg-8,-5]){cube([ lco, 8.1, hauteur*2]);}
		

		translate([long/2-lco/2,-0.01,-0.01]){cube([ lco, larg+5, 2]);}

	}

}

support_lm10uu();