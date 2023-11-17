-- QUESTION E --- La potion 'Soupe' ne doit plus contenir de persil.

-- Supprime l'ingrédient persil de la potion 'Soupe'
DELETE FROM composer

-- Filtre qui sélectionne les casques grecs avec 'id_potion = 9' et 'id_ingredient = 19'
WHERE id_potion = 9
AND id_ingredient = 19;