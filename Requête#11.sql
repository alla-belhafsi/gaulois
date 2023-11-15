-- Combien existe-t-il de casques de chaque type et quel est leur coût total ? (classés par nombre décroissant)

-- Sélection du nom du type de casque, du nombre de casques de chaque type et leur coût total
SELECT 
    type_casque.nom_type_casque AS nom_type_casque, 
    COUNT(casque.id_type_casque) AS nb_casques, 
    SUM(casque.cout_casque) AS cout_total

-- Tables utilisées dans la requête
FROM casque

-- Jointure entre la table 'casque' et la table 'type_casque' sur leur relation d'ID de type de casque
INNER JOIN type_casque ON casque.id_type_casque = type_casque.id_type_casque

-- Groupement des résultats par 'type_casque.id_type_casque' et 'type_casque.nom_type_casque' pour obtenir les totaux par type de casque
GROUP BY type_casque.id_type_casque, type_casque.nom_type_casque

-- Tri des résultats par ordre décroissant du nombre de casques pour afficher les types de casques les plus fréquents en premier
ORDER BY nb_casques DESC;
