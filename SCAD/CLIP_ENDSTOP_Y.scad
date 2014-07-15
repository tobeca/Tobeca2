r_m3=2;
hauteur=8;
long=40;
larg=10;
espace=20;

module clip(){
difference(){
	cube([long,larg,hauteur]);

	translate([5,larg/2,-5]){cylinder(h = hauteur+10, r = r_m3, $fn=100);}
	translate([5,larg/2,-0.01]){cylinder(h = 2.5, r1=3.5,r2= r_m3, $fn=100);}
	
	translate([long-5,larg/2,-5]){cylinder(h = hauteur+10, r = r_m3, $fn=100);}
	translate([long-5,larg/2,-0.01]){cylinder(h = 2.5, r1=3.5,r2= r_m3, $fn=100);}
	
	translate([long/2-espace/2,-5,3]){cube([espace,larg+10,hauteur]);}

}

}
clip();