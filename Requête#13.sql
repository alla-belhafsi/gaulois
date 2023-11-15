-- Nom du / des lieu(x) possédant le plus d'habitants, en dehors du village gaulois. (condate, lutèce)

-- Sélection du nom du/des lieu(x) avec le plus grand nombre d'habitants, en dehors du village gaulois
SELECT lieu.nom_lieu AS nom_lieu, COUNT(personnage.id_personnage) AS total_habitants

-- Tables utilisées dans la requête
FROM personnage
INNER JOIN lieu ON personnage.id_lieu = lieu.id_lieu

-- Filtre pour exclure le village gaulois (ID = 1)
WHERE lieu.id_lieu != 1

-- Groupement des résultats par ID et nom de lieu pour obtenir les totaux par lieu
GROUP BY lieu.id_lieu, lieu.nom_lieu

-- Tri des résultats par ordre décroissant du nombre d'habitants pour afficher le lieu avec le plus grand nombre d'habitants en premier
ORDER BY COUNT(personnage.id_personnage) DESC;
