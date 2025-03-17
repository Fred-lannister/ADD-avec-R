#Installation des packages

install.packages("FactoMineR")
install.packages("factoextra")
install.packages("ggplot2")
library(FactoMineR)
library(factoextra)
library(readxl)
library(Factoshiny)
library(corrplot)

#Chargement des données
   
base2 <- read_excel("C:/Users/hp/Desktop/Py Forma/diabetes.xlsx")
View(base2)

##############################################################################
#Exploration des données

summary(base2)

#Histogramme pour chaque variable quantitative

for (variable in names(base2)) {
  if (is.numeric(base2[[variable]])) {
    print(ggplot(base2, aes(x = !!sym(variable))) + 
            geom_histogram(bins = 30, fill = "blue", color = "black") +
            theme_minimal() + 
            labs(title = paste("Histogramme de", variable), x = variable, y = "Fréquence"))
  }
}

#Box Plot pour chaque variable quantitative

for (var in names(base2)) {
  if (is.numeric(base2[[var]])) {
   print(ggplot(base2, aes_string(x = factor(1), y = var)) + 
           geom_boxplot(fill = "blue", color = "black") + 
           theme_minimal() + 
           labs(title = paste("BoxPlot de ", var), x = "", y = var))
  }
}

#Creation d'une heartmap de correlation avec les coeficients 

vars_quantitatives <- sapply(base2, is.numeric)
donnee_quanti <- base2[, vars_quantitatives]
matrice_correlation <- cor(donnee_quanti, use = "complete.obs")
corrplot(matrice_correlation, method = "color", type = 'upper', order = "hclust",
         tl.col = "black", tl.srt = 45, 
         addCoef.col = "black", #Couleur des coefficients
         cl.pos = "n", #Position de la légende de couleur
         cl.cex = 1,2, #Taille de la légende de couleur 
         addCoefasPercent = TRUE,
         number.cex = 0.8 )

#########################################################################

#Réalisation de l'ACP
base2.acp = PCA(base2, scale.unit = TRUE, graph = FALSE, quali.sup = 9)
base2.acp

summary(base2.acp, ncp = 2)

#Proprietés de l'ACP - (Choix des axes)

val.propres = round(base2.acp$eig[,1], 2)
val.propres

pourcentage_cumul_variance = round(base2.acp$eig[,3], 2)
pourcentage_cumul_variance

#Graphique des pourcentage d'inertie et de qualité de representation des variables
#(Utile pour reperer les variables bien représentées)

fviz_eig(base2.acp, addlabels = TRUE)
res <- get_pca_var(base2.acp)
corrplot(res$cos2) 

#Determiner les variables bien representés

fviz_contrib(base2.acp, choice = "var", axes = 1, top = 10)
fviz_contrib(base2.acp, choice = "var", axes = 2, top = 10)
fviz_contrib(base2.acp, choice = "var", axes = 3, top = 10)

#Correlation variable-facteur
print(base.acp$var$cor[,1:3], digits = 2)
#Contribution des variables et cos²
round(base.acp$var$cos2[,1:3],2)
round(base.acp$var$contrib[,1:3],2)
round(base.acp$var$contrib[,1:3],2)

#Cercle des correlations des variables actives
fviz_pca_var(base2.acp, col.var = "cos2", repel = TRUE, title = "Cercle des corrélations")

round(base2.acp$ind$coord[,1:2],2 )
plot(base2.acp, cex = 0.8, label = "none", invisible = "quali", title = "Graphique des individus")

#Graphic Biplot avec les 20 individus ayant les plus fortes representations

contrib_ind <- rowSums(base2.acp$ind$contrib)

# Trier et sélectionner les 20 individus avec les plus fortes contributions
top_ind <- order(contrib_ind, decreasing = TRUE)[1:20]
top_ind_names <- rownames(base2.acp$ind$coord)[top_ind]

# Générer le biplot avec uniquement ces individus
fviz_pca_biplot(base2.acp, 
                repel = TRUE, 
                col.var = "black", 
                col.ind = "green", 
                ggtheme = theme_minimal(),
                select.ind = list(name = top_ind_names))


















































