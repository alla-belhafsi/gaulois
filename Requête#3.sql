-- Requête 1: Sélectionne les informations sur les personnages, leurs adresses, les spécialités et les lieux, triés par nom du personnage

SELECT 
    personnage.nom_personnage AS nom_personnage, -- Sélectionne le nom du personnage depuis la table "personnage" en l'aliasant en "nom_personnage"
    specialite.nom_specialite, -- Sélectionne le nom de la spécialité depuis la table "specialite"
    personnage.adresse_personnage, -- Sélectionne l'adresse du personnage depuis la table "personnage"
    lieu.nom_lieu -- Sélectionne le nom du lieu depuis la table "lieu"
FROM 
    lieu
LEFT JOIN 
    personnage ON lieu.id_lieu = personnage.id_personnage -- Joindre la table "lieu" et "personnage" sur leur relation d'ID
LEFT JOIN 
    specialite ON lieu.id_lieu = specialite.id_specialite -- Joindre la table "lieu" et "specialite" sur leur relation d'ID
GROUP BY 
    personnage.nom_personnage, specialite.nom_specialite, personnage.adresse_personnage, lieu.nom_lieu -- Regroupement des résultats par nom du personnage, nom de spécialité, adresse du personnage et nom du lieu
ORDER BY 
    personnage.nom_personnage; -- Trie les résultats par nom du personnage

-- Requête 2: Sélectionne les informations sur les lieux, les adresses des personnages, les noms des personnages et les spécialités, triés par nom du lieu

SELECT 
    lieu.nom_lieu AS nom_lieu, -- Sélectionne le nom du lieu depuis la table "lieu" et l'aliasant en "nom_lieu"
    personnage.adresse_personnage, -- Sélectionne l'adresse du personnage depuis la table "personnage"
    personnage.nom_personnage, -- Sélectionne le nom du personnage depuis la table "personnage"
    specialite.nom_specialite -- Sélectionne le nom de la spécialité depuis la table "specialite"
FROM 
    lieu
LEFT JOIN 
    personnage ON lieu.id_lieu = personnage.id_personnage -- Joindre la table "lieu" et "personnage" sur leur relation d'ID
LEFT JOIN 
    specialite ON lieu.id_lieu = specialite.id_specialite -- Joindre la table "lieu" et "specialite" sur leur relation d'ID
GROUP BY 
    lieu.nom_lieu, personnage.adresse_personnage, personnage.nom_personnage, specialite.nom_specialite -- Regroupement des résultats par nom du lieu, adresse du personnage, nom du personnage et nom de la spécialité
ORDER BY 
    lieu.nom_lieu; -- Trie les résultats par nom du lieu
