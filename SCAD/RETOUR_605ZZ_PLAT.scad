d1=14.5;
ep=2;
d_fla=d1+ep*2+3;
h_courroie=6;
h_fla=1;
h_pla=0.5;
ep_roul=5;

module poulie(){
	difference(){
		union(){
			cylinder(h = h_pla, r = d_fla/2, $fn=100);
			translate([0,0,h_pla]){cylinder(h = h_fla, r1 = d_fla/2, r2=d1/2+ep, $fn=100);}

			translate([0,0,h_fla+h_pla]){cylinder(h = h_courroie, r = d1/2+ep, $fn=200);}
	
			translate([0,0,h_fla+h_pla+h_courroie]){cylinder(h = h_fla, r1=d1/2+ep, r2 = d_fla/2, $fn=100);}
			translate([0,0,h_fla*2+h_pla+h_courroie]){cylinder(h = h_pla, r = d_fla/2, $fn=100);}
		}

		translate([0,0,-5]){cylinder(h = h_courroie+15, r = 6, $fn=100);}

		//extrusion pour sertir le roulement
		translate([0,0,(h_pla*2+h_fla*2+h_courroie)/2-ep_roul/2]){cylinder(h = h_courroie+15, r = d1/2, $fn=100);}
		translate([0,0,(h_pla*2+h_fla*2+h_courroie)/2-ep_roul/2+h_courroie]){cylinder(h = 2, r1 = d1/2, r2= d1/2+1, $fn=100);}
	}
}
poulie();