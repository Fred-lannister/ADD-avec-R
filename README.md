# Analyse en Composantes Principales (ACP) - Dataset Diabète
Description
Ce projet réalise une analyse en composantes principales sur un dataset de diabète pour identifier les principales dimensions de variation dans les données et comprendre les relations entre les variables.

## Structure du projet
├── diabetes.xlsx          # Dataset principal
├── acp_diabetes.R         # Script principal d'analyse
└── README.md             # Ce fichier
Prérequis
Logiciels requis

R (version 4.0 ou supérieure)
RStudio (recommandé)

Packages R nécessaires
rinstall.packages(c(
  "FactoMineR",
  "factoextra", 
  "ggplot2",
  "readxl",
  "Factoshiny",
  "corrplot"
))
Dataset
Le fichier diabetes.xlsx doit contenir :

8 variables quantitatives (caractéristiques médicales)
1 variable qualitative en position 9 (probablement le diagnostic)
Format Excel (.xlsx)

⚠️ Important : Modifiez le chemin du fichier dans le script :
rbase2 <- read_excel("VOTRE_CHEMIN/diabetes.xlsx")
Analyse réalisée
1. Exploration des données

Statistiques descriptives : Résumé statistique de toutes les variables
Histogrammes : Distribution de chaque variable quantitative
Box plots : Détection des valeurs aberrantes
Matrice de corrélation : Visualisation des relations entre variables avec heatmap

2. Analyse en Composantes Principales

ACP standardisée : Toutes les variables sont centrées-réduites
Variable supplémentaire : Variable qualitative en position 9
Choix des axes : Analyse des valeurs propres et pourcentages de variance

3. Visualisations produites

Graphique des valeurs propres (éboulis)
Qualité de représentation des variables (cos²)
Contributions des variables aux axes 1, 2 et 3
Cercle des corrélations
Graphique des individus
Biplot avec les 20 individus les mieux représentés

Utilisation

Cloner le repository
Installer les dépendances

# Exécuter la section d'installation des packages
source("acp_diabetes.R", echo=TRUE, max.deparse.length=10000, 
       keep.source=TRUE, local=TRUE, 
       print.eval=TRUE)[1:6] # Exécute seulement l'installation

Configurer le chemin des données
Modifier la ligne 10 du script avec votre chemin :

rbase2 <- read_excel("VOTRE_CHEMIN_VERS/diabetes.xlsx")

Exécuter l'analyse
# Exécuter tout le script
source("acp_diabetes.R")
Résultats attendus
Sorties graphiques

Histogrammes de distribution pour chaque variable
Box plots pour détecter les outliers
Heatmap de corrélation avec coefficients
Graphique d'éboulis des valeurs propres
Cercle des corrélations
Biplot ACP

Sorties numériques

Valeurs propres et pourcentages de variance expliquée
Coordonnées, contributions et cos² des variables
Coordonnées des individus sur les premiers axes

Interprétation
L'ACP permet de :

Réduire la dimensionnalité des données
Identifier les variables les plus importantes via leurs contributions
Détecter les groupes d'individus similaires
Visualiser les relations entre variables médicales
Comprendre la structure du dataset diabète

Problèmes courants
Erreurs possibles

Chemin de fichier incorrect : Vérifiez le chemin vers diabetes.xlsx
Packages manquants : Installez tous les packages requis
Format de données : Vérifiez que les colonnes sont bien numériques
Données manquantes : L'ACP utilise use = "complete.obs"

Notes techniques

Le script utilise scale.unit = TRUE pour standardiser les variables
La variable qualitative (colonne 9) est traitée comme supplémentaire
Les graphiques utilisent ggplot2 et corrplot pour la visualisation

Contribution
Pour contribuer à ce projet :

Fork le repository
Créez une branche pour votre fonctionnalité
Commitez vos changements
Ouvrez une Pull Request
[Spécifiez votre licence ici]
Contact
[Vos informations de contact]
