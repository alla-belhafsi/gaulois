
-- QUESTION B --- Autorisez Bonemine à boire de la potion magique, elle est jalouse d'Iélosubmarine...

-- INSERT INTO est une commande SQL utilisée pour ajouter des données à une table.
INSERT INTO autoriser_boire (id_potion, id_personnage)

-- VALUES est utilisé avec INSERT INTO pour spécifier les valeurs à insérer dans la table.
VALUES (1, 12);

-- Si je souhaite modifier la potion de Bonemine en potion magique

-- L'instruction UPDATE modifie les enregistrements dans une table.
--UPDATE autoriser_boire

-- La clause SET dans une instruction UPDATE indique quelles colonnes doivent être mises à jour et avec quelles valeurs.
--SET id_potion = 13

-- Ici, elle met à jour la table autoriser_boire en changeant l'ID de la potion pour Bonemine, qui a un ID de personnage égal à 12.
--WHERE id_personnage = 12;