r_arbre=6;
l_bloc=26;
ep_bloc_base=16.5;
r_m3_for=1.4;
r_m3=2;
r_ecrou_m3=3.3;
pos_vis=19;
hauteur=30;
entraxe=74;
nema=35;
r_centre=12;
dec=4.5;
longueur=29;
ep=3;
hauteurf=8;
r_rond=9;

module bloc_profile(){
	difference(){
	union()
		cube([ep_bloc_base+3,l_bloc,hauteur]);

		//petite extrusion pour passage à l'intérieur du profilé
		translate([-5,15,-5]){cube([10,25,hauteur+10]);}
		translate([5,16,-5]){rotate([0,0,45])cube([5,6,hauteur+10]);}

		//trou général sur le profilé
		translate([ep_bloc_base/2,16,-5]){cylinder(h=hauteur+10, r=r_arbre, $fn=50);}

		//arrondi pour placement spirale
		translate([(ep_bloc_base+3)/2,-3,-5]){cylinder(h=hauteur+10, r=6, $fn=50);}
		
		//trou pour passer les colliers
		translate([-5,7,hauteur/2-7]){rotate([0,90,0])cylinder(h=25, r=r_m3, $fn=50);}
		translate([-5,7,hauteur/2+7]){rotate([0,90,0])cylinder(h=25, r=r_m3, $fn=50);}
	
	}
	
}

bloc_profile();