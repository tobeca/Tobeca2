r_ecrou_m3=3.3;
l_gorge_collier=1;
l_co=4;
r_douille=7.5;
r_trou_m3=2;
r_vis=1.4;
long=70;
emot=32;
l_douille=24.5;

module base_piece(){
difference(){
	union(){
	cube([ long, 18, 9 ]);
	translate([-5,0,0]){cube([ 5, 18, 9 ]);}
	translate([long,0,0]){cube([ 5, 18, 9 ]);}
	}
	
	//passages pour colliers droites
	translate([4-l_co/2,0,0]){cube([ l_co, l_gorge_collier, 9 ]);}
	translate([l_douille-4-l_co/2,0,0]){cube([ l_co, l_gorge_collier, 9 ]);}
	translate([long-l_douille+4-l_co/2,0,0]){cube([ l_co, l_gorge_collier, 9 ]);}
	translate([long-4-l_co/2,0,0]){cube([ l_co, l_gorge_collier, 9 ]);}
	
	//passages pour colliers gauches
	translate([4-l_co/2,17,0]){cube([ l_co, l_gorge_collier, 9 ]);}
	translate([l_douille-4-l_co/2,17,0]){cube([ l_co, l_gorge_collier, 9 ]);}
	translate([long-l_douille+4-l_co/2,17,0]){cube([ l_co, l_gorge_collier, 9 ]);}
	translate([long-4-l_co/2,17,0]){cube([ l_co, l_gorge_collier, 9 ]);}

	//passages pour colliers dessous
	translate([4-l_co/2,1,0]){cube([ l_co, 16, l_gorge_collier*3 ]);}
	translate([l_douille-4-l_co/2,1,0]){cube([ l_co, 16, l_gorge_collier*3 ]);}
	translate([long-l_douille+4-l_co/2,1,0]){cube([ l_co, 18, l_gorge_collier*3 ]);}
	translate([long-4-l_co/2,1,0]){cube([ l_co, 16, l_gorge_collier*3 ]);}

	//cylindre pour passage douilles
	translate([-0.1,9,13]){
		rotate([0,90,0])cylinder(h = l_douille, r = r_douille, $fn=100);
	}

	//cylindre pour passage douilles
	translate([long-l_douille,9,13]){
		rotate([0,90,0])cylinder(h = l_douille, r = r_douille, $fn=100);
	}

	//cylindres pour trous vis
	translate([10,9,0]){cylinder(h = 7, r = r_trou_m3, $fn=100);}
	translate([60,9,0]){cylinder(h = 7, r = r_trou_m3, $fn=100);}
	//hexagones pour écrous
	translate([10,9,1.7]){cylinder(h = 7, r = r_ecrou_m3, $fn=6);}
	translate([60,9,1.7]){cylinder(h = 7, r = r_ecrou_m3, $fn=6);}

	//translate([17.4,-5,4]){rotate([-90,0,0])cylinder(r=r_vis, h=25, $fn=50);}
	//translate([35,-5,4]){rotate([-90,0,0])cylinder(r=r_vis, h=25, $fn=50);}
	//translate([52.6,-5,4]){rotate([-90,0,0])cylinder(r=r_vis, h=25, $fn=50);}

	//trou pour vissage ventilateur de gauche
	translate([-5+4,-5,4]){rotate([-90,0,0])cylinder(r=r_vis, h=25, $fn=50);}
	translate([-5+4+emot,-5,4]){rotate([-90,0,0])cylinder(r=r_vis, h=25, $fn=50);}

	//trou pour vissage ventilateur de droite
	translate([long+5-4,-5,4]){rotate([-90,0,0])cylinder(r=r_vis, h=25, $fn=50);}
	translate([long+5-4-emot,-5,4]){rotate([-90,0,0])cylinder(r=r_vis, h=25, $fn=50);}


}
}


base_piece();