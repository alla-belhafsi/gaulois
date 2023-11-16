-- Première Méthode permet d'afficher juste un seul personnage avec le plus grand nombre de casques pris en cas d'égalité avec un autre personnage dans la bataille 'Bataille du village gaulois'.

-- Nom du ou des personnages qui ont le plus de 'prendre_casques.qte' dans la bataille 'Bataille du village gaulois'.

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

-- Sélection des noms des personnages ayant pris le plus grand nombre de casques dans une bataille spécifique

SELECT personnage.nom_personnage AS nom_personnage, subquery.total_casques_pris AS total_casques_pris

-- Sous-requête pour obtenir le total de casques pris par le personnage ayant le plus grand nombre de casques dans la bataille spécifiée
FROM (
    SELECT SUM(p.qte) AS total_casques_pris, p.id_personnage
    FROM prendre_casque p
    INNER JOIN bataille b ON p.id_bataille = b.id_bataille
    WHERE b.id_bataille = 1 -- Filtre pour la bataille spécifique
    GROUP BY p.id_personnage
    ORDER BY total_casques_pris DESC
    LIMIT 1 -- Sélectionne le personnage avec le plus grand nombre de casques pris
) AS subquery

-- Jointures pour récupérer les détails des personnages ayant le même nombre maximal de casques pris dans cette bataille
INNER JOIN prendre_casque pc ON subquery.id_personnage = pc.id_personnage
INNER JOIN personnage ON pc.id_personnage = personnage.id_personnage
INNER JOIN bataille ON pc.id_bataille = bataille.id_bataille
WHERE bataille.id_bataille = 1 -- Filtre pour la bataille spécifique

-- Groupement pour afficher tous les personnages ayant le même nombre maximal de casques pris
GROUP BY personnage.id_personnage, personnage.nom_personnage, subquery.total_casques_pris
HAVING total_casques_pris = subquery.total_casques_pris;


