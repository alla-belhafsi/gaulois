-- Nom de la bataille où le nombre de casques pris a été le plus important.

-- Première Méthode permet d'afficher juste une seule bataille avec le plus grand nombre de casques pris en cas d'égalité avec une autre bataille.

-- Sélection du nom de la bataille et la somme des casques pris pour chaque bataille
SELECT 
    bataille.nom_bataille AS nom_bataille, 
    SUM(prendre_casque.qte) AS total_casques_pris

-- Tables utilisées dans la requête
FROM prendre_casque

-- Jointure entre la table 'prendre_casque' et la table 'bataille' sur leur relation d'ID de bataille
INNER JOIN bataille ON prendre_casque.id_bataille = bataille.id_bataille

-- Groupement des résultats par 'bataille.id_bataille' et 'bataille.nom_bataille' pour obtenir les totaux par bataille
GROUP BY bataille.id_bataille

-- Tri des résultats par ordre décroissant de 'total_casques_pris' pour identifier le plus grand nombre de casques pris
ORDER BY total_casques_pris DESC

-- Limite les résultats à un seul résultat, celui avec le plus grand nombre de casques pris
LIMIT 1;



-- Seconde méthode avec sous-requête permet d'afficher toutes les batailles avec le plus grand nombre de casques pris, au lieu d'afficher juste une seule en cas d'égalité

-- Sélectionne le nom de la bataille et le total de casques pris pour chaque bataille
SELECT b.nom_bataille AS nom_bataille, 
       SUM(pc.qte) AS total_casques_pris

-- Table utilisée dans la requête
FROM bataille b

-- Jointure entre les tables bataille et prendre_casque pour récupérer les données nécessaires
INNER JOIN prendre_casque pc ON b.id_bataille = pc.id_bataille

-- Groupement des résultats par l'identifiant de la bataille
GROUP BY b.id_bataille

-- Sous-requête pour ne conserver que les batailles ayant le total de casques pris supérieur ou égal
HAVING SUM(pc.qte) >= ALL (
    -- Sélectionne le maximum total de casques pris parmi toutes les batailles
    SELECT subquery.total_casques_pris
    FROM (
        -- Calcule le total de casques pris pour chaque bataille
        SELECT SUM(pc2.qte) AS total_casques_pris

        -- Table utilisée dans la requête
        FROM prendre_casque pc2
        -- Groupement par l'identifiant de la bataille
        GROUP BY pc2.id_bataille
        
    ) AS subquery
);