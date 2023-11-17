-- Nom des potions contenant l'ingrédient "poisson frais"

-- Sélection de la colonne 'nom_potion'
SELECT potion.nom_potion AS nom_potion

-- Tables utilisées dans la requête
FROM potion

-- Jointure entre la table 'potion' et la table 'composer' sur leur relation d'ID de potion
INNER JOIN composer ON potion.id_potion = composer.id_potion

-- Jointure entre la table 'composer' et la table 'ingredient' sur leur relation d'ID d'ingrédient
INNER JOIN ingredient ON composer.id_ingredient = ingredient.id_ingredient

-- Filtre pour obtenir les potions contenant l'ingrédient spécifique "poisson frais" (ID d'ingrédient = 24)
WHERE ingredient.id_ingredient = 24;
