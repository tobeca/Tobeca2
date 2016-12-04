r_arbre=5.1;
l_bloc=26;
ep_bloc_base=16.5;
r_m3_for=1.4;
r_m3=2;
r_ecrou_m3=3.3;
pos_vis=19;
hauteur=20;
entraxe=74;
nema=35;
r_centre=11;
dec=4.5;
longueur=29;
ep=3;
hauteurf=8;
r_rond=1;
tete_m3=3.5;

module bloc_profile(){
	difference(){
	union()
		cube([ep_bloc_base+23.5,l_bloc+1,hauteur]);

		//petite extrusion pour passage à l'intérieur du profilé
		translate([-5,15,-5]){cube([10,25,hauteur+10]);}
		translate([5,16,-5]){rotate([0,0,45])cube([5,6,hauteur+10]);}

		//trou général sur le profilé
		translate([ep_bloc_base/2,16,-5]){cylinder(h=hauteur+10, r=r_arbre, $fn=50);}

		//trou pour blocage de la vis
		translate([5,16,hauteur/2]){rotate([0,89,0])cylinder(h=50, r=r_m3_for, $fn=50);}

		//cassage coin
		//translate([10.4,0,-5]){rotate([0,0,-45])cube([7,9,hauteur+10]);}

		//trou M3 de serrage sur les flancs de la Tobeca
		translate([-5,7,hauteur/2]){rotate([0,90,0])cylinder(h=25, r=r_m3, $fn=50);}
		translate([10,7,hauteur/2]){rotate([0,90,0])cylinder(h=50, r=r_ecrou_m3, $fn=6);}
		
	
	}
	
}

module plaque_moteur(){
	difference(){
		//plaque pour fixer le moteur
		hull(){
			cube([nema-r_rond,nema+19,hauteur]);
			translate([nema-r_rond,nema+19-r_rond,0]){cylinder(h = hauteur, r = r_rond, $fn=100);}
			translate([nema-r_rond,r_rond,0]){cylinder(h = hauteur, r = r_rond, $fn=100);}
		}

		//trou pour le moteur
		translate([nema/2,(nema+19)/2,-5]){cylinder(h = hauteur+20, r = r_centre, $fn=100);}
        
        //trous pour l'accouplement
        translate([nema/2,(nema+19)/2,8]){cylinder(h = hauteur+20, r = 15, $fn=100);}
        translate([nema/2,(nema+19)/2,10]){cylinder(h = 11, r = 17, $fn=100);}
        
        //trou pour dégager serrage de l'accouplement
        hull(){
        translate([nema/2,(nema+19)/2,hauteur]){rotate([0,90,0])cylinder(h = hauteur+20, r = 7, $fn=100);}
        translate([nema/2,(nema+19)/2,10+4]){rotate([0,90,0])cylinder(h = hauteur+20, r = 7, $fn=100);}
    }
        
		translate([dec,(nema+19)/2-nema/2+dec,-5]){cylinder(h = hauteur+20, r = r_m3, $fn=50);}
		translate([nema-dec,(nema+19)/2+nema/2-dec,-5]){cylinder(h = hauteur+10, r = r_m3, $fn=50);}
        
        translate([dec,(nema+19)/2-nema/2+dec,16]){cylinder(h = hauteur+20, r = tete_m3, $fn=50);}
		translate([nema-dec,(nema+19)/2+nema/2-dec,16]){cylinder(h = hauteur+10, r = tete_m3, $fn=50);}

		//trou pour collier de serrage pour faisceau de câbles
		translate([nema-dec-5,(nema+19)/2+nema/2-dec+10,-5]){cylinder(h = hauteur+10, r = r_m3, $fn=50);}
		translate([nema-dec-5,4,-5]){cylinder(h = hauteur+10, r = r_m3, $fn=50);}
	}
	
}

module arrondi(){
	difference(){
		cube([12,12,hauteur]);
		translate([12,0,-5]){cylinder(h = hauteur+10, r = 12, $fn=100);}
	}
}

module support_endstop(){
	difference(){
		cube([28.5,longueur,hauteurf]);
		
		translate([1.5,4.5,-5]){cube([30,6.5,20]);}
		translate([-1,20,-5]){cube([35,20,20]);}

		//trou pour serrage contact de fin de course
		translate([23.5,-5,hauteurf/2]){rotate([-90,0,0])cylinder(h=10, r=r_m3, $fn=50);}
		translate([23.5,10,hauteurf/2]){rotate([-90,0,0])cylinder(h=30, r=1.2, $fn=50);}
	}

}

bloc_profile();
translate([0,entraxe+16+16,0]){mirror([0,1,0])bloc_profile();}

translate([5,l_bloc,0]){plaque_moteur();}

translate([ep_bloc_base+3,l_bloc-12,0]){arrondi();}
translate([ep_bloc_base+3,l_bloc+nema+16+15,hauteur]){rotate([180,0,])arrondi();}