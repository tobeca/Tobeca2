r_int=20/2;
r_ext=32/2;
h1=2; 
h2=4;

module support_bobine(){
	cylinder(h=h1, r=r_ext, $fn=100);
	translate([0,0,h1]){cylinder(h=h2, r=r_int, $fn=100);}

}
support_bobine();