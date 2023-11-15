-- Nom des personnages qui n'ont jamais bu aucune potion (ID = 11, 12, 18, 21, 24, 25, 26, 27, 28, 29, 30, 31, 34, 37, 38, 40, 41, 43, 44, 45)


SELECT personnage.nom_personnage AS personnage_sans_boire

-- Tables utilisées dans la requête
FROM personnage

-- Jointure avec la table 'boire' pour vérifier les personnages ayant bu une potion
LEFT JOIN boire ON personnage.id_personnage = boire.id_personnage

-- Filtre pour sélectionner les personnages n'ayant pas bu de potion
WHERE boire.id_personnage IS NULL OR boire.dose_boire IS NULL

-- Groupement des résultats par ID et nom de personnage
GROUP BY personnage.id_personnage

-- Tri des résultats par ordre alphabétique
ORDER BY personnage_sans_boire ASC;