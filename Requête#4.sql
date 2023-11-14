-- Sélectionne les 'nom_specialite' et le count des 'id_specialite' par 'personnage'
SELECT specialite.nom_specialite, COUNT(personnage.id_specialite) AS nombre_de_personnage
FROM specialite

-- Jointure entre la table 'specialite' et la table 'personnage' sur leur relation d'ID
LEFT JOIN personnage ON specialite.id_specialite = personnage.id_specialite

-- Regroupement des résultats pour obtenir le count de 'personnage' pour chaque 'id_specialite'
GROUP BY specialite.nom_specialite

-- Tri par ordre décroissant en fonction du 'nombre_de_personnage' par 'id_specialite'
ORDER BY nombre_de_personnage DESC;
