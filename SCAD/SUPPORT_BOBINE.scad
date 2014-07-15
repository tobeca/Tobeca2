r_int=28/2;
r_ext=38/2;
h1=2; 
h2=8;

module support_bobine(){
	difference(){
		union(){
			hull(){ //hull de base
				for(i=[0:1:3]){
					rotate([0,0,i*(360/3)])translate([18,0,0]){cylinder(h=h1, r=8, $fn=50);}
				}
			}

			for(i=[0:1:3]){ //emplacement des tubes
				rotate([0,0,i*(360/3)])translate([18,0,h1]){cylinder(h=h2, r=8, $fn=50);}
			}
		}

		for(i=[0:1:3]){ //extrusions pour rentrer de force les tubes
			rotate([0,0,i*(360/3)])translate([18,0,h1]){cylinder(h=h2+5, r=6.3, $fn=50);}
		}
		//trou central de vissage
		translate([0,0,-5]){cylinder(h=20, r=4.5, $fn=50);}
	}

}
support_bobine();