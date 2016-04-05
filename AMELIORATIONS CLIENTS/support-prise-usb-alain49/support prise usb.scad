//**************************************
//* Support prise USB pour Tobeca 2    *
//* Auteur : Alain Vivion              *
//* Date finalisation : 31/03/2016     *
//**************************************

module support_prise() {
difference(){
   union(){
        hull() {
            cylinder(2,4,4,false,$fn=100);
            translate([27,0,0]) cylinder(2,4,4,false,$fn=100);
            translate([0,52,0]) cylinder(2,4,4,false,$fn=100);
            translate([27,52,0]) cylinder(2,4,4,false,$fn=100); 
        } 
        translate([4,6,1])cube([2,40,11]);
        translate([21,6,1])cube([2,40,11]);
        translate([4,4,1])cube([19,2,11]);
        translate([4,46,1])cube([19,2,11]);
    };
    translate([27/2-6,52/2-6.5,-1])cube([12,13,4]);
    translate([27/2,52/2-14,0])cylinder(6,2,2,true,$fn=100);
    translate([27/2,52/2+14,0])cylinder(6,2,2,true,$fn=100);
    translate([1,1,0])cylinder(6,1.5,1.5,true,$fn=100);
    translate([27-1,1,0])cylinder(6,1.5,1.5,true,$fn=100);
    translate([1,52-1,0])cylinder(6,1.5,1.5,true,$fn=100);
    translate([27-1,52-1,0])cylinder(6,1.5,1.5,true,$fn=100);
 } 
} 

        
module contre_plaque() { 
difference(){
            translate([-20+3.75,-4,0])cube([49,60,2]);
     
            translate([3.75,3.75,-1])cube([19.5,44.5,4]);
            translate([1,1,0])cylinder(40,1.5,1.5,true,$fn=100);
            translate([27-1,1,0])cylinder(40,1.5,1.5,true,$fn=100);
            translate([1,52-1,0])cylinder(40,1.5,1.5,true,$fn=100);
            translate([27-1,52-1,0])cylinder(40,1.5,1.5,true,$fn=100);
 }
 }
 
 support_prise();
 //contre_plaque();