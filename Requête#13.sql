-- Première Méthode permet d'afficher juste un seul lieu avec le plus grand nombre d'habitants en cas d'égalité avec un autre lieu

-- Nom du / des lieu(x) possédant le plus d'habitants, en dehors du village gaulois. (condate, lutèce)

-- Sélection du nom du/des lieu(x) avec le plus grand nombre d'habitants, en dehors du village gaulois
SELECT l.nom_lieu AS nom_lieu, COUNT(p.id_personnage) AS total_habitants

-- Tables utilisées dans la requête
FROM personnage p
INNER JOIN lieu l ON p.id_lieu = l.id_lieu

-- Filtre pour exclure le village gaulois (ID = 1)
WHERE l.id_lieu != 1

-- Groupement des résultats par ID et nom de lieu pour obtenir les totaux par lieu
GROUP BY l.id_lieu

-- Tri des résultats par ordre décroissant du nombre d'habitants pour afficher le lieu avec le plus grand nombre d'habitants en premier
ORDER BY COUNT(p.id_personnage) DESC;

-- Seconde Methode avec sous-requête permet d'afficher tout les lieux avec le plus grand nombre d'habitants, au lieu d'afficher juste un seul en cas d'égalité

-- Sélection du nom du/des lieu(x) avec le plus grand nombre d'habitants, en dehors du village gaulois

SELECT lieu.nom_lieu AS nom_lieu, COUNT(personnage.id_personnage) AS total_habitants

-- Tables utilisées dans la requête
FROM personnage
INNER JOIN lieu ON personnage.id_lieu = lieu.id_lieu

-- Filtre pour exclure le village gaulois (ID = 1)
WHERE lieu.id_lieu != 1

-- Groupement des résultats par ID de lieu pour obtenir les totaux par lieu
GROUP BY lieu.id_lieu

-- Sous-requête pour trouver le nombre maximal d'habitants parmi les lieux en dehors du village gaulois
HAVING COUNT(personnage.id_personnage) = (
    SELECT MAX(total_habitants)
    FROM (
        SELECT COUNT(personnage.id_personnage) AS total_habitants
        FROM personnage
        INNER JOIN lieu ON personnage.id_lieu = lieu.id_lieu
        WHERE lieu.id_lieu != 1
        GROUP BY lieu.id_lieu
    ) AS subquery
);
