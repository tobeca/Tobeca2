; Generation GCODE par OpenASCAM - Adrien Grelet - 2013
; Generation fichier : Mon Oct 12 21:28:31 2015

; ep_matiere=9
; marge_z=12
; f_deplacement=300
; f_descente=500
; z_passe_percer=1
; off_x=3.5
; off_y=-1.5
; accel=3000
; d_fraise=5
; z_passe_decouper=3
; f_decoupe=350
; off_z=20
; f_centrage=200

G21 ; set units to millimeters
G28 ; home all axes
G90 ; use absolute coordinates
G1 F300 ; vitesse de déplacement des axes
G1 Z41.0 F3000 ; hauteur de déplacement Z, incluant son offset

; offy=21.5
M140 S100
G1 F300
G1 X76.0 Y180.0 F3000
G1 F500
G1 Z30.5 F3000
G1 F350
G1 Z20.0 F500
G1 F350
G1 X76.0 Y270.0 F3000
G1 X151.0 Y270.0 F3000
G1 X151.0 Y180.0 F3000
G1 X76.0 Y180.0 F3000
G1 Z41.0 F3000
M42 P7 S0 ; on arrête la fraise
G1 Z40 
M140 S0
G1 X5 Y5 F3000 ; on retourne au home mais on laisse le Z à sa dernière position
