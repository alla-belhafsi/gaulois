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