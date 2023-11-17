--  Nom du / des personnages qui n'ont pas le droit de boire de la potion 'Magique'.

-- Sélectionne les noms des personnages qui ne sont pas autorisés à boire une potion spécifique

-- Sélectionne le nom des personnages et les renomme comme "nom_personnage"
SELECT personnage.nom_personnage AS nom_personnage 

-- Utilise la table "personnage"
FROM personnage 

-- Filtre pour sélectionner les personnages qui n'ont pas le droit de boire de la potion 'Magique' dans une sous-requête
WHERE personnage.id_personnage NOT IN ( 

    -- Sous-requête pour obtenir les ID des personnages qui ont le droit de boire de la potion 'Magique'

    -- Sélectionne l'ID des personnages de la table "autoriser_boire"
    SELECT autoriser_boire.id_personnage 

    -- Utilise la table "autoriser_boire"
    FROM autoriser_boire 
    
    -- Jointure avec la table "potion" sur la relation d'ID de potion
    INNER JOIN potion ON autoriser_boire.id_potion = potion.id_potion 
    
    -- Filtre pour choisir la potion 'Magique'
    WHERE potion.id_potion = 1
)
-- Ordonne les résultats par ordre alphabétique des noms des personnages
ORDER BY personnage.nom_personnage; 
