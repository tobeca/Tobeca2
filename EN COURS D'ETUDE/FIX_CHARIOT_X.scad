r_ecrou_m3=3.3;
l_gorge_collier=1;
r_douille=8;
r_trou_m3=2;
r_vis=1.4;

module base_piece(){
difference(){
	union(){
		cube([ 100, 18, 9 ]);
	
		//excroissance pour montage courroie de gauche
		translate([20.5,-11,0]){cube([10,11,6]);}

	}
	
	//passages pour colliers droites
	translate([3,0,0]){cube([ 4, l_gorge_collier, 9 ]);}
	translate([18.5,-2,0]){cube([ 4, l_gorge_collier+2, 9 ]);}
	//translate([25.5+15,0,0]){cube([ 4, l_gorge_collier, 9 ]);}
	//translate([40.5+15,0,0]){cube([ 4, l_gorge_collier, 9 ]);}
	translate([47.5+30,0,0]){cube([ 4, l_gorge_collier, 9 ]);}
	translate([63+30,0,0]){cube([ 4, l_gorge_collier, 9 ]);}
	
	//passages pour colliers gauches
	translate([3,17,0]){cube([ 4, l_gorge_collier, 9 ]);}
	translate([18.5,17,0]){cube([ 4, l_gorge_collier, 9 ]);}
	//translate([25.5+15,17,0]){cube([ 4, l_gorge_collier, 9 ]);}
	//translate([40.5+15,17,0]){cube([ 4, l_gorge_collier, 9 ]);}
	translate([47.5+30,17,0]){cube([ 4, l_gorge_collier, 9 ]);}
	translate([63+30,17,0]){cube([ 4, l_gorge_collier, 9 ]);}

	//passages pour colliers dessous
	translate([3,1,0]){cube([ 4, 16, l_gorge_collier*3 ]);}
	translate([18.5,1,0]){cube([ 4, 16, l_gorge_collier*3 ]);}
	//translate([25.5+15,1,0]){cube([ 4, 16, l_gorge_collier*3 ]);}
	//translate([40.5+15,1,0]){cube([ 4, 16, l_gorge_collier*3 ]);}
	translate([47.5+30,1,0]){cube([ 4, 18, l_gorge_collier*3 ]);}
	translate([63+30,1,0]){cube([ 4, 16, l_gorge_collier*3 ]);}

	//cylindre pour passage douilles
	translate([-1,9,14]){rotate([0,90,0])cylinder(h = 120, r = r_douille+0.3, $fn=100);}

	//cylindres pour trous vis
	translate([10+15,9,0]){cylinder(h = 7, r = r_trou_m3, $fn=100);}
	translate([60+15,9,0]){cylinder(h = 7, r = r_trou_m3, $fn=100);}
	//hexagones pour écrous
	translate([10+15,9,1.7]){cylinder(h = 7, r = r_ecrou_m3, $fn=6);}
	translate([60+15,9,1.7]){cylinder(h = 7, r = r_ecrou_m3, $fn=6);}

	//trous pour vissage ventilateur
	translate([50-16,-5,6]){rotate([-90,0,0])cylinder(r=2, h=25, $fn=50);}
	translate([50+16,-5,6]){rotate([-90,0,0])cylinder(r=2, h=25, $fn=50);}

	//trous pour vissage ventilateur
	translate([50-16-17.7,-0.01,6]){rotate([-90,0,0])cylinder(r=2, h=25, $fn=50);}
	translate([50+16-17.7,-5,6]){rotate([-90,0,0])cylinder(r=2, h=25, $fn=50);}

	//trou pour fixation courroie
	translate([25,-5.5,-5]){cylinder(r=2, h=25, $fn=50);}
	translate([25,-5.5,-0.01]){cylinder(r1=3, r2=2, h=2.5, $fn=50);}
}
}


base_piece();