entraxe=32;
larg=40;
r_m3=2;
r_corpstete=8.5;

module plaque_rapporte(){ //plaque pour ne pas tout ouvrir au niveau du trou central
	difference(){
		cube([larg,17,2]);
		//trous de montage ventilateur
		translate([4,4,-5]){cylinder(r=r_m3, h=10, $fn=50);}
		translate([larg-4,4,-5]){cylinder(r=r_m3, h=10, $fn=50);}
		
	}
}

module support_fan(){
	difference(){
		//plaque de base
		cube([larg,larg,2]);


		//trous de montage ventilateur
		translate([4,4,-5]){cylinder(r=r_m3, h=10, $fn=50);}
		translate([larg-4,4,-5]){cylinder(r=r_m3, h=10, $fn=50);}

		//trou central
		translate([20,20,-5]){cylinder(r=18, h=10, $fn=100);}
	}
}

module cone(){
	difference(){
		hull(){
			translate([0,0,0]){cube([larg,larg,1]);}
			translate([larg/2,0,36]){rotate([-90,0,0])cylinder(r=r_corpstete+2, h=larg, $fn=100);}
		}

		hull(){
			translate([2,2,-0.01]){cube([larg-4,larg-4,1]);}
			translate([larg/2,2,36]){rotate([-90,0,0])cylinder(r=r_corpstete+1, h=larg-4-10, $fn=100);}
		}

		hull(){
			translate([-5,-3,3]){rotate([0,90,0])cylinder(r=3, h=larg+10, $fn=50);}
			translate([-5,7,3]){rotate([0,90,0])cylinder(r=3, h=larg+10, $fn=50);}
			translate([-5,12,8.5]){rotate([0,90,0])cylinder(r=7.5, h=larg+10, $fn=50);}
			//translate([-5,5,20]){rotate([0,90,0])cylinder(r=6, h=larg+10, $fn=50);}
			translate([-5,0,35]){rotate([0,90,0])cylinder(r=3, h=larg+10, $fn=50);}

		}

		//on coupe le chapeau
		translate([larg/2,-5,36]){rotate([-90,0,0])cylinder(r=r_corpstete+1, h=larg+10, $fn=100);}
		translate([0,-5,36+1]){cube([100,larg+10,20]);}

		translate([0,larg,0]){rotate([14.2,0,0])cube([50,20,50]);}

	}
}

support_fan();
//plaque_rapporte();
translate([0,0,2]){cone();}