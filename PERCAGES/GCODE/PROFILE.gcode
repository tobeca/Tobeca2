; Generation GCODE par OpenASCAM - Adrien Grelet - 2013
; Generation fichier : Mon Jun 23 17:41:56 2014

; ep_matiere=5.4
; marge_z=15
; f_deplacement=300
; f_descente=500
; z_passe_percer=1
; off_x=3.5
; off_y=-1
; accel=3000
; d_fraise=3
; z_passe_decouper=3
; f_decoupe=350
; off_z=2
; f_centrage=200

G21 ; set units to millimeters
G28 ; home all axes
G90 ; use absolute coordinates
G1 F300 ; vitesse de déplacement des axes
G1 Z22.4 F3000 ; hauteur de déplacement Z, incluant son offset

G1 F300
G1 X35.0 Y42.0 F3000
G1 F500
G1 Z8.9 F3000
G1 F200
G1 Z7.9 F200
G1 F500
G1 Z22.4 F3000

G1 F300
G1 X55.0 Y42.0 F3000
G1 F500
G1 Z8.9 F3000
G1 F200
G1 Z7.9 F200
G1 F500
G1 Z22.4 F3000

G1 F300
G1 X17.5 Y79.0 F3000
G1 F500
G1 Z8.9 F3000
G1 F200
G1 Z7.9 F200
G1 F500
G1 Z22.4 F3000

G1 F300
G1 X72.5 Y79.0 F3000
G1 F500
G1 Z8.9 F3000
G1 F200
G1 Z7.9 F200
G1 F500
G1 Z22.4 F3000

M42 P7 S0 ; on arrête la fraise
G1 Z40 
G28 X0 Y0 ; on retourne au home mais on laisse le Z à sa dernière position
