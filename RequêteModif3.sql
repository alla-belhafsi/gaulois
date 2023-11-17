-- QUESTION C ---  Supprimez les casques grecs qui n'ont jamais été pris lors d'une bataille.

-- Supprime l'ensemble des casques grecs qui n'ont jamais été pris lors d'une bataille
DELETE FROM casque

-- Filtre pour obtenir les données des casques grecs qui n'ont jamais été pris lors d'une bataille
WHERE id_casque IN (
    SELECT id_casque
    FROM (

-- Cette partie récupère tous les casques ayant l'identifiant correspondant aux casques grecs
SELECT c.id_casque

-- Tables utilisées dans la requête
FROM casque c

-- Jointure avec la table 'type_casque' sur la relation d'ID
INNER JOIN type_casque tc ON c.id_type_casque = tc.id_type_casque

-- Filtre qui sélectionne les casques grecs avec "id_type_casque = 2"
WHERE tc.id_type_casque = 2 

-- Cette partie filtre les casques grecs qui ne sont pas présents dans la table des casques pris lors d'une bataille
AND c.id_casque NOT IN (
    SELECT pc.id_casque
    FROM prendre_casque pc
    INNER JOIN casque c2 ON pc.id_casque = c2.id_casque
    WHERE c2.id_type_casque = 2 
)
-- Regroupement des résultats par identifiant de casque
GROUP BY c.id_casque
) AS casques_grecs_non_pris -- Chaque table dérivée doit avoir son propre alias
);