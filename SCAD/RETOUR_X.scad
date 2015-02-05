r_m3=2;
r_ecrou_m3=3.3;
r_int=2.4;
ep_roul=5;
ep=2;
l=42;
height=30;
r_arr=4;

module retour_x(){
	difference(){
		union(){
		hull(){
			cube([l/4,l,ep]);
			translate([l/4+r_arr-2,r_arr,0]){cylinder(r=r_arr, h=ep, $fn=50);}
			translate([l/2-7,l/2,0]){cylinder(r=8, h=ep, $fn=50);}
			translate([l/4+r_arr-2,l-r_arr,0]){cylinder(r=r_arr, h=ep, $fn=50);}
		}
		
		//translate([l/4,l/2,0]){cylinder(r=l/2, h=ep, $fn=100);}

		translate([l/2-7,l/2,ep]){cylinder(r1=8, r2=4,h=height/2-ep_roul/2-0.5, $fn=100);}
		translate([l/2-7,l/2,ep+height/2-ep_roul/2-0.5]){cylinder(r=3, h=0.5, $fn=50);}

		translate([l/2-7,l/2,ep+height/2-2-ep_roul/2+2]){cylinder(r=r_int, h=ep_roul/2, $fn=50);}

		}
	
		//trous pour fixation
		translate([5.5,5.5,-5]){cylinder(r=r_m3, h=15, $fn=50);}
		translate([5.5,l-5.5,-5]){cylinder(r=r_m3, h=15, $fn=50);}
		
		translate([l/2-7,l/2,-5]){cylinder(r=r_m3-0.3, h=50, $fn=50);}

		
	}


}
retour_x();