-- Nom du ou des personnages qui ont le plus de 'prendre_casques.qte' dans la bataille 'Bataille du village gaulois' dont le 'id_bataille' = 1.

-- Première Méthode permet d'afficher juste un seul personnage avec le plus grand nombre de casques pris en cas d'égalité avec un autre personnage dans la bataille 'Bataille du village gaulois'.

-- Sélection des colonnes 'nom_personnage', 'total_casques_pris'
SELECT personnage.nom_personnage AS nom_personnage, SUM(prendre_casque.qte) AS total_casques_pris

-- Tables utilisées dans la requête
FROM prendre_casque

-- Jointure avec la table 'personnage' sur la relation d'ID de personnage
INNER JOIN personnage ON prendre_casque.id_personnage = personnage.id_personnage

-- Jointure avec la table 'bataille' sur la relation d'ID de bataille
INNER JOIN bataille ON prendre_casque.id_bataille = bataille.id_bataille

-- Filtre pour obtenir les données de la bataille 'Bataille du village gaulois' (bataille.id_bataille = 1)
WHERE bataille.id_bataille = 1

-- Regroupement par personnage pour obtenir le total des casques pris par chaque personnage
GROUP BY personnage.id_personnage

-- Trier les résultats par ordre décroissant de quantité 'qte'
ORDER BY total_casques_pris DESC
LIMIT 1;

-- Seconde Méthode avec sous-requête permet d'afficher tout les personnages avec le plus grand nombre de casques pris, au lieu d'afficher juste un seul en cas d'égalité

-- Sélectionne le nom de la personne et le total de casques pris dont le 'id_bataille' = 1
SELECT p.nom_personnage AS nom_personnage, 
       SUM(pc.qte) AS total_casques_pris

-- Table utilisée dans la requête
FROM personnage p

-- Jointure entre les tables prendre_casque et personnage pour récupérer les données nécessaires
INNER JOIN prendre_casque pc ON p.id_personnage = pc.id_personnage

-- Jointure entre les tables bataille et prendre_casque pour récupérer les données nécessaires
INNER JOIN bataille b ON pc.id_bataille = b.id_bataille

-- Filtre pour une bataille spécifique
WHERE b.id_bataille = 1 

-- Groupement des résultats par l'identifiant de la bataille
GROUP BY p.id_personnage

HAVING SUM(pc.qte) >= ALL (
    
    -- Sélectionne le nom de la personne et le total de casques pris dont le 'id_bataille' = 1
    SELECT subquery.total_casques_pris
    FROM(
        -- Calcule le total de casques pris la id_bataille = 1
        SELECT SUM(pc2.qte) AS total_casques_pris
        -- Table utilisée dans la requête
        FROM prendre_casque pc2

        -- Jointure entre les tables
        INNER JOIN personnage p2 ON pc2.id_personnage = p2.id_personnage
        INNER JOIN bataille b2 ON pc2.id_bataille = b2.id_bataille
        -- Filtre pour la bataille spécifique
        WHERE b2.id_bataille = 1

        -- Groupement des résultats par l'identifiant de prendre_casque
        GROUP BY pc2.id_personnage
    ) AS subquery
);




