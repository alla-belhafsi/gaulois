--  QUESTION A --- Ajoutez le personnage suivant : Champdeblix, agriculteur (ID = 12), résidant à la ferme Hantassion de Rotomagus (ID = 6).

-- Cette commande ajoute un nouveau personnage à la table 'personnage'.

-- INSERT INTO est une commande SQL utilisée pour ajouter des données à une table.
INSERT INTO personnage (nom_personnage, adresse_personnage, id_lieu, id_specialite)

-- VALUES est utilisé avec INSERT INTO pour spécifier les valeurs à insérer dans la table.
VALUES ('Champdeblix', 'Hantassion', 6, 12);


------------------------------------------------------------------


-- QUESTION B --- Autorisez Bonemine à boire de la potion magique, elle est jalouse d'Iélosubmarine...

-- INSERT INTO est une commande SQL utilisée pour ajouter des données à une table.
INSERT INTO autoriser_boire (id_potion, id_personnage)

-- VALUES est utilisé avec INSERT INTO pour spécifier les valeurs à insérer dans la table.
VALUES (1, 12);


------------------------------------------------------------------


-- QUESTION C ---  Supprimez les casques grecs qui n'ont jamais été pris lors d'une bataille.

-- Supprime l'ensemble des casques grecs qui n'ont jamais été pris lors d'une bataille
DELETE FROM casque

-- Filtre pour obtenir les données des casques grecs
WHERE 

-- Si l'ID des casques correspondant à 'id_type_casque = 2' n'est pas inclus dans la table 'prendre_casque' alors ils n'ont jamais été pris lors d'une bataille
AND id_casque NOT IN (
    SELECT id_casque
    FROM prendre_casque
);


------------------------------------------------------------------


-- QUESTION D --- Modifiez l'adresse de Zérozérosix : il a été mis en prison à Condate.

-- L'instruction UPDATE modifie les enregistrements dans une table
UPDATE personnage

-- La clause SET dans une instruction UPDATE indique quelles colonnes doivent être mises à jour et avec quelles valeurs.
SET adresse_personnage = 'Prison', id_lieu = 9

-- Ici, elle met à jour la table personnage en changeant 'adresse_personnage' et l'ID du lieu pour Zérozérosix, qui à un ID de personnage égal à 9.
WHERE id_personnage = 23;


------------------------------------------------------------------


-- QUESTION E --- La potion 'Soupe' ne doit plus contenir de persil.

-- Supprime l'ingrédient persil de la potion 'Soupe'
DELETE FROM composer

-- Filtre qui sélectionne les casques grecs avec 'id_potion = 9' et 'id_ingredient = 19'
WHERE id_potion = 9
AND id_ingredient = 19;


------------------------------------------------------------------


-- QUESTION F ---  Obélix s'est trompé : ce sont 42 casques Weisenau, et non Ostrogoths, qu'il a pris lors de la bataille 'Attaque de la banque postale'. Corrigez son erreur !

-- L'instruction UPDATE modifie les enregistrements dans une table
UPDATE prendre_casque

-- La clause SET dans une instruction UPDATE indique quelles colonnes doivent être mises à jour et avec quelles valeurs.
SET qte = 42

-- Ici, elle met à jour la table prendre_casque en changeant 'qte'.
WHERE id_bataille = 9 AND id_personnage = 5;