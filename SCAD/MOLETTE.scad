r_molette=12; //10 pour les petites et 12 pour les grandes
r_trou=1.5;
trou_m3=1.8;
ecrou_m3=3.2;
ep=5;
nb_trou=12;

module trou(){
	translate([r_molette,0,-5]){cylinder(h=ep+10, r=r_trou, $fn=50);}

}

module molette(){
	difference(){
        union(){
           cylinder(h=2, r1=r_molette-2, r2=r_molette, $fn=100);
            translate([0,0,2]){cylinder(h=ep, r=r_molette, $fn=100);}
            translate([0,0,ep+2]){cylinder(h=2, r1=r_molette, r2=r_molette-2, $fn=100);}
        }

		translate([0,0,-5]){cylinder(h=50, r=trou_m3, $fn=50);}
		translate([0,0,-0.02]){cylinder(h=5, r=ecrou_m3, $fn=6);}
        translate([0,0,-0.02+5+5]){cylinder(h=5, r=ecrou_m3, $fn=6);}

		for(i=[0:1:nb_trou]){
		rotate([0,0,i*(360/nb_trou)])trou();
		}

	}

}

molette();