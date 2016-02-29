; Generation GCODE par OpenASCAM - Adrien Grelet - 2013
; Generation fichier : Mon Sep 29 10:19:44 2014

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

; d_bord=5
; longueur=210
; x_dou=28
; y_dou=21
; offy=21.5
M140 S100
G1 F300
G1 X81.0 Y17.5 F3000
G1 F500
G1 Z30.5 F3000
G1 F350
G1 Z20.0 F500
G1 F350
G1 X81.0 Y72.5 F3000
G1 X136.0 Y72.5 F3000
G1 X136.0 Y17.5 F3000
G1 X81.0 Y17.5 F3000
G1 Z41.0 F3000
G1 F300
G1 X81.0 Y177.5 F3000
G1 F500
G1 Z30.5 F3000
G1 F350
G1 Z20.0 F500
G1 F350
G1 X81.0 Y282.5 F3000
G1 X136.0 Y282.5 F3000
G1 X136.0 Y177.5 F3000
G1 X81.0 Y177.5 F3000
G1 Z41.0 F3000
G1 F300
G1 X81.0 Y387.5 F3000
G1 F500
G1 Z30.5 F3000
G1 F350
G1 Z20.0 F500
G1 F350
G1 X81.0 Y442.5 F3000
G1 X136.0 Y442.5 F3000
G1 X136.0 Y387.5 F3000
G1 X81.0 Y387.5 F3000
G1 Z41.0 F3000
G1 Z40 
M140 S0
G1 X5 Y5 F3000
