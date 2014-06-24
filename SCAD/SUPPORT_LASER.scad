r_laser=6;
r_m3=2;
hauteur=10;

module support_laser(){
	difference(){
		cube([20,35,hauteur]);
		
		//trou pour le laser
		translate([10,15,-5]){cylinder(h=hauteur+10, r=r_laser, $fn=50);}

		//trou pour fixation sur chariot X
		translate([10,30,-5]){cylinder(h=hauteur+10, r=r_m3, $fn=50);}

		//fente pour le serrage du laser
		translate([9.5,-5,-5]){cube([1,20,hauteur+10]);}
		translate([-5,5,hauteur/2]){rotate([0,90,0])cylinder(h=50, r=r_m3, $fn=50);}


	}
}

support_laser();