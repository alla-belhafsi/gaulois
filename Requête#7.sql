--  Nom des ingrédients + coût + quantité de chaque ingrédient qui composent la potion 'Santé'
-- la potion 'Santé'(id9*78)+(id23*3)+(id25*1) id9 = 16.5, id23 = 30, id25 = 80

-- Sélection des colonnes 'nom_ingredient', 'cout_ingredient' et 'qte'
SELECT ingredient.nom_ingredient AS nom_ingredient, ingredient.cout_ingredient, composer.qte, (ingredient.cout_ingredient * composer.qte) AS cout_total

-- Tables utilisées dans la requête
FROM composer

-- Jointure entre la table 'composer' et la table 'ingredient' sur leur relation d'ID d'ingrédient
INNER JOIN ingredient ON composer.id_ingredient = ingredient.id_ingredient

-- Filtre pour obtenir les ingrédients associés à la potion 'Santé' (id_potion = 3)
WHERE composer.id_potion = 3

-- Trier les résultats par ordre décroissant de 'cout_ingredient'
ORDER BY cout_total DESC;