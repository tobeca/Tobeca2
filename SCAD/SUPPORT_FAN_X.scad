r_m3=2;
l_char=10;
h_char=9;
ecart_char=8;
ep_plaque=2;
r_trou_moteur=16;
r_entonnoir=21;

module entonnoir(){
	difference(){
		rotate([0,22,0])cylinder(r1=r_entonnoir+1, r2=5, h=40, $fn=100);

		rotate([0,22,0])cylinder(r1=r_entonnoir, r2=3, h=40.5, $fn=100);
		translate([-58,-50,-10]){rotate([0,36,0])cube([30,100,100]);}

		translate([-5,-50,-50]){cube([100,100,52]);}

		//coupure en haut de la pièce
		translate([0,-50,30]){cube([100,100,20]);}
	}

	
}

module plaque(){
	cube([6.5,2*ecart_char+3*l_char,2]);
difference(){
		cube([36,2*ecart_char+3*l_char,ep_plaque]);
		
		//trous pour fixation ventilateur
		translate([32,7,-5]){cylinder(r=r_m3, h=10, $fn=50);}
		translate([32,7+32,-5]){cylinder(r=r_m3, h=10, $fn=50);}

		//trou central ventilateur
		translate([r_trou_moteur,7+16,-5]){cylinder(r=r_trou_moteur+3, h=7, $fn=100);}
	}

}


difference(){
	union(){
	translate([r_trou_moteur,(2*ecart_char+3*l_char)/2,-1]){entonnoir();}
	plaque();
	}

	translate([3,23,-5]){cylinder(r=2, h=20, $fn=50);}

	translate([0,0,2.01]){cube([10,50,20]);}

	translate([7,-5,16]){rotate([270,0,0])cylinder(r=14, h=100, $fn=200);}


}