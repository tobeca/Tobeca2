r_int=28/2;
r_ext=38/2;
h1=2; 
h2=8;

module support_bobine(){
	difference(){
		union(){
			cylinder(h=h1, r=15, $fn=100);
			translate([0,0,h1]){cylinder(h=h2, r1=11, r2=9, $fn=100);}
		}

			translate([0,0,h1]){cylinder(h=h2+5, r=6.3, $fn=100);}

			translate([0,0,-5]){cylinder(h=h2+10, r=4.2, $fn=100);}
	}

}

support_bobine();
