r_m3=2;
r_ecrou_m3=3.3;
r_m8=3.9;
ep_608=7;
ep=2;
l=42;
height=30;

module retour_x(){
	difference(){
		union(){
		cube([l/4,l,ep]);
		translate([l/4,l/2,0]){cylinder(r=l/2, h=ep, $fn=100);}

		translate([l/2,l/2,ep]){cylinder(r=7.5, h=height/2-ep_608/2-0.5, $fn=100);}
		translate([l/2,l/2,ep+height/2-ep_608/2-0.5]){cylinder(r=5.5, h=0.5, $fn=50);}

		translate([l/2,l/2,ep+height/2-2-ep_608/2+2]){cylinder(r=r_m8, h=ep_608/2, $fn=50);}

		}
	
		//trous pour fixation
		translate([5.5,5.5,-5]){cylinder(r=r_m3, h=15, $fn=50);}
		translate([l-5.5,5.5,-5]){cylinder(r=r_m3, h=15, $fn=50);}
		translate([5.5,l-5.5,-5]){cylinder(r=r_m3, h=15, $fn=50);}
		translate([l-5.5,l-5.5,-5]){cylinder(r=r_m3, h=15, $fn=50);}
		
		translate([l/2,l/2,-5]){cylinder(r=r_m3, h=50, $fn=50);}

		//rabotage de la pièce pour rentrer
		translate([25,-5,-5]){cube([60,60,50]);}
		translate([-15,-5,-5]){cube([15,60,50]);}
	}


}
retour_x();