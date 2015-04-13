r_roue=12.5;
r_trou=3;
ep=10;
nb_trou=30;

module trou(){
	translate([r_roue,0,-5]){cylinder(h=ep+10, r=0.7, $fn=50);}

}

module roue(){
	difference(){
		union(){
            cylinder(h=4, r1=r_roue-2, r2=r_roue, $fn=200);
            translate([0,0,4]){cylinder(h=ep-4, r=r_roue, $fn=200);}
            
            //cylindre d'encastrement
            translate([0,0,ep]){cylinder(h=4, r=r_trou+1.2, $fn=100);}
		}

		//trou central
		translate([0,0,1]){cylinder(h=ep+3.02, r1=r_trou, r2=r_trou+0.3, $fn=100);}

		//grip sur le rayon extérieur
		for(i=[0:1:nb_trou]){
		rotate([0,0,i*(360/nb_trou)])trou();
		}

	}
	

}

//roue();

roue();