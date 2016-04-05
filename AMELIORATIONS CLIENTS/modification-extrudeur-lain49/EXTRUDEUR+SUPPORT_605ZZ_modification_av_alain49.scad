largeur=70;
ep=25;
hauteur=60;
r_filament=1.2;
r_m3=2;
ecrou_m3=3.2;
ecart_pignon=4+1.1;
ecart_605=7+1.5;

long_605=30;
ep_605=10;
r_m5=2.9;
r_ecrou_m5=4.6;
r_tube=3.1;

surep=3; //surépaisseur pour les supports 605 par rapport à la version initiale, pour les rendre plus solides
epde=23; //ajout en hauteur pour le bloc extrudeur afin de pouvoir sur monter sur les chariots inversés sur les Tobeca sur mesure

module double_extrudeur(){
	difference(){
	union(){
		cube([largeur,hauteur,ep]);
		translate([0,-epde,0]){cube([largeur,epde,ep]);}
        translate([ep/2-2,-epde,ep/2]){rotate([-90,0,0])cylinder(r=ep/2, h=epde+10, $fn=100);}
        translate([largeur-ep/2+2,-epde,ep/2]){rotate([-90,0,0])cylinder(r=ep/2, h=epde+10, $fn=100);}
	}

		//trous généraux pour passage filament
		translate([18,-50,ep/2]){rotate([-90,0,0])cylinder(r=r_filament, h=150, $fn=50);}
		translate([52,-50,ep/2]){rotate([-90,0,0])cylinder(r=r_filament, h=150, $fn=50);}
        
        //trou pour verrouillage chariot au transport avec insert M3
        translate([18+17,-50,ep/2]){rotate([-90,0,0])cylinder(r=1.7, h=150, $fn=50);}
        translate([18+17,-50,ep/2]){rotate([-90,0,0])cylinder(r=3.3, h=75, $fn=6);}
		

		//lamage pour supporter les tubes en teflon
		translate([18,hauteur+5,ep/2]){rotate([90,0,0])cylinder(r=r_tube, h=10, $fn=50);}
		translate([52,hauteur+5,ep/2]){rotate([90,0,0])cylinder(r=r_tube, h=10, $fn=50);}
		translate([18,hauteur-4.99,ep/2]){rotate([90,0,0])cylinder(r1=r_tube, r2=r_filament, h=4, $fn=100);}
		translate([52,hauteur-4.99,ep/2]){rotate([90,0,0])cylinder(r1=r_tube, r2=r_filament,h=4, $fn=100);}

		//trous de fixation sur plaque alu
		translate([5,-50,ep/2]){rotate([-90,0,0])cylinder(r=r_m3, h=100, $fn=50);}
		translate([largeur-5,-50,ep/2]){rotate([-90,0,0])cylinder(r=r_m3, h=100, $fn=50);}
        translate([5,7,ep/2]){rotate([-90,0,0])cylinder(r=3.5, h=10, $fn=50);}
		translate([largeur-5,7,ep/2]){rotate([-90,0,0])cylinder(r=3.5, h=10, $fn=50);}
		translate([5,-25,ep/2]){rotate([-90,30,0])cylinder(r=ecrou_m3, h=5, $fn=6);}
		translate([largeur-5,-25,ep/2]){rotate([-90,30,0])cylinder(r=ecrou_m3, h=5, $fn=6);}

		//trous pour fixation des moteurs gauche
		translate([17.7+ecart_pignon,10,-5]){cylinder(r=r_m3, h=ep+10, $fn=50);}
		translate([17.7+ecart_pignon,10+44.55,-5]){cylinder(r=r_m3, h=ep+10, $fn=50);}

		translate([17.7+ecart_pignon,10,ep-9]){cylinder(r=4, h=10, $fn=50);}
		translate([17.7+ecart_pignon,10+44.55,ep-9]){cylinder(r=4, h=10, $fn=50);}

		//trous pour fixation des moteurs droite
		translate([52.3-ecart_pignon,10,-5]){cylinder(r=r_m3, h=ep+10, $fn=50);}
		translate([52.3-ecart_pignon,10+44.55,-5]){cylinder(r=r_m3, h=ep+10, $fn=50);}

		translate([52.3-ecart_pignon,10,-0.1]){cylinder(r=4, h=9, $fn=50);}
		translate([52.3-ecart_pignon,10+44.55,-0.1]){cylinder(r=4, h=9, $fn=50);}

		//extrusions pour encastrement bloc moteur et pignon gauche
		translate([52.3-ecart_pignon,10+44.55/2,-5]){cylinder(r=5, h=ep+10, $fn=100);}
		translate([52.3-ecart_pignon,10+44.55/2,ep-3]){cylinder(r=11.2, h=ep, $fn=100);}
		translate([52.3-ecart_pignon,10+44.55/2,ep-10]){cylinder(r=7, h=ep, $fn=100);}

		//extrusions pour encastrement bloc moteur et pignon droite
		translate([17.7+ecart_pignon,10+44.55/2,-5]){cylinder(r=5, h=ep+10, $fn=100);}
		translate([17.7+ecart_pignon,10+44.55/2,-0.01]){cylinder(r=7, h=9, $fn=100);}
		translate([17.7+ecart_pignon,10+44.55/2,8.98]){cylinder(r1=7, r2=5, h=1, $fn=100);}
		translate([17.7+ecart_pignon,10+44.55/2,-0.01]){cylinder(r=11.2, h=3, $fn=100);}
		translate([17.7+ecart_pignon,10+44.55/2,2.98]){cylinder(r1=11.2, r2=7, h=2, $fn=100);}
		
		
		//trous pour roulements 605ZZ
		hull(){
			translate([17.7-ecart_605,10+44.55/2,-5]){cylinder(r=7.5, h=ep+10, $fn=100);}
			translate([17.7-ecart_605+10,10+44.55/2,-5]){cylinder(r=5, h=ep+10, $fn=100);}
		}

		hull(){
			translate([52.3+ecart_605,10+44.55/2,-5]){cylinder(r=7.5, h=ep+10, $fn=100);}
			translate([52.3+ecart_605-10,10+44.55/2,-5]){cylinder(r=5, h=ep+10, $fn=100);}
		}
		
		

		//extrusions pour libérer les roulements
		translate([-5,10,-5]){cube([17.7-ecart_605+5,hauteur,ep+10]);}
		translate([52.3+ecart_605,10,-5]){cube([17.7-ecart_605+5,hauteur,ep+10]);}

		//extrusion haute pour alléger la pièce
		hull(){
			translate([largeur/2,hauteur/2+20,-5]){cylinder(r=4, h=ep+10, $fn=100);}
			translate([largeur/2,hauteur+20,-5]){cylinder(r=10, h=ep+10, $fn=100);}
		}


		//extrusions pour bloquer les têtes

		translate([18,-epde-5,ep/2]){rotate([-90,0,0])cylinder(r=8.5, h=9, $fn=100);}
	
		translate([52,-epde-5,ep/2]){rotate([-90,0,0])cylinder(r=8.5, h=9, $fn=100);}

		//trous traversants pour serrer les ressorts
		translate([-5,10+44.55/2-15+5,6]){rotate([0,90,0])cylinder(r=r_m5, h=100, $fn=50);}
		
		

		translate([-5,10+44.55/2-15+5,ep-6]){rotate([0,90,0])cylinder(r=r_m5, h=100, $fn=50);}
	
		translate([-5,10+44.55/2-15+long_605-5,6]){rotate([0,90,0])cylinder(r=r_m5, h=100, $fn=50);}
		
		translate([-5,10+44.55/2-15+long_605-5,ep-6]){rotate([0,90,0])cylinder(r=r_m5, h=100, $fn=50);}

		//extrusions pour alléger les côtés de la pièce
		hull(){
			translate([10,15,-5]){cylinder(r=5, h=ep+10, $fn=50);}
			translate([10,hauteur-10,-5]){cylinder(r=5, h=ep+10, $fn=50);}
		}

		hull(){
			translate([largeur-10,15,-5]){cylinder(r=5, h=ep+10, $fn=50);}
			translate([largeur-10,hauteur-10,-5]){cylinder(r=5, h=ep+10, $fn=50);}
		}

		//rainures pour le passage de la courroie
		hull(){
		translate([-5,-epde+14,ep-2]){rotate([0,90,0])cylinder(r=7, h=100, $fn=50);}
		translate([-5,-epde+14,ep+7]){rotate([0,90,0])cylinder(r=12, h=100, $fn=50);}
		}

		hull(){
		translate([-5,-epde+14,-7]){rotate([0,90,0])cylinder(r=12, h=largeur/2-1.5, $fn=50);}
		translate([-5,-epde+14,2]){rotate([0,90,0])cylinder(r=7, h=largeur/2-1.5, $fn=50);}
		}

		hull(){
		translate([largeur/2+6.5,-epde+14,-7]){rotate([0,90,0])cylinder(r=12, h=100, $fn=50);}
		translate([largeur/2+6.5,-epde+14,2]){rotate([0,90,0])cylinder(r=7, h=100, $fn=50);}
		}

		//passage de vis pour tenir la courroie
		translate([largeur/2-13,-epde+14,-5]){cylinder(r=r_m3, h=100, $fn=50);}
		translate([largeur/2+13,-epde+14,-5]){cylinder(r=r_m3, h=100, $fn=50);}
		translate([largeur/2-13,-epde+14,0]){cylinder(r=ecrou_m3, h=13, $fn=6);}
		translate([largeur/2+13,-epde+14,0]){cylinder(r=ecrou_m3, h=13, $fn=6);}
	}
}

module support_605(){
	difference(){
		cube([ep,long_605+13,ep_605+1.8+surep]);

		//extrusion pour passage roulement
		//translate([ep/2-3,-8,-5]){cube([6,16,10+10]);}
		translate([ep/2-3,long_605/2,ep_605+surep]){rotate([0,90,0])cylinder(r=10, h=6, $fn=100);}

		//passage d'axe
		hull(){
			translate([-5,15,ep_605+surep]){rotate([0,90,0])cylinder(r=2.5, h=ep+10, $fn=50);}
			translate([-5,15,ep_605+5+surep]){rotate([0,90,0])cylinder(r=2.5, h=ep+10, $fn=50);}
		}
        
        //exrusion pour passage colerette moteur
        hull(){
            translate([1,20,-5]){cylinder(r=2.5, h=ep+10, $fn=50);}
            translate([1,10,-5]){cylinder(r=2.5, h=ep+10, $fn=50);}
        }
        
        hull(){
            translate([ep-1,20,-5]){cylinder(r=2.5, h=ep+10, $fn=50);}
            translate([ep-1,10,-5]){cylinder(r=2.5, h=ep+10, $fn=50);}
        }
		

		//extrusion pour libérer un peu le bloc

		//extrusion pour enlever un peu de largeur à la partie montante
		translate([-0.1,0,ep_605-3+surep]){cube([1.1,30,5]);}
		translate([ep-1,0,ep_605-3+surep]){cube([10,30,5]);}

		//trous pour serrage
		translate([6,5,-5]){cylinder(r=2.7, h=ep+10, $fn=50);}
		translate([ep-6,long_605-5,-5]){cylinder(r=2.7, h=ep+10, $fn=50);}

		//trous libres pour support_605g
		hull(){
			translate([ep-6,5,-5]){cylinder(r=6, h=ep+10, $fn=50);}
			translate([ep-6+5,5,-5]){cylinder(r=6, h=ep+10, $fn=50);}
			translate([ep-6,0,-5]){cylinder(r=6, h=ep+10, $fn=50);}
		}

		hull(){
			translate([6,long_605-5,-5]){cylinder(r=6, h=ep+10, $fn=50);}
			translate([6-5,long_605-5,-5]){cylinder(r=6, h=ep+10, $fn=50);}
			translate([6,long_605,-5]){cylinder(r=6, h=ep+10, $fn=50);}
		}

		

		//rognage sur les bords pour ne pas frotter sur les blocs moteurs
		translate([-1,-5,-5]){cube([2,long_605+10,ep_605+10]);}
		translate([ep-1,-5,-5]){cube([2,long_605+10,ep_605+10]);}


      //modif pour ergot
        translate([-1,30,-1]){cube([13,40,ep_605+10]);}
        translate([-1,30,7]){cube([45,40,ep_605+10]);}
        translate([ep-1,30,-1]){cube([27,40,ep_605+10]);}

	hull(){
			translate([-5,31.2,7.4]){rotate([0,90,0])cylinder(r=1.2, h=ep+10, $fn=50);}
			translate([-5,45,7.4]){rotate([0,90,0])cylinder(r=1.2, h=ep+10, $fn=50);}}
    

	}
    
 

}

//double_extrudeur();
//translate([-surep,10+44.55/2-15,ep]){rotate([0,90,0])support_605();}
//translate([largeur+surep,10+44.55/2-15,0]){rotate([0,-90,0])support_605();}

//translate([100,0,0]){support_605();}
support_605();
