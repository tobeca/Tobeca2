###############################TODO##############################
#	Faire un module de contrôle du fichier au lancement, et afficher des messages d'erreur de compilation si problèmes de syntaxe.
#	Ajouter la fonction de coupe extérieur de Kevin
#	Faire un module de coupe intérieure
###############################/TODO##############################
from __future__ import division
import time
import operator
import math

 
class GestionVariables: #Classe permettant la gestion des variables et des paramètres définis dans le code à compiler
	def __init__(self,lignes,colonnes):
		self.liste = []
		for i in range(lignes) :
			self.liste.append(list(range(colonnes)))
		
	def map_clear(self):
		x = 0
		while x<len(self.liste):
			y=0
			while y<len(self.liste[x]):
				self.liste[x][y]=0
				y+=1
			x+=1
	
	def base(self, liste_param):
		x = 0
		while x<len(liste_param):
			self.liste[x][0]=liste_param[x]
			x+=1
	
	def trier(self,nb_var): #permet de trier les listes par longueur de nom de champ. Ainsi, comme la recherche des variables dans calculs_variables est séquentielle, on s'assure d'avoir un bon remplacement des bonnes variables par la bonne valeur.
		for i in range(nb_var):
			self.liste[i][2]=len(self.liste[i][0])
		self.liste.sort(key=operator.itemgetter(2),reverse=True)
		
	def stockage(self,chaine):
	#fonction de recherche des variables déclarées
		index = 0
		global nb_var
		while index < len(chaine): #on cherche les caractères entourant la valeur
			if chaine[index] == "=":
				nbegal=index
			if chaine[index] == ";":
				nbpoint=index
				self.liste[nb_var][0]=chaine[0:nbegal] #sauvegarde du nom de la valeur
				self.liste[nb_var][1]=chaine[nbegal+1:nbpoint] #sauvegarde de la valeur
				filout.write('; '+str(self.liste[nb_var][0])+'='+self.liste[nb_var][1]+'\n')
				nb_var+=1
			
			index = index+1
			
	def calculer(self,chaine,nb_var,debut,fin):
		#fonction de calcul avec les variables qui peuvent être passées en paramètres pour les coordonnées
		i=0
		newchaine=chaine[debut:fin]
		valeur=0
		for i in range(nb_var): #lecture de tout le tableau des variables
			if str(self.liste[i][0]) in chaine[debut:fin]: #si le nom de la variable est contenu dans la chaine
				newchaine=newchaine.replace(str(self.liste[i][0]),str(self.liste[i][1]))
			else: #si aucune variable n'est dans la chaine, alors on prend la valeur telle quelle
				valeur=chaine[debut:fin]
		
		valeur=float(eval(newchaine))
		return valeur	

	def recherche(self,chaine,liste_parametres,num):
		#fonction de recherche des parametres de base
		for i in liste_parametres:
			if i in chaine: #si la variable est dans la chaine
				index = 0
				while index < len(chaine): #on cherche les caractères entourant la valeur
					if chaine[index] == "=":
						nbegal=index
					if chaine[index] == ";":
						nbpoint=index
						self.liste[num][1]=chaine[nbegal+1:nbpoint]
						filout.write('; '+i+'='+str(self.liste[num][1])+'\n')
						num=num+1
					index = index+1
		return num

class Instructions: #les différentes fonctions d'instructions possibles pour usiner, percer...
	def __init__(self):
		self=0
	
	def startwrite(self, parametres):
		#fonction du début de l'écriture du fichier GCODE avec des valeurs fixées
		filout.write('G21 ; set units to millimeters\n')
		filout.write('G28 ; home all axes\n')
		filout.write('G90 ; use absolute coordinates\n')
		filout.write('G1 F'+parametres.liste[2][1]+' ; vitesse de déplacement des axes\n')
		h_travail = float(parametres.liste[0][1])+float(parametres.liste[1][1])+float(parametres.liste[11][1])
		
		filout.write('G1 Z'+str(h_travail)+' F'+parametres.liste[7][1]+' ; hauteur de déplacement Z, incluant son offset\n')
		filout.write('M140 S100 ; on demarre la fraise\n')
		filout.write('\n')
			
	def trou(self,chaine,nb_var,parametres): #fonction pour percer un trou
		index=0
		h_travail = float(parametres.liste[0][1])+float(parametres.liste[1][1])+float(parametres.liste[11][1])
		while index < len(chaine): #on cherche les caractères entourant les valeurs
			if chaine[index] == "[":
				nbparouvre=index
			if chaine[index] == ",":
				nbvirgule=index
			if chaine[index] == "]":
				nbparferme=index
			index = index+1

		pos_x=variables.calculer(chaine,nb_var,nbparouvre+1,nbvirgule)+float(parametres.liste[5][1])
		pos_y=variables.calculer(chaine,nb_var,nbvirgule+1,nbparferme)+float(parametres.liste[6][1])
	
		filout.write('G1 F'+parametres.liste[2][1]+'\n')
		filout.write('G1 X'+str(pos_x)+' Y'+str(pos_y)+' F'+parametres.liste[7][1]+'\n')
	
		for i in range(1,int(parametres.liste[4][1])+1):
			filout.write('G1 F'+parametres.liste[3][1]+'\n') #définition de la vitesse de descente en déplacement rapide
			
			affleurement=(float(parametres.liste[4][1])-i+1)*float(parametres.liste[0][1])/float(parametres.liste[4][1])+float(parametres.liste[11][1])+1.5
			
			filout.write('G1 Z'+str(affleurement)+' F'+parametres.liste[7][1]+'\n') #descente pour affleurer la matière à percer
			
			filout.write('G1 F'+parametres.liste[12][1]+'\n') #définition de la vitesse de descente en centrage
			zcentrage=float(parametres.liste[0][1])+float(parametres.liste[11][1])+0.5 #calcul de la profondeur de centrage
			filout.write('G1 Z'+str(zcentrage)+' F'+parametres.liste[12][1]+'\n') #centrage à la profondeur calculée
			filout.write('G4 P3000\n') #on attend la stabilisation du forêt avant de poursuivre
			
			filout.write('G1 F'+parametres.liste[10][1]+'\n') #définition de la vitesse de descente en perçage
			
			profondeur=(float(parametres.liste[4][1])-i)*float(parametres.liste[0][1])/float(parametres.liste[4][1])+float(parametres.liste[11][1]) #calcul de la profondeur à percer, en fonction du nombre de passe
			
			filout.write('G1 Z'+str(profondeur)+' F'+parametres.liste[3][1]+'\n') #perçage à la profondeur calculée
			filout.write('G1 F'+parametres.liste[3][1]+'\n') #vitesse de déplacement normale
			filout.write('G1 Z'+str(h_travail)+' F'+parametres.liste[7][1]+'\n') #remontée du forêt

	def rectangle(self,chaine,nb_var,parametres): #fonction pour couper un rectangle
		index=0
		tokvir1=0
		tokvir2=0
		tokvir3=0
		h_travail = float(parametres.liste[0][1])+float(parametres.liste[1][1])+float(parametres.liste[11][1])
		r_fraise = float(parametres.liste[8][1])/2

		while index < len(chaine): #on cherche les caractères entourant les valeurs
			if chaine[index] == "[":
				nbparouvre=index
			if chaine[index] == "," and tokvir1==0:
				nbvirgule1=index
				tokvir1=1
				index = index+1
			if chaine[index] == "," and tokvir2==0:
				nbvirgule2=index
				tokvir2=1
				index = index+1
			if chaine[index] == "," and tokvir3==0:
				nbvirgule3=index
				tokvir3=1
				index = index+1
			if chaine[index] == "]":
				nbparferme=index
			index = index+1

		#print("nbvigule1 :",nbvirgule1)
		#print("nbvigule2 :",nbvirgule2)
		#print("nbvigule3 :",nbvirgule3)

		pos_x1=variables.calculer(chaine,nb_var,nbparouvre+1,nbvirgule1)+float(parametres.liste[5][1])+r_fraise #coordonnée X du point bas gauche du rectangle
		pos_y1=variables.calculer(chaine,nb_var,nbvirgule1+1,nbvirgule2)+float(parametres.liste[6][1])+r_fraise #coordonnée Y du point bas gauche du rectangle
		pos_x2=variables.calculer(chaine,nb_var,nbvirgule2+1,nbvirgule3)+float(parametres.liste[5][1])-r_fraise #coordonnée X du point bas droite du rectangle
		pos_y2=variables.calculer(chaine,nb_var,nbvirgule3+1,nbparferme)+float(parametres.liste[6][1])-r_fraise #coordonnée Y du point haut droite du rectangle

		filout.write('G1 F'+parametres.liste[2][1]+'\n')
		filout.write('G1 X'+str(pos_x1)+' Y'+str(pos_y1)+' F'+parametres.liste[7][1]+'\n')

		filout.write('G1 F'+parametres.liste[3][1]+'\n') #définition de la vitesse de descente en déplacement rapide	
		affleurement=float(parametres.liste[0][1])+float(parametres.liste[11][1])+1.5
		filout.write('G1 Z'+str(affleurement)+' F'+parametres.liste[7][1]+'\n') #descente pour affleurer la matière à percer
			
		filout.write('G1 F'+parametres.liste[10][1]+'\n') #définition de la vitesse de descente en usinage
			
		profondeur=float(parametres.liste[11][1]) #calcul de la profondeur à usiner
		filout.write('G1 Z'+str(profondeur)+' F'+parametres.liste[3][1]+'\n') #perçage à la profondeur calculée
		
		filout.write('G1 F'+parametres.liste[10][1]+'\n') #vitesse de déplacement en usinage
		filout.write('G1 X'+str(pos_x1)+' Y'+str(pos_y2)+' F'+parametres.liste[7][1]+'\n') #on usine jusqu'au point d'après
		filout.write('G1 X'+str(pos_x2)+' Y'+str(pos_y2)+' F'+parametres.liste[7][1]+'\n') #on usine jusqu'au point d'après
		filout.write('G1 X'+str(pos_x2)+' Y'+str(pos_y1)+' F'+parametres.liste[7][1]+'\n') #on usine jusqu'au point d'après
		filout.write('G1 X'+str(pos_x1)+' Y'+str(pos_y1)+' F'+parametres.liste[7][1]+'\n') #on revient au point initial

		filout.write('G1 Z'+str(h_travail)+' F'+parametres.liste[7][1]+'\n') #remontée du forêt


	
liste_parametres=['ep_matiere','marge_z','f_deplacement','f_descente','z_passe_percer','off_x','off_y','accel','d_fraise','z_passe_decouper','f_decoupe','off_z','f_centrage']
#			0	1		2		3		4	5	6	7	8		9		10	11		12
num=0 #nombre de paramètres de base
parametres=GestionVariables(30,2) #liste des valeurs des paramètres
nb_var=0 #nombre de variables déclarées dans le fichier
variables=GestionVariables(500,3)
index=0

variables.map_clear()
parametres.map_clear()
parametres.base(liste_parametres)
#ouverture du fichier contenant le code
fichier=raw_input("Fichier contenant votre code : ")
filin=open(fichier, 'r')

while index < len(fichier): #on cherche le '.' pour supprimer l'extension pour le nom de fichier final
	if fichier[index] == ".":
		nbpoint=index
	index=index+1
nom=fichier[0:nbpoint]	

#création du fichier de résultat gcode généré
filout=open(nom+'.gcode', 'w')

print "Fichier GCODE cree"

#Annotation du fichier GCODE
filout.write('; Generation GCODE par OpenASCAM - Adrien Grelet - 2013\n')

localtime = time.asctime(time.localtime(time.time()))
filout.write('; Generation fichier : '+localtime+'\n\n')		
#remplissage de la variable ligne pour lancer la boucle while
ligne = "init"

print "Debut de lecture des parametres"

while ligne != "stop": #première lecture pour stocker les parametres
	ligne = filin.readline()
	lignenette=''.join(ligne.split()) #nettoyage des espaces et tabulations de la ligne, pour vérifier si le premier char est un #, indiquant un commentaire.
	if "=" in ligne and not "#" in lignenette[0]: #si c'est une ligne de paramètres
		num=parametres.recherche(lignenette,liste_parametres,num)
	if "}" in ligne:
		ligne = "stop"

filout.write('\n')
	
#écriture des paramètres de base au début du gcode
instruction = Instructions()
instruction.startwrite(parametres)

ligne = filin.readline() #lecture de la ligne suivante pour que la condition du while ci dessous soit validée.
#}\r\n
while ligne != "stop": #lecture pour stocker les variables
	ligne = filin.readline()
	lignenette=''.join(ligne.split()) #nettoyage des espaces et tabulations de la ligne, pour vérifier si le premier char est un #, indiquant un commentaire.
	if "=" in ligne and not "#" in lignenette[0]: #si c'est une ligne de variables
		variables.stockage(lignenette)
	if "}" in ligne:
		ligne = "stop"
		
#ensuite il faut trier la liste variables par le nombre de caractères constituant l'entrée de façon décroissante.
variables.trier(nb_var)

while ligne != "": #lecture pour faire les instructions
	ligne = filin.readline()
	lignenette=''.join(ligne.split()) #nettoyage des espaces et tabulations de la ligne, pour vérifier si le premier char est un #, indiquant un commentaire.
	if "trou" in ligne and not "#" in lignenette[0]: #si c'est une instruction de perçage
		instruction.trou(lignenette,nb_var,parametres)
	if "rectangle" in ligne and not "#" in lignenette[0]: #si c'est une instruction de découpe de rectangle
		instruction.rectangle(lignenette,nb_var,parametres)
		
#######FIN DU FICHIER#######
filout.write('G1 Z40 \n')
filout.write('M140 S0 ; on arrête la fraise\n')
filout.write('G1 X5 Y5 F3000 ; on retourne au home mais on laisse le Z à sa dernière position\n') #sauf Z qui reste à la même hauteur
#fermeture des fichiers
filin.close()
filout.close()
