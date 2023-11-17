-- Nom des personnages et leur quantité de potion bue (en les classant du plus grand buveur au plus petit) 'total_doses_bues'

-- Sélection des colonnes 'nom_personnage' et la somme des doses bues 'total_doses_bues'
SELECT personnage.nom_personnage AS nom_personnage, SUM(boire.dose_boire) AS total_doses_bues

-- Tables utilisées dans la requête
FROM boire

-- Jointure entre la table 'boire' et la table 'personnage' sur leur relation d'ID de personnage
INNER JOIN personnage ON boire.id_personnage = personnage.id_personnage

-- Groupement des résultats par 'personnage.id_personnage' et 'personnage.nom_personnage' pour obtenir les totaux par personnage
GROUP BY personnage.id_personnage

-- Tri des résultats par ordre décroissant de 'total_doses_bues' pour classer du plus grand buveur au plus petit
ORDER BY total_doses_bues DESC;
