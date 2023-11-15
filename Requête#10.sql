-- Nom de la bataille où le nombre de casques pris a été le plus important.

-- Sélection du nom de la bataille et la somme des casques pris pour chaque bataille
SELECT 
    bataille.nom_bataille AS nom_bataille, 
    SUM(prendre_casque.qte) AS total_casques_pris

-- Tables utilisées dans la requête
FROM prendre_casque

-- Jointure entre la table 'prendre_casque' et la table 'bataille' sur leur relation d'ID de bataille
INNER JOIN bataille ON prendre_casque.id_bataille = bataille.id_bataille

-- Groupement des résultats par 'bataille.id_bataille' et 'bataille.nom_bataille' pour obtenir les totaux par bataille
GROUP BY bataille.id_bataille, bataille.nom_bataille

-- Tri des résultats par ordre décroissant de 'total_casques_pris' pour identifier le plus grand nombre de casques pris
ORDER BY total_casques_pris DESC

-- Limite les résultats à un seul résultat, celui avec le plus grand nombre de casques pris
LIMIT 1;

