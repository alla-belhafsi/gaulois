-- Nom du ou des personnages qui ont le plus de 'prendre_casques.qte' dans la bataille 'Bataille du village gaulois'.

-- Sélection des colonnes 'nom_personnage', 'prendre_casque.qte'
SELECT personnage.nom_personnage AS nom_personnage, prendre_casque.qte

-- Tables utilisées dans la requête
FROM prendre_casque

-- Jointure avec la table 'personnage' sur la relation d'ID de personnage
INNER JOIN personnage ON prendre_casque.id_personnage = personnage.id_personnage

-- Jointure avec la table 'bataille' sur la relation d'ID de bataille
INNER JOIN bataille ON prendre_casque.id_bataille = bataille.id_bataille

-- Filtre pour obtenir les données de la bataille 'Bataille du village gaulois' (bataille.id_bataille = 1)
WHERE bataille.id_bataille = 1

-- Trier les résultats par ordre décroissant de quantité 'qte'
ORDER BY prendre_casque.qte DESC;