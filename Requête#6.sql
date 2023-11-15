-- Nom des potions + coût de réalisation de la potion (trié par coût décroissant).

-- Pour chaque 'composer.id_potion' lier à 'composer.id_ingrédient' multiplié 'composer.qte' par 'ingredient.cout_ingredient'.
-- Donc 'cout_potion' est l'additionnement des résultats de '(composer.qte)*('ingredient.cout_ingredient)' pour chaque 'composer.id_potion' lier à 'composer.id_ingrédient'
-- La somme des coûts de chaque multiplication de lingrédient et sa quantité donne le coût total de chaque potion

SELECT potion.nom_potion, 
       SUM(composer.qte * ingredient.cout_ingredient) AS cout_potion
FROM composer
-- Jointure entre la table 'composer' et la table 'ingredient' sur leur relation d'ID d'ingrédient
INNER JOIN ingredient ON composer.id_ingredient = ingredient.id_ingredient
-- Jointure entre la table 'composer' et la table 'potion' sur leur relation d'ID d'ingrédient
INNER JOIN potion ON composer.id_potion = potion.id_potion
GROUP BY potion.nom_potion;

