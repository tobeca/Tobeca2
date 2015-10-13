r_arbre=5.1;
l_bloc=26;
ep_bloc_base=16.5;
r_m3_for=1.4;
r_m3=2;
r_ecrou_m3=3.3;
pos_vis=19;
hauteur=30;

longueur=29;

module bloc_profile(){
	difference(){
		cube([ep_bloc_base,l_bloc,hauteur]);

		//petite extrusion pour passage à l'intérieur du profilé
		translate([-5,15,-5]){cube([10,25,hauteur+10]);}
		translate([5,16,-5]){rotate([0,0,45])cube([5,6,hauteur+10]);}

		//trou général sur le profilé
		translate([ep_bloc_base/2,16,-5]){cylinder(h=hauteur+10, r=r_arbre, $fn=50);}

		//trou pour blocage de la vis
		translate([ep_bloc_base/2+16,-5,hauteur/2]){rotate([-90,0,45])cylinder(h=25, r=r_m3_for, $fn=50);}

		//cassage coin
		translate([10.4,0,-5]){rotate([0,0,-45])cube([7,9,hauteur+10]);}
	
	}
	
}

module support_endstop(){
	difference(){
		cube([28.5+5,longueur,hauteur]);
		
		translate([1.5,4.5,-5]){cube([35,6.5,hauteur+10]);}
		translate([0,18.5,-5]){cube([35,20,hauteur+10]);}

		//trou pour serrage contact de fin de course
		translate([23.5,-5,hauteur/2+7]){rotate([-90,0,0])cylinder(h=10, r=r_m3, $fn=50);}
		translate([23.5,10,hauteur/2+7]){rotate([-90,0,0])cylinder(h=hauteur, r=1.2, $fn=50);}
	}

}

bloc_profile();
translate([ep_bloc_base,6,0]){support_endstop();}