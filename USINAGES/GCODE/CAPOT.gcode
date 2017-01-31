; Generation GCODE par OpenASCAM - Adrien Grelet - 2013
; Generation fichier : Thu Jan 19 16:51:59 2017

; ep_matiere=27
; marge_z=15
; f_deplacement=300
; f_descente=700
; z_passe_percer=1
; off_x=3.5
; off_y=-1.5
; accel=3000
; d_fraise=3
; z_passe_decouper=3
; f_decoupe=500
; off_z=2
; f_centrage=200

G21 ; set units to millimeters
G28 ; home all axes
G90 ; use absolute coordinates
G1 F300 ; vitesse de déplacement des axes
G1 Z44.0 F3000 ; hauteur de déplacement Z, incluant son offset
M140 S100 ; on demarre la fraise

; d_bord=4.5
; longueur=443
; largeur=414
G1 F300
G1 X129.5 Y3.0 F3000
G1 F700
G1 Z30.5 F3000
G1 F200
G1 Z29.5 F200
G4 P3000
G1 F500
G1 Z2.0 F700
G1 F700
G1 Z44.0 F3000
G1 F300
G1 X289.5 Y3.0 F3000
G1 F700
G1 Z30.5 F3000
G1 F200
G1 Z29.5 F200
G4 P3000
G1 F500
G1 Z2.0 F700
G1 F700
G1 Z44.0 F3000
G1 F300
G1 X413.0 Y143.5 F3000
G1 F700
G1 Z30.5 F3000
G1 F200
G1 Z29.5 F200
G4 P3000
G1 F500
G1 Z2.0 F700
G1 F700
G1 Z44.0 F3000
G1 F300
G1 X413.0 Y298.5 F3000
G1 F700
G1 Z30.5 F3000
G1 F200
G1 Z29.5 F200
G4 P3000
G1 F500
G1 Z2.0 F700
G1 F700
G1 Z44.0 F3000
G1 F300
G1 X289.5 Y437.0 F3000
G1 F700
G1 Z30.5 F3000
G1 F200
G1 Z29.5 F200
G4 P3000
G1 F500
G1 Z2.0 F700
G1 F700
G1 Z44.0 F3000
G1 F300
G1 X129.5 Y437.0 F3000
G1 F700
G1 Z30.5 F3000
G1 F200
G1 Z29.5 F200
G4 P3000
G1 F500
G1 Z2.0 F700
G1 F700
G1 Z44.0 F3000
G1 F300
G1 X8.0 Y298.5 F3000
G1 F700
G1 Z30.5 F3000
G1 F200
G1 Z29.5 F200
G4 P3000
G1 F500
G1 Z2.0 F700
G1 F700
G1 Z44.0 F3000
G1 F300
G1 X8.0 Y143.5 F3000
G1 F700
G1 Z30.5 F3000
G1 F200
G1 Z29.5 F200
G4 P3000
G1 F500
G1 Z2.0 F700
G1 F700
G1 Z44.0 F3000
G1 Z40 
M140 S0 ; on arrête la fraise
G1 X5 Y5 F3000 ; on retourne au home mais on laisse le Z à sa dernière position
