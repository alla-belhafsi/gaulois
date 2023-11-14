-- Sélectionne les 'nom_lieu' et count des 'id_personnage' par 'lieu'
SELECT lieu.nom_lieu, COUNT(personnage.id_personnage) AS nombre_de_personnage
FROM lieu

-- Joindre la table des 'lieu' et des 'personnage' sur leur relation d'ID
LEFT JOIN personnage ON lieu.id_lieu = personnage.id_lieu

-- Regroupement des résultats pour obtenir le count de 'personnage' pour chaque 'id_lieu'
GROUP BY lieu.nom_lieu

-- Tri par ordre décroissant en fonction du 'nombre_de_personnage' par 'id_lieu'
ORDER BY nombre_de_personnage DESC;  
